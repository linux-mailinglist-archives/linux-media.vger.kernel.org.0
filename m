Return-Path: <linux-media+bounces-24276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D61A0259F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858BF161895
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 12:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8AC1DD86E;
	Mon,  6 Jan 2025 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="fYVvsIAy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2290D1598EE;
	Mon,  6 Jan 2025 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166981; cv=none; b=jrckw4BNRD0yezuIa6BlBiFHBkypU69hpC5ZYWDEYcs3eavhCjkacof91iSiBddP1E8Z3AlpArn0tf1GopJgswpTlxxgolOE5IJ2+w5xOojfsYjBGyTTmjBWcDm32Shx0CqK4L6C/WgEWaC/2Y3elF6mAFrl8NWUqTWAnLjyB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166981; c=relaxed/simple;
	bh=3+2UE4A78WBYby8MiY6zpEHBFD6l8nYLZY+vBVkQwOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRQT+U3E0W9ctg0RQetCGUOHJpjqVij10teduMbt153qiP0i44jLX9gci8vUilePoGy0M5QMpDpf+BgIsc6RhD6+gS6s41qr4NB2nMuCD7PMxKnJJccpVvPQ5jesGxZa6Kb8n+3SQMln3FD1oZ3z/xPSyinNkIQjO2jeoLnpXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=fYVvsIAy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa67ac42819so2057064766b.0;
        Mon, 06 Jan 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1736166976; x=1736771776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dKIXxLhttbFcVYR/bgQGxM4UC+Urto6wknS8G3Bmh8Y=;
        b=fYVvsIAyZOvJcmDN3zAXPCiuyNmhVB2zfQ6L8AdyddgQRf9wJmLXu/dyZli7aRUKix
         BP3d5dPwaRy6U5sdeVWggfh/Pvoaa3uiThMJSSjqs+i1hRcQ2xn4bmMMTxQ131m7yHyd
         1JsLvJWvmW1zdwKy7gGY5EPVyIcZNrMeIeRME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166976; x=1736771776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKIXxLhttbFcVYR/bgQGxM4UC+Urto6wknS8G3Bmh8Y=;
        b=JgZHwBh/xQXxDRgPZkCMcmzIf5saAEQjAIFRh/kb/YdmAVNekvc4TWrmAN70lGMVmb
         paIxP3ztkejrVv88k46G+zYYnWjtYDmUuJ2a/ygZhCOGN+zhznAiihcP3EZWSSXaSsXS
         ZQ/VYBOSn6GLFRQf986mReaOpl9LXFvlQP9EtYrIp47Ed65Hb1z7oE5Y/Rvu4X3N347r
         0iOgfYF9ftm6ibwYEnqHk43kvEkphqyC3srFxG01MmdRMj+yft/X3h+AWXoy1cFm6HtT
         Fhqaj8eOFkdmHu6lJnt5qkd2sEEetr7uT130asnT1Gpqzmed6xPTOYgDVqnuQTJEQ0eb
         WloQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRbSGuQHHG7HM88Y8ZsGozy6pW+/nboiqOlSzRZMSRMesM/8MXamPPtrPcUJSQl/hlRnupYVCTKdWM@vger.kernel.org, AJvYcCVq9vijsQ/aiNvyRVqWRj7rlnFWrBQ3IxFQ1L1orl8V6i2PrcKQwrVAzMVFKK4SEd5gAEDG7ENKv8k+HDoFGQ==@vger.kernel.org, AJvYcCWfUQn0ADpyULPfSUnJetF/ammn5uw9avP74OB+SvN2XM0hCBzrSXbPgwuxzIDxOgE5nv53RBdmcacNsobK@vger.kernel.org, AJvYcCXn9VWDdhdBMLQNgA4F6f8dpvuKS08xM++j0eUe3y/pKslkfGDMm1t/GlaxQ9o6yXJ1AdVcgixa3IItqRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKn8ljw9r3O6ukUVBdEG6uimA4owc7LKrcdLwM+sk1Doptnetg
	x0AbaX5JxHIoFo6n3FTvi+71rAorrTquJ9EIL/TSGnIbl7AA1a09LfsFh/MYYoXfIuvfe3e6YmK
	frQ3onD7wvcgrYwM5VA4SWL8p7WU=
