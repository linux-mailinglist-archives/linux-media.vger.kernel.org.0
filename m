Return-Path: <linux-media+bounces-32851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1DABCA47
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 23:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9451016C83A
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E4E21B196;
	Mon, 19 May 2025 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7OiR3fH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F620B1FC;
	Mon, 19 May 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691147; cv=none; b=AQLxCZ40HJgVLkr5ZDd7KtnD3dbciJY7ga2WHbXnLoC/om41RjCwLMofR+YtYFEQ1MTDLfI1JuIDLyrnl5GGwyqNmWBWcsux5nURm7GmJiOMFtjDs5blyJH1FqtHSFwuT3d8DsdjmVKppG/m9qgzIdmckgCCwwvYWNiDs3pdEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691147; c=relaxed/simple;
	bh=dBmQ7ZVzsrxRsdMLl6QUAymnlQw5BhCQ/Hfi6mcSQGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hw8eLZjLW+DwJS6l3ZAicPpB/Uyq6VLB2kGUvn0glmIMrQm7mexckSuZ5zllZ9u597O/U0kBOrwk6bs3b+q0EjwYXo/Ya+ueEiUag1Wb647d0Pp2GW2xHcXkDWIy/pzgEqyNdr4GpwacgjCI+uWzG0BRsEjJe4LfizZV2SiEYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7OiR3fH; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so5757508a12.3;
        Mon, 19 May 2025 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691144; x=1748295944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
        b=W7OiR3fHjF+RryRQD3D0fShlGAgZabdSUj28WBxV4TCHYGa0n68a8tnWskh+OFHw/k
         wZpvxr7TxDaLYE8ug8vy0Y+wIjY8hdbQclaa4pSLv9Z1xUabmiIajAN3mBRYk6DnUaja
         EodrcEKAGWAEADM9h0tgmziuh9nxxj6Eub9510PL42M+8ZLSAamO58KbMrRoCF0giA2u
         7Yc9JvhUunacoy/1Ixc8P5RNB/ONErdlIWZyyn9wGv8K/U+tV+y28sgBTX78PaB10qnp
         +xvfkxPZmH9A1EZUdoTzi1ZDRdcgpQVlK+MZjdn/KCkB3O73yzPBln79tzBsGAy4WKXF
         xL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691144; x=1748295944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgwrUkrkaZb0leOIfftTpt2Z9U+8ge4TCRzTvr8HRfg=;
        b=Q3UxBW71HtfKqpJXL/XGfZ6ouv4wkFNpD15d4O67xXXEMHLGEAsnySQcCOaEDjFr+c
         rNuDzTFwriyomxDUfDCcQCtw0BECGpUSZ78QvGLsY+I6XXIl2C/VGsXcZvIbOVabHTzt
         czXowiwpfJlg/HDs2kYGeODoQQUdg5q/KaKndIAPjPdHa/QCAAEQ/x8ozLIZlkr/01G5
         TRuIyHyVdCACjiIwWOLtW23pSnLK4hkdYhJLO+khV09LD0dO1ZRsxC1bQQ1r2os9v6ms
         v02mNzMR1xTI/F8j+zdLke8At5mOko2Qq/6TVzkCqsseImAoVAD79I0LCWTIcjGa1o1O
         O8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40drYqBwxFaAyiLX0exJmn8GWhf9DH8xEg9GwkuQPTqKyXZNocd/SYKFZEfJdCt9QqzI0JA0fn+olMlM=@vger.kernel.org, AJvYcCVPhSgizAlS9GCLZT8T6U5yrngJkExbiKex3+ajhiTcDgeuQDeMo1m9PYSZRl2fB0T1HwagIi7wti1mvbsz@vger.kernel.org, AJvYcCW5TX38JGeHAAdRiCxFuzrna1q+LupXbgZV2dNL7U1mSpOKgqh7Gk9mnarIUrZfm81vTCq0RCADXw363E0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyAI9LZWKvixDJ+5rQe4NrEDhj7FiHAbKIz6VLXJd8njGVF1OMs
	L24WBSma7BBClFjOAHGxBAM13YmosqWgQD5QkKwsDN38JyJ6vdr1j8TqlmzwmKoEg9g99VvlK+d
	eXu13vNq2+W6SdxLIBQM0mcj+edAfE4w=
X-Gm-Gg: ASbGnctDfmA1D3lUXIIxqS95nEFcqLlMSZfNxYHD0WY8gZn1p7d4d6c7tEkkiFip1yg
	lZPR5Qzjw08U4i1wRhUkdKkrJp2dATPgtntOljAClPrSsGzmIKhdi2ahCSO5eNecPW8fRXqXd3U
	vQtKEDbwkLBOYUYOxWN39svWLIU6gzOOY=
X-Google-Smtp-Source: AGHT+IGi6092BG38fgC8XNqiOOL5230Qmrls9fUA/vdLAMqijhah9L16wARI5KlQBQHVpTG9u4i5MttpQIJ/uhwrqx8=
X-Received: by 2002:a17:907:3342:b0:ad5:465d:8855 with SMTP id
 a640c23a62f3a-ad5465d9f5amr870659766b.36.1747691143715; Mon, 19 May 2025
 14:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 May 2025 07:45:31 +1000
X-Gm-Features: AX0GCFtlQu6thz2-DodB9_hvAiBP83MybA9d3wKL9euWSYgx05ywhuPOmKRAvxs
Message-ID: <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
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

On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sp=
arse
> > > Memory[2] in the form of:
> > >
> > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_M=
AP/
> > >    MAP_NULL/UNMAP commands
> > >
> > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > >
> > > I did not implement support for synchronous VM_BIND commands.  Since
> > > userspace could just immediately wait for the `SUBMIT` to complete, I=
 don't
> > > think we need this extra complexity in the kernel.  Synchronous/immed=
iate
> > > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueu=
e.
> >
> > This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> > synchronous, you are adding an extra ioctl to wait, or do you manage
> > these via a different mechanism?
>
> Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> the binds happen before cmd execution
>
> When it comes to UAPI, it's easier to add something later, than to
> take something away, so I don't see a problem adding synchronous binds
> later if that proves to be needed.  But I don't think it is.

I'm not 100% sure that is conformant behaviour to the vulkan spec,

Two questions come to mind:
1. where is this out fence stored? vulkan being explicit with no
guarantee of threads doing things, seems like you'd need to use a lock
in the vulkan driver to store it, esp if multiple threads bind memory.

2. If it's fine to lazy bind on the hw side, do you also handle the
case where something is bound and immediately freed, where does the
fence go then, do you wait for the fence before destroying things?

Dave.


Dave.

