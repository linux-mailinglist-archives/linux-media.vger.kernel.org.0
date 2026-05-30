Return-Path: <linux-media+bounces-63114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNSPEmG7Gmqq7wgAu9opvQ
	(envelope-from <linux-media+bounces-63114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:26:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F98960C17F
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1F573056853
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D2539C01E;
	Sat, 30 May 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oa9v4BjE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C83C07A
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136755; cv=none; b=hENJ3UjmhSpfxoo0Zk2CDhY9TVhgdaUiUS9yabTjmb9mGBRtvBeiApRH13Z/UE8z8gQU1FufWF1bdK2zGp0EkoQ223A++JXUeIxTV/ZHdz7FJo7tVcqm11hZzm750BtoHZ5H+MXzcSKTkGgk2MKsFKDIWxAQ4Qof69QMuAHptlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136755; c=relaxed/simple;
	bh=84z7UbrGG3QhcmKxXrbeKv3GohmKry79PQOICCf6PaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kNwaS5K+jbPP9PVNSJnSFC6VPHSwc3Ry+EQCHftVSIdBxObaxAhsHTwZY1aKHcHOUyenh/Ng32pCRIXlabl1dNiTaet4JlEFW8fwBHl7AomXtDyyOtjCiWbIKPFo5IML8Flp4CTs7jkWioNsq2qcFAK0egubrr3MVXK4JSgYRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oa9v4BjE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313521F00893;
	Sat, 30 May 2026 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780136754;
	bh=jb7FEho4r1FnX92vNBd0/x1NFCRUuF8GjhHLYvYA8OM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oa9v4BjEvyptAgCmpl59iq8ux1ZruLtjcqduOhejixEaTTamJvVm5NrnyfjWK4iTH
	 WUHcT0SjKq3ZkS5CkSDibF7wWpFVlR5ySM03qOPXVME/WX6kFhhBb7J+BPnAA2gwdg
	 Cq0gpdrrxWbk1gYHavufdVR/gHow0s8/y+lqcOPC+jmcqup/DscB5OI0wE2fDd5J2H
	 mfzNvGdYQis0f0VnwbeOhBqbSe6BBEIXCyyyH4dKDk9nQ3Aak0a0oTVqFRzhmxJoVI
	 F8aa6IFDhVou6NIklKxyu7htXjC9Aw/ec59RcrPiLhBKq+9Day8Zv9MXpb1q2JsRi2
	 5tyci8WwzLvBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/8] media: meson: vdec: Handle kthread failure and
 free codec state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-4-linux.amoon@gmail.com>
References: <20260530094326.11892-4-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 10:25:53 +0000
Message-Id: <20260530102554.313521F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63114-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 9F98960C17F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Double-free of DMA buffers in the new err_cleanup path due to =
a redundant codec_ops->stop(sess) call.

Pre-existing issues:
- [Critical] Clearing the hardware ownership token `core->cur_sess` before =
executing `vdec_poweroff(sess)` creates a critical data race with concurren=
t sessions.
- [High] The concurrent locking patch destroys the STATUS_NEEDS_RESUME stat=
e, leading to massive memory leaks during dynamic resolution changes.
--

commit fd226e8b0810c7234d383bfb2d7ea8c103056049
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Handle kthread failure and free codec state
   =20
vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.
   =20
Fix this by introducing a dedicated err_cleanup path:

- Call codec_ops->stop() to release the codec context and clear sess->priv.
- Power off the hardware before freeing buffers to avoid DMA faults.
- Free canvas IDs explicitly and set sess->vififo_vaddr =3D NULL after
  dma_free_coherent() to guard against double=E2=80=91free in fallback stop=
 paths.
- Reset core->cur_sess and sess->status to prevent stale references.

Following change closes the memory leak on kthread_run() failure and ensures
robust cleanup of codec resources in both error and stop paths.

Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel=
.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 7233000e22323..8a5bf1a96830c 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c

[ ... ]

