Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5778F2C5162
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389554AbgKZJg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730660AbgKZJgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:36:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD66C0613D4;
        Thu, 26 Nov 2020 01:36:55 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B81561F450FA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 04/14] media: cedrus: h264: Support profile controls
Date:   Thu, 26 Nov 2020 06:36:08 -0300
Message-Id: <20201126093618.137292-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cedrus supports H.264 profiles from Baseline to High,
except for the Extended profile

Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE so that
userspace can query the driver for the supported
profiles and levels.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 9a102b7c1bb9..97000f0e0011 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -103,6 +103,25 @@ static const struct cedrus_control cedrus_controls[] = {
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
 	},
+	/*
+	 * We only expose supported profiles information,
+	 * and not levels as it's not clear what is supported
+	 * for each hardware/core version.
+	 * In any case, TRY/S_FMT will clamp the format resolution
+	 * to the maximum supported.
+	 */
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			.min	= V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+			.def	= V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+			.max	= V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			.menu_skip_mask =
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= false,
+	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
-- 
2.27.0

