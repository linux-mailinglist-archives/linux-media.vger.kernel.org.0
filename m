Return-Path: <linux-media+bounces-32853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91076ABCAD0
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 00:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192763BBAB2
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 22:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFB621CC43;
	Mon, 19 May 2025 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foJmAxA1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7409D21170D;
	Mon, 19 May 2025 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747693394; cv=none; b=l4vdvL3uWyflQ5LjB/NwaUUOEEPmsC8WrUf+s1Ea0M/PdxN9e1+dV9ThBeYcFX+tEPmx+v2CJZl6cqqJb4J2c6bLCOR5Of4uY1I2y6ae6W7SudGX/5111LT8LtBT6/HHDJdA0aeOOYJeTCKyvytsTT6u9WI/ncGaXfXZ2p3SXYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747693394; c=relaxed/simple;
	bh=RYED3sQgGz9EupaD5CYEhvZIMBoQfnY09zAfixeh7p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEDzU0bIselx1r7wREzyIcBcVm6g0rWx93rHAnMT4toJTDKl9mR+4ng89b9sPRsDqqQ5jokJ/YVjgk/SkFgBlPg0JPyIRWsPH7rSAvOgS9lGeyqToXUYKfv/YGEI3NdAS28E9J8Z9UiIOb0s1GG1J2q7V36OOZboevGyXEb43vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foJmAxA1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30f1bde0399so159798a91.2;
        Mon, 19 May 2025 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747693392; x=1748298192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
        b=foJmAxA1ojTS83t/PdC3O5ozS5fMMfDMZ4iZi3UDTqBNGm6mDekz4QZs88Kd4CtvD/
         v+JQ/Jw+QJfZDn2BQ2m3sXLuC9w4hLKEL4UTElxFoE20aYlJpLMHaAKEqVtQQdRM6ZnY
         /iEGEEczA+SNBmGHVP77tKxpdqyOjr8UnNaa/I+fufKVdathVwQZTgIduxjvYcYaVTHn
         7fEy839xT/mzUJMfxs/V8fUoIfsVWHY+FM861Cp/vQ8rpMSpOcePxo/iMJip4p7bjEig
         FEHeOXVje26wvtzSVpScaQ7tfM+Id8JC+6T2y0cz2Fxscs8h12C3fFPl/xvKUFBRdd6v
         Nt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747693392; x=1748298192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G22uQtTerCT2IQLmvJfExO7LKRCrhoW6/tlkev0t9aE=;
        b=GAcEkV+pofEcslHp5prPm2uxKUj7T0kxnltSjEdzd3xK9S5F34wbXIhcof1xfPakzn
         hrfAmfb6UbXCmPw0Afyjqk7DuIoS7l3WuUjO2yai6gMOqROHCdoKteazlSUmmiyS2EMJ
         kvD5u7uFNREXlsrIx+hrQHt+oe5BcBKhBXH0dLyio6xGsa0FEP4PBcDcFthlcL42tmJY
         9zGu3Y6gQI7NEhkzaxvBCyXd9n5L5UbVwsrLYnV5bBHBjYXTCMEMhioQpVDZhLiH+ph4
         4rZao/yhAG2qeUOfs2kH/15ubOUOoc3t7DjZLUzCsRS5M7WqdJeCK0+QOtNUf22ZOwrd
         E0Og==
X-Forwarded-Encrypted: i=1; AJvYcCVTa1H7EZb0ZuGLphtdGQ1ERMOMrD3dADezx0QquDMqKI6YKRfb4QdKCJ4KiHHbj0QNB8LzwATnXMNWde/p@vger.kernel.org, AJvYcCW09IFEEXxFTiljoFxTDWjtqPFZfN6aZzF9cMjPZr1ZOM6nE+2f21hWofR/+DiKmVwab1HPa9nSJG315NHn@vger.kernel.org, AJvYcCW8hFk3wTGSpaDrUH6Qkqw4XD//TvAtvpUmrfMD7z+NSdjkrHTeIsQH6PeESU5hxCGppYK5lL8IHxpqA1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZFqSlRwpZIxmIUY2PewWYf6VMLSexkEAmaqXm6lwnKT/LdH2
	rkdQaCIAlrJPRnjxJg8dZflQkmnVfQnAPq5uX0Dnq84rIFO32ZRfe8Y3tai8HRR3GV40STQD151
	n9Ib60EiI8Z3sv0yKDLgFO7aBtKWxv4Q=
