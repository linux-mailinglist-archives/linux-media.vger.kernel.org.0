Return-Path: <linux-media+bounces-63516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I4aNMlrXH2ptqwAAu9opvQ
	(envelope-from <linux-media+bounces-63516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:27:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385D635328
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:27:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nAX9EruN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63516-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63516-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07F43310AA8A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3040D39B962;
	Wed,  3 Jun 2026 07:17:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53822FDE6
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:17:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471075; cv=none; b=Tx6pGdvPf9phjyHdkqDp4jDlW9Y0U0M59e5MibwPz9DsRsnDXMeMMNlDDO8NNXoJ5GSbCcw5nsEHPQNMfvByFCKzl3vYAZ2U+C8MmpR4d756YZfmELgCokFXfeOUQtN0+qu24R2VnfK2fl3HT6YuqCIZeYiMiWdgeBMiM6Dond4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471075; c=relaxed/simple;
	bh=vGpvsW6YeiBRW+XpeGPGeVA7RWD0PlFqh+1aWD1B4M0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J5WMiXSraozWCINqnODNSaIsH31yhVLaOZKqrev15fgzyh/rDn21CHiqAy+T0ygh9vRlL68/ruUy9CYlyvVbF4EMTJ40DK3DbSAsBF6j1fkb1nYikve+DXZCqzrtZBy3LV06lpBSdY8Z5tUChDp9asp3Li842+ZTfa49hTk0kN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAX9EruN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBE81F00898;
	Wed,  3 Jun 2026 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471074;
	bh=SL/oLC29E4QA2k1G7t/bBKwWjs1pMCMIzqfK/eTmd5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nAX9EruNuxLzoFaOx2GG6Z4niN2fJoo69fmNctgE8mW5TBe0FjHCLwDGCTYEInqwr
	 rJLu9cbrOP35ziB3Vv7Sh7HvyVvQ68OJS7JW+xyqpoZXgfZ5/iS1Rc51MDeiZQiRat
	 2FIb0M5xyWRbK53Tv/FPxjAveEacQWWnxNPVD0kPEn2d+Gw/0NIvt465J/Lt4xSwAS
	 NSvFhmI00g2mCNjTZC0IbCZhS5zstjbKf3GV7xhNdNnqbg6iHZttXMSAa3kGQDY3Cz
	 mylgZM4r9wQLcjTjUdmF4KcJMPZJGLPF6T2j7ukzhrEH1PhLSzeENPjTlQM3JRETDs
	 m8D1RuZMSMR1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/12] media: microchip-isc: fix PM runtime leak in
 AWB work handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-4-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-4-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:17:53 +0000
Message-Id: <20260603071754.0DBE81F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63516-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,microchip.com:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4385D635328

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `isc_s_awb_ctrl()`, `isc_update_awb_ctrls()` and `isc_update_pr=
ofile()` can access unclocked memory-mapped registers, causing an external =
abort.
- [High] In `isc_async_unbind()`, `mutex_destroy(&isc->awb_mutex)` is calle=
d before synchronously cancelling `awb_work`, leading to use-after-free or =
invalid lock operations.
- [Medium] The identical PM runtime leak fixed in microchip-isc-base.c stil=
l exists in the equivalent atmel-isc-base.c staging driver.
- [Medium] Data race on internal AWB state and unprotected hardware registe=
r updates in `isc_s_awb_ctrl`.
- [Low] Unconditional assignment of `dev_pm_ops` pointers generates dead co=
de when PM is disabled.
--

commit a240fe3354d5d26bf1f38d9f8646ecfe72dfa0ae
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

    media: microchip-isc: fix PM runtime leak in AWB work handler
   =20
    Early return when streaming stops skips pm_runtime_put_sync(),
    leaking the reference and preventing runtime suspend.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index b19c5a63b4bdc..f61a5d5a3e045 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -1429,7 +1429,7 @@ static void isc_awb_work(struct work_struct *w)
>  	/* streaming is not active anymore */
>  	if (isc->stop) {
>  		mutex_unlock(&isc->awb_mutex);
> -		return;
> +		goto out_pm_put;
>  	}
> =20
>  	isc_update_profile(isc);
> @@ -1440,6 +1440,7 @@ static void isc_awb_work(struct work_struct *w)
>  	if (ctrls->awb)
>  		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
> =20
> +out_pm_put:
>  	pm_runtime_put_sync(isc->dev);
>  }

