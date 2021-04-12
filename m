Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B694635C540
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbhDLLfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237565AbhDLLf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5EAC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:11 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB7945A9;
        Mon, 12 Apr 2021 13:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227310;
        bh=mQ/srjJH13q3/KTCTszus/bAZnz7m5eMjRBye8IxeCA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NHy5nUu7l1vGiMGY8aaqGCQPr/qgxdN+djUsBgQ9MUNu+I25WJck71mSgpUdUW7rR
         ZLjXdGev711TS1Ckf3Y/Lj9qER5XR2jSSuyVU/Cho2QXCHtfpFxAoCARrAeyWfJXRd
         +qsQ3qubdgh0PEICMON5uZmFj2zt/PrcnOsB8ZMQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 01/28] media: ti-vpe: cal: add g/s_parm for legacy API
Date:   Mon, 12 Apr 2021 14:34:30 +0300
Message-Id: <20210412113457.328012-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance complains about g/s_parm when using the non-MC API. Fix
it by adding the functions and just call v4l2_s/g_parm_cap for the
phy subdev.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7b7436a355ee..86d7cdd27224 100644
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

