Return-Path: <linux-media+bounces-57640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DskC2SSymma+AUAu9opvQ
	(envelope-from <linux-media+bounces-57640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:10:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A435D826
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 058E5304E708
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C03016E9;
	Mon, 30 Mar 2026 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxdLi4wy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C52356BE
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881917; cv=none; b=iYzGl5MHI+ncqgkxL3JrFBsA3kw9+kbgeS6r0JoKfOWZdtzUB2PYp8LzT/9VH7SJ60wJT7Zy1eLNyYs1U6B6VOJ4vQGmfnByPRvCHCcwPBwMnC3e77yNyI72okedMQixsWSDhD1b7O5GD04r+A9IHnZ+H+JLrl0uC1A3yZw2sWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881917; c=relaxed/simple;
	bh=ITokvwzyPNwdZmRzhzXXlExwC4mQU0gm6XCceKY0upI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHiRqEnNj0S8MLuHFLh35/a6cDWF3yntRS4NMldhrVc3DM1Fqr6X44RMLn3C8Sux8DTl+BfTovyscTzs3svq0VI1BhFov7ae9iaqYCippnLu1Xzv6iCMadFWyT/OUcFGDjVu0fpzEthGWVOWDcbd2+JS7cKKbeizFEJFDPJvyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxdLi4wy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37574495e9.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774881914; x=1775486714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwTy91N/yQlZVbiCARW4f3yG8FM9j2vo4oRn+l2BA3s=;
        b=nxdLi4wyex1p59SPXldm815lWgk5yQJ5ZnKB1hqQboVu1US/Ohi5F/rzipfd/fgKF5
         TnkJoZZVrO0z2Ybfzh+w5czDpErMDbLmEVRYPcwY80GY5o+OqdSeFy6yK1NeASfR1O3M
         cPujCjArJg6LbBtWOw8amJWRvm5ute+hP2xq5VrtLVt5sFc3Ur3xgTXZA6tCu1Lk8Af7
         yAXM16TNg6Itv7TjLaJDs4iHd04+HXF2liIb3CBjx4CioPavBT2SzsqkyciBQ7jzcW44
         uMnL23nDlZpbMmfZyLk69sOmo5Zz74UfTP6G+xjCsgD8KiXpuWqr/NhgIRv2m18BOC8q
         YIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881914; x=1775486714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwTy91N/yQlZVbiCARW4f3yG8FM9j2vo4oRn+l2BA3s=;
        b=aoDgOdoYVELsmLFZ9sAdB7vC1PlB0hBOInDocHNE/8GPapHttqeN72fLH6jU+IG3Ay
         ohPBCD4zK+7bB+BRPIUllURfdgnlFIm+1IGVsgpC+kwha3O0ZzKI5FShpxdgXI07gghU
         cckIiFEaRHQOfcI2jma1pIfOCBElbOmCHMODVSEbkv3Bfogkaw0Jxxbkkslnrbspmxcx
         N+VHlNsnaWBei8sdaiS//xxKWV+ZM32I2NVX1gRWpOWncfVGT68Dj1ZYDSNe/SG2kcM3
         5j1Sy8m0qxFAV33QUTNo23k2p/B5PsVUuYlLxvPTP6Y+HthJbIJ4YrQj4InkU5aoa2IN
         GuTQ==
X-Gm-Message-State: AOJu0YzWw+kUZC9VF49vF3J4stQ2u9jV8Ln7mKFhawl5fLpgEZHIWKpD
	Vfv8CHzF5f+ajGGT0ow4bw3I3LEtLtYtShKrpfxzrldL122HLrlLRGPZ
X-Gm-Gg: ATEYQzzBROyp54MGEeEstPfK+Peb+1gOVcjpvj1P750tmuX3jSLKECjrXW2/HQDwzC8
	7/1UfPGEWFokdbgXIQetQlGOYIHwG1OF8I5I1pME02PDg+BovmVZyLI106HzZS+9RajAxvXCap/
	kcnW0NgR90dgmGdThuvda076gk5SvTi/xUuybY5ygRMLU8z/S5S6nlS0NBIvZLDrd8AQsIHWZcw
	ki+707OWqu8wRxk+FLi5nIx60KulzKVUfeZ8sVf/kvGcqn9S73tkX7qOAcWjhlAxUTWueSgeGzy
	Z+JIiaYMN9A3wmTNbaMf2dVOFLBf6M9I6ytP0q7shYFImYDN3Tojk/oyfzIv1rKxK4Vcs3QJCHN
	9EmIbLYy588qb5oOe9AdCTUWB7Z7LlET80SilP41fujExxRaOR6H350fnqUZXjTF2IX+iPTPmFg
	LsMugkwvlYqeO5q1oA8vXppLa0GB0vNvOc7/gy2FSJ5wISu9Yv7WplfqwHb9hZeZ3i0rwKZafkO
	miaFCIWalIswes2cLXLtvf87CUtaOg/THWnIQ==
X-Received: by 2002:a05:600c:529b:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48727d84100mr199490465e9.15.1774881913213;
        Mon, 30 Mar 2026 07:45:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b85:b2a6:8671:75d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727192012sm82855065e9.32.2026.03.30.07.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:45:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Xiaolei Wang <Xiaolei.Wang@windriver.com>
Subject: [PATCH v3] media: i2c: ov5645: Convert to CCI register access helpers
Date: Mon, 30 Mar 2026 15:45:09 +0100
Message-ID: <20260330144509.258986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57640-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,windriver.com:email]
X-Rspamd-Queue-Id: 8B5A435D826
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the ov5645 driver to use the V4L2 CCI register access helpers
and regmap infrastructure instead of the custom I2C register access
implementation.

Keep ov5645_set_register_array() as ov5645_global_init_setting requires
a delay between specific register writes, which cannot be expressed
through the generic CCI multi-write helper.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Xiaolei Wang <Xiaolei.Wang@windriver.com>
---
Note, this patch was originally part of series [0] since patch 1/2
is no longer needed after patch [1] just sending this single patch.

[0] https://lore.kernel.org/all/20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@linux.intel.com/

v2->v3:
- Made use of CCI_REG16 for the chip ID register
- Replaced CHIP_ID_HIGH and CHIP_ID_LOW with a single
  CHIP_ID register definition
- Added RB tag from Xiaolei Wang

v1->v2
- Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
- Fixed checkpatch warnings limiting to 80 characters per line.
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5645.c | 919 ++++++++++++++++++-------------------
 2 files changed, 439 insertions(+), 481 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8f2ba4121586..bfc9b8060e44 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -546,6 +546,7 @@ config VIDEO_OV5640
 config VIDEO_OV5645
 	tristate "OmniVision OV5645 sensor support"
 	depends on OF
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5645 camera.
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..0585e5c53d33 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -25,39 +25,39 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define OV5645_SYSTEM_CTRL0		0x3008
+#define OV5645_SYSTEM_CTRL0		CCI_REG8(0x3008)
 #define		OV5645_SYSTEM_CTRL0_START	0x02
 #define		OV5645_SYSTEM_CTRL0_STOP	0x42