[Severity: Medium]
This isn't a bug introduced by this patch, but does this identical PM runti=
me
leak still exist in the equivalent atmel-isc-base.c staging driver?

The staging driver (drivers/staging/media/deprecated/atmel/atmel-isc-base.c)
contains a copy of isc_awb_work() with the same early return bug:

drivers/staging/media/deprecated/atmel/atmel-isc-base.c:isc_awb_work() {
    ...
	if (isc->stop) {
		mutex_unlock(&isc->awb_mutex);
		return;
	}
    ...
}

Should the staging driver be patched as well to prevent a resource leak the=
re?

[Severity: High]
This is a pre-existing issue, but can isc_s_awb_ctrl() and
isc_update_profile() access unclocked memory-mapped registers, causing an
external abort?

isc_s_awb_ctrl() executes independently of streaming state and without
pm_runtime protection. When called while the hardware is runtime suspended,
isc_update_awb_ctrls() will perform an MMIO regmap_write() to unclocked
hardware registers:

drivers/media/platform/microchip/microchip-isc-base.c:isc_s_awb_ctrl() {
    ...
    isc_update_awb_ctrls(isc);
    ...
}

On many ARM architectures, accessing unclocked registers causes an external
abort which immediately panics the kernel.

Furthermore, if called concurrently during teardown, isc_stop_streaming()
releases awb_mutex and drops the PM reference via pm_runtime_put_sync()
before returning. Since videobuf2 only clears q->streaming =3D 0 after
stop_streaming returns, vb2_is_streaming() can evaluate to true while the
hardware is runtime suspended.

This triggers an additional call to isc_update_profile() which polls
unclocked hardware indefinitely.

[Severity: High]
This isn't a bug introduced by this patch, but does isc_async_unbind() dest=
roy
awb_mutex before synchronously cancelling the awb_work, leading to an inval=
id
lock operation or use-after-free?

Looking at isc_async_unbind():

drivers/media/platform/microchip/microchip-isc-base.c:isc_async_unbind() {
    ...
    mutex_destroy(&isc->awb_mutex);
    cancel_work_sync(&isc->awb_work);
    ...
}

cancel_work_sync() blocks until the pending isc_awb_work completes. While it
waits, the work handler executes and attempts to lock isc->awb_mutex, which
has already been destroyed. The identical bug appears to exist in the stagi=
ng
driver's isc_async_unbind() as well.

[Severity: Medium]
This is a pre-existing issue, but does isc_s_awb_ctrl() have a data race and
unprotected hardware register updates?

The V4L2 ioctl handler isc_s_awb_ctrl() modifies internal AWB controls
(ctrls->gain, ctrls->offset, ctrls->awb) holding the V4L2 lock, while the w=
ork
handler isc_awb_work() (via isc_wb_update()) reads and modifies these exact
fields locklessly:

drivers/media/platform/microchip/microchip-isc-base.c:isc_wb_update() {
    ...
    ctrls->gain[c] =3D (3 * ctrls->gain[c] + gain) / 4;
    ...
}

In addition to corrupting the values, isc_s_awb_ctrl() unconditionally calls
isc_update_awb_ctrls() to write to hardware registers without holding
isc->awb_lock. The work handler explicitly documents that awb_lock is stric=
tly
required to prevent the DMA Done IRQ from latching a partially updated stat=
e.

Can this omission result in incorrect white balance configurations taking e=
ffect
for a frame?

[Severity: Low]
This isn't a bug introduced by this patch, but are the dev_pm_ops structures
assigned unconditionally in the platform drivers, generating dead code when=
 PM
is disabled?

In microchip-sama5d2-isc.c and microchip-sama7g5-isc.c:

drivers/media/platform/microchip/microchip-sama5d2-isc.c:microchip_isc_driv=
er {
    ...
    .pm =3D &microchip_isc_dev_pm_ops,
    ...
}

This violates the PM subsystem rule which requires the pm_ptr() wrapper to
ensure the compiler can optimize away the structures when CONFIG_PM is
disabled. Without it, the callbacks and the structures generate dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D4

