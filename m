Return-Path: <linux-media+bounces-67507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id orWJADI/VWoVmAAAu9opvQ
	(envelope-from <linux-media+bounces-67507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:40:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685974ECE2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:40:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=postmarketos.org header.s=key1 header.b=hZ1fStIX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67507-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67507-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=postmarketos.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 480C830102E8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EC835AC03;
	Mon, 13 Jul 2026 19:39:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271B34C155
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 19:39:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971587; cv=none; b=QLh5+PzMg9f35szLNXIqqmT3zZNkTzk00HeP0K7OlMXJrv8ObsEwYi9ctoxPIG6JrN0T6DHCmWQIF5X6NfMbc9uMz4CFSeo4RuneHec3v7svm8yi5jfc3TbyWU266sPUjCHyCmK3gHmXI9HJIzH8DcEfqEQpen6VMywdPGSiIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971587; c=relaxed/simple;
	bh=umF/sx6bIIwQeaYbboHdJAZQ6Y9hPQuDrP2Upx52huU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=fS9IvnKXuDL/de1EfRazbMMspJ6QhwuJ5lwfcAf6oLoT7Xl7XGOyZEa0ftrDWTqKVYtBoEYFxxqbpp2Jetqm78ungrcLrJZvQ/GaoNWk7ye5i43sNF0jbqMLTkZihKXc9QJODp+tSStBRT8efERDY4nTWtsN7qwYcMpYkOEACRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=hZ1fStIX; arc=none smtp.client-ip=91.218.175.181
Date: Mon, 13 Jul 2026 19:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1783971571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7JScJ65S74OmQCfQVJCxmKPT8+6MQO8A69eSEkL4aw=;
	b=hZ1fStIXHoXebScgXEUY3rFwJ4+lq+D+AiAHgD1Zjm5eSt1/tO2fWFHEsAzuHkb0klf3XY
	RHz/lTKZssFrq2fYTFhqUtwYujNeZIYzpE8CYtYltMzx9nll/CTkdN4Xl2+zZANRlcb1sq
	5Pb8YS9f1MJ4RhTzbS83H7u4LZ5obWRIIoNkR42QsoWiQ11RMH5sOPna5O29OIHDGvqGYH
	cbVIYALjS3Vu3kjL3cf95I+2mwhkfk9sBnYqi1qoyss8UV6W22tN4bwqVjhfdy+bjMlcld
	+DVd48ntM2N5oQW7wyL0ugTUa9Gbj2EPuLK9am1jkzKsKlrOixQ2j77yxXsSag==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
References: <20260713181602.773-1-alfievarghese22@gmail.com>
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
Message-ID: <ti4p9r.3t6o48on8v4gw@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67507-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com,linaro.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-amlogic@lists.infradead.org,m:alfievarghese22@gmail.com,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[funderscore@postmarketos.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[funderscore@postmarketos.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6685974ECE2

On Mon, 13 Jul 2026 18:16, Alfie Varghese <alfievarghese22@gmail.com> wrote:
>This commit fixes several deep concurrency and race condition issues identified
>in the Amlogic video decoder driver:
>
>1. Fix a Use-After-Free window in vdec_close() by moving
>   cancel_work_sync(&sess->esparser_queue_work) to execute after the hardware
>   is stopped via v4l2_m2m_ctx_release(), preventing interrupts from re-arming it.
>2. Fix a Use-After-Free relating to v4l2_m2m_release(). The driver incorrectly
>   allocated the m2m_dev per-session rather than per-device. Moved the
>   m2m_dev allocation to vdec_probe() and cleanup to vdec_remove() to fix
>   the structural UAF when background m2m jobs were pending.
>3. Fix a TOCTOU race condition in vdec_isr() by adding synchronize_irq()
>   in vdec_stop_streaming() after clearing core->cur_sess, ensuring that
>   running interrupt handlers finish before freeing session data.
>4. Fix a potential NULL/ERR pointer dereference in vdec_start_streaming()
>   by checking the return value of kthread_run() and handling errors gracefully.
>5. Fix a memory leak in vdec_close() by freeing the session control
>   handler via v4l2_ctrl_handler_free().
>6. Prevent a potential NULL pointer dereference in vdec_probe() by adding
>   a NULL check for of_match_node().
>
>Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
>---
> drivers/staging/media/meson/vdec/vdec.c |  52 ++-
> drivers/staging/media/meson/vdec/vdec.h | 586 ++++++++++++------------
> 2 files changed, 331 insertions(+), 307 deletions(-)
>
>diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
>index a039d925c0fe..f57c473da5e1 100644
>--- a/drivers/staging/media/meson/vdec/vdec.c
>+++ b/drivers/staging/media/meson/vdec/vdec.c
>@@ -337,9 +337,16 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
> 
> 	sess->sequence_cap = 0;
> 	sess->sequence_out = 0;
>-	if (vdec_codec_needs_recycle(sess))
>+	if (vdec_codec_needs_recycle(sess)) {
> 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
> 						   "vdec_recycle");
>+		if (IS_ERR(sess->recycle_thread)) {
>+			ret = PTR_ERR(sess->recycle_thread);
>+			sess->recycle_thread = NULL;
>+			vdec_poweroff(sess);
>+			goto vififo_free;
>+		}
>+	}
> 
> 	sess->status = STATUS_INIT;
> 	core->cur_sess = sess;
>@@ -404,7 +411,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
> 	    sess->status == STATUS_INIT ||
> 	    (sess->status == STATUS_NEEDS_RESUME &&
> 	     (!sess->streamon_out || !sess->streamon_cap))) {
>-		if (vdec_codec_needs_recycle(sess))
>+		if (vdec_codec_needs_recycle(sess) && sess->recycle_thread)
> 			kthread_stop(sess->recycle_thread);
> 
> 		vdec_poweroff(sess);
>@@ -416,6 +423,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
> 		kfree(sess->priv);
> 		sess->priv = NULL;
> 		core->cur_sess = NULL;
>+		synchronize_irq(core->irq);
> 		sess->status = STATUS_STOPPED;
> 	}
> 
>@@ -873,18 +881,11 @@ static int vdec_open(struct file *file)
> 
> 	sess->core = core;
> 
>-	sess->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
>-	if (IS_ERR(sess->m2m_dev)) {
>-		dev_err(dev, "Fail to v4l2_m2m_init\n");
>-		ret = PTR_ERR(sess->m2m_dev);
>-		goto err_free_sess;
>-	}
>-
>-	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
>+	sess->m2m_ctx = v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
> 	if (IS_ERR(sess->m2m_ctx)) {
> 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
> 		ret = PTR_ERR(sess->m2m_ctx);
>-		goto err_m2m_release;
>+		goto err_free_sess;
> 	}
> 
> 	ret = vdec_init_ctrls(sess);
>@@ -915,8 +916,6 @@ static int vdec_open(struct file *file)
> 
> err_m2m_ctx_release:
> 	v4l2_m2m_ctx_release(sess->m2m_ctx);
>-err_m2m_release:
>-	v4l2_m2m_release(sess->m2m_dev);
> err_free_sess:
> 	kfree(sess);
> 	return ret;
>@@ -927,10 +926,12 @@ static int vdec_close(struct file *file)
> 	struct amvdec_session *sess = file_to_amvdec_session(file);
> 
> 	v4l2_m2m_ctx_release(sess->m2m_ctx);
>-	v4l2_m2m_release(sess->m2m_dev);
>+	cancel_work_sync(&sess->esparser_queue_work);
> 	v4l2_fh_del(&sess->fh, file);
> 	v4l2_fh_exit(&sess->fh);
> 
>+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
>+
> 	mutex_destroy(&sess->lock);
> 	mutex_destroy(&sess->bufs_recycle_lock);
> 
>@@ -953,6 +954,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
> 	struct amvdec_core *core = data;
> 	struct amvdec_session *sess = core->cur_sess;
> 
>+	if (!sess)
>+		return IRQ_NONE;
>+
> 	sess->last_irq_jiffies = get_jiffies_64();
> 
> 	return sess->fmt_out->codec_ops->isr(sess);
>@@ -963,6 +967,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *data)
> 	struct amvdec_core *core = data;
> 	struct amvdec_session *sess = core->cur_sess;
> 
>+	if (!sess)
>+		return IRQ_NONE;
>+
> 	return sess->fmt_out->codec_ops->threaded_isr(sess);
> }
> 
>@@ -1020,6 +1027,8 @@ static int vdec_probe(struct platform_device *pdev)
> 		return PTR_ERR(core->canvas);
> 
> 	of_id = of_match_node(vdec_dt_match, dev->of_node);
>+	if (!of_id)
>+		return -ENODEV;
> 	core->platform = of_id->data;
> 
> 	if (core->platform->revision == VDEC_REVISION_G12A ||
>@@ -1049,6 +1058,8 @@ static int vdec_probe(struct platform_device *pdev)
> 	if (irq < 0)
> 		return irq;
> 
>+	core->irq = irq;
>+
> 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
> 					vdec_threaded_isr, IRQF_ONESHOT,
> 					"vdec", core);
>@@ -1065,10 +1076,17 @@ static int vdec_probe(struct platform_device *pdev)
> 		return -ENOMEM;
> 	}
> 
>+	core->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
>+	if (IS_ERR(core->m2m_dev)) {
>+		dev_err(dev, "Failed to init v4l2 m2m dev\n");
>+		ret = PTR_ERR(core->m2m_dev);
>+		goto err_v4l2_unreg;
>+	}
>+
> 	vdev = video_device_alloc();
> 	if (!vdev) {
> 		ret = -ENOMEM;
>-		goto err_vdev_release;
>+		goto err_m2m_release;
> 	}
> 
> 	core->vdev_dec = vdev;
>@@ -1096,6 +1114,9 @@ static int vdec_probe(struct platform_device *pdev)
> 
> err_vdev_release:
> 	video_device_release(vdev);
>+err_m2m_release:
>+	v4l2_m2m_release(core->m2m_dev);
>+err_v4l2_unreg:
> 	v4l2_device_unregister(&core->v4l2_dev);
> 	return ret;
> }
>@@ -1105,6 +1126,7 @@ static void vdec_remove(struct platform_device *pdev)
> 	struct amvdec_core *core = platform_get_drvdata(pdev);
> 
> 	video_unregister_device(core->vdev_dec);
>+	v4l2_m2m_release(core->m2m_dev);
> 	v4l2_device_unregister(&core->v4l2_dev);
> }
> 