X-Gm-Gg: ASbGncuZ4iunBSf1Y6NTAQMeZQrHo3xZuh3ajAZZI2WEKSHOMyZCTbif4dSFSoEoF/T
	QHZoTHQELsdMDcljZyfcAwwfsflc6In979XjsOA==
X-Google-Smtp-Source: AGHT+IGwGcVs1m2atwIpdSUGW8iawaESVde18+/ZLAH7jwPmVxZpzN3LOf4WKbD6GStENEJkJ9TFSrLvno21ev/aCyc=
X-Received: by 2002:a17:907:7e81:b0:aaf:74b3:80db with SMTP id
 a640c23a62f3a-aaf74b380e2mr1797693966b.3.1736166976070; Mon, 06 Jan 2025
 04:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jan 2025 23:06:03 +1030
X-Gm-Features: AbW1kvbTwfL57vv40IS5aQIuxGW2DHEqbK40Wr060WqVI88XDY3rd3xwWUsD5yA
Message-ID: <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Stefan Schmidt <stefan.schmidt@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 22:23, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Introduce support for Qualcomm new video acceleration hardware i.e.
> iris, used for video stream decoding.
>
> Iris is a multi pipe based hardware that offloads video stream decoding
> from the application processor (AP). It supports H.264 decoding. The AP
> communicates with hardware through a well defined protocol, called as
> host firmware interface (HFI), which provides fine-grained and
> asynchronous control over individual hardware features.
>
> This driver implements upgraded HFI gen2 to communicate with firmware.
> It supports SM8550 which is based out of HFI gen 2. It also supports
> SM8250 which is based out of HFI gen1.

I tested this on an x1e based machine, a Surface Laptop 7. I had some
errors with loading the firmware which triggered some warnings when
trying to tear down the driver. I've pasted the WARNs at the end of
this mail.

I was using the firmware from linux-firmware, as packaged by distros:

4d2dae9a8187b728939e9c79fa68012b  qcom/vpu/vpu30_p4.mbn

It appears to be signed by a test key, which I assume was the cause of
the failure. Replacing it with a properly signed version worked, and I
was able successfully decode a test video with ffplay:

$ ffplay -codec:v h264_v4l2m2m test.mp4
...
[h264_v4l2m2m @ 0xffff500054b0] Using device /dev/video0
[h264_v4l2m2m @ 0xffff500054b0] driver 'iris_driver' on card
'iris_decoder' in mplane mode
[h264_v4l2m2m @ 0xffff500054b0] requesting formats: output=H264/none
capture=NV12/yuv420p

Cheers,

Joel
---
[    2.587909] qcom-iris aa00000.video-codec: error -22 initializing
firmware qcom/vpu/vpu30_p4.mbn
[    2.588095] qcom-iris aa00000.video-codec: firmware download failed
[    2.588250] ------------[ cut here ]------------
[    2.588251] Unmap of a partial large IOPTE is not allowed
[    2.588256] WARNING: CPU: 4 PID: 659 at
drivers/iommu/io-pgtable-arm.c:649 __arm_lpae_unmap+0x3cc/0x468
[    2.588335] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
         6.13.0-rc4-00092-g1bbe1a937cf6 #21
