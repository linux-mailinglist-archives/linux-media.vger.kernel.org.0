Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94C8D89C45
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfHLLFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:05:20 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50213 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727981AbfHLLFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:05:19 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x88XhQAyTur8Tx88chi11A; Mon, 12 Aug 2019 13:05:18 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 03/12] media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Mon, 12 Aug 2019 13:05:04 +0200
Message-Id: <20190812110513.23774-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDRv5jbgUAiVk0jpFvYjwj97C4WdO/qhGKfS4rRlt1tQ00u/EadhKZypAT5d3IIVBop0Yes7I9V+7rYquh9uyqTLdHIqtDOFtB4Ax1x4n1ITUOo/4ZMf
 FTQ6GjZ7emIzhqZPAxLLEx02QTUVLyjtzgRUkR8nle4EUewS/Si7eSxh7ItEyP9279Qofv3k7LS42HlBz1yjEFa1pxG/IK/8H3zD4TeuwPwktrxRLBkSLuwb
 +CqII/Y2dvA6UkZ8nusabdWMQH9ll1L0AatwykHRaC1oJWWmOxHP2QQ8xkIdUcTj
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
index 959eaa550f4e..922cb7e64bfa 100644
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
index 0b7d65db5cdc..7f4660555ddb 100644
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
 
@@ -379,6 +389,7 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;
 
 	f->pixelformat = fmt->pixfmt;
+	f->flags = fmt->flags;
 
 	return 0;
 }
-- 
2.20.1

