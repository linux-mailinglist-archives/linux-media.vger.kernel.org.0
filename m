Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE1DC72D8C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbfGXL20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:28:26 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57623 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727310AbfGXL20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:28:26 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFRUh3sccLqASqFRYhNLFa; Wed, 24 Jul 2019 13:28:24 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/14] media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Wed, 24 Jul 2019 13:27:09 +0200
Message-Id: <20190724112716.30288-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
References: <20190724112716.30288-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFC498lD+po9WiMzrYXpfJgSvpvSxWWE0u59aoSJULnLkPmdCLDJZQDe7WcLbZxR3JsGfFfEpMNaUo76rDK1yFe5MszJq3Yb0mgG8+7nsaPeU43XkMEf
 BsiEcuAlX1owM1KBW6G1QTCLP7AfVIAShXTj+nMfZXsuAWSVJWigUZmnZ/0fUSopzzd/2VUMho6tkFMlZu2cN4gT+ufJ0IK1GHe+qNaAWXvyrEcN0yjARAzM
 HVFaNI3MWkXs3F5hfwkwsg==
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

