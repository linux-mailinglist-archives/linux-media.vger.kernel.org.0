Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A842B0489
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 12:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgKLL5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 06:57:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60954 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgKLL5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 06:57:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D3BD31F462E9
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
Subject: [PATCH 2/5] media: cedrus: h264: Support profile control
Date:   Thu, 12 Nov 2020 08:57:11 -0300
Message-Id: <20201112115714.48081-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112115714.48081-1-ezequiel@collabora.com>
References: <20201112115714.48081-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cedrus supports H.264 profiles from Baseline to High,
except for the Extended profile.

Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE so that userspace
can query the driver for the list of supported profiles.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 9a102b7c1bb9..c40ad0782410 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -103,6 +103,18 @@ static const struct cedrus_control cedrus_controls[] = {
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
 	},
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

