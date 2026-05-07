Return-Path: <linux-media+bounces-60784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNnEFJt9/GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:55:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1D4E7D1D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F7B530230CD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030993AA4E2;
	Thu,  7 May 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fPmUsP6B"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECE3DCD9A;
	Thu,  7 May 2026 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154847; cv=none; b=HS8se+JCmyUa/bYgrPx2NQLOP4QQ08uKNiwD0/7i5Buiqdqprym0TcCk5u7tGhqnjOXogIghpDEdZjB6iB7Tr+JQ4hZA8luXzBA7SbBvPlpI594Ci4rvFgfJPc/FmkyTZRpiaBPuqSubCOMVrJtgfoo/G1MOfbDAr2ndXSWrOdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154847; c=relaxed/simple;
	bh=6BJjaGOruHF5NtcX/6zf6Bu/wTeaT/tj56yBW3eKEjU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLVuJeAkbBy9/3H+ScLOtaoT6TIn1KP8Fg1hPU2cwqXNQPLLXrr0STb0dOh+b8ecT+vzMycV3OQynzGberZOoKD18N2aRv4GgSvsO6Kn4a3/5ilj8HYNjA9I/Pk9UNvXWDG2OcsHJYGGXZk+AlCCVJD+LhoHOrriAhAAavuAej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fPmUsP6B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778154843;
	bh=6BJjaGOruHF5NtcX/6zf6Bu/wTeaT/tj56yBW3eKEjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fPmUsP6Biz1SZnJghN6tCtUsycAXbfsN/MzfNobVHwNqgB9kUdtzRDrm7ogE3kUmV
	 1KDDDRUWg2fjogTnUTYzgF84lYdKCv6j/In8onWuNjag38GBGDvUnROplZj2yWZhfL
	 NkM1qmranfx0+bTAFnW3K5+3qzk/cZ6W9Vmu4X+KK7wK0pOHDN34U4vAiHVUfXeg6Z
	 VV+J44rQsAIf+Bk6E7Pe3FkLjB/Wl1R5/SFqZlP8qc3JfmltvLQveBlZNxBGuINO9h
	 +ICAiSORgAbWgWhwR5Dc7w958IByNyyynEWatcnxaomqoIEzijteBXQrJZekWZmmyG
	 cp7GXoQgAYdmA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C6717E131F;
	Thu,  7 May 2026 13:54:02 +0200 (CEST)
Date: Thu, 7 May 2026 13:53:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marcin =?UTF-8?B?xZpsdXNhcno=?= <marcin.slusarz@arm.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260507135356.5428d50d@fedora>
In-Reply-To: <afxVIuVVPisBQ9p_@e129842.arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
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
X-Rspamd-Queue-Id: DBA1D4E7D1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60784-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,arm.com:email]
X-Rspamd-Action: no action

On Thu, 7 May 2026 11:02:26 +0200
Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:

> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *p=
tdev)
> > >  			return ret;
> > >  	}
> > > =20
> > > +	/* If a protected heap name is specified but not found, defer the p=
robe until created */
> > > +	if (protected_heap_name && strlen(protected_heap_name)) { =20
> >=20
> > Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> > name is "" already? =20
>=20
> If dma_heap_find() will fail, then the whole probe with fail too.
> This check prevents that.

Yeah, that's also a questionable design choice. I mean, we can
currently probe and boot the FW even though we never setup the
protected FW sections, so why should we defer the probe here? Can't we
just retry the next time a group with the protected bit is created and
fail if we can find a protected heap?

> I'm not sure why it's needed at all, but if
> it is really needed, then s/strlen(protected_heap_name)/protected_heap_na=
me[0]/
> would simplify this.

It's not so much about how you do the test, and more about the case
you're trying to protect against. I guess here you assume that
panthor.protected_heap_name=3D"" means "I don't have a protected heap for
you". If it's deemed acceptable, this should most certainly be
described somewhere.

>=20
> > > +		ptdev->protm.heap =3D dma_heap_find(protected_heap_name);
> > > +		if (!ptdev->protm.heap) {
> > > +			drm_warn(&ptdev->base,
> > > +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> > > +				 protected_heap_name);
> > > +			ret =3D -EPROBE_DEFER;
> > > +			goto err_rpm_put; =20
> >=20
> > If you move the heap retrieval before the rpm enablement, you can get
> > rid of this goto err_rpm_put.
> >  =20
> > > +		}
> > > +	}
> > > +
> > >  	ret =3D panthor_hw_init(ptdev);
> > >  	if (ret)
> > > -		goto err_rpm_put;
> > > +		goto err_dma_heap_put;
> > > =20
> > >  	ret =3D panthor_pwr_init(ptdev);
> > >  	if (ret) =20


