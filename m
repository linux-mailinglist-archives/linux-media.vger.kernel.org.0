Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587EE3A65C8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbhFNLmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237192AbhFNLlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:02 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 560505EAF;
        Mon, 14 Jun 2021 13:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669852;
        bh=mj5wyjDQ5OMsvWIHcUAeD+Zv10RwTH20ftxmq0wz4x8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BY+ZOlaCw47H03EWH2P/U5Yog/TDwgrIKvS1ltX8o0PbfeB0x3eGw2kh949CdfEG1
         +4m38ylvEzbQujC3cRBoaD3M3TsoaNSj396BCNLBAJDwKXQ/xggwPAdIHlmz/RD8u8
         nzDeq8kGusGyAHnVfBSD4AcbvBn2bgE7vUDERPUI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 24/35] media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
Date:   Mon, 14 Jun 2021 14:23:34 +0300
Message-Id: <20210614112345.2032435-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
index cdbfdca8570f..1099ef4ae968 100644
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