> @@ -352,16 +354,31 @@ static int vdec_start_streaming(struct vb2_queue *q=
, unsigned int count)
> =20
>  	sess->sequence_cap =3D 0;
>  	sess->sequence_out =3D 0;
> -	if (vdec_codec_needs_recycle(sess))
> +	if (vdec_codec_needs_recycle(sess)) {
>  		sess->recycle_thread =3D kthread_run(vdec_recycle_thread, sess,
>  						   "vdec_recycle");
> +		if (IS_ERR(sess->recycle_thread)) {
> +			ret =3D PTR_ERR(sess->recycle_thread);
> +			sess->recycle_thread =3D NULL;
> +			goto err_cleanup;
> +		}
> +	}
> =20
>  	schedule_work(&sess->esparser_queue_work);
>  	return 0;
> =20
> +err_cleanup:
> +	vdec_free_canvas(sess);
> +	vdec_poweroff(sess);
> +	if (codec_ops && codec_ops->stop && sess->priv) {
> +		codec_ops->stop(sess);

[Severity: Critical]
Does this explicitly call codec_ops->stop() a second time, resulting in a
double-free of the codec DMA memory?

Looking at vdec_poweroff() called just above, it internally delegates to
vdec_ops->stop(), which invokes codec_ops->stop(). Codec stop callbacks
free their DMA buffers via dma_free_coherent() but do not set the
pointers to NULL. If it is called again here, wouldn't it attempt to free
them a second time?

> +		kfree(sess->priv);
> +		sess->priv =3D NULL;
> +	}
>  vififo_free:
>  	dma_free_coherent(sess->core->dev, sess->vififo_size,
>  			  sess->vififo_vaddr, sess->vififo_paddr);
> +	sess->vififo_vaddr =3D NULL;
>  bufs_done:

[ ... ]

> @@ -441,8 +458,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
> =20
>  		vdec_poweroff(sess);

[Severity: Critical]
This is a pre-existing issue, but could clearing the hardware ownership tok=
en
before executing vdec_poweroff() create a data race with concurrent session=
s?

Looking earlier in vdec_stop_streaming(), core->cur_sess =3D NULL is set
inside the mutex, but vdec_poweroff(sess) is executed here after the mutex
is dropped:

	mutex_lock(&core->lock);
	if (core->cur_sess =3D=3D sess)
		core->cur_sess =3D NULL;
	mutex_unlock(&core->lock);
    ...
	vdec_poweroff(sess);

This allows a concurrent vdec_start_streaming() from another context to
acquire the lock, claim ownership, and call vdec_poweron(). Since
vdec_poweron() and vdec_poweroff() would execute concurrently on different
sessions, is it possible they will read and write to the exact same global
hardware registers and corrupt the shared hardware state?

>  		vdec_free_canvas(sess);
> -		dma_free_coherent(sess->core->dev, sess->vififo_size,
> -				  sess->vififo_vaddr, sess->vififo_paddr);
> +		if (sess->vififo_vaddr) {
> +			dma_free_coherent(sess->core->dev, sess->vififo_size,
> +					  sess->vififo_vaddr,
> +					  sess->vififo_paddr);
> +		}
>  		vdec_reset_timestamps(sess);
>  		vdec_reset_bufs_recycle(sess);
>  		kfree(sess->priv);

[Severity: High]
This isn't a bug introduced by this patch, but does the recent change to
concurrent locking destroy the STATUS_NEEDS_RESUME state?

Earlier in vdec_stop_streaming(), sess->status is unconditionally overwritt=
en
to STATUS_STOPPED inside the mutex lock:

	mutex_lock(&core->lock);
	old_status =3D sess->status;
	sess->status =3D STATUS_STOPPED;
	mutex_unlock(&core->lock);

When the CAPTURE queue is stopped during a source resolution change, the
hardware cleanup block is intentionally skipped because old_status is
STATUS_NEEDS_RESUME. However, when vdec_start_streaming() is later called to
resume the CAPTURE queue, it expects sess->status =3D=3D STATUS_NEEDS_RESUM=
E.
Since it was forced to STATUS_STOPPED, will the resume check fail and cause
the driver to incorrectly fall through to full initialization, executing
dma_alloc_coherent() over the existing sess->vififo_vaddr and leaking
memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D3

