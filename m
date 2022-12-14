Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624E764D396
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiLNXiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiLNXio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C954531EF7;
        Wed, 14 Dec 2022 15:38:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 451CF4D5;
        Thu, 15 Dec 2022 00:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061121;
        bh=mPDc5fueMR/z+QXlh/2Bg51nqBbf2AdRpGqnc+DJO+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lfn1i1n3qQYLLnIz5IgxVDUXrr6B+xq4XdviNs9hVLKJX3sCUwOynv/W9uSTf7X3v
         z3WRf6xk6RX+o0MAKJ0U1x0gtpPs4nlTyd9AP4xgwzq4G9Qdj5X9D3xV9i/+9D8qMU
         /LRfy+7B6hKhVwOfR5wGkGTHTDX79M2HXoOZst8I=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 08/12] media: i2c: max9286: Define macros for all bits of register 0x15
Date:   Thu, 15 Dec 2022 01:38:21 +0200
Message-Id: <20221214233825.13050-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Macros are easier to read than numerical values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 3f1228c5053b..e78456c8d24c 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -81,10 +81,13 @@
 #define MAX9286_DATATYPE_RGB565		(1 << 0)
 #define MAX9286_DATATYPE_RGB888		(0 << 0)
 /* Register 0x15 */
+#define MAX9286_CSI_IMAGE_TYP		BIT(7)
 #define MAX9286_VC(n)			((n) << 5)
 #define MAX9286_VCTYPE			BIT(4)
 #define MAX9286_CSIOUTEN		BIT(3)
-#define MAX9286_0X15_RESV		(3 << 0)
+#define MAX9286_SWP_ENDIAN		BIT(2)
+#define MAX9286_EN_CCBSYB_CLK_STR	BIT(1)
+#define MAX9286_EN_GPI_CCBSYB		BIT(0)
 /* Register 0x1b */
 #define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
 #define MAX9286_ENEQ(n)			(1 << (n))
@@ -529,10 +532,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
 		return;
 
 	/*
-	 * Video format setup:
-	 * Disable CSI output, VC is set according to Link number.
+	 * Video format setup: disable CSI output, set VC according to Link
+	 * number, enable I2C clock stretching when CCBSY is low, enable CCBSY
+	 * in external GPI-to-GPO mode.
 	 */
-	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
+	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_EN_CCBSYB_CLK_STR |
+		      MAX9286_EN_GPI_CCBSYB);
 
 	/* Enable CSI-2 Lane D0-D3 only, DBL mode. */
 	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
@@ -814,13 +819,17 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		}
 
 		/*
-		 * Enable CSI output, VC set according to link number.
-		 * Bit 7 must be set (chip manual says it's 0 and reserved).
+		 * Configure the CSI-2 output to line interleaved mode (W x (N
+		 * x H), as opposed to the (N x W) x H mode that outputs the
+		 * images stitched side-by-side) and enable it.
 		 */
-		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
-			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
+		max9286_write(priv, 0x15, MAX9286_CSI_IMAGE_TYP | MAX9286_VCTYPE |
+			      MAX9286_CSIOUTEN | MAX9286_EN_CCBSYB_CLK_STR |
+			      MAX9286_EN_GPI_CCBSYB);
 	} else {
-		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
+		max9286_write(priv, 0x15, MAX9286_VCTYPE |
+			      MAX9286_EN_CCBSYB_CLK_STR |
+			      MAX9286_EN_GPI_CCBSYB);
 
 		/* Stop all cameras. */
 		for_each_source(priv, source)
-- 
Regards,

Laurent Pinchart

