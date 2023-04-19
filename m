Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C876E73A4
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjDSHHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjDSHHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:07:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5702710
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888041; x=1713424041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dmsT6bzUJE5AO5KsR1Jym8hUjW8jCA6HQen9rKtepnU=;
  b=qdhXXSagp2Tq/CFVXcM3PkhekwjC+hOJPKYTzXf9KmbKsRXs8mBTECRD
   rFslbGboJ/Vui3/6WQL/ayZ+qg112g/brKbFOmqdqMBgd4Lbuj+DMF0FU
   u7IRYmjG9C913l3jBVQBiRDbDwqsjluPdmvs9h1ae4DBso/0xq6LD8gPu
   Nb7+dBDhYhoFL+ydU0NzVd7LuBQlh2W3vfAkN6bmQdysIj5+De6Gi7e6E
   5iJ+xA1ssV3mdi7bxB19UDZuFDRPLejd0JMnEOUpN3kzHzQSs/d/EVeG0
   6plW7Kz0YR69xR682os9/o0ljPUHYcqHOGofOzR2PAMIJz/v/h1VqFUtz
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415569"
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
  bh=dmsT6bzUJE5AO5KsR1Jym8hUjW8jCA6HQen9rKtepnU=;
  b=mMldpGvRGt+jV4WJwoTY7w/e0KMsK6EIEoDWquK0xKFJNoACmFczBXOA
   QrFZME4GsaQQ38vadNk8WGIiCuhPfVRr/67/2FlK5EPNkn1ibUPV+hVs3
   BX+w7d9gJWc/sROLuiIRKhlwJ5CJ6Rx9TjGvVY5GDDRs3uGo7wbGdP+F+
   WFmx8+uP2kPH6yj0SBFvFclwtSghqdBbROPgWQhwieJAlwsPhaDNmUjDD
   QHkRN5uHhQPuIMyyZHwRLgOgbnAmpI3pnQ0/9nHLvJrpI1UWTcTOm3vt9
   ewftTi6pyVcCAhEfxJjJeVA4YjxF8ZmFDCr5BiwrQU6zsWNGX8E1KQOVI
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415568"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 32603280056;
        Wed, 19 Apr 2023 09:07:16 +0200 (CEST)
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
Subject: [PATCH v4 2/4] media: imx: imx7-media-csi: Remove incorrect interlacing support
Date:   Wed, 19 Apr 2023 09:07:10 +0200
Message-Id: <20230419070712.1422335-3-alexander.stein@ew.tq-group.com>
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

The driver doesn't currently support interlacing, but due to legacy
leftovers, it accepts values for the pixel format "field" field other
than V4L2_FIELD_NONE. Fix it by hardcoding V4L2_FIELD_NONE. Proper
interlacing support can be implemented later if desired.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v4:
* Improve commit message
* Added Laurent's r-b

 drivers/media/platform/nxp/imx7-media-csi.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index b149374b07ee1..1315f5743b76f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1162,20 +1162,6 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	}
 
-	/* Allow IDMAC interweave but enforce field order from source. */
-	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
-		switch (pixfmt->field) {
-		case V4L2_FIELD_SEQ_TB:
-			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
-			break;
-		case V4L2_FIELD_SEQ_BT:
-			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
-			break;
-		default:
-			break;
-		}
-	}
-
 	/*
 	 * Round up width for minimum burst size.
 	 *
@@ -1187,6 +1173,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
+	pixfmt->field = V4L2_FIELD_NONE;
 
 	return cc;
 }
-- 
2.34.1

