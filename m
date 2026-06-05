Return-Path: <linux-media+bounces-63989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1MZrL1ZNI2rtoQEAu9opvQ
	(envelope-from <linux-media+bounces-63989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:27:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389964BA2E
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ab+iLkrM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63989-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63989-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A4643019F35
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8D13C3787;
	Fri,  5 Jun 2026 22:25:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3543B71BA
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698351; cv=none; b=H8SvRAPNBxtaheFa2DnMJVWkHVtfjamo4paLgrR60dk184/gkbLAYFo09kPthFvajMQXLWruy569yniL/AFbowcP0BZ3wdRLTXquKZUDetjjv80wCnSflQeYOYY7Wmxi9OkesslBKt7WF3Mmsp0VnpqcSEGE6WdQELyVMRbn8IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698351; c=relaxed/simple;
	bh=0qshCgHiS1JLJOEweaJkpW57BZ02Bh8K16IQuMDiXb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iq1ItK0dOB/Ad4jCLK3wJzkXtyQQV9AzDXDpcsq8yyrXjvBOrMCSRXt/qn81ZePELA70ommQVDZzsiOHLcSaG7OLU8Pn8NqVwjbi5Jlbt29gbxcwAnTGxh6uORd+LBtrQoVE+cRvGAY3yH/MYF9Sj55KhobbArkFf6uBjDtk9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab+iLkrM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D521F00898;
	Fri,  5 Jun 2026 22:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698349;
	bh=a5hpfllqBjrTsTtCL3N6Wr1RzM9H3bZZXWc+LYBmDx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ab+iLkrMZkdN39CnlwCEJPnycnfwdB/aN87YyEEyL35yaeRuuqRu3vRQ1gMumUZUo
	 7HfW0vQG4OMk1woM5Hx/tMr6WnnPdRGpuRDhmRgsrAwEseOQVB06Ce5Oxr23zdiN0v
	 rZhWnSHujJGmBzChvwi1g2KC1OcsU2jJIU2iuEgykSN4fc68j3vJMw3N7aAfLNZMCZ
	 DKxBXgWQ3zI8w++ifHBEojFyBkHt4vbR0Yki1qAWM/MmsSCumFi9b2/maffqUneU2o
	 QaV/z040syJNXG+fWkQ4JnQ/kYT+ZFgSo6ffkcP9r1frozyzrIWL2zLjXkIH7J3ou3
	 KECaFt/owCuoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/17] media: rockchip: rga: schedule jobs to multiple
 cores
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-15-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-15-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:25:49 +0000
Message-Id: <20260605222549.80D521F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63989-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2389964BA2E

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Race condition in device_run() error path and unhandled early retu=
rn permanently deadlock the mem2mem queue.
- [Medium] Data race on core->curr pointer when clearing job assignments.

Pre-existing issues:
- [High] Out-of-bounds array write on unbind/rebind of components because r=
ga->num_cores is never reset.
- [High] Missing pm_runtime_get_if_active() before hardware access in share=
d IRQ handler.
- [High] Missing synchronize_irq() in runtime suspend callback for shared I=
RQ.
--

commit f03021dff03be4350cbe7b0ab4ce4a9a54a7602f
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: schedule jobs to multiple cores

