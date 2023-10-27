Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE267D9353
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjJ0JQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345570AbjJ0JQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C538C0
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B723B1B3C;
        Fri, 27 Oct 2023 11:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398199;
        bh=e+QdVkhFUp7mQJDdJFWm72JJ5LiXEw/UOLs1TAvBoic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HiBZhdH7WOXzVhzPHYDPD8JBFBFuYqGC9iQDaoxeji0Wfxvq3mWOvRnh7NuKtCdtI
         FqQVTIXL8g49bY4U2ShDdp32Dx1VfcjG9oXQ1UnXrObA4bxfq8e+xhEUQsemt72/aX
         2ox8tX9pmSgIVRx0pJtLMbu1M7kbrm5v+NOtk+84=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 7/9] media: tegra-video: Use accessors for pad config 'try_*' fields
Date:   Fri, 27 Oct 2023 12:16:47 +0300
Message-ID: <20231027091649.10553-8-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 94171e62dee9..bc12a564e54f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -439,6 +439,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.target = V4L2_SEL_TGT_CROP_BOUNDS,
 	};
+	struct v4l2_rect *try_crop;
 	int ret;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
@@ -473,24 +474,25 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	 * Attempt to obtain the format size from subdev.
 	 * If not available, try to get crop boundary from subdev.
 	 */
+	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
 		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
-			sd_state->pads->try_crop.width = 0;
-			sd_state->pads->try_crop.height = 0;
+			try_crop->width = 0;
+			try_crop->height = 0;
 		} else {
 			ret = v4l2_subdev_call(subdev, pad, get_selection,
 					       NULL, &sdsel);
 			if (ret)
 				return -EINVAL;
 
-			sd_state->pads->try_crop.width = sdsel.r.width;
-			sd_state->pads->try_crop.height = sdsel.r.height;
+			try_crop->width = sdsel.r.width;
+			try_crop->height = sdsel.r.height;
 		}
 	} else {
-		sd_state->pads->try_crop.width = fse.max_width;
-		sd_state->pads->try_crop.height = fse.max_height;
+		try_crop->width = fse.max_width;
+		try_crop->height = fse.max_height;
 	}
 
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
-- 
Regards,

Laurent Pinchart

