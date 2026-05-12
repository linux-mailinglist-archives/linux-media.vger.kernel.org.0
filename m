Return-Path: <linux-media+bounces-61271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H4lERM1A2oA1gEAu9opvQ
	(envelope-from <linux-media+bounces-61271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:11:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C7522061
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 046AE3067B31
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECF83A83B4;
	Tue, 12 May 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HfiHYnEs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E82823D290;
	Tue, 12 May 2026 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595081; cv=none; b=FJq2P/4Odfwksq+g1Mfq+QJlSlK51QSIeiazqGnNWVcIWZgh04WEyaZEZ6v8ss7Q+le4VLdaw0jIchSPmLCMGFw3ZQ89HuavgQHL07cItfpwTm0krwxrm70oC6p5nvNr9QeXNJ8LNWK2Eh4KlQkcDpikG5FMbAu6kGUPcALvRs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595081; c=relaxed/simple;
	bh=ffnSOLr6GBRvN/RNrGZcqdQPL9WDigCoPM7fdgwRrkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utD2q8rveIjiANTbj2Dbe7XvWvVEeJLixgS89rWdpGoA2VfNfAYm6mcKDboCD+hDXoCrL5yg4HsBizQJ7InE/qu83yckVn/IZn03kZuGdmUYUpErvw4AMoKThTRW02f/5yVL5YNOZ7nGKIgAfagm8uxJbMoLjWwRJpQRbs9oxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HfiHYnEs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778595078;
	bh=ffnSOLr6GBRvN/RNrGZcqdQPL9WDigCoPM7fdgwRrkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HfiHYnEsvlaGP8rXHMzyPOvqqCmbexRYDSqS7YdPq/NwKBFXqNQZucTJlKvSPvs6N
	 bQEhjDnFB5iHZ4TngCrePrDeNE6o6Bvgpxllw0d75usAc1NR6HvluYWni2NJopiDRI
	 86qPMBksnJSMJEmIc3ojTu/JVZgi9qGmlmiXngJlggUUebkB/TGJRfiBJwLD84rFDV
	 OnhnS4h4nXnGTF6iC75b1H6EoiUE3RyNWTM4C+t0TL2mN2b3Niq51V/iGCXGpEwWjk
	 52R8MJIdUqkeCRYwCPvihSkxBzJYZqA/D5pKKdhsATj+Rl5B7QS6Pp/8xc0d4UHxn6
	 V/S1XclaHmC1g==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50EAF17E040C;
	Tue, 12 May 2026 16:11:17 +0200 (CEST)
Date: Tue, 12 May 2026 16:11:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Marcin =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@arm.com>, Ketil Johnsen
 <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260512161111.0cb7000e@fedora>
In-Reply-To: <agMvb_jeRsO7tSS-@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
	<20260507135356.5428d50d@fedora>
	<agMvb_jeRsO7tSS-@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E91C7522061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61271-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Tue, 12 May 2026 14:47:27 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > On Thu, 7 May 2026 11:02:26 +0200
> > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> >  =20
> > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote: =20
> > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_devic=
e *ptdev)
> > > > >  			return ret;
> > > > >  	}
> > > > > =20
> > > > > +	/* If a protected heap name is specified but not found, defer t=
he probe until created */
> > > > > +	if (protected_heap_name && strlen(protected_heap_name)) {   =20
> > > >=20
> > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail is =
the
> > > > name is "" already?   =20
> > >=20
> > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > This check prevents that. =20
> >=20
> > Yeah, that's also a questionable design choice. I mean, we can
> > currently probe and boot the FW even though we never setup the
> > protected FW sections, so why should we defer the probe here? Can't we
> > just retry the next time a group with the protected bit is created and
> > fail if we can find a protected heap? =20
>=20
> The problem we have with the current firmware is that it does a number of=
 setup steps at "boot"
> time only. One of the steps is preparing its internal structures for when=
 it enters protected
> mode and it stores them in the buffer passed in at firmware loading. We c=
annot later run the
> process when we have a group with protected mode set.

No, but we can force a full/slow reset and have that thing
re-initialized, can't we? I mean, that's basically what we do when a
fast reset fails: we re-initialize all the sections and reset again, at
which point the FW should start from a fresh state, and be able to
properly initialize the protected-related stuff if protected sections
are populated. Am I missing something?