-#define OV5645_CHIP_ID_HIGH		0x300a
-#define		OV5645_CHIP_ID_HIGH_BYTE	0x56
-#define OV5645_CHIP_ID_LOW		0x300b
-#define		OV5645_CHIP_ID_LOW_BYTE		0x45
-#define OV5645_IO_MIPI_CTRL00		0x300e
-#define OV5645_PAD_OUTPUT00		0x3019
-#define OV5645_AWB_MANUAL_CONTROL	0x3406
+#define OV5645_CHIP_ID			CCI_REG16(0x300a)
+#define		OV5645_CHIP_ID_VALUE		0x5645
+#define OV5645_IO_MIPI_CTRL00		CCI_REG8(0x300e)
+#define OV5645_PAD_OUTPUT00		CCI_REG8(0x3019)
+#define OV5645_AWB_MANUAL_CONTROL	CCI_REG8(0x3406)
 #define		OV5645_AWB_MANUAL_ENABLE	BIT(0)
-#define OV5645_AEC_PK_MANUAL		0x3503
+#define OV5645_AEC_PK_MANUAL		CCI_REG8(0x3503)
 #define		OV5645_AEC_MANUAL_ENABLE	BIT(0)
 #define		OV5645_AGC_MANUAL_ENABLE	BIT(1)
-#define OV5645_TIMING_TC_REG20		0x3820
+#define OV5645_TIMING_TC_REG20		CCI_REG8(0x3820)
 #define		OV5645_SENSOR_VFLIP		BIT(1)
 #define		OV5645_ISP_VFLIP		BIT(2)
-#define OV5645_TIMING_TC_REG21		0x3821
+#define OV5645_TIMING_TC_REG21		CCI_REG8(0x3821)
 #define		OV5645_SENSOR_MIRROR		BIT(1)
-#define OV5645_MIPI_CTRL00		0x4800
-#define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
+#define OV5645_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5645_PRE_ISP_TEST_SETTING_1	CCI_REG8(0x503d)
 #define		OV5645_TEST_PATTERN_MASK	0x3
 #define		OV5645_SET_TEST_PATTERN(x)	((x) & OV5645_TEST_PATTERN_MASK)
 #define		OV5645_TEST_PATTERN_ENABLE	BIT(7)
