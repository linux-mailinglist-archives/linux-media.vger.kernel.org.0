Return-Path: <linux-media+bounces-63971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qZ+nA3RKI2oVoAEAu9opvQ
	(envelope-from <linux-media+bounces-63971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6764B969
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63971-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63971-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 077A4305616D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33B13D4123;
	Fri,  5 Jun 2026 22:08:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25124192EA
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697317; cv=none; b=OpInirbIO4OpsaGV6KTyApJLilstosndY1ZI03FSn44ymnBLpy33urVqDTo8FoPBmgVIFBW0z6RKw0RHXeh5u5mQGFQQCMXW5pwYgBK4mqtb14gxkqaF8eM9oNBAv8QYzHs1vQYCBCzc6xtfda0mvTHzLMAqHzpffp7a2/ripUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697317; c=relaxed/simple;
	bh=k+VeuzoqUVqVnWHcMCJVI9Mw8uHdDe+vIOQrWpAAza8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUu8FFSusKLDNJ4Q1mDldPbETZNoyTCcmjK18nYCKrRzuo6IBbyskZAJQLZ0pmQSFuJ8jc0uPiQsFrAklNstwZVFpT2RRxixc70BWkQSLPPHK1vZ5402Z4nZD3ULYKaAFnslKDEUoL+4r+X1j1eFm6lLJPnxZ9gB0Mz+Qj1IZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci4-0000LW-3e; Sat, 06 Jun 2026 00:08:12 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:51 +0200
Subject: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs
 in parallel
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,m:s.pueschel@pengutronix.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63971-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:from_mime,pengutronix.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0F6764B969

Add support for running multiple jobs in parallel for SoCs containing
multiple identical devices. An example is the Rockchip RK3588 SoC,
which contains two identical RGA3 devices. Therefore it is desirable to
have the kernel schedule the work across all available devices and only
expose one video device to the userspace.

Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
currently running context. But the currently running context will always
be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
check if the queue head is already running, the curr_ctx member can be
completely dropped

To avoid queueing too many parallel jobs, the
v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
to set the number of parallel jobs and avoids calling device_run when
the given number of jobs is already running. This is set to 1 by default
to prevent parallel job runs. Drivers with the need and support for
scheduling jobs can adjust this value accordingly.

Note that this change doesn't allow a context to be used multiple times
in parallel. So a single stream won't be able to utilize multiple devices
at once, but N streams can utilize up to N devices. This is caused by the
fact that a context is not added multiple times to the job_list and also
holds the job_flags to distinguish if it's currently running.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 89 ++++++++++++++++++++++------------
 include/media/v4l2-mem2mem.h           |  3 ++
 2 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..14ac9c85803d1 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -84,16 +84,15 @@ static const char * const m2m_entity_name[] = {
  *			v4l2_m2m_unregister_media_controller().
  * @intf_devnode:	&struct media_intf devnode pointer with the interface
  *			with controls the M2M device.
- * @curr_ctx:		currently running instance
  * @job_queue:		instances queued to run
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
  * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
+ * @max_parallel_jobs:	max job_queue instances number marked as running
  * @m2m_ops:		driver callbacks
  * @kref:		device reference count
  */
 struct v4l2_m2m_dev {
-	struct v4l2_m2m_ctx	*curr_ctx;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_entity	*source;
 	struct media_pad	source_pad;
@@ -108,6 +107,7 @@ struct v4l2_m2m_dev {
 	spinlock_t		job_spinlock;
 	struct work_struct	job_work;
 	unsigned long		job_queue_flags;
+	u32			max_parallel_jobs;
 
 	const struct v4l2_m2m_ops *m2m_ops;
 
@@ -123,6 +123,12 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
 		return &m2m_ctx->cap_q_ctx;
 }
 
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs)
+{
+	m2m_dev->max_parallel_jobs = max_parallel_jobs;
+}
+
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type)
 {
@@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
 void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	void *ret = NULL;
+	struct v4l2_m2m_ctx *first_ctx;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (m2m_dev->curr_ctx)
-		ret = m2m_dev->curr_ctx->priv;
+	if (list_empty(&m2m_dev->job_queue)) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		return NULL;
+	}
+
+	first_ctx = list_first_entry(&m2m_dev->job_queue,
+				     struct v4l2_m2m_ctx, queue);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	return ret;
+	if (first_ctx->job_flags & TRANS_RUNNING)
+		return first_ctx->priv;
+	else
+		return NULL;
 }
 EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 
