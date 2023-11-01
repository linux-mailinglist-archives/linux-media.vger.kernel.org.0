Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC927DE0EB
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 13:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbjKAMYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 08:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbjKAMYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 08:24:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F484118;
        Wed,  1 Nov 2023 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698841443; x=1730377443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sVoB2nzVS4xYYI7xHmLVJKrUYX9Yfj+tSQTlepogGXM=;
  b=RRjAWXdOha0cF81aAfqgZup0VTzplZMYKtcBo3+DoxcOYy6EH3IhoTGo
   3SxRhrCXAxbBpG34Gxf0kjMu6t3jc+ZA6AJ6A7Wxy3nPhZb9M5mB8Y5q7
   wAvnvM1976OezdJCapTi3JcupHOR3ig1R/jquTO8U/jiUVzJ6nObe5ovh
   XjxOssYCEDSingU8ylLXnPSAQfGOIJnPGufjnDkscw76zUY/Cbgvq0JAW
   Tziw4E+5QnebvMe1TbOrMuhTYJ0wYuhhMqHL3JSKteMsTwe0G4h1SvJI1
   Tp1PXPCHNmMY3m1/vqiWH4ue7zQkUXuZZ1jDHmVTn/hFjeRLpFkJsQl41
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,268,1694728800"; 
   d="scan'208";a="33759524"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Nov 2023 13:23:56 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A8C51280084;
        Wed,  1 Nov 2023 13:23:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian encoded registers
Date:   Wed,  1 Nov 2023 13:23:53 +0100
Message-Id: <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some sensors, e.g. Sony, are using little-endian registers. Add support for
those by encoding the endianess into Bit 20 of the register address.

Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
 include/media/v4l2-cci.h           |  5 ++++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index bc2dbec019b04..673637b67bf67 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -18,6 +18,7 @@
 
 int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 {
+	bool little_endian;
 	unsigned int len;
 	u8 buf[8];
 	int ret;
@@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 	if (err && *err)
 		return *err;
 
+	little_endian = reg & CCI_REG_LE;
 	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
 	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
 
@@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 		*val = buf[0];
 		break;
 	case 2:
-		*val = get_unaligned_be16(buf);
+		if (little_endian)
+			*val = get_unaligned_le16(buf);
+		else
+			*val = get_unaligned_be16(buf);
 		break;
 	case 3:
-		*val = get_unaligned_be24(buf);
+		if (little_endian)
+			*val = get_unaligned_le24(buf);
+		else
+			*val = get_unaligned_be24(buf);
 		break;
 	case 4:
-		*val = get_unaligned_be32(buf);
+		if (little_endian)
+			*val = get_unaligned_le32(buf);
+		else
+			*val = get_unaligned_be32(buf);
 		break;
 	case 8:
-		*val = get_unaligned_be64(buf);
+		if (little_endian)
+			*val = get_unaligned_le64(buf);
+		else
+			*val = get_unaligned_be64(buf);
 		break;
 	default:
 		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
@@ -68,6 +82,7 @@ EXPORT_SYMBOL_GPL(cci_read);
 
 int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
 {
+	bool little_endian;
 	unsigned int len;
 	u8 buf[8];
 	int ret;
@@ -75,6 +90,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
 	if (err && *err)
 		return *err;
 
+	little_endian = reg & CCI_REG_LE;
 	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
 	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
 
@@ -83,16 +99,28 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
 		buf[0] = val;
 		break;
 	case 2:
-		put_unaligned_be16(val, buf);
+		if (little_endian)
+			put_unaligned_le16(val, buf);
+		else
+			put_unaligned_be16(val, buf);
 		break;
 	case 3:
-		put_unaligned_be24(val, buf);
+		if (little_endian)
+			put_unaligned_le24(val, buf);
+		else
+			put_unaligned_be24(val, buf);
 		break;
 	case 4:
-		put_unaligned_be32(val, buf);
+		if (little_endian)
+			put_unaligned_le32(val, buf);
+		else
+			put_unaligned_be32(val, buf);
 		break;
 	case 8:
-		put_unaligned_be64(val, buf);
+		if (little_endian)
+			put_unaligned_le64(val, buf);
+		else
+			put_unaligned_be64(val, buf);
 		break;
 	default:
 		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 0f6803e4b17e9..ef3faf0c9d44d 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -32,12 +32,17 @@ struct cci_reg_sequence {
 #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
 #define CCI_REG_WIDTH_SHIFT		16
 #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
+#define CCI_REG_LE			BIT(20)
 
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
+#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
+#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
+#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
 
 /**
  * cci_read() - Read a value from a single CCI register
-- 
2.34.1

