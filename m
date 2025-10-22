Return-Path: <linux-media+bounces-45277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35DBFD63C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A0E4017B2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83A73557EE;
	Wed, 22 Oct 2025 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGumm2YL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF635504F
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150161; cv=none; b=N6CQqVAkG5aNfWtfRAKB75uqliZNGAOq5aa3LnytH32IVMHvi/diq8XFC+DN/bf+hqH1GViej+bgFu126Z4Sfun0v5g0DVvKsx0c+L65H/3R26x2/uNFN9A3tHYgVGjhwBT1MawNdwhhKnbwMOuq69uDwfHJMCwcKt87sKHOzzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150161; c=relaxed/simple;
	bh=YCov4x0BqOSH2/C6y9Fgj+4zowfsuwuCXjatGY7QUkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAEL/QIqT4VPYYIhxK0quI7zzBPB5Kd3MkezI/DSel9Vw8ySPlxuNlha1EshwWcj7VCBtPFWFLuiXXQei2D23WpAFdHcKEpEvWecIQgejdGjJtmWnv006Jde2HS5l038PrrCKnQav6E8H7TAH05UDkGbTIwsEdLnWpCVpa5mBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGumm2YL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D2AC116B1
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761150160;
	bh=YCov4x0BqOSH2/C6y9Fgj+4zowfsuwuCXjatGY7QUkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FGumm2YLbqk2q5dVH7k9NbkHOlkzGKQ9m+2ARM6o5gptaxrA5N/6nKstvNDdTijmx
	 XiZNNNo4BgrifPtpiZ98sumxspcln0bWzs5M/7nrJNf3zYclXeYtHjR64wb16zB7nc
	 sEGHmfnI/GE6OqhqwFFCT/2sTUnTSxCh1SuaVzLCrGSqRataQf7UjPYfhu2QCHyU9R
	 TK8t1f8W1xyvVJfBb2qFk/EczlY1D6aGQjHx87+qy2bhEKBm2JY6/b/+X93ktW7088
	 CqUL5Y0YSg+AJ83T7D/vK6t2WCYRuacGg+Ga1HlI1oSJkhbT6EjC5AKwz//p1y1N6I
	 2hkXFnWTinzZA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3e9d633b78so294192666b.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiyaJ+sWd+Fb9Pouub1DOjUo3DprAWUuBykfyTzS6kJOhkIoY4Aq89SEUPjburnkXPc9Yq1V606DZndw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbls+WhMr0mmnnJMSKjaBIcwKHe91L5U/rJtjfr763/s+TJ7O
	UBMUO80el/CcnBtWLhGyeMTnbtYN5os/nkG+gz5+6bzgZIPnj8doS4LeP/riu2P98LZ9rWlfjX5
	h2liaJz12mIGlsdtY7CXPMoqdTUiIYQ==
X-Google-Smtp-Source: AGHT+IGphdHfOqtuSMrfZHHKoMtu86beDx79AwnS5WmHT0uStu32DJJ/Ln6QYAVqoGfNCp7zAA/jO70wft27b2yZyjA=
X-Received: by 2002:a17:907:845:b0:b2a:47c9:8ff5 with SMTP id
 a640c23a62f3a-b6d2c71f62amr555812966b.10.1761150158929; Wed, 22 Oct 2025
 09:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org> <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com> <20251017153746.GA1579747-robh@kernel.org>
 <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com> <aPNE5po45Umson5V@lstrano-desk.jf.intel.com>
 <aPf+ZLJ2KIsz+lZx@lstrano-desk.jf.intel.com>
In-Reply-To: <aPf+ZLJ2KIsz+lZx@lstrano-desk.jf.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Oct 2025 11:22:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+WUk-cs0ZgiQ-nEQTmdn=faCCnoPED2HnhKx0vJ=uCQ@mail.gmail.com>
X-Gm-Features: AS18NWCRsuFSavTaQ2ZXGKmNF4KE6LZuGI0Wke6UF8bHIQFS03d1VhZlH-NVkSw
Message-ID: <CAL_JsqK+WUk-cs0ZgiQ-nEQTmdn=faCCnoPED2HnhKx0vJ=uCQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
To: Matthew Brost <matthew.brost@intel.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
	Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
	Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 4:43=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> On Sat, Oct 18, 2025 at 12:42:30AM -0700, Matthew Brost wrote:
