Return-Path: <linux-media+bounces-62094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIa4M84ADGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1C577E6D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 153CD3006021
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9624C3A875F;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtH7gXJR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B5439656E;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171356; cv=none; b=tlQgYZ8pScixfPMlhYaRHa2qKOUOZio/MR8cS8kgAJk3vGBef0aJeA974twXrTqdcMXKl9h1I6bOxjUTgGzluA5qkp2cO865b2JlxAA+7Hp8ezHI+5ROc04msj+RmWGvXN66hHiQ1r9sOgHz6Kx5Dtsmi1V7TES0L6L4t2c+hQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171356; c=relaxed/simple;
	bh=2x0ezV+sn7dzDHiVkyxYzn8bOlucXgMKLmSOh1D1K40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qlo3IH+gurYCMZk1217b1dBh4P1XaqiyfV9VbEcCWR2kGdGcE/9v0Afi+SXDnA7rg8ISV5zyYjCr1lRhg7aWntLMo+qRXxuiQuF6JjGN4ZkmUV1RkHUAoBBZyEckyPDOi+GJQCT2+YsrygtxgR5290vshcPPCGrvrCxOYB/DIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtH7gXJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24DDEC32781;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171356;
	bh=2x0ezV+sn7dzDHiVkyxYzn8bOlucXgMKLmSOh1D1K40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rtH7gXJRMV2lQVK8jg3IeHApNSHwT6HXZFPAHKEccroHrQEeoAjfZ/eiRqUjZR3E+
	 S21BZpUl2nLqDBVqijpexl3y5F+bEc20mcu3nbgWWAVcc7ocooj3S1/aCCUyYsXqXS
	 +Ee4pggATFovE9Nr0MVncsE8BTYZbqMLt8hQ49f8MDCHT4q4pOhdm6ZTZ2TrRWc3Wk
	 F1t6CaX9rbog6upU8fRT5pMKRbsDd2c+RrPuWloWIBs64LL3TYt7okClEZqRk2ROuF
	 CbWhBylhOMGnKFcyIIh8x+X4KZ2Yztq6GY1j/oohd2rgXXUksrwZqhaZyJTv3pN8RJ
	 SNCBBq3OClpIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2F9CD4F54;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:46:03 +0530
Subject: [PATCH 13/15] accel/qda: Add DSP process creation and release
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-13-b2d984c297f8@oss.qualcomm.com>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
In-Reply-To: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=17202;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=6sIWlJTbKDkpmsM/KuGNbGF7X0bHhf13ZgQKEfZrOjk=;
 b=u9wyNS+28yILoi49rqUKoR6MP0Gx0FxBOOZWDaW2tP0s/nNkaiIlyvpqbxkRyJz+6sEA/yT+x
 BqclLupr7fbD+ox5SpAfuLJMNixCPa7P9fWNzK3x+rqEjADHkRKo0te
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62094-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: D6A1C577E6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Implement the REMOTE_SESSION_CREATE and INIT_RELEASE FastRPC
operations, which establish and tear down a user process on the
DSP.

DRM_IOCTL_QDA_REMOTE_SESSION_CREATE (drm_qda_init_create)
  Creates a new process on the DSP by sending an INIT_CREATE message
  via the FastRPC INIT_HANDLE. The caller provides an ELF file (via
  DMA-BUF fd or direct pointer) and optional process attributes. A
  4 MB GEM buffer is allocated per session to hold the DSP process
  image; this buffer is stored in qda_file_priv and reused for the
  lifetime of the session.

  If attrs is non-zero, INIT_CREATE_ATTR is used instead of
  INIT_CREATE to pass the extended attribute and signature fields.

INIT_RELEASE
  Sends a release message to the DSP when the DRM file is closed
  (qda_postclose via qda_release_dsp_process), freeing the remote
  process and its resources. The release is skipped if the device
  has already been unplugged.

qda_fastrpc.c
  fastrpc_prepare_args_init_create() marshals the six-argument
  create-process payload: the inbuf descriptor, process name,
  ELF file, physical pages, attrs, and siglen.
  fastrpc_prepare_args_release_process() marshals the single-
  argument release payload (remote_session_id).

qda_drv.c
  qda_postclose() is extended to call qda_release_dsp_process()
  under drm_dev_enter() so the release message is only sent while
  the device is still accessible.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |   8 +++
 drivers/accel/qda/qda_drv.h     |   5 ++
 drivers/accel/qda/qda_fastrpc.c | 140 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  39 +++++++++--
 drivers/accel/qda/qda_ioctl.c   |  52 +++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |   1 +
 include/uapi/drm/qda_accel.h    |  32 ++++++++-
 7 files changed, 270 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 704c7d3127d2..4eaba9b050c0 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -36,6 +36,13 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
 static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct qda_file_priv *qda_file_priv = file->driver_priv;
