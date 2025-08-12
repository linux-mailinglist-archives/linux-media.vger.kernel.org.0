Return-Path: <linux-media+bounces-39588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB20B227BC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76383AA046
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D75275AFD;
	Tue, 12 Aug 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFY21p6f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E5283CBF;
	Tue, 12 Aug 2025 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003425; cv=none; b=shP7jLFfJ1QIJLOBKaGkcAPyf2ACdVq2+PNnkVMqtPTKOK5Iqb5knNCdrMdd75rcVgK5UZVk5SoLX9LkZBWAvUfWmRN/Z421DVfRRDau1sREQklJESTtO8qt1gzQLdcWH+FU7p4kBrVyEmXGHZBP5pBTQnCuaYx7NfMjdaEnKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003425; c=relaxed/simple;
	bh=qghFQCOOR0UBMf1erX9Gzu5+pSrhr+ojvuByHjWtUkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX25tYeskxrGfi4v8SqlMUaBYJWF/bA/padTna3nBIUADHeqjVL6AM1bYXgQF3kc6HQXChPLrYxUhu+IfTbMSoGRLZ+5XyNGm4AjswXaCGgQvBa1OnEWgHFaPn3UDBzGsDkc+Xjzcefl9B3MZlwWs0HX6PPESCk2FJyk3FfDNp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFY21p6f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44243C4CEF5;
	Tue, 12 Aug 2025 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003425;
	bh=qghFQCOOR0UBMf1erX9Gzu5+pSrhr+ojvuByHjWtUkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FFY21p6fWGgX3tqv+54v6/2y2QKYGHPBYVWxO3SccGYmbsLOdENRKVqo8ykjz4E/+
	 Vg5erN9uAv+YdUjlYBiJUL4f9SlUiuA89a83P/EGxTptUX7cDAcRGUvEdp5+5DtOI8
	 BKG3YuGzpnu2RhQNOv/xAuP98l/0xoAClzpXC2PWnJ7Uewk0ioGtB7KatkF/nrJdwt
	 +kVkcXwM+pnrZQOJJs3MH3Gh8ntbmhXncvjlgdBB+WkvjjKL8K0r4F98rdQ6krIiu5
	 P0oiUvraDeQjLVYxZeiGEv6diX8HWgdI0Iiq5oVrY8IMfXZlhNhV9PtImwnWNK7hKQ
	 HMZsLT8biUy7A==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af934d7c932so713898166b.3;
        Tue, 12 Aug 2025 05:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwp9/eJwYiifjcT45YpKr/SpJ6so7KnNlszSzLqY7SOycduKUOUrGLr/Y/C2dfpPldatSmF5pkjq3QP2k=@vger.kernel.org, AJvYcCWF2wbm4Fg8UljGss0k4CPybPtXXZyP6Yf2Ki1RQq7ENKXeg4cPBojD860oChBbbangORU10Voj88Kng5pv@vger.kernel.org, AJvYcCXr5ebgx+ZIK7OQHQSQENg7briIVDh/x/genOObe5+mUEQZ96gxb9zUlDqmHycuDBH0QlyAj8kdyMqP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4A1OZNugx1sZYjI+yI8jDd0SEILCnxWF+FSfc3gzQNRV8FCY
	jFHQCgwZOOw/8es0Jy5FAOhBMIbhAko7qdPOKFsLXm48vqdY0EDmq5Dg8KCNT0Kwqh3SifflHL5
	N45c54ulrR84XMGIMr0GOlKGsAx5itg==
X-Google-Smtp-Source: AGHT+IFDUbbe2PhMsIRWb9q1ckE7Y9HH+PJ5GWNSinNHIim73doYwGhVoAfafcP5txHzDsr8Ed8+WkTjBqTHjyEPdqM=
X-Received: by 2002:a17:906:4796:b0:af9:8c20:145b with SMTP id
 a640c23a62f3a-af9c634f563mr1528914666b.10.1755003423802; Tue, 12 Aug 2025
 05:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org> <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <8a872e48-0743-43b0-8259-70d6b8e4c221@suse.de>
In-Reply-To: <8a872e48-0743-43b0-8259-70d6b8e4c221@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 07:56:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
X-Gm-Features: Ac12FXwuFSQu1fZPX73cq3WQKGjboa7GxXCNwN2iRczUjfXBezoHJpzIMA5o6NE
Message-ID: <CAL_JsqJL5sy7Otzo7R8mYW_-7s+ajggjtuW7tYBnVxYPaJHs+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 6:01=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 11.08.25 um 23:05 schrieb Rob Herring (Arm):
> > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > relatively simple interface with single command stream to describe
> > buffers, operation settings, and network operations. It supports up to =
8
> > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > for SRAM (like the downstream driver stack and compiler). Userspace
> > doesn't need access to the SRAM.
> >
> > The h/w has no MMU nor external IOMMU and is a DMA engine which can
> > read and write anywhere in memory without h/w bounds checks. The user
> > submitted command streams must be validated against the bounds of the
> > GEM BOs. This is similar to the VC4 design which validates shaders.
> >
> > The job submit is based on the rocket driver for the Rockchip NPU
> > utilizing the GPU scheduler. It is simpler as there's only 1 core rathe=
r
> > than 3.
> >
> > Tested on i.MX93 platform (U65) with WIP Mesa Teflon support.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> I've looked over this patch and it looks good to me. There's a
> dev_info() in ethos_init() of which I think it should become drm_dbg().
> Anyway

I prefer to print out what h/w we've discovered. That's a fairly
common pattern for drivers (and more useful than announcing drivers
that only loaded).

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> Side note: I noticed that there's buffer-allocation code here that
> reinvents dumb buffers. We've ocationally talked about creating a better
> dumb-buffers ioctl interface and this drivers could be another use case.

Yeah. In the past I got told don't use dumb buffers APIs for anything
but dumb scanout buffers. I guess with enough copies opinions
change...

Rob

