Return-Path: <linux-media+bounces-63308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5gQ6ER2zHWqydAkAu9opvQ
	(envelope-from <linux-media+bounces-63308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:28:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A06228D5
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBA53306B750
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 16:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B9B288C96;
	Mon,  1 Jun 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdoTLG4O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD72D2483
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330521; cv=none; b=kAw4EkBHCCPJiVhAV4FXOB++yn0gm4CXI5bh6DBuoYON9wP16zbkwQibDI6bbmVA6Qb5rX/FhSFLUwdkM6yLCTte+T7ruW8JX2Pj+3iupDsA9nWho73+QPPc2ZvUN9IaBAAQwtY+O5CNmwjpMMn9W6tGUzdpRg4426/m8rPQwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330521; c=relaxed/simple;
	bh=ibRG7ErJW3w3VLwGJDm5HbwzRsJ888I5QeYjWSJo+GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pVCcyeo0IYg7zaQ1rjcCYBx+nfDDcRlU25qvQUXJ3dwd+jXhnPIGqBymy195+rHzhjM0HiAHVUKmZUGHbfyNYzqXe1qLdgq5/linx/XnWk0cG/Vd9hKbXX7Bk56EPlTrDlxzno4t/Q8VXFdhzThoaBwJPAgSXaXrN+vYewk9d/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdoTLG4O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67951F00893;
	Mon,  1 Jun 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780330519;
	bh=6K+TF6ivC4+fCo8Z6349jlcxrJ0pQ+f334GqZSPx+ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LdoTLG4OG2K9WSYUPTLRJLdQBroIAEPVjUMBWzg83yYoqRr14b3OvdbJrcxUE4MF+
	 hwpDif3VNUyCSaCgAsHPQiUcft5QQ7VmMPajQt93spjY8edVp4doMZ1aFOFE6QNn4K
	 2yWcFs/R9oNAU5322XSXsrkLUblfgECLmOK394O+6lRbwUSZdGRtT3XO3b0EO/qblZ
	 zNR+xLMUEepdd0eY3l1jHBSokcnJrgMMh1bhTOuYV7pmvihhMFnlbFw0wC+7QGRGdP
	 CEZ0yaqwgEE92vSQJCmhBtZXRD5Al1DzujenZzcTXCAqgxQIYgOwB5k3RyzIRHCafg
	 5eQgoivG6UskQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] media: siano: fix URB work teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohith Matam" <rohithmatham@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601160447.59917-1-rohithmatham@gmail.com>
References: <20260601160447.59917-1-rohithmatham@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:15:19 +0000
Message-Id: <20260601161519.B67951F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63308-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Queue-Id: A48A06228D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional dereference of `dev->coredev` in `smsusb_stop_stream=
ing()` during early initialization failure paths causes a kernel panic.
--

commit d1f743fe5305e88770fc795f5d8412345cb04702
Author: Rohith Matam <rohithmatham@gmail.com>

media: siano: fix URB work teardown

This commit reinitializes URB work items before scheduling to avoid
workqueue warnings on teardown. It also fixes related lifetime bugs by
adding an abortable buffer wait and ensuring any URB submitted by an
already-running worker is completed before freeing resources.

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b77..565543dbd4cb1 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c

[ ... ]

> @@ -168,20 +179,33 @@ static int smsusb_submit_urb(struct smsusb_device_t=
 *dev,
>  		smsusb_onresponse,
>  		surb
>  	);
> -	surb->urb->transfer_flags |=3D URB_FREE_BUFFER;
> +	rc =3D usb_submit_urb(surb->urb, GFP_ATOMIC);
> +	if (rc) {
> +		smscore_putbuffer(dev->coredev, surb->cb);
> +		surb->cb =3D NULL;
> +	}
> =20
> -	return usb_submit_urb(surb->urb, GFP_ATOMIC);
> +	return rc;
>  }
> =20
>  static void smsusb_stop_streaming(struct smsusb_device_t *dev)
>  {
>  	int i;
> =20
> -	for (i =3D 0; i < MAX_URBS; i++) {
> +	WRITE_ONCE(dev->streaming, false);
> +	WRITE_ONCE(dev->stopping, true);
> +	wake_up(&dev->coredev->buffer_mng_waitq);

[Severity: High]
Can this unconditionally dereference dev->coredev when it is NULL?

If smsusb_init_device() fails its early endpoint checks, it bails out by
calling smsusb_term_device():

drivers/media/usb/siano/smsusb.c:smsusb_init_device() {
...
	if (!dev->in_ep || !dev->out_ep || align < 0) {  /* Missing endpoints? */
		smsusb_term_device(intf);
		return -ENODEV;
	}
...
}

Because smsusb_term_device() unconditionally calls smsusb_stop_streaming(),
and dev->coredev hasn't been initialized yet during this early error path,
could this new wake_up() call trigger a NULL pointer dereference?

> +
> +	for (i =3D 0; i < MAX_URBS; i++)
>  		usb_kill_urb(dev->surbs[i].urb);
> -		if (dev->surbs[i].wq.func)
> -			cancel_work_sync(&dev->surbs[i].wq);
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601160447.5991=
7-1-rohithmatham@gmail.com?part=3D1