X-Gm-Gg: ASbGncsj5GQG9+weWo8pJk4/Vi0dtmRvaPFpxPBSHgUFPxkEgMy4SYr+yNQ8acH5oMY
	it3/pE8hs7cg3y0zLeG3QDWGtjX37cBCvLwtaXMTuFNgAYI4QqfpLmRmqqGeRqDZQ5Q9bOzxf5t
	yeS1TKs5c1pRKfPFvFXx0emOELdj7NY2v9
X-Google-Smtp-Source: AGHT+IHzzYJdNjGnggVED+WkMWpZnSPWu15906SWYLh7fgSNgz1VKnuTByR3QO+KIJPYuFChXuYVwQZLc03eivgxOW4=
X-Received: by 2002:a17:90b:3e8b:b0:30e:7127:644c with SMTP id
 98e67ed59e1d1-30e7d622f13mr8368159a91.6.1747693391512; Mon, 19 May 2025
 15:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
 <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
 <CAPM=9twuSfvQ0_NUdRmp0_VtTE_Br7GAysRw+XOoX7BTxUBGYQ@mail.gmail.com> <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
In-Reply-To: <CAF6AEGs1hNGMMBjZuXoGjxF+JA1AHY_wx=gmqK4z=zShYoR6=w@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 19 May 2025 18:23:00 -0400
X-Gm-Features: AX0GCFuLTqHkTFoflT1PTGQWqYxrqs7RNvsrTX0PlbvFOcOu3Zb_RqPfkkrC9DU
Message-ID: <CACu1E7EJp1fvQZV0=qeAqH97qaeoiaybHqxfYa7hFmi9P048kw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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

On Mon, May 19, 2025 at 5:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Mon, May 19, 2025 at 2:45=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Tue, 20 May 2025 at 07:25, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.co=
m> wrote:
> > > >
> > > > On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote=
:
> > > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Conversion to DRM GPU VA Manager[1], and adding support for Vulka=
n Sparse
> > > > > Memory[2] in the form of:
> > > > >
> > > > > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_=
OP_MAP/
> > > > >    MAP_NULL/UNMAP commands
> > > > >
> > > > > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> > > > >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> > > > >
> > > > > I did not implement support for synchronous VM_BIND commands.  Si=
nce
> > > > > userspace could just immediately wait for the `SUBMIT` to complet=
e, I don't
> > > > > think we need this extra complexity in the kernel.  Synchronous/i=
mmediate
> > > > > VM_BIND operations could be implemented with a 2nd VM_BIND submit=
queue.
> > > >
> > > > This seems suboptimal for Vulkan userspaces. non-sparse binds are a=
ll
> > > > synchronous, you are adding an extra ioctl to wait, or do you manag=
e
> > > > these via a different mechanism?
> > >
> > > Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
> > > the binds happen before cmd execution
> > >
> > > When it comes to UAPI, it's easier to add something later, than to
> > > take something away, so I don't see a problem adding synchronous bind=
s
> > > later if that proves to be needed.  But I don't think it is.
> >
> > I'm not 100% sure that is conformant behaviour to the vulkan spec,
> >
> > Two questions come to mind:
> > 1. where is this out fence stored? vulkan being explicit with no
> > guarantee of threads doing things, seems like you'd need to use a lock
> > in the vulkan driver to store it, esp if multiple threads bind memory.
>
> turnip is protected dev->vm_bind_fence_fd with a u_rwlock

To add to that, it doesn't really matter the exact order the fence
gets updated because a Vulkan app can't use anything in a submit until
after we return from the turnip function that allocates + binds the BO
and then the Vulkan-level object is returned to the user. We just have
to make sure that the fence is "new enough" when we return the BO. It
doesn't matter if multiple threads are creating/destroying objects,
the thread doing the VkQueueSubmit() must have observed the creation
of all resources used in the submit and will therefore see a new
enough fence.

>
> > 2. If it's fine to lazy bind on the hw side, do you also handle the
> > case where something is bound and immediately freed, where does the
> > fence go then, do you wait for the fence before destroying things?
>
> right no turnip is just relying on the UNMAP/unbind going thru the
> same queue.. but I guess it could also use vm_bind_fence_fd as an
> in-fence.
>
> BR,
> -R

Yeah, we always submit all non-sparse map/unmap on the same queue so
they're always synchronized wrt each other. We destroy the GEM object
right away after submitting the final unmap and rely on the kernel to
hold a reference to the BO in the unmap job.

Connor