> > On Fri, Oct 17, 2025 at 11:43:51PM -0700, Matthew Brost wrote:
> > > On Fri, Oct 17, 2025 at 10:37:46AM -0500, Rob Herring wrote:
> > > > On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> > > > > On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote=
:
> > > > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > > > relatively simple interface with single command stream to descr=
ibe
> > > > > > buffers, operation settings, and network operations. It support=
s up to 8
> > > > > > memory regions (though no h/w bounds on a region). The Ethos NP=
Us
> > > > > > are designed to use an SRAM for scratch memory. Region 2 is res=
erved
> > > > > > for SRAM (like the downstream driver stack and compiler). Users=
pace
> > > > > > doesn't need access to the SRAM.
> > > >
> > > > Thanks for the review.
> > > >
> > > > [...]
> > > >
> > > > > > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *=
sched_job)
> > > > > > +{
> > > > > > +     struct ethosu_job *job =3D to_ethosu_job(sched_job);
> > > > > > +     struct ethosu_device *dev =3D job->dev;
> > > > > > +     struct dma_fence *fence =3D NULL;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (unlikely(job->base.s_fence->finished.error))
> > > > > > +             return NULL;
> > > > > > +
> > > > > > +     fence =3D ethosu_fence_create(dev);
> > > > >
> > > > > Another reclaim issue: ethosu_fence_create allocates memory using
> > > > > GFP_KERNEL. Since we're already in the DMA fence signaling path
> > > > > (reclaim), this can lead to a deadlock.
> > > > >
> > > > > Without too much thought, you likely want to move this allocation=
 to
> > > > > ethosu_job_do_push, but before taking dev->sched_lock or calling
> > > > > drm_sched_job_arm.
> > > > >
> > > > > We really should fix the DRM scheduler work queue to be tainted w=
ith
> > > > > reclaim. If I recall correctly, we'd need to update the work queu=
e
> > > > > layer. Let me look into that=E2=80=94I've seen this type of bug s=
everal times,
> > > > > and lockdep should be able to catch it.
> > > >
> > > > Likely the rocket driver suffers from the same issues...
> > > >
> > >
> > > I am not surprised by this statement.
> > >
> > > > >
> > > > > > +     if (IS_ERR(fence))
> > > > > > +             return fence;
> > > > > > +
> > > > > > +     if (job->done_fence)
> > > > > > +             dma_fence_put(job->done_fence);
> > > > > > +     job->done_fence =3D dma_fence_get(fence);
> > > > > > +
> > > > > > +     ret =3D pm_runtime_get_sync(dev->base.dev);
> > > > >
> > > > > I haven't looked at your PM design, but this generally looks quit=
e
> > > > > dangerous with respect to reclaim. For example, if your PM resume=
 paths
> > > > > allocate memory or take locks that allocate memory underneath, yo=
u're
> > > > > likely to run into issues.
> > > > >
> > > > > A better approach would be to attach a PM reference to your job u=
pon
> > > > > creation and release it upon job destruction. That would be safer=
 and
> > > > > save you headaches in the long run.
> > > >
> > > > Our PM is nothing more than clock enable/disable and register init.
> > > >
> > > > If the runtime PM API doesn't work and needs special driver wrapper=
s,
> > > > then I'm inclined to just not use it and manage clocks directly (as
> > > > that's all it is doing).
> > > >
> > >
> > > Yes, then you=E2=80=99re probably fine. More complex drivers can do a=
ll sorts of
> > > things during a PM wake, which is why PM wakes should generally be th=
e
> > > outermost layer. I still suggest, to future-proof your code, that you
> > > move the PM reference to an outer layer.
> > >
> >
> > Also, taking a PM reference in a function call =E2=80=94 as opposed to =
tying it
> > to a object's lifetime =E2=80=94 is risky. It can quickly lead to imbal=
ances in
> > PM references if things go sideways or function calls become unbalanced=
.
> > Depending on how your driver uses the DRM scheduler, this seems like a
> > real possibility.
> >
> > Matt
> >
> > > > >
> > > > > This is what we do in Xe [1] [2].
> > > > >
> > > > > Also, in general, this driver has been reviewed (RB=E2=80=99d), b=
ut it's not
> > > > > great that I spotted numerous issues within just five minutes. I =
suggest
> > > > > taking a step back and thoroughly evaluating everything this driv=
er is
> > > > > doing.
> > > >
> > > > Well, if it is hard to get simple drivers right, then it's a proble=
m
> > > > with the subsystem APIs IMO.
> > > >
> > >
> > > Yes, agreed. We should have assertions and lockdep annotations in pla=
ce
> > > to catch driver-side misuses. This is the second driver I=E2=80=99ve =
randomly
> > > looked at over the past year that has broken DMA fencing and reclaim
> > > rules. I=E2=80=99ll take an action item to fix this in the DRM schedu=
ler, but
> > > I=E2=80=99m afraid I=E2=80=99ll likely break multiple drivers in the =
process as misuess
> > > / lockdep will complain.
>
> I've posted a series [1] for the DRM scheduler which will complain about =
the
> things I've pointed out here.

Thanks. I ran v6 with them and no lockdep splats.

Rob

