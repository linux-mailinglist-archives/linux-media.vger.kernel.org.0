Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D32EAC11
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfJaJCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:02:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:35650 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726864AbfJaJCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:02:34 -0400
X-UUID: 868b7565865d4e858ca4a68dbc2f3e0c-20191031
X-UUID: 868b7565865d4e858ca4a68dbc2f3e0c-20191031
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 376141168; Thu, 31 Oct 2019 17:02:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 17:02:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 31 Oct 2019 17:02:22 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V3, 2/2] media: i2c: ov8856: Add support for more sensor modes
Date:   Thu, 31 Oct 2019 17:02:13 +0800
Message-ID: <20191031090213.27727-3-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20191031090213.27727-1-dongchun.zhu@mediatek.com>
References: <20191031090213.27727-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds two more sensor modes for Omnivision ov8856 image sensor,
including the resolution of 1632*1224 and 3264*2448, both with the
Bayer Order of BGGR.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 drivers/media/i2c/ov8856.c | 661 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 652 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8655842..4815c26 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -3,10 +3,13 @@
 
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -18,10 +21,15 @@
 #define OV8856_LINK_FREQ_360MHZ		360000000ULL
 #define OV8856_LINK_FREQ_180MHZ		180000000ULL
 #define OV8856_SCLK			144000000ULL
-#define OV8856_MCLK			19200000
+#define OV8856_XVCLK_19_2		19200000
+#define OV8856_XVCLK_24			24000000
 #define OV8856_DATA_LANES		4
 #define OV8856_RGB_DEPTH		10
 
+#define REG_X_ADDR_START		0x3808
+#define X_OUTPUT_FULL_SIZE		0x0cc0
+#define X_OUTPUT_BINNING_SIZE		0x0660
+
 #define OV8856_REG_CHIP_ID		0x300a
 #define OV8856_CHIP_ID			0x00885a
 
@@ -29,6 +37,22 @@
 #define OV8856_MODE_STANDBY		0x00
 #define OV8856_MODE_STREAMING		0x01
 
+/* define 1B module revision */
+#define OV8856_1B_MODULE		0x02
+
+/* the OTP read-out buffer is at 0x7000 and 0xf is the offset
+ * of the byte in the OTP that means the module revision
+ */
+#define OV8856_MODULE_REVISION		0x700f
+#define OV8856_OTP_MODE_CTRL		0x3d84
+#define OV8856_OTP_LOAD_CTRL		0x3d81
+#define OV8856_OTP_MODE_AUTO		0x00
+#define OV8856_OTP_LOAD_CTRL_ENABLE	BIT(0)
+
+/* Analog control register that decided by module revision */
+#define OV8856_ANAL_MODE_CTRL		0x3614
+#define OV8856_ANAL_1B_VAL		0x20
+
 /* vertical-timings from sensor */
 #define OV8856_REG_VTS			0x380e
 #define OV8856_VTS_MAX			0x7fff
@@ -64,6 +88,14 @@
 
 #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
 
+static const char * const ov8856_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
+#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)
+
 enum {
 	OV8856_LINK_FREQ_720MBPS,
 	OV8856_LINK_FREQ_360MBPS,
@@ -316,6 +348,209 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
 	{0x5e00, 0x00}
 };
 
