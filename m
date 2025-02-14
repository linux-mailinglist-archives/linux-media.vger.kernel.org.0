Return-Path: <linux-media+bounces-26155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B0A35B2E
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 11:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF77A16BC74
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F56245AFC;
	Fri, 14 Feb 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxzMaDyd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E530324166C
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527669; cv=none; b=vEF6z6DUrrhdYq0rng+pfjQNnO9yo7Wmx7d4NBVmygPC444Wit2jsLDvb/Pgbj7yXz0QhMmC8xv9cM5/14dlA4YfJVIXCAEAERDzBtRX/wjMKjB4hVLaa5sUKLWVs1GW2f4wDwYTte3ZphDH1tzdWBMI1INPshfp/s03gpy9l5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527669; c=relaxed/simple;
	bh=pzZaUXAf0bDBlXLKU1mlFS2safOQaXzmF8fJ3GKjIkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVkIcXXAvN6E3gFCUBqsy6EAcGmXfrZvX2KZDzXEK5uEc+S/sjtVvbF7nF2LVgvODEkl83lnEVR2hyvaey2mxmr6Nq9Fw8EW8tRAYrIYvDeidSSNipEpwC3Xh7ptN21r0Dh13scv0VZflFPW4PYNCTNlL7m4BTKs+jTNJNtYT/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VxzMaDyd; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b199bb8af9so1818043fac.1
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739527667; x=1740132467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
        b=VxzMaDydNCUeZQYAtqSbuGxnsJogD2DtHwBMELgPt11jAZq8OAHPG5nyHwGT0DmyV+
         VQwUH30svjUAVexsh2CDwQSSOau/52iLMRav4U1hOZw+Y+mQuzFno5O54rfW3HZjoxGY
         nxDQ3E0LFJaYFts3oRzw7lmW9EivU1opCw+MMeWcP1c90wF4pXFOVc2bXvn2TZSBqlBf
         rFJ0HviGFasoC7Apnsni0xi09Ta59pO3K0dpGz543XuCEEp2i3mbBFm91g1S5Yenn8ex
         SgQekh4q0Xi8WVaBZO0+bIAeQYEK+VusQnQRly5FK/unoaR3gpb5tJbFFZMRzn9xAyhB
         TTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739527667; x=1740132467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sn3pvbBqfTOyOoOU/Jw94BfwIPh6Cc8Y6dRoDktCRzw=;
        b=ZOZJFH1KLiYfhbGzKHhDU4SNrYRI/rY4kf3r9HtvCjruJlBbGWUU/s7ZytBVZyrHQF
         wKxK1iuutbLhWppIrL3PHmSeV8IGLhFxg+wooiI4+ABOChl/7qgp7UGM9JPe5J89JxYS
         xvQjDWG+kKDJJyAP3stuzYnHubXxBc5VIYwmJpUFflFfzw/VADyZNmOvyhtIXuPQurQm
         w12oY74hLag0DQZpkzef5gY8Hzl4a03dQT0Mk55nA2lgpKkc3T0+CvshrPjva/u1PK8y
         o3AgsZFuZ69pWZdSf3iefYQi2OqqsXSKDWeacQVQJGdt9uEHbKGS0i+sYm3tAxZF820k
         MchQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Oxm/URhU8NG3einVUPeyWV3xdHodT9wJeNpQ9Z6J9ki1JVxz1Fs4dikvXnZIHrQrVmmtZSVgfHDg3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHDblvhq/e1tp+klq7dVKZcnhaD+NB2R/lY7V3y5IXA7ik1nn
	ya2EewuHkdtql+6SeLuE6AKmojuGpokyK2bK6/kQiMMM8+1qzGqcStwx6ehmrdb35tiec/gxJhU
	E33F/aidIFXCvBOcTo++IWH9GlB72HUpd7YyiaQ==
