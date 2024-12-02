Return-Path: <linux-media+bounces-22480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05D9E0D72
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 21:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44105B31D79
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 19:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A1E1DE3BE;
	Mon,  2 Dec 2024 19:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1n7Lcdb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738551DE3B0
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166759; cv=none; b=qxAtZCD1UZ6UVMc/AvHyItGbo/Uj65qmhLzv6fDOI+4OLnh0dk5gX+x9tEMN5MvNz9iEmv6J4MhouK0utlJAFpJ9I9eXQayfV1W9wmqUwDDjBnFIhCCTtHVwmUe67T9VVqiEwm3JYltPwYFcHD2T7Q9i39f5MyZbP7nvlofOEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166759; c=relaxed/simple;
	bh=PCqlM+3BfC76KzUSF5fEfBFma5s6DwjBlWJwKQHa9fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rexwd7yIIw3G0Oc+Tvxr+o7GJcemE/CfDRPNVMolMQ1ryEqGVPbCylGevsz444ifZ146Smo8zd4+tDPNFA0fn2NITAnO4o6EP8xIYlxIO3pb1RxFNFcKvEm5cCgEyCAISySKTkEp637v3qSvRK0i4OxMpW4j/iK2HPUNgk+RoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1n7Lcdb; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de5ec22adso5802740e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 11:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733166755; x=1733771555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5P0+db7NElW+RfhzCk/WkVDLZpj6atKSAhLo042qRI=;
        b=g1n7Lcdbo1EYfd+gORk48JpqKOV15uopC3E/srXqWXFuxGemGFY+/C6KdoUcjCTGYC
         Z4p5SUXEF8DmXectlKZYD01CtV7hd2HPztwxQECcc2TboOX0+5XDTNVRT44LZ/8ceNqY
         dlffXAm7VGwqGwMkUSKOGe80fAC86CH1EAn5RV6horOk2uJTdIXXCclxbcyBkie9xdpa
         O/C0rr343wktDSCEDvmsUFyh8RqBI4zgoTWc/yRn0pp26p3FqxIboJCEN2kqMQJkHYa1
         +9Y1Hn+BFpodi0+TJBoHuTyt9NH4FefZYfvwXZ7Se7LhRwKBv/Zxw5H2UxeE+nZRZ511
         mhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733166755; x=1733771555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5P0+db7NElW+RfhzCk/WkVDLZpj6atKSAhLo042qRI=;
        b=sNDk/6BHa6gLW+m4sh27GwZLWzA2dvhSWPyP4kHx6jLDzn01qL+mUpeRPyN+QD82dD
         A/KTbFx8UutlFq6TeygDPbAwE8JlXaZdJHmCgxTq6hQhjaoCUdEJkSkLxpJPHNWDo4Xa
         mQOAwuALQFlVdQIgYvh9iHHjn1vVtjhhelUXlJHUoJG9EJHoRyLr5asyjGLLwpVuOTl+
         lrELTNYIXx7tOEIE8QWT9J4aK/R0IELldfmr0QwmZXWnZsr/u51QE/6x7zsOmnp5QCC+
         iD6LtsD4LDepIOO/susZ5wnbPXsmH6qMV9Z0pwhDbiSw1rr86dUAh1ZtG6msTvqNrFFg
         lClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUuVMEVO/1eGpwRfLLdw6zNxcRlcsfT1emuySh8yFz98TglTQAIIOPK+bwj+Zv8VwgoIjAaBQ1sJxAnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv583ni7ihPmdjK3we6tLKdX01j6KJHOkApB6WUd9Kfu+fFSz+
	FnWtyFiSPtbD42Z8Eu9xR0cfdFIS+BuQkUXhrjWAvlnbNPBxlpeIlUxPWMpYo6JPr+e+J6yw4X7
	Hfie4DHSTWuLKxfOw9Q5Ql9UPXj6JOd0zEvs=
X-Gm-Gg: ASbGncvJ+rua6fFiHHi0G9zo90UQNW58/oKIcp9DGvV42Vcd7tI8nxUH1mSDc48QoG7
	VPviZfnHV8+WOwn9oUApNx/Xc7rm0goqePW6iK47RpHsOYGAiudmBL+1AfRAR
X-Google-Smtp-Source: AGHT+IHZfCjhITQ3qERmJbAY1aREzd4BIcVZPSiVSRGk4ymF9wRxc0gWXYA3+kYFBl8DXbtnZqYMib0piYz7PcngqQY=
X-Received: by 2002:a19:8c4e:0:b0:53d:f177:51d1 with SMTP id
 2adb3069b0e04-53df17752b3mr9327407e87.13.1733166755293; Mon, 02 Dec 2024
 11:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202115827.50388-1-mripard@kernel.org>
In-Reply-To: <20241202115827.50388-1-mripard@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Mon, 2 Dec 2024 11:12:23 -0800
Message-ID: <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 3:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
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
>  Documentation/userspace-api/dma-buf-heaps.rst | 76 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..68be7ddea150
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,76 @@
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
> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s
> +
> + - The ``reserved`` heap allocates physically contiguous, cacheable,

So, I think calling the heap name the "cma" heap might be clearer here?
On some platforms the chardev is "reserved" because the default cma
region is setup via dma_contiguous_reserve_area() (which calls it
"reserved"), but the dma heap is exporting cma.

Additionally, on some downstream devices there can be multiple purpose
separated CMA heaps. This hasn't made it upstream over objections to
how downstream devices were enumerating the separate cma regions in
their devicetrees. It was proposed to export all cma regions as
separate cma heaps, but there was reasonable concern over kernel
drivers not expecting userland to be able to allocate from special
reservations, so that seemed like a bad idea.

Ideally upstream drivers would want to explicitly export their special
CMA region themselves and we would export something like
add_cma_heap() to do so.

All to say: this document really only covers the naming of the
"default" CMA region that is exported via the cma heap.  Eventually
there may be other CMA heaps as well upstream.

> +   buffers. Only present if a CMA region is present. Such a region is
> +   usually created either through the kernel commandline through the
> +   `cma` parameter, a memory region Device-Tree node with the
> +   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
> +   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> +   might be called differently:
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
>

Hrm. I'm not sure I see the value in enumerating things in this way,
it seems like it will be a nuisance to keep current?  Maybe something
like:

On most systems the default cma region is named "linux, cma" or
"reserved", with a few exceptions:
    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``

thanks
-john

