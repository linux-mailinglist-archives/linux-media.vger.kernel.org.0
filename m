Return-Path: <linux-media+bounces-62102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLm1B6wUDGoZVQUAu9opvQ
	(envelope-from <linux-media+bounces-62102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:43:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA0579518
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A4B830480EC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 07:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFB33DA7E0;
	Tue, 19 May 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b+ErxVrl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD3939EF35;
	Tue, 19 May 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176438; cv=none; b=n7/zAIsk9vt32rGs8BuQHPbKBE6joT+3LIn7pVKZKISCK25XoLpjmXavJRA67SoWaISW8kfw9ZU/qOrxAbYevZHJ+OEK7toLEHJLq+1sPeadC0hdGUr5VjLuTjRyo9QWectGeKFPOkCfZsvbftdQmDr7jQz9SEAfQyYk8T2Bzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176438; c=relaxed/simple;
	bh=NO+vmHISBoRKaTEO5YEriWd2N0PVf7URQEW8l+FSoO8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAqUHtDkrkWEywVPMA+dS4NKZIy+s+3CcER6M90uBksH0Hcn9klGKaEFGskg4X/obuSQXhrtyOmVQBJgVXFXT28h7AK4gQU13ALWUgfY7jzTg0hi9mrVXOyliF+glRtdD5rhYc12Nm+MCCBuvfxmks/nRUpBm7km7+IAq2hcNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b+ErxVrl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779176402;
	bh=NO+vmHISBoRKaTEO5YEriWd2N0PVf7URQEW8l+FSoO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b+ErxVrlXKCkecAO2bHYWT0FIsQ8wkngnlnLu47VjLJ6VokhnGkDbm7/VpjxQrlrA
	 HXvWuPEPLeBCE+Ax773X/jQPMd0I6LduOzKwcZ6w+RSMoolZQ3Aig7grTGPWB13KEa
	 KmhggnjGaaLgCRMkaF+59OxtYi7OxX1JZh9fNZ1xsaEoBlohsIE1OTyDL68CWgePtL
	 6bQANazMuJoc1FLZy+POcxeFfDUVI3w3qH+EkPitqDCpOrLJlfLrHypH49lr4OMN5N
	 WQs13+tY7qL4rpsCc8EI0nTs2oq/6G2VcDQ+oxWIndbicyXemIrDQsRy1iqQxY0+7R
	 Pze5fS6GT+gZw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4242817E05E5;
	Tue, 19 May 2026 09:40:01 +0200 (CEST)
Date: Tue, 19 May 2026 09:39:55 +0200
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
Message-ID: <20260519093955.448ff899@fedora>
In-Reply-To: <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260505181523.49a3d85c@fedora>
	<afxVIuVVPisBQ9p_@e129842.arm.com>
	<20260507135356.5428d50d@fedora>
	<agMvb_jeRsO7tSS-@e142607>
	<20260512161111.0cb7000e@fedora>
	<agNJasayW8VCHTiU@e142607>
	<CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
	<20260518091650.5a7a4f4a@fedora>
	<CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-62102-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 7AEA0579518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 17:36:40 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 13 May 2026 12:31:32 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> > =20
> > > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.=
com> wrote: =20
> > > >
> > > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote: =20
> > > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > > > =20
> > > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote=
: =20
> > > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > > > =20
> > > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon w=
rote: =20
> > > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct pan=
thor_device *ptdev)
> > > > > > > > > >                     return ret;
> > > > > > > > > >     }
> > > > > > > > > >
> > > > > > > > > > +   /* If a protected heap name is specified but not fo=
und, defer the probe until created */
> > > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_na=
me)) { =20
> > > > > > > > >
> > > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find(=
) fail is the
> > > > > > > > > name is "" already? =20
> > > > > > > >
> > > > > > > > If dma_heap_find() will fail, then the whole probe with fai=
l too.
> > > > > > > > This check prevents that. =20
> > > > > > >
> > > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > > currently probe and boot the FW even though we never setup the
> > > > > > > protected FW sections, so why should we defer the probe here?=
 Can't we
> > > > > > > just retry the next time a group with the protected bit is cr=
eated and
> > > > > > > fail if we can find a protected heap? =20
> > > > > >
> > > > > > The problem we have with the current firmware is that it does a=
 number of setup steps at "boot"
> > > > > > time only. One of the steps is preparing its internal structure=
s for when it enters protected
> > > > > > mode and it stores them in the buffer passed in at firmware loa=
ding. We cannot later run the
> > > > > > process when we have a group with protected mode set. =20
> > > > >
> > > > > No, but we can force a full/slow reset and have that thing
> > > > > re-initialized, can't we? I mean, that's basically what we do whe=
n a
> > > > > fast reset fails: we re-initialize all the sections and reset aga=
in, at
> > > > > which point the FW should start from a fresh state, and be able to
> > > > > properly initialize the protected-related stuff if protected sect=
ions
> > > > > are populated. Am I missing something? =20
> > > >
> > > > Right, we can do that. For some reason I keep associating the reset=
 with the
> > > > error handling and not with "normal" operations. =20
> > > I kind of hope we end up with either
> > >
> > >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > > the heap is missing, or
> > >  - panthor gets a dma-buf from userspace and does the full reset
> > >    - userspace also needs to provide a dma-buf for each protected
> > > group for the suspend buffer
> > >
> > > than something in-between. The latter is more ad-hoc and basically
> > > kicks the issue to the userspace. =20
> >
> > Indeed, the second option is more ad-hoc, but when you think about it,
> > userspace has to have this knowledge, because it needs to know the
> > dma-heap to use for buffer allocation that cross a device boundary
> > anyway. Think about frames produced by a video decoder, and composited
> > by the GPU into a protected scanout buffer that's passed to the KMS
> > device. Why would the GPU driver be source of truth when it comes to
> > choosing the heap to use to allocate protected buffers for the video
> > decoder or those used for the display? =20
> I don't think the GPU driver is ever the source of truth. If the
> system integrator wants to specify the source of truth (SoT) from
> kernel space, they should use the device tree (or module params /
> config options). If they want to specify the SoT in userspace, then we
> don't really care how it is done other than providing an ioctl.
> Panthor is always on the receiving end.

Okay, we're on the same page then.

>=20
> If we don't want to delay this functionality, but it takes time to
> converge on SoT, maybe a solution that is not a long-term promise can
> work? Of the options on the table (dt, module params, kconfig options,
> ioctls), a kconfig option, potentially marked as experimental, seems
> like a good candidate.

If Panthor is only a consumer, I actually think it'd be easier to just
let userspace pass the protected FW section as an imported buffer
through an ioctl for now. It means we don't need any of the
modifications to the dma_heap API in this series, and userspace is free
to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
somehow (envvar, driconf, ...). The only thing we need to ensure is if
lazy protected FW section allocation is going to work, but given the
current code purely and simply ignores those sections, and the FW is
still able to boot and act properly (at least on v10-v13), I'm pretty
confident this is okay, unless there's some trick the MCU can do to
detect that the protected section isn't mapped (which I doubt, because
the MCU doesn't know it lives behind an MMU).

Of course, once we have a consensus on how to describe this in the DT,
we can switch Panthor over to "protected dma_heap selection through DT",
and reflect that through the ioctl that exposes whether protected
support is ready or not (would be a DEV_QUERY), such that userspace can
skip this "PROTM initialization" step.

We're talking about an extra ioctl to set those buffers, and a
DEV_QUERY to query the state (ready or not), the size of the global
protected buffer (protected FW section) and the size of the protected
suspend buffer. The protected suspend buffer would be allocated and
passed at group creation time (extra arg passed to the existing
GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
in term of maintenance cost.

>=20
> > =20
> > >
> > > For the former, expressing the relation in DT seems to be the best,
> > > but only if possible :-). Otherwise, a kconfig option (instead of
> > > module param) should be easier to work with.
> > >
> > > Looking at the userspace implementation, can we also have an panthor
> > > ioctl to return the heap to userspace? =20
> >
> > Yes, it's something we can add, but again, I'm questioning the
> > usefulness of this: how can we ensure the heap used by panthor to
> > allocate its protected FW buffers is suitable for scanout buffers
> > (buffers that can be used by display drivers). There needs to be a glue
> > leaving in usersland and taking the decision, and I'm not too sure
> > trusting any of the component in the chain (vdec, gpu, display) is the
> > right thing to do. =20
> The heap returned by panthor is only for panfrost/panvk. It says
> nothing about compatibility with other components on the system.

Okay, if it's used only for internal buffers, I guess that's fine.

