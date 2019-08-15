Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B318EE8F
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733119AbfHOOpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:04 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33737 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733098AbfHOOpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzthYZOm; Thu, 15 Aug 2019 16:45:01 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 05/12] media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Thu, 15 Aug 2019 16:44:49 +0200
Message-Id: <20190815144456.54583-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFme2n57nAKbPhAyrj7hQg0HSZEodKdCQ9T7onUMIgK2Iln5OZAksLz2HRZ0gIq0/fixp2yLuIqFbDirsCL7E5a9jwlvPaHIRmOCHmZQudYhVbJcepuH
 CRZ4whejOJQg6egcDun9ni9ycewgXgb7F0pKt9U1hQjcQGf7tT60IFJw4BKP4l6i2hT45+dViFUsgIAUBOTZpSMmLqRIypJiSJ202hdULTh1B9+7m1UtOYZO
 gxGXms6dBRQn2bUjBOaWm3OKDjjI58n89XRdAJt2kmARE2lFH+nF+0OOGSitzQjBWekkC38Ma6NIi9vsQN8/t+K9BF/IdGMMTXIWUGd4k+2QhThFNdW6fAtg
 fBu4JqAoocZHZxoSJbibZqKws9n4yKRPACOqXT9dJq+VEjHjp+NCQeYKvsAn3M/ezyw9/rCIrB6bTESkcWVeNaAlhj5w7g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the mtk-vcodec decoder supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
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

