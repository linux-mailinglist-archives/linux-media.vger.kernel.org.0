Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3047ED5D
	for <lists+linux-media@lfdr.de>; Fri, 24 Dec 2021 09:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352096AbhLXInd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Dec 2021 03:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352091AbhLXInb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Dec 2021 03:43:31 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CEEC061757
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:31 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id iy13so7145650pjb.5
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+Fh/qAuMn5CdjDLnYjyrqGITfKBSqt/cZsobAY6JEc=;
        b=CA6zjrhwXkkgRb/m1JYwPl/QSP10VHx89RbzeBKbGYf92y4v78Co10GSZ2WJWclqOX
         UUhBgFdbdJslb2b0q9ca4mimZLvlgTWBgnvkLiUJD8VFG7cecMWukGKCW8j+TwwpUb3E
         S8OpRmnQAdBzzqcdIzmawhHe0Eg6v1C94dG68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+Fh/qAuMn5CdjDLnYjyrqGITfKBSqt/cZsobAY6JEc=;
        b=AMkTlhU2hx3ycxqlhhLB3BiTf5IY999ZgruQbzIJiV9xGPLMtZVI5Pu8a3e3VSeF93
         ZdxhPvLE+Agvqt27s7oHAdrFSBQcXBEXWfa1MKw0Jxx/W4Dg6QM89abYAPhjp6sEM5M7
         xyiN5UinyTZgPT6EBUQQ01szNY7hwDm2ERxj4zK75CCIlb/8E6ij2Hv3tTtJ3qnn1ASo
         VW0VVZW0Guik7p6uXO9L8sonnBBMzF2T/f83fE7x1p3fsunq132F+UaWALESX0wzDCUV
         SaaHxn7RMgHz5/gJ++G44F7IcKzIErss3jGc/JKkA7UD8IpZGGQVSObt6bge8wsxlCDa
         eKxQ==
X-Gm-Message-State: AOAM531z6InrbxqDrXpRNXmcHgcpUuhuKhAuDEBn9w69jUez0Umz3T5l
        dM3wxNCS0AbXXb1+R1u4bZW1wQ==
X-Google-Smtp-Source: ABdhPJy2kPiDpVLrzhjIwpHjW68Llg7zXf8Fj6vB99LCVDNqz4QNyABP30EHnthg9er6mH8NjVRd6Q==
X-Received: by 2002:a17:902:7785:b0:149:5945:40ac with SMTP id o5-20020a170902778500b00149594540acmr3576627pll.35.1640335411024;
        Fri, 24 Dec 2021 00:43:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:30 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT 6/7] media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
Date:   Fri, 24 Dec 2021 16:42:47 +0800
Message-Id: <20211224084248.3070568-7-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211224084248.3070568-1-wenst@chromium.org>
References: <20211224084248.3070568-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro JPEG encoder driver adds various segments to the JPEG header.
While it would be quite complicated to make these segments selectable
to userspace, given that the driver has to fill in various fields in
these segments, and also take care of alignment, it would be nice if
the driver could signal to userspace what segments are included.

Implement the V4L2_CID_JPEG_ACTIVE_MARKER control, and make it always
return the set of segments that the driver adds.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6a51f39dde56..33232479dcb7 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -280,6 +280,26 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+#define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
+					 V4L2_JPEG_ACTIVE_MARKER_COM | \
+					 V4L2_JPEG_ACTIVE_MARKER_DQT | \
+					 V4L2_JPEG_ACTIVE_MARKER_DHT)
+
+static int hantro_jpeg_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		break;
+	case V4L2_CID_JPEG_ACTIVE_MARKER:
+		ctrl->val = HANTRO_JPEG_ACTIVE_MARKERS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct hantro_ctx *ctx;
@@ -293,6 +313,8 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
 		ctx->jpeg_quality = ctrl->val;
 		break;
+	case V4L2_CID_JPEG_ACTIVE_MARKER:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -325,6 +347,7 @@ static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
 };
 
 static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
+	.try_ctrl = hantro_jpeg_try_ctrl,
 	.s_ctrl = hantro_jpeg_s_ctrl,
 };
 
@@ -343,6 +366,14 @@ static const struct hantro_ctrl controls[] = {
 			.def = 50,
 			.ops = &hantro_jpeg_ctrl_ops,
 		},
+	}, {
+		.codec = HANTRO_JPEG_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_JPEG_ACTIVE_MARKER,
+			.max = HANTRO_JPEG_ACTIVE_MARKERS,
+			.def = HANTRO_JPEG_ACTIVE_MARKERS,
+			.ops = &hantro_jpeg_ctrl_ops,
+		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-- 
2.34.1.448.ga2b2bfdf31-goog

