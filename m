Return-Path: <linux-media+bounces-63978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uXu1FkRLI2qYoAEAu9opvQ
	(envelope-from <linux-media+bounces-63978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:18:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6264B999
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:18:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="CJCtXI/0";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63978-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63978-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 955A5301AD1D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0CD32B99E;
	Fri,  5 Jun 2026 22:18:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E932EEE98
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:18:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697916; cv=none; b=tJlHKZaRhi7AfKq4dXEgRYS4coVLtKzTMRTwFgh8504CHmCSU9QeosozvHHJQV1y4sx3X3c5wg9GMbEUeVSnIb0acFaV3dqhijVxmpoBvpByek7p1L6T3OWZUyhTeM5l4+hnVaDAUcbJ5aNS8nylQQmWlkMOZ8/Z/cS6IBbhlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697916; c=relaxed/simple;
	bh=vqYIgZbCe2hSv3AeQ1KGPbbeiUt2cQFNaDbrbO7aCkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPqjztlK0MaHyigrzCA9HZxs++OtM6zHmVmIKcgP2RFiM/vF0KcxWXVFLMP1vLGRmqHkE+bcamKAgGwgu/436CA7m42WRQYZ8EUmpn2jqk/IP+F/Xv0l/bgJiC0WN7Ha/7n92bhtKehLI5FPY9vR8UD+TyaKYgqpzjtsQCY5t6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJCtXI/0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335051F00893;
	Fri,  5 Jun 2026 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780697915;
	bh=xycxuXl5cb+jA7/ah41Ex6Q51C6/iIjde8yq9joQy3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJCtXI/0BQ+do6IbKz6oFyZOAPm677P70m98buu5w7wDie/oO0q8Z3kh4/MPAz50L
	 /capch4ur2p+fATXpEFuRteHx0kqNbvyhnBIpYobHFqa5VFQfDKy3A/YMVLvw9A2uE
	 sA8Vkd88SXwZH+Y1p+PlyUxxRbRpf94Ic7fJLdggJUtXe5kyqz2smfyaHG00IsKbKj
	 2Lk0PBkEdS+FTB2BlEikI3hOqXnlxzrIE0luGWAEyTvAU4PGsjGVvuT4ae8fxmTQbP
	 51buXNd1/CGQQJD4GwwRmW0Noazz0wIn6kXAvMWBep0VkJcSWDVF+J5kf5SvAvDbhF
	 BHVnn0EbkqYAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:18:34 +0000
Message-Id: <20260605221835.335051F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63978-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E6264B999

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Lockless list traversal of `job_queue` in `v4l2_m2m_suspend` leads=
 to list corruption and kernel panic.
- [High] Unlocked dereference of `first_ctx` fields in `v4l2_m2m_get_curr_p=
riv` leads to a Use-After-Free.
- [Medium] `v4l2_m2m_get_curr_priv` breaks interrupt mapping for drivers ut=
ilizing parallel jobs.
--

commit b3a2fe91efda298e9f5953581aac80b6a8ccdefb
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: v4l2-mem2mem: support running multiple jobs in parallel

Add support for running multiple jobs in parallel for SoCs containing
multiple identical devices. An example is the Rockchip RK3588 SoC,
which contains two identical RGA3 devices.

> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index a65cbb124cfe0..14ac9c85803d1 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c

[ ... ]

> @@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
>  void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
>  {
>  	unsigned long flags;
> -	void *ret =3D NULL;
> +	struct v4l2_m2m_ctx *first_ctx;
> =20
>  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (m2m_dev->curr_ctx)
> -		ret =3D m2m_dev->curr_ctx->priv;
> +	if (list_empty(&m2m_dev->job_queue)) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		return NULL;
> +	}
> +
> +	first_ctx =3D list_first_entry(&m2m_dev->job_queue,
> +				     struct v4l2_m2m_ctx, queue);
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -	return ret;
> +	if (first_ctx->job_flags & TRANS_RUNNING)
> +		return first_ctx->priv;

[Severity: High]
Does this introduce a use-after-free?

The job_spinlock is dropped right before reading first_ctx->job_flags
and first_ctx->priv. If the job is concurrently canceled, it could be
removed from the list and its context freed before these reads occur.

[Severity: Medium]
Will this return the correct context when multiple jobs are running in
parallel?

If max_parallel_jobs > 1, multiple contexts could be marked with
TRANS_RUNNING.  Because this function indiscriminately returns the priv
pointer of the first element in the queue, a driver servicing an interrupt
for a newer concurrent job might mistakenly receive the priv of the oldest
running job instead.

> +	else
> +		return NULL;
>  }
>  EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);

[ ... ]

> @@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>  {
>  	unsigned long flags;
> -	struct v4l2_m2m_ctx *curr_ctx;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *ctx_safe;
> =20
>  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  	m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -	curr_ctx =3D m2m_dev->curr_ctx;
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -	if (curr_ctx)
> -		wait_event(curr_ctx->finished,
> -			   !(curr_ctx->job_flags & TRANS_RUNNING));
> +	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING))
> +			break;
> +
> +		wait_event(ctx->finished, !(ctx->job_flags & TRANS_RUNNING));

[Severity: High]
Could this result in list corruption?

This loop traverses m2m_dev->job_queue without holding the
m2m_dev->job_spinlock.  When wait_event() blocks, a concurrent job
completion could call _v4l2_m2m_job_finish() and remove ctx_safe from the
list via list_del().

When the loop resumes, dereferencing the poisoned ctx_safe pointer would
likely cause a crash.

> +	}
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D5

