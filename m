Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDA63AE881
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFUL7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229789AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FBBC61245;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=11eW0KcqaEnwVcqSAzyPNAdsSG+zIv8WUhOkdsd8c6A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jmBWtdlwqBDKNAm0dTHfHk3uqCFK1ZsHbkjcsduKsXqVvOuPet+GLsoDYXPdjlrHI
         ck08bAldltzViQVZn+i1HyTKGKPchxS0WT6ipRn2IehNUswLZOyO91AbbVceEUlmkQ
         12I+mXI7BXnIcZEfIpSCni2VR8SXYy6OnyECYPvDvpgcM16IXowGfQ1YvNoaTGttbM
         5ttJwJzQyGLB+6U2ZBTy1aSWJ8GgtkamPMz6skmPi5S70ZwyO7UJAd2r0gomfwDWoE
         NdkTvEDKY2JqJfK5vXrUzDHlb2Bh1Jexz2V6/8nG839FdrFaxkHqcjWH3kfR83FSDD
         DXhKyvRindZfA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXr-000Hcs-0m; Mon, 21 Jun 2021 13:56:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/5] media: ivtv: prevent going past the hw arrays
Date:   Mon, 21 Jun 2021 13:56:48 +0200
Message-Id: <94334c02c246fad023ec04a02c43b708d853b0cc.1624276138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624276137.git.mchehab+huawei@kernel.org>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by smatch:

	drivers/media/pci/ivtv/ivtv-i2c.c:245 ivtv_i2c_register() error: buffer overflow 'hw_devicenames' 21 <= 31
	drivers/media/pci/ivtv/ivtv-i2c.c:266 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
	drivers/media/pci/ivtv/ivtv-i2c.c:269 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
	drivers/media/pci/ivtv/ivtv-i2c.c:275 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
	drivers/media/pci/ivtv/ivtv-i2c.c:280 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31
	drivers/media/pci/ivtv/ivtv-i2c.c:290 ivtv_i2c_register() error: buffer overflow 'hw_addrs' 21 <= 31

The logic at ivtv_i2c_register() could let buffer overflows at
hw_devicenames and hw_addrs arrays.

This won't happen in practice due to a carefully-contructed
logic, but it is not error-prune.

Change the logic in a way that will make clearer that the
I2C hardware flags will affect the size of those two
arrays, and add an explicit check to avoid buffer overflows.

While here, use the bit macro.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/ivtv/ivtv-cards.h | 68 ++++++++++++++++++++---------
 drivers/media/pci/ivtv/ivtv-i2c.c   | 16 ++++---
 2 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-cards.h b/drivers/media/pci/ivtv/ivtv-cards.h
index f3e2c5634962..494982e4165d 100644
--- a/drivers/media/pci/ivtv/ivtv-cards.h
+++ b/drivers/media/pci/ivtv/ivtv-cards.h
@@ -78,27 +78,53 @@
 #define IVTV_PCI_ID_SONY		0x104d
 
 /* hardware flags, no gaps allowed */