+static const struct ov8856_reg mode_3264x2448_regs[] = {
+	{0x0103, 0x01},
+	{0x0302, 0x3c},
+	{0x0303, 0x01},
+	{0x031e, 0x0c},
+	{0x3000, 0x20},
+	{0x3003, 0x08},
+	{0x300e, 0x20},
+	{0x3010, 0x00},
+	{0x3015, 0x84},
+	{0x3018, 0x72},
+	{0x3021, 0x23},
+	{0x3033, 0x24},
+	{0x3500, 0x00},
+	{0x3501, 0x9a},
+	{0x3502, 0x20},
+	{0x3503, 0x08},
+	{0x3505, 0x83},
+	{0x3508, 0x01},
+	{0x3509, 0x80},
+	{0x350c, 0x00},
+	{0x350d, 0x80},
+	{0x350e, 0x04},
+	{0x350f, 0x00},
+	{0x3510, 0x00},
+	{0x3511, 0x02},
+	{0x3512, 0x00},
+	{0x3600, 0x72},
+	{0x3601, 0x40},
+	{0x3602, 0x30},
+	{0x3610, 0xc5},
+	{0x3611, 0x58},
+	{0x3612, 0x5c},
+	{0x3613, 0xca},
+	{0x3614, 0x60},
+	{0x3628, 0xff},
+	{0x3629, 0xff},
+	{0x362a, 0xff},
+	{0x3633, 0x10},
+	{0x3634, 0x10},
+	{0x3635, 0x10},
+	{0x3636, 0x10},
+	{0x3663, 0x08},
+	{0x3669, 0x34},
+	{0x366d, 0x00},
+	{0x366e, 0x10},
+	{0x3706, 0x86},
+	{0x370b, 0x7e},
+	{0x3714, 0x23},
+	{0x3730, 0x12},
+	{0x3733, 0x10},
+	{0x3764, 0x00},
+	{0x3765, 0x00},
+	{0x3769, 0x62},
+	{0x376a, 0x2a},
+	{0x376b, 0x30},
+	{0x3780, 0x00},
+	{0x3781, 0x24},
+	{0x3782, 0x00},
+	{0x3783, 0x23},
+	{0x3798, 0x2f},
+	{0x37a1, 0x60},
+	{0x37a8, 0x6a},
+	{0x37ab, 0x3f},
+	{0x37c2, 0x04},
+	{0x37c3, 0xf1},
+	{0x37c9, 0x80},
+	{0x37cb, 0x16},
+	{0x37cc, 0x16},
+	{0x37cd, 0x16},
+	{0x37ce, 0x16},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x0c},
+	{0x3804, 0x0c},
+	{0x3805, 0xdf},
+	{0x3806, 0x09},
+	{0x3807, 0xa3},
+	{0x3808, 0x0c},
+	{0x3809, 0xc0},
+	{0x380a, 0x09},
+	{0x380b, 0x90},
+	{0x380c, 0x07},
+	{0x380d, 0x8c},
+	{0x380e, 0x09},
+	{0x380f, 0xb2},
+	{0x3810, 0x00},
+	{0x3811, 0x04},
+	{0x3812, 0x00},
+	{0x3813, 0x02},
+	{0x3814, 0x01},
+	{0x3815, 0x01},
+	{0x3816, 0x00},
+	{0x3817, 0x00},
+	{0x3818, 0x00},
+	{0x3819, 0x10},
+	{0x3820, 0x80},
+	{0x3821, 0x46},
+	{0x382a, 0x01},
+	{0x382b, 0x01},
+	{0x3830, 0x06},
+	{0x3836, 0x02},
+	{0x3862, 0x04},
+	{0x3863, 0x08},
+	{0x3cc0, 0x33},
+	{0x3d85, 0x17},
+	{0x3d8c, 0x73},
+	{0x3d8d, 0xde},
+	{0x4001, 0xe0},
+	{0x4003, 0x40},
+	{0x4008, 0x00},
+	{0x4009, 0x0b},
+	{0x400a, 0x00},
+	{0x400b, 0x84},
+	{0x400f, 0x80},
+	{0x4010, 0xf0},
+	{0x4011, 0xff},
+	{0x4012, 0x02},
+	{0x4013, 0x01},
+	{0x4014, 0x01},
+	{0x4015, 0x01},
+	{0x4042, 0x00},
+	{0x4043, 0x80},
+	{0x4044, 0x00},
+	{0x4045, 0x80},
+	{0x4046, 0x00},
+	{0x4047, 0x80},
+	{0x4048, 0x00},
+	{0x4049, 0x80},
+	{0x4041, 0x03},
+	{0x404c, 0x20},
+	{0x404d, 0x00},
+	{0x404e, 0x20},
+	{0x4203, 0x80},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4502, 0x50},
+	{0x4503, 0x08},
+	{0x4601, 0x80},
+	{0x4800, 0x44},
+	{0x4816, 0x53},
+	{0x481b, 0x50},
+	{0x481f, 0x27},
+	{0x4823, 0x3c},
+	{0x482b, 0x00},
+	{0x4831, 0x66},
+	{0x4837, 0x16},
+	{0x483c, 0x0f},
+	{0x484b, 0x05},
+	{0x5000, 0x77},
+	{0x5001, 0x0a},
+	{0x5003, 0xc8},
+	{0x5004, 0x04},
+	{0x5006, 0x00},
+	{0x5007, 0x00},
+	{0x502e, 0x03},
+	{0x5030, 0x41},
+	{0x5780, 0x14},
+	{0x5781, 0x0f},
+	{0x5782, 0x44},
+	{0x5783, 0x02},
+	{0x5784, 0x01},
+	{0x5785, 0x01},
+	{0x5786, 0x00},
+	{0x5787, 0x04},
+	{0x5788, 0x02},
+	{0x5789, 0x0f},
+	{0x578a, 0xfd},
+	{0x578b, 0xf5},
+	{0x578c, 0xf5},
+	{0x578d, 0x03},
+	{0x578e, 0x08},
+	{0x578f, 0x0c},
+	{0x5790, 0x08},
+	{0x5791, 0x04},
+	{0x5792, 0x00},
+	{0x5793, 0x52},
+	{0x5794, 0xa3},
+	{0x5795, 0x02},
+	{0x5796, 0x20},
+	{0x5797, 0x20},
+	{0x5798, 0xd5},
+	{0x5799, 0xd5},
+	{0x579a, 0x00},
+	{0x579b, 0x50},
+	{0x579c, 0x00},
+	{0x579d, 0x2c},
+	{0x579e, 0x0c},
+	{0x579f, 0x40},
+	{0x57a0, 0x09},
+	{0x57a1, 0x40},
+	{0x59f8, 0x3d},
+	{0x5a08, 0x02},
+	{0x5b00, 0x02},
+	{0x5b01, 0x10},
+	{0x5b02, 0x03},
+	{0x5b03, 0xcf},
+	{0x5b05, 0x6c},
+	{0x5e00, 0x00},
+	{0x5e10, 0xfc}
+};
+
 static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x3000, 0x20},
 	{0x3003, 0x08},
