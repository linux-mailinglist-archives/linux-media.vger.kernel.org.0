Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B46989C52
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbfHLLGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:06:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37483 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728063AbfHLLGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:06:23 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x89ahQBOrur8Tx89ehi1B3; Mon, 12 Aug 2019 13:06:22 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 05/12] media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Mon, 12 Aug 2019 13:05:06 +0200
Message-Id: <20190812110513.23774-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPu23OXeS15F2EkCTq1OrLKNd/gcIGjdDbmTFq0LSO4sDjpPv0IE0hhOdx/TS34PPlhAMB2HAZmnqGgQOm5NvkJQf0SdVrhWjB/2q7cIbc+9nScNI+SL
 fDx9K8qV4aWOcdImMkyl8GtkCzop59FXww7IZO0YZY2ZPEKPLMb6IDClrVzU+/5HlVZGtFQQ22i4x+OyhG6MpxNZ1b+GS0uJnXetE4F6RVDG7VWe2oKQvEfv
 5MZ0Qv6+v8Kw+UDOva25L03A3fR4L8C0MRlIdFyFWpB1W7eLSE6C8dWSMicsXgBF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the mtk-vcodec decoder supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 90d1a67db7e5..26a55c3e807e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -29,16 +29,19 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP8,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9,
 		.type = MTK_FMT_DEC,
 		.num_planes = 1,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_MT21C,
@@ -948,6 +951,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
 
 	fmt = &mtk_video_formats[i];
 	f->pixelformat = fmt->fourcc;
+	f->flags = fmt->flags;
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index c95de5d08dda..9fd56dee7fd1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -99,6 +99,7 @@ struct mtk_video_fmt {
 	u32	fourcc;
 	enum mtk_fmt_type	type;
 	u32	num_planes;
+	u32	flags;
 };
 
 /**
-- 
2.20.1

