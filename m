Return-Path: <linux-media+bounces-63754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +OWeARAkIWpx/gAAu9opvQ
	(envelope-from <linux-media+bounces-63754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:06:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C063D840
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 09:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mkQQM5BT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63754-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63754-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20DA3306DF88
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 07:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04513DD510;
	Thu,  4 Jun 2026 07:00:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EF37F8BC
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 07:00:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556425; cv=none; b=fCDqZuQM833sHDdLQkzB35ZHmjSk+uevNtVHGY98jfwflucqBccr01Nzqkdqp35dEmGjnMCSazdC0Ob3DxI/wl5Dng9UDN+GiEe7pFhDupaT3LFhafVLxDN0/ie5ErVaa7I/kmsZD6nkkz0zJv/p2uJeIap6Tt4jVbL94pwqVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556425; c=relaxed/simple;
	bh=x9I0C3+n5Zno1/Fioru3iVdK1+vKYlxTrDIKLkpRsT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qomGb35A+vRq0dI+DtUHsTMVnDOBHflkDp6GV6ay9PvWXKSIboS4aCsRhUOWo1tOTJrUMFUJ5N4dXN8xt8qUvbSjP4+9Iv3NvXPJ3TBYci17mQOUzuqeQwyP1GQhRyIB0ksz2X5NXEX5ZarfH3NTbXShxllLhzRcNSNN+FsJiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkQQM5BT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBB71F00893;
	Thu,  4 Jun 2026 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556414;
	bh=wBt0a2bIS2+GSbG9Hg9BYse8/ZP68oFjSo++w4RDs94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mkQQM5BTBVNsB71/48y5RZPHBvHd9jynXRm+S284T4Ef9wnRuQVE09mEniT6aC2p3
	 A5Dx23wRz/K+cBJdYNFvwdXsGasfiFi1XunRJhTHzh/fOUydkNuwFy7UizoK4EVpfS
	 Wga47JNCGVACbCIGtqC+JolpMREKCW+Qoi4nGLZiXFUps7e2hSf9i06HsN66mlcxa2
	 ofTd92ovoEl2urqNffLsWzmR2ybkpvs0mFlxWMcF/ZA+7TgRkWnpIcNjTk0Kcy1Nlf
	 00BF5AV5473eYlkxPb6RglrCYPKFaWhjMOhI5g1JbiLbSeo9X+aWeqSDij1QyimSrz
	 VzkLG6O/Kg1xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: guard IRQ handler with runtime PM
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604064957.44597-1-dennylin0707@gmail.com>
References: <20260604064957.44597-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:00:14 +0000
Message-Id: <20260604070014.9FBB71F00893@smtp.kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63754-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 677C063D840

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using `pm_runtime_get_if_in_use()` instead of `pm_runtime_get_if_a=
ctive()` in the IRQ handler causes missed interrupts and IRQ storms during =
the autosuspend window.
- [High] The boolean NOT operator (`!`) mishandles negative error returns f=
rom the PM runtime API, leading to hardware access when suspended and usage=
 counter underflows.
- [High] Returning `IRQ_HANDLED` when skipping interrupt processing on the =
early exit path defeats the kernel's spurious interrupt detection mechanism.
--

commit 576f1f875241104f6f3a35d723ea4b7f5bb6ff29
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: guard IRQ handler with runtime PM check

This commit adds a runtime PM check before accessing hardware registers
in the threaded IRQ handler, skipping processing when the device is not
in use.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers=
/media/platform/qcom/iris/iris_hfi_common.c
> index 621c66593d88d..ffb2e65f90f86 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -104,6 +104,11 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  	if (!core)
>  		return IRQ_NONE;
> =20
> +	if (!pm_runtime_get_if_in_use(core->dev)) {

[Severity: High]
Does the logical NOT operator correctly handle negative error codes here?

If runtime PM is disabled (such as during system suspend or driver unbind),
the API returns -EINVAL. Since !(-EINVAL) evaluates to false, wouldn't the
handler bypass this early return entirely?

This would cause the handler to proceed and access potentially unpowered
hardware, and later cause a usage counter underflow when unconditionally
calling pm_runtime_put_autosuspend() at the end of the function since the
counter was never incremented.

Could the return value be assigned to an integer and checked with <=3D 0
instead?

[Severity: High]
Is pm_runtime_get_if_in_use() the right API here rather than
pm_runtime_get_if_active()?

The driver uses pm_runtime_put_autosuspend(), which drops the usage count
to 0 but keeps the device in an active power state until the delay timer
expires.

If a valid hardware interrupt fires during this autosuspend window,
pm_runtime_get_if_in_use() will return 0 because the usage count is 0.

Would this cause the handler to incorrectly assume the device is inactive,
skip clearing the interrupt, and exit? Because the interrupt is never
cleared, wouldn't it immediately re-fire and cause an IRQ storm?

> +		enable_irq(irq);
> +		return IRQ_HANDLED;

[Severity: High]
Should this return IRQ_NONE instead of IRQ_HANDLED?

If the PM check correctly determines that the device is inactive, the device
could not have generated the interrupt.

By returning IRQ_HANDLED, does this falsely claim ownership of a spurious
interrupt, preventing the kernel's "nobody cared" mechanism from
automatically disabling the faulty IRQ line?

> +	}
> +
>  	mutex_lock(&core->lock);
>  	pm_runtime_mark_last_busy(core->dev);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604064957.4459=
7-1-dennylin0707@gmail.com?part=3D1