@@ -506,6 +741,209 @@ static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x5e00, 0x00}
 };
 
+static const struct ov8856_reg mode_1632x1224_regs[] = {
+	{0x0103, 0x01},
+	{0x0302, 0x3c},
+	{0x0303, 0x01},
+	{0x031e, 0x0c},
+	{0x3000, 0x20},
+	{0x3003, 0x08},
+	{0x300e, 0x20},
+	{0x3010, 0x00},
+	{0x3015, 0x84},
+	{0x3018, 0x72},
+	{0x3021, 0x23},
+	{0x3033, 0x24},
+	{0x3500, 0x00},
+	{0x3501, 0x4c},
+	{0x3502, 0xe0},
+	{0x3503, 0x08},
+	{0x3505, 0x83},
+	{0x3508, 0x01},
+	{0x3509, 0x80},
+	{0x350c, 0x00},
+	{0x350d, 0x80},
+	{0x350e, 0x04},
+	{0x350f, 0x00},
+	{0x3510, 0x00},
+	{0x3511, 0x02},
+	{0x3512, 0x00},
+	{0x3600, 0x72},
+	{0x3601, 0x40},
+	{0x3602, 0x30},
+	{0x3610, 0xc5},
+	{0x3611, 0x58},
+	{0x3612, 0x5c},
+	{0x3613, 0xca},
+	{0x3614, 0x60},
+	{0x3628, 0xff},
+	{0x3629, 0xff},
+	{0x362a, 0xff},
+	{0x3633, 0x10},
+	{0x3634, 0x10},
+	{0x3635, 0x10},
+	{0x3636, 0x10},
+	{0x3663, 0x08},
+	{0x3669, 0x34},
+	{0x366d, 0x00},
+	{0x366e, 0x08},
+	{0x3706, 0x86},
+	{0x370b, 0x7e},
+	{0x3714, 0x27},
+	{0x3730, 0x12},
+	{0x3733, 0x10},
+	{0x3764, 0x00},
+	{0x3765, 0x00},
+	{0x3769, 0x62},
+	{0x376a, 0x2a},
+	{0x376b, 0x30},
+	{0x3780, 0x00},
+	{0x3781, 0x24},
+	{0x3782, 0x00},
+	{0x3783, 0x23},
+	{0x3798, 0x2f},
+	{0x37a1, 0x60},
+	{0x37a8, 0x6a},
+	{0x37ab, 0x3f},
+	{0x37c2, 0x14},
+	{0x37c3, 0xf1},
+	{0x37c9, 0x80},
+	{0x37cb, 0x16},
+	{0x37cc, 0x16},
+	{0x37cd, 0x16},
+	{0x37ce, 0x16},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x0c},
+	{0x3804, 0x0c},
+	{0x3805, 0xdf},
+	{0x3806, 0x09},
+	{0x3807, 0xa3},
+	{0x3808, 0x06},
+	{0x3809, 0x60},
+	{0x380a, 0x04},
+	{0x380b, 0xc8},
+	{0x380c, 0x07},
+	{0x380d, 0x8c},
+	{0x380e, 0x09},
+	{0x380f, 0xb2},
+	{0x3810, 0x00},
+	{0x3811, 0x02},
+	{0x3812, 0x00},
+	{0x3813, 0x02},
+	{0x3814, 0x03},
+	{0x3815, 0x01},
+	{0x3816, 0x00},
+	{0x3817, 0x00},
+	{0x3818, 0x00},
+	{0x3819, 0x10},
+	{0x3820, 0x80},
+	{0x3821, 0x47},
+	{0x382a, 0x03},
+	{0x382b, 0x01},
+	{0x3830, 0x06},
+	{0x3836, 0x02},
+	{0x3862, 0x04},
+	{0x3863, 0x08},
+	{0x3cc0, 0x33},
+	{0x3d85, 0x17},
+	{0x3d8c, 0x73},
+	{0x3d8d, 0xde},
+	{0x4001, 0xe0},
+	{0x4003, 0x40},
+	{0x4008, 0x00},
+	{0x4009, 0x05},
+	{0x400a, 0x00},
+	{0x400b, 0x84},
+	{0x400f, 0x80},
+	{0x4010, 0xf0},
+	{0x4011, 0xff},
+	{0x4012, 0x02},
+	{0x4013, 0x01},
+	{0x4014, 0x01},
+	{0x4015, 0x01},
+	{0x4042, 0x00},
+	{0x4043, 0x80},
+	{0x4044, 0x00},
+	{0x4045, 0x80},
+	{0x4046, 0x00},
+	{0x4047, 0x80},
+	{0x4048, 0x00},
+	{0x4049, 0x80},
+	{0x4041, 0x03},
+	{0x404c, 0x20},
+	{0x404d, 0x00},
+	{0x404e, 0x20},
+	{0x4203, 0x80},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4502, 0x50},
+	{0x4503, 0x08},
+	{0x4601, 0x80},
+	{0x4800, 0x44},
+	{0x4816, 0x53},
+	{0x481b, 0x50},
+	{0x481f, 0x27},
+	{0x4823, 0x3c},
+	{0x482b, 0x00},
+	{0x4831, 0x66},
+	{0x4837, 0x16},
+	{0x483c, 0x0f},
+	{0x484b, 0x05},
+	{0x5000, 0x77},
+	{0x5001, 0x0a},
+	{0x5003, 0xc8},
+	{0x5004, 0x04},
+	{0x5006, 0x00},
+	{0x5007, 0x00},
+	{0x502e, 0x03},
+	{0x5030, 0x41},
+	{0x5795, 0x00},
+	{0x5796, 0x10},
+	{0x5797, 0x10},
+	{0x5798, 0x73},
+	{0x5799, 0x73},
+	{0x579a, 0x00},
+	{0x579b, 0x28},
+	{0x579c, 0x00},
+	{0x579d, 0x16},
+	{0x579e, 0x06},
+	{0x579f, 0x20},
+	{0x57a0, 0x04},
+	{0x57a1, 0xa0},
+	{0x5780, 0x14},
+	{0x5781, 0x0f},
+	{0x5782, 0x44},
+	{0x5783, 0x02},
+	{0x5784, 0x01},
+	{0x5785, 0x01},
+	{0x5786, 0x00},
+	{0x5787, 0x04},
+	{0x5788, 0x02},
+	{0x5789, 0x0f},
+	{0x578a, 0xfd},
+	{0x578b, 0xf5},
+	{0x578c, 0xf5},
+	{0x578d, 0x03},
+	{0x578e, 0x08},
+	{0x578f, 0x0c},
+	{0x5790, 0x08},
+	{0x5791, 0x04},
+	{0x5792, 0x00},
+	{0x5793, 0x52},
+	{0x5794, 0xa3},
+	{0x59f8, 0x3d},
+	{0x5a08, 0x02},
+	{0x5b00, 0x02},
+	{0x5b01, 0x10},
+	{0x5b02, 0x03},
+	{0x5b03, 0xcf},
+	{0x5b05, 0x6c},
+	{0x5e00, 0x00},
+	{0x5e10, 0xfc}
+};
+
 static const char * const ov8856_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Color Bar",
