Return-Path: <linux-media+bounces-63118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFjKCg3JGmqA8wgAu9opvQ
	(envelope-from <linux-media+bounces-63118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:25:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF760C724
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 13:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC38A303CD29
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CF83A963D;
	Sat, 30 May 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnqX67f+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C42475CF
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140225; cv=none; b=Nc4TnDrYOQykIPgdegH/Q0lnzrO5RyV8OSqjSJU++frYOzNr+jSoPVz/VmsgQV8wFtXjR4r9riy1Q8BONiXFdgeeG9S9xNuXTuoxMXoP5Qa0bwJOBAoJFaKcwYv/XdWT0BaFUwcGJ4VAtr0YmFKMq6Vxz1a6/T/DWPz/A62bbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140225; c=relaxed/simple;
	bh=TUmKLMAq//3RSTzEWCncl86apzOdtgMk0XOIs12SQdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L5SUwbwlBUa+jhfoqiPl61aeyeCnrRnvchyFq7gNLc92pfp6yfPsQlkTdX2rxXOo8ikGIcJMDuG88f5O5C1/BBL/X3sdwMjyHYTQCFLjZ92tTS3OL+4yyMA1rU+mIzAtsHwWC6VVABnuQw63DZAoTcOxKSdefTRQQEs8dLmLcMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnqX67f+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33051F00893;
	Sat, 30 May 2026 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140224;
	bh=p3GF2+elIyBw2+ACsQDxH2lMBpgjPWo/Sy0efQo5rqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SnqX67f+zGkajBdgRJruuRtPIe32xsYGosp8sHv3sfBpRrGD90u+/3ZlqPF3i/pxF
	 xz7YGBqzVxmvA/32tG5OYlYgXWW4RYKQBepj3VGwL+RvbGRBHPk/HNR6l1FfryCmlr
	 ksUfbN9DUJ7rtm9901qeLiXW6nHYl2FFOcl8skHE5TXj9F7M2z9/h2FSoyt+u0MEUz
	 DLouBhbWtLhTeJEEimbnqT6pvXYl8c6zQL5GqdpaRdKxylpxfxEUT+xcLKY7d7J3n4
	 De7HjvqA9mNVc9SnQMiywyD09EQiz85HC8or3+T9DFsXe5xMumn0pQzR++mI/fU3ib
	 vQB8rdgHKoETQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] media: meson: vdec: Fix NULL pointer dereference
 in ISR handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-media@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-8-linux.amoon@gmail.com>
References: <20260530094326.11892-8-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 11:23:43 +0000
Message-Id: <20260530112343.E33051F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63118-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8AAF760C724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Freeing `core->m2m_dev` in `vdec_remove` causes a use-after-fr=
ee vulnerability when userspace keeps file descriptors open.
- [High] Returning IRQ_NONE without clearing the hardware interrupt status =
when `core->cur_sess` is NULL leaves the level-triggered hardware interrupt=
 unacknowledged, causing an interrupt storm.
- [High] Bailing out early in the ISR prevents updating `sess->last_irq_jif=
fies`, completely bypassing the hardware quiescence wait.
- [High] Prematurely releasing `core->lock` and clearing `core->cur_sess` i=
n `vdec_stop_streaming()` allows another session to start streaming concurr=
ently while the hardware is still being powered off.

Pre-existing issues:
- [High] The patch fails to resolve the underlying race condition, leaving =
a Time-of-Check to Time-of-Use (TOCTOU) vulnerability that causes Use-After=
-Free and bus aborts.
--

commit c640aebabd0e51f1ec94916e63bc19e2fc312eb7
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Fix NULL pointer dereference in ISR handlers

This commit attempts to fix a NULL pointer dereference in the vdec
interrupt handlers by using READ_ONCE() to take an atomic snapshot of
core->cur_sess. If the session has already been torn down and the
pointer is NULL, it returns IRQ_NONE to prevent dereferencing it.