X-Gm-Gg: ASbGnctUBTLvvBTkkqpoxwCqrznsG2b+XuGKxA/lLhU1jTMuOC2O5tt4KrbSzTcaSmN
	QGDu2v+2bdr0b+otsoz9GL9FecYSAa1cUg9Y+JqTTnIj4nuA/xqWbNmL11X+fOIIrSGbYr+qCvw
	==
X-Google-Smtp-Source: AGHT+IEmoLNj+r+ZI1bJGO2H/c+/OPghMcihwjxAvNbcnoyp3QyJqGjGScO1azD/YZ9Oqyybj/A6hKXzadalRsb9RgA=
X-Received: by 2002:a05:6870:ac94:b0:29e:1962:7a23 with SMTP id
 586e51a60fabf-2b8fb13c9d8mr3994694fac.4.1739527666842; Fri, 14 Feb 2025
 02:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com> <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
In-Reply-To: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Feb 2025 11:07:34 +0100
X-Gm-Features: AWEUYZloh0UdTJdZ2i2yB5o6l3a8WiHqKi_BGzWtYbrdKFQsIhzEcrv-aDyLaSw
Message-ID: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Sumit Garg <sumit.garg@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote:
> > > But just because TEE is one good backend implementation, doesn't mean
> > > it should be the userspace ABI. Why should userspace care that TEE ha=
s
> > > mediated the allocation instead of it being a predefined range within
> > > DT?
> >
> > The TEE may very well use a predefined range that part is abstracted
> > with the interface.
>
> Of course. But you can also (and this has been shipped on real
> devices) handle this without any per-allocation TEE needs by simply
> allocating from a memory range which is predefined within DT.
>
> From the userspace point of view, why should there be one ABI to
> allocate memory from a predefined range which is delivered by DT to
> the kernel, and one ABI to allocate memory from a predefined range
> which is mediated by TEE?

We need some way to specify the protection profile (or use case as
I've called it in the ABI) required for the buffer. Whether it's
defined in DT seems irrelevant.

>
> > >  What advantage
> > > does userspace get from having to have a different codepath to get a
> > > different handle to memory? What about x86?
> > >
> > > I think this proposal is looking at it from the wrong direction.
> > > Instead of working upwards from the implementation to userspace, star=
t
> > > with userspace and work downwards. The interesting property to focus
> > > on is allocating memory, not that EL1 is involved behind the scenes.
> >
> > From what I've gathered from earlier discussions, it wasn't much of a
> > problem for userspace to handle this. If the kernel were to provide it
> > via a different ABI, how would it be easier to implement in the
> > kernel? I think we need an example to understand your suggestion.
>
> It is a problem for userspace, because we need to expose acceptable
> parameters for allocation through the entire stack. If you look at the
> dmabuf documentation in the kernel for how buffers should be allocated
> and exchanged, you can see the negotiation flow for modifiers. This
> permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

What dma-buf properties are you referring to?
dma_heap_ioctl_allocate() accepts a few flags for the resulting file
descriptor and no flags for the heap itself.

>
> Standardising on heaps allows us to add those in a similar way.

How would you solve this with heaps? Would you use one heap for each
protection profile (use case), add heap_flags, or do a bit of both?

> If we
> have to add different allocation mechanisms, then the complexity
> increases, permeating not only into all the different userspace APIs,
> but also into the drivers which need to support every different
> allocation mechanism even if they have no opinion on it - e.g. Mali
> doesn't care in any way whether the allocation comes from a heap or
> TEE or ACPI or whatever, it cares only that the memory is protected.
>
> Does that help?

I think you're missing the stage where an unprotected buffer is
received and decrypted into a protected buffer. If you use the TEE for
decryption or to configure the involved devices for the use case, it
makes sense to let the TEE allocate the buffers, too. A TEE doesn't
have to be an OS in the secure world, it can be an abstraction to
support the use case depending on the design. So the restricted buffer
is already allocated before we reach Mali in your example.

Allocating restricted buffers from the TEE subsystem saves us from
maintaining proxy dma-buf heaps.

Cheers,
Jens

>
> Cheers,
> Daniel