-#define OV5645_SDE_SAT_U		0x5583
-#define OV5645_SDE_SAT_V		0x5584
+#define OV5645_SDE_SAT_U		CCI_REG8(0x5583)
+#define OV5645_SDE_SAT_V		CCI_REG8(0x5584)
 
 /* regulator supplies */
 static const char * const ov5645_supply_name[] = {
@@ -68,15 +68,10 @@ static const char * const ov5645_supply_name[] = {
 
 #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
 
-struct reg_value {
-	u16 reg;
-	u8 val;
-};
-
 struct ov5645_mode_info {
 	u32 width;
 	u32 height;
-	const struct reg_value *data;
+	const struct cci_reg_sequence *data;
 	u32 data_size;
 	u32 pixel_clock;
 	u32 link_freq;
@@ -85,6 +80,7 @@ struct ov5645_mode_info {
 struct ov5645 {
 	struct i2c_client *i2c_client;
 	struct device *dev;
+	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
@@ -100,9 +96,9 @@ struct ov5645 {
 	struct v4l2_ctrl *link_freq;
 
 	/* Cached register values */
-	u8 aec_pk_manual;
-	u8 timing_tc_reg20;
-	u8 timing_tc_reg21;
+	u64 aec_pk_manual;
+	u64 timing_tc_reg20;
+	u64 timing_tc_reg21;
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *rst_gpio;
@@ -113,393 +109,393 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5645, sd);
 }
 
-static const struct reg_value ov5645_global_init_setting[] = {
-	{ 0x3103, 0x11 },
-	{ 0x3008, 0x42 },
-	{ 0x3103, 0x03 },
-	{ 0x3503, 0x07 },
-	{ 0x3002, 0x1c },
-	{ 0x3006, 0xc3 },
-	{ 0x3017, 0x00 },
-	{ 0x3018, 0x00 },
-	{ 0x302e, 0x0b },
-	{ 0x3037, 0x13 },
-	{ 0x3108, 0x01 },
-	{ 0x3611, 0x06 },
-	{ 0x3500, 0x00 },
-	{ 0x3501, 0x01 },
-	{ 0x3502, 0x00 },
-	{ 0x350a, 0x00 },
-	{ 0x350b, 0x3f },
-	{ 0x3620, 0x33 },
-	{ 0x3621, 0xe0 },
-	{ 0x3622, 0x01 },
-	{ 0x3630, 0x2e },
-	{ 0x3631, 0x00 },
-	{ 0x3632, 0x32 },
-	{ 0x3633, 0x52 },
-	{ 0x3634, 0x70 },
-	{ 0x3635, 0x13 },
-	{ 0x3636, 0x03 },
-	{ 0x3703, 0x5a },
-	{ 0x3704, 0xa0 },
-	{ 0x3705, 0x1a },
-	{ 0x3709, 0x12 },
-	{ 0x370b, 0x61 },
-	{ 0x370f, 0x10 },
-	{ 0x3715, 0x78 },
-	{ 0x3717, 0x01 },
-	{ 0x371b, 0x20 },
-	{ 0x3731, 0x12 },
-	{ 0x3901, 0x0a },
-	{ 0x3905, 0x02 },
-	{ 0x3906, 0x10 },
-	{ 0x3719, 0x86 },
-	{ 0x3810, 0x00 },
-	{ 0x3811, 0x10 },
-	{ 0x3812, 0x00 },
-	{ 0x3821, 0x01 },
-	{ 0x3824, 0x01 },
-	{ 0x3826, 0x03 },
-	{ 0x3828, 0x08 },
-	{ 0x3a19, 0xf8 },
-	{ 0x3c01, 0x34 },
-	{ 0x3c04, 0x28 },
-	{ 0x3c05, 0x98 },
-	{ 0x3c07, 0x07 },
-	{ 0x3c09, 0xc2 },
-	{ 0x3c0a, 0x9c },
-	{ 0x3c0b, 0x40 },
-	{ 0x3c01, 0x34 },
-	{ 0x4001, 0x02 },
-	{ 0x4514, 0x00 },
-	{ 0x4520, 0xb0 },
-	{ 0x460b, 0x37 },
-	{ 0x460c, 0x20 },
-	{ 0x4818, 0x01 },
-	{ 0x481d, 0xf0 },
-	{ 0x481f, 0x50 },
-	{ 0x4823, 0x70 },
-	{ 0x4831, 0x14 },
-	{ 0x5000, 0xa7 },
-	{ 0x5001, 0x83 },
-	{ 0x501d, 0x00 },
-	{ 0x501f, 0x00 },
-	{ 0x503d, 0x00 },
-	{ 0x505c, 0x30 },
-	{ 0x5181, 0x59 },
-	{ 0x5183, 0x00 },
-	{ 0x5191, 0xf0 },
-	{ 0x5192, 0x03 },
-	{ 0x5684, 0x10 },
-	{ 0x5685, 0xa0 },
-	{ 0x5686, 0x0c },
-	{ 0x5687, 0x78 },
-	{ 0x5a00, 0x08 },
-	{ 0x5a21, 0x00 },
-	{ 0x5a24, 0x00 },
-	{ 0x3008, 0x02 },
-	{ 0x3503, 0x00 },
-	{ 0x5180, 0xff },
-	{ 0x5181, 0xf2 },
-	{ 0x5182, 0x00 },
-	{ 0x5183, 0x14 },
-	{ 0x5184, 0x25 },
-	{ 0x5185, 0x24 },
-	{ 0x5186, 0x09 },
-	{ 0x5187, 0x09 },
-	{ 0x5188, 0x0a },
-	{ 0x5189, 0x75 },
-	{ 0x518a, 0x52 },
-	{ 0x518b, 0xea },
-	{ 0x518c, 0xa8 },
-	{ 0x518d, 0x42 },
-	{ 0x518e, 0x38 },
-	{ 0x518f, 0x56 },
-	{ 0x5190, 0x42 },
-	{ 0x5191, 0xf8 },
-	{ 0x5192, 0x04 },
-	{ 0x5193, 0x70 },
-	{ 0x5194, 0xf0 },
-	{ 0x5195, 0xf0 },
-	{ 0x5196, 0x03 },
-	{ 0x5197, 0x01 },
-	{ 0x5198, 0x04 },
-	{ 0x5199, 0x12 },
-	{ 0x519a, 0x04 },
-	{ 0x519b, 0x00 },
-	{ 0x519c, 0x06 },
-	{ 0x519d, 0x82 },
-	{ 0x519e, 0x38 },
-	{ 0x5381, 0x1e },
-	{ 0x5382, 0x5b },
-	{ 0x5383, 0x08 },
-	{ 0x5384, 0x0a },
-	{ 0x5385, 0x7e },
-	{ 0x5386, 0x88 },
-	{ 0x5387, 0x7c },
-	{ 0x5388, 0x6c },
-	{ 0x5389, 0x10 },
-	{ 0x538a, 0x01 },
-	{ 0x538b, 0x98 },
-	{ 0x5300, 0x08 },
-	{ 0x5301, 0x30 },
-	{ 0x5302, 0x10 },
-	{ 0x5303, 0x00 },
-	{ 0x5304, 0x08 },
-	{ 0x5305, 0x30 },
-	{ 0x5306, 0x08 },
-	{ 0x5307, 0x16 },
-	{ 0x5309, 0x08 },
-	{ 0x530a, 0x30 },
-	{ 0x530b, 0x04 },
-	{ 0x530c, 0x06 },
-	{ 0x5480, 0x01 },
-	{ 0x5481, 0x08 },
-	{ 0x5482, 0x14 },
-	{ 0x5483, 0x28 },
-	{ 0x5484, 0x51 },
-	{ 0x5485, 0x65 },
-	{ 0x5486, 0x71 },
-	{ 0x5487, 0x7d },
-	{ 0x5488, 0x87 },
-	{ 0x5489, 0x91 },
-	{ 0x548a, 0x9a },
-	{ 0x548b, 0xaa },
-	{ 0x548c, 0xb8 },
-	{ 0x548d, 0xcd },
-	{ 0x548e, 0xdd },
-	{ 0x548f, 0xea },
-	{ 0x5490, 0x1d },
-	{ 0x5580, 0x02 },
-	{ 0x5583, 0x40 },
-	{ 0x5584, 0x10 },
-	{ 0x5589, 0x10 },
-	{ 0x558a, 0x00 },
-	{ 0x558b, 0xf8 },
-	{ 0x5800, 0x3f },
-	{ 0x5801, 0x16 },
-	{ 0x5802, 0x0e },
-	{ 0x5803, 0x0d },
-	{ 0x5804, 0x17 },
-	{ 0x5805, 0x3f },
-	{ 0x5806, 0x0b },
-	{ 0x5807, 0x06 },
-	{ 0x5808, 0x04 },
-	{ 0x5809, 0x04 },
-	{ 0x580a, 0x06 },
-	{ 0x580b, 0x0b },
-	{ 0x580c, 0x09 },
-	{ 0x580d, 0x03 },
-	{ 0x580e, 0x00 },
-	{ 0x580f, 0x00 },
-	{ 0x5810, 0x03 },
-	{ 0x5811, 0x08 },
-	{ 0x5812, 0x0a },
-	{ 0x5813, 0x03 },
-	{ 0x5814, 0x00 },
-	{ 0x5815, 0x00 },
-	{ 0x5816, 0x04 },
-	{ 0x5817, 0x09 },
-	{ 0x5818, 0x0f },
-	{ 0x5819, 0x08 },
-	{ 0x581a, 0x06 },
-	{ 0x581b, 0x06 },
-	{ 0x581c, 0x08 },
-	{ 0x581d, 0x0c },
-	{ 0x581e, 0x3f },
-	{ 0x581f, 0x1e },
-	{ 0x5820, 0x12 },
-	{ 0x5821, 0x13 },
-	{ 0x5822, 0x21 },
-	{ 0x5823, 0x3f },
-	{ 0x5824, 0x68 },
-	{ 0x5825, 0x28 },
-	{ 0x5826, 0x2c },
-	{ 0x5827, 0x28 },
-	{ 0x5828, 0x08 },
-	{ 0x5829, 0x48 },
-	{ 0x582a, 0x64 },
-	{ 0x582b, 0x62 },
-	{ 0x582c, 0x64 },
-	{ 0x582d, 0x28 },
-	{ 0x582e, 0x46 },
-	{ 0x582f, 0x62 },
-	{ 0x5830, 0x60 },
-	{ 0x5831, 0x62 },
-	{ 0x5832, 0x26 },
-	{ 0x5833, 0x48 },
-	{ 0x5834, 0x66 },
-	{ 0x5835, 0x44 },
-	{ 0x5836, 0x64 },
-	{ 0x5837, 0x28 },
-	{ 0x5838, 0x66 },
-	{ 0x5839, 0x48 },
-	{ 0x583a, 0x2c },
-	{ 0x583b, 0x28 },
-	{ 0x583c, 0x26 },
-	{ 0x583d, 0xae },
-	{ 0x5025, 0x00 },
-	{ 0x3a0f, 0x30 },
-	{ 0x3a10, 0x28 },
-	{ 0x3a1b, 0x30 },
-	{ 0x3a1e, 0x26 },
-	{ 0x3a11, 0x60 },
-	{ 0x3a1f, 0x14 },
-	{ 0x0601, 0x02 },
-	{ 0x3008, 0x42 },
-	{ 0x3008, 0x02 },
+static const struct cci_reg_sequence ov5645_global_init_setting[] = {
+	{ CCI_REG8(0x3103), 0x11 },
+	{ CCI_REG8(0x3008), 0x42 },
+	{ CCI_REG8(0x3103), 0x03 },
+	{ CCI_REG8(0x3503), 0x07 },
+	{ CCI_REG8(0x3002), 0x1c },
+	{ CCI_REG8(0x3006), 0xc3 },
+	{ CCI_REG8(0x3017), 0x00 },
+	{ CCI_REG8(0x3018), 0x00 },
+	{ CCI_REG8(0x302e), 0x0b },
+	{ CCI_REG8(0x3037), 0x13 },
+	{ CCI_REG8(0x3108), 0x01 },
+	{ CCI_REG8(0x3611), 0x06 },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x01 },
+	{ CCI_REG8(0x3502), 0x00 },
+	{ CCI_REG8(0x350a), 0x00 },
+	{ CCI_REG8(0x350b), 0x3f },
+	{ CCI_REG8(0x3620), 0x33 },
+	{ CCI_REG8(0x3621), 0xe0 },
+	{ CCI_REG8(0x3622), 0x01 },
+	{ CCI_REG8(0x3630), 0x2e },
+	{ CCI_REG8(0x3631), 0x00 },
+	{ CCI_REG8(0x3632), 0x32 },
+	{ CCI_REG8(0x3633), 0x52 },
+	{ CCI_REG8(0x3634), 0x70 },
+	{ CCI_REG8(0x3635), 0x13 },
+	{ CCI_REG8(0x3636), 0x03 },
+	{ CCI_REG8(0x3703), 0x5a },
+	{ CCI_REG8(0x3704), 0xa0 },
+	{ CCI_REG8(0x3705), 0x1a },
+	{ CCI_REG8(0x3709), 0x12 },
+	{ CCI_REG8(0x370b), 0x61 },
+	{ CCI_REG8(0x370f), 0x10 },
+	{ CCI_REG8(0x3715), 0x78 },
+	{ CCI_REG8(0x3717), 0x01 },
+	{ CCI_REG8(0x371b), 0x20 },
+	{ CCI_REG8(0x3731), 0x12 },
+	{ CCI_REG8(0x3901), 0x0a },
+	{ CCI_REG8(0x3905), 0x02 },
+	{ CCI_REG8(0x3906), 0x10 },
+	{ CCI_REG8(0x3719), 0x86 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x10 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3821), 0x01 },
+	{ CCI_REG8(0x3824), 0x01 },
+	{ CCI_REG8(0x3826), 0x03 },
+	{ CCI_REG8(0x3828), 0x08 },
+	{ CCI_REG8(0x3a19), 0xf8 },
+	{ CCI_REG8(0x3c01), 0x34 },
+	{ CCI_REG8(0x3c04), 0x28 },
+	{ CCI_REG8(0x3c05), 0x98 },
+	{ CCI_REG8(0x3c07), 0x07 },
+	{ CCI_REG8(0x3c09), 0xc2 },
+	{ CCI_REG8(0x3c0a), 0x9c },
+	{ CCI_REG8(0x3c0b), 0x40 },
+	{ CCI_REG8(0x3c01), 0x34 },
+	{ CCI_REG8(0x4001), 0x02 },
+	{ CCI_REG8(0x4514), 0x00 },
+	{ CCI_REG8(0x4520), 0xb0 },
+	{ CCI_REG8(0x460b), 0x37 },
+	{ CCI_REG8(0x460c), 0x20 },
+	{ CCI_REG8(0x4818), 0x01 },
+	{ CCI_REG8(0x481d), 0xf0 },
+	{ CCI_REG8(0x481f), 0x50 },
+	{ CCI_REG8(0x4823), 0x70 },
+	{ CCI_REG8(0x4831), 0x14 },
+	{ CCI_REG8(0x5000), 0xa7 },
+	{ CCI_REG8(0x5001), 0x83 },
+	{ CCI_REG8(0x501d), 0x00 },
+	{ CCI_REG8(0x501f), 0x00 },
+	{ CCI_REG8(0x503d), 0x00 },
+	{ CCI_REG8(0x505c), 0x30 },
+	{ CCI_REG8(0x5181), 0x59 },
+	{ CCI_REG8(0x5183), 0x00 },
+	{ CCI_REG8(0x5191), 0xf0 },
+	{ CCI_REG8(0x5192), 0x03 },
+	{ CCI_REG8(0x5684), 0x10 },
+	{ CCI_REG8(0x5685), 0xa0 },
+	{ CCI_REG8(0x5686), 0x0c },
+	{ CCI_REG8(0x5687), 0x78 },
+	{ CCI_REG8(0x5a00), 0x08 },
+	{ CCI_REG8(0x5a21), 0x00 },
+	{ CCI_REG8(0x5a24), 0x00 },
+	{ CCI_REG8(0x3008), 0x02 },
+	{ CCI_REG8(0x3503), 0x00 },
+	{ CCI_REG8(0x5180), 0xff },
+	{ CCI_REG8(0x5181), 0xf2 },
+	{ CCI_REG8(0x5182), 0x00 },
+	{ CCI_REG8(0x5183), 0x14 },
+	{ CCI_REG8(0x5184), 0x25 },
+	{ CCI_REG8(0x5185), 0x24 },
+	{ CCI_REG8(0x5186), 0x09 },
+	{ CCI_REG8(0x5187), 0x09 },
+	{ CCI_REG8(0x5188), 0x0a },
+	{ CCI_REG8(0x5189), 0x75 },
+	{ CCI_REG8(0x518a), 0x52 },
+	{ CCI_REG8(0x518b), 0xea },
+	{ CCI_REG8(0x518c), 0xa8 },
+	{ CCI_REG8(0x518d), 0x42 },
+	{ CCI_REG8(0x518e), 0x38 },
+	{ CCI_REG8(0x518f), 0x56 },
+	{ CCI_REG8(0x5190), 0x42 },
+	{ CCI_REG8(0x5191), 0xf8 },
+	{ CCI_REG8(0x5192), 0x04 },
+	{ CCI_REG8(0x5193), 0x70 },
+	{ CCI_REG8(0x5194), 0xf0 },
+	{ CCI_REG8(0x5195), 0xf0 },
+	{ CCI_REG8(0x5196), 0x03 },
+	{ CCI_REG8(0x5197), 0x01 },
+	{ CCI_REG8(0x5198), 0x04 },
+	{ CCI_REG8(0x5199), 0x12 },
+	{ CCI_REG8(0x519a), 0x04 },
+	{ CCI_REG8(0x519b), 0x00 },
+	{ CCI_REG8(0x519c), 0x06 },
+	{ CCI_REG8(0x519d), 0x82 },
+	{ CCI_REG8(0x519e), 0x38 },
+	{ CCI_REG8(0x5381), 0x1e },
+	{ CCI_REG8(0x5382), 0x5b },
+	{ CCI_REG8(0x5383), 0x08 },
+	{ CCI_REG8(0x5384), 0x0a },
+	{ CCI_REG8(0x5385), 0x7e },
+	{ CCI_REG8(0x5386), 0x88 },
+	{ CCI_REG8(0x5387), 0x7c },
+	{ CCI_REG8(0x5388), 0x6c },
+	{ CCI_REG8(0x5389), 0x10 },
+	{ CCI_REG8(0x538a), 0x01 },
+	{ CCI_REG8(0x538b), 0x98 },
+	{ CCI_REG8(0x5300), 0x08 },
+	{ CCI_REG8(0x5301), 0x30 },
+	{ CCI_REG8(0x5302), 0x10 },
+	{ CCI_REG8(0x5303), 0x00 },
+	{ CCI_REG8(0x5304), 0x08 },
+	{ CCI_REG8(0x5305), 0x30 },
+	{ CCI_REG8(0x5306), 0x08 },
+	{ CCI_REG8(0x5307), 0x16 },
+	{ CCI_REG8(0x5309), 0x08 },
+	{ CCI_REG8(0x530a), 0x30 },
+	{ CCI_REG8(0x530b), 0x04 },
+	{ CCI_REG8(0x530c), 0x06 },
+	{ CCI_REG8(0x5480), 0x01 },
+	{ CCI_REG8(0x5481), 0x08 },
+	{ CCI_REG8(0x5482), 0x14 },
+	{ CCI_REG8(0x5483), 0x28 },
+	{ CCI_REG8(0x5484), 0x51 },
+	{ CCI_REG8(0x5485), 0x65 },
+	{ CCI_REG8(0x5486), 0x71 },
+	{ CCI_REG8(0x5487), 0x7d },
+	{ CCI_REG8(0x5488), 0x87 },
+	{ CCI_REG8(0x5489), 0x91 },
+	{ CCI_REG8(0x548a), 0x9a },
+	{ CCI_REG8(0x548b), 0xaa },
+	{ CCI_REG8(0x548c), 0xb8 },
+	{ CCI_REG8(0x548d), 0xcd },
+	{ CCI_REG8(0x548e), 0xdd },
+	{ CCI_REG8(0x548f), 0xea },
+	{ CCI_REG8(0x5490), 0x1d },
+	{ CCI_REG8(0x5580), 0x02 },
+	{ CCI_REG8(0x5583), 0x40 },
+	{ CCI_REG8(0x5584), 0x10 },
+	{ CCI_REG8(0x5589), 0x10 },
+	{ CCI_REG8(0x558a), 0x00 },
+	{ CCI_REG8(0x558b), 0xf8 },
+	{ CCI_REG8(0x5800), 0x3f },
+	{ CCI_REG8(0x5801), 0x16 },
+	{ CCI_REG8(0x5802), 0x0e },
+	{ CCI_REG8(0x5803), 0x0d },
+	{ CCI_REG8(0x5804), 0x17 },
+	{ CCI_REG8(0x5805), 0x3f },
+	{ CCI_REG8(0x5806), 0x0b },
+	{ CCI_REG8(0x5807), 0x06 },
+	{ CCI_REG8(0x5808), 0x04 },
+	{ CCI_REG8(0x5809), 0x04 },
+	{ CCI_REG8(0x580a), 0x06 },
+	{ CCI_REG8(0x580b), 0x0b },
+	{ CCI_REG8(0x580c), 0x09 },
+	{ CCI_REG8(0x580d), 0x03 },
+	{ CCI_REG8(0x580e), 0x00 },
+	{ CCI_REG8(0x580f), 0x00 },
+	{ CCI_REG8(0x5810), 0x03 },
+	{ CCI_REG8(0x5811), 0x08 },
+	{ CCI_REG8(0x5812), 0x0a },
+	{ CCI_REG8(0x5813), 0x03 },
+	{ CCI_REG8(0x5814), 0x00 },
+	{ CCI_REG8(0x5815), 0x00 },
+	{ CCI_REG8(0x5816), 0x04 },
+	{ CCI_REG8(0x5817), 0x09 },
+	{ CCI_REG8(0x5818), 0x0f },
+	{ CCI_REG8(0x5819), 0x08 },
+	{ CCI_REG8(0x581a), 0x06 },
+	{ CCI_REG8(0x581b), 0x06 },
+	{ CCI_REG8(0x581c), 0x08 },
+	{ CCI_REG8(0x581d), 0x0c },
+	{ CCI_REG8(0x581e), 0x3f },
+	{ CCI_REG8(0x581f), 0x1e },
+	{ CCI_REG8(0x5820), 0x12 },
+	{ CCI_REG8(0x5821), 0x13 },
+	{ CCI_REG8(0x5822), 0x21 },
+	{ CCI_REG8(0x5823), 0x3f },
+	{ CCI_REG8(0x5824), 0x68 },
+	{ CCI_REG8(0x5825), 0x28 },
+	{ CCI_REG8(0x5826), 0x2c },
+	{ CCI_REG8(0x5827), 0x28 },
+	{ CCI_REG8(0x5828), 0x08 },
+	{ CCI_REG8(0x5829), 0x48 },
+	{ CCI_REG8(0x582a), 0x64 },
+	{ CCI_REG8(0x582b), 0x62 },
+	{ CCI_REG8(0x582c), 0x64 },
+	{ CCI_REG8(0x582d), 0x28 },
+	{ CCI_REG8(0x582e), 0x46 },
+	{ CCI_REG8(0x582f), 0x62 },
+	{ CCI_REG8(0x5830), 0x60 },
+	{ CCI_REG8(0x5831), 0x62 },
+	{ CCI_REG8(0x5832), 0x26 },
+	{ CCI_REG8(0x5833), 0x48 },
+	{ CCI_REG8(0x5834), 0x66 },
+	{ CCI_REG8(0x5835), 0x44 },
+	{ CCI_REG8(0x5836), 0x64 },
+	{ CCI_REG8(0x5837), 0x28 },
+	{ CCI_REG8(0x5838), 0x66 },
+	{ CCI_REG8(0x5839), 0x48 },
+	{ CCI_REG8(0x583a), 0x2c },
+	{ CCI_REG8(0x583b), 0x28 },
+	{ CCI_REG8(0x583c), 0x26 },
+	{ CCI_REG8(0x583d), 0xae },
+	{ CCI_REG8(0x5025), 0x00 },
+	{ CCI_REG8(0x3a0f), 0x30 },
+	{ CCI_REG8(0x3a10), 0x28 },
+	{ CCI_REG8(0x3a1b), 0x30 },
+	{ CCI_REG8(0x3a1e), 0x26 },
+	{ CCI_REG8(0x3a11), 0x60 },
+	{ CCI_REG8(0x3a1f), 0x14 },
+	{ CCI_REG8(0x0601), 0x02 },
+	{ CCI_REG8(0x3008), 0x42 },
+	{ CCI_REG8(0x3008), 0x02 },
 	{ OV5645_IO_MIPI_CTRL00, 0x40 },
 	{ OV5645_MIPI_CTRL00, 0x24 },
 	{ OV5645_PAD_OUTPUT00, 0x70 }
 };
 
-static const struct reg_value ov5645_setting_sxga[] = {
-	{ 0x3612, 0xa9 },
-	{ 0x3614, 0x50 },
-	{ 0x3618, 0x00 },
-	{ 0x3034, 0x18 },
-	{ 0x3035, 0x21 },
-	{ 0x3036, 0x70 },
-	{ 0x3600, 0x09 },
-	{ 0x3601, 0x43 },
-	{ 0x3708, 0x66 },
-	{ 0x370c, 0xc3 },
-	{ 0x3800, 0x00 },
-	{ 0x3801, 0x00 },
-	{ 0x3802, 0x00 },
-	{ 0x3803, 0x06 },
-	{ 0x3804, 0x0a },
-	{ 0x3805, 0x3f },
-	{ 0x3806, 0x07 },
-	{ 0x3807, 0x9d },
-	{ 0x3808, 0x05 },
-	{ 0x3809, 0x00 },
-	{ 0x380a, 0x03 },
-	{ 0x380b, 0xc0 },
-	{ 0x380c, 0x07 },
-	{ 0x380d, 0x68 },
-	{ 0x380e, 0x03 },
-	{ 0x380f, 0xd8 },
-	{ 0x3813, 0x06 },
-	{ 0x3814, 0x31 },
-	{ 0x3815, 0x31 },
-	{ 0x3820, 0x47 },
-	{ 0x3a02, 0x03 },
-	{ 0x3a03, 0xd8 },
-	{ 0x3a08, 0x01 },
-	{ 0x3a09, 0xf8 },
-	{ 0x3a0a, 0x01 },
-	{ 0x3a0b, 0xa4 },
-	{ 0x3a0e, 0x02 },
-	{ 0x3a0d, 0x02 },
-	{ 0x3a14, 0x03 },
-	{ 0x3a15, 0xd8 },
-	{ 0x3a18, 0x00 },
-	{ 0x4004, 0x02 },
-	{ 0x4005, 0x18 },
-	{ 0x4300, 0x32 },
-	{ 0x4202, 0x00 }
+static const struct cci_reg_sequence ov5645_setting_sxga[] = {
+	{ CCI_REG8(0x3612), 0xa9 },
+	{ CCI_REG8(0x3614), 0x50 },
+	{ CCI_REG8(0x3618), 0x00 },
+	{ CCI_REG8(0x3034), 0x18 },
+	{ CCI_REG8(0x3035), 0x21 },
+	{ CCI_REG8(0x3036), 0x70 },
+	{ CCI_REG8(0x3600), 0x09 },
+	{ CCI_REG8(0x3601), 0x43 },
+	{ CCI_REG8(0x3708), 0x66 },
+	{ CCI_REG8(0x370c), 0xc3 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x06 },
+	{ CCI_REG8(0x3804), 0x0a },
+	{ CCI_REG8(0x3805), 0x3f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0x9d },
+	{ CCI_REG8(0x3808), 0x05 },
+	{ CCI_REG8(0x3809), 0x00 },
+	{ CCI_REG8(0x380a), 0x03 },
+	{ CCI_REG8(0x380b), 0xc0 },
+	{ CCI_REG8(0x380c), 0x07 },
+	{ CCI_REG8(0x380d), 0x68 },
+	{ CCI_REG8(0x380e), 0x03 },
+	{ CCI_REG8(0x380f), 0xd8 },
+	{ CCI_REG8(0x3813), 0x06 },
+	{ CCI_REG8(0x3814), 0x31 },
+	{ CCI_REG8(0x3815), 0x31 },
+	{ CCI_REG8(0x3820), 0x47 },
+	{ CCI_REG8(0x3a02), 0x03 },
+	{ CCI_REG8(0x3a03), 0xd8 },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0xf8 },
+	{ CCI_REG8(0x3a0a), 0x01 },
+	{ CCI_REG8(0x3a0b), 0xa4 },
+	{ CCI_REG8(0x3a0e), 0x02 },
+	{ CCI_REG8(0x3a0d), 0x02 },
+	{ CCI_REG8(0x3a14), 0x03 },
+	{ CCI_REG8(0x3a15), 0xd8 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x4004), 0x02 },
+	{ CCI_REG8(0x4005), 0x18 },
+	{ CCI_REG8(0x4300), 0x32 },
+	{ CCI_REG8(0x4202), 0x00 }
 };
 
-static const struct reg_value ov5645_setting_1080p[] = {
-	{ 0x3612, 0xab },
-	{ 0x3614, 0x50 },
-	{ 0x3618, 0x04 },
-	{ 0x3034, 0x18 },
-	{ 0x3035, 0x11 },
-	{ 0x3036, 0x54 },
-	{ 0x3600, 0x08 },
-	{ 0x3601, 0x33 },
-	{ 0x3708, 0x63 },
-	{ 0x370c, 0xc0 },
-	{ 0x3800, 0x01 },
-	{ 0x3801, 0x50 },
-	{ 0x3802, 0x01 },
-	{ 0x3803, 0xb2 },
-	{ 0x3804, 0x08 },
-	{ 0x3805, 0xef },
-	{ 0x3806, 0x05 },
-	{ 0x3807, 0xf1 },
-	{ 0x3808, 0x07 },
-	{ 0x3809, 0x80 },
-	{ 0x380a, 0x04 },
-	{ 0x380b, 0x38 },
-	{ 0x380c, 0x09 },
-	{ 0x380d, 0xc4 },
-	{ 0x380e, 0x04 },
-	{ 0x380f, 0x60 },
-	{ 0x3813, 0x04 },
-	{ 0x3814, 0x11 },
-	{ 0x3815, 0x11 },
-	{ 0x3820, 0x47 },
-	{ 0x4514, 0x88 },
-	{ 0x3a02, 0x04 },
-	{ 0x3a03, 0x60 },
-	{ 0x3a08, 0x01 },
-	{ 0x3a09, 0x50 },
-	{ 0x3a0a, 0x01 },
-	{ 0x3a0b, 0x18 },
-	{ 0x3a0e, 0x03 },
-	{ 0x3a0d, 0x04 },
-	{ 0x3a14, 0x04 },
-	{ 0x3a15, 0x60 },
-	{ 0x3a18, 0x00 },
-	{ 0x4004, 0x06 },
-	{ 0x4005, 0x18 },
-	{ 0x4300, 0x32 },
-	{ 0x4202, 0x00 },
-	{ 0x4837, 0x0b }
+static const struct cci_reg_sequence ov5645_setting_1080p[] = {
+	{ CCI_REG8(0x3612), 0xab },
+	{ CCI_REG8(0x3614), 0x50 },
+	{ CCI_REG8(0x3618), 0x04 },
+	{ CCI_REG8(0x3034), 0x18 },
+	{ CCI_REG8(0x3035), 0x11 },
+	{ CCI_REG8(0x3036), 0x54 },
+	{ CCI_REG8(0x3600), 0x08 },
+	{ CCI_REG8(0x3601), 0x33 },
+	{ CCI_REG8(0x3708), 0x63 },
+	{ CCI_REG8(0x370c), 0xc0 },
+	{ CCI_REG8(0x3800), 0x01 },
+	{ CCI_REG8(0x3801), 0x50 },
+	{ CCI_REG8(0x3802), 0x01 },
+	{ CCI_REG8(0x3803), 0xb2 },
+	{ CCI_REG8(0x3804), 0x08 },
+	{ CCI_REG8(0x3805), 0xef },
+	{ CCI_REG8(0x3806), 0x05 },
+	{ CCI_REG8(0x3807), 0xf1 },
+	{ CCI_REG8(0x3808), 0x07 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x04 },
+	{ CCI_REG8(0x380b), 0x38 },
+	{ CCI_REG8(0x380c), 0x09 },
+	{ CCI_REG8(0x380d), 0xc4 },
+	{ CCI_REG8(0x380e), 0x04 },
+	{ CCI_REG8(0x380f), 0x60 },
+	{ CCI_REG8(0x3813), 0x04 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3820), 0x47 },
+	{ CCI_REG8(0x4514), 0x88 },
+	{ CCI_REG8(0x3a02), 0x04 },
+	{ CCI_REG8(0x3a03), 0x60 },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x50 },
+	{ CCI_REG8(0x3a0a), 0x01 },
+	{ CCI_REG8(0x3a0b), 0x18 },
+	{ CCI_REG8(0x3a0e), 0x03 },
+	{ CCI_REG8(0x3a0d), 0x04 },
+	{ CCI_REG8(0x3a14), 0x04 },
+	{ CCI_REG8(0x3a15), 0x60 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x4004), 0x06 },
+	{ CCI_REG8(0x4005), 0x18 },
+	{ CCI_REG8(0x4300), 0x32 },
+	{ CCI_REG8(0x4202), 0x00 },
+	{ CCI_REG8(0x4837), 0x0b }
 };
 
