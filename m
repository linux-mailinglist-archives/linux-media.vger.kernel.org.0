Return-Path: <linux-media+bounces-62174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGNVOFCZDGo6jwUAu9opvQ
	(envelope-from <linux-media+bounces-62174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:09:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DF582DB0
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFC133066BFC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3043367B92;
	Tue, 19 May 2026 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddkyPKXk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C96409107
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210438; cv=pass; b=O4CR4+a+hQLUF0z6vYHHFVO387zYpJxJ1SMoHLPQbqrMmSzHcMjaXvkSdZ7IYCGHKfE68qCVRP5Q6rcMICwD9JNZ3gkuZvTZP2epxPIUmJQWL29sdPGZN2VgeNeFXz3eTR0coA8eBQMDA2b7v6uHnjLjLTIaWBRdQzgIoF5NvVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210438; c=relaxed/simple;
	bh=N93580etNJRtcaCh5k+CIi1IiYnZgvuNwGKzusUmj60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SO83PTxnjg21Ey2IE3tgDE3rg+N0zvUgU13ZBI/g+biOccjPEFB7Pf1DSRd8YA5aVKLlPXBMYx1UhA6uODhkT4pt4MLCKq1C0saZimrrfUjFtBX4V0LoVRMABKLBeEc732J15DflIU9xdWM9k5i/PZdeDDuoYYU/p/P+GfwCBgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddkyPKXk; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7cfd0d8eb09so8094217b3.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 10:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779210436; cv=none;
        d=google.com; s=arc-20240605;
        b=Ma3m0+wJVuP9f4CY01jJAXmGNPaArtdI7RgL47yVOJ4PU6GULe4ABGFgadA7I+MNwG
         it6gm2lM9vEIzIXmxGh1k2mrl3+YM/bstQLife6sKbMqe/LwED1vNgDKx4Y+Nu/aZBq0
         7sLnmJmwYMVriObnalS5lUKaM+uauSqQo7DYynZO3/9pMIOisor1nNbkbbaLSBnCZIJe
         qmGUxc87J67bEM14ZD/Y6VIDwTW30dXIaYzHfNxbeYPcXNoUHDb4YetiTown4cDycnlI
         fuPpJvikxnxFcsnu3ZC/MDIqtiTZA/LMSQpy/3bKKWZqawEwk7+Zc7jDblysZx634/YV
         kJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        fh=5rkd3PAV9KxGYhvXfsG9+sm3P8WPxoqxYeTxzXD5FEo=;
        b=WyUyZ3zj8uIzIXS/LA+v9VqjOualSlEhaUPMl2Z4Urfc2s4lFUmfr/9TZsyyhEzGmK
         XH0ihalcu88/2ZQJ3jy1WHNMNHMgs0Zsich0XHRWAvzv95meQaH5hDTSuwIpZQj/NKVg
         qzMahUya42wKWCRvq9yGLbppamohSB6kPj0Xt7G/3T+cmkcIyW8z6uW3aMFeADE09y0Z
         ci7+egEAanV+PzGole0PfUosbB95DDqGDWQDsgXtwo5JXq5QsjTv7QOGMTXMxI9sZEB1
         vQegn3bv/3SFuYhjY8WjpxpwFpteer7+jC+v0XAf8sgmBeuugIHHM3k4uZfOBmNXdaqF
         aGzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210436; x=1779815236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        b=ddkyPKXkKmY9nmcTdhfZCGdmo+wJsEedx39GIfKBOJIJQqCwv92yFsOy+BiT4m+0nH
         ea8rfXvPG67LN+QzJTw0wp2a1kXkJWfASC4HL83l9bX22PbGTt5QdL5g8RtVN7Tigu5N
         +OuyA7ySUg8bzRPVPO1jRKpinAfN+kTQb+ulRxD+r4hxjNGA4IPcSN+5N6E5rEq0/oV1
         HTxlu0/DO36XxkyqVVfkdqX/ugfzQXlrdQzsQz3/0kWjPsEQpK1aqk8sqYHWK0vkVZXw
         FEg6nQjS9H7FHQ79EjFZv/fWll7ldGeZo4xwOJTnCDAyhvPorO6S+aV2Kl6YnXHYCDVg
         O/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210436; x=1779815236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEsZwdKUK4CjM7jLOh90h5kzKd0IJynt1iGHOkr4Mv0=;
        b=cvLtuC2IfUPXBunYZGqBpu2cONK1rtd4MmFc+WUxTNr4kXlhd2icVWG2c04aEwxrZS
         8D+2NztdfwLH31nKLIg+aRDeu22ieVhNWercfJ7v09Zsg8TrXleXtH7TP0b0j4GbIN5Q
         GmzurQpNpK87Voudhm+gDEUiFHfMrhNzvXJZpKJgHZMUZ6rrb0xUNJ1LNJnz5AurT9bX
         1MvsguIqcAfUONLOsYt8zxiUdnoO4h7z3HQScxvcPuDr+SKHUGEekCkSPi5RW2S+b7RC
         vgpAVF9kX7MndZNq/uUQUcNTXXpGhZgDt1EjgAbMzb1FMiLy3SSRff4mXgIi8LthqQXZ
         ExlA==
X-Forwarded-Encrypted: i=1; AFNElJ/aBf5CEGgKXKtwdqsSlbdqYppJ90LQi5dRhD1SDd2GFoO6/wm1HsMpnSHMUuXzZnd+6h86ksjL9J+Ouw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUhnlwDnM90xTkfd5gp7azhiEeALheMEiZ/nQzX2+bnTIalfi
	eGXjlzNk6UaestZPTKg3v9+2K3G4LmDiV7Q8N8O1Yib4uclgc28oz+VgPBO9owHkBwrC7CuZkUH
	XnvUv8dyUpzAXCXVQZ5aq6Y6VXYxcP8Y=
X-Gm-Gg: Acq92OHCNPv0YJtdVW5EWSmeucO+6kZPm+qAlb+Tpul1IWdx5dRPF+gU0gInMoS215c
	5gl3//n3NtH29y0erDIYcYmqXoRSMWvAbR+UMK8+ozFDfed5fJy78vIdWG5VqGio7EVCSC8WcbM
	VsvlJomxVRXdNdlrLHSPGv03QS2Bjz+bimUbnU0w9/8JhjGYSL3NoAGiQ1PEk14l+P1pMOr3EAk
	sY7LMuLWrqZi5L43jvGzWZXEJ34xM6hRNO2RHnDkCotuCeF8vKxnYoW0QFy2uLj0IAKgufx7G8x
	Wnj1XQ5fBQrChnKatePQgPDgyxIwi6CoA8gVjh36K8EJFFSegan+jRhBxAe1sVmXrTiJ8/ZC
X-Received: by 2002:a05:690c:38a:b0:79a:5fb9:62ad with SMTP id
 00721157ae682-7c95c2f76d2mr234627707b3.43.1779210435344; Tue, 19 May 2026
 10:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora>
 <agNJasayW8VCHTiU@e142607> <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora> <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
 <20260519093955.448ff899@fedora> <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
In-Reply-To: <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 19 May 2026 10:07:02 -0700
X-Gm-Features: AVHnY4KPVoHRfmRDqkq-IVKhKn_YZaF7RwhfpWAK0UOEyzKcth-8E_oZBwz-wzI
Message-ID: <CAPaKu7T7JZRmsS+D_3zFZtyhJk9mNXjL=xpAQ-UNGbm0vztyRg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62174-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B1DF582DB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 1:49=E2=80=AFAM Ketil Johnsen <ketil.johnsen@arm.co=
m> wrote:
>
> On 19/05/2026 09:39, Boris Brezillon wrote:
> > On Mon, 18 May 2026 17:36:40 -0700
> > Chia-I Wu <olvaffe@gmail.com> wrote:
> >
> >> On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
> >> <boris.brezillon@collabora.com> wrote:
> >>>
> >>> On Wed, 13 May 2026 12:31:32 -0700
> >>> Chia-I Wu <olvaffe@gmail.com> wrote:
> >>>
> >>>> On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm=
.com> wrote:
> >>>>>
> >>>>> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> >>>>>> On Tue, 12 May 2026 14:47:27 +0100
> >>>>>> Liviu Dudau <liviu.dudau@arm.com> wrote:
> >>>>>>
> >>>>>>> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> >>>>>>>> On Thu, 7 May 2026 11:02:26 +0200
> >>>>>>>> Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> >>>>>>>>
> >>>>>>>>> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote=
:
> >>>>>>>>>>> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> >>>>>>>>>>>                      return ret;
> >>>>>>>>>>>      }
> >>>>>>>>>>>
> >>>>>>>>>>> +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> >>>>>>>>>>> +   if (protected_heap_name && strlen(protected_heap_name)) {
> >>>>>>>>>>
> >>>>>>>>>> Do we really need this strlen() > 0? Won't dma_heap_find() fai=
l is the
> >>>>>>>>>> name is "" already?
> >>>>>>>>>
> >>>>>>>>> If dma_heap_find() will fail, then the whole probe with fail to=
o.
> >>>>>>>>> This check prevents that.
> >>>>>>>>
> >>>>>>>> Yeah, that's also a questionable design choice. I mean, we can
> >>>>>>>> currently probe and boot the FW even though we never setup the
> >>>>>>>> protected FW sections, so why should we defer the probe here? Ca=
n't we
> >>>>>>>> just retry the next time a group with the protected bit is creat=
ed and
> >>>>>>>> fail if we can find a protected heap?
> >>>>>>>
> >>>>>>> The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> >>>>>>> time only. One of the steps is preparing its internal structures =
for when it enters protected
> >>>>>>> mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> >>>>>>> process when we have a group with protected mode set.
> >>>>>>
> >>>>>> No, but we can force a full/slow reset and have that thing
> >>>>>> re-initialized, can't we? I mean, that's basically what we do when=
 a
> >>>>>> fast reset fails: we re-initialize all the sections and reset agai=
n, at
> >>>>>> which point the FW should start from a fresh state, and be able to
> >>>>>> properly initialize the protected-related stuff if protected secti=
ons
> >>>>>> are populated. Am I missing something?
> >>>>>
> >>>>> Right, we can do that. For some reason I keep associating the reset=
 with the
> >>>>> error handling and not with "normal" operations.
> >>>> I kind of hope we end up with either
> >>>>
> >>>>   - panthor knows the exact heap to use and fails with EPROBE_DEFER =
if
> >>>> the heap is missing, or
> >>>>   - panthor gets a dma-buf from userspace and does the full reset
> >>>>     - userspace also needs to provide a dma-buf for each protected
> >>>> group for the suspend buffer
> >>>>
> >>>> than something in-between. The latter is more ad-hoc and basically
> >>>> kicks the issue to the userspace.
> >>>
> >>> Indeed, the second option is more ad-hoc, but when you think about it=
,
> >>> userspace has to have this knowledge, because it needs to know the
> >>> dma-heap to use for buffer allocation that cross a device boundary
> >>> anyway. Think about frames produced by a video decoder, and composite=
d
> >>> by the GPU into a protected scanout buffer that's passed to the KMS
> >>> device. Why would the GPU driver be source of truth when it comes to
> >>> choosing the heap to use to allocate protected buffers for the video
> >>> decoder or those used for the display?
> >> I don't think the GPU driver is ever the source of truth. If the
> >> system integrator wants to specify the source of truth (SoT) from
> >> kernel space, they should use the device tree (or module params /
> >> config options). If they want to specify the SoT in userspace, then we
> >> don't really care how it is done other than providing an ioctl.
> >> Panthor is always on the receiving end.
> >
> > Okay, we're on the same page then.
> >
> >>
> >> If we don't want to delay this functionality, but it takes time to
> >> converge on SoT, maybe a solution that is not a long-term promise can
> >> work? Of the options on the table (dt, module params, kconfig options,
> >> ioctls), a kconfig option, potentially marked as experimental, seems
> >> like a good candidate.
> >
> > If Panthor is only a consumer, I actually think it'd be easier to just
> > let userspace pass the protected FW section as an imported buffer
> > through an ioctl for now. It means we don't need any of the
> > modifications to the dma_heap API in this series, and userspace is free
> > to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
> > somehow (envvar, driconf, ...). The only thing we need to ensure is if
> > lazy protected FW section allocation is going to work, but given the
> > current code purely and simply ignores those sections, and the FW is
> > still able to boot and act properly (at least on v10-v13), I'm pretty
> > confident this is okay, unless there's some trick the MCU can do to
> > detect that the protected section isn't mapped (which I doubt, because
> > the MCU doesn't know it lives behind an MMU).
I set up MMU to map non-protected memory to the protected section the
other day. The FW still booted fine. I didn't get access violation
until the FW executed PROT_REGION and panthor requested
GLB_PROTM_ENTER in response.

This was on v13, but I also doubt it will become an issue. Can ARM help cla=
rify?

> >
> > Of course, once we have a consensus on how to describe this in the DT,
> > we can switch Panthor over to "protected dma_heap selection through DT"=
,
> > and reflect that through the ioctl that exposes whether protected
> > support is ready or not (would be a DEV_QUERY), such that userspace can
> > skip this "PROTM initialization" step.
> >
> > We're talking about an extra ioctl to set those buffers, and a
> > DEV_QUERY to query the state (ready or not), the size of the global
> > protected buffer (protected FW section) and the size of the protected
> > suspend buffer. The protected suspend buffer would be allocated and
> > passed at group creation time (extra arg passed to the existing
> > GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
> > in term of maintenance cost.
>
> If we can avoid the dma-heap changes, then that would surely help!
> I can try to implement this in the next version unless someone finds a
> reason why it is a bad idea.
Yeah, that sounds good to me too.

Will the extra ioctl require root? On a system with true protected
memory, the FW cannot write to non-protected memory. It seems ok to
allow any client to make the ioctl call. But on systems without true
protected memory, it can be problematic.

>
> >>>> For the former, expressing the relation in DT seems to be the best,
> >>>> but only if possible :-). Otherwise, a kconfig option (instead of
> >>>> module param) should be easier to work with.
> >>>>
> >>>> Looking at the userspace implementation, can we also have an panthor
> >>>> ioctl to return the heap to userspace?
> >>>
> >>> Yes, it's something we can add, but again, I'm questioning the
> >>> usefulness of this: how can we ensure the heap used by panthor to
> >>> allocate its protected FW buffers is suitable for scanout buffers
> >>> (buffers that can be used by display drivers). There needs to be a gl=
ue
> >>> leaving in usersland and taking the decision, and I'm not too sure
> >>> trusting any of the component in the chain (vdec, gpu, display) is th=
e
> >>> right thing to do.
> >> The heap returned by panthor is only for panfrost/panvk. It says
> >> nothing about compatibility with other components on the system.
> >
> > Okay, if it's used only for internal buffers, I guess that's fine.
>
> --
> Ketil

