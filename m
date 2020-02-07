Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603BA15541C
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 10:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgBGJAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 04:00:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50472 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgBGJAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 04:00:09 -0500
Received: from localhost.localdomain (p200300CB87166A00301E621E2266094E.dip0.t-ipconnect.de [IPv6:2003:cb:8716:6a00:301e:621e:2266:94e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DFACC295A85;
        Fri,  7 Feb 2020 09:00:06 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH 4/4] media: staging: rkisp1: add serialization to the resizer subdev ops
Date:   Fri,  7 Feb 2020 09:59:51 +0100
Message-Id: <20200207085951.5226-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
References: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For subdevices drivers, the drivers themself are responsible
for serializing their operations.
This patch adds serialization to the resizer subdevice.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h  |  1 +
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 7c668ac4bdd5..18507f5b6f3c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -226,6 +226,7 @@ struct rkisp1_resizer {
 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_rsz_config *config;
 	enum rkisp1_fmt_pix_type fmt_type;
+	struct mutex ops_lock;
 };
 
 struct rkisp1_debug {
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 9de6744f0900..87799fbf0363 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -562,7 +562,9 @@ static int rkisp1_rsz_get_fmt(struct v4l2_subdev *sd,
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 
+	mutex_lock(&rsz->ops_lock);
 	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, cfg, fmt->pad, fmt->which);
+	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
@@ -573,11 +575,13 @@ static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 
+	mutex_lock(&rsz->ops_lock);
 	if (fmt->pad == RKISP1_RSZ_PAD_SINK)
 		rkisp1_rsz_set_sink_fmt(rsz, cfg, &fmt->format, fmt->which);
 	else
 		rkisp1_rsz_set_src_fmt(rsz, cfg, &fmt->format, fmt->which);
 
+	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
@@ -588,10 +592,12 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 	struct rkisp1_resizer *rsz =
 		container_of(sd, struct rkisp1_resizer, sd);
 	struct v4l2_mbus_framefmt *mf_sink;
+	int ret = 0;
 
 	if (sel->pad == RKISP1_RSZ_PAD_SRC)
 		return -EINVAL;
 
+	mutex_lock(&rsz->ops_lock);
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK,
@@ -606,10 +612,11 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 						  sel->which);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	mutex_unlock(&rsz->ops_lock);
+	return ret;
 }
 
 static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
@@ -625,7 +632,9 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
 	dev_dbg(sd->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
+	mutex_lock(&rsz->ops_lock);
 	rkisp1_rsz_set_sink_crop(rsz, cfg, &sel->r, sel->which);
+	mutex_unlock(&rsz->ops_lock);
 
 	return 0;
 }
@@ -665,9 +674,11 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
 	if (other->is_streaming)
 		when = RKISP1_SHADOW_REGS_ASYNC;
 
+	mutex_lock(&rsz->ops_lock);
 	rkisp1_rsz_config(rsz, when);
 	rkisp1_dcrop_config(rsz);
 
+	mutex_unlock(&rsz->ops_lock);
 	return 0;
 }
 
@@ -713,6 +724,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 
 	rsz->fmt_type = RKISP1_DEF_FMT_TYPE;
 
+	mutex_init(&rsz->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, 2, pads);
 	if (ret)
 		return ret;
-- 
2.17.1

