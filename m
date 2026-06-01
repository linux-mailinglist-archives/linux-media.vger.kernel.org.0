Return-Path: <linux-media+bounces-63206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHMlKF4oHWq6VwkAu9opvQ
	(envelope-from <linux-media+bounces-63206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F179761A3CD
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D7A301D69D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D4D366DD3;
	Mon,  1 Jun 2026 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJLrG9Kk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65F2352037
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295641; cv=none; b=UqSD5gIMdl3oVj86NgqldfYFYVyP2iUPVLJE30Xx1qkRKpFgUES46dNgtG4eSoClbWVnVlZ0dpzyutH1liGJTK0Dk3uFBHBXX3kleTSHFPPYBse/yIiGAlVE8I8SPwoy7qca1u00vqzygONuGVIKhuToc5587QIJlBZ0taGs1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295641; c=relaxed/simple;
	bh=gRcpob78a4XBt+XKxZN9W4AkpYYwTu9MoPTqn2KkEJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zd85LvMIYaGE9mVHJodsFSqTQCePVwFMigYISCaOOwdoW4z0TSEMU3RueosjJklpq0D1shAMMaynmHptrhefW3ajen/THjJRB9MucUMB7Bi77IPTTTg2nBiLUPC8uHBJ1nB+Ak3d5T7kI8aImV/JOnkVsCop+xfYrFbXS/Pnleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJLrG9Kk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5211F00898;
	Mon,  1 Jun 2026 06:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780295640;
	bh=fdqTFwvIkBP4JJVTcasKDBEM/5UlxxHcSfdtRGvM9Ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bJLrG9Kk2gob1gXE+xxxVGl+k4jr8EaqQLY3U6i24UOA5Omphjfqg4fJIvT63yNyq
	 MPyX4ZEJQkNhxAkLKh1PAFr33H6O9HvRJIUOEizKN3HygryDoZvojr9ZQ4xS0FTn/s
	 OC+U7rpFYV8ZI4UhN3A0h+1SlOcNOaWUy8+egHP2qo4PdB0Jt9vDSGh5wa/dN/x/Ln
	 NLVWnrycP8lFWZC2qGelVyuMhfrvpfF9C7vwIrzBRHP378Tg4YsEWQdh6ckFnWNUmV
	 muwA7WWvYihQEYx+m1FlpipLJs73WD1CpbzfgCjzDxKadofGbVEicQWgzIATQelCiT
	 bCT6FhHNBrD9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: usb: siano: initialize URB work once
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohith Matam" <rohithmatham@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601061855.47423-1-rohithmatham@gmail.com>
References: <20260601061855.47423-1-rohithmatham@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 06:34:00 +0000
Message-Id: <20260601063400.5B5211F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63206-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: F179761A3CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional cancel_work_sync() on uninitialized work items dur=
ing device initialization error paths triggers a kernel warning (WARN_ON(!w=
ork->func)).

Pre-existing issues:
- [Critical] Slab corruption occurs during device teardown due to the `URB_=
FREE_BUFFER` flag being incorrectly set on an interior pointer.
- [Critical] A race condition between `usb_kill_urb()` and `cancel_work_syn=
c()` allows an URB to be submitted after teardown has completed, leading to=
 a Use-After-Free of the device.
--

commit e5db1a18a599b8f6972c2ba7a73f82dde8e97661
Author: Rohith Matam <rohithmatham@gmail.com>

media: usb: siano: initialize URB work once

This commit initializes each work item once when the URB is allocated,
and removes the conditional check before cancelling the work in
smsusb_stop_streaming().

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b77..4e80ccc20e3eb 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
[ ... ]
> @@ -179,8 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_devic=
e_t *dev)
> =20
>  	for (i =3D 0; i < MAX_URBS; i++) {
>  		usb_kill_urb(dev->surbs[i].urb);

[Severity: Critical]
This is a pre-existing issue, but does this sequence cause slab corruption
during device teardown?

In smsusb_submit_urb(), the URB's transfer_buffer is assigned to surb->cb->=
p,
and URB_FREE_BUFFER is added to transfer_flags. The pointer surb->cb->p
addresses an interior chunk inside a larger allocated block. During teardow=
n,
smsusb_term_device() calls usb_free_urb(), which respects the URB_FREE_BUFF=
ER
flag and executes kfree() on this interior pointer, causing slab corruption.

[Severity: Critical]
This is a pre-existing issue, but does this ordering allow an URB to be
submitted after teardown has completed?

If the do_submit_urb work is concurrently executing and blocked (for example
inside smscore_getbuffer()), usb_kill_urb() sees no active URB submission,
temporarily increments and then decrements urb->reject, and returns
immediately.

> -		if (dev->surbs[i].wq.func)
> -			cancel_work_sync(&dev->surbs[i].wq);
> +		cancel_work_sync(&dev->surbs[i].wq);

Next, cancel_work_sync() blocks waiting for the work to finish. The work
thread unblocks, successfully submits the URB via usb_submit_urb() (since
urb->reject is now 0), and exits. cancel_work_sync() then unblocks, teardown
completes, and the device structure is freed. However, the URB is actively
in-flight and will dereference the freed device structure in
smsusb_onresponse() upon completion.

[ ... ]
> @@ -471,6 +469,7 @@ static int smsusb_init_device(struct usb_interface *i=
ntf, int board_id)
>  		dev->surbs[i].urb =3D usb_alloc_urb(0, GFP_KERNEL);
>  		if (!dev->surbs[i].urb)
>  			goto err_unregister_device;
> +		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
>  	}

[Severity: Medium]
Can this unconditional execution of cancel_work_sync() trigger a warning
splat in the error path?

By removing the if (dev->surbs[i].wq.func) check in smsusb_stop_streaming(),
uninitialized work items will now be passed to cancel_work_sync(). If
usb_alloc_urb() fails on an early loop iteration here, it jumps to teardown
before initializing the work structures for the remaining URBs.

When the teardown path calls smsusb_term_device() -> smsusb_stop_streaming(=
),
cancel_work_sync() is unconditionally called on these zero-filled structure=
s,
which encounters a WARN_ON(!work->func) condition in __flush_work().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601061855.4742=
3-1-rohithmatham@gmail.com?part=3D1

