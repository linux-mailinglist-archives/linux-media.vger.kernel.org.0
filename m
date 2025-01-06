Return-Path: <linux-media+bounces-24277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45AA025D9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E283A1921
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6EA1DC985;
	Mon,  6 Jan 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="RBBc0BQB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8735976;
	Mon,  6 Jan 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167611; cv=none; b=SbpIDdto9dT4M9LgRy/4tRlhW0ibXhSkPH5M8D34uNKpjBB7jHx5PUrX7krg0qYuEb46AQbh6ybGvw0uILTZPvJApTCVnrU8+QYSeKF1Eci1cP0aj6WhPBKfp7JpeHbkTfkF31zJ6SntypDss15qd5XrhtEHjdOAKUVPnaFXXpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167611; c=relaxed/simple;
	bh=V4Zcawxb7oO2XVlVmEVeip5GN9MG40ycvhzIOsR+d20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nreQpoSGn1IJCM96KFBtnhVqjpnHUXIrYJrFhiaDq1dm/xag1WaoeEW0F4s27P+wkMb5zGCDRAO4/EJ+HHJavsN3FQVy8RlpLf/faoTOHO2Ss/ZjlbDne/HEuzkP6CWt1ItKLDiq5iGp/XlkcrPKXEWDqWbDSn6wzA+QKwewjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=RBBc0BQB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa689a37dd4so58516966b.3;
        Mon, 06 Jan 2025 04:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1736167607; x=1736772407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz42IBrwOfer+ckm9ddHgu1Vc8KST+/R44aEcDOIDp0=;
        b=RBBc0BQBJt9b2mCLu2q8tAUrq/L9m0y9ALNS/2DHLQ791QRqhwV+D6newxWUiBFwaR
         XznRLzgq33BF9XtZi5E+LQ2v8VB9VMTd8F7YweMXl80j9RS910TMw9RHN8lDx3DbMqay
         OcThYOB/8bW8ph8umGSBGyFZUNphFjNyO4wqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167607; x=1736772407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz42IBrwOfer+ckm9ddHgu1Vc8KST+/R44aEcDOIDp0=;
        b=eVhrD5KglBc6d7G/KZUr3LgJfjnUi6rShNQRNjVxO9Kv8h1CnqJsFizS+v23ER08k3
         1L7b/+cJSyc8bgd6N5wpyezo/wAh5IlY7+fUU77f3jCpjcBg/jLhuXGOdeY3txHG9nlZ
         Yqm6gOpyz6SQ/QZNrBjvVebjFdBe/SL6jjhS7IY+CocrC2G/OgCibxVsx9KVYZ+m/t5g
         IaG3cWa9teB9YDwKGz8O45Uw9VyEAJbux8C2areyBj4PDjUrzMFFP7iDOb6jeqVRDxnj
         NngZhuPp9erAp0HAisHJHjqEOgXQO8GDxXgroMfXJ8JlbBhxQ+a7VDMI+6fOEF2ZOk2P
         cOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQy2uTtL/pQf2Q2Ms67rQ+Qv7i3ETFq4QCga0FgzrEFr38f2XOmvU0SDZ4W30YCpgoqqJgD9lvWGd9bCVh@vger.kernel.org, AJvYcCUtEJI8gBWyYnv6ETDF5wrv59LeswaR6kkISAMgIVrTn2d4TwwBH16n2Agp8zwFP8RIegGtigkW72qzqfzIuQ==@vger.kernel.org, AJvYcCV2vzfV+HskTUHppSe3mLUveRPXN6+eQDEy7TAO3qEe+sSulUwoZmJnjD6H7vwwb9JsRlIk9leBSDstibg=@vger.kernel.org, AJvYcCVxwLn7Ckq5tuJ/S+mvkc+8H0DK6K694yT/dhuGNXUT41Ifv5tNoA/jR2Eple+TLT0ZkkYtcES/q2yf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3o8BBzt7hlntEBM4NZS7xd+wK1KrZbIpXbgUfjgRBGNxugxpB
	hmwxIdo5gNbuFxHmDPq0Q0KXHjWTI+wkKNrbJvFxJbe60nYUy0hg6+eECAO+NhJrdpnAkS7iXEN
	W5FpNDHS+0EiRz5Pf7ddnn72x2KY=