-static const struct reg_value ov5645_setting_full[] = {
-	{ 0x3612, 0xab },
-	{ 0x3614, 0x50 },
-	{ 0x3618, 0x04 },
-	{ 0x3034, 0x18 },
-	{ 0x3035, 0x11 },
-	{ 0x3036, 0x54 },
-	{ 0x3600, 0x08 },
-	{ 0x3601, 0x33 },
-	{ 0x3708, 0x63 },
-	{ 0x370c, 0xc0 },
-	{ 0x3800, 0x00 },
-	{ 0x3801, 0x00 },
-	{ 0x3802, 0x00 },
-	{ 0x3803, 0x00 },
-	{ 0x3804, 0x0a },
-	{ 0x3805, 0x3f },
-	{ 0x3806, 0x07 },
-	{ 0x3807, 0x9f },
-	{ 0x3808, 0x0a },
-	{ 0x3809, 0x20 },
-	{ 0x380a, 0x07 },
-	{ 0x380b, 0x98 },
-	{ 0x380c, 0x0b },
-	{ 0x380d, 0x1c },
-	{ 0x380e, 0x07 },
-	{ 0x380f, 0xb0 },
-	{ 0x3813, 0x06 },
-	{ 0x3814, 0x11 },
-	{ 0x3815, 0x11 },
-	{ 0x3820, 0x47 },
-	{ 0x4514, 0x88 },
-	{ 0x3a02, 0x07 },
-	{ 0x3a03, 0xb0 },
-	{ 0x3a08, 0x01 },
-	{ 0x3a09, 0x27 },
-	{ 0x3a0a, 0x00 },
-	{ 0x3a0b, 0xf6 },
-	{ 0x3a0e, 0x06 },
-	{ 0x3a0d, 0x08 },
-	{ 0x3a14, 0x07 },
-	{ 0x3a15, 0xb0 },
-	{ 0x3a18, 0x01 },
-	{ 0x4004, 0x06 },
-	{ 0x4005, 0x18 },
-	{ 0x4300, 0x32 },
-	{ 0x4837, 0x0b },
-	{ 0x4202, 0x00 }
+static const struct cci_reg_sequence ov5645_setting_full[] = {
+	{ CCI_REG8(0x3612), 0xab },
+	{ CCI_REG8(0x3614), 0x50 },
+	{ CCI_REG8(0x3618), 0x04 },
+	{ CCI_REG8(0x3034), 0x18 },
+	{ CCI_REG8(0x3035), 0x11 },
+	{ CCI_REG8(0x3036), 0x54 },
+	{ CCI_REG8(0x3600), 0x08 },
+	{ CCI_REG8(0x3601), 0x33 },
+	{ CCI_REG8(0x3708), 0x63 },
+	{ CCI_REG8(0x370c), 0xc0 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0a },
+	{ CCI_REG8(0x3805), 0x3f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0x9f },
+	{ CCI_REG8(0x3808), 0x0a },
+	{ CCI_REG8(0x3809), 0x20 },
+	{ CCI_REG8(0x380a), 0x07 },
+	{ CCI_REG8(0x380b), 0x98 },
+	{ CCI_REG8(0x380c), 0x0b },
+	{ CCI_REG8(0x380d), 0x1c },
+	{ CCI_REG8(0x380e), 0x07 },
+	{ CCI_REG8(0x380f), 0xb0 },
+	{ CCI_REG8(0x3813), 0x06 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3820), 0x47 },
+	{ CCI_REG8(0x4514), 0x88 },
+	{ CCI_REG8(0x3a02), 0x07 },
+	{ CCI_REG8(0x3a03), 0xb0 },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x27 },
+	{ CCI_REG8(0x3a0a), 0x00 },
+	{ CCI_REG8(0x3a0b), 0xf6 },
+	{ CCI_REG8(0x3a0e), 0x06 },
+	{ CCI_REG8(0x3a0d), 0x08 },
+	{ CCI_REG8(0x3a14), 0x07 },
+	{ CCI_REG8(0x3a15), 0xb0 },
+	{ CCI_REG8(0x3a18), 0x01 },
+	{ CCI_REG8(0x4004), 0x06 },
+	{ CCI_REG8(0x4005), 0x18 },
+	{ CCI_REG8(0x4300), 0x32 },
+	{ CCI_REG8(0x4837), 0x0b },
+	{ CCI_REG8(0x4202), 0x00 }
 };
 
 static const s64 link_freq[] = {
@@ -534,50 +530,6 @@ static const struct ov5645_mode_info ov5645_mode_info_data[] = {
 	},
 };
 
