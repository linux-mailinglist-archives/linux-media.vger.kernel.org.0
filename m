Return-Path: <linux-media+bounces-63215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBqWOzI7HWoqWQkAu9opvQ
	(envelope-from <linux-media+bounces-63215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:56:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B161B25B
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68039303FF90
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 07:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F7838836E;
	Mon,  1 Jun 2026 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Silf8c4G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CE138655E
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300243; cv=none; b=IdlVlNQbSMwqn6Qdn8fGG6bD2QAkfRQ/vDyltSbKmJD++gM1i+2fH3iCh3/aeIs474oKf6IVBsDqfvJRHjAMcnAK6titEAsKc5HijgZcskTyvmSyHjdLQl/fRK7PlTu19ObXMbI6dR9pOfb8NqgCi3T5HqhgBLn4RzZly8Qe4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300243; c=relaxed/simple;
	bh=t03bWW8of64Et2KPDKsN1s88lV6XI/HzuQgeB6VnpDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J6OMWZ0neRp9CWuxcRCoaP4UInolRB9LeorvOLu/zDXaCsIB59w9VD1c/UzOQj7qeAQZ85EfN0JOHd2VTUsj4xTe0ePavuNOpVqfCZeVmpDJzwDK1FWDbBPPrR8xAaLK4nvG46qirChxL3MB3vktYDMka4MLxPWDN+fiQQdKaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Silf8c4G; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182551F00893;
	Mon,  1 Jun 2026 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780300242;
	bh=YZYQgZ7Lv5dp05D9KFMf09PLITIFZceVplfqvlN3Ko8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Silf8c4GWValHbHWbi2ZKOHQhYkYYzmf4idxmGoNkwKZ04guXTDrhI0D7O6Pp8wvG
	 1m505l/phiwd9lSUEOoJxd2LndAzlIbHdVP49K8Wwcx6zEObua2E/fLNml4j2e77K6
	 b8LRPcfUaNPW0umgiro0F7/q+eVSpIfMdvDOQEkkzMiJLc1y71GVHRCYNwyg+pmxah
	 nZoEEgCt+GB+kA7VAcA9T5L0cHl229RQaNsO+dhBnuXeMA+FlESfomEGlV9wUbHqFG
	 /ZYh+KfnR56HojUdYUofy73wiGasrPR105oCWA1oEW+59tcyFLgJ6ZgS9ZPRBqxbzi
	 UI70n4rq5uSNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: mtk-jpeg: only init/cancel work for multi-core
 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601073218.1281840-1-zhengxingda@iscas.ac.cn>
References: <20260601073218.1281840-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 07:50:41 +0000
Message-Id: <20260601075042.182551F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63215-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 4F5B161B25B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Multi-core workers call `v4l2_m2m_job_finish()` before hardwar=
e execution completes, breaking V4L2 M2M lifecycle protections and leading =
to UAF and memory corruption.
- [High] Calling `cancel_work_sync()` before `v4l2_m2m_ctx_release()` cause=
s an unrecoverable deadlock in `mtk_jpeg_release()` for multi-core variants.
- [High] The `v4l2_m2m_ctx` and its associated vb2 queues are leaked in the=
 `mtk_jpeg_open` error path.
--

commit 1d2300d236b157f7e5e89647af96ab2eb611c76d
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>
media: mtk-jpeg: only init/cancel work for multi-core variants

This commit skips the initialization and cancellation of the jpeg worker
for single-core variants of the hardware. Single-core variants do not use
the work structure and configure a null worker function, which triggers
warnings when cancelling the work in the release callback.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc2..83e54a7ef49c0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1160,7 +1160,8 @@ static int mtk_jpeg_open(struct file *file)
>  		goto free;
>  	}
> =20
> -	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
> +	if (jpeg->variant->multi_core)
> +		INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);

[Severity: High]
This is a pre-existing issue, but does the error path in mtk_jpeg_open()
leak the m2m context and its queues?

If mtk_jpeg_enc_ctrls_setup() fails, the code jumps to the error path:

mtk_jpeg_open()
    ...
error:
	v4l2_fh_del(&ctx->fh, file);
	v4l2_fh_exit(&ctx->fh);
	mutex_unlock(&jpeg->lock);
free:
	kfree(ctx);

This teardown seems to miss a call to v4l2_m2m_ctx_release(), which would l=
eave
the v4l2_m2m_ctx and associated vb2 queues permanently allocated. Since thi=
s is
in the open path, could a user space application repeatedly trigger this
condition to exhaust system memory?

[ ... ]

> @@ -1202,7 +1203,8 @@ static int mtk_jpeg_release(struct file *file)
>  	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
>  	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =20
> -	cancel_work_sync(&ctx->jpeg_work);
> +	if (jpeg->variant->multi_core)
> +		cancel_work_sync(&ctx->jpeg_work);

[Severity: High]
This isn't a bug introduced by this patch, but does calling cancel_work_syn=
c()
before v4l2_m2m_ctx_release() cause a deadlock if the file descriptor is
closed before the work starts executing?

If the user closes the device right after scheduling a multi-core m2m job,
TRANS_RUNNING is set, but cancel_work_sync() will drop the pending work. The
worker function then never runs to clear TRANS_RUNNING via
v4l2_m2m_job_finish().

When mtk_jpeg_release() subsequently calls v4l2_m2m_ctx_release(), will the
m2m framework hang indefinitely waiting for TRANS_RUNNING to clear inside
v4l2_m2m_cancel_job() while holding jpeg->lock?

[Severity: Critical]
This is also a pre-existing issue, but do the multi-core workers prematurely
clear the job running flag, leading to a use-after-free regression?

Looking at mtk_jpegdec_worker() and mtk_jpegenc_worker(), they appear to ca=
ll
v4l2_m2m_job_finish() immediately after starting the hardware rather than
waiting for hardware completion.

If the user closes the device immediately after, mtk_jpeg_release() might t=
ear
down the context while the hardware dma is still active. Once the hardware
finishes and fires the interrupt:

mtk_jpegdec_hw_irq_handler()
	ctx =3D jpeg->hw_param.curr_ctx;
	...
	pm_runtime_put(ctx->jpeg->dev);

Could this interrupt handler dereference the already freed ctx pointer?

>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601073218.1281=
840-1-zhengxingda@iscas.ac.cn?part=3D1