X-Gm-Gg: ASbGnctZtHuZ0eGNhGJiGcp7gvJkiOg0DnFMDS5jU9nPu4NLB7YfQ5adsmVaW/LEY/R
	cqR/6JhHjyzzxBVf/m7daVeQfh0LXFZf7ztAp3g==
X-Google-Smtp-Source: AGHT+IGlP0bpV0TDLEa+rk0yK2xbrtzqOhM8iXoDP3Nn8Vs+8ciwfsuvGDoUaoMFfDs2kgdtY83+te9BE9KQANQheVs=
X-Received: by 2002:a17:907:7da7:b0:aac:941:de26 with SMTP id
 a640c23a62f3a-aac27028263mr4119267966b.8.1736167606570; Mon, 06 Jan 2025
 04:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com> <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
In-Reply-To: <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jan 2025 23:16:34 +1030
X-Gm-Features: AbW1kvY3P6S6nb91DFz4WoLqek9eDWvGIXGg_BSyD9hRTvXaD6W8lKh-ti7z4Ug
Message-ID: <CACPK8Xegvq4Frc+Lmzd0CrBVKpmaA+agxKBMPc29Y3LFVRVLqw@mail.gmail.com>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, jgg@nvidia.com
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

On Mon, 6 Jan 2025 at 23:06, Joel Stanley <joel@jms.id.au> wrote:
> I tested this on an x1e based machine, a Surface Laptop 7. I had some
> errors with loading the firmware which triggered some warnings when
> trying to tear down the driver. I've pasted the WARNs at the end of
> this mail.

It might be new behavior triggered by this series:

https://lore.kernel.org/all/0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com/

Your allocation:

        queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE *
IFACEQ_NUMQ)), SZ_4K);
        core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
                                                    &core->iface_q_table_daddr,
                                                    GFP_KERNEL,
DMA_ATTR_WRITE_COMBINE);


and the free:

        dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
                       core->iface_q_table_vaddr, core->iface_q_table_daddr,
                       DMA_ATTR_WRITE_COMBINE);

So probably your bug, but hidden until Jason's change caused it to WARN.

