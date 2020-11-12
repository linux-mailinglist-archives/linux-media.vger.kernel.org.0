Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDF62B0487
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 12:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgKLL5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 06:57:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60938 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgKLL5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 06:57:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5836F1F462EA
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
Subject: [PATCH 1/5] media: rkvdec: h264: Support profile and level controls
Date:   Thu, 12 Nov 2020 08:57:10 -0300
Message-Id: <20201112115714.48081-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112115714.48081-1-ezequiel@collabora.com>
References: <20201112115714.48081-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.

Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
driver for the list of supported profiles and level.

For now, we don't expose 4:2:2 since the driver doesn't
implement the required support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[Ezequiel: Don't expose 4:2:2 profile for now]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 552e0bd12ecf..fe65f55d3b49 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -82,6 +82,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
 	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+	},
 };
 
 static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
-- 
2.27.0

