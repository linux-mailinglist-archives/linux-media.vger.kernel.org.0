Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5508EE8D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbfHOOpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41275 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731970AbfHOOpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:45:03 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGzohwQmCDqPeyGzthYZOG; Thu, 15 Aug 2019 16:45:01 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 03/12] media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Thu, 15 Aug 2019 16:44:47 +0200
Message-Id: <20190815144456.54583-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFme2n57nAKbPhAyrj7hQg0HSZEodKdCQ9T7onUMIgK2Iln5OZAksLz2HRZ0gIq0/fixp2yLuIqFbDirsCL7E5a9jwlvPaHIRmOCHmZQudYhVbJcepuH
 CRZ4whejOJQg6egcDun9ni9ycewgXgb7F0pKt9U1hQjcQGf7tT60IFJw4BKP4l6i2hT45+dViFUsgIAUBOTZpSMmLqRIypJiSJ202hdULTh1B9+7m1UtOYZO
 gxGXms6dBRQn2bUjBOaWm3OKDjjI58n89XRdAJt2kmARE2lFH+nF+0OOGSitzQjBWekkC38Ma6NIi9vsQN8/txr498uhyE587ujM/Gkb0z2Z+1R+edR737GT
 sy3iWouqNUnFXJC9Dqm8qn9zBGv6/BcYYnggRqIVO8cOMhjM4SyR/1H3e06BWm9Zf0nRXwVgrMyeFgVdSN0KQL11L7LILJkDHBZVO46C6CR6xUEEeGM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Tag all the coded formats where the venus vdec supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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