It probably would be better to split into multiple commits to make
it easier for maintainers to review your patch.

>diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
>index 7a5d8e871d70..b2a606e965b4 100644
>--- a/drivers/staging/media/meson/vdec/vdec.h
>+++ b/drivers/staging/media/meson/vdec/vdec.h
>@@ -1,292 +1,294 @@
>-/* SPDX-License-Identifier: GPL-2.0+ */
>-/*
>- * Copyright (C) 2018 BayLibre, SAS
>- * Author: Maxime Jourdan <mjourdan@baylibre.com>
>- */
>-
>-#ifndef __MESON_VDEC_CORE_H_
>-#define __MESON_VDEC_CORE_H_
>-
>-#include <linux/irqreturn.h>
>-#include <linux/regmap.h>
>-#include <linux/list.h>
>-#include <media/videobuf2-v4l2.h>
>-#include <media/v4l2-ctrls.h>
>-#include <media/v4l2-device.h>
>-#include <linux/soc/amlogic/meson-canvas.h>
>-
>-#include "vdec_platform.h"
>-
>-/* 32 buffers in 3-plane YUV420 */
>-#define MAX_CANVAS (32 * 3)
>-
>-struct amvdec_buffer {
>-	struct list_head list;
>-	struct vb2_buffer *vb;
>-};
>-
>-/**
>- * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO offset
>- *
>- * @list: used to make lists out of this struct
>- * @tc: timecode from the v4l2 buffer
>- * @ts: timestamp from the VB2 buffer
>- * @offset: offset in the VIFIFO where the associated packet was written
>- * @flags: flags from the v4l2 buffer
>- * @used_count: times this timestamp was checked for a match with a dst buffer
>- */
>-struct amvdec_timestamp {
>-	struct list_head list;
>-	struct v4l2_timecode tc;
>-	u64 ts;
>-	u32 offset;
>-	u32 flags;
>-	u32 used_count;
>-};
>-
>-struct amvdec_session;
>-
>-/**
>- * struct amvdec_core - device parameters, singleton
>- *
>- * @dos_base: DOS memory base address
>- * @esparser_base: PARSER memory base address
>- * @regmap_ao: regmap for the AO bus
>- * @dev: core device
>- * @dev_dec: decoder device
>- * @platform: platform-specific data
>- * @canvas: canvas provider reference
>- * @dos_parser_clk: DOS_PARSER clock
>- * @dos_clk: DOS clock
>- * @vdec_1_clk: VDEC_1 clock
>- * @vdec_hevc_clk: VDEC_HEVC clock
>- * @vdec_hevcf_clk: VDEC_HEVCF clock
>- * @esparser_reset: RESET for the PARSER
>- * @vdev_dec: video device for the decoder
>- * @v4l2_dev: v4l2 device
>- * @cur_sess: current decoding session
>- * @lock: video device lock
>- */
>-struct amvdec_core {
>-	void __iomem *dos_base;
>-	void __iomem *esparser_base;
>-	struct regmap *regmap_ao;
>-
>-	struct device *dev;
>-	struct device *dev_dec;
>-	const struct vdec_platform *platform;
>-
>-	struct meson_canvas *canvas;
>-
>-	struct clk *dos_parser_clk;
>-	struct clk *dos_clk;
>-	struct clk *vdec_1_clk;
>-	struct clk *vdec_hevc_clk;
>-	struct clk *vdec_hevcf_clk;
>-
>-	struct reset_control *esparser_reset;
>-
>-	struct video_device *vdev_dec;
>-	struct v4l2_device v4l2_dev;
>-
>-	struct amvdec_session *cur_sess;
>-	struct mutex lock;
>-};
>-
>-/**
>- * struct amvdec_ops - vdec operations
>- *
>- * @start: mandatory call when the vdec needs to initialize
>- * @stop: mandatory call when the vdec needs to stop
>- * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
>- * @vififo_level: mandatory call to get the current amount of data
>- *		  in the VIFIFO
>- */
>-struct amvdec_ops {
>-	int (*start)(struct amvdec_session *sess);
>-	int (*stop)(struct amvdec_session *sess);
>-	void (*conf_esparser)(struct amvdec_session *sess);
>-	u32 (*vififo_level)(struct amvdec_session *sess);
>-};
>-
>-/**
>- * struct amvdec_codec_ops - codec operations
>- *
>- * @start: mandatory call when the codec needs to initialize
>- * @stop: mandatory call when the codec needs to stop
>- * @load_extended_firmware: optional call to load additional firmware bits
>- * @num_pending_bufs: optional call to get the number of dst buffers on hold
>- * @can_recycle: optional call to know if the codec is ready to recycle
>- *		 a dst buffer
>- * @recycle: optional call to tell the codec to recycle a dst buffer. Must go
>- *	     in pair with @can_recycle
>- * @drain: optional call if the codec has a custom way of draining
>- * @resume: optional call to resume after a resolution change
>- * @eos_sequence: optional call to get an end sequence to send to esparser
>- *		  for flush. Mutually exclusive with @drain.
>- * @isr: mandatory call when the ISR triggers
>- * @threaded_isr: mandatory call for the threaded ISR
>- */
>-struct amvdec_codec_ops {
>-	int (*start)(struct amvdec_session *sess);
>-	int (*stop)(struct amvdec_session *sess);
>-	int (*load_extended_firmware)(struct amvdec_session *sess,
>-				      const u8 *data, u32 len);
>-	u32 (*num_pending_bufs)(struct amvdec_session *sess);
>-	int (*can_recycle)(struct amvdec_core *core);
>-	void (*recycle)(struct amvdec_core *core, u32 buf_idx);
>-	void (*drain)(struct amvdec_session *sess);
>-	void (*resume)(struct amvdec_session *sess);
>-	const u8 * (*eos_sequence)(u32 *len);
>-	irqreturn_t (*isr)(struct amvdec_session *sess);
>-	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);
>-};
>-
>-/**
>- * struct amvdec_format - describes one of the OUTPUT (src) format supported
>- *
>- * @pixfmt: V4L2 pixel format
>- * @min_buffers: minimum amount of CAPTURE (dst) buffers
>- * @max_buffers: maximum amount of CAPTURE (dst) buffers
>- * @max_width: maximum picture width supported
>- * @max_height: maximum picture height supported
>- * @flags: enum flags associated with this pixfmt
>- * @vdec_ops: the VDEC operations that support this format
>- * @codec_ops: the codec operations that support this format
>- * @firmware_path: Path to the firmware that supports this format
>- * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt
>- */
>-struct amvdec_format {
>-	u32 pixfmt;
>-	u32 min_buffers;
>-	u32 max_buffers;
>-	u32 max_width;
>-	u32 max_height;
>-	u32 flags;
>-
>-	struct amvdec_ops *vdec_ops;
>-	struct amvdec_codec_ops *codec_ops;
>-
>-	char *firmware_path;
>-	u32 pixfmts_cap[4];
>-};
>-
>-enum amvdec_status {
>-	STATUS_STOPPED,
>-	STATUS_INIT,
>-	STATUS_RUNNING,
>-	STATUS_NEEDS_RESUME,
>-};
>-
>-/**
>- * struct amvdec_session - decoding session parameters
>- *
>- * @core: reference to the vdec core struct
>- * @fh: v4l2 file handle
>- * @m2m_dev: v4l2 m2m device
>- * @m2m_ctx: v4l2 m2m context
>- * @ctrl_handler: V4L2 control handler
>- * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
>- * @lock: cap & out queues lock
>- * @fmt_out: vdec pixel format for the OUTPUT queue
>- * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
>- * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
>- * @width: current picture width
>- * @height: current picture height
>- * @colorspace: current colorspace
>- * @ycbcr_enc: current ycbcr_enc
>- * @quantization: current quantization
>- * @xfer_func: current transfer function
>- * @pixelaspect: Pixel Aspect Ratio reported by the decoder
>- * @esparser_queued_bufs: number of buffers currently queued into ESPARSER
>- * @esparser_queue_work: work struct for the ESPARSER to process src buffers
>- * @streamon_cap: stream on flag for capture queue
>- * @streamon_out: stream on flag for output queue
>- * @sequence_cap: capture sequence counter
>- * @sequence_out: output sequence counter
>- * @should_stop: flag set if userspace signaled EOS via command
>- *		 or empty buffer
>- * @keyframe_found: flag set once a keyframe has been parsed
>- * @num_dst_bufs: number of destination buffers
>- * @changed_format: the format changed
>- * @canvas_alloc: array of all the canvas IDs allocated
>- * @canvas_num: number of canvas IDs allocated
>- * @vififo_vaddr: virtual address for the VIFIFO
>- * @vififo_paddr: physical address for the VIFIFO
>- * @vififo_size: size of the VIFIFO dma alloc
>- * @bufs_recycle: list of buffers that need to be recycled
>- * @bufs_recycle_lock: lock for the bufs_recycle list
>- * @recycle_thread: task struct for the recycling thread
>- * @timestamps: chronological list of src timestamps
>- * @ts_spinlock: spinlock for the timestamps list
>- * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
>- * @last_offset: tracks last offset of vififo
>- * @wrap_count: number of times the vififo wrapped around
>- * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
>- * @status: current decoding status
>- * @priv: codec private data
>- */
>-struct amvdec_session {
>-	struct amvdec_core *core;
>-
>-	struct v4l2_fh fh;
>-	struct v4l2_m2m_dev *m2m_dev;
>-	struct v4l2_m2m_ctx *m2m_ctx;
>-	struct v4l2_ctrl_handler ctrl_handler;
>-	struct v4l2_ctrl *ctrl_min_buf_capture;
>-	struct mutex lock;
>-
>-	const struct amvdec_format *fmt_out;
>-	u32 pixfmt_cap;
>-	u32 src_buffer_size;
>-
>-	u32 width;
>-	u32 height;
>-	u32 colorspace;
>-	u8 ycbcr_enc;
>-	u8 quantization;
>-	u8 xfer_func;
>-
>-	struct v4l2_fract pixelaspect;
>-
>-	atomic_t esparser_queued_bufs;
>-	struct work_struct esparser_queue_work;
>-
>-	unsigned int streamon_cap, streamon_out;
>-	unsigned int sequence_cap, sequence_out;
>-	unsigned int should_stop;
>-	unsigned int keyframe_found;
>-	unsigned int num_dst_bufs;
>-	unsigned int changed_format;
>-
>-	u8 canvas_alloc[MAX_CANVAS];
>-	u32 canvas_num;
>-
>-	void *vififo_vaddr;
>-	dma_addr_t vififo_paddr;
>-	u32 vififo_size;
>-
>-	struct list_head bufs_recycle;
>-	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */
>-	struct task_struct *recycle_thread;
>-
>-	struct list_head timestamps;
>-	spinlock_t ts_spinlock; /* timestamp list lock */
>-
>-	u64 last_irq_jiffies;
>-	u32 last_offset;
>-	u32 wrap_count;
>-	u32 fw_idx_to_vb2_idx[32];
>-
>-	enum amvdec_status status;
>-	void *priv;
>-};
>-
>-static inline struct amvdec_session *file_to_amvdec_session(struct file *filp)
>-{
>-	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
>-}
>-
>-u32 amvdec_get_output_size(struct amvdec_session *sess);
>-
>-#endif
>+/* SPDX-License-Identifier: GPL-2.0+ */
>+/*
>+ * Copyright (C) 2018 BayLibre, SAS
>+ * Author: Maxime Jourdan <mjourdan@baylibre.com>
>+ */
>+
>+#ifndef __MESON_VDEC_CORE_H_
>+#define __MESON_VDEC_CORE_H_
>+
>+#include <linux/irqreturn.h>
>+#include <linux/regmap.h>
>+#include <linux/list.h>
>+#include <media/videobuf2-v4l2.h>
>+#include <media/v4l2-ctrls.h>
>+#include <media/v4l2-device.h>
>+#include <linux/soc/amlogic/meson-canvas.h>
>+
>+#include "vdec_platform.h"
>+
>+/* 32 buffers in 3-plane YUV420 */
>+#define MAX_CANVAS (32 * 3)
>+
>+struct amvdec_buffer {
>+	struct list_head list;
>+	struct vb2_buffer *vb;
>+};
>+
>+/**
>+ * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO offset
>+ *
>+ * @list: used to make lists out of this struct
>+ * @tc: timecode from the v4l2 buffer
>+ * @ts: timestamp from the VB2 buffer
>+ * @offset: offset in the VIFIFO where the associated packet was written
>+ * @flags: flags from the v4l2 buffer
>+ * @used_count: times this timestamp was checked for a match with a dst buffer
>+ */
>+struct amvdec_timestamp {
>+	struct list_head list;
>+	struct v4l2_timecode tc;
>+	u64 ts;
>+	u32 offset;
>+	u32 flags;
>+	u32 used_count;
>+};
>+
>+struct amvdec_session;
>+
>+/**
>+ * struct amvdec_core - device parameters, singleton
>+ *
>+ * @dos_base: DOS memory base address
>+ * @esparser_base: PARSER memory base address
>+ * @regmap_ao: regmap for the AO bus
>+ * @dev: core device
>+ * @dev_dec: decoder device
>+ * @platform: platform-specific data
>+ * @canvas: canvas provider reference
>+ * @dos_parser_clk: DOS_PARSER clock
>+ * @dos_clk: DOS clock
>+ * @vdec_1_clk: VDEC_1 clock
>+ * @vdec_hevc_clk: VDEC_HEVC clock
>+ * @vdec_hevcf_clk: VDEC_HEVCF clock
>+ * @esparser_reset: RESET for the PARSER
>+ * @vdev_dec: video device for the decoder
>+ * @v4l2_dev: v4l2 device
>+ * @m2m_dev: v4l2 m2m device
>+ * @cur_sess: current decoding session
>+ * @lock: video device lock
>+ * @irq: decoder irq
>+ */
>+struct amvdec_core {
>+	void __iomem *dos_base;
>+	void __iomem *esparser_base;
>+	struct regmap *regmap_ao;
>+
>+	struct device *dev;
>+	struct device *dev_dec;
>+	const struct vdec_platform *platform;
>+
>+	struct meson_canvas *canvas;
>+
>+	struct clk *dos_parser_clk;
>+	struct clk *dos_clk;
>+	struct clk *vdec_1_clk;
>+	struct clk *vdec_hevc_clk;
>+	struct clk *vdec_hevcf_clk;
>+
>+	struct reset_control *esparser_reset;
>+
>+	struct video_device *vdev_dec;
>+	struct v4l2_device v4l2_dev;
>+	struct v4l2_m2m_dev *m2m_dev;
>+
>+	struct amvdec_session *cur_sess;
>+	struct mutex lock;
>+	int irq;
>+};
>+
>+/**
>+ * struct amvdec_ops - vdec operations
>+ *
>+ * @start: mandatory call when the vdec needs to initialize
>+ * @stop: mandatory call when the vdec needs to stop
>+ * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
>+ * @vififo_level: mandatory call to get the current amount of data
>+ *		  in the VIFIFO
>+ */
>+struct amvdec_ops {
>+	int (*start)(struct amvdec_session *sess);
>+	int (*stop)(struct amvdec_session *sess);
>+	void (*conf_esparser)(struct amvdec_session *sess);
>+	u32 (*vififo_level)(struct amvdec_session *sess);
>+};
>+
>+/**
>+ * struct amvdec_codec_ops - codec operations
>+ *
>+ * @start: mandatory call when the codec needs to initialize
>+ * @stop: mandatory call when the codec needs to stop
>+ * @load_extended_firmware: optional call to load additional firmware bits
>+ * @num_pending_bufs: optional call to get the number of dst buffers on hold
>+ * @can_recycle: optional call to know if the codec is ready to recycle
>+ *		 a dst buffer
>+ * @recycle: optional call to tell the codec to recycle a dst buffer. Must go
>+ *	     in pair with @can_recycle
>+ * @drain: optional call if the codec has a custom way of draining
>+ * @resume: optional call to resume after a resolution change
>+ * @eos_sequence: optional call to get an end sequence to send to esparser
>+ *		  for flush. Mutually exclusive with @drain.
>+ * @isr: mandatory call when the ISR triggers
>+ * @threaded_isr: mandatory call for the threaded ISR
>+ */
>+struct amvdec_codec_ops {
>+	int (*start)(struct amvdec_session *sess);
>+	int (*stop)(struct amvdec_session *sess);
>+	int (*load_extended_firmware)(struct amvdec_session *sess,
>+				      const u8 *data, u32 len);
>+	u32 (*num_pending_bufs)(struct amvdec_session *sess);
>+	int (*can_recycle)(struct amvdec_core *core);
>+	void (*recycle)(struct amvdec_core *core, u32 buf_idx);
>+	void (*drain)(struct amvdec_session *sess);
>+	void (*resume)(struct amvdec_session *sess);
>+	const u8 * (*eos_sequence)(u32 *len);
>+	irqreturn_t (*isr)(struct amvdec_session *sess);
>+	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);
>+};
>+
>+/**
>+ * struct amvdec_format - describes one of the OUTPUT (src) format supported
>+ *
>+ * @pixfmt: V4L2 pixel format
>+ * @min_buffers: minimum amount of CAPTURE (dst) buffers
>+ * @max_buffers: maximum amount of CAPTURE (dst) buffers
>+ * @max_width: maximum picture width supported
>+ * @max_height: maximum picture height supported
>+ * @flags: enum flags associated with this pixfmt
>+ * @vdec_ops: the VDEC operations that support this format
>+ * @codec_ops: the codec operations that support this format
>+ * @firmware_path: Path to the firmware that supports this format
>+ * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt
>+ */
>+struct amvdec_format {
>+	u32 pixfmt;
>+	u32 min_buffers;
>+	u32 max_buffers;
>+	u32 max_width;
>+	u32 max_height;
>+	u32 flags;
>+
>+	struct amvdec_ops *vdec_ops;
>+	struct amvdec_codec_ops *codec_ops;
>+
>+	char *firmware_path;
>+	u32 pixfmts_cap[4];
>+};
>+
>+enum amvdec_status {
>+	STATUS_STOPPED,
>+	STATUS_INIT,
>+	STATUS_RUNNING,
>+	STATUS_NEEDS_RESUME,
>+};
>+
>+/**
>+ * struct amvdec_session - decoding session parameters
>+ *
>+ * @core: reference to the vdec core struct
>+ * @fh: v4l2 file handle
>+ * @m2m_ctx: v4l2 m2m context
>+ * @ctrl_handler: V4L2 control handler
>+ * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
>+ * @lock: cap & out queues lock
>+ * @fmt_out: vdec pixel format for the OUTPUT queue
>+ * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
>+ * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
>+ * @width: current picture width
>+ * @height: current picture height
>+ * @colorspace: current colorspace
>+ * @ycbcr_enc: current ycbcr_enc
>+ * @quantization: current quantization
>+ * @xfer_func: current transfer function
>+ * @pixelaspect: Pixel Aspect Ratio reported by the decoder
>+ * @esparser_queued_bufs: number of buffers currently queued into ESPARSER
>+ * @esparser_queue_work: work struct for the ESPARSER to process src buffers
>+ * @streamon_cap: stream on flag for capture queue
>+ * @streamon_out: stream on flag for output queue
>+ * @sequence_cap: capture sequence counter
>+ * @sequence_out: output sequence counter
>+ * @should_stop: flag set if userspace signaled EOS via command
>+ *		 or empty buffer
>+ * @keyframe_found: flag set once a keyframe has been parsed
>+ * @num_dst_bufs: number of destination buffers
>+ * @changed_format: the format changed
>+ * @canvas_alloc: array of all the canvas IDs allocated
>+ * @canvas_num: number of canvas IDs allocated
>+ * @vififo_vaddr: virtual address for the VIFIFO
>+ * @vififo_paddr: physical address for the VIFIFO
>+ * @vififo_size: size of the VIFIFO dma alloc
>+ * @bufs_recycle: list of buffers that need to be recycled
>+ * @bufs_recycle_lock: lock for the bufs_recycle list
>+ * @recycle_thread: task struct for the recycling thread
>+ * @timestamps: chronological list of src timestamps
>+ * @ts_spinlock: spinlock for the timestamps list
>+ * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
>+ * @last_offset: tracks last offset of vififo
>+ * @wrap_count: number of times the vififo wrapped around
>+ * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
>+ * @status: current decoding status
>+ * @priv: codec private data
>+ */
>+struct amvdec_session {
>+	struct amvdec_core *core;
>+
>+	struct v4l2_fh fh;
>+	struct v4l2_m2m_ctx *m2m_ctx;
>+	struct v4l2_ctrl_handler ctrl_handler;
>+	struct v4l2_ctrl *ctrl_min_buf_capture;
>+	struct mutex lock;
>+
>+	const struct amvdec_format *fmt_out;
>+	u32 pixfmt_cap;
>+	u32 src_buffer_size;
>+
>+	u32 width;
>+	u32 height;
>+	u32 colorspace;
>+	u8 ycbcr_enc;
>+	u8 quantization;
>+	u8 xfer_func;
>+
>+	struct v4l2_fract pixelaspect;
>+
>+	atomic_t esparser_queued_bufs;
>+	struct work_struct esparser_queue_work;
>+
>+	unsigned int streamon_cap, streamon_out;
>+	unsigned int sequence_cap, sequence_out;
>+	unsigned int should_stop;
>+	unsigned int keyframe_found;
>+	unsigned int num_dst_bufs;
>+	unsigned int changed_format;
>+
>+	u8 canvas_alloc[MAX_CANVAS];
>+	u32 canvas_num;
>+
>+	void *vififo_vaddr;
>+	dma_addr_t vififo_paddr;
>+	u32 vififo_size;
>+
>+	struct list_head bufs_recycle;
>+	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */
>+	struct task_struct *recycle_thread;
>+
>+	struct list_head timestamps;
>+	spinlock_t ts_spinlock; /* timestamp list lock */
>+
>+	u64 last_irq_jiffies;
>+	u32 last_offset;
>+	u32 wrap_count;
>+	u32 fw_idx_to_vb2_idx[32];
>+
>+	enum amvdec_status status;
>+	void *priv;
>+};
>+
>+static inline struct amvdec_session *file_to_amvdec_session(struct file *filp)
>+{
>+	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
>+}
>+
>+u32 amvdec_get_output_size(struct amvdec_session *sess);
>+
>+#endif

What is this huge diff?

>-- 
>2.54.0.windows.1
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

Best regards,
Ferass

