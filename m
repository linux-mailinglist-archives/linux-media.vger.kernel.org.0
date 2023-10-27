Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3D37D9350
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345559AbjJ0JQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345488AbjJ0JQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BF393
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4D0EF2;
        Fri, 27 Oct 2023 11:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398196;
        bh=ENmkQZHA1Ktcpf7JbXTgvB/mo046wdYnsl+cxJsb2d0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YUka5RMHUh9lAfHTA3xd5SV6kjkvwGTIUoCyjioDheCtblzQrYUVURUIEQj8hGFfb
         XBLMMzrB50oj4Gf4IKXfgZQitGNjBoFNSX/6AAWVZlOuk1IwEAgm26zuCs1Fy+rmku
         fYsbdZ7nUeGliJoWfzIKImLzBYWOQJURMF/MTTJg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2 4/9] media: atmel-isi: Use accessors for pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:44 +0300
Message-ID: <20231027091649.10553-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'try_*' fields of the v4l2_subdev_pad_config structure are meant to
be accessed through helper functions. Replace direct access with usage
of the v4l2_subdev_state_get_format(), v4l2_subdev_state_get_crop() and
v4l2_subdev_state_get_compose() helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 4046212d48b4..ed70c030858d 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -559,11 +559,13 @@ static const struct isi_format *find_format_by_fourcc(struct atmel_isi *isi,
 static void isi_try_fse(struct atmel_isi *isi, const struct isi_format *isi_fmt,
 			struct v4l2_subdev_state *sd_state)
 {
-	int ret;
+	struct v4l2_rect *try_crop =
+		v4l2_subdev_state_get_crop(sd_state, 0);
 	struct v4l2_subdev_frame_size_enum fse = {
 		.code = isi_fmt->mbus_code,
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
+	int ret;
 
 	ret = v4l2_subdev_call(isi->entity.subdev, pad, enum_frame_size,
 			       sd_state, &fse);
@@ -572,11 +574,11 @@ static void isi_try_fse(struct atmel_isi *isi, const struct isi_format *isi_fmt,
 	 * just use the maximum ISI can receive.
 	 */
 	if (ret) {
-		sd_state->pads->try_crop.width = MAX_SUPPORT_WIDTH;
-		sd_state->pads->try_crop.height = MAX_SUPPORT_HEIGHT;
+		try_crop->width = MAX_SUPPORT_WIDTH;
+		try_crop->height = MAX_SUPPORT_HEIGHT;
 	} else {
-		sd_state->pads->try_crop.width = fse.max_width;
-		sd_state->pads->try_crop.height = fse.max_height;
+		try_crop->width = fse.max_width;
+		try_crop->height = fse.max_height;
 	}
 }
 
@@ -587,6 +589,7 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
 	struct v4l2_subdev_state pad_state = {
+		.sd = isi->entity.subdev,
 		.pads = &pad_cfg,
 	};
 	struct v4l2_subdev_format format = {
-- 
Regards,

Laurent Pinchart

