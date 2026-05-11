Return-Path: <linux-media+bounces-61194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBZ7D0FtAmqosgEAu9opvQ
	(envelope-from <linux-media+bounces-61194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:58:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4BB517AB1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 545E0306746A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D12036D9FE;
	Mon, 11 May 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EsdSMewS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6973D36C9E1;
	Mon, 11 May 2026 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543818; cv=none; b=Q20t+dRLMLQYmpo8ylYoXbcj13LIa8LJp6sUwtEZHNN2GKfcR2GhDIhc9zsNPCgd83qeiakDCXx/IzrngkBq/pf14vdq926Mcpm7nkWqBAco/H39MO6KvEqFuvX5ECkcyU3c2dx2kaYGaJqwGrQW9GtkhjRFKHKczF2MYxARS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543818; c=relaxed/simple;
	bh=EXQXsz6kFuSYopZa5BL6naMakarHr75lMz2DV1pqBK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2QEogcC7Vr4wsb/wtpZLPbMPIpXnP97x/wcZ+FPXSWJen47n9aNkSkM34W3u6Gf8/+QhKGy/DLlSLgwpEnIxkOaHaG88x+SPAjr4/ukt1cbT6vnRlKODszvFYd2R07bQvhvbF18dsqjcK8s7q851s9WpS7nv/GV4TVOLzypEWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EsdSMewS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2BDF517;
	Tue, 12 May 2026 01:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543805;
	bh=EXQXsz6kFuSYopZa5BL6naMakarHr75lMz2DV1pqBK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EsdSMewSiH096Rrk1kAYHNwRmlsdqsB/ZmyS4on4AeZC9nyhAkld04ba02KKSIaU6
	 nRtXPQQLp2rh8nv/3fxnwDB2JuSrLy4KkPrUC3nmyYPlsE1EjgYfMhQZI7yo+A+uE2
	 GC+rMzudtl3L8d7KN4p+C8USNCoVlDCTLikTstyY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 10/11] media: renesas: vsp1: Declare index variables in for loop statement
Date: Tue, 12 May 2026 02:56:34 +0300
Message-ID: <20260511235637.3468558-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CA4BB517AB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61194-lists,linux-media=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Using loop indices outside of the loop is a source of out-of-bounds
accesses and other bugs. It is important to carefully review those
usages. To make them stand out, declare all loop index variables that
are not used outside of the loop inside the loop statement.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  7 +---
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  3 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 12 ++----
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 14 +++----
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 42 ++++++++-----------
 .../media/platform/renesas/vsp1/vsp1_entity.c |  4 +-
 .../media/platform/renesas/vsp1/vsp1_hgo.c    |  7 ++--
 .../media/platform/renesas/vsp1/vsp1_hgt.c    | 13 +++---
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  3 +-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  5 +--
 .../media/platform/renesas/vsp1/vsp1_video.c  | 34 ++++++---------
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  8 ++--
 12 files changed, 56 insertions(+), 96 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 325be30836d7..360a42502947 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -155,9 +155,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 
 	/* Propagate the format code to all pads. */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