[    2.588338] Tainted: [W]=WARN
[    2.588339] Hardware name: Microsoft Corporation Microsoft Surface
Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
160.2.235 08/05/2024
[    2.588340] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    2.588342] pc : __arm_lpae_unmap+0x3cc/0x468
[    2.588344] lr : __arm_lpae_unmap+0x3cc/0x468
[    2.588345] sp : ffff80008259b690
[    2.588346] x29: ffff80008259b690 x28: ffff80008259bc30 x27: ffff80008259b8f8
[    2.588349] x26: ffffb973346978d0 x25: ffff68590225e7f0 x24: ffff80008259b8f8
[    2.588351] x23: 00000000dfc00000 x22: 0000000000001000 x21: ffff68590396ce80
[    2.588354] x20: ffff6859068fa4f8 x19: ffff6859068fa480 x18: fffffffffffef6a8
[    2.588356] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
[    2.588359] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
[    2.588362] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
[    2.588364] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
[    2.588367] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
[    2.588369] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff68590bc25640
[    2.588372] Call trace:
[    2.588373]  __arm_lpae_unmap+0x3cc/0x468 (P)
[    2.588376]  __arm_lpae_unmap+0xf4/0x468
[    2.588379]  __arm_lpae_unmap+0xf4/0x468
[    2.588381]  arm_lpae_unmap_pages+0x70/0x84
[    2.588383]  arm_smmu_unmap_pages+0x48/0x10c
[    2.588385]  __iommu_unmap+0xf0/0x1c0
[    2.588387]  iommu_unmap_fast+0x10/0x20
[    2.588389]  __iommu_dma_unmap+0xb8/0x2c0
[    2.588391]  iommu_dma_free+0x2c/0x54
[    2.588392]  dma_free_attrs+0x9c/0xc0
[    2.588395]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
[    2.588399]  iris_core_init+0xd8/0x138 [iris]
[    2.588401]  iris_open+0x3c/0x318 [iris]
[    2.588403]  v4l2_open+0xa8/0x124 [videodev]
[    2.588406]  chrdev_open+0xb0/0x21c
[    2.588409]  do_dentry_open+0x138/0x4c4
[    2.588412]  vfs_open+0x2c/0xe4
[    2.588413]  path_openat+0x6fc/0x10a0
[    2.588415]  do_filp_open+0xa8/0x170
[    2.588417]  do_sys_openat2+0xc8/0xfc
[    2.588418]  __arm64_sys_openat+0x64/0xc0
[    2.588420]  invoke_syscall+0x48/0x104
[    2.588423]  el0_svc_common.constprop.0+0xc0/0xe0
[    2.588426]  do_el0_svc+0x1c/0x28
[    2.588428]  el0_svc+0x30/0xcc
[    2.588431]  el0t_64_sync_handler+0x10c/0x138
[    2.588433]  el0t_64_sync+0x198/0x19c
[    2.588435] ---[ end trace 0000000000000000 ]---
[    2.588438] ------------[ cut here ]------------
[    2.588439] WARNING: CPU: 4 PID: 659 at
drivers/iommu/dma-iommu.c:841 __iommu_dma_unmap+0x290/0x2c0
[    2.588497] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
         6.13.0-rc4-00092-g1bbe1a937cf6 #21
[    2.588499] Tainted: [W]=WARN
[    2.588500] Hardware name: Microsoft Corporation Microsoft Surface
Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
160.2.235 08/05/2024
[    2.588501] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    2.588502] pc : __iommu_dma_unmap+0x290/0x2c0
[    2.588503] lr : __iommu_dma_unmap+0xb8/0x2c0
[    2.588505] sp : ffff80008259b8f0
[    2.588505] x29: ffff80008259b930 x28: ffff80008259bc30 x27: 0000000000020100
[    2.588508] x26: 0000000000020100 x25: ffff68590bf76a08 x24: ffff80008259b910
[    2.588511] x23: ffff80008259b8f8 x22: ffff6859113cd260 x21: ffff68590bf76a00
[    2.588513] x20: 00000000dfc00000 x19: 0000000000001000 x18: fffffffffffef6a8
[    2.588516] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
[    2.588518] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
[    2.588521] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
[    2.588523] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
[    2.588525] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
[    2.588528] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    2.588530] Call trace:
[    2.588531]  __iommu_dma_unmap+0x290/0x2c0 (P)
[    2.588532]  iommu_dma_free+0x2c/0x54
[    2.588534]  dma_free_attrs+0x9c/0xc0
[    2.588535]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
[    2.588537]  iris_core_init+0xd8/0x138 [iris]
[    2.588539]  iris_open+0x3c/0x318 [iris]
[    2.588541]  v4l2_open+0xa8/0x124 [videodev]
[    2.588543]  chrdev_open+0xb0/0x21c
[    2.588545]  do_dentry_open+0x138/0x4c4
[    2.588547]  vfs_open+0x2c/0xe4
[    2.588549]  path_openat+0x6fc/0x10a0
[    2.588550]  do_filp_open+0xa8/0x170
[    2.588551]  do_sys_openat2+0xc8/0xfc
[    2.588553]  __arm64_sys_openat+0x64/0xc0
[    2.588555]  invoke_syscall+0x48/0x104
[    2.588557]  el0_svc_common.constprop.0+0xc0/0xe0
[    2.588560]  do_el0_svc+0x1c/0x28
[    2.588562]  el0_svc+0x30/0xcc
[    2.588564]  el0t_64_sync_handler+0x10c/0x138
[    2.588566]  el0t_64_sync+0x198/0x19c
[

