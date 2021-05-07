Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3080E37653E
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbhEGMh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:37:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59646 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhEGMhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:37:55 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 565C23F2;
        Fri,  7 May 2021 14:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391015;
        bh=eb7mpxApR5OHhlGD+jZHmLIcDgnPN+JenNNDLJFhBA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DjQhDelgK5WjqNT01lJ1Tgs5MhK8BKyOvtVEQd/bijciKeMs/Ewoh1NiovcYxp2Cy
         PCIcbr2eOLEvtjqwPORXfTw+DI9z4j3wqkOfjfdskvuRzz8bvRcQgXQuuG6ufEeAig
         KWOSVwmc9w0pC+9j4bDta0EAOzjSNsETTL6ke6+o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 01/11] media: v4l2-subdev: add subdev-wide state struct
Date:   Fri,  7 May 2021 15:35:48 +0300
Message-Id: <20210507123558.146948-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have 'struct v4l2_subdev_pad_config' which contains configuration for
a single pad used for the TRY functionality, and an array of those
structs is passed to various v4l2_subdev_pad_ops.

I was working on subdev internal routing between pads, and realized that
there's no way to add TRY functionality for routes, which is not pad
specific configuration. Adding a separate struct for try-route config
wouldn't work either, as e.g. set-fmt needs to know the try-route
configuration to propagate the settings.

This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
moment only contains the v4l2_subdev_pad_config array) and the new
struct is used in most of the places where v4l2_subdev_pad_config was
used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
are changed to instead take v4l2_subdev_state.

Two drivers are changed to work with the above changes (drivers for HW
which I have) as an example.

I worked on a semantic patch (included below, my first spatch...) to do
this change to all drivers, but hit lots of problems with non-trivial
uses of v4l2_subdev_pad_config.

As it looks like substantial amount of manual work is needed, I'm
posting this RFC to get an ack on the changes before continuing that
work.

@ v4l2_subdev_pad_ops @
identifier pad_ops;
identifier func;
@@

(
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_mbus_code = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_frame_size = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .enum_frame_interval = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .get_fmt = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .set_fmt = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .get_selection = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .set_selection = func,
        ...,
};
|
static const struct v4l2_subdev_pad_ops pad_ops = {
        ...,
        .init_cfg = func,
        ...,
};
)

@@
identifier v4l2_subdev_pad_ops.func;
identifier sd;
identifier cfg;
@@

 func(struct v4l2_subdev *sd,
-	struct v4l2_subdev_pad_config *cfg,
+	struct v4l2_subdev_state *cfg,
	...
      )
 {
    ...
 }

@@
identifier v4l2_subdev_pad_ops.func;
identifier sd;
identifier cfg;
@@

 func(struct v4l2_subdev *sd,
-   struct v4l2_subdev_pad_config *cfg
+   struct v4l2_subdev_state *cfg
      )
 {
    ...
 }

@@
struct v4l2_subdev_fh *fh;
@@
-    fh->pad
+    &fh->cfg

@@
identifier func;
identifier cfg;
@@

func(...,
- struct v4l2_subdev_pad_config *cfg,
+ struct v4l2_subdev_state *cfg,
 ...)
{
    ...
}

@@
struct v4l2_subdev_state *cfg;
@@
 {
    <...
(
-   cfg->try_fmt
+   cfg->pad->try_fmt
|
-   cfg->try_crop
+   cfg->pad->try_crop
|
-   cfg->try_compose
+   cfg->pad->try_compose
)
    ...>
 }

@@
identifier pad_cfg;
@@
{
    ...
    struct v4l2_subdev_pad_config pad_cfg;
+   struct v4l2_subdev_state cfg = { .pad = &pad_cfg };
    <...
-   &pad_cfg
+   &cfg
    ...>
}

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 141 +++++++++++++++-----------
 include/media/v4l2-subdev.h           |  72 +++++++------
 2 files changed, 120 insertions(+), 93 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 956dafab43d4..bd996dcace3b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,19 +26,21 @@
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
-	if (sd->entity.num_pads) {
-		fh->pad = v4l2_subdev_alloc_pad_config(sd);
-		if (fh->pad == NULL)
-			return -ENOMEM;
-	}
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_subdev_alloc_state(sd);
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	fh->state = state;
 
 	return 0;
 }
 
 static void subdev_fh_free(struct v4l2_subdev_fh *fh)
 {
-	v4l2_subdev_free_pad_config(fh->pad);
-	fh->pad = NULL;
+	v4l2_subdev_free_state(fh->state);
+	fh->state = NULL;
 }
 
 static int subdev_open(struct file *file)
