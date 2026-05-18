Return-Path: <linux-media+bounces-61947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cf2IBzvCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:51:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A120756AFD5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D698306E84B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9623EFFA2;
	Mon, 18 May 2026 10:32:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234C3ED114;
	Mon, 18 May 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100371; cv=none; b=qZ5Z0GHEvuScdNDv1l/W52pBW5CFej6DRGBOGXllC2atpgHZ5mnNoIj9m+RqxDsARjibjtXrHgdriS05td2RDIF0COfKOSXCHWTLApERebj6A7V8RvFoOOXeNlknpZvKujPQaNqsgT7nQwOnf1Fbtul2t0QEbL5IK6cVEhumB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100371; c=relaxed/simple;
	bh=fmifNF4wHadqQlP/a3pXW+27pHqSFgjDfb4aMBlUX9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qyze0mrOBZuyFk9i+19ZrhAtY4D09AsPpV8XKpIEhdSrz/aEPoBmUoHfcX4nt47v0cO/6rHM7cH0XFEpx9u5r2p1VvRRnpAi5KJ7fNeU64xpf2JJnIdY+86UJGNEYNSQ5lKpGK/FE9XR1Ttnjr2BDC+m59iwawm9n1B0q5mcWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 111EF1F8004D;
	Mon, 18 May 2026 10:32:20 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 89F43B4082B; Mon, 18 May 2026 10:32:19 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id B68C1B407FD;
	Mon, 18 May 2026 10:25:01 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
Date: Mon, 18 May 2026 12:24:49 +0200
Message-ID: <20260518102451.417971-15-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A120756AFD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61947-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:mid]
X-Rspamd-Action: no action

Store the active format using the common V4L2 subdev active state
instead of our local copy of it.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  16 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  18 ++-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++++----------
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 --
 5 files changed, 82 insertions(+), 80 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
index e7b99cee63d6..24e731bcabe9 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
@@ -595,11 +595,25 @@ static int sun6i_isp_capture_link_validate(struct media_link *link)
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_isp_device *isp_dev = video_get_drvdata(video_dev);
 	struct v4l2_device *v4l2_dev = &isp_dev->v4l2.v4l2_dev;
+	struct v4l2_subdev *proc_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
 	unsigned int capture_width, capture_height;
 	unsigned int proc_width, proc_height;
+	struct v4l2_subdev_format proc_subdev_format = {
+		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad	= link->source->index,
+	};
+	int ret;
 
 	sun6i_isp_capture_dimensions(isp_dev, &capture_width, &capture_height);
-	sun6i_isp_proc_dimensions(isp_dev, &proc_width, &proc_height);
+
+	ret = v4l2_subdev_call(proc_subdev, pad, get_fmt, NULL,
+			       &proc_subdev_format);
+	if (ret)
+		return ret;
+
+	proc_width = proc_subdev_format.format.width;
+	proc_height = proc_subdev_format.format.height;
 
 	/* No cropping/scaling is supported (yet). */
 	if (capture_width != proc_width || capture_height != proc_height) {
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index b7ef33fa2b13..0cc48e2bc8c6 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -43,11 +43,14 @@ static const struct sun6i_isp_params_config sun6i_isp_params_config_default = {
 	},
 };
 
-static void sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_dev)
+static void
+sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_dev,
+			      const struct v4l2_mbus_framefmt *mbus_format)
 {
 	unsigned int width, height;
 
-	sun6i_isp_proc_dimensions(isp_dev, &width, &height);
+	width = mbus_format->width;
+	height = mbus_format->height;
 
 	sun6i_isp_load_write(isp_dev, SUN6I_ISP_OB_SIZE_REG,
 			     SUN6I_ISP_OB_SIZE_WIDTH(width) |
@@ -112,10 +115,12 @@ static void sun6i_isp_params_configure_wb(struct sun6i_isp_device *isp_dev)
 			     SUN6I_ISP_WB_CFG_CLIP(0xfff));
 }
 
-static void sun6i_isp_params_configure_base(struct sun6i_isp_device *isp_dev)
+static void
+sun6i_isp_params_configure_base(struct sun6i_isp_device *isp_dev,
+				const struct v4l2_mbus_framefmt *mbus_format)
 {
 	sun6i_isp_params_configure_ae(isp_dev);
-	sun6i_isp_params_configure_ob(isp_dev);
+	sun6i_isp_params_configure_ob(isp_dev, mbus_format);
 	sun6i_isp_params_configure_wb(isp_dev);
 }
 
@@ -170,14 +175,15 @@ sun6i_isp_params_configure_modules(struct sun6i_isp_device *isp_dev,
 	sun6i_isp_load_write(isp_dev, SUN6I_ISP_MODULE_EN_REG, value);
 }
 
-void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev)
+void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
+				const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct sun6i_isp_params_state *state = &isp_dev->params.state;
 	unsigned long flags;
 
 	spin_lock_irqsave(&state->lock, flags);
 
