Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3FD6E73A5
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjDSHH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjDSHHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:07:23 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C5F2D71
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888042; x=1713424042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fL8PZNABlAgAhG80OdCGVSVIWgAQMIfpGqcXZCETe8g=;
  b=WkXsLepQRV2aBYORfOsv/0cDxEMolACBi9TtOe+Sz3gvU53ehjwIKT9q
   PlUPKTAzNx0cHaUEC3VQ9yHdbR/blFV1jnMrUiffmyGtFXSkBw4LJnGeX
   Vepd9jZK1BNCLbwQsRa/zJ0+DiIPGngrZaLNlAgnyEF6PHGiUAw0wf3oU
   1dVKak+gO8eKvhYj2/Py/xUJjM3FR4Ac4cheCdum6wyKo66oU+xh8SEQl
   ztBlPj9Tad+ivXOHN7lAYg5flC5Ov5AiEiWcH9rDEs74WdExNrMkQ3QTf
   J6Tbqh5JyboEHif7Q0Zvnu71ThFhVNeY3YmayIDq/7YQ4jV3Aus/RXA7p
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415571"
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
  bh=fL8PZNABlAgAhG80OdCGVSVIWgAQMIfpGqcXZCETe8g=;
  b=RjVFZatqBRUG2zsfv+3bxBYq9etL3WfdqccFc+yovnuKT1kAwvZ6BX0G
   8sPirsiY7WhR2hfeCYdAjpjzsMiQSwkptNhtVech8FdkoHejKuUBQej83
   n5ZE9Qn+S3TX2qdbEMp9LcFCrcIduPr1w+usx40ljua6UwufwS8cLDnVw
   4FuJGGbh+i4MqhqILKCKS6ZjZCGRnW8p+QNPmcqdOYNLgenlbtNYvrTrZ
   rF/DtPamfEPwKDSkuD69REOvCr8jbJMXs6+fwOBTLy+JffQcLAN+6YIax
   D9gknra4qr0Wdk0ONYJ0hz+ww2cygivXc7SgVasQQIG/lxKS7BC0mEwh5
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415570"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6183E280072;
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
Subject: [PATCH v4 3/4] media: imx: imx7-media-csi: Relax width constraints for non-8bpp formats
Date:   Wed, 19 Apr 2023 09:07:11 +0200
Message-Id: <20230419070712.1422335-4-alexander.stein@ew.tq-group.com>
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

The driver unconditionally aligns the image width to multiples of 8
pixels. The real alignment constraint is 8 bytes, as indicated by the
CSI_IMAG_PARA.IMAGE_WIDTH documentation that calls for 8 pixel alignment
for 8bpp formats and 4 pixel alignment for other formats.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Improve commit message
* Simplify walign calculation
* Remove comment on hardware alignment constraints

 drivers/media/platform/nxp/imx7-media-csi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 1315f5743b76f..e6abbfbc5c129 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1146,6 +1146,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 			 struct v4l2_rect *compose)
 {
 	const struct imx7_csi_pixfmt *cc;
+	u32 walign;
 
 	if (compose) {
 		compose->width = pixfmt->width;
@@ -1163,12 +1164,13 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	}
 
 	/*
-	 * Round up width for minimum burst size.
+	 * The width alignment is 8 bytes as indicated by the
+	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
 	 *
-	 * TODO: Implement configurable stride support, and check what the real
-	 * hardware alignment constraint on the width is.
+	 * TODO: Implement configurable stride support.
 	 */
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
+	walign = 8 * 8 / cc->bpp;
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
 			      &pixfmt->height, 1, 0xffff, 1, 0);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
-- 
2.34.1