-		unsigned int i;
-
-		for (i = 0; i <= brx->entity.source_pad; ++i) {
+		for (unsigned int i = 0; i <= brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
@@ -271,7 +269,6 @@ static void brx_configure_stream(struct vsp1_entity *entity,
 	struct vsp1_brx *brx = to_brx(&entity->subdev);
 	struct v4l2_mbus_framefmt *format;
 	unsigned int flags;
-	unsigned int i;
 
 	format = v4l2_subdev_state_get_format(state, brx->entity.source_pad);
 
@@ -315,7 +312,7 @@ static void brx_configure_stream(struct vsp1_entity *entity,
 			       VI6_BRU_ROP_CROP(VI6_ROP_NOP) |
 			       VI6_BRU_ROP_AROP(VI6_ROP_NOP));
 
-	for (i = 0; i < brx->entity.source_pad; ++i) {
+	for (unsigned int i = 0; i < brx->entity.source_pad; ++i) {
 		bool premultiplied = false;
 		u32 ctrl = 0;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
index a6e4bcab5101..4b7d07d730da 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
@@ -43,14 +43,13 @@ static inline void vsp1_clu_write(struct vsp1_clu *clu,
 static int clu_set_table(struct vsp1_clu *clu, struct v4l2_ctrl *ctrl)
 {
 	struct vsp1_dl_body *dlb;
-	unsigned int i;
 
 	dlb = vsp1_dl_body_get(clu->pool);
 	if (!dlb)
 		return -ENOMEM;
 
 	vsp1_dl_body_write(dlb, VI6_CLU_ADDR, 0);
-	for (i = 0; i < CLU_SIZE; ++i)
+	for (unsigned int i = 0; i < CLU_SIZE; ++i)
 		vsp1_dl_body_write(dlb, VI6_CLU_DATA, ctrl->p_new.p_u32[i]);
 
 	scoped_guard(spinlock_irq, &clu->lock) {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index 3dc74fed91dc..6430f2ec8b32 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -257,7 +257,6 @@ vsp1_dl_body_pool_create(struct vsp1_device *vsp1, unsigned int num_bodies,
 {
 	struct vsp1_dl_body_pool *pool;
 	size_t dlb_size;
-	unsigned int i;
 
 	pool = kzalloc_obj(*pool);
 	if (!pool)
@@ -291,7 +290,7 @@ vsp1_dl_body_pool_create(struct vsp1_device *vsp1, unsigned int num_bodies,
 	spin_lock_init(&pool->lock);
 	INIT_LIST_HEAD(&pool->free);
 
-	for (i = 0; i < num_bodies; ++i) {
+	for (unsigned int i = 0; i < num_bodies; ++i) {
 		struct vsp1_dl_body *dlb = &pool->bodies[i];
 
 		dlb->pool = pool;
@@ -426,7 +425,6 @@ vsp1_dl_cmd_pool_create(struct vsp1_device *vsp1, enum vsp1_extcmd_type type,
 			unsigned int num_cmds)
 {
 	struct vsp1_dl_cmd_pool *pool;
-	unsigned int i;
 	size_t cmd_size;
 
 	pool = kzalloc_obj(*pool);
@@ -457,7 +455,7 @@ vsp1_dl_cmd_pool_create(struct vsp1_device *vsp1, enum vsp1_extcmd_type type,
 		return NULL;
 	}
 
-	for (i = 0; i < num_cmds; ++i) {
+	for (unsigned int i = 0; i < num_cmds; ++i) {
 		struct vsp1_dl_ext_cmd *cmd = &pool->cmds[i];
 		size_t cmd_offset = i * cmd_size;
 		/* data_offset must be 16 byte aligned for DMA. */
@@ -1046,7 +1044,6 @@ unsigned int vsp1_dlm_irq_frame_end(struct vsp1_dl_manager *dlm)
 /* Hardware Setup */
 void vsp1_dlm_setup(struct vsp1_device *vsp1)
 {
-	unsigned int i;
 	u32 ctrl = (256 << VI6_DL_CTRL_AR_WAIT_SHIFT)
 		 | VI6_DL_CTRL_DC2 | VI6_DL_CTRL_DC1 | VI6_DL_CTRL_DC0
 		 | VI6_DL_CTRL_DLE;
@@ -1054,7 +1051,7 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
 		   | VI6_DL_EXT_CTRL_DLPRI | VI6_DL_EXT_CTRL_EXT;
 
 	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {
-		for (i = 0; i < vsp1->info->wpf_count; ++i)
+		for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i)
 			vsp1_write(vsp1, VI6_DL_EXT_CTRL(i), ext_dl);
 	}
 
@@ -1092,7 +1089,6 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 {
 	struct vsp1_dl_manager *dlm;
 	size_t header_size;
-	unsigned int i;
 
 	dlm = devm_kzalloc(vsp1->dev, sizeof(*dlm), GFP_KERNEL);
 	if (!dlm)
@@ -1128,7 +1124,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 	if (!dlm->pool)
 		return NULL;
 
-	for (i = 0; i < prealloc; ++i) {
+	for (unsigned int i = 0; i < prealloc; ++i) {
 		struct vsp1_dl_list *dl;
 
 		dl = vsp1_dl_list_alloc(dlm);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index f6fbd3475329..9cd5c025d2be 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -419,13 +419,12 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 	struct vsp1_entity *uif;
 	bool use_uif = false;
 	struct vsp1_brx *brx;
-	unsigned int i;
 	int ret;
 
 	/* Count the number of enabled inputs and sort them by Z-order. */
 	pipe->num_inputs = 0;
 
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *rpf = vsp1->rpf[i];
 		unsigned int j;
 
@@ -457,7 +456,7 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 	brx = to_brx(&pipe->brx->subdev);
 
 	/* Setup the RPF input pipeline for every enabled input. */
-	for (i = 0; i < pipe->brx->source_pad; ++i) {
+	for (unsigned int i = 0; i < pipe->brx->source_pad; ++i) {
 		struct vsp1_rwpf *rpf = inputs[i];
 
 		if (!rpf) {
@@ -732,7 +731,6 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	struct vsp1_drm_pipeline *drm_pipe;
 	struct vsp1_pipeline *pipe;
-	unsigned int i;
 	int ret;
 
 	if (pipe_index >= vsp1->info->lif_count)
@@ -748,7 +746,7 @@ int vsp1_du_disable(struct device *dev, unsigned int pipe_index)
 		if (ret == -ETIMEDOUT)
 			dev_err(vsp1->dev, "DRM pipeline stop timeout\n");
 
-		for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(pipe->inputs); ++i) {
 			struct vsp1_rwpf *rpf = pipe->inputs[i];
 
 			if (!rpf)
@@ -964,8 +962,6 @@ EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
 
 int vsp1_drm_init(struct vsp1_device *vsp1)
 {
-	unsigned int i;
-
 	vsp1->drm = devm_kzalloc(vsp1->dev, sizeof(*vsp1->drm), GFP_KERNEL);
 	if (!vsp1->drm)
 		return -ENOMEM;
@@ -973,7 +969,7 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
 	mutex_init(&vsp1->drm->lock);
 
 	/* Create one DRM pipeline per LIF. */
-	for (i = 0; i < vsp1->info->lif_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->lif_count; ++i) {
 		struct vsp1_drm_pipeline *drm_pipe = &vsp1->drm->pipe[i];
 		struct vsp1_pipeline *pipe = &drm_pipe->pipe;
 
@@ -1010,7 +1006,7 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
 	}
 
 	/* Disable all RPFs initially. */
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *input = vsp1->rpf[i];
 
 		INIT_LIST_HEAD(&input->entity.list_pipe);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 627b5046fa80..3fa5a4415fc6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -51,10 +51,9 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 		   VI6_WPF_IRQ_STA_UND;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
-	unsigned int i;
 	u32 status;
 
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		struct vsp1_rwpf *wpf = vsp1->wpf[i];
 
 		if (wpf == NULL)
@@ -103,7 +102,6 @@ static int vsp1_create_sink_links(struct vsp1_device *vsp1,
 {
 	struct media_entity *entity = &sink->subdev.entity;
 	struct vsp1_entity *source;
-	unsigned int pad;
 	int ret;
 
 	list_for_each_entry(source, &vsp1->entities, list_dev) {
@@ -123,7 +121,7 @@ static int vsp1_create_sink_links(struct vsp1_device *vsp1,
 			source->index == sink->index
 		      ? MEDIA_LNK_FL_ENABLED : 0;
 
-		for (pad = 0; pad < entity->num_pads; ++pad) {
+		for (unsigned int pad = 0; pad < entity->num_pads; ++pad) {
 			if (!(entity->pads[pad].flags & MEDIA_PAD_FL_SINK))
 				continue;
 
@@ -144,7 +142,6 @@ static int vsp1_create_sink_links(struct vsp1_device *vsp1,
 static int vsp1_uapi_create_links(struct vsp1_device *vsp1)
 {
 	struct vsp1_entity *entity;
-	unsigned int i;
 	int ret;
 
 	list_for_each_entry(entity, &vsp1->entities, list_dev) {
@@ -177,7 +174,7 @@ static int vsp1_uapi_create_links(struct vsp1_device *vsp1)
 			return ret;
 	}
 
-	for (i = 0; i < vsp1->info->lif_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->lif_count; ++i) {
 		if (!vsp1->lif[i])
 			continue;
 
@@ -189,7 +186,7 @@ static int vsp1_uapi_create_links(struct vsp1_device *vsp1)
 			return ret;
 	}
 
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *rpf = vsp1->rpf[i];
 
 		ret = media_create_pad_link(&rpf->video->video.entity, 0,
@@ -201,7 +198,7 @@ static int vsp1_uapi_create_links(struct vsp1_device *vsp1)
 			return ret;
 	}
 
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		/*
 		 * Connect the video device to the WPF. All connections are
 		 * immutable.
@@ -253,7 +250,6 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 	struct media_device *mdev = &vsp1->media_dev;
 	struct v4l2_device *vdev = &vsp1->v4l2_dev;
 	struct vsp1_entity *entity;
-	unsigned int i;
 	int ret;
 
 	mdev->dev = vsp1->dev;
@@ -365,7 +361,7 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 	 * enabled skip the LIFs, even when present.
 	 */
 	if (!vsp1->info->uapi) {
-		for (i = 0; i < vsp1->info->lif_count; ++i) {
+		for (unsigned int i = 0; i < vsp1->info->lif_count; ++i) {
 			struct vsp1_lif *lif;
 
 			lif = vsp1_lif_create(vsp1, i);
@@ -389,7 +385,7 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&vsp1->lut->entity.list_dev, &vsp1->entities);
 	}
 
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *rpf;
 
 		rpf = vsp1_rpf_create(vsp1, i);
@@ -423,7 +419,7 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&vsp1->sru->entity.list_dev, &vsp1->entities);
 	}
 
-	for (i = 0; i < vsp1->info->uds_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->uds_count; ++i) {
 		struct vsp1_uds *uds;
 
 		uds = vsp1_uds_create(vsp1, i);
@@ -436,7 +432,7 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&uds->entity.list_dev, &vsp1->entities);
 	}
 
-	for (i = 0; i < vsp1->info->uif_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->uif_count; ++i) {
 		struct vsp1_uif *uif;
 
 		uif = vsp1_uif_create(vsp1, i);
@@ -449,7 +445,7 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 		list_add_tail(&uif->entity.list_dev, &vsp1->entities);
 	}
 
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		struct vsp1_rwpf *wpf;
 
 		wpf = vsp1_wpf_create(vsp1, i);
@@ -543,11 +539,10 @@ int vsp1_reset_wpf(struct vsp1_device *vsp1, unsigned int index)
 
 static int vsp1_device_init(struct vsp1_device *vsp1)
 {
-	unsigned int i;
 	int ret;
 
 	/* Reset any channel that might be running. */
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		ret = vsp1_reset_wpf(vsp1, i);
 		if (ret < 0)
 			return ret;
@@ -556,13 +551,13 @@ static int vsp1_device_init(struct vsp1_device *vsp1)
 	vsp1_write(vsp1, VI6_CLK_DCSWT, (8 << VI6_CLK_DCSWT_CSTPW_SHIFT) |
 		   (8 << VI6_CLK_DCSWT_CSTRW_SHIFT));
 
-	for (i = 0; i < vsp1->info->rpf_count; ++i)
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i)
 		vsp1_write(vsp1, VI6_DPR_RPF_ROUTE(i), VI6_DPR_NODE_UNUSED);
 
-	for (i = 0; i < vsp1->info->uds_count; ++i)
+	for (unsigned int i = 0; i < vsp1->info->uds_count; ++i)
 		vsp1_write(vsp1, VI6_DPR_UDS_ROUTE(i), VI6_DPR_NODE_UNUSED);
 
-	for (i = 0; i < vsp1->info->uif_count; ++i)
+	for (unsigned int i = 0; i < vsp1->info->uif_count; ++i)
 		vsp1_write(vsp1, VI6_DPR_UIF_ROUTE(i), VI6_DPR_NODE_UNUSED);
 
 	vsp1_write(vsp1, VI6_DPR_SRU_ROUTE, VI6_DPR_NODE_UNUSED);
@@ -587,11 +582,9 @@ static int vsp1_device_init(struct vsp1_device *vsp1)
 
 static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
 {
-	unsigned int i;
-
-	for (i = 0; i < vsp1->info->lif_count; ++i)
+	for (unsigned int i = 0; i < vsp1->info->lif_count; ++i)
 		vsp1_write(vsp1, VI6_DISP_IRQ_ENB(i), 0);
-	for (i = 0; i < vsp1->info->wpf_count; ++i)
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i)
 		vsp1_write(vsp1, VI6_WPF_IRQ_ENB(i), 0);
 }
 
@@ -891,7 +884,6 @@ static const struct vsp1_device_info rzg2l_vsp2_device_info = {
 static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
 {
 	const struct vsp1_device_info *info;
-	unsigned int i;
 	u32 model;
 	u32 soc;
 
@@ -909,7 +901,7 @@ static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
 	model = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
 	soc = vsp1->version & VI6_IP_VERSION_SOC_MASK;
 
-	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
 		info = &vsp1_device_infos[i];
 
 		if (model == info->version && (!info->soc || soc == info->soc))
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 2ae2a573f0de..26b21559878d 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -372,10 +372,8 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state)
 {
-	unsigned int pad;
-
 	/* Initialize all pad formats with default values. */
-	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
+	for (unsigned int pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
 			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 0ef512e3a94b..d3eaa7c2d595 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
@@ -42,7 +42,6 @@ void vsp1_hgo_frame_end(struct vsp1_entity *entity)
 {
 	struct vsp1_hgo *hgo = to_hgo(&entity->subdev);
 	struct vsp1_histogram_buffer *buf;
-	unsigned int i;
 	size_t size;
 	u32 *data;
 
@@ -56,7 +55,7 @@ void vsp1_hgo_frame_end(struct vsp1_entity *entity)
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_MAXMIN);
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_SUM);
 
-		for (i = 0; i < 256; ++i) {
+		for (unsigned int i = 0; i < 256; ++i) {
 			vsp1_write(hgo->histo.entity.vsp1,
 				   VI6_HGO_EXT_HIST_ADDR, i);
 			*data++ = vsp1_hgo_read(hgo, VI6_HGO_EXT_HIST_DATA);
@@ -67,7 +66,7 @@ void vsp1_hgo_frame_end(struct vsp1_entity *entity)
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_MAXMIN);
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_SUM);
 
-		for (i = 0; i < 64; ++i)
+		for (unsigned int i = 0; i < 64; ++i)
 			*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_HISTO(i));
 
 		size = (2 + 64) * sizeof(u32);
@@ -80,7 +79,7 @@ void vsp1_hgo_frame_end(struct vsp1_entity *entity)
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_G_SUM);
 		*data++ = vsp1_hgo_read(hgo, VI6_HGO_B_SUM);
 
-		for (i = 0; i < 64; ++i) {
+		for (unsigned int i = 0; i < 64; ++i) {
 			data[i] = vsp1_hgo_read(hgo, VI6_HGO_R_HISTO(i));
 			data[i+64] = vsp1_hgo_read(hgo, VI6_HGO_G_HISTO(i));
 			data[i+128] = vsp1_hgo_read(hgo, VI6_HGO_B_HISTO(i));
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
index 78b5a9201c70..8c04bdec8510 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
@@ -42,8 +42,6 @@ void vsp1_hgt_frame_end(struct vsp1_entity *entity)
 {
 	struct vsp1_hgt *hgt = to_hgt(&entity->subdev);
 	struct vsp1_histogram_buffer *buf;
-	unsigned int m;
-	unsigned int n;
 	u32 *data;
 
 	buf = vsp1_histogram_buffer_get(&hgt->histo);
@@ -55,9 +53,10 @@ void vsp1_hgt_frame_end(struct vsp1_entity *entity)
 	*data++ = vsp1_hgt_read(hgt, VI6_HGT_MAXMIN);
 	*data++ = vsp1_hgt_read(hgt, VI6_HGT_SUM);
 
-	for (m = 0; m < 6; ++m)
-		for (n = 0; n < 32; ++n)
+	for (unsigned int m = 0; m < 6; ++m) {
+		for (unsigned int n = 0; n < 32; ++n)
 			*data++ = vsp1_hgt_read(hgt, VI6_HGT_HISTO(m, n));
+	}
 
 	vsp1_histogram_buffer_complete(&hgt->histo, buf, HGT_DATA_SIZE);
 }
@@ -71,7 +70,6 @@ void vsp1_hgt_frame_end(struct vsp1_entity *entity)
 static int hgt_hue_areas_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	const u8 *values = ctrl->p_new.p_u8;
-	unsigned int i;
 
 	/*
 	 * The hardware has constraints on the hue area boundaries beyond the
@@ -83,7 +81,7 @@ static int hgt_hue_areas_try_ctrl(struct v4l2_ctrl *ctrl)
 	 *
 	 * Start by verifying the common part...
 	 */
-	for (i = 1; i < (HGT_NUM_HUE_AREAS * 2) - 1; ++i) {
+	for (unsigned int i = 1; i < (HGT_NUM_HUE_AREAS * 2) - 1; ++i) {
 		if (values[i] > values[i+1])
 			return -EINVAL;
 	}
@@ -138,7 +136,6 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
 	unsigned int vratio;
 	u8 lower;
 	u8 upper;
-	unsigned int i;
 
 	crop = v4l2_subdev_state_get_crop(state, HISTO_PAD_SINK);
 	compose = v4l2_subdev_state_get_compose(state, HISTO_PAD_SINK);
@@ -153,7 +150,7 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
 		       (crop->height << VI6_HGT_SIZE_VSIZE_SHIFT));
 
 	scoped_guard(mutex, hgt->ctrls.lock) {
-		for (i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
+		for (unsigned int i = 0; i < HGT_NUM_HUE_AREAS; ++i) {
 			lower = hgt->hue_areas[i*2 + 0];
 			upper = hgt->hue_areas[i*2 + 1];
 			vsp1_hgt_write(hgt, dlb, VI6_HGT_HUE_AREA(i),
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
index a22c31e17cb7..6433b5515ef9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
@@ -40,13 +40,12 @@ static inline void vsp1_lut_write(struct vsp1_lut *lut,
 static int lut_set_table(struct vsp1_lut *lut, struct v4l2_ctrl *ctrl)
 {
 	struct vsp1_dl_body *dlb;
-	unsigned int i;
 
 	dlb = vsp1_dl_body_get(lut->pool);
 	if (!dlb)
 		return -ENOMEM;
 
-	for (i = 0; i < LUT_SIZE; ++i)
+	for (unsigned int i = 0; i < LUT_SIZE; ++i)
 		vsp1_dl_body_write(dlb, VI6_LUT_TABLE + 4 * i,
 				       ctrl->p_new.p_u32[i]);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index 7197f2917417..ca0ec00b9deb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -391,16 +391,15 @@ void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
 void vsp1_pipeline_reset(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_entity *entity;
-	unsigned int i;
 
 	if (pipe->brx) {
 		struct vsp1_brx *brx = to_brx(&pipe->brx->subdev);
 
-		for (i = 0; i < ARRAY_SIZE(brx->inputs); ++i)
+		for (unsigned int i = 0; i < ARRAY_SIZE(brx->inputs); ++i)
 			brx->inputs[i].rpf = NULL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(pipe->inputs); ++i)
+	for (unsigned int i = 0; i < ARRAY_SIZE(pipe->inputs); ++i)
 		pipe->inputs[i] = NULL;
 
 	pipe->output = NULL;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index b0eae54273a0..fa57e241f827 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -104,14 +104,13 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 	const struct vsp1_format_info *info;
 	unsigned int width = pix->width;
 	unsigned int height = pix->height;
-	unsigned int i;
 
 	/*
 	 * Backward compatibility: replace deprecated RGB formats by their XRGB
 	 * equivalent. This selects the format older userspace applications want
 	 * while still exposing the new format.
 	 */
-	for (i = 0; i < ARRAY_SIZE(xrgb_formats); ++i) {
+	for (unsigned int i = 0; i < ARRAY_SIZE(xrgb_formats); ++i) {
 		if (xrgb_formats[i][0] == pix->pixelformat) {
 			pix->pixelformat = xrgb_formats[i][1];
 			break;
@@ -161,7 +160,7 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 	 * the datasheet, strides not aligned to a multiple of 128 bytes result
 	 * in image corruption.
 	 */
-	for (i = 0; i < min(info->planes, 2U); ++i) {
+	for (unsigned int i = 0; i < min(info->planes, 2U); ++i) {
 		unsigned int hsub = i > 0 ? info->hsub : 1;
 		unsigned int vsub = i > 0 ? info->vsub : 1;
 		unsigned int align = 128;
@@ -209,7 +208,6 @@ vsp1_video_complete_buffer(struct vsp1_video *video)
 	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
 	struct vsp1_vb2_buffer *next = NULL;
 	struct vsp1_vb2_buffer *done;
-	unsigned int i;
 
 	scoped_guard(spinlock_irqsave, &video->irqlock) {
 		if (list_empty(&video->irqqueue))
@@ -227,7 +225,7 @@ vsp1_video_complete_buffer(struct vsp1_video *video)
 
 	done->buf.sequence = pipe->sequence;
 	done->buf.vb2_buf.timestamp = ktime_get_ns();
-	for (i = 0; i < done->buf.vb2_buf.num_planes; ++i)
+	for (unsigned int i = 0; i < done->buf.vb2_buf.num_planes; ++i)
 		vb2_set_plane_payload(&done->buf.vb2_buf, i,
 				      vb2_plane_size(&done->buf.vb2_buf, i));
 	vb2_buffer_done(&done->buf.vb2_buf, VB2_BUF_STATE_DONE);
@@ -267,7 +265,6 @@ static void vsp1_video_pipeline_run(struct vsp1_pipeline *pipe)
 	struct vsp1_entity *entity;
 	struct vsp1_dl_body *dlb;
 	struct vsp1_dl_list *dl;
-	unsigned int partition;
 
 	dl = vsp1_dl_list_get(pipe->output->dlm);
 
@@ -289,7 +286,7 @@ static void vsp1_video_pipeline_run(struct vsp1_pipeline *pipe)
 	vsp1_video_pipeline_run_partition(pipe, dl, 0);
 
 	/* Process consecutive partitions as necessary. */
-	for (partition = 1; partition < pipe->partitions; ++partition) {
+	for (unsigned int partition = 1; partition < pipe->partitions; ++partition) {
 		struct vsp1_dl_list *dl_next;
 
 		dl_next = vsp1_dl_list_get(pipe->output->dlm);
@@ -320,13 +317,12 @@ static void vsp1_video_pipeline_frame_end(struct vsp1_pipeline *pipe,
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
 	enum vsp1_pipeline_state state;
-	unsigned int i;
 
 	/* M2M Pipelines should never call here with an incomplete frame. */
 	WARN_ON_ONCE(!(completion & VSP1_DL_FRAME_END_COMPLETED));
 
 	/* Complete buffers on all video nodes. */
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		if (!pipe->inputs[i])
 			continue;
 
@@ -444,7 +440,6 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 	struct media_graph graph;
 	struct media_entity *entity = &video->video.entity;
 	struct media_device *mdev = entity->graph_obj.mdev;
-	unsigned int i;
 	int ret;
 
 	/* Walk the graph to locate the entities and video nodes. */
@@ -512,7 +507,7 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 	 * Follow links downstream for each input and make sure the graph
 	 * contains no loop and that all branches end at the output WPF.
 	 */
-	for (i = 0; i < video->vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < video->vsp1->info->rpf_count; ++i) {
 		if (!pipe->inputs[i])
 			continue;
 
@@ -601,13 +596,12 @@ vsp1_video_queue_setup(struct vb2_queue *vq,
 {
 	struct vsp1_video *video = vb2_get_drv_priv(vq);
 	const struct v4l2_pix_format_mplane *format = &video->rwpf->format;
-	unsigned int i;
 
 	if (*nplanes) {
 		if (*nplanes != format->num_planes)
 			return -EINVAL;
 
-		for (i = 0; i < *nplanes; i++)
+		for (unsigned int i = 0; i < *nplanes; i++)
 			if (sizes[i] < format->plane_fmt[i].sizeimage)
 				return -EINVAL;
 		return 0;
@@ -615,7 +609,7 @@ vsp1_video_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = format->num_planes;
 
-	for (i = 0; i < format->num_planes; ++i)
+	for (unsigned int i = 0; i < format->num_planes; ++i)
 		sizes[i] = format->plane_fmt[i].sizeimage;
 
 	return 0;
@@ -677,7 +671,6 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 	const struct v4l2_mbus_framefmt *format;
 	struct vsp1_entity *entity;
 	unsigned int div_size;
-	unsigned int i;
 
 	/*
 	 * Partitions are computed on the size before rotation, use the format
@@ -711,7 +704,7 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
 	if (!pipe->part_table)
 		return -ENOMEM;
 
-	for (i = 0; i < pipe->partitions; ++i)
+	for (unsigned int i = 0; i < pipe->partitions; ++i)
 		vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[i],
 						  div_size, i);
 
@@ -1111,7 +1104,6 @@ static const struct media_entity_operations vsp1_video_media_ops = {
 
 void vsp1_video_suspend(struct vsp1_device *vsp1)
 {
-	unsigned int i;
 	int ret;
 
 	/*
@@ -1119,7 +1111,7 @@ void vsp1_video_suspend(struct vsp1_device *vsp1)
 	 * pipelines twice, first to set them all to the stopping state, and
 	 * then to wait for the stop to complete.
 	 */
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		struct vsp1_rwpf *wpf = vsp1->wpf[i];
 		struct vsp1_pipeline *pipe;
 
@@ -1136,7 +1128,7 @@ void vsp1_video_suspend(struct vsp1_device *vsp1)
 		}
 	}
 
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		struct vsp1_rwpf *wpf = vsp1->wpf[i];
 		struct vsp1_pipeline *pipe;
 
@@ -1157,10 +1149,8 @@ void vsp1_video_suspend(struct vsp1_device *vsp1)
 
 void vsp1_video_resume(struct vsp1_device *vsp1)
 {
-	unsigned int i;
-
 	/* Resume all running pipelines. */
-	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->wpf_count; ++i) {
 		struct vsp1_rwpf *wpf = vsp1->wpf[i];
 		struct vsp1_pipeline *pipe;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 0ec707d2913f..821887815eb2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -232,7 +232,6 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *source_format;
 	const struct v4l2_mbus_framefmt *sink_format;
 	unsigned int index = wpf->entity.index;
-	unsigned int i;
 	u32 outfmt = 0;
 	u32 srcrpf = 0;
 	int ret;
@@ -314,7 +313,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	 * inputs as sub-layers and select the virtual RPF as the master
 	 * layer. For VSPX configure the enabled sources as masters.
 	 */
-	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+	for (unsigned int i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *input = pipe->inputs[i];
 
 		if (!input)
@@ -399,7 +398,6 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	unsigned int left;
 	unsigned int offset;
 	unsigned int flip;
-	unsigned int i;
 
 	/*
 	 * Cropping. The partition algorithm can split the image into multiple
@@ -448,7 +446,7 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	else
 		offset = left;
 
-	for (i = 0; i < format->num_planes; ++i) {
+	for (unsigned int i = 0; i < format->num_planes; ++i) {
 		unsigned int hsub = i > 0 ? fmtinfo->hsub : 1;
 		unsigned int vsub = i > 0 ? fmtinfo->vsub : 1;
 
@@ -490,7 +488,7 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 		 * Compute the output coordinate. The partition
 		 * horizontal (left) offset becomes a vertical offset.
 		 */
-		for (i = 0; i < format->num_planes; ++i) {
+		for (unsigned int i = 0; i < format->num_planes; ++i) {
 			unsigned int hsub = i > 0 ? fmtinfo->hsub : 1;
 
 			mem.addr[i] += hoffset / hsub
-- 
Regards,

Laurent Pinchart