-static int ov5645_write_reg(struct ov5645 *ov5645, u16 reg, u8 val)
-{
-	u8 regbuf[3];
-	int ret;
-
-	regbuf[0] = reg >> 8;
-	regbuf[1] = reg & 0xff;
-	regbuf[2] = val;
-
-	ret = i2c_master_send(ov5645->i2c_client, regbuf, 3);
-	if (ret < 0) {
-		dev_err(ov5645->dev, "%s: write reg error %d: reg=%x, val=%x\n",
-			__func__, ret, reg, val);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5645_read_reg(struct ov5645 *ov5645, u16 reg, u8 *val)
-{
-	u8 regbuf[2];
-	int ret;
-
-	regbuf[0] = reg >> 8;
-	regbuf[1] = reg & 0xff;
-
-	ret = i2c_master_send(ov5645->i2c_client, regbuf, 2);
-	if (ret < 0) {
-		dev_err(ov5645->dev, "%s: write reg error %d: reg=%x\n",
-			__func__, ret, reg);
-		return ret;
-	}
-
-	ret = i2c_master_recv(ov5645->i2c_client, val, 1);
-	if (ret < 0) {
-		dev_err(ov5645->dev, "%s: read reg error %d: reg=%x\n",
-			__func__, ret, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int ov5645_set_aec_mode(struct ov5645 *ov5645, u32 mode)
 {
 	u8 val = ov5645->aec_pk_manual;
@@ -588,7 +540,7 @@ static int ov5645_set_aec_mode(struct ov5645 *ov5645, u32 mode)
 	else /* V4L2_EXPOSURE_MANUAL */
 		val |= OV5645_AEC_MANUAL_ENABLE;
 
-	ret = ov5645_write_reg(ov5645, OV5645_AEC_PK_MANUAL, val);
+	ret = cci_write(ov5645->regmap, OV5645_AEC_PK_MANUAL, val, NULL);
 	if (!ret)
 		ov5645->aec_pk_manual = val;
 
@@ -605,7 +557,7 @@ static int ov5645_set_agc_mode(struct ov5645 *ov5645, u32 enable)
 	else
 		val |= OV5645_AGC_MANUAL_ENABLE;
 
-	ret = ov5645_write_reg(ov5645, OV5645_AEC_PK_MANUAL, val);
+	ret = cci_write(ov5645->regmap, OV5645_AEC_PK_MANUAL, val, NULL);
 	if (!ret)
 		ov5645->aec_pk_manual = val;
 
@@ -613,14 +565,15 @@ static int ov5645_set_agc_mode(struct ov5645 *ov5645, u32 enable)
 }
 
 static int ov5645_set_register_array(struct ov5645 *ov5645,
-				     const struct reg_value *settings,
+				     const struct cci_reg_sequence *settings,
 				     unsigned int num_settings)
 {
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < num_settings; ++i, ++settings) {
-		ret = ov5645_write_reg(ov5645, settings->reg, settings->val);
+		ret = cci_write(ov5645->regmap, settings->reg,
+				settings->val, NULL);
 		if (ret < 0)
 			return ret;
 
@@ -637,7 +590,7 @@ static void __ov5645_set_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5645 *ov5645 = to_ov5645(sd);
 
-	ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
+	cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x58, NULL);
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
 	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
@@ -701,11 +654,11 @@ static int ov5645_set_saturation(struct ov5645 *ov5645, s32 value)
 	u32 reg_value = (value * 0x10) + 0x40;
 	int ret;
 
-	ret = ov5645_write_reg(ov5645, OV5645_SDE_SAT_U, reg_value);
+	ret = cci_write(ov5645->regmap, OV5645_SDE_SAT_U, reg_value, NULL);
 	if (ret < 0)
 		return ret;
 
-	return ov5645_write_reg(ov5645, OV5645_SDE_SAT_V, reg_value);
+	return cci_write(ov5645->regmap, OV5645_SDE_SAT_V, reg_value, NULL);
 }
 
 static int ov5645_set_hflip(struct ov5645 *ov5645, s32 value)
@@ -718,7 +671,7 @@ static int ov5645_set_hflip(struct ov5645 *ov5645, s32 value)
 	else
 		val |= (OV5645_SENSOR_MIRROR);
 
-	ret = ov5645_write_reg(ov5645, OV5645_TIMING_TC_REG21, val);
+	ret = cci_write(ov5645->regmap, OV5645_TIMING_TC_REG21, val, NULL);
 	if (!ret)
 		ov5645->timing_tc_reg21 = val;
 
@@ -735,7 +688,7 @@ static int ov5645_set_vflip(struct ov5645 *ov5645, s32 value)
 	else
 		val &= ~(OV5645_SENSOR_VFLIP | OV5645_ISP_VFLIP);
 
-	ret = ov5645_write_reg(ov5645, OV5645_TIMING_TC_REG20, val);
+	ret = cci_write(ov5645->regmap, OV5645_TIMING_TC_REG20, val, NULL);
 	if (!ret)
 		ov5645->timing_tc_reg20 = val;
 
@@ -751,7 +704,8 @@ static int ov5645_set_test_pattern(struct ov5645 *ov5645, s32 value)
 		val |= OV5645_TEST_PATTERN_ENABLE;
 	}
 
-	return ov5645_write_reg(ov5645, OV5645_PRE_ISP_TEST_SETTING_1, val);
+	return cci_write(ov5645->regmap, OV5645_PRE_ISP_TEST_SETTING_1,
+			 val, NULL);
 }
 
 static const char * const ov5645_test_pattern_menu[] = {
@@ -769,7 +723,7 @@ static int ov5645_set_awb(struct ov5645 *ov5645, s32 enable_auto)
 	if (!enable_auto)
 		val = OV5645_AWB_MANUAL_ENABLE;
 
-	return ov5645_write_reg(ov5645, OV5645_AWB_MANUAL_CONTROL, val);
+	return cci_write(ov5645->regmap, OV5645_AWB_MANUAL_CONTROL, val, NULL);
 }
 
 static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -932,9 +886,8 @@ static int ov5645_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
-	ret = ov5645_set_register_array(ov5645,
-					ov5645->current_mode->data,
-					ov5645->current_mode->data_size);
+	ret = cci_multi_reg_write(ov5645->regmap, ov5645->current_mode->data,
+				  ov5645->current_mode->data_size, NULL);
 	if (ret < 0) {
 		dev_err(ov5645->dev, "could not set mode %dx%d\n",
 			ov5645->current_mode->width,
@@ -947,12 +900,12 @@ static int ov5645_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
-	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
+	ret = cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x45, NULL);
 	if (ret < 0)
 		goto err_rpm_put;
 
-	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
-			       OV5645_SYSTEM_CTRL0_START);
+	ret = cci_write(ov5645->regmap, OV5645_SYSTEM_CTRL0,
+			OV5645_SYSTEM_CTRL0_START, NULL);
 	if (ret < 0)
 		goto err_rpm_put;
 
@@ -970,12 +923,12 @@ static int ov5645_disable_streams(struct v4l2_subdev *sd,
 	struct ov5645 *ov5645 = to_ov5645(sd);
 	int ret;
 
-	ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
+	ret = cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x40, NULL);
 	if (ret < 0)
 		goto rpm_put;
 
-	ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
-			       OV5645_SYSTEM_CTRL0_STOP);
+	ret = cci_write(ov5645->regmap, OV5645_SYSTEM_CTRL0,
+			OV5645_SYSTEM_CTRL0_STOP, NULL);
 
 rpm_put:
 	pm_runtime_put_autosuspend(ov5645->dev);
@@ -1011,9 +964,9 @@ static int ov5645_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device_node *endpoint;
 	struct ov5645 *ov5645;
-	u8 chip_id_high, chip_id_low;
 	unsigned int i;
 	u32 xclk_freq;
+	u64 chip_id;
 	int ret;
 
 	ov5645 = devm_kzalloc(dev, sizeof(struct ov5645), GFP_KERNEL);
@@ -1041,6 +994,11 @@ static int ov5645_probe(struct i2c_client *client)
 		return dev_err_probe(dev, -EINVAL,
 				     "invalid bus type, must be CSI2\n");
 
+	ov5645->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov5645->regmap))
+		return dev_err_probe(ov5645->dev, PTR_ERR(ov5645->regmap),
+				     "Failed to init CCI\n");
+
 	/* get system clock (xclk) */
 	ov5645->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, false, 0);
 	if (IS_ERR(ov5645->xclk))
