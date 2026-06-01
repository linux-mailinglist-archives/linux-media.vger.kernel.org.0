Return-Path: <linux-media+bounces-63290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFH7KDmnHWpJcwkAu9opvQ
	(envelope-from <linux-media+bounces-63290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:37:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B3E621D8A
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 197E93021586
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E382765DF;
	Mon,  1 Jun 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kto+33yw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CAF25B082
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328213; cv=none; b=QheEGrOarspOp9AKFstLHG8iMTyanN0h9HQJQmEiqOtpaOY2ofeBfWB+hfqlcGCnHELhWaiHXyzc9UsNrv7Om3OfKHuBFJxNufti/W0dd5FxGdUmPr5teMfVCwX2nT44XcvgSjh9QMHcCKbOzdFSmOBMNHcoP2rnv3TXb3OgqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328213; c=relaxed/simple;
	bh=Ky1X9CqfOTinkUprbf72iv2YgFgLU2THPuB/lWPlOe0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RVIf74jEVxPkbmO4r/aBbfW5vmHpq2aBfB8b2sSSwFZCU2LryQ9uBw63sFSL3JnY1fR0Q6gYKqmkEft3G8KcknIjd1mIhxdEJF2H+OSM0gwQQgbVJTciB396p5FWMfks+DJBl+sh2ZYfPln44fzNt5NjS/M3zt3wyfj/a5SqJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kto+33yw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4EB1F00899;
	Mon,  1 Jun 2026 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328212;
	bh=FYDdSAcQDN1/zHj+UtHq7OIXnSprET0ye13FvLdxULA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kto+33ywhLCtArDz67nJvRxJc/0g5+LZ1tIngJJQE0JYPT69WkoikajXGy/Km8TYr
	 hB9QPfT8n3SldMXxG3yXuSTyl/T9Tao3UD2tHn0kpsEFsl+QJ6SDLZ95WwU1CATsDR
	 k5w6C3WUOmiiA94EgVGzJ4X9V7XJp3rHvYf2jKqafVXIYYZ4ntY8reZWDj3mArRAaF
	 9cY+jtsuTGETXmfGqN19WxbBCvE/oHdgXIyekBnpFQkIfP2zJQuBlUBS/uiZ8uq5Ei
	 CHVYx4U6819LgsUYNN2y4FkdvOJPpJl9fDRMuEAIi2CSzPJfj03Eim5C2O6J5pEq39
	 H63CSs+OtITVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] media: siano: fix URB work teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohith Matam" <rohithmatham@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601152642.55313-1-rohithmatham@gmail.com>
References: <20260601152642.55313-1-rohithmatham@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:36:51 +0000
Message-Id: <20260601153652.0D4EB1F00899@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63290-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 45B3E621D8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential deadlock during device teardown due to unkillable wait i=
n smscore_getbuffer().
--

commit 253a5b71eec477524dcacfed05b5e2e64ea4ebbe
Author: Rohith Matam <rohithmatham@gmail.com>

media: siano: fix URB work teardown

This commit reinitializes URB work items before scheduling to prevent workq=
ueue
warnings during teardown races. It also removes URB_FREE_BUFFER to fix buff=
er
lifetime issues and adjusts buffer management wakeups.

Closes: https://syzkaller.appspot.com/bug?extid=3D0d6ef2b7ceb6014d756c

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b77..fab64e5fa6804 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c

[ ... ]

> @@ -183,12 +192,15 @@ static void smsusb_stop_streaming(struct smsusb_dev=
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
This is a pre-existing issue, but can this sequence cause a deadlock during
teardown?

When smsusb_stop_streaming is called, it iterates over the URBs and calls
cancel_work_sync sequentially. If a worker thread executing do_submit_urb is
concurrently blocked inside smscore_getbuffer waiting for a buffer, it waits
in TASK_UNINTERRUPTIBLE without an abort condition:

drivers/media/common/siano/smscoreapi.c:smscore_getbuffer() {
        struct smscore_buffer_t *cb =3D NULL;

        wait_event(coredev->buffer_mng_waitq, (cb =3D get_entry(coredev)));

        return cb;
}

Because cancel_work_sync is waiting for this worker to finish, the teardown
loop halts and cannot proceed to subsequent URBs to release their buffers
back to the pool via smscore_putbuffer.

Since no more buffers will be returned during teardown, does the worker
sleep forever, causing cancel_work_sync to hang indefinitely?

> +		usb_kill_urb(dev->surbs[i].urb);
> =20
>  		if (dev->surbs[i].cb) {
>  			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601152642.5531=
3-1-rohithmatham@gmail.com?part=3D1

