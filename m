Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA606E73A3
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjDSHHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDSHHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:07:21 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E9E273C
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888039; x=1713424039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yy/Kwa6S58Mfw3qjphLXJDSZbTwUl9SOBCoucc3b4vs=;
  b=ky1J69dvurZ8LDRmVrn8KDMS9p3G+9x7s+9CDH8D6qEYdIww9LC/dGER
   h+TAeGpt/z5U/XE9T22iGCoWey/fK3nKhVAubsO/583SrMs7d4UojCGKv
   VQF/sp3/yrgsR9VWIdFRo8a5p+f4pu3OGM/qQCcoVGQ55m5AnZFJBFgRt
   ekahM3CwaZkG4oEOU5pruX3gxBhuPh9ecViJvmTeziTbwv/YEt7YuzKWA
   phr7S1yake48z1k6I4iH/7U2Q475+gbMVIV3A0n4OmTk94VAGN+g1NSdK
   0vkQrXLELwShKb8S+1D0EsZHRXIzmn2vMdfJgwHZAm+szbHre31dhJ85Q
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415567"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Apr 2023 09:07:16 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 19 Apr 2023 09:07:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888036; x=1713424036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yy/Kwa6S58Mfw3qjphLXJDSZbTwUl9SOBCoucc3b4vs=;
  b=OmT5FVnIohrrtDbzZx6xps+XTxSo7MOeByr84FGnt/dP7FQU+ItKXGX1
   hKERLb09n2SseUo1SoJOD47HBmzWe7BXepcN4dx8mShLr/0ZHL/WGirQv
   lHjay+69WbjqDGgH+hbDTwyoOwC+oMACCUmPRKyAAhfwccZbm/LGVtLBb
   sYPQE4m0gTe0RIXZxylq+cG1hJ7XpZBtCuNSnsEJD+c4Nri3H1JhUAmsQ
   13ESBRCABaGYsKK77EQgjuNiAcn6XRkvDk1z/VZDJvjPyuJG0y2dgwpyC
   /+RNT9cKHJ7fthJiu8clCIjjl1eA7oH9qHEd2xq3KmA3tJE170z66fxXL
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415566"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 01D7A280072;
        Wed, 19 Apr 2023 09:07:15 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Date:   Wed, 19 Apr 2023 09:07:09 +0200
Message-Id: <20230419070712.1422335-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
References: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
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

There is no need to convert input pixformat to mbus_framefmt and back
again. Instead apply pixformat width constrains directly.
Assign compose values before adjusting pixformat height/width.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v4:
* Added Laurent's r-b

 drivers/media/platform/nxp/imx7-media-csi.c | 22 ++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index b701e823436a8..b149374b07ee1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1145,9 +1145,13 @@ static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
-	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx7_csi_pixfmt *cc;
 
+	if (compose) {
+		compose->width = pixfmt->width;
+		compose->height = pixfmt->height;
+	}
+
 	/*
 	 * Find the pixel format, default to the first supported format if not
 	 * found.
@@ -1172,13 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		}
 	}
 
-	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	/*
+	 * Round up width for minimum burst size.
+	 *
+	 * TODO: Implement configurable stride support, and check what the real
+	 * hardware alignment constraint on the width is.
+	 */
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+			      &pixfmt->height, 1, 0xffff, 1, 0);
 
-	if (compose) {
-		compose->width = fmt_src.width;
-		compose->height = fmt_src.height;
-	}
+	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
+	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
 
 	return cc;
 }
-- 
2.34.1

