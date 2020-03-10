Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 530A9180B28
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 23:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgCJWFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 18:05:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgCJWFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 18:05:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9182D5F;
        Tue, 10 Mar 2020 23:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583877911;
        bh=qtf5CtWwzL4eef3leSfCzkSfu9FPLFJTb62oHfkQJM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CHJTbbWco1ivFV3VcaR4Hf/LAX/25DuhbJa/oHaE1LEh0/2Vlhlb+N6wKebBGOJCi
         1hoHCIY1Dw+S7SQBk3w70dDIG6o4+P8ZlGZLr3lrNI7TsxhfTfEDZOY3dGyHoYwGqU
         UYHX2jyDsJ90wKuuNfJWre42BjnfJw5KdVJjN9+Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 9/8] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_pix_fmt
Date:   Wed, 11 Mar 2020 00:05:05 +0200
Message-Id: <20200310220505.25322-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_mbus_fmt_to_pix_fmt() function doesn't need to modify its
mbus argument. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 drivers/staging/media/imx/imx-media.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 06415c8f707e..6cb2122d5f3f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -566,7 +566,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index cd80f1c59a5c..bb73a76eea84 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -177,7 +177,7 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 				    struct v4l2_mbus_framefmt *mbus);
-- 
Regards,

Laurent Pinchart

