Return-Path: <linux-media+bounces-63282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBRUJNekHWr5cgkAu9opvQ
	(envelope-from <linux-media+bounces-63282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:27:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAD621AD8
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9E95301D59F
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B063E3DB641;
	Mon,  1 Jun 2026 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeXGvEQr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE23DB327
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327273; cv=none; b=BVM4Fam4URTH+aXb+KnFikXFWsM3nlW54tdeeKSm3le4rV4G/KO5szRr8udaI52yg0LhnUzu3AAVkSiaBgwMqSs1Hqnv6X8y+Q947PHnZQHEvjAEXv/BpKBtMTzBnqj0yisib10WkF2/ATFIClYltYzGNFGtMvA33DWjVlmMQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327273; c=relaxed/simple;
	bh=bWt1HJQJsBH3ZcqpsR7uyam+pXGvcJ1lcOc023xHxIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RqXZr0jxFeUWaB/HLdHZYq1OFWlhC752W88a0XWV0q3QDH4LFYedzOMTzIcvz6RVineWy+uOlWbc4k+m1zuB5YgWf5DnO70/5VU2KZm6SWzgwLg8/YBtelglpqcRK/wPD8qFL9VqewvFXZLnILk3cpNywCTHEUR+Nw2qqRliQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeXGvEQr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F8E1F00893;
	Mon,  1 Jun 2026 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780327271;
	bh=eluHg1YkmbnPQeA08X2shgQ2T/32g0mrfuK0J5caryM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BeXGvEQryTUWLYBPN/kHI4LYTv/PbNBU2qnigRiN/QHZ4zmi4qOXYSF+xsn823kTr
	 jjsrYI2hx82RMin6J+e5iViYe3z+ruhw1TlK9Y9CPBew9c/UFE6YbAfzAZANuwa40C
	 nHF9gbPa5OoISJGnB99Xf/cOjo6QDPRTjY1yWapTxwEgWK3y1ShRiBHD1hbqi+JT2u
	 C6nQQ2B7YXPm2tp/YEneP6sXr6XqxvCFRPNpvvpY2SPEm5PxfKPNyz7TSAzDN0qiqk
	 kmLQ7ut4xRRDvueF0kixCp/yYU79tti11NnL9JkpG3PFP7AjUZLP0f2zC6kykWRmHQ
	 s7HFl+1mWjO7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: usb: siano: fix URB work teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohith Matam" <rohithmatham@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601150922.52822-1-rohithmatham@gmail.com>
References: <20260601150922.52822-1-rohithmatham@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:21:11 +0000
Message-Id: <20260601152111.83F8E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63282-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,syzkaller.appspot.com:url,sashiko.dev:url,smtp.kernel.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2ECAD621AD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Calling `cancel_work_sync()` on zero-initialized `work_struct` tri=
ggers a kernel warning and potential oops on early initialization error pat=
hs.

Pre-existing issues:
- [High] Deadlock during USB disconnect due to mismatched `wait_event()` an=
d `wake_up_interruptible()` in buffer management.
- [High] Ignored URB submission failure causes permanent resource loss and =
breaks the streaming pipeline.
--

commit 86927ad3055ee760fa0986f1d04c94db22db769e
Author: Rohith Matam <rohithmatham@gmail.com>

media: usb: siano: fix URB work teardown

This patch reinitializes the URB work items once before URB allocation
and addresses teardown races that can trigger workqueue warnings. It also
adjusts the teardown sequence so that any URB submitted by an already-runni=
ng
worker completes before buffers and the device are freed.

Closes: https://syzkaller.appspot.com/bug?extid=3D0d6ef2b7ceb6014d756c

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b77..e3ca51072cfd5 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c

[ ... ]

> @@ -72,7 +73,8 @@ static void do_submit_urb(struct work_struct *work)
>  	struct smsusb_urb_t *surb =3D container_of(work, struct smsusb_urb_t, w=
q);
>  	struct smsusb_device_t *dev =3D surb->dev;
> =20
> -	smsusb_submit_urb(dev, surb);
> +	if (READ_ONCE(dev->streaming))
> +		smsusb_submit_urb(dev, surb);

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
smsusb_submit_urb() here cause permanent resource loss?

If transient failures occur (e.g., -ENOMEM under memory pressure), the URB
is not queued to the USB core, and its completion handler
(smsusb_onresponse) will never trigger.

Because the URB worker is only rescheduled from the completion handler, the
URB and its associated buffer are permanently dropped from the streaming
pipeline. If this happens to all URBs, the receiver silently stalls.

>  }

[ ... ]

> @@ -177,10 +177,12 @@ static void smsusb_stop_streaming(struct smsusb_dev=
ice_t *dev)
>  {
>  	int i;
> =20
> +	WRITE_ONCE(dev->streaming, false);
> +
>  	for (i =3D 0; i < MAX_URBS; i++) {
>  		usb_kill_urb(dev->surbs[i].urb);
> -		if (dev->surbs[i].wq.func)
> -			cancel_work_sync(&dev->surbs[i].wq);
> +		cancel_work_sync(&dev->surbs[i].wq);

[Severity: High]
Will this unconditional call to cancel_work_sync() execute on uninitialized
work items if smsusb_init_device() fails early?

If smsusb_init_device() fails during early initialization (e.g., due to
missing endpoints or smscore_register_device() returning an error), the
error path calls smsusb_term_device(), which invokes smsusb_stop_streaming(=
).

Because this patch removed the safety check on wq.func and relocated the
INIT_WORK() loop further down in smsusb_init_device(), the work_struct
objects remain zero-initialized by kzalloc_obj().

Calling cancel_work_sync() unconditionally on a zero-initialized work_struct
modifies uninitialized fields and triggers a warning in __flush_work(),
leading to backtraces on device probe failure.

[Severity: High]
This is a pre-existing issue, but can this cancel_work_sync() hang forever
waiting for a deadlocked worker thread?

In drivers/media/common/siano/smscoreapi.c:smscore_getbuffer(), the code
uses wait_event() which puts the thread into TASK_UNINTERRUPTIBLE:

    wait_event(coredev->buffer_mng_waitq, (cb =3D get_entry(coredev)));

However, smscore_putbuffer() signals waiters using wake_up_interruptible(),
which only wakes TASK_INTERRUPTIBLE tasks:

    wake_up_interruptible(&coredev->buffer_mng_waitq);

This mismatch means any worker thread blocked in smscore_getbuffer() will
hang permanently. During a USB disconnect or teardown, cancel_work_sync()
will wait forever for the deadlocked worker, resulting in an unrecoverable
hang of the USB hub thread.

> +		usb_kill_urb(dev->surbs[i].urb);
> =20
>  		if (dev->surbs[i].cb) {
>  			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);

[ ... ]

> @@ -468,6 +472,10 @@ static int smsusb_init_device(struct usb_interface *=
intf, int board_id)
>  	/* initialize urbs */
>  	for (i =3D 0; i < MAX_URBS; i++) {
>  		dev->surbs[i].dev =3D dev;
> +		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
> +	}
> +
> +	for (i =3D 0; i < MAX_URBS; i++) {
>  		dev->surbs[i].urb =3D usb_alloc_urb(0, GFP_KERNEL);
>  		if (!dev->surbs[i].urb)
>  			goto err_unregister_device;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601150922.5282=
2-1-rohithmatham@gmail.com?part=3D1