@@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
+	struct v4l2_m2m_ctx *ctx;
+	struct v4l2_m2m_ctx *chosen_ctx = NULL;
+	u32 running_jobs = 0;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (NULL != m2m_dev->curr_ctx) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-		dprintk("Another instance is running, won't run now\n");
-		return;
-	}
 
 	if (list_empty(&m2m_dev->job_queue)) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
@@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 		return;
 	}
 
-	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
-				   struct v4l2_m2m_ctx, queue);
-	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
+	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
+		if (!(ctx->job_flags & TRANS_RUNNING)) {
+			chosen_ctx = ctx;
+			break;
+		}
+
+		running_jobs++;
+	}
+	if (running_jobs >= m2m_dev->max_parallel_jobs) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("Maximum number of parallel jobs reached\n");
+		return;
+	}
+	if (!chosen_ctx) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("All jobs already running\n");
+		return;
+	}
+
+	chosen_ctx->job_flags |= TRANS_RUNNING;
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
-	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
+	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
+	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
 }
 
 /*
@@ -469,15 +498,14 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				 struct v4l2_m2m_ctx *m2m_ctx)
 {
-	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx != m2m_ctx) {
+	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
 		dprintk("Called by an instance not currently running\n");
 		return false;
 	}
 
-	list_del(&m2m_dev->curr_ctx->queue);
-	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
-	wake_up(&m2m_dev->curr_ctx->finished);
-	m2m_dev->curr_ctx = NULL;
+	list_del(&m2m_ctx->queue);
+	m2m_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
+	wake_up(&m2m_ctx->finished);
 	return true;
 }
 
@@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	struct v4l2_m2m_ctx *curr_ctx;
+	struct v4l2_m2m_ctx *ctx;
+	struct v4l2_m2m_ctx *ctx_safe;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
-	curr_ctx = m2m_dev->curr_ctx;
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	if (curr_ctx)
-		wait_event(curr_ctx->finished,
-			   !(curr_ctx->job_flags & TRANS_RUNNING));
+	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue) {
+		if (!(ctx->job_flags & TRANS_RUNNING))
+			break;
+
+		wait_event(ctx->finished, !(ctx->job_flags & TRANS_RUNNING));
+	}
 }
 EXPORT_SYMBOL(v4l2_m2m_suspend);
 
@@ -896,10 +927,8 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	q_ctx->num_rdy = 0;
 	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
 
-	if (m2m_dev->curr_ctx == m2m_ctx) {
-		m2m_dev->curr_ctx = NULL;
+	if (m2m_ctx->job_flags & TRANS_RUNNING)
 		wake_up(&m2m_ctx->finished);
-	}
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 
 	return 0;
@@ -1194,12 +1223,12 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
 	if (!m2m_dev)
 		return ERR_PTR(-ENOMEM);
 
-	m2m_dev->curr_ctx = NULL;
 	m2m_dev->m2m_ops = m2m_ops;
 	INIT_LIST_HEAD(&m2m_dev->job_queue);
 	spin_lock_init(&m2m_dev->job_spinlock);
 	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
 	kref_init(&m2m_dev->kref);
+	m2m_dev->max_parallel_jobs = 1;
 
 	return m2m_dev;
 }
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b98..e6177d0eaf637 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -594,6 +594,9 @@ static inline void v4l2_m2m_set_dst_buffered(struct v4l2_m2m_ctx *m2m_ctx,
 	m2m_ctx->cap_q_ctx.buffered = buffered;
 }
 
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs);
+
 /**
  * v4l2_m2m_ctx_release() - release m2m context
  *

-- 
2.54.0


