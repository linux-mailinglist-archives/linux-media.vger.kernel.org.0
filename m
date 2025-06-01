Return-Path: <linux-media+bounces-33736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63654AC9DDD
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 08:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E5EB177ABE
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 06:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1852818DB1C;
	Sun,  1 Jun 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Iv91YkLV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D218BC2F
	for <linux-media@vger.kernel.org>; Sun,  1 Jun 2025 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748760081; cv=none; b=e3UXMuB/1z4W1lNtB+5Dac0devhgbbrhy0HQjb4bgobH1TuNJRi7Ngjh8WdGdSec7zaKS7sIMCxrmc54SNqnabl2bdQ5vDxJ0U3VX5xUIYesP/AHkb/FPKSdiuFJzYIVNAOt0DZocJsMcAB7GgKe6gtLLnZsGVy2ecszC7I0Prc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748760081; c=relaxed/simple;
	bh=7nIuduBZSDN8yG4gI1AL7If3QAxZl6VdPtjos3S82gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/oS5qopNNkQOb8aMYX7gYqx6LGIpmAftX2zymJdLa0NLiliVdvHbG5ESi5hi/tgDzwaL1GNu+0KcjzO3hKTSrJVDuijf1JsKAzh7sgLl/fOLZuccucNtCOIq19aPi6VuWbq5K2uWcL9DmH0H87Rf524evW25Ng0Airri/W+mNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=Iv91YkLV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e77831d68so33996507b3.2
        for <linux-media@vger.kernel.org>; Sat, 31 May 2025 23:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748760078; x=1749364878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=Iv91YkLVutRzPUJt7I5MEKsmYl4bqFiausDX1QTkkNJJKMrplETK1xNBQtirXsbS7C
         Rh/+LiXzgBmZz/gKbyFX/opx09kF6Qy6IYcs/T5tI4l6ADh1zufSdIKl9UPtTAlFuc4x
         /dz1WQWCdStLmkv/Dwg//TNjPeExY6OkJfRv/ty5c6NDgkXbxBL73ehtB58PEZfqJWd4
         TcNb+RokOzJYIP/a+qBaq9nNmT7NswFl9zBCl7Htx5ena49a7Gl+/vpI6OqNwOSz10Uy
         MXz59/Wu7MrZEKYKc5S2Pj+wmS1jRP18QlOlNgMM1djtUWMNEnbmCL2o0ZrUbbTmr0r0
         V65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748760078; x=1749364878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=ofvRCBUFceMYxNejyOGHUrJoombz3X+NjGEObUCYfWnSuhs8380BHYMgaVi2PixwUO
         Nq+SXRiHAKS+Jz97A3zMY4UJ4MZQ+pNfy0JuPNpNSs2wRaMlUyavozeK6fW8uDNH4M9g
         WZXMymwlhqhCOLiXfMw8ttmyY9AN4hO7X6D1AViVnBmZW8/gbyOR9T9wUuX3Np0IA753
         4OQcrlYYYHHVJEZJ+9a/Qf+VIcjpnXizfBRvwR0PsDorlIe7KO2zYp3RpBPILgDgcxG1
         2qV3cXJZhTdEFHZGGH77C8TkVdFMMrWysxJUfHAO4Hmcl7XN7cQ8Mvxb7iOD231hRvWF
         6yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK79mzU3gS7XecMJwjXGbX9KVdD3hAnrqYGE6YMqzYY5Hmp7IYj/U7iCLmt7dU+pxkSy0+xTAzbeHDaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUwrQgAquxSuW7Jud9WHuBlEbSKtfeKeLSGoL97hwgWO0dDGU
	50dsmJbBzvgh0nwC+hFwSxqmIvguK4Q/ktJwmUIlAu9MK/IM7s6wV9abjexyleOszFChfML9AA4
	EbEcmWdIQrw==
