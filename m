Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF5572D8B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfGXL20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:28:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49633 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727083AbfGXL2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:28:25 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qFRUh3sccLqASqFRYhNLFI; Wed, 24 Jul 2019 13:28:24 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/14] media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Wed, 24 Jul 2019 13:27:07 +0200
Message-Id: <20190724112716.30288-6-hverkuil-cisco@xs4all.nl>
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

Tag all the coded formats where the venus vdec supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 9ab95fd57760..6c243309df4b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -46,6 +46,7 @@ struct venus_format {
 	u32 pixfmt;
 	unsigned int num_planes;
 	u32 type;
+	u32 flags;
 };
 
 #define MAX_PLANES		4
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e1f998656c07..380e8d1682e2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -37,42 +37,52 @@ static const struct venus_format vdec_formats[] = {
 		.pixfmt = V4L2_PIX_FMT_MPEG4,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_MPEG2,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_H263,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_G,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_VC1_ANNEX_L,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_H264,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_VP8,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_VP9,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_XVID,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
 		.pixfmt = V4L2_PIX_FMT_HEVC,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
 	},
 };
 
@@ -351,6 +361,7 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;
 
 	f->pixelformat = fmt->pixfmt;
+	f->flags = fmt->flags;
 
 	return 0;
 }
-- 
2.20.1

