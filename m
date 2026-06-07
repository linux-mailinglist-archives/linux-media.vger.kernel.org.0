Return-Path: <linux-media+bounces-64048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwt+LXI+JWqWEwIAu9opvQ
	(envelope-from <linux-media+bounces-64048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:48:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A664F3FC
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:48:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VjtNVXWe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64048-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64048-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1535D301159C
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 09:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D53D30E0EC;
	Sun,  7 Jun 2026 09:46:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332484071CE
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 09:46:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825578; cv=none; b=SveaMSwtxvO99/RltSdVarhV7YDzAFtAdPBq++HSS8ixBemmWwxnRA0YHxYHjoGrv+PX+di62H6Q5frkYkbtjCa+uwjUi/YDYuygz8d92x59Mf+QHWHxqCj6fpo8vLpPIu7FpUVJN4uSs0ZNHbgNENS7WTpL+i7xZ273xbIpubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825578; c=relaxed/simple;
	bh=20jwyUnyWsnQLHuLSIWEkq1IKChpSz8jYv2wDAm5hec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MemtGzPQgBzmZwnNuNfr81yTCBTHhHlOccG0qjtLN2ZmmJpIVOVImY2QaCmh2i4Ffyp4HkYtE34C1CWPS6o8Qfam1mi9P80zzr69CIu2QYK+7JcnYbiiQePecME3OURIRguah7390ZpggQJJAV2uU2vpWYH/QDD7o5znS4XBlxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjtNVXWe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1081F00893;
	Sun,  7 Jun 2026 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780825576;
	bh=vUiTTFO6XoegkGUWVW88+vJkLifZh8YVUGMxaxfAJ+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VjtNVXWeN4bbDtYCAZ4SGQGotuRnWLNSluYMbhnR4t6abcHQO9AZGncDEQa5SBkXy
	 pD0+8uC4bedgmd1WhSpMBruwtHORhCI958gNYU/cOYXgx/s1YUD6G91wDz5YcZ8f/p
	 jy5ND/RjzpMcxWv6ylWBdHDqPFMT+52BJP/TNKKXIkU6qTWqm/4g0cmZzWB7TKXuKc
	 YxobxISLtDYlsc4SyKmeni0ZX/Okp8XvLKdF1z0VSeM9Z0BopjXxfNL+Y1QpjJVbMs
	 pbHkTFZzH5iKsJFa3/nWyoZn8Na4SEyhb50T69NdAwILbbm3Rk5dEKEXL5j+heAO5i
	 HmHKt3nxLN98A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: bt878: check register mapping in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260607093530.3-1-ruoyuw560@gmail.com>
References: <20260607093530.3-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 09:46:16 +0000
Message-Id: <20260607094616.9F1081F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64048-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F17A664F3FC

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition in bt878_probe due to unprotected global variable b=
t878_num
--

commit 5c524e09ca816b9e46cc6d10e5292d06fb75ca23
Author: Ruoyu Wang <ruoyuw560@gmail.com>

media: bt878: check register mapping in probe
   =20
bt878_probe() maps the device register window and then immediately clears
the interrupt mask through btwrite(). If ioremap() fails, the register
write dereferences a NULL mapping. This patch adds a check for the mapping
before touching the registers, and unmaps it on later probe failures.

> diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt=
878.c
> index 62a6c4a80bed2..245a5f0ef4fec 100644
> --- a/drivers/media/pci/bt8xx/bt878.c
> +++ b/drivers/media/pci/bt8xx/bt878.c
> @@ -445,6 +445,10 @@ static int bt878_probe(struct pci_dev *dev, const st=
ruct pci_device_id *pci_id)
>  	bt->bt878_mem =3D (unsigned char *) bt->bt878_adr;
>  #else
>  	bt->bt878_mem =3D ioremap(bt->bt878_adr, 0x1000);

[Severity: High]
This isn't a bug introduced by this patch, but looking at how bt is
assigned earlier in bt878_probe():

	bt =3D &bt878[bt878_num];
	bt->dev =3D dev;
	bt->nr =3D bt878_num;

Could this cause a race condition since the global bt878_num counter and
bt878 array are modified without any locking?

If multiple bt878 devices are bound simultaneously (e.g. via concurrent
userspace sysfs bind writes), multiple threads could read the same bt878_num
index and concurrently overwrite the same bt878[bt878_num] element.

Could this lead to resource leaks (like losing the ioremap pointer assigned
here) or memory corruption when devices process interrupts using clobbered
state?

> +	if (!bt->bt878_mem) {
> +		result =3D -ENOMEM;
> +		goto fail1;
> +	}
>  #endif
> =20
>  	/* clear interrupt mask */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607093530.3-1-=
ruoyuw560@gmail.com?part=3D1