@@ -146,63 +148,63 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
-static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
+static int check_cfg(u32 which, struct v4l2_subdev_state *state)
 {
-	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
+	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)
 		return -EINVAL;
 
 	return 0;
 }
 
 static inline int check_format(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
 	if (!format)
 		return -EINVAL;
 
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
-	       check_cfg(format->which, cfg);
+	       check_cfg(format->which, state);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, cfg, format) ? :
-	       sd->ops->pad->get_fmt(sd, cfg, format);
+	return check_format(sd, state, format) ? :
+	       sd->ops->pad->get_fmt(sd, state, format);
 }
 
 static int call_set_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, cfg, format) ? :
-	       sd->ops->pad->set_fmt(sd, cfg, format);
+	return check_format(sd, state, format) ? :
+	       sd->ops->pad->set_fmt(sd, state, format);
 }
 
 static int call_enum_mbus_code(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (!code)
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_cfg(code->which, cfg) ? :
-	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
+	       check_cfg(code->which, state) ? :
+	       sd->ops->pad->enum_mbus_code(sd, state, code);
 }
 
 static int call_enum_frame_size(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (!fse)
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_cfg(fse->which, cfg) ? :
-	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
+	       check_cfg(fse->which, state) ? :
+	       sd->ops->pad->enum_frame_size(sd, state, fse);
 }
 
 static inline int check_frame_interval(struct v4l2_subdev *sd,
@@ -229,42 +231,42 @@ static int call_s_frame_interval(struct v4l2_subdev *sd,
 }
 
 static int call_enum_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_frame_interval_enum *fie)
 {
 	if (!fie)
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_cfg(fie->which, cfg) ? :
-	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
+	       check_cfg(fie->which, state) ? :
+	       sd->ops->pad->enum_frame_interval(sd, state, fie);
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
 	if (!sel)
 		return -EINVAL;
 
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
-	       check_cfg(sel->which, cfg);
+	       check_cfg(sel->which, state);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, cfg, sel) ? :
-	       sd->ops->pad->get_selection(sd, cfg, sel);
+	return check_selection(sd, state, sel) ? :
+	       sd->ops->pad->get_selection(sd, state, sel);
 }
 
 static int call_set_selection(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, cfg, sel) ? :
-	       sd->ops->pad->set_selection(sd, cfg, sel);
+	return check_selection(sd, state, sel) ? :
+	       sd->ops->pad->set_selection(sd, state, sel);
 }
 
 static inline int check_edid(struct v4l2_subdev *sd,
@@ -506,7 +508,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -517,7 +519,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -531,7 +533,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->pad, &sel);
+			sd, pad, get_selection, subdev_fh->state, &sel);
 
 		crop->rect = sel.r;
 
@@ -553,7 +555,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.r = crop->rect;
 
 		rval = v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->pad, &sel);
+			sd, pad, set_selection, subdev_fh->state, &sel);
 
 		crop->rect = sel.r;
 
@@ -564,7 +566,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
 		memset(code->reserved, 0, sizeof(code->reserved));
-		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
 					code);
 	}
 
@@ -572,7 +574,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
 		memset(fse->reserved, 0, sizeof(fse->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
 					fse);
 	}
 
@@ -597,7 +599,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
 		memset(fie->reserved, 0, sizeof(fie->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
+		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
 					fie);
 	}
 
@@ -606,7 +608,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->pad, sel);
+			sd, pad, get_selection, subdev_fh->state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -617,7 +619,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->pad, sel);
+			sd, pad, set_selection, subdev_fh->state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -892,35 +894,50 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_pad_config *
-v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 {
-	struct v4l2_subdev_pad_config *cfg;
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	if (!sd->entity.num_pads)
-		return NULL;
-
-	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
-			     GFP_KERNEL | __GFP_ZERO);
-	if (!cfg)
-		return NULL;
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	ret = v4l2_subdev_call(sd, pad, init_cfg, cfg);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		kvfree(cfg);
-		return NULL;
+	if (sd->entity.num_pads) {
+		state->pads = kvmalloc_array(sd->entity.num_pads,
+					     sizeof(*state->pads),
+					     GFP_KERNEL | __GFP_ZERO);
+		if (!state->pads) {
+			ret = -ENOMEM;
+			goto err;
+		}
 	}
 
