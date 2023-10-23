Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E087D41CE
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 23:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjJWVkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 17:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjJWVkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 17:40:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EB0D7C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 14:40:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8637F128D;
        Mon, 23 Oct 2023 23:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698097200;
        bh=/24r3vzVx6+4XIBpQ0hnlm+waaPRYRKvndAoHGcjuuE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iHweXsKXZ68s8xtcYEW0kBw39bTwjDF+wtseyMaNkxkwgP5CdjmoKKEf+Xn4CTt5a
         JvegqUuIn9HKcSmrojqHGZHPgfoY1ZyxPPPgJ/Soj+/dyBjeBkDVD42B2ijJKBzRde
         aM3TT5L04P3Dvp9hYdTGTkCQnf5QWxuaQxIlACZw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 5/7] media: tegra-video: Use accessors for pad config 'try_*' fields
Date:   Tue, 24 Oct 2023 00:40:09 +0300
Message-ID: <20231023214011.17730-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'try_*' fields of the v4l2_subdev_pad_config structure are meant to
be accessed through helper functions. Replace direct access with usage
of the v4l2_subdev_get_pad_format(), v4l2_subdev_get_pad_crop() and
v4l2_subdev_get_pad_compose() helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/tegra-video/vi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 94171e62dee9..a2f21c70a5bc 100644
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
+	try_crop = v4l2_subdev_get_pad_crop(subdev, sd_state, 0);
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