@@ -548,6 +986,18 @@ static const struct ov8856_mode supported_modes[] = {
 		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
 	},
 	{
+		.width    = 3264,
+		.height   = 2448,
+		.hts      = 1932,
+		.vts_def  = 2482,
+		.vts_min  = 2482,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
+			.regs = mode_3264x2448_regs,
+		},
+		.link_freq_index = OV8856_LINK_FREQ_720MBPS,
+	},
+	{
 		.width = 1640,
 		.height = 1232,
 		.hts = 3820,
@@ -558,6 +1008,18 @@ static const struct ov8856_mode supported_modes[] = {
 			.regs = mode_1640x1232_regs,
 		},
 		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
+	},
+	{
+		.width    = 1632,
+		.height   = 1224,
+		.hts      = 1932,
+		.vts_def  = 2482,
+		.vts_min  = 2482,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1632x1224_regs),
+			.regs = mode_1632x1224_regs,
+		},
+		.link_freq_index = OV8856_LINK_FREQ_360MBPS,
 	}
 };
 
@@ -566,16 +1028,28 @@ struct ov8856 {
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
 
+	struct clk		*xvclk;
+	struct gpio_desc	*n_shutdn_gpio;
+	struct regulator_bulk_data supplies[OV8856_NUM_SUPPLIES];
+
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_mbus_framefmt	fmt;
 
 	/* Current mode */
 	const struct ov8856_mode *cur_mode;
 
+	/* module hardware version that can be read out from register 0x700f
+	 * the register value corresponds to different hardware version
+	 * 01: 2A module revision
+	 * 02: 1B module revision
+	 */
+	bool is_1B_revision;
+
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
@@ -696,6 +1170,25 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
 				OV8856_REG_VALUE_08BIT, pattern);
 }
 
