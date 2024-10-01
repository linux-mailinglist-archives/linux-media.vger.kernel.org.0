Return-Path: <linux-media+bounces-18955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792698C746
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 23:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEAAD2861C4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 21:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB1C1CF5E4;
	Tue,  1 Oct 2024 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nAhFyBmf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208531CEACF
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727816637; cv=none; b=DdRBQRwCMq+S2wm5A22V/8xs54X814itxW5mBo2KWPMkrPt8FebghxBf/8tj3exzEtmfhh+eTh+0OZwLRW+OeRRExNxXLLcv2c5ttjpNMkDWEMdapFCyR7fInmQTSnxX231KWNDtpZFzqy5Qjn1MNRFWC7PXkbex8CRt6TY2eEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727816637; c=relaxed/simple;
	bh=JVz9wuDMB2tQRcwveFGv3DJAHOd4oNMepf4fY/RVAK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaodMRemN4t7HF5jyL+sR2R+rD3O6iXNC9a0OzFx1NPWkvzYyAjXbVgA+hLjz8khNJHTVYokXOqXnrEqd6Z5E8QZoGZxeOlJB8PolTUVXdcHglFScWHganlWgF47zKmLieTedMEBDEGfEFtnS/pmHWIMf67HYJJz/RkjHhCaAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nAhFyBmf; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45b4e638a9aso29381cf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727816635; x=1728421435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yL5+DFCKVXpdvIU7o9JTei5eaaMJNukFkXpSxhCohs=;
        b=nAhFyBmfbQuIPaHKu7KtHUWT0QLcwGLEkL7/6ApozuqvApS3nKVpW8PaXEHLM5EVwV
         VYMkPtbbD050VkhwHphXk9Q/YjFzNAYMqxAiZKnNOr+sWIKdHLrBLrBSG6Qv1VE/osBM
         DFVzhf9wf6TMdPFt/tYd7R55illIECpbtI9As0E3gAfFzBz0ZyIdKL/6lVazUFfaJOFj
         OCluvP/vcozNj/ZFRQJLDv/bOjpRHJlV8FPUPiPP2mEFP7IlE24wgRN7Ajjpn2LIyNxr
         BY5F81WqQcv1F7HzgPh+CL04b3YUhxZmoCBav0VTKdQQ9NQgetMINRGheq4JNeV9ciZ0
         ukjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727816635; x=1728421435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yL5+DFCKVXpdvIU7o9JTei5eaaMJNukFkXpSxhCohs=;
        b=Qtu+b3On2fs7J+4aEcLqzNJc4axCFQc8gO6u2xdmVVgXzARFy+GyZnVzGBHl7IyLPL
         ymN/+dkLvCXFQUjLAiuJs621xKp5vPYLH6RqAxJSXayufdhJurI0323xRgTUUil5+CNH
         Rt7P55ftNgIAc3FNw19CEauZdL2SARLxEcguRFAiQ09Bsqn295nrqYkvougWT2JeNHxE
         TTn3ooeQeb4DbhU2Y/GXqQDGKFjUEN190unW1acIDf7s1YUM/ZxlbQex4pNz9wAnQWa5
         3ztPBwZpyO5TcDivGxRRBuVKB0SBioNQLLvtpZhwjCGFWCE2Annn8Ot3IMjPx6qrvZAu
         2CTA==
X-Forwarded-Encrypted: i=1; AJvYcCVRzuK7YGvExjWLmAaKDAtRzb1OjQbXXUDeYHCpVwMSJ2cir/4VKiJLXYcIhCA7nCPRZxsy8+IQFJ8qIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtihU32kUUK91R0JPjRnEcASKzoZMVqOUgjs8OSbDGXrpF2pEc
	IfIEJEwPRExnICfue23t5grM8YLdPMyBZP23ad0YKfmjIfU7gF8/Gp3BANnKBuUD603WnI4VHY7
	jYjl1AdhrC1NBj7V+HJsF+lBr2Zk2sMj+umF7
