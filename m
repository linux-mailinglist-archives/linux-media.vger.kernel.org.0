Return-Path: <linux-media+bounces-64177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8irtD7yiJmokaQIAu9opvQ
	(envelope-from <linux-media+bounces-64177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 13:08:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCB265581F
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 13:08:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a3EzHmT4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64177-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64177-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E8930D3C04
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9ED38CFE7;
	Mon,  8 Jun 2026 10:38:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D57C31327D
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 10:38:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915127; cv=none; b=LLmphkbhIK/knomYsR/vw0OLxy0mwD4jxnF4FFL7t3vWYqELgBO+0yD+66d7QIGF90RhxNokYabYzK1GTvQmu6I+rn4tqo0Tb3I8XCdA4PshV7c9BlPNWi+AbAiN7rbVrRygQS8kZBf15h4yA+AYW5YQiE1ojcIkh+AQJGyOpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915127; c=relaxed/simple;
	bh=zF34thfhUrZKgsYdsvRrSiRo1p50t88bY3XyH41yRl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sAZ6MuAqzBUV59Q2ZbDdvzkJJG/oO0i5vKdsOA0qR9+fp8DrFzBpgdW+nRR17W2YSwTAW1ecD8y7O4zYXNMEbaLzyT5hiHfrEhfCB5nuz5su7Tvkd6kusDXQH/c+fNxr52o0a736zaLOQ3iDQfMpPDMBfLpJn3OfJs6OImwjYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3EzHmT4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4AB1F00893;
	Mon,  8 Jun 2026 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915126;
	bh=r3/iWdtbvbBIutTIkSne9G/Zn1tof9frAseGAwAEJpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a3EzHmT4OzLy2C9BEO5TYA8GGhxAj01S/IpOSOpgEHUzkTPo6h6oN8/B6faM3T7XX
	 MI0OakS0PrN/xC5JBnV0YWzXMZbRq9OBK9kuGqah19buzFP49MQ+HNtJTgmdBP8VwF
	 FJCGkBlkAjVTxYsdqeXB2geeQljmV4U3Uh+QK181SuDwdNpoc45WifQg5ieL+kGHay
	 5KB8oDIABNRDBujhQw8M7WBQMxj7qGqlg1EBt5PVx5DFBIH2bxrrVze8/TD6mRGRer
	 7XMzFVYwsLK7HWWUGNV8UNDwkgPgnNwmTd7xYs91jJeFQ/1GnmWbE0WnSwEBoyqOay
	 YTkuvjMW38ADw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] accel/rocket: Fix fence leak, runtime PM leak and
 WARN in rocket_job_run() error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260608100040.985526-1-zhaojinming@uniontech.com>
References: <20260608100040.985526-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 10:38:45 +0000
Message-Id: <20260608103845.6F4AB1F00893@smtp.kernel.org>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64177-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaojinming@uniontech.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url,uniontech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FCB265581F

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IOMMU group reference leak in rocket_job_handle_irq()
- [High] Unsafe hardware register access in shared IRQ handler while runtim=
e suspended
--

commit fca53bbe333680ce9d4e0368b39e684506994081
Author: ZhaoJinming <zhaojinming@uniontech.com>
Subject: accel/rocket: Fix fence leak, runtime PM leak and WARN in rocket_j=
ob_run() error paths

This commit fixes multiple resource leaks in the error paths of rocket_job_=
run().
It replaces pm_runtime_get_sync() with pm_runtime_resume_and_get() to handle
the usage counter, correctly releases dma_fence references on failure, and
adds pm_runtime_put() during IOMMU attachment failures.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 2f1861f960ccb..cf9f61682dd8b 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c

[ ... ]

> @@ -310,13 +310,22 @@ static struct dma_fence *rocket_job_run(struct drm_=
sched_job *sched_job)
>  		dma_fence_put(job->done_fence);
>  	job->done_fence =3D dma_fence_get(fence);
> =20
> -	ret =3D pm_runtime_get_sync(core->dev);
> -	if (ret < 0)
> -		return fence;
> +	ret =3D pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0) {
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;
> +		dma_fence_put(fence);
> +		return ERR_PTR(ret);
> +	}
> =20
>  	ret =3D iommu_attach_group(job->domain->domain, core->iommu_group);
> -	if (ret < 0)
> -		return fence;
> +	if (ret < 0) {
> +		pm_runtime_put(core->dev);
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;
> +		dma_fence_put(fence);
> +		return ERR_PTR(ret);
> +	}
> =20
>  	scoped_guard(mutex, &core->job_lock) {
>  		core->in_flight_job =3D job;

[ ... ]

>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {
>  	pm_runtime_mark_last_busy(core->dev);
> =20
>  	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
>  	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> =20
>  	scoped_guard(mutex, &core->job_lock)
>  		if (core->in_flight_job) {
>  			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_co=
unt) {
>  				rocket_job_hw_submit(core, core->in_flight_job);
>  				return;
>  			}
> =20
>  			iommu_detach_group(NULL, iommu_group_get(core->dev));

[Severity: High]
This isn't a bug introduced by this patch, but does this leak an IOMMU
group reference?

It looks like iommu_group_get() increments the kobject reference count for =
the
group. However, iommu_detach_group() doesn't consume this reference, and th=
ere
is no subsequent iommu_group_put() call.

Since this runs on every completed job, could this eventually overflow the
reference counter and prevent the group from being freed?

[ ... ]

>  static irqreturn_t rocket_job_irq_handler(int irq, void *data)
>  {
>  	struct rocket_core *core =3D data;
>  	u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);

[Severity: High]
This is a pre-existing issue, but is it safe to access hardware registers
here without first checking if the device is active?

Since the driver registers this as a shared interrupt handler, it could be
invoked if another device on the same IRQ line triggers an interrupt while =
the
NPU device is runtime suspended.

Reading from a powered-down device typically returns 0xffffffff, which would
spuriously trigger the WARN_ON macros below and falsely return=20
IRQ_WAKE_THREAD.

Should this use pm_runtime_get_if_active() to verify the device is powered
before reading INTERRUPT_RAW_STATUS?

> =20
>  	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
>  	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608100040.9855=
26-1-zhaojinming@uniontech.com?part=3D1