+static int ov8856_check_revision(struct ov8856 *ov8856)
+{
+	int ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret)
+		return ret;
+
+	return ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+				OV8856_REG_VALUE_08BIT,
+				OV8856_OTP_LOAD_CTRL_ENABLE);
+}
+
 static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8856 *ov8856 = container_of(ctrl->handler,
@@ -825,7 +1318,6 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -834,6 +1326,7 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	const struct ov8856_reg_list *reg_list;
 	int link_freq_index, ret;
+	u32 cur_h_size;
 
 	link_freq_index = ov8856->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
@@ -850,6 +1343,28 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
 		return ret;
 	}
 
+	/* Update R3614 if the revision is 1B module */
+	if (ov8856->is_1B_revision) {
+		ret = ov8856_write_reg(ov8856, OV8856_ANAL_MODE_CTRL,
+				       OV8856_REG_VALUE_08BIT,
+				       OV8856_ANAL_1B_VAL);
+		if (ret) {
+			dev_err(&client->dev, "failed to set R3614");
+			return ret;
+		}
+	}
+
+	ret = ov8856_read_reg(ov8856, REG_X_ADDR_START,
+			      OV8856_REG_VALUE_16BIT, &cur_h_size);
+	if (ret) {
+		dev_err(&client->dev, "failed to read out R3614");
+		return ret;
+	}
+
+	if (cur_h_size == X_OUTPUT_FULL_SIZE ||
+	    cur_h_size == X_OUTPUT_BINNING_SIZE)
+		ov8856->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
 	ret = __v4l2_ctrl_handler_setup(ov8856->sd.ctrl_handler);
 	if (ret)
 		return ret;
@@ -908,6 +1423,44 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int __ov8856_power_on(struct ov8856 *ov8856)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov8856->xvclk);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to enable xvclk\n");
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
+
+	ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to enable regulators\n");
+		goto disable_clk;
+	}
+
+	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
+
+	usleep_range(1500, 1800);
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(ov8856->xvclk);
+
+	return ret;
+}
+
+static void __ov8856_power_off(struct ov8856 *ov8856)
+{
+	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
+	regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
+	clk_disable_unprepare(ov8856->xvclk);
+}
+
 static int __maybe_unused ov8856_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -951,6 +1504,7 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 	const struct ov8856_mode *mode;
 	s32 vblank_def, h_blank;
 
@@ -960,7 +1514,9 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 				      fmt->format.height);
 
 	mutex_lock(&ov8856->mutex);
