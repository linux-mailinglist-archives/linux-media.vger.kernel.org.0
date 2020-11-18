Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309DE2B840F
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgKRSrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:47:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37640 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgKRSrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:47:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EB2A81F4499B
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
Subject: [PATCH v3 03/13] media: cedrus: h264: Support profile controls
Date:   Wed, 18 Nov 2020 15:46:50 -0300
Message-Id: <20201118184700.331213-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
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

