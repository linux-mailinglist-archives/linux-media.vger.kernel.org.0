Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179A0482835
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbiAAS2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiAAS2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:20 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86E41C2A;
        Sat,  1 Jan 2022 19:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061699;
        bh=JY2EI5SBxo1VKLIWuKjo2aA/oopc8B5/4cdYuD3mU24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PKHks2BfGo5mYm2FR+fqLDL7jvVx+r8m+VKCbWdnd39C82ko8tVVRMJoIlS2HIdht
         a8T8he/FPQ9TZKk4TzxDJ/oFV4SejeCkk9/2GQW8vJj7nFQJoBvlURGfItFYBZskgk
         lsH61min2v4cJjEvOTRolxh9ONPBOuqJbYUWMJ9w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 08/11] media: i2c: max9286: Define macros for all bits of register 0x15
Date:   Sat,  1 Jan 2022 20:28:03 +0200
Message-Id: <20220101182806.19311-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Macros are easier to read than numerical values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 24c2bf4fda53..4b69bd036ca6 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -80,10 +80,13 @@
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
@@ -525,10 +528,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
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
@@ -810,13 +815,17 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
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

