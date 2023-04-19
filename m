Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D123E6E73A6
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbjDSHH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjDSHHY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:07:24 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BC82710
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681888043; x=1713424043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3o1/ma89daUDddWkyBxC7A/MJ6L/SjM7+gDduhH0vmE=;
  b=LAqZoVWrSdemJrQtannnm1tokvVotZoT5epUUPdmwd5NPltuQQrY1qGc
   jG3KQip3uUUgyqw08lT5oaVOzVmWDWgY+AOIk96or61jmc6M3pn9bT12D
   RbAd2ZQ4amcy5cLv1vDD8HoqL5Z3x4dzxmun7qwbjGhLE/HpNUBD9xq5K
   FcorC2BJ3pwah80U+OHJIjTcLNbiEOAG7XkN8GhLdTadYZlbpTj4eop00
   FrvA8k+BGxTi/swluXCLfz0gk1U9cqVE6p7bHJfiG4RCCuLnbZ7gL4ank
   BLo9Ew283sH3gHGNt8iTPFQFik9Ts1cNrKR7XyT2BO8iepStQ5Athzzfe
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415573"
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
  bh=3o1/ma89daUDddWkyBxC7A/MJ6L/SjM7+gDduhH0vmE=;
  b=FQUUPwQOskgTmR4wiVAfBrvhPPRuQENWDYswW+PueLgDw8Sqw8Xl21X7
   o/DqeeKjVMxkGJwNm7FuDuUhxyTaTqWd/4QUMmHATxuVSm1VksdbfqRBf
   jVLxhUdyF7xuX/WL5QAOoOU4oS20OUvewQ9KXf8BLLpB2AMUADcdbUPau
   yZf2dlwmc5Bjd4x4ItmJ3Q75weoyoenfNssDSn90Am+h5PWtbJAnle2Ho
   /A2V2TFP7V2Ncx6iCyrls+C2nyt8bKFVN9z1mJcSyfrrb0Jnf3bfcEf1c
   A1qCSxqyOEUym/piZ1ODUyL7zGdWN05cirCrypUv7DbOkXJNCm+vzETkY
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415572"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:07:16 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 92760280056;
        Wed, 19 Apr 2023 09:07:16 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 4/4] media: imx: imx7-media-csi: Init default format with __imx7_csi_video_try_fmt()
Date:   Wed, 19 Apr 2023 09:07:12 +0200
Message-Id: <20230419070712.1422335-5-alexander.stein@ew.tq-group.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Use the __imx7_csi_video_try_fmt() helper function to initialize the
default format at probe time. This improves consistency by using the
same code path for both default initialization and validation at
runtime, and allows dropping the now unused imx7_csi_find_pixel_format()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* None

 drivers/media/platform/nxp/imx7-media-csi.c | 55 +++------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index e6abbfbc5c129..0bd2613b9320f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1014,39 +1014,6 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
 	return -EINVAL;
 }
 
-static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-					const struct v4l2_mbus_framefmt *mbus,
-					const struct imx7_csi_pixfmt *cc)
-{
-	u32 width;
-	u32 stride;
-
-	if (!cc) {
-		cc = imx7_csi_find_mbus_format(mbus->code);
-		if (!cc)
-			return -EINVAL;
-	}
-
-	/* Round up width for minimum burst size */
-	width = round_up(mbus->width, 8);
-
-	/* Round up stride for IDMAC line start address alignment */
-	stride = round_up((width * cc->bpp) >> 3, 8);
-
-	pix->width = width;
-	pix->height = mbus->height;
-	pix->pixelformat = cc->fourcc;
-	pix->colorspace = mbus->colorspace;
-	pix->xfer_func = mbus->xfer_func;
-	pix->ycbcr_enc = mbus->ycbcr_enc;
-	pix->quantization = mbus->quantization;
-	pix->field = mbus->field;
-	pix->bytesperline = stride;
-	pix->sizeimage = stride * pix->height;
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * Video Capture Device - IOCTLs
  */
@@ -1603,22 +1570,14 @@ static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 	return buf;
 }
 
-static int imx7_csi_video_init_format(struct imx7_csi *csi)
+static void imx7_csi_video_init_format(struct imx7_csi *csi)
 {
-	struct v4l2_mbus_framefmt format = { };
-
-	format.code = IMX7_CSI_DEF_MBUS_CODE;
-	format.width = IMX7_CSI_DEF_PIX_WIDTH;
-	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
-	format.field = V4L2_FIELD_NONE;
+	struct v4l2_pix_format *pixfmt = &csi->vdev_fmt;
 
-	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
-	csi->vdev_compose.width = format.width;
-	csi->vdev_compose.height = format.height;
+	pixfmt->width = IMX7_CSI_DEF_PIX_WIDTH;
+	pixfmt->height = IMX7_CSI_DEF_PIX_HEIGHT;
 
-	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
-
-	return 0;
+	csi->vdev_cc = __imx7_csi_video_try_fmt(pixfmt, &csi->vdev_compose);
 }
 
 static int imx7_csi_video_register(struct imx7_csi *csi)
@@ -1631,9 +1590,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 	vdev->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = imx7_csi_video_init_format(csi);
-	if (ret < 0)
-		return ret;
+	imx7_csi_video_init_format(csi);
 
 	/* Register the video device. */
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-- 
2.34.1

