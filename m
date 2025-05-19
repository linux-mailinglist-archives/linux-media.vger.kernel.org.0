Return-Path: <linux-media+bounces-32852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1CABCA5F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 23:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE703A3A79
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB6221A94F;
	Mon, 19 May 2025 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7sc1QWF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB478F4E;
	Mon, 19 May 2025 21:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691496; cv=none; b=GCgwmUv3ZBxUUNW5NX545Ln5Af9H0YB7p+u6RQ7TChYZJZ2rWVz3Ucz8jiNVmpnoUP6trozah3ix3Vi33Mfw5srsq4FSu+shLtyBEshNIw0usMReeZcSoHGzl09Qa3HAiuRZvqJ0hMD04GFBKcFarpMtuKeim2LCgwLJFxmpPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691496; c=relaxed/simple;
	bh=D+gc71TQ6arDdz5CgOztRV+6NsleF2QKzmZFFkhPPvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJsJ7EQK8TnR5yaPAJB1WfQnbTKQ882hWDN7bKo5brCoaVGgVi3Dzie1mVb0io7Qyj2FhZXfgfD9ulv4M7AzUTsELyc7RyZ5k68KkA6U8jrT8v1110aQEDnbnEIg9vuvLrjMMPdNDiOaTT7I4u40Hs9edfMrWvEqI8Vq2ADGfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7sc1QWF; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86a07a1acffso350277439f.0;
        Mon, 19 May 2025 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691494; x=1748296294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
        b=d7sc1QWFL5CiMhOclmmVWkLWlF6n/UYOx1Psr9UUqVu7qB+fZ+gTSUkhPALyBkuUHb
         /ai13xP3CQsF/wnfTHyZ/o7XBxkUOe/w6H6NkTrH0e17f2N6l2D3sL86N1r9Tqg0OZ5f
         lHLQ2Vpbhi5Gmghpi/j3pHe2Fiqk3nArkSjscFhiqJOk6Vee39xDhq/+bZso1Wj9otyG
         GbWZHqM55vtdB/gCokw4nda+9RGdE8AGlI6XEiOtv+aYYdLpYZMOuN0tD4QYL+q0i7YO
         TyTKocU3BlKFrYdTUipYNYABwXwsj906y9UxKkIM1EJln71jyhicGGb/JAFWCA8iWcZM
         n0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691494; x=1748296294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPEYHOAa9cIet4iZua5k6szVG47y0INiUwKTR9frvBc=;
        b=ePz9+MgXjwt3SLRQCgyINyv06dWuwXp9VGUZh1YUlQknho+mxIVGVVWkptKQWkrA0B
         cYygB5mmGf8hKO1FXXO6QueTczWqrHvYqpLcaRGTpS46VQHGIT7S92tUri/co+5KT/zz
         NL3J/94c14VthgyI+zar4T+2f1w6Pb/nVLOC27aLaEXt/E2VDovKtLTzYBwLliGbrnx9
         1s+clVJjjO/weiQawqURttJc5vQmlR9cHkifk0uwGl3QKucGZZNpNx048x3U6278mDun
         CsrT3dFatW8G4sAPUoeyBCyWqbacNrmndrmpcO5OhuNNptvcaXVZmQZndeq5pbxu7dut
         HrcA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2NST23nXsgYZ/27wLm574qja4g6HSwaBZdRO6A5AT1ewzlB0PQo8lZZvp8ofzI7L/t58P1+SNkE+iB1x@vger.kernel.org, AJvYcCVqYbML1ANA28S5UWYMTit+tjUtG1LJb8gwoWDQhTuJLKIY4c0R4jA90mVI7CQTkOB/cGTChmTNxoIS2pU=@vger.kernel.org, AJvYcCX9bR8oGl4pmaAw8WOTi7SFo9HXCDTV44qKK9QGrZPhnh9m/rnIrrwzxUAc0THHm4btkAnRYxji3kjyGfTX@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTdQElsdR5QOXMJHxSxUDrRHE595/70ZbzeqB4M+xrgRSrHAu
	rEEnBl1VsT1QzuNJHCBCANJnKiHvL6y914eYidMtdLL/C++YkC0lY97cE8oT5fsnwTIpY+nOz+U
	OkR+nx9lkJDlCt4onS3LTCJgQK551RMJuQUb+
X-Gm-Gg: ASbGncvNuiO24DzsGMFDFl5abFFf7Vv+AcYwjfhYhQahzFEzGjmXY1LHINCFkqvtDX8
	RIAa1DDgg33VtESgQqd2plvlDHBB/rYFF3tj2wwBzWdMyxIvgcJ3jd/aGAHBsMGrKxDi71tUNyy
	o+vG7tG8WOPt2ll1p355A8wwDJqsO7jtTRNyWbz1EbYjGfEvdJQK9gH8j8rmp3mPPhO8B5e/MOG
	5ezUA==
X-Google-Smtp-Source: AGHT+IH7GskHnBBBnN3dCWe5+4wA68V6kn1SwK+BKY5czWCCWv4gMQRXKFVR4ovK9isr0sjORC+Rjt5sK8DipW7Cf4U=
X-Received: by 2002:a05:6602:6cce:b0:86a:93c:f5fb with SMTP id
 ca18e2360f4ac-86a231901efmr1968076439f.1.1747691494249; Mon, 19 May 2025
 14:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com> <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
In-Reply-To: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:51:20 -0700
X-Gm-Features: AX0GCFvmTvCANqDHHj2TPhXNkmFs3wC8dEXWRCEtBjip_pfclRDeM3uxGEixFZM
Message-ID: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Christopher Snowhill <chris@kode54.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>, 
	"m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote:
> > >
> > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan =
Sparse
> > > > Memory[2] in the form of:
> > > >
> > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP=
_MAP/
> > > >    MAP_NULL/UNMAP commands
> > > >
> > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > >
> > > > I did not implement support for synchronous VM_BIND commands.  Sinc=
e
> > > > userspace could just immediately wait for the `SUBMIT` to complete,=
 I don't
> > > > think we need this extra complexity in the kernel.  Synchronous/imm=
ediate
> > > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqu=
eue.
> > >
> > > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > > synchronous, you are adding an extra ioctl to wait, or do you manage
> > > these via a different mechanism?
> >
> > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > the binds happen before cmd execution
> >
> > When it comes to UAPI, it's easier to add something later, than to
> > take something away, so I don't see a problem adding synchronous binds
> > later if that proves to be needed.  But I don't think it is.
>
> I'm not 100% sure that is conformant behaviour to the vulkan spec,
>
> Two questions come to mind:
> 1. where is this out fence stored? vulkan being explicit with no
> guarantee of threads doing things, seems like you'd need to use a lock
> in the vulkan driver to store it, esp if multiple threads bind memory.

turnip is protected dev->vm_bind_fence_fd with a u_rwlock

> 2. If it's fine to lazy bind on the hw side, do you also handle the
> case where something is bound and immediately freed, where does the
> fence go then, do you wait for the fence before destroying things?

right no turnip is just relying on the UNMAP/unbind going thru the
same queue.. but I guess it could also use vm_bind_fence_fd as an
in-fence.

BR,
-R

