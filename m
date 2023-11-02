Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F407DEF3B
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 10:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345917AbjKBJvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 05:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345771AbjKBJvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 05:51:03 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B083B111;
        Thu,  2 Nov 2023 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698918657; x=1730454657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GY7yzYwuHP5bT6T/FPY7h8vziNZt48i1+BwHAWwbAIE=;
  b=jWQld7BX4HxRWDnS7jyxdaPFED9BAtDFkqclPZn1mH89Sw0iBkcqtppS
   rv1N5ntZikGb5eQvLrAv8Ju8oLbDAym/6GZhJdA9ahxi5Q5zXooNTY8jP
   GmFPAsY0Pr/xXBSw2JKbkiwjd1+Rlb1glOKuWU3+C8LFmw60HwH6lrYLs
   497uJGyiW8BrRDH+Af7nKwJt/Dklwh6u9ii8LXKX2yBhY6x/PYa/x5IU+
   Yl8souvxv/MRBg8CwqsFqqCz0h6NGx1V5GJZ99lBqOej6rjeK7Ii7yaNk
   klCifVGf8d+NYDlVsijFAx0iYVwNc0FzIp+k/q3akgYXVhwuBO1q7cKjk
   w==;
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; 
   d="scan'208";a="33774787"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Nov 2023 10:50:50 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3FC4F280084;
        Thu,  2 Nov 2023 10:50:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/2] media: v4l2-cci: Add support for little-endian encoded registers
Date:   Thu,  2 Nov 2023 10:50:47 +0100
Message-Id: <20231102095048.3222110-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
References: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some sensors, e.g. Sony IMX290, are using little-endian registers. Add
support for those by encoding the endianess into Bit 20 of the register
address.

Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index 0f6803e4b17e9..80cbb5cb70fa5 100644
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
+#define CCI_REG16_LE(x)			(CCI_REG_LE | (2U << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG24_LE(x)			(CCI_REG_LE | (3U << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG32_LE(x)			(CCI_REG_LE | (4U << CCI_REG_WIDTH_SHIFT) | (x))
+#define CCI_REG64_LE(x)			(CCI_REG_LE | (8U << CCI_REG_WIDTH_SHIFT) | (x))
 
 /**
  * cci_read() - Read a value from a single CCI register
-- 
2.34.1

