Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B41365875
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhDTMGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbhDTMGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:01 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86D4A14CA;
        Tue, 20 Apr 2021 14:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920328;
        bh=nVC9w3rAvr7p1Ue0dr+IK2NK3BtumqjLcTkMVh8gtL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hWsvpN256C8UnNWGTvKEZg0oJNNJh6hwf7mo2YUa7p96vhtgITvmT+z9Mt1j3n1dV
         Io7yUx9gt6POCO4+bcxqwpuT4eE1D2Jxh6S+PrN+w32w+mq0yAGPByZ/hzfXFTlqKS
         MbS2mZEDM9fnHDoklgeIZXD0nIfyOYEpsL17qPMI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 24/35] media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
Date:   Tue, 20 Apr 2021 15:04:22 +0300
Message-Id: <20210420120433.902394-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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
index 064efdc31b28..40fb09d82418 100644
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