-	ov8856_update_pad_format(mode, &fmt->format);
+	mbus_fmt->code = ov8856->fmt.code;
+	ov8856_update_pad_format(mode, mbus_fmt);
+	ov8856->fmt = fmt->format;
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
 	} else {
@@ -992,13 +1548,17 @@ static int ov8856_get_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *fmt)
 {
 	struct ov8856 *ov8856 = to_ov8856(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
 
 	mutex_lock(&ov8856->mutex);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		fmt->format = *v4l2_subdev_get_try_format(&ov8856->sd, cfg,
 							  fmt->pad);
-	else
-		ov8856_update_pad_format(ov8856->cur_mode, &fmt->format);
+	} else {
+		fmt->format = ov8856->fmt;
+		ov8856_update_pad_format(ov8856->cur_mode, mbus_fmt);
+		mbus_fmt->code = ov8856->fmt.code;
+	}
 
 	mutex_unlock(&ov8856->mutex);
 
@@ -1009,11 +1569,12 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	/* Only one bayer order GRBG is supported */
+	struct ov8856 *ov8856 = to_ov8856(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = ov8856->fmt.code;
 
 	return 0;
 }
@@ -1089,6 +1650,20 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	/* check sensor hardware revision */
+	ret = ov8856_check_revision(ov8856);
+	if (ret) {
+		dev_err(&client->dev, "failed to check sensor revision");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ov8856->is_1B_revision = val == OV8856_1B_MODULE;
+
 	return 0;
 }
 
@@ -1110,7 +1685,7 @@ static int ov8856_check_hwcfg(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (mclk != OV8856_MCLK) {
+	if (mclk != OV8856_XVCLK_19_2) {
 		dev_err(dev, "external clock %d is not supported", mclk);
 		return -EINVAL;
 	}
@@ -1167,6 +1742,9 @@ static int ov8856_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		__ov8856_power_off(ov8856);
+	pm_runtime_set_suspended(&client->dev);
 	mutex_destroy(&ov8856->mutex);
 
 	return 0;
@@ -1175,6 +1753,7 @@ static int ov8856_remove(struct i2c_client *client)
 static int ov8856_probe(struct i2c_client *client)
 {
 	struct ov8856 *ov8856;
+	unsigned int i;
 	int ret;
 
 	ret = ov8856_check_hwcfg(&client->dev);
@@ -1189,6 +1768,42 @@ static int ov8856_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
+	ov8856->fmt.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
+	if (IS_ERR(ov8856->xvclk)) {
+		dev_err(&client->dev, "failed to get xvclk\n");
+		return -EINVAL;
+	}
+
+	ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
+		return ret;
+	}
+	if (clk_get_rate(ov8856->xvclk) != OV8856_XVCLK_24)
+		dev_warn(&client->dev,
+			 "xvclk mismatched, modes are based on 24MHz\n");
+
+	ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(ov8856->n_shutdn_gpio)) {
+		dev_err(&client->dev, "failed to get reset-gpios\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < OV8856_NUM_SUPPLIES; i++)
+		ov8856->supplies[i].supply = ov8856_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev, OV8856_NUM_SUPPLIES,
+				      ov8856->supplies);
+	if (ret)
+		dev_warn(&client->dev, "failed to get regulators\n");
+
+	ret = __ov8856_power_on(ov8856);
+	if (ret)
+		dev_warn(&client->dev, "failed to power on\n");
+
 	ret = ov8856_identify_module(ov8856);
 	if (ret) {
 		dev_err(&client->dev, "failed to find sensor: %d", ret);
@@ -1241,8 +1856,29 @@ static int ov8856_probe(struct i2c_client *client)
 	return ret;
 }
 
+static int __maybe_unused ov8856_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov8856 *ov8856 = to_ov8856(sd);
+
+	return __ov8856_power_on(ov8856);
+}
+
+static int __maybe_unused ov8856_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov8856 *ov8856 = to_ov8856(sd);
+
+	__ov8856_power_off(ov8856);
+
+	return 0;
+}
+
 static const struct dev_pm_ops ov8856_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov8856_suspend, ov8856_resume)
+	SET_RUNTIME_PM_OPS(ov8856_runtime_suspend, ov8856_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_ACPI
@@ -1254,11 +1890,18 @@ static const struct acpi_device_id ov8856_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
 #endif
 
+static const struct of_device_id ov8856_of_match[] = {
+	{ .compatible = "ovti,ov8856" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ov8856_of_match);
+
 static struct i2c_driver ov8856_i2c_driver = {
 	.driver = {
 		.name = "ov8856",
 		.pm = &ov8856_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov8856_acpi_ids),
+		.of_match_table = ov8856_of_match,
 	},
 	.probe_new = ov8856_probe,
 	.remove = ov8856_remove,
-- 
2.9.2

