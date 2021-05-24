Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9D038E4F6
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhEXLLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbhEXLLH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:07 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B901229DE;
        Mon, 24 May 2021 13:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854570;
        bh=2r8z2s4Ilk9sfpXQ9YC28zWBTbB6Y1dKSid3Yc3xprs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O4GB5aFfUNLFXLCMECfxDoBniom9JPqhm9TZAj0QGomSYXHwgDg5NYwC4SzOeR7tf
         5YnkO4L6nK9KVip4/S9/btvZWccDcxZv9wTZgsaKQOdq4nFXeLnZpUhVVpkjFCa7Or
         vW+SkBaSU9rwlZlTY2dKdxISqudnbYhJIOn8w0rw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 24/38] media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
Date:   Mon, 24 May 2021 14:08:55 +0300
Message-Id: <20210524110909.672432-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support
MC-centric devices") added support to enumerate formats based on
mbus-code.

Add this feature to cal driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 1311adfb35a7..24d14cd7dbb1 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -437,13 +437,28 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
 static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
 				   struct v4l2_fmtdesc *f)
 {
+	unsigned int i;
+	unsigned int idx;
+
 	if (f->index >= cal_num_formats)
 		return -EINVAL;
 
-	f->pixelformat = cal_formats[f->index].fourcc;
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	idx = 0;
 
-	return 0;
+	for (i = 0; i < cal_num_formats; ++i) {
+		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
+			continue;
+
+		if (idx == f->index) {
+			f->pixelformat = cal_formats[i].fourcc;
+			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+			return 0;
+		}
+
+		idx++;
+	}
+
+	return -EINVAL;
 }
 
 static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
-- 
2.25.1

