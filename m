Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568967D9351
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345568AbjJ0JQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345488AbjJ0JQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F8393
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 330DD1B6D;
        Fri, 27 Oct 2023 11:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398197;
        bh=8vPCeSJAsUcw0wuzCsq66l95WAJ2TlPdRm1V5ym+8Ow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f06GH/umW7GdALE2R5Y+ooxCLMyuXVlDvXKiC2xx7BxELBT8mDurpb5vK2eJsNQY+
         TNOv/Oqb0C4iKy9FFVeKJy/tOzGkz9W9rwwfbFAD1Cxc+yEkFWLd6vmgiuW/sG5IGb
         z66rKryYTyDCpBwSmFAu7uqdgxbVgvYguGD0lHik=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v2 5/9] media: atmel-isc: Use accessors for pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:45 +0300
Message-ID: <20231027091649.10553-6-laurent.pinchart@ideasonboard.com>
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
 .../staging/media/deprecated/atmel/atmel-isc-base.c    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 8e26663cecb6..466632485ec7 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -820,6 +820,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 static void isc_try_fse(struct isc_device *isc,
 			struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_rect *try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -841,11 +842,11 @@ static void isc_try_fse(struct isc_device *isc,
 	 * just use the maximum ISC can receive.
 	 */
 	if (ret) {
-		sd_state->pads->try_crop.width = isc->max_width;
-		sd_state->pads->try_crop.height = isc->max_height;
+		try_crop->width = isc->max_width;
+		try_crop->height = isc->max_height;
 	} else {
-		sd_state->pads->try_crop.width = fse.max_width;
-		sd_state->pads->try_crop.height = fse.max_height;
+		try_crop->width = fse.max_width;
+		try_crop->height = fse.max_height;
 	}
 }
 
@@ -857,6 +858,7 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
 	struct v4l2_subdev_state pad_state = {
+		.sd = isc->current_subdev->sd,
 		.pads = &pad_cfg,
 	};
 	struct v4l2_subdev_format format = {
-- 
Regards,

Laurent Pinchart