This commit modifies the Rockchip RGA driver to schedule jobs across
multiple cores to better utilize hardware. A dedicated spinlock is added
to protect the selection of the next free core from race conditions.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 9cebb461b3fd2..f00b7f99f2521 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -38,15 +38,31 @@ static void device_run(void *prv)
>  {
>  	struct rga_ctx *ctx =3D prv;
>  	struct rockchip_rga *rga =3D ctx->rga;
> -	struct rga_core *core =3D rga->cores[0];
> +	struct rga_core *core =3D NULL;
>  	struct vb2_v4l2_buffer *src, *dst;
>  	unsigned long flags;
>  	int ret;
> +	unsigned int i;
> +
> +	spin_lock_irqsave(&rga->cores_lock, flags);
> +	for (i =3D 0; i < rga->num_cores; i++) {
> +		if (!rga->cores[i]->curr) {
> +			core =3D rga->cores[i];
> +			core->curr =3D ctx;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&rga->cores_lock, flags);
> +
> +	WARN_ONCE(!core, "No free core although max parallel jobs matches the c=
ore count!\n");
> +	if (!core)
> +		return;
> =20
>  	ret =3D pm_runtime_resume_and_get(core->dev);
>  	if (ret < 0) {
>  		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
>  						 VB2_BUF_STATE_ERROR);
> +		core->curr =3D NULL;

[Severity: High]
Could this error path introduce a race condition that permanently deadlocks=
 the
mem2mem queue?

v4l2_m2m_buf_done_and_job_finish() is called before core->curr is cleared,
which asynchronously schedules the next job via a workqueue.

If the worker executes device_run() on another CPU before the current CPU m=
arks
the core as free, the worker will see the core as busy. If no other core is
free, device_run() will trigger the WARN_ONCE and return early without
notifying the v4l2 mem2mem framework:

    if (!core)
        return;

Because the new job is already marked as TRANS_RUNNING, returning early wit=
hout
signaling job completion permanently hangs the job queue, and can cause a
D-state deadlock if userspace attempts to close the device file descriptor.

[Severity: Medium]
Additionally, could there be a data race when clearing core->curr here?

While cores_lock is acquired when scanning and assigning a core earlier in
device_run(), it is not held when releasing the core in this error path.
Concurrent unprotected reads and writes to core->curr across CPUs could lea=
d to
undefined behavior.

>  		return;
>  	}

[ ... ]

[Severity: Medium]
This isn't a bug introduced by this patch, but does modifying core->curr in
rga_isr() without holding cores_lock introduce a data race?

Since cores_lock was introduced to protect against concurrent selections,
shouldn't it also be held when releasing the core in the interrupt handler?

drivers/media/platform/rockchip/rga/rga.c:rga_isr() {
    ...
    core->curr =3D NULL;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the unbind/rebind path
cause an out-of-bounds array write in rga->cores[]?

During component bind, rga_core_bind() appends to the rga->cores array:

drivers/media/platform/rockchip/rga/rga.c:rga_core_bind() {
    ...
    rga->cores[rga->num_cores++] =3D core;
    ...
}

However, the master unbind callback and the component system do not reset
rga->num_cores to 0:

drivers/media/platform/rockchip/rga/rga.c:rga_unbind() {
    ...
    component_unbind_all(dev, NULL);
}

The struct rockchip_rga structure is not freed when a component is unbound.=
 If
a component is unbound and subsequently re-bound, rga_core_bind() will cont=
inue
incrementing rga->num_cores past the initially allocated length, corrupting
memory.

[Severity: High]
This isn't a bug introduced by this patch, but is the driver missing a
pm_runtime_get_if_active() check before accessing hardware in the shared IRQ
handler?

The driver registers rga_isr() with IRQF_SHARED if there is no internal IOM=
MU.
When an interrupt is triggered by another device on the shared line, rga_is=
r()
blindly calls handle_irq(), which reads hardware registers:

drivers/media/platform/rockchip/rga/rga.c:rga_isr() {
    ...
    if (rga->hw->handle_irq(core)) {
    ...
}

If the RGA core is runtime-suspended and its clocks are disabled, accessing=
 its
registers will cause an external abort / SError.

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing
synchronize_irq() in the runtime suspend callback for shared IRQs?

In rga_runtime_suspend(), the driver disables clocks unconditionally:

drivers/media/platform/rockchip/rga/rga.c:rga_runtime_suspend() {
    ...
    clk_bulk_disable_unprepare(core->num_clks, core->clks);
    ...
}

Because the driver can use a shared IRQ, an interrupt handler could be
mid-flight on another CPU when the clocks are disabled, causing an external
abort when the handler accesses the now-unclocked hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D15

