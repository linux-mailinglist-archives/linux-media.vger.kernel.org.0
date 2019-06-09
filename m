Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9103A66B
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbfFIOi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34522 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbfFIOi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id e16so6632472wrn.1
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D7Oj4se8zl+NJx3YkAtsQsr0NdSieA+H2NUxJiLn6qY=;
        b=qQtE5FBZUWMtl/GtcgkdHhTCQuWjTkjdAwQNlq/VawTnKF/93O05ofWYkcVUz6jXy5
         sKjbZL61yjAhcyNoGW0nACLRyhFIzRKVar5Wm7eBj/duoPNOoH0UIMcJI/b5VaSwl3wJ
         QN5QxeaOUMkXSNHEYOw40Q6GKViuVBpVi/02U6TmStVhuyHsTVWDnsgYC8gz0jiJv1NK
         PRb493Kk5CfGb7W9+0vrvxdThrgjVXWFr33FdYDwCVjdnVYWa+jBkHjM9sb8/Nzo0DQ5
         qJ44g8cHJvK5UwE98jsDsS6TU06xXE5tAylTZh9sHrFf5LH9u/2tsREKtA0LZtweal3T
         SOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D7Oj4se8zl+NJx3YkAtsQsr0NdSieA+H2NUxJiLn6qY=;
        b=AWg9Q/cHxrQpzk58is1uzPrpfElEOKSw5LR5tVbenW52RnPTo502cvRU3Zj66tMMis
         MznOeac1PfeM6JSyKXmVHHOXuQoSmCPUxapT0Qk3AUI1O9cduNXab+KVcHyPJvLrjn7r
         XwhLeEp9V9TnY6GQtkHrz/d2igF/p7RYJCun3Kq63xP8DHVOfn+P39Dqnc67v3HAkkSn
         8GoSaH36kRCbRff7/k7JE2jmCq1CU8+InJ6YJHdZkZ7otMYV0fQTqqeGVOZ8KVjW9UOx
         B2VPfggvN1rPVAD8yW/yRR/dI9sH5MCCVNwQSG5ApvKWhKXFBOZZ8e7xHsLlxvJqjZ0z
         YHnw==
X-Gm-Message-State: APjAAAU/4lGVrF1yDPhI8hZI+fU0DJ8IldShw6wAJhsyE7RL5fH1i7Tp
        WM4LcnGlbb3lXu4a+bUIlYrRJQ==
X-Google-Smtp-Source: APXvYqzFtLgp4TQi2A/SR/UYnBIjYWacMyORchtKYAawLRYmeIkGKNjwXfoXQaPRYoUCLJd8/JMCUw==
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr24708793wrw.170.1560091105423;
        Sun, 09 Jun 2019 07:38:25 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:24 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 2/5] media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Sun,  9 Jun 2019 16:38:17 +0200
Message-Id: <20190609143820.4662-3-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tag all the coded formats where the venus vdec supports dynamic
resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7a3feb5cee00..74eb42668627 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -55,6 +55,7 @@ struct venus_format {
 	u32 pixfmt;
 	unsigned int num_planes;
 	u32 type;
+	u32 flags;
 };
 
 #define MAX_PLANES		4
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 2a47b9b8c5bc..8aabc23966b8 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -46,42 +46,52 @@ static const struct venus_format vdec_formats[] = {
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
 
@@ -360,6 +370,7 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		return -EINVAL;
 
 	f->pixelformat = fmt->pixfmt;
+	f->flags = fmt->flags;
 
 	return 0;
 }
-- 
2.21.0

