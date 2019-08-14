Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 599E08DE56
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbfHNUEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:04:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57602 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729366AbfHNUEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:04:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7165C28CB6B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 07/11] media: cedrus: Specify H264 startcode and decoding mode
Date:   Wed, 14 Aug 2019 16:59:27 -0300
Message-Id: <20190814195931.6587-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814195931.6587-1-ezequiel@collabora.com>
References: <20190814195931.6587-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cedrus VPU is slice-based and expects V4L2_PIX_FMT_H264_SLICE
buffers to contain H264 slices with no start code.

Expose this to userspace with the newly added menu control.

These two controls are specified as mandatory for applications,
but we mark them as non-required on the driver side for
backwards compatibility.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes in v6:
* Adjust to control renames.
Changes in v5:
* Clarify commit log.
Changes in v4:
* New patch.
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7bdc413bf727..69a836aa11ef 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,26 @@ static const struct cedrus_control cedrus_controls[] = {
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
+			.max	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
+			.def	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED),
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= false,
+	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_START_CODE,
+			.max	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
+			.def	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B),
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= false,
+	},
 };
 
 #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
-- 
2.22.0