Link: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.o=
rg/

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index f99335effe176..3897c75b19c8f 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -996,17 +996,36 @@ static const struct v4l2_file_operations vdec_fops =
=3D {
>  static irqreturn_t vdec_isr(int irq, void *data)
>  {
>  	struct amvdec_core *core =3D data;
> -	struct amvdec_session *sess =3D core->cur_sess;
> +	struct amvdec_session *sess;
> +	irqreturn_t ret =3D IRQ_HANDLED;
> +
> +	/*
> +	 * Use READ_ONCE to secure an atomic snapshot of the pointer,
> +	 * protecting against concurrent clearing during streaming
> +	 * teardowns.
> +	 */
> +	sess =3D READ_ONCE(core->cur_sess);
> +	if (!sess)
> +		return IRQ_NONE;

[Severity: High]
Can returning IRQ_NONE here cause an interrupt storm?

In vdec_stop_streaming(), core->cur_sess is set to NULL before the hardware
is actually stopped. If an active hardware interrupt fires during this wind=
ow,
the handler observes a NULL sess and returns IRQ_NONE early.

Because the interrupt is not cleared in the hardware registers, the
level-triggered interrupt remains asserted. Will this trigger an infinite
interrupt loop until the kernel's spurious interrupt detector permanently
disables the IRQ line?

[Severity: High]
Does bailing out early prevent updating sess->last_irq_jiffies?

The teardown sequence calls vdec_wait_inactive(), which sleeps until 50ms
have elapsed since sess->last_irq_jiffies. By returning early when
core->cur_sess is NULL, the handler no longer updates this timestamp for
trailing interrupts.

Could vdec_wait_inactive() observe a stale timestamp and return immediately
instead of waiting for the hardware to quiesce? This might allow the driver
to forcefully disable device clocks while the hardware is still actively
processing.

> =20
>  	sess->last_irq_jiffies =3D get_jiffies_64();
> +	ret =3D sess->fmt_out->codec_ops->isr(sess);
> =20
> -	return sess->fmt_out->codec_ops->isr(sess);
> +	return ret;
>  }
> =20
>  static irqreturn_t vdec_threaded_isr(int irq, void *data)
>  {
>  	struct amvdec_core *core =3D data;
> -	struct amvdec_session *sess =3D core->cur_sess;
> +	struct amvdec_session *sess;
> +
> +	/*
> +	 * Prevent late-stage threaded interrupts from dereferencing a NULL
> +	 * session.
> +	 */
> +	sess =3D READ_ONCE(core->cur_sess);

[Severity: High]
This is a pre-existing issue, but does using READ_ONCE() here fully resolve
the underlying race condition?

If the thread is preempted after passing the !sess check, could
vdec_stop_streaming() concurrently clear core->cur_sess, disable hardware
clocks via vdec_poweroff(), and free sess->priv?

When the thread resumes, it would dereference the freed sess->priv and acce=
ss
disabled hardware. Should the driver use synchronize_irq() to ensure
in-flight handlers have completed before tearing down session resources?

> +	if (!sess)
> +		return IRQ_NONE;
> =20
>  	return sess->fmt_out->codec_ops->threaded_isr(sess);
>  }

[Severity: High]
Does prematurely releasing core->lock and clearing core->cur_sess in
vdec_stop_streaming() allow another session to start streaming concurrently
while the hardware is still being powered off?

vdec_stop_streaming() acquires core->lock to set core->cur_sess =3D NULL, b=
ut
then releases the lock before stopping the hardware via vdec_poweroff().

Could a concurrent vdec_start_streaming() on a different session successful=
ly
claim core->cur_sess, release the lock, and call vdec_poweron(), breaking
hardware exclusion?

[Severity: Critical]
Does freeing core->m2m_dev in vdec_remove() cause a use-after-free
vulnerability when userspace keeps file descriptors open?

The driver allocates a shared m2m_dev in vdec_probe() and explicitly frees =
it
via v4l2_m2m_release(core->m2m_dev) in vdec_remove(). However, vdec_remove()
is executed on device unbind, which does not wait for userspace to close
active file descriptors.

If a user holds an open file descriptor when the device is unbound, m2m_dev=
 is
freed immediately. When the user later closes the file descriptor, vdec_clo=
se()
calls v4l2_m2m_ctx_release(sess->m2m_ctx), which internally dereferences the
already-freed m2m_dev.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D7

