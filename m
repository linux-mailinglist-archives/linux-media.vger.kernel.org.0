Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C66308A742
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 21:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfHLTgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 15:36:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60142 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfHLTgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 15:36:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CDB222854FE
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
Subject: [PATCH v5 07/11] media: cedrus: Specify H264 startcode and decoding mode
Date:   Mon, 12 Aug 2019 16:35:18 -0300
Message-Id: <20190812193522.10911-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812193522.10911-1-ezequiel@collabora.com>
References: <20190812193522.10911-1-ezequiel@collabora.com>
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
Changes in v5:
* Clarify commit log.
Changes in v4:
* New patch.
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7bdc413bf727..10be2bd9507e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,26 @@ static const struct cedrus_control cedrus_controls[] = {
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE,
+			.max	= V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
+			.def	= V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING),
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= false,
+	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_STARTCODE,
+			.max	= V4L2_MPEG_VIDEO_H264_NO_STARTCODE,
+			.def	= V4L2_MPEG_VIDEO_H264_NO_STARTCODE,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE),
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= false,
+	},
 };
 
 #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
-- 
2.22.0