-#define IVTV_HW_CX25840			(1 << 0)
-#define IVTV_HW_SAA7115			(1 << 1)
-#define IVTV_HW_SAA7127			(1 << 2)
-#define IVTV_HW_MSP34XX			(1 << 3)
-#define IVTV_HW_TUNER			(1 << 4)
-#define IVTV_HW_WM8775			(1 << 5)
-#define IVTV_HW_CS53L32A		(1 << 6)
-#define IVTV_HW_TVEEPROM		(1 << 7)
-#define IVTV_HW_SAA7114			(1 << 8)
-#define IVTV_HW_UPD64031A		(1 << 9)
-#define IVTV_HW_UPD6408X		(1 << 10)
-#define IVTV_HW_SAA717X			(1 << 11)
-#define IVTV_HW_WM8739			(1 << 12)
-#define IVTV_HW_VP27SMPX		(1 << 13)
-#define IVTV_HW_M52790			(1 << 14)
-#define IVTV_HW_GPIO			(1 << 15)
-#define IVTV_HW_I2C_IR_RX_AVER		(1 << 16)
-#define IVTV_HW_I2C_IR_RX_HAUP_EXT	(1 << 17) /* External before internal */
-#define IVTV_HW_I2C_IR_RX_HAUP_INT	(1 << 18)
-#define IVTV_HW_Z8F0811_IR_HAUP		(1 << 19)
-#define IVTV_HW_I2C_IR_RX_ADAPTEC	(1 << 20)
+enum ivtv_hw_bits {
+	IVTV_HW_BIT_CX25840		= 0,
+	IVTV_HW_BIT_SAA7115		= 1,
+	IVTV_HW_BIT_SAA7127		= 2,
+	IVTV_HW_BIT_MSP34XX		= 3,
+	IVTV_HW_BIT_TUNER		= 4,
+	IVTV_HW_BIT_WM8775		= 5,
+	IVTV_HW_BIT_CS53L32A		= 6,
+	IVTV_HW_BIT_TVEEPROM		= 7,
+	IVTV_HW_BIT_SAA7114		= 8,
+	IVTV_HW_BIT_UPD64031A		= 9,
+	IVTV_HW_BIT_UPD6408X		= 10,
+	IVTV_HW_BIT_SAA717X		= 11,
+	IVTV_HW_BIT_WM8739		= 12,
+	IVTV_HW_BIT_VP27SMPX		= 13,
+	IVTV_HW_BIT_M52790		= 14,
+	IVTV_HW_BIT_GPIO		= 15,
+	IVTV_HW_BIT_I2C_IR_RX_AVER	= 16,
+	IVTV_HW_BIT_I2C_IR_RX_HAUP_EXT	= 17, /* External before internal */
+	IVTV_HW_BIT_I2C_IR_RX_HAUP_INT	= 18,
+	IVTV_HW_BIT_Z8F0811_IR_HAUP	= 19,
+	IVTV_HW_BIT_I2C_IR_RX_ADAPTEC	= 20,
+
+	IVTV_HW_MAX_BITS		= 21	/* Should be the last bit + 1 */
+};
+
+#define IVTV_HW_CX25840			BIT(IVTV_HW_BIT_CX25840)
+#define IVTV_HW_SAA7115			BIT(IVTV_HW_BIT_SAA7115)
+#define IVTV_HW_SAA7127			BIT(IVTV_HW_BIT_SAA7127)
+#define IVTV_HW_MSP34XX			BIT(IVTV_HW_BIT_MSP34XX)
+#define IVTV_HW_TUNER			BIT(IVTV_HW_BIT_TUNER)
+#define IVTV_HW_WM8775			BIT(IVTV_HW_BIT_WM8775)
+#define IVTV_HW_CS53L32A		BIT(IVTV_HW_BIT_CS53L32A)
+#define IVTV_HW_TVEEPROM		BIT(IVTV_HW_BIT_TVEEPROM)
+#define IVTV_HW_SAA7114			BIT(IVTV_HW_BIT_SAA7114)
+#define IVTV_HW_UPD64031A		BIT(IVTV_HW_BIT_UPD64031A)
+#define IVTV_HW_UPD6408X		BIT(IVTV_HW_BIT_UPD6408X)
+#define IVTV_HW_SAA717X			BIT(IVTV_HW_BIT_SAA717X)
+#define IVTV_HW_WM8739			BIT(IVTV_HW_BIT_WM8739)
+#define IVTV_HW_VP27SMPX		BIT(IVTV_HW_BIT_VP27SMPX)
+#define IVTV_HW_M52790			BIT(IVTV_HW_BIT_M52790)
+#define IVTV_HW_GPIO			BIT(IVTV_HW_BIT_GPIO)
+#define IVTV_HW_I2C_IR_RX_AVER		BIT(IVTV_HW_BIT_I2C_IR_RX_AVER)
+#define IVTV_HW_I2C_IR_RX_HAUP_EXT	BIT(IVTV_HW_BIT_I2C_IR_RX_HAUP_EXT)
+#define IVTV_HW_I2C_IR_RX_HAUP_INT	BIT(IVTV_HW_BIT_I2C_IR_RX_HAUP_INT)
+#define IVTV_HW_Z8F0811_IR_HAUP		BIT(IVTV_HW_BIT_Z8F0811_IR_HAUP)
+#define IVTV_HW_I2C_IR_RX_ADAPTEC	BIT(IVTV_HW_BIT_I2C_IR_RX_ADAPTEC)
 
 #define IVTV_HW_SAA711X   (IVTV_HW_SAA7115 | IVTV_HW_SAA7114)
 
diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index 982045c4eea8..c052c57c6dce 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -85,7 +85,7 @@
 #define IVTV_ADAPTEC_IR_ADDR		0x6b
 
 /* This array should match the IVTV_HW_ defines */
-static const u8 hw_addrs[] = {
+static const u8 hw_addrs[IVTV_HW_MAX_BITS] = {
 	IVTV_CX25840_I2C_ADDR,
 	IVTV_SAA7115_I2C_ADDR,
 	IVTV_SAA7127_I2C_ADDR,
@@ -110,7 +110,7 @@ static const u8 hw_addrs[] = {
 };
 
 /* This array should match the IVTV_HW_ defines */
-static const char * const hw_devicenames[] = {
+static const char * const hw_devicenames[IVTV_HW_MAX_BITS] = {
 	"cx25840",
 	"saa7115",
 	"saa7127_auto",	/* saa7127 or saa7129 */
@@ -240,10 +240,16 @@ void ivtv_i2c_new_ir_legacy(struct ivtv *itv)
 
 int ivtv_i2c_register(struct ivtv *itv, unsigned idx)
 {
-	struct v4l2_subdev *sd;
 	struct i2c_adapter *adap = &itv->i2c_adap;
-	const char *type = hw_devicenames[idx];
-	u32 hw = 1 << idx;
+	struct v4l2_subdev *sd;
+	const char *type;
+	u32 hw;
+
+	if (idx >= IVTV_HW_MAX_BITS)
+		return -ENODEV;
+
+	type = hw_devicenames[idx];
+	hw = 1 << idx;
 
 	if (hw == IVTV_HW_TUNER) {
 		/* special tuner handling */
-- 
2.31.1

