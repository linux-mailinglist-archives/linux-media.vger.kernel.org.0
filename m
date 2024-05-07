Return-Path: <linux-media+bounces-11105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB08BEDC8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 22:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D008F1C232E0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457D516F844;
	Tue,  7 May 2024 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmcZxY1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1189716E898
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 19:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111995; cv=none; b=u0mJSxFCROvzcfJzNSBO5ueVidQxE1euWDPfcTXnsbLeVHbKYBO82ZcOc8A5MsIQs3CQoFSytlgh6EcsI70rchct3AkAQv4aRMod9VtQDmUxsfZCL/ZAG8cF1MkYGQcrwAVnb6chKsHyhyFmDyyjprhm7ez7OVyNIvNS+TmFQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111995; c=relaxed/simple;
	bh=i96+goKGZdI8wImUoBjARaHLkBInrQRdMejjNFZXHzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IH6w5hm4h112eqFO+ktQD1D8TLjYqD4iTGzmKsrD3Z3zA0oJPM0FkJc1fUiul+d5PsTazMhAYvgjQFoaarbAL3bMOwQ635thknmIEQud4TtL5Kv15/Fh/VrgoPHBRxdor9pZIq8Vaetz0//Y+ZGyxa83ZOgwgZRm39xmcDaI15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmcZxY1Z; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-deb5f006019so3927972276.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715111993; x=1715716793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9u4+z96HwXR809ZF1PkEWCwnBjus+4ZFL2JjXWvh/IY=;
        b=XmcZxY1ZgEkDXw/DzhDQvc5uElkUX6GOVrhwWzoXkytPq8zHWUpViRFjZY4v7TlXLn
         iQgZRBo0IT6nczarnCP4M1JHMGENvHKDZUreFSfSzzPqLIIGCTPozXdxLx+Hc7ubhgmO
         PCSaRbywb+q0I5AAeC2pQLbkXA3nJJ2dyavcbE3V2jstY1EXKzxMl9KJXBk6Wnx9yecv
         RIDOAYyuUQHCWhg9yfoXXOz3mu8PwzWIyFXg/zdFrCDdfIagTYj6JuMVhxAAsDCvwKtx
         ElOstvG4nuBa8PSZy48RYAOGmN5iPE7JcfArX89MEGYV5iOgEzGEFP2bCJzfxyXm5TxW
         GXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715111993; x=1715716793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9u4+z96HwXR809ZF1PkEWCwnBjus+4ZFL2JjXWvh/IY=;
        b=XnOxAxObU8FxGVdNNT0qFpqawcCNRh1duLyplCmlZuuC5UnvZTKwbBiM72+N2cXRW0
         /EEyCJsieO5Fv/4p+nyAuKl07bAZeVjoGbZlbVqhksmButzaF+O7Eb697wn8kbw/CWkM
         Dtnan5vmveKDRH0H9hhdjhbAlvYrZjXSos51fwlTiXZYzeo5Ib4a/QiYlY7GbOmHv7sv
         4VPD9BDHM4rK8hLMjxwdEceZmELu6YVVCIeSj8aQv2RCw+qzLR7n/dfJRdcxkQuy6gnT
         8aK+XE9k+HN6fGgruZhEKyRAeoqJI8SN3wZP5hecj7s8PRcWZpSLd2PxGSSzRedL8qML
         SoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW17yAWgq3Cfw0EZZaP7C9LE0E/WyUpEh1ZP/GSSBxpvtW/CZbBHfM1zFP6JIsh6/Odxc/2PVO4icdDV5zJeL9sZNGS2G16ffDdJQ0=
X-Gm-Message-State: AOJu0YwIAHgvMx3t1a9JZFNdmOR/mwOLhFFIxFL9spnS7lyan6zpBzIE
	9vDHjqE+JZtxGbkSQ3JSv6w19JB9Oz51Xhdm8Wh/XBMvT6xI/5ODJThbjYC8Qq8GuxqErqp41QC
	dkVjdDJvgdbKtYEAGIiMH/IoNVSOGHggahQDb0A==
X-Google-Smtp-Source: AGHT+IHOidTRxfaPcTyYfkMUG+K57a4v9CN0Di3Y62BasjAdrMLYfJVqOjaj2F7Xus+0Xcdfeto1KfCFGsurjzlI9PQ=
X-Received: by 2002:a5b:881:0:b0:deb:b3da:b1ad with SMTP id
 3f1490d57ef6-debb9cf9739mr749935276.12.1715111993047; Tue, 07 May 2024
 12:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com> <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org> <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
In-Reply-To: <20240507184049.GC20390@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 May 2024 22:59:42 +0300
Message-ID: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Maxime Ripard <mripard@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 21:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > > providing data to VPU or DRM, then you should be able to get the buffer
> > > > from the data-consuming device.
> > >
> > > Because we don't necessarily know what the consuming device is, if any.
> > >
> > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> > > sake be GPU or DSP.
> > >
> > > Also if we introduce a dependency on another device to allocate the
> > > output buffers - say always taking the output buffer from the GPU, then
> > > we've added another dependency which is more difficult to guarantee
> > > across different arches.
> >
> > Yes. And it should be expected. It's a consumer who knows the
> > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > require a DMA buffer at all.
>
> Why not ? If you want to capture to a buffer that you then compose on
> the screen without copying data, dma-buf is the way to go. That's the
> Linux solution for buffer sharing.

Yes. But it should be allocated by the DRM driver. As Sima wrote,
there is no guarantee that the buffer allocated from dma-heaps is
accessible to the GPU.

>
> > Applications should be able to allocate
> > the buffer out of the generic memory.
>
> If applications really want to copy data and degrade performance, they
> are free to shoot themselves in the foot of course. Applications (or
> compositors) need to support copying as a fallback in the worst case,
> but all components should at least aim for the zero-copy case.

I'd say that they should aim for the optimal case. It might include
both zero-copying access from another DMA master or simple software
processing of some kind.

> > GPUs might also have different
> > requirements. Consider GPUs with VRAM. It might be beneficial to
> > allocate a buffer out of VRAM rather than generic DMA mem.
>
> Absolutely. For that we need a centralized device memory allocator in
> userspace. An effort was started by James Jones in 2016, see [1]. It has
> unfortunately stalled. If I didn't have a camera framework to develop, I
> would try to tackle that issue :-)

I'll review the talk. However the fact that the effort has stalled
most likely means that 'one fits them all' approach didn't really fly
well. We have too many usecases.

>
> [1] https://www.x.org/wiki/Events/XDC2016/Program/Unix_Device_Memory_Allocation.pdf

-- 
With best wishes
Dmitry