X-Google-Smtp-Source: AGHT+IGSw23X0VtbGJrp3RuM+W4ZEUK3ccsVBPcc338djiZUFHRx6Ws10QSWrDK7baFgiaNhONZcnQB5Uj1bMNXMTXU=
X-Received: by 2002:ac8:628f:0:b0:458:142b:ee66 with SMTP id
 d75a77b69052e-45d8170a18cmr1046281cf.2.1727816634742; Tue, 01 Oct 2024
 14:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930144057.453751-1-mripard@kernel.org>
In-Reply-To: <20240930144057.453751-1-mripard@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 1 Oct 2024 23:03:41 +0200
Message-ID: <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:41=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.

Hey, thanks for sending this!

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: "T.J. Mercier" <tjmercier@google.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..00436227b542
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Allocating dma-buf using heaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They =
are
> +typically used to allocate buffers from a specific allocation pool, or t=
o share
> +buffers across frameworks.
> +
> +Heaps
> +=3D=3D=3D=3D=3D
> +
> +A heap represent a specific allocator. The Linux kernel currently suppor=
ts the

"represents"

> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s

Virtually contiguous sounds a little weird to me here. Sure, that's
what userspace will get when it maps the buffer (and I guess this *is*
UAPI documentation after all), but I'm not sure it's correct to say
that's a property of the buffer itself? What if we invert this and
instead say that there is NO guarantee that the memory for the buffer:
 - is physically contiguous
 - has any particular alignment (greater than page aligned)
 - has any particular page size (large order allocations are attempted
first, but not guaranteed or even likely on some systems)
 - has bounds on physical addresses

Maybe that is too much detail here...

> +
> + - The ``reserved`` heap allocates physically contiguous, cacheable, buf=
fers.
> +   Depending on the platform, it might be called differently:
> +
> +    - Acer Iconia Tab A500: ``linux,cma``
> +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> +    - Amlogic A1: ``linux,cma``
> +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> +    - Amlogic GXBB/GXL: ``linux,cma``
> +    - ASUS EeePad Transformer TF101: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma``
> +    - Asus Transformer Infinity TF700T: ``linux,cma``
> +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> +    - Asus Transformer Pad TF300T: ``linux,cma``
> +    - Asus Transformer Pad TF701T: ``linux,cma``
> +    - Asus Transformer Prime TF201: ``linux,cma``
> +    - ASUS Vivobook S 15: ``linux,cma``
> +    - Cadence KC705: ``linux,cma``
> +    - Digi International ConnectCore 6UL: ``linux,cma``
> +    - Freescale i.MX8DXL EVK: ``linux,cma``
> +    - Freescale TQMa8Xx: ``linux,cma``
> +    - Hisilicon Hikey: ``linux,cma``
> +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> +    - Lenovo ThinkPad X13s: ``linux,cma``
> +    - Lenovo Yoga Slim 7x: ``linux,cma``
> +    - LG Optimus 4X HD P880: ``linux,cma``
> +    - LG Optimus Vu P895: ``linux,cma``
> +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> +    - Microsoft Romulus: ``linux,cma``
> +    - NXP i.MX8ULP EVK: ``linux,cma``
> +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> +    - Ouya Game Console: ``linux,cma``
> +    - Pegatron Chagall: ``linux,cma``
> +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> +    - Qualcomm SC8280XP CRD: ``linux,cma``
> +    - Qualcomm X1E80100 CRD: ``linux,cma``
> +    - Qualcomm X1E80100 QCP: ``linux,cma``
> +    - RaspberryPi: ``linux,cma``
> +    - Texas Instruments AM62x SK board family: ``linux,cma``
> +    - Texas Instruments AM62A7 SK: ``linux,cma``
> +    - Toradex Apalis iMX8: ``linux,cma``
> +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> +

This part LGTM. Might be worth it to document that a CMA region must
be specified on the kernel command line. Otherwise this heap won't
show up at runtime by only enabling the kernel configs necessary to
build it.

> diff --git a/Documentation/userspace-api/index.rst b/Documentation/usersp=
ace-api/index.rst
> index 274cc7546efc..4901ce7c6cb7 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -41,10 +41,11 @@ Devices and I/O
>
>  .. toctree::
>     :maxdepth: 1
>
>     accelerators/ocxl
> +   dma-buf-heaps
>     dma-buf-alloc-exchange
>     gpio/index
>     iommufd
>     media/index
>     dcdbas
> --
> 2.46.1
>