> [    2.587909] qcom-iris aa00000.video-codec: error -22 initializing
> firmware qcom/vpu/vpu30_p4.mbn
> [    2.588095] qcom-iris aa00000.video-codec: firmware download failed
> [    2.588250] ------------[ cut here ]------------
> [    2.588251] Unmap of a partial large IOPTE is not allowed
> [    2.588256] WARNING: CPU: 4 PID: 659 at
> drivers/iommu/io-pgtable-arm.c:649 __arm_lpae_unmap+0x3cc/0x468
> [    2.588335] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
>          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> [    2.588338] Tainted: [W]=WARN
> [    2.588339] Hardware name: Microsoft Corporation Microsoft Surface
> Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> 160.2.235 08/05/2024
> [    2.588340] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    2.588342] pc : __arm_lpae_unmap+0x3cc/0x468
> [    2.588344] lr : __arm_lpae_unmap+0x3cc/0x468
> [    2.588345] sp : ffff80008259b690
> [    2.588346] x29: ffff80008259b690 x28: ffff80008259bc30 x27: ffff80008259b8f8
> [    2.588349] x26: ffffb973346978d0 x25: ffff68590225e7f0 x24: ffff80008259b8f8
> [    2.588351] x23: 00000000dfc00000 x22: 0000000000001000 x21: ffff68590396ce80
> [    2.588354] x20: ffff6859068fa4f8 x19: ffff6859068fa480 x18: fffffffffffef6a8
> [    2.588356] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> [    2.588359] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> [    2.588362] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> [    2.588364] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> [    2.588367] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> [    2.588369] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff68590bc25640
> [    2.588372] Call trace:
> [    2.588373]  __arm_lpae_unmap+0x3cc/0x468 (P)
> [    2.588376]  __arm_lpae_unmap+0xf4/0x468
> [    2.588379]  __arm_lpae_unmap+0xf4/0x468
> [    2.588381]  arm_lpae_unmap_pages+0x70/0x84
> [    2.588383]  arm_smmu_unmap_pages+0x48/0x10c
> [    2.588385]  __iommu_unmap+0xf0/0x1c0
> [    2.588387]  iommu_unmap_fast+0x10/0x20
> [    2.588389]  __iommu_dma_unmap+0xb8/0x2c0
> [    2.588391]  iommu_dma_free+0x2c/0x54
> [    2.588392]  dma_free_attrs+0x9c/0xc0
> [    2.588395]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> [    2.588399]  iris_core_init+0xd8/0x138 [iris]
> [    2.588401]  iris_open+0x3c/0x318 [iris]
> [    2.588403]  v4l2_open+0xa8/0x124 [videodev]
> [    2.588406]  chrdev_open+0xb0/0x21c
> [    2.588409]  do_dentry_open+0x138/0x4c4
> [    2.588412]  vfs_open+0x2c/0xe4
> [    2.588413]  path_openat+0x6fc/0x10a0
> [    2.588415]  do_filp_open+0xa8/0x170
> [    2.588417]  do_sys_openat2+0xc8/0xfc
> [    2.588418]  __arm64_sys_openat+0x64/0xc0
> [    2.588420]  invoke_syscall+0x48/0x104
> [    2.588423]  el0_svc_common.constprop.0+0xc0/0xe0
> [    2.588426]  do_el0_svc+0x1c/0x28
> [    2.588428]  el0_svc+0x30/0xcc
> [    2.588431]  el0t_64_sync_handler+0x10c/0x138
> [    2.588433]  el0t_64_sync+0x198/0x19c
> [    2.588435] ---[ end trace 0000000000000000 ]---
> [    2.588438] ------------[ cut here ]------------
> [    2.588439] WARNING: CPU: 4 PID: 659 at
> drivers/iommu/dma-iommu.c:841 __iommu_dma_unmap+0x290/0x2c0
> [    2.588497] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
>          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> [    2.588499] Tainted: [W]=WARN
> [    2.588500] Hardware name: Microsoft Corporation Microsoft Surface
> Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> 160.2.235 08/05/2024
> [    2.588501] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    2.588502] pc : __iommu_dma_unmap+0x290/0x2c0
> [    2.588503] lr : __iommu_dma_unmap+0xb8/0x2c0
> [    2.588505] sp : ffff80008259b8f0
> [    2.588505] x29: ffff80008259b930 x28: ffff80008259bc30 x27: 0000000000020100
> [    2.588508] x26: 0000000000020100 x25: ffff68590bf76a08 x24: ffff80008259b910
> [    2.588511] x23: ffff80008259b8f8 x22: ffff6859113cd260 x21: ffff68590bf76a00
> [    2.588513] x20: 00000000dfc00000 x19: 0000000000001000 x18: fffffffffffef6a8
> [    2.588516] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> [    2.588518] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> [    2.588521] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> [    2.588523] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> [    2.588525] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> [    2.588528] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [    2.588530] Call trace:
> [    2.588531]  __iommu_dma_unmap+0x290/0x2c0 (P)
> [    2.588532]  iommu_dma_free+0x2c/0x54
> [    2.588534]  dma_free_attrs+0x9c/0xc0
> [    2.588535]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> [    2.588537]  iris_core_init+0xd8/0x138 [iris]
> [    2.588539]  iris_open+0x3c/0x318 [iris]
> [    2.588541]  v4l2_open+0xa8/0x124 [videodev]
> [    2.588543]  chrdev_open+0xb0/0x21c
> [    2.588545]  do_dentry_open+0x138/0x4c4
> [    2.588547]  vfs_open+0x2c/0xe4
> [    2.588549]  path_openat+0x6fc/0x10a0
> [    2.588550]  do_filp_open+0xa8/0x170
> [    2.588551]  do_sys_openat2+0xc8/0xfc
> [    2.588553]  __arm64_sys_openat+0x64/0xc0
> [    2.588555]  invoke_syscall+0x48/0x104
> [    2.588557]  el0_svc_common.constprop.0+0xc0/0xe0
> [    2.588560]  do_el0_svc+0x1c/0x28
> [    2.588562]  el0_svc+0x30/0xcc
> [    2.588564]  el0t_64_sync_handler+0x10c/0x138
> [    2.588566]  el0t_64_sync+0x198/0x19c
> [

