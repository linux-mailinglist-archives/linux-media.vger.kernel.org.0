Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8C838E4DD
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhEXLKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:10:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhEXLKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:45 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16EEF1575;
        Mon, 24 May 2021 13:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854556;
        bh=TBsMvYPH7s+9iWn6T9mop5HvZkoP10/3/Y7Xhhw0vuY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WNoffY/hT1o9ipFEV4JzfHBkArmO1kHmfo8Xpd7bRbECrNlD3h8VYGrMmmYtcWX0U
         WcaoKlb7hkIujAgnF/4lJEjNDRwVXG3RdCFnIVLasQmbS0QlFpuaPk7ET1jem+7Xw0
         CYW6l2eP7K7mPhb3lr3hvqoimEix3HazARlCRPfM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 01/38] media: ti-vpe: cal: add g/s_parm for legacy API
Date:   Mon, 24 May 2021 14:08:32 +0300
Message-Id: <20210524110909.672432-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance complains about g/s_parm when using the non-MC API. Fix
it by adding the functions and just call v4l2_s/g_parm_cap for the
phy subdev.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index ca75b54311a8..c49ee169b019 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -388,6 +388,20 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
+static int cal_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->sensor, a);
+}
+
+static int cal_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct cal_ctx *ctx = video_drvdata(file);
+
+	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->sensor, a);
+}
+
 static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
 	.vidioc_querycap      = cal_querycap,
 	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
@@ -411,6 +425,8 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
 	.vidioc_log_status    = v4l2_ctrl_log_status,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_g_parm		= cal_g_parm,
+	.vidioc_s_parm		= cal_s_parm,
 };
 
 /* ------------------------------------------------------------------
-- 
2.25.1

