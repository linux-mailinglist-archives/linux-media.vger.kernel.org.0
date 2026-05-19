Return-Path: <linux-media+bounces-62059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNVXH/iwC2q2LAUAu9opvQ
	(envelope-from <linux-media+bounces-62059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:38:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E590F575988
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD1223039C89
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 00:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CE02DF68;
	Tue, 19 May 2026 00:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGckjcFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E724468C
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151014; cv=pass; b=bbQXjBgFG5THDooCM1cuK1+QUPASGLGBwuAd75LhPTyhksCDuA3PDKHyYnd9ie/3Jv+BSL3Ohrold+KiuWGsK6+IJ2PLcUFSDsVAZm7UnxRYBuSGIlWqhtg58Zml9xXeNH3s4AvuOADyrtEfFIm2HRQmahKz0mLl0kNObLeOSSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151014; c=relaxed/simple;
	bh=is7j9dVhsZcyR/N2wfaZNxzetAOIpBVHYKZcZ7kuiDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq0tc9H2SS9U7g9p/TutA3Qvlb1UZk4WCGw/Y1ugz2zKCMmOGXgsUzXJhqfr4Akqe3/m+5D4w+SgFeSEm6dgd2UGyWpUIBv2AqpcpfnDQwlQAziAwB9Uv1AA1Chvi4V5jFLFMnmWC9GC2ICcrVrE58yOHCcujA/sUhRC0BS7DPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGckjcFU; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a535e7c00so22910777b3.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 17:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779151011; cv=none;
        d=google.com; s=arc-20240605;
        b=i33pDiz8z1GYziXM3SsbYwve1qjCqgSQ+CaBH7pz4YVEHv2eL7C/aksGs9lVpUXs2A
         VCpxQXjOT9ashJb/ZB+Y//1gLJ+RVjmO6+Kip8IFqGPbHZgv38CPu1WgzxP2hkqV+YLV
         2P8IskagzgF2CLT8kjwEgZ7F0YdBG/7nw58WiiM1X+OHj0FvjkQ3UFDOGx9j5UWzVnC0
         2+BBSWeuid0pAvj/8XHvmV5uG8qcGcZF/eNSuz/D6E2LVPzdjkU6ATdc3oGH71nqYlcq
         Q1i3NCW6xniQQ3v1TPI1hkwWE/XgYiBrY5aUNFQSKWhotJidp7C5RKqNPHj+GAw4GJtd
         qFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        fh=1xwg2TlRYC0kATRHp0eYbTWUWezOYQJL3/tfhgKI/ms=;
        b=AXzbm/3a8iAKrc2UbbVAX086jVtCb+/2rrgRMCIgB5L03HEHhwlWrAFFqQA9TFc8ml
         4l+HDlWT4HjlAhPGl3kDZX3JfyZYHpmM4zsTQSVkzY+YpzdPDjiQuE86RTPUYwv2OqWZ
         /LH93F3swR++DWNpm3hKO/V9kx3R67BTnMGo3RqLj1P3UmxnH1qrTI2Uy9ob7h+6a5bt
         Xf+yFR7729BRAIYWZblKbYQhVmE3KmoxvE2TxysISUspF5JBk84Dsqrudf/D+an65AoE
         phoYROiIdd8KjuKl9JPITgbU/0Z3A7sjs5GmH9CQyoDZa0LAlC+/uLLSsiGg0ZT3Ic6y
         UQcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151011; x=1779755811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=jGckjcFUDmuvg3/zpS4Zh10+M/gqT6NeUW2vPZ9C1QdbL7vssWjGGwIf38oo0syXXO
         a+zQ4TVNWidWTV4WnuDz0Xm5Kew0eaSqIdyZYgCaY7z/9LJ3c5HfWPneNs+cZPCuDeLz
         NbPD6qbEuw6jLqXYRY5GFatzg+VinnvHUoxky80sQf1ng5KbaikyLEtB5/JnL0f8MunC
         5SqNyPKFBtWOmZsT0+LyyH4ADT6YGo2AYPD7CKzhg1Z2YC8oCwdzOaC89D5v1rfBTRFv
         j2Ji7HWOKG1yj7O0WfyGl5hN6IuuQ/3UeMMryoAXJNMbSPYhIx9IObgeviK9mzZhz5n8
         vnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151011; x=1779755811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=CwtRO2UvP8AJJnwGQuqvEO2lYvSIbap+IS/De4CU7ObYQbJRpuSjcvbqA/VV8cocqr
         GBkkFlEUrLTTFZ8L/b99XavtODpmosRufivIDPfjHiAwxbaLM971eXeqVpvuknVjwvqh
         wSqs0KVNTzS+eOneWbRYYsZZC7Y44FsyxkOTUhUGuXzVfcSEQ8OBBgUs4Xu6vXks3s2D
         2ZHe8PSBuIl8tI8CQN9pS4PDyQVOj7Cnk++yHz8Bgbojq6z3wW2uRriIXlVMJIGri0sR
         QboCIkOPhP421NQf078F9dAblNn2d4Ab9N+5LJujcP6OWBtLlvaZvGkd/dc3zPKvKD9t
         zk/g==
X-Forwarded-Encrypted: i=1; AFNElJ8nVNKGnGnI6c16apgjE+TzcwbCg0AjMryELjvaJSDiIB1u9Fwc7z/qwmSaYO/c8O/e34Q1MTzk/89dbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoqPiznsnAdcDg+ssjTb5TcZjsxjqy47Z4BVnQilO2BCE3QOr
	mqp0u9SZdTJnHOCt7FD0Vn3lqNCTHtXPYgy4h49yMtbPDXS6Og3joRQZBe1Wvqs32Hwe+7c0zLE
	iZM1HBhJjtpfFhj2fsKnNCvmTWV7lIfw=
X-Gm-Gg: Acq92OGYGSWLEfCFqJNmRQko7/QXfWkVbuTBGL4mQepQe5aXEMCB+SnMyKR44jMJi8u
	TcvNPLjksiO/b7+bm8b7JCJOHDKJ8YmrBjEf3fVV70SF9NYuEmgxUTS1iKGVKO9JbCMDTuQ9p0M
	b0uwlHQ5MokcnKCNJsmx0tO81bwf/dVQ3Eg79qrte6mArU7lwKSVQw9tHh4/qOuK/kZ7MDfYIqP
	Zq2ld6CF6mMNmCRK3V0oD27oUjHR711ny/q/WurY0k3bfkJH35eiPXEBheWOqLfI5EIzLpoejNK
	6NsStCS0u5elqJ+0/GMQ4tnWY0LlMaT+RcozRHGpYCHC6MGrK2fF/Kx8JRHX4IFrVXb88xYT
X-Received: by 2002:a05:690c:19:b0:7bd:5cc4:3e49 with SMTP id
 00721157ae682-7c9597a969fmr213746077b3.12.1779151010945; Mon, 18 May 2026
 17:36:50 -0700 (PDT)
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
 <20260518091650.5a7a4f4a@fedora>
In-Reply-To: <20260518091650.5a7a4f4a@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 18 May 2026 17:36:40 -0700
X-Gm-Features: AVHnY4L_pqXJyhSchHbjEJHIXbJa2yYodKfZcbmSmhWAfddYBdzbaPZTcjMiQrU
Message-ID: <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62059-lists,linux-media=lfdr.de];
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
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,arm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E590F575988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 13 May 2026 12:31:32 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.co=
m> wrote:
> > >
> > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > >
> > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > >
> > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wro=
te:
> > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panth=
or_device *ptdev)
> > > > > > > > >                     return ret;
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > > +   /* If a protected heap name is specified but not foun=
d, defer the probe until created */
> > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_name=
)) {
> > > > > > > >
> > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() =
fail is the
> > > > > > > > name is "" already?
> > > > > > >
> > > > > > > If dma_heap_find() will fail, then the whole probe with fail =
too.
> > > > > > > This check prevents that.
> > > > > >
> > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > currently probe and boot the FW even though we never setup the
> > > > > > protected FW sections, so why should we defer the probe here? C=
an't we
> > > > > > just retry the next time a group with the protected bit is crea=
ted and
> > > > > > fail if we can find a protected heap?
> > > > >
> > > > > The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> > > > > time only. One of the steps is preparing its internal structures =
for when it enters protected
> > > > > mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> > > > > process when we have a group with protected mode set.
> > > >
> > > > No, but we can force a full/slow reset and have that thing
> > > > re-initialized, can't we? I mean, that's basically what we do when =
a
> > > > fast reset fails: we re-initialize all the sections and reset again=
, at
> > > > which point the FW should start from a fresh state, and be able to
> > > > properly initialize the protected-related stuff if protected sectio=
ns
> > > > are populated. Am I missing something?
> > >
> > > Right, we can do that. For some reason I keep associating the reset w=
ith the
> > > error handling and not with "normal" operations.
> > I kind of hope we end up with either
> >
> >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > the heap is missing, or
> >  - panthor gets a dma-buf from userspace and does the full reset
> >    - userspace also needs to provide a dma-buf for each protected
> > group for the suspend buffer
> >
> > than something in-between. The latter is more ad-hoc and basically
> > kicks the issue to the userspace.
>
> Indeed, the second option is more ad-hoc, but when you think about it,
> userspace has to have this knowledge, because it needs to know the
> dma-heap to use for buffer allocation that cross a device boundary
> anyway. Think about frames produced by a video decoder, and composited
> by the GPU into a protected scanout buffer that's passed to the KMS
> device. Why would the GPU driver be source of truth when it comes to
> choosing the heap to use to allocate protected buffers for the video
> decoder or those used for the display?
I don't think the GPU driver is ever the source of truth. If the
system integrator wants to specify the source of truth (SoT) from
kernel space, they should use the device tree (or module params /
config options). If they want to specify the SoT in userspace, then we
don't really care how it is done other than providing an ioctl.
Panthor is always on the receiving end.

If we don't want to delay this functionality, but it takes time to
converge on SoT, maybe a solution that is not a long-term promise can
work? Of the options on the table (dt, module params, kconfig options,
ioctls), a kconfig option, potentially marked as experimental, seems
like a good candidate.

>
> >
> > For the former, expressing the relation in DT seems to be the best,
> > but only if possible :-). Otherwise, a kconfig option (instead of
> > module param) should be easier to work with.
> >
> > Looking at the userspace implementation, can we also have an panthor
> > ioctl to return the heap to userspace?
>
> Yes, it's something we can add, but again, I'm questioning the
> usefulness of this: how can we ensure the heap used by panthor to
> allocate its protected FW buffers is suitable for scanout buffers
> (buffers that can be used by display drivers). There needs to be a glue
> leaving in usersland and taking the decision, and I'm not too sure
> trusting any of the component in the chain (vdec, gpu, display) is the
> right thing to do.
The heap returned by panthor is only for panfrost/panvk. It says
nothing about compatibility with other components on the system.