+	int idx;
+
+	/* Only send the DSP release message while the device is accessible */
+	if (drm_dev_enter(dev, &idx)) {
+		qda_release_dsp_process(qda_file_priv->qda_dev, file);
+		drm_dev_exit(idx);
+	}
 
 	if (qda_file_priv->assigned_iommu_dev) {
 		struct qda_iommu_device *iommu_dev = qda_file_priv->assigned_iommu_dev;
@@ -59,6 +66,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 };
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 420cccff42bf..4b4639961d95 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -28,6 +28,8 @@ struct qda_file_priv {
 	struct qda_dev *qda_dev;
 	/** @assigned_iommu_dev: IOMMU device assigned to this process */
 	struct qda_iommu_device *assigned_iommu_dev;
+	/** @init_mem_gem_obj: GEM object for PD initialization memory */
+	struct qda_gem_obj *init_mem_gem_obj;
 	/** @pid: Process ID for tracking */
 	pid_t pid;
 	/** @remote_session_id: Unique session identifier */
@@ -83,4 +85,7 @@ void qda_deinit_device(struct qda_dev *qdev);
 int qda_register_device(struct qda_dev *qdev);
 void qda_unregister_device(struct qda_dev *qdev);
 
+/* DSP process / protection domain management */
+int qda_release_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
+
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 0ec37175a098..305915022b91 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -524,6 +524,138 @@ int qda_fastrpc_invoke_unpack(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static void setup_create_process_args(struct drm_qda_fastrpc_invoke_args *args,
+				      struct fastrpc_create_process_inbuf *inbuf,
+				      struct drm_qda_init_create *init,
+				      struct fastrpc_phy_page *pages)
+{
+	args[0].ptr = (u64)(uintptr_t)inbuf;
+	args[0].length = sizeof(*inbuf);
+	args[0].fd = -1;
+
+	args[1].ptr = (u64)(uintptr_t)current->comm;
+	args[1].length = inbuf->namelen;
+	args[1].fd = -1;
+
+	args[2].ptr = (u64)init->file;
+	args[2].length = inbuf->filelen;
+	args[2].fd = init->filefd;	/* DMA-BUF fd forwarded to DSP */
+
+	args[3].ptr = (u64)(uintptr_t)pages;
+	args[3].length = 1 * sizeof(*pages);
+	args[3].fd = -1;
+
+	args[4].ptr = (u64)(uintptr_t)&inbuf->attrs;
+	args[4].length = sizeof(inbuf->attrs);
+	args[4].fd = -1;
+
+	args[5].ptr = (u64)(uintptr_t)&inbuf->siglen;
+	args[5].length = sizeof(inbuf->siglen);
+	args[5].fd = -1;
+}
+
+static void setup_single_arg(struct drm_qda_fastrpc_invoke_args *args, const void *ptr, size_t size)
+{
+	args[0].ptr = (u64)(uintptr_t)ptr;
+	args[0].length = size;
+	args[0].fd = -1;
+}
+
+static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *ctx)
+{
+	struct drm_qda_fastrpc_invoke_args *args;
+
+	args = kzalloc_obj(*args);
+	if (!args)
+		return -ENOMEM;
+
+	setup_single_arg(args, &ctx->remote_session_id, sizeof(ctx->remote_session_id));
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
+	ctx->args = args;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+}
+
+static int fastrpc_prepare_args_init_create(struct fastrpc_invoke_context *ctx,
+					    char __user *argp)
+{
+	struct drm_qda_init_create init;
+	struct drm_qda_fastrpc_invoke_args *args;
+	struct fastrpc_create_process_inbuf *inbuf;
+	int err;
+	u32 sc;
+
+	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	ctx->input_pages = kcalloc(1, sizeof(*ctx->input_pages), GFP_KERNEL);
+	if (!ctx->input_pages) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+
+	ctx->inbuf = kcalloc(1, sizeof(*inbuf), GFP_KERNEL);
+	if (!ctx->inbuf) {
+		err = -ENOMEM;
+		goto err_free_input_pages;
+	}
+	inbuf = ctx->inbuf;
+
+	memcpy(&init, argp, sizeof(init));
+
+	if (init.filelen > FASTRPC_INIT_FILELEN_MAX) {
+		err = -EINVAL;
+		goto err_free_inbuf;
+	}
+
+	/*
+	 * Validate that the DMA-BUF fd is importable.  The fd itself is kept
+	 * in init.filefd and forwarded to the DSP via setup_create_process_args().
+	 */
+	if (init.filelen && init.filefd > 0) {
+		struct drm_gem_object *file_gem_obj;
+
+		err = get_gem_obj_from_dmabuf_fd(ctx, init.filefd, &file_gem_obj);
+		if (err) {
+			err = -EINVAL;
+			goto err_free_inbuf;
+		}
+		drm_gem_object_put(file_gem_obj);
+	}
+
+	inbuf->remote_session_id = ctx->remote_session_id;
+	inbuf->namelen = strlen(current->comm) + 1;
+	inbuf->filelen = init.filelen;
+	inbuf->pageslen = 1;
+	inbuf->attrs = init.attrs;
+	inbuf->siglen = init.siglen;
+
+	setup_pages_from_gem_obj(ctx->init_mem_gem_obj, &ctx->input_pages[0]);
+
+	setup_create_process_args(args, inbuf, &init, ctx->input_pages);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
+	if (init.attrs)
+		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
+	ctx->sc = sc;
+	ctx->args = args;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+
+err_free_inbuf:
+	kfree(ctx->inbuf);
+	ctx->inbuf = NULL;
+err_free_input_pages:
+	kfree(ctx->input_pages);
+	ctx->input_pages = NULL;
+err_free_args:
+	kfree(args);
+	return err;
+}
+
 static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	struct drm_qda_invoke_args invoke_args;
@@ -568,6 +700,14 @@ int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *ar
 	int err;
 
 	switch (ctx->type) {
+	case FASTRPC_RMID_INIT_RELEASE:
+		err = fastrpc_prepare_args_release_process(ctx);
+		break;
+	case FASTRPC_RMID_INIT_CREATE:
+	case FASTRPC_RMID_INIT_CREATE_ATTR:
+		ctx->pd = QDA_USER_PD;
+		err = fastrpc_prepare_args_init_create(ctx, argp);
+		break;
 	case FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index ce77baeccfba..1c1236f9525e 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -127,6 +127,27 @@ struct fastrpc_invoke_buf {
 	u32 pgidx;
 };
 
+/**
+ * struct fastrpc_create_process_inbuf - Input buffer for process creation
+ *
+ * This structure defines the input buffer format for creating a new
+ * process on the remote DSP.
+ */
+struct fastrpc_create_process_inbuf {
+	/** @remote_session_id: Client identifier for the session */
+	int remote_session_id;
+	/** @namelen: Length of the process name string including NUL terminator */
+	u32 namelen;
+	/** @filelen: Length of the ELF shell file in bytes */
+	u32 filelen;
+	/** @pageslen: Number of physical page descriptors */
+	u32 pageslen;
+	/** @attrs: Process attribute flags */
+	u32 attrs;
+	/** @siglen: Length of the signature data in bytes */
+	u32 siglen;
+};
+
 /**
  * struct fastrpc_msg - FastRPC wire message for remote invocations
  *
@@ -153,10 +174,6 @@ struct fastrpc_msg {
 
 /**
  * struct qda_msg - FastRPC message with kernel-internal bookkeeping
- *
- * The wire-format portion is kept in the embedded @fastrpc member (must
- * be first) so that &qda_msg->fastrpc can be passed directly to
- * rpmsg_send() without a copy.
  */
 struct qda_msg {
 	/**
@@ -245,7 +262,7 @@ struct fastrpc_invoke_context {
 	struct qda_gem_obj *msg_gem_obj;
 	/** @file_priv: DRM file private data */
 	struct drm_file *file_priv;
-	/** @init_mem_gem_obj: GEM object for protection domain init memory */
+	/** @init_mem_gem_obj: GEM object for PD initialization memory */
 	struct qda_gem_obj *init_mem_gem_obj;
 	/** @req: Pointer to kernel-internal request buffer */
 	void *req;
@@ -256,11 +273,23 @@ struct fastrpc_invoke_context {
 };
 
 /* Remote Method ID table - identifies initialization and control operations */
+#define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP process */
+#define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
+#define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
 #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
 #define FASTRPC_INIT_HANDLE		0x1
 
+/* Protection Domain (PD) identifiers */
+#define QDA_ROOT_PD		(0)
+#define QDA_USER_PD		(1)
+
+/* Number of arguments for process creation */
+#define FASTRPC_CREATE_PROCESS_NARGS	6
+/* Maximum initialization file size (4 MB) */
+#define FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
+
 void qda_fastrpc_context_free(struct kref *ref);
 struct fastrpc_invoke_context *qda_fastrpc_context_alloc(void);
 int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp);
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index c81268c20b04..33f0a798ad13 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -109,6 +109,7 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	struct drm_gem_object *gem_obj;
 	int err;
 	size_t hdr_size;
+	size_t initmem_size = FASTRPC_INIT_FILELEN_MAX;
 
 	ctx = qda_fastrpc_context_alloc();
 	if (IS_ERR(ctx))
@@ -124,6 +125,27 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	ctx->file_priv = file_priv;
 	ctx->remote_session_id = qda_file_priv->remote_session_id;
 
+	if (type == FASTRPC_RMID_INIT_CREATE) {
+		struct drm_gem_object *initmem_gem_obj;
+
+		if (qda_file_priv->init_mem_gem_obj) {
+			drm_gem_object_put(&qda_file_priv->init_mem_gem_obj->base);
+			qda_file_priv->init_mem_gem_obj = NULL;
+		}
+
+		initmem_gem_obj = qda_gem_create_object(dev, qdev->iommu_mgr,
+							initmem_size, file_priv);
+		if (IS_ERR(initmem_gem_obj)) {
+			err = PTR_ERR(initmem_gem_obj);
+			goto err_context_free;
+		}
+
+		ctx->init_mem_gem_obj = to_qda_gem_obj(initmem_gem_obj);
+		qda_file_priv->init_mem_gem_obj = ctx->init_mem_gem_obj;
+	} else if (type == FASTRPC_RMID_INIT_RELEASE) {
+		ctx->init_mem_gem_obj = qda_file_priv->init_mem_gem_obj;
+	}
+
 	err = qda_fastrpc_prepare_args(ctx, (char __user *)data);
 	if (err)
 		goto err_context_free;
@@ -161,11 +183,41 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	return 0;
 
 err_context_free:
+	if (type == FASTRPC_RMID_INIT_RELEASE && !err && qda_file_priv->init_mem_gem_obj) {
+		drm_gem_object_put(&qda_file_priv->init_mem_gem_obj->base);
+		qda_file_priv->init_mem_gem_obj = NULL;
+	}
+
 	fastrpc_context_put_id(ctx, qdev);
 	kref_put(&ctx->refcount, qda_fastrpc_context_free);
 	return err;
 }
 
+/**
+ * qda_ioctl_init_create() - Create a DSP process
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_init_create)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
+}
+
+/**
+ * qda_release_dsp_process() - Release DSP process resources for a file
+ * @qdev: QDA device structure
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_release_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, &qdev->drm_dev, NULL, file_priv);
+}
+
 /**
  * qda_ioctl_invoke() - Perform a dynamic FastRPC method invocation
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 3bb9cfd98370..192565434363 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -9,6 +9,7 @@
 #include "qda_drv.h"
 
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 72512213741f..711e2523a570 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -21,8 +21,9 @@ extern "C" {
 #define DRM_QDA_QUERY		0x00
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
-/* Command numbers 0x03-0x06 reserved for INIT_ATTACH, INIT_CREATE, MAP, MUNMAP */
-#define DRM_QDA_REMOTE_INVOKE		0x07
+/* Command number 0x03 reserved for INIT_ATTACH; 0x05-0x06 reserved for MAP, MUNMAP */
+#define DRM_QDA_REMOTE_SESSION_CREATE		0x04
+#define DRM_QDA_REMOTE_INVOKE			0x07
 
 /*
  * QDA IOCTL definitions
@@ -37,6 +38,9 @@ extern "C" {
 					  struct drm_qda_gem_create)
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 					  struct drm_qda_gem_mmap_offset)
+#define DRM_IOCTL_QDA_REMOTE_SESSION_CREATE					\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_CREATE,		\
+		 struct drm_qda_init_create)
 #define DRM_IOCTL_QDA_REMOTE_INVOKE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_INVOKE, \
 					  struct drm_qda_invoke_args)
 
@@ -99,6 +103,30 @@ struct drm_qda_fastrpc_invoke_args {
 	__u32 attr;
 };
 
+/**
+ * struct drm_qda_init_create - Accelerator process initialization parameters
+ * @filelen: Length of the ELF file in bytes
+ * @filefd: DMA-BUF file descriptor containing the ELF file
+ * @attrs: Process attributes flags
+ * @siglen: Length of signature data in bytes
+ * @file: Pointer to ELF file data if not using filefd
+ *
+ * This structure is used with DRM_IOCTL_QDA_INIT_CREATE to initialize
+ * a new process on the accelerator. The process code is provided either
+ * via a file descriptor (filefd, typically a GEM object) or a direct
+ * pointer (file). Set file to 0 if using filefd.
+ *
+ * The attrs field contains bit flags for debug mode, privileged execution,
+ * and other process attributes.
+ */
+struct drm_qda_init_create {
+	__u32 filelen;
+	__s32 filefd;
+	__u32 attrs;
+	__u32 siglen;
+	__u64 file;
+};
+
 /**
  * struct drm_qda_invoke_args - Dynamic FastRPC invocation parameters
  * @handle: Remote handle to invoke on the DSP

-- 
2.34.1