X-Gm-Gg: ASbGncuA94g3SzfD0Ijouv5GN6+PnWjzcipbjSsAZJDnjVaBkDOzUeVRCuUxx1jV+iP
	oT2htYMlvR74Zh2RJDUOicQhFzS7Ckm5twXVC9a2Zq3iihMnRdbquNVgZlG631KkRruZWJaVG2x
	oJ9e2+oMWuwrma9zWqgj61u1gtp/L8MxhDYqlnD73EwaQoqmZGjLc56MEj7SSwsH39sO0D9rwsW
	Sr/ZobSPzxACIdi8A/7O0JKERIDstr6azkxsTucBsNvnL4Ahg675eL1/Kl0KzhNS6FzxmyTxGzY
	jJvtDFFPxB3q6jRh0fnfNNIANP8b5WyO/PUq/VT5Q9Zz5nRw7G1MOknCPIbEtAgmDHRhlCH08+w
	vP9iaGgr/LM6t8WEZ004G1m1sKMrVdg==
X-Google-Smtp-Source: AGHT+IG7QFqS1UaU0YMRasbmTCx1Tr0K8NUXc+2x5saWfwUXHo9/8qNmSBwBg1YWxFL8D3/84TKyfg==
X-Received: by 2002:a05:690c:7401:b0:70d:ee83:373b with SMTP id 00721157ae682-71057c05dd7mr113923437b3.13.1748760078191;
        Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac10d35sm15501757b3.67.2025.05.31.23.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 23:41:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7c5d4709caso3232886276.1;
        Sat, 31 May 2025 23:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4CqoNp0vHiwKvDuqV0KtmBY2XYHHgJyx+5Gq+J8ez1ZNP2C9aMyyN0jMKwjErhfEYnPYAF3iWApP6@vger.kernel.org, AJvYcCWMGkuKj8wCKudYlGU09Qx4Uydj1hSG+b8WKrXjEKqC1BZb7ThBqdCha69v2qI6+zzSUqQA7OMv089H@vger.kernel.org, AJvYcCWhKMFiaj17hJMlx25KDCb6MEpqA5JKWJeuTDEuYynugfChPlKrZURQyA6jza5g52L0UEHPqMvCCe2WHVE=@vger.kernel.org, AJvYcCXKCe8Gq6wVcYEHQk8NEE7lrF49TP+G4tqbFEOgss6RMXmQq9cBkroYcNV7lUD5whPzeUSgfgudB+HHPKgC@vger.kernel.org
X-Received: by 2002:a05:6902:1245:b0:e7d:c51d:4b17 with SMTP id
 3f1490d57ef6-e7fec876436mr9326569276.8.1748760077303; Sat, 31 May 2025
 23:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net> <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
In-Reply-To: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 1 Jun 2025 08:41:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
X-Gm-Features: AX0GCFuCkivNAaBx7rL3ymXj2J3pJIXqNYSSzMxHaNqO3jwK8nThi-KXGe-k1Hs
Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Jagan Teki <jagan@edgeble.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 8:50=E2=80=AFPM Jagan Teki <jagan@edgeble.ai> wrote=
:
>
> On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> >
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> > Changes in v4:
> > - Several fixes to DT bindings.
> > - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051a=
c9225db@tomeuvizoso.net
> >
> > Changes in v3:
> > - Reference in the device tree only the register blocks that are
> >   actually used.
> > - Several style and robustness fixes suggested in the mailing list.
> > - Added patches from Nicolas Frattaroli that add support to the NPU for
> >   the Rock 5B board.
> > - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbc=
fafc141@tomeuvizoso.net
> >
> > Changes in v2:
> > - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian =
Reichel)
> > - Drop patch adding support for multiple power domains to rockchip-iomm=
u (Sebastian Reichel)
> > - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e4=
8eea250@tomeuvizoso.net
> >
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
>
> Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
> to any other common format's unlike rknn?

Both considerations are entirely dependent on the userspace driver.
This kernel driver should be able to support a userspace driver that
accelerates any YOLO version. Should also be able to support without
changes a userspace driver that implements execution of ONNX, PyTorch
models, etc. With or without conversion to an intermediate model
format.

Regarding the particular userspace driver that has been submitted for
review to Mesa, you can put questions and comments at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Thanks,

Tomeu