-	return cfg;
+	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		goto err;
+
+	return state;
+
+err:
+	if (state && state->pads)
+		kvfree(state->pads);
+
+	kfree(state);
+
+	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_pad_config);
+EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
 
-void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg)
+void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 {
-	kvfree(cfg);
+	kvfree(state->pads);
+	kvfree(state);
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_free_pad_config);
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index ebe0d50f6a73..a9c470605367 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -665,6 +665,19 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+/**
+ * struct v4l2_subdev_state - Used for storing subdev information.
+ *
+ * @pads: &struct v4l2_subdev_pad_config array
+ *
+ * This structure only needs to be passed to the pad op if the 'which' field
+ * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
+ * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
+ */
+struct v4l2_subdev_state {
+	struct v4l2_subdev_pad_config *pads;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -729,27 +742,27 @@ struct v4l2_subdev_pad_config {
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
-			struct v4l2_subdev_pad_config *cfg);
+			struct v4l2_subdev_state *state);
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_mbus_code_enum *code);
 	int (*enum_frame_size)(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_frame_size_enum *fse);
 	int (*enum_frame_interval)(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_frame_interval_enum *fie);
 	int (*get_fmt)(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*set_fmt)(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_pad_config *cfg,
+		       struct v4l2_subdev_state *state,
 		       struct v4l2_subdev_format *format);
 	int (*get_selection)(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*set_selection)(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
 	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
 	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
@@ -960,14 +973,14 @@ struct v4l2_subdev {
  * struct v4l2_subdev_fh - Used for storing subdev information per file handle
  *
  * @vfh: pointer to &struct v4l2_fh
- * @pad: pointer to &struct v4l2_subdev_pad_config
+ * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-	struct v4l2_subdev_pad_config *pad;
+	struct v4l2_subdev_state *state;
 #endif
 };
 
@@ -987,17 +1000,17 @@ struct v4l2_subdev_fh {
  *	&struct v4l2_subdev_pad_config->try_fmt
  *
  * @sd: pointer to &struct v4l2_subdev
- * @cfg: pointer to &struct v4l2_subdev_pad_config array.
- * @pad: index of the pad in the @cfg array.
+ * @state: pointer to &struct v4l2_subdev_state.
+ * @pad: index of the pad in the @state array.
  */
 static inline struct v4l2_mbus_framefmt *
 v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_state *state,
 			   unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_fmt;
+	return &state->pads[pad].try_fmt;
 }
 
 /**
@@ -1005,17 +1018,17 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
  *	&struct v4l2_subdev_pad_config->try_crop
  *
  * @sd: pointer to &struct v4l2_subdev
- * @cfg: pointer to &struct v4l2_subdev_pad_config array.
- * @pad: index of the pad in the @cfg array.
+ * @state: pointer to &struct v4l2_subdev_state.
+ * @pad: index of the pad in the @state array.
  */
 static inline struct v4l2_rect *
 v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_pad_config *cfg,
+			 struct v4l2_subdev_state *state,
 			 unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_crop;
+	return &state->pads[pad].try_crop;
 }
 
 /**
@@ -1023,17 +1036,17 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
  *	&struct v4l2_subdev_pad_config->try_compose
  *
  * @sd: pointer to &struct v4l2_subdev
- * @cfg: pointer to &struct v4l2_subdev_pad_config array.
- * @pad: index of the pad in the @cfg array.
+ * @state: pointer to &struct v4l2_subdev_state.
+ * @pad: index of the pad in the @state array.
  */
 static inline struct v4l2_rect *
 v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_state *state,
 			    unsigned int pad)
 {
 	if (WARN_ON(pad >= sd->entity.num_pads))
 		pad = 0;
-	return &cfg[pad].try_compose;
+	return &state->pads[pad].try_compose;
 }
 
 #endif
@@ -1135,20 +1148,17 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 int v4l2_subdev_link_validate(struct media_link *link);
 
 /**
- * v4l2_subdev_alloc_pad_config - Allocates memory for pad config
+ * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
  *
- * @sd: pointer to struct v4l2_subdev
+ * Must call v4l2_subdev_free_state() when state is no longer needed.
  */
-struct
-v4l2_subdev_pad_config *v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
 
 /**
- * v4l2_subdev_free_pad_config - Frees memory allocated by
- *	v4l2_subdev_alloc_pad_config().
- *
- * @cfg: pointer to &struct v4l2_subdev_pad_config
+ * v4l2_subdev_free_state - uninitialize v4l2_subdev_state
  */
-void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
+void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