-	sun6i_isp_params_configure_base(isp_dev);
+	sun6i_isp_params_configure_base(isp_dev, mbus_format);
 
 	/* Default config is only applied at the very first stream start. */
 	if (state->configured)
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
index 50f10f879c42..c0d6cff95d54 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
@@ -36,8 +36,8 @@ struct sun6i_isp_params {
 
 /* Params */
 
-void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev);
-
+void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
+				const struct v4l2_mbus_framefmt *mbus_format);
 /* State */
 
 void sun6i_isp_params_state_update(struct sun6i_isp_device *isp_dev,
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 46a334b602f1..9073a7f3f8c8 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -15,17 +15,6 @@
 #include "sun6i_isp_proc.h"
 #include "sun6i_isp_reg.h"
 
-/* Helpers */
-
-void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
-			       unsigned int *width, unsigned int *height)
-{
-	if (width)
-		*width = isp_dev->proc.mbus_format.width;
-	if (height)
-		*height = isp_dev->proc.mbus_format.height;
-}
-
 /* Format */
 
 static const struct sun6i_isp_proc_format sun6i_isp_proc_formats[] = {
@@ -137,9 +126,10 @@ static void sun6i_isp_proc_disable(struct sun6i_isp_device *isp_dev)
 	regmap_write(regmap, SUN6I_ISP_FE_CFG_REG, 0);
 }
 
-static void sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev)
+static void
+sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev,
+			 const struct v4l2_mbus_framefmt *mbus_format)
 {
-	struct v4l2_mbus_framefmt *mbus_format = &isp_dev->proc.mbus_format;
 	const struct sun6i_isp_proc_format *format;
 	u32 value;
 
@@ -173,6 +163,8 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_isp_proc_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	int ret;
 
 	/* Source */
@@ -191,6 +183,10 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 	else
 		source = &proc->source_csi1;
 
+	/* Active State */
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
 	if (!on) {
 		sun6i_isp_proc_irq_disable(isp_dev);
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
@@ -202,7 +198,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Clear */
 
@@ -210,9 +206,12 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Configure */
 
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_ISP_PROC_PAD_SINK_CSI);
+
 	sun6i_isp_tables_configure(isp_dev);
-	sun6i_isp_params_configure(isp_dev);
-	sun6i_isp_proc_configure(isp_dev);
+	sun6i_isp_params_configure(isp_dev, mbus_format);
+	sun6i_isp_proc_configure(isp_dev, mbus_format);
 	sun6i_isp_capture_configure(isp_dev);
 
 	/* State Update */
@@ -230,13 +229,17 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev *subdev, int on)
 		goto disable;
 	}
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	sun6i_isp_proc_disable(isp_dev);
 
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
+
 	return ret;
 }
 
@@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *state)
 {
-	struct sun6i_isp_device *isp_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_ISP_PROC_PAD_SINK_CSI;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &isp_dev->proc.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_isp_proc_formats[0].mbus_code;
-	mbus_format->width = 1280;
-	mbus_format->height = 720;
+		if (pad == SUN6I_ISP_PROC_PAD_SINK_PARAMS)
+			continue;
 
-	sun6i_isp_proc_mbus_format_prepare(mbus_format);
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	mutex_unlock(lock);
+		mbus_format->code = sun6i_isp_proc_formats[0].mbus_code;
+		mbus_format->width = 1280;
+		mbus_format->height = 720;
+
+		sun6i_isp_proc_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -291,53 +295,31 @@ sun6i_isp_proc_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *state,
-				  struct v4l2_subdev_format *format)
-{
-	struct sun6i_isp_device *isp_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &isp_dev->proc.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = isp_dev->proc.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *format)
 {
-	struct sun6i_isp_device *isp_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &isp_dev->proc.lock;
+	struct v4l2_mbus_framefmt *mbus_format;
 
-	mutex_lock(lock);
+	if (format->pad != SUN6I_ISP_PROC_PAD_SINK_CSI)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_isp_proc_mbus_format_prepare(mbus_format);
+	sun6i_isp_proc_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		isp_dev->proc.mbus_format = *mbus_format;
+	mbus_format = v4l2_subdev_state_get_format(state, format->pad);
+	*mbus_format = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_ISP_PROC_PAD_SOURCE);
+	*mbus_format = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops = {
 	.enum_mbus_code	= sun6i_isp_proc_enum_mbus_code,
-	.get_fmt	= sun6i_isp_proc_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_isp_proc_set_fmt,
 };
 
@@ -499,8 +481,6 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 	struct media_pad *pads = proc->pads;
 	int ret;
 
-	mutex_init(&proc->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_isp_proc_subdev_ops);
@@ -532,10 +512,14 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 
 	/* V4L2 Subdev */
 
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity;
+
 	ret = v4l2_device_register_subdev(v4l2_dev, subdev);
 	if (ret < 0) {
 		v4l2_err(v4l2_dev, "failed to register v4l2 subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_finalize;
 	}
 
 	/* V4L2 Async */
@@ -562,6 +546,9 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 
 	v4l2_device_unregister_subdev(subdev);
 
+error_subdev_finalize:
+	v4l2_subdev_cleanup(subdev);
+
 error_media_entity:
 	media_entity_cleanup(&subdev->entity);
 
@@ -577,5 +564,7 @@ void sun6i_isp_proc_cleanup(struct sun6i_isp_device *isp_dev)
 	v4l2_async_nf_cleanup(notifier);
 
 	v4l2_device_unregister_subdev(subdev);
+	v4l2_subdev_cleanup(subdev);
+
 	media_entity_cleanup(&subdev->entity);
 }
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
index db6738a39147..26c4327c5ed7 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
@@ -42,18 +42,11 @@ struct sun6i_isp_proc {
 	struct v4l2_subdev		subdev;
 	struct media_pad		pads[3];
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct sun6i_isp_proc_source	source_csi0;
 	struct sun6i_isp_proc_source	source_csi1;
 };
 
-/* Helpers */
-
-void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
-			       unsigned int *width, unsigned int *height);
-
 /* Format */
 
 const struct sun6i_isp_proc_format *sun6i_isp_proc_format_find(u32 mbus_code);
-- 
2.54.0


