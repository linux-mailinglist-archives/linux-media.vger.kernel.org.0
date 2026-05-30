Return-Path: <linux-media+bounces-63116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wzBGISbDGmoi8QgAu9opvQ
	(envelope-from <linux-media+bounces-63116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:59:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D805B60C4F3
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27594302167A
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A733750BD;
	Sat, 30 May 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5XAxFWq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF123D7E6
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780138787; cv=none; b=QQrAMCOh2LGkkNOVp8gv8pXE5pI25mpF8sINEVZcKIm02b5MHV1PNlZt556GhOdwig/EXs0VmTk+BSbX59LM700eHYZ4b8aPpvfwoDO146btghOdSG8DRa/B38W2j0DDQhiXAv85qDPPwL0m4zev8uhfpUTdYqrbCMF3Ix3GNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780138787; c=relaxed/simple;
	bh=kfSBwzpLFNjcsxptLNwi24dZh924A2QpUdwfWkN9R3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qFJfOPdeVV23f36b9v2X60y8LMjEhNhkz/uUBQugj4VXHLJ0J8nTk7AdPOwuD1kuZMWGgAhltJdfxks7DSxl1fQfvW5JRurSLeSPD+FysXPHdsBYL3slQcEibDuvjlVQ0JMMzxUknuO1TjCdwnAWeKXYZ+mUcv6pbXhsWsznQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5XAxFWq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F941F00898;
	Sat, 30 May 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780138785;
	bh=dLJElK0DaXy94pgcBF1T68oVr+X826YV1J+ElotE7A8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5XAxFWqlhK8StMCr+XCiwwAcmip+nF/LHoA7CsShuvJcrO75G1Ep28B1hwgo49wA
	 Etq3bVo5/apY9R93AUShEIijhxmGyRE61Ubef5xQGdHVHoT11DenioqaGY3G2Evfvl
	 TFzlWeKCxI0XeoMWSDl26JvlCb6uzCqa50RKD88uN5J5Z2WToNya/daRP4r2qJ3N24
	 jt9egXAsJz065D19e3NTZL5JqcBdbm2gOB8fhtJQ5s7ngaW5aceM2v9BK3+9PK04/t
	 x/NbR7u7t7UcIjPAUC4JU/3CmgIZgXdEoJH/K59bGsq6bD7wdv8icP5nurx9G/Rfr9
	 vX8tY/vx8NdtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
In-Reply-To: <20260530094326.11892-6-linux.amoon@gmail.com>
References: <20260530094326.11892-6-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 10:59:45 +0000
Message-Id: <20260530105945.95F941F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63116-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Queue-Id: D805B60C4F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling `cancel_work_sync(&sess->esparser_queue_work)` while holdi=
ng the session lock (`sess->lock`) causes a guaranteed AB-BA deadlock if th=
e `esparser_queue_all_src` work is executing.

Pre-existing issues:
- [Critical] Prematurely clearing the hardware owner `core->cur_sess` intro=
duces a critical race condition that can corrupt hardware state and disable=
 clocks for concurrent sessions.
--

commit 20f0925bb191ee052dd2907764b22c2e4a352074
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Cancel esparser work during teardown

This commit adds cancel_work_sync() calls during streaming stop, error unwi=
nd,
and device close. It aims to prevent use-after-free hazards by ensuring the
esparser workqueue is drained before releasing session state and buffers.

Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel=
.org/

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 698a95566ad27..4884ee04b3529 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -380,6 +380,8 @@ static int vdec_start_streaming(struct vb2_queue *q, =
unsigned int count)
>  			  sess->vififo_vaddr, sess->vififo_paddr);
>  	sess->vififo_vaddr =3D NULL;
>  bufs_done:
> +	cancel_work_sync(&sess->esparser_queue_work);
> +

[Severity: High]
Does this code introduce a deadlock? The V4L2 core acquires the queue lock
(sess->lock) before calling vdec_start_streaming() or vdec_stop_streaming().

If cancel_work_sync() is called here while the ioctl thread holds sess->loc=
k,
and the worker thread is currently executing:

drivers/staging/media/meson/vdec/esparser.c:esparser_queue_all_src() {
    ...
    mutex_lock(&sess->lock);
    ...

Could the worker thread block indefinitely waiting for sess->lock, while the
ioctl thread blocks indefinitely in cancel_work_sync() waiting for the work=
er
to complete?

>  	mutex_lock(&core->lock);
>  	if (core->cur_sess =3D=3D sess)
>  		core->cur_sess =3D NULL;

[ ... ]

> @@ -437,6 +439,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
>  	struct vb2_v4l2_buffer *buf;
>  	enum amvdec_status old_status;
> =20
> +	cancel_work_sync(&sess->esparser_queue_work);
> +
>  	/*
>  	 * Safely snapshot the status and clear the hardware owner inside
>  	 * the mutex to prevent data races with concurrent STREAMON requests.
> @@ -448,7 +452,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
>  	sess->status =3D STATUS_STOPPED;
>  	mutex_unlock(&core->lock);

[Severity: Critical]
This isn't a bug introduced by this patch, but does prematurely clearing
core->cur_sess here introduce a race condition?

Since core->cur_sess is set to NULL under core->lock, but the hardware
teardown via vdec_poweroff() executes later after releasing the lock, could
a concurrent STREAMON from a different session acquire core->cur_sess and
execute vdec_poweron()?

This sequence would cause vdec_poweroff() of the old session and
vdec_poweron() of the new session to execute simultaneously, potentially
leading to conflicting hardware accesses and disabling clocks for the
concurrent session.

> -	/* Evaluate the hardware state using our snapshot */
> +	if (q->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (old_status >=3D STATUS_RUNNING && codec_ops->drain)
> +			codec_ops->drain(sess);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D5

