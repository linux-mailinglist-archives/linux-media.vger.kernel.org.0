Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50C56E5A2E
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 09:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjDRHOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 03:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjDRHOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 03:14:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6477F1BFD
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802091; x=1713338091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1LBMrWhnNp6GUM6Z+YxFtJgIM77IK2VB5D8IaBgDDtc=;
  b=DKNvuHs3yUNBVgXNKfqPmDbHNYL3ooUAFW5tefgDSd0kXD/cpDeOO12Z
   I5BddM+fDHA7618AWqax567eX65fcrcGhqYQnVIUB8i8rDuXJvdZntWkr
   lHmGbRFX8FvJiscW7G3Y7KW21jByuLtrOtBfucDbtgzpE4yd7I6xEaeL2
   tlOHjw3LuP1xQZmRm0AdCZri3cWN2ONNat9mWWeoDmhj6WGXVsU/eYX94
   eURjnfP/1AmGd89xmb0r9JsRqWJimFMaglBMMNM/1felKfa+1CMKBPE44
   Bkxh87thVVytZ+XuJhjrNPbpQcNLvpsAo+V/nO9ltn8/0e85O9Xij+wN4
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385553"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 09:14:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 09:14:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 09:14:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681802086; x=1713338086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1LBMrWhnNp6GUM6Z+YxFtJgIM77IK2VB5D8IaBgDDtc=;
  b=di5EfUCIWmp3wqPRtOdf0ivso9vRA3948K+suBhs+ZgcH2JCTRTx+fEe
   IdXjtERUMxOdeP/MYgJ3aANIUcSmemXKgKqGXjeTkwlIksc4td3nzNwCb
   ETbzA0l7mSkkKnel91hckEZhSMSVX0Nd0meODDd9QPbdb3cKEnOQH53vE
   tmoWdTmAW19OF5/JRjivLt1KIyATa5YFeaGrj4hi7wN8k7zo8B/KwXr/R
   b71y5SIZ/baOgLQ4nYDTsiqttB8IknckHHEVWW51IMy6eCQ9xxmBCa9uU
   /JVP+5e0hCqBR3Z48EtTKIatmi/IPXD/QvhxcwZf9Y3Vk7h4Kx93be4zo
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30385551"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 09:14:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 98C66280072;
        Tue, 18 Apr 2023 09:14:46 +0200 (CEST)
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
Subject: [PATCH v2 1/3] media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Date:   Tue, 18 Apr 2023 09:14:37 +0200
Message-Id: <20230418071439.197735-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
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
again. Instead apply pixformat width contrains directly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index b701e823436a8..bd649fd9166fd 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1145,8 +1145,8 @@ static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
-	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx7_csi_pixfmt *cc;
+	u32 stride;
 
 	/*
 	 * Find the pixel format, default to the first supported format if not
@@ -1172,12 +1172,16 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 		}
 	}
 
-	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+			      &pixfmt->height, 1, 0xffff, 1, 0);
+
+	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);
+	pixfmt->bytesperline = stride;
+	pixfmt->sizeimage = stride * pixfmt->height;
 
 	if (compose) {
-		compose->width = fmt_src.width;
-		compose->height = fmt_src.height;
+		compose->width = pixfmt->width;
+		compose->height = pixfmt->height;
 	}
 
 	return cc;
-- 
2.34.1

