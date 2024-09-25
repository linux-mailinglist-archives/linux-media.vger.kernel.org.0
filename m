Return-Path: <linux-media+bounces-18549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A998605A
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F6B1C265DC
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 14:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA421A3AAE;
	Wed, 25 Sep 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eY/PoDy8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0061A38F6
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268690; cv=none; b=OZG2Ju2YbgZtKAK5NT2tooQV8Cin+hKLJjEnZ4Ixcj8wNl+ENGTFF1Wxngx47wwhA+JkxoOuvLVtrjfGZccJdNGbp9ezh9VaM57/mPNeSx+/zLdAaxGudpBzVdgDge0ZfJqOsUdSMUoKwNPDX/ZfhGuO4RoNOY5lx0T4Cm1oJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268690; c=relaxed/simple;
	bh=VaGcEgU1zLaiGWkgHYrfGIyiwGmvJRjCRyKHQ9r/rA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJvMumiTBPRL7H4+6TSMpJB6gp0F+AhvQUYsgXqPcJyuK6Fd400Y0Bt2G7bXhvL9/CU3NkIzpOKWudsmULgQ6Z81YDHohhmL1X85goXBtA2+/I26zNqzdGIZjXuYLqAVtn45pYjeXMR3lZEOStG17EAXgFlzYkp5YsQ85j7c1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eY/PoDy8; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so68810151fa.0
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268687; x=1727873487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
        b=eY/PoDy8rk1Al5yd1n1Fx7jQF1lLALJU9odverL3LC2cqiTWTUgeepeT87QqHPs5pA
         RGdmQj4IQ+694p3C/y7z1Syr+nGI89KeRy1yU8PTNFvmGUlfBouJDW+jQTHkddoqPND4
         hiZX7qNR4UjLs7TwE2N+nTIgXluo+1I0fT9ZsocPWKb7MFi/RvbGOps7MgHdyd/0Hv7j
         QXLsWJIaZ7r8cV8ywd7Kmh3MdN9DAWIDyawokhZu96zx4oLUmlAoGDdsMrGMNojFEzEz
         qoqct5OQJE5SF71iPZ2X4Q4AwGAsZ0GIwFGnaAKOjKoM9A4owAQsh3IlmWK51Z19Uc/x
         2SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268687; x=1727873487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGma69Sr28MXVjXEqnOY6cy8Xe0bfhYxw2mh4o1EehI=;
        b=FL+u8DAoQQw/xbc00gOI5aAcggaAsmHFE46VlhUw/sN9KvrQTo1+Xp0vC46cus1qv7
         7oq27X7n6XA1b27Ghhk5U5H+UaFz3PYmCuq9YEH325e+UyBB4Q3l2Gkm1mWfZvquPVkT
         gTe2dFpH71wFOXzNaWvp2GAcoVbdpARcwiOfmMvlz86dooUuqEauEt2mOsTh4Rfesmu+
         rZM3jNVyvG+zOTRvlfdcBNiCbaFkzboBuGm3HziCu+pr0TMOQmd+7HKt1yE3qM6360pW
         0bLwddMvrxN7VkFEhRMDbRwAmEqtI20Y9FEfb6aCqflPL+oYg9x5ZMGLuZYO0kp6Uceu
         EAGw==
X-Forwarded-Encrypted: i=1; AJvYcCX1b5L8ugnLFav7QBRqN137SUZo/ULNbh7Trw4E6ZgM7KDV15/FBMRbXzgkWpjUwgBNQVr2XDIEj/hW5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7AswO5mhCQtgnYrwwaBMKAfDqdzLGY3kcom9hL+p0RH+vzpSY
	utDoCExx4BavJaH8k8U81nRmAr3jS+XwCHZNlrvNpyn0k/ea3FY9pxdqCr5Z8WY=
X-Google-Smtp-Source: AGHT+IEGQnkRVJDhYLTjRbwCd1JcWlry2TnoRPviQ16wlDbXpkXhhkV0VphxcyVjJS5vqRD4q2JN9A==
X-Received: by 2002:a2e:90c3:0:b0:2f6:649e:bf70 with SMTP id 38308e7fff4ca-2f916012799mr14524141fa.26.1727268686577;
        Wed, 25 Sep 2024 05:51:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d28998e5sm4935891fa.101.2024.09.25.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:51:25 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:51:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg <sumit.garg@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>

On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian König wrote:
> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> > > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> > > > Hi,
> > > > 
> > > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > > > Hi,
> > > > > 
> > > > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > > > 
> > > > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > > > carvout. This is a difference from the Mediatek restricted heap which
> > > > > relies on the secure world to manage the carveout.
> > > > > 
> > > > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > > > afraid I've had to skip some comments.
> > > > I know I have raised the same question during LPC (in connection to
> > > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > > using generic heaps instead of allocating the dma-bufs on the device
> > > > side?
> > > > 
> > > > In your case you already have TEE device, you can use it to allocate and
> > > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > > > 
> > > This goes to the heart of why we have dma-heaps in the first place.
> > > We don't want to burden userspace with having to figure out the right
> > > place to get a dma-buf for a given use-case on a given hardware.
> > > That would be very non-portable, and fail at the core purpose of
> > > a kernel: to abstract hardware specifics away.
> > Unfortunately all proposals to use dma-buf heaps were moving in the
> > described direction: let app select (somehow) from a platform- and
> > vendor- specific list of dma-buf heaps. In the kernel we at least know
> > the platform on which the system is running. Userspace generally doesn't
> > (and shouldn't). As such, it seems better to me to keep the knowledge in
> > the kernel and allow userspace do its job by calling into existing
> > device drivers.
> 
> The idea of letting the kernel fully abstract away the complexity of inter
> device data exchange is a completely failed design. There has been plenty of
> evidence for that over the years.
> 
> Because of this in DMA-buf it's an intentional design decision that
> userspace and *not* the kernel decides where and what to allocate from.

Hmm, ok.

> 
> What the kernel should provide are the necessary information what type of
> memory a device can work with and if certain memory is accessible or not.
> This is the part which is unfortunately still not well defined nor
> implemented at the moment.
> 
> Apart from that there are a whole bunch of intentional design decision which
> should prevent developers to move allocation decision inside the kernel. For
> example DMA-buf doesn't know what the content of the buffer is (except for
> it's total size) and which use cases a buffer will be used with.
> 
> So the question if memory should be exposed through DMA-heaps or a driver
> specific allocator is not a question of abstraction, but rather one of the
> physical location and accessibility of the memory.
> 
> If the memory is attached to any physical device, e.g. local memory on a
> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> memory as device specific allocator.

So, for embedded systems with unified memory all buffers (maybe except
PCIe BARs) should come from DMA-BUF heaps, correct?

> 
> If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then expose
> the memory as DMA-heap with specific requirements (e.g. certain sized pages,
> contiguous, restricted, encrypted, ...).

Is encrypted / protected a part of the allocation contract or should it
be enforced separately via a call to TEE / SCM / anything else?

-- 
With best wishes
Dmitry