@@ -1127,39 +1085,38 @@ static int ov5645_probe(struct i2c_client *client)
 	if (ret)
 		goto free_entity;
 
-	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_high);
-	if (ret < 0 || chip_id_high != OV5645_CHIP_ID_HIGH_BYTE) {
-		ret = -ENODEV;
-		dev_err_probe(dev, ret, "could not read ID high\n");
+	ret = cci_read(ov5645->regmap, OV5645_CHIP_ID, &chip_id, NULL);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "could not read chip ID\n");
 		goto power_down;
 	}
-	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low);
-	if (ret < 0 || chip_id_low != OV5645_CHIP_ID_LOW_BYTE) {
-		ret = -ENODEV;
-		dev_err_probe(dev, ret, "could not read ID low\n");
+
+	if (chip_id != OV5645_CHIP_ID_VALUE) {
+		ret = dev_err_probe(dev, -ENODEV,
+				    "Unexpected sensor ID %06llx\n", chip_id);
 		goto power_down;
 	}
 
 	dev_info(dev, "OV5645 detected at address 0x%02x\n", client->addr);
 
-	ret = ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
-			      &ov5645->aec_pk_manual);
+	ret = cci_read(ov5645->regmap, OV5645_AEC_PK_MANUAL,
+		       &ov5645->aec_pk_manual, NULL);
 	if (ret < 0) {
 		ret = -ENODEV;
 		dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
 		goto power_down;
 	}
 
-	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
-			      &ov5645->timing_tc_reg20);
+	ret = cci_read(ov5645->regmap, OV5645_TIMING_TC_REG20,
+		       &ov5645->timing_tc_reg20, NULL);
 	if (ret < 0) {
 		ret = -ENODEV;
 		dev_err_probe(dev, ret, "could not read vflip value\n");
 		goto power_down;
 	}
 
-	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
-			      &ov5645->timing_tc_reg21);
+	ret = cci_read(ov5645->regmap, OV5645_TIMING_TC_REG21,
+		       &ov5645->timing_tc_reg21, NULL);
 	if (ret < 0) {
 		ret = -ENODEV;
 		dev_err_probe(dev, ret, "could not read hflip value\n");
-- 
2.53.0


