Return-Path: <linux-media+bounces-18446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1997E60A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98B19281399
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 06:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC331A89;
	Mon, 23 Sep 2024 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyMTZAKU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265BC1A28D
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073216; cv=none; b=U3z84KKw2bQ83q96uuvnyUoi46Fy+FCcmKu8p/o7hT8IF+0a0+7+DA4dCIrn6cLfH3QT9nUtfF0uTL5wDo0OopDii7yGl+qWVCUS6q1se8jgK/XqTAjUsDzO3HcLy/1M28/79fO8xz3BDU9LdOduqvVYsMurpYX54+3hEbhaUqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073216; c=relaxed/simple;
	bh=ZEHr1yv4ZMrysl4WUeg4zqU5PYr/DAnqQNTSibgZC90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lfupr4jdE1bnGNFOGYpZhyv0uu22si67M4sek3hbMUj9SPlEbMTHFiTk5ZIVedYr/xN3gvkYU508X5EJOOXUIre+dg8rzP6YuqAqkkPch/8i0W/PHOocD1fbGhEIVNCtTKZRnyAOOR2BgIa3upeGwP7LBWj4jAO/A4CPlhEu9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyMTZAKU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so40030371fa.2
        for <linux-media@vger.kernel.org>; Sun, 22 Sep 2024 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727073212; x=1727678012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
        b=EyMTZAKUprXtuiqknyrq4Iabs237MhFJXMvCrz5qRJH52aI7/VAqLwQv0aI1uvEo8Y
         xbTC6RLXBM87WvFdEzo1jpAhiCg8+989kpBkyZ5gG58e6aUUcptymhkG+5LebjjR3thW
         JKbjlSaH84vYi5N9CQ1njwGK7FQLE6Ul1hE++jtzuq702bkdKGIwrvYNmzfqYfwqWuno
         Te3cGNhZrt3L1zoMRYZqUlyF4rQjcEdOafa63fH1rK+mhW61IwdOajhYQm3GdMKCLzQp
         1lZOzLkVdvt7a30VbT6j53kQxtGzJ2aT/MA+uHptW2qcwTRa9iWCDgdkWfZ68UVYEOxn
         bOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727073212; x=1727678012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5jTK+r41Ph8334euEi90MC38DwR8Kznsi20eXBe15E=;
        b=w+KpBph56A/vsFh3doT7HVfiIOit52BajRxbZMd/SzF0Ih6n0JfIuVDvjks2c16vpN
         H4HTQgc8hFMOpOsXKv8O2tpqyYTRTfevXibY8vhtgFX8d2/86WVyZkI8WkPH+vGIVl4l
         6hOOezvLxYC8oDByv08Ho7wTgurnRgcP19KeDeToR4V06Jx8IRukL0n6oqfCHm+YrEn4
         Glr32naOkz1E2zpIEOLrEO+2XuOvmUwOqwE83q33HRF/TmPpS+JGT/j7mTpe8/G63GlH
         Hul6UOlDsDMQhoXPcx7jFEDx/GAMZbirc5Rn0r2EX2YwPQyo/yEdWkp5c2nf5DN/3Cii
         ykKA==
X-Forwarded-Encrypted: i=1; AJvYcCW3x4UJ0y8vqO8/nCGczQ+iLfriBBHa+J1wkoUM+scNGWarPC6b3DRJSyX939DTPcNIDvVGmAGC6wVGlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IO9gaax6CfNF1jz69PC/XrzU0syKnQ2hx6f79GJ++t++usai
	3550X/gIuPb5ae+LHvVo+wqIg2W2WRisMPju5Vw0PVx1mf0EaNmr1W956ZPuG30TPD8+91WGC4C
	dN7UoWQ==
X-Google-Smtp-Source: AGHT+IF0SSg0hB/gqsdKj0/yr4GTl2yjAfBCnM5NlEWIac3bv4HTXek3j/tUDFkeNkN6x6DTtY/72Q==
X-Received: by 2002:a05:6512:110c:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-536ad1808d1mr4286439e87.27.1727073212004;
        Sun, 22 Sep 2024 23:33:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b4255sm3165429e87.259.2024.09.22.23.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 23:33:31 -0700 (PDT)
Date: Mon, 23 Sep 2024 09:33:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>

Hi,

On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> Hi,
> 
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> 
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.
> 
> I've tried to adress the comments on [2], but [1] introduces changes so I'm
> afraid I've had to skip some comments.

I know I have raised the same question during LPC (in connection to
Qualcomm's dma-heap implementation). Is there any reason why we are
using generic heaps instead of allocating the dma-bufs on the device
side?

In your case you already have TEE device, you can use it to allocate and
export dma-bufs, which then get imported by the V4L and DRM drivers.

I have a feeling (I might be completely wrong here) that by using
generic dma-buf heaps we can easily end up in a situation when the
userspace depends heavily on the actual platform being used (to map the
platform to heap names). I think we should instead depend on the
existing devices (e.g. if there is a TEE device, use an IOCTL to
allocate secured DMA BUF from it, otherwise check for QTEE device,
otherwise check for some other vendor device).

The mental experiment to check if the API is correct is really simple:
Can you use exactly the same rootfs on several devices without
any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
laptop, etc)?

> 
> This can be tested on QEMU with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
>         -b prototype/sdp-v1
> repo sync -j8
> cd build
> make toolchains -j4
> make all -j$(nproc)
> make run-only
> # login and at the prompt:
> xtest --sdp-basic
> 
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
> list dependencies needed to build the above.
> 
> The tests are pretty basic, mostly checking that a Trusted Application in
> the secure world can access and manipulate the memory.

- Can we test that the system doesn't crash badly if user provides
  non-secured memory to the users which expect a secure buffer?

- At the same time corresponding entities shouldn't decode data to the
  buffers accessible to the rest of the sytem.

> 
> Cheers,
> Jens
> 
> [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> 
> Changes since Olivier's post [2]:
> * Based on Yong Wu's post [1] where much of dma-buf handling is done in
>   the generic restricted heap
> * Simplifications and cleanup
> * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
>   support"
> * Replaced the word "secure" with "restricted" where applicable
> 
> Etienne Carriere (1):
>   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> 
> Jens Wiklander (2):
>   dma-buf: heaps: restricted_heap: add no_map attribute
>   dma-buf: heaps: add Linaro restricted dmabuf heap support
> 
> Olivier Masse (1):
>   dt-bindings: reserved-memory: add linaro,restricted-heap
> 
>  .../linaro,restricted-heap.yaml               |  56 ++++++
>  drivers/dma-buf/heaps/Kconfig                 |  10 ++
>  drivers/dma-buf/heaps/Makefile                |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
>  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
>  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
>  drivers/tee/tee_core.c                        |  38 ++++
>  drivers/tee/tee_shm.c                         | 104 ++++++++++-
>  include/linux/tee_drv.h                       |  11 ++
>  include/uapi/linux/tee.h                      |  29 +++
>  10 files changed, 426 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

