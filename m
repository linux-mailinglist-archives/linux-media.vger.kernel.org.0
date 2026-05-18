Return-Path: <linux-media+bounces-61880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMvfLK69Cmrb7AQAu9opvQ
	(envelope-from <linux-media+bounces-61880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:20:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E485675D1
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBE4230269DF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15BF3CF690;
	Mon, 18 May 2026 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ro/navyn"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B288B3AF666;
	Mon, 18 May 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088624; cv=none; b=cmfMBVdCUcahXBGytCv6JjupuXyIBA5WPK+94HPJMB0gnXEZbxoz6EkBE98X7BjMn1rCyT8wHKin+JaRgtImM6OO8rKAocAsJFiH2gTjKeae0xGGCq0xamIqxvpXCTSNebODBVwZ0MzOcCr2GicMQGKhD806IVf+7PltCWgDpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088624; c=relaxed/simple;
	bh=KqXz31fFcllBghfI8pU+i0+gahHJxk311r9iPzSXzpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6tHyhlbrAK6F7kj4ZB+SQJO/4TsgIvsQOW4afcOisudq8IWSEAR0g4W/KwKHecjX/tSAAvMBYSU9QusyWqCRw5v5RmxEA2NLF4woUqsHilD6BX101YmolxotK8E4k1jB8qt8fWGfTL4J2rw0P/ApvYLMBQyCuW+FOOTWRxyhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ro/navyn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779088614;
	bh=KqXz31fFcllBghfI8pU+i0+gahHJxk311r9iPzSXzpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ro/navyn0/DVaD7IcAs2bwN9U0+qbMBiTf0oUjhMcD0ROwgB/USIvQN1YZMsz174L
	 qBnN+vWuGWz1lVeR2jYgmElu1mjPxSMMGXIGAjsej3MU7FVBjkaUWJZstMBCZOlCyO
	 Lv4cAJJONcuvfiREYLHFMuSa+lE3sWIqJRj8ubGV6P0FReLdNK4Fk54j0akWhe7mYb
	 Ym19npygDaWlq5bpJbStix+kkZv9vaF6FznF0nLYxsVhvf2siW6oSF6AwFgJReakda
	 iiCScxbzTpDsRQNchfi+ZPOY5WefpAq+Cs+QuebRutmtjhkxc98uX1vYr3I/U2XKv+
	 5Ebczo3CckW+Q==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDEFE17E04E2;
	Mon, 18 May 2026 09:16:53 +0200 (CEST)
Date: Mon, 18 May 2026 09:16:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Marcin =?UTF-8?B?xZpsdXNhcno=?=
 <marcin.slusarz@arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260518091650.5a7a4f4a@fedora>
In-Reply-To: <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
	<20260507135356.5428d50d@fedora>
	<agMvb_jeRsO7tSS-@e142607>
	<20260512161111.0cb7000e@fedora>
	<agNJasayW8VCHTiU@e142607>
	<CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
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
X-Rspamd-Queue-Id: 50E485675D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61880-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Wed, 13 May 2026 12:31:32 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com>=
 wrote:
> >
> > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote: =20
> > > On Tue, 12 May 2026 14:47:27 +0100
> > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > =20
> > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote: =20
> > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > =20
> > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote=
: =20
> > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor=
_device *ptdev)
> > > > > > > >                     return ret;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > +   /* If a protected heap name is specified but not found,=
 defer the probe until created */
> > > > > > > > +   if (protected_heap_name && strlen(protected_heap_name))=
 { =20
> > > > > > >
> > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fa=
il is the
> > > > > > > name is "" already? =20
> > > > > >
> > > > > > If dma_heap_find() will fail, then the whole probe with fail to=
o.
> > > > > > This check prevents that. =20
> > > > >
> > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > currently probe and boot the FW even though we never setup the
> > > > > protected FW sections, so why should we defer the probe here? Can=
't we
> > > > > just retry the next time a group with the protected bit is create=
d and
> > > > > fail if we can find a protected heap? =20
> > > >
> > > > The problem we have with the current firmware is that it does a num=
ber of setup steps at "boot"
> > > > time only. One of the steps is preparing its internal structures fo=
r when it enters protected
> > > > mode and it stores them in the buffer passed in at firmware loading=
. We cannot later run the
> > > > process when we have a group with protected mode set. =20
> > >
> > > No, but we can force a full/slow reset and have that thing
> > > re-initialized, can't we? I mean, that's basically what we do when a
> > > fast reset fails: we re-initialize all the sections and reset again, =
at
> > > which point the FW should start from a fresh state, and be able to
> > > properly initialize the protected-related stuff if protected sections
> > > are populated. Am I missing something? =20
> >
> > Right, we can do that. For some reason I keep associating the reset wit=
h the
> > error handling and not with "normal" operations. =20
> I kind of hope we end up with either
>=20
>  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> the heap is missing, or
>  - panthor gets a dma-buf from userspace and does the full reset
>    - userspace also needs to provide a dma-buf for each protected
> group for the suspend buffer
>=20
> than something in-between. The latter is more ad-hoc and basically
> kicks the issue to the userspace.

Indeed, the second option is more ad-hoc, but when you think about it,
userspace has to have this knowledge, because it needs to know the
dma-heap to use for buffer allocation that cross a device boundary
anyway. Think about frames produced by a video decoder, and composited
by the GPU into a protected scanout buffer that's passed to the KMS
device. Why would the GPU driver be source of truth when it comes to
choosing the heap to use to allocate protected buffers for the video
decoder or those used for the display?

>=20
> For the former, expressing the relation in DT seems to be the best,
> but only if possible :-). Otherwise, a kconfig option (instead of
> module param) should be easier to work with.
>=20
> Looking at the userspace implementation, can we also have an panthor
> ioctl to return the heap to userspace?

Yes, it's something we can add, but again, I'm questioning the
usefulness of this: how can we ensure the heap used by panthor to
allocate its protected FW buffers is suitable for scanout buffers
(buffers that can be used by display drivers). There needs to be a glue
leaving in usersland and taking the decision, and I'm not too sure
trusting any of the component in the chain (vdec, gpu, display) is the
right thing to do.

