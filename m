Return-Path: <linux-media+bounces-24391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE73FA058F2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 12:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD56F165A5A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BD41F8ACD;
	Wed,  8 Jan 2025 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8BWf23R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC641F76D0
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334017; cv=none; b=mfjgNy8hpfw84DHjiRxYkBUjNTRCMVWynKYEzG5ZOII80pPT7o9TUiqh8E0Q2AG2Jx7XNW3G7IoFQVcMAiYL3xUcrbndH5bgzctjxRwSKJe7+2xLOlSKXimr1Waa3/MLhfkeARoUU5393fX9Yo0h1S02wYgvPQkJ+yaCmp83eps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334017; c=relaxed/simple;
	bh=LF2lbLgvcsmaFo8LoKT4DKYGSuRn7fzpE8zvhGlOpBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5KGLKuZboXomJdKs9oL5YqcZ3BaLCtFjlMJlrJZeYPvUaLsH3tEdwctiYzRqFRzL0LR8zsCNXWXX84BgjSFewzSFT7nvMr1pnL0N10/b7gAB/67wsBEplEfPhpP6gufQ7E999gRTVvDPWDtcn+to1ThdWwkQOqHyx+kslguU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8BWf23R; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540215984f0so17130770e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 03:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736334012; x=1736938812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJZqL1EDZYn+FiOs0fUYdrSqp+t3JhMgJKZR/+XMSls=;
        b=f8BWf23R1bGX9mmnouE244cSsCATTMRVTM0vpmlx+cVK3yf3rjYsQp4ngcrwrwtQfj
         8oV6lIqOnc1YFN+F65ptVHcWK476sfjBU4+Vt7ZYaBU2eWeonWt5V7PYzg10O5FPweWn
         AP5lorlvps1UtmnMxLjB+d0LyM897lMNnv8LLUAcoKr9zeRDSsVmLfWCsBBSMHj1AsQp
         DQ4ERVDfQnqWnGQT38OLobadQBibhHylQLEgRaWr4bj0dj7oPoBNICnOjzyG0DOzSjm1
         JkL3DYIeuwt2liUjLMH/MulUwk1DrLn85L2ZHnyCYcqtpWXddb4urR+N8oidw74l/6Ur
         Z0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334012; x=1736938812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJZqL1EDZYn+FiOs0fUYdrSqp+t3JhMgJKZR/+XMSls=;
        b=aX7jwKcevEY0vdTVP8GdwRUCzcESrsWC11hSgZg0mHftq3IyL8C5oYkuFeGf/DJJjE
         PcUIJt9yJ2NGmScCzYPs77v023SKSj2uBijN7rdM5HK86hqJSp1ESuikiuK3nH3AANKc
         hr183o+f62fCx5JPopp5FD5ZH1x5q7CgMzFyFXENMOGz2c5nVON/Bf63YWk0qQ4LRmUr
         pOVUgmiM3KNnCYT2MbeMfvmspINMrVX8YAcyCSsOcpk5WCQbCw3JwCa92wMCxKBKMucy
         mZ1RUuTtln/fHbtuQS7PVVu4O5UrtJESUR51ER5CVoJFbS3lEfpGenkzKUHuenFxbQ0m
         aKkw==
X-Forwarded-Encrypted: i=1; AJvYcCVNB2wEDaYierVTGxoUmXbd2z9Yz5Fro5r2T8y3LqrcgPSYdSJ7sw4afE4avC+YOa2mcYGh4LxtJ4f9RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cGNDDB7KRa93OuUEP8YnznZ0lIbqgt1D9well+k4HgalRIDW
	pbISMrSsUFTkQTCnj90kewe5VnsA9I/3q/huPPpwC9ON6rqM4Qe73jGaPMQ3xkI=
X-Gm-Gg: ASbGncuAZnhmyr9R0TUUCeQgxKgfhP54nBGtp7Zdmh7xk94+ajpATRX+nOB35fY3R13
	DmqNecuWswG2X5wzk8QEGFkV1Zbc15oYXHGaAx/Nic6odvFVRZaGxGma+mMOm4N6YJdijNOynoh
	n2RHDtz48pX3yHN9YiTlxVvOJkBYHPG4VPmxFupDS0PADVe48cfb6fJsrxgK8p9ONn9tAytoSRO
	jAkymwzs4RI8PawFfmmPUrlY04oYJruYzqntJ2X7PRJYKZWaYp/3cb12dxnwG1YHZzp2Vz+2G/d
	4/eY4Eql9yTJmWLBEfUdAMnzCWc8X6VBeDTu
X-Google-Smtp-Source: AGHT+IHuqpPBE+7O+9hcwj/wkrvKk69MzeBS+hzPMcUTvHPcKd75EhBekQiCogVxmw+745xCxUyqfg==
X-Received: by 2002:a05:6512:a8e:b0:540:3566:5b37 with SMTP id 2adb3069b0e04-5428482fefcmr594934e87.57.1736334012340;
        Wed, 08 Jan 2025 03:00:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b06a47fsm65003461fa.86.2025.01.08.03.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 03:00:11 -0800 (PST)
Date: Wed, 8 Jan 2025 13:00:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
Message-ID: <gcj5scw7j3fr7pjzhedjmvx7bd6igny5q3pd5vxgwlz3hxccu5@ittc4iql72ri>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <CACPK8XeFbx_8mrvT4xi-WfQF+zHJYj1=EkH2tmnnxs1WThJ8ZQ@mail.gmail.com>
 <8c1fbbb2-0970-f102-c416-93c1b8ccfc82@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c1fbbb2-0970-f102-c416-93c1b8ccfc82@quicinc.com>

On Wed, Jan 08, 2025 at 03:22:49PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/6/2025 6:06 PM, Joel Stanley wrote:
> > On Thu, 12 Dec 2024 at 22:23, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >> Introduce support for Qualcomm new video acceleration hardware i.e.
> >> iris, used for video stream decoding.
> >>
> >> Iris is a multi pipe based hardware that offloads video stream decoding
> >> from the application processor (AP). It supports H.264 decoding. The AP
> >> communicates with hardware through a well defined protocol, called as
> >> host firmware interface (HFI), which provides fine-grained and
> >> asynchronous control over individual hardware features.
> >>
> >> This driver implements upgraded HFI gen2 to communicate with firmware.
> >> It supports SM8550 which is based out of HFI gen 2. It also supports
> >> SM8250 which is based out of HFI gen1.
> > 
> > I tested this on an x1e based machine, a Surface Laptop 7. I had some
> > errors with loading the firmware which triggered some warnings when
> > trying to tear down the driver. I've pasted the WARNs at the end of
> > this mail.
> > 
> > I was using the firmware from linux-firmware, as packaged by distros:
> > 
> > 4d2dae9a8187b728939e9c79fa68012b  qcom/vpu/vpu30_p4.mbn
> > 
> Hi Joel,
> 
> I tried again with firmware (qcom/vpu/vpu30_p4.mbn) available in
> linux-firmware[1] on my setup i.e SM8550 MTP and don't see any issue with
> firmware load.

Of course. MTP is not fused to reject firmware not signed by a
particular vendor key. Production devices are. Please test that the
driver works correctly if the firmware gets rejected by TZ.

> could you pls share from where you are taking the firmware?
> 
> [1] git clone
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> 
> Thanks,
> Dikshita
> > It appears to be signed by a test key, which I assume was the cause of
> > the failure. Replacing it with a properly signed version worked, and I
> > was able successfully decode a test video with ffplay:
> > 
> > $ ffplay -codec:v h264_v4l2m2m test.mp4
> > ...
> > [h264_v4l2m2m @ 0xffff500054b0] Using device /dev/video0
> > [h264_v4l2m2m @ 0xffff500054b0] driver 'iris_driver' on card
> > 'iris_decoder' in mplane mode
> > [h264_v4l2m2m @ 0xffff500054b0] requesting formats: output=H264/none
> > capture=NV12/yuv420p
> > 
> > Cheers,
> > 
> > Joel
> > ---
> > [    2.587909] qcom-iris aa00000.video-codec: error -22 initializing
> > firmware qcom/vpu/vpu30_p4.mbn
> > [    2.588095] qcom-iris aa00000.video-codec: firmware download failed
> > [    2.588250] ------------[ cut here ]------------
> > [    2.588251] Unmap of a partial large IOPTE is not allowed
> > [    2.588256] WARNING: CPU: 4 PID: 659 at
> > drivers/iommu/io-pgtable-arm.c:649 __arm_lpae_unmap+0x3cc/0x468
> > [    2.588335] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
> >          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> > [    2.588338] Tainted: [W]=WARN
> > [    2.588339] Hardware name: Microsoft Corporation Microsoft Surface
> > Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> > 160.2.235 08/05/2024
> > [    2.588340] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [    2.588342] pc : __arm_lpae_unmap+0x3cc/0x468
> > [    2.588344] lr : __arm_lpae_unmap+0x3cc/0x468
> > [    2.588345] sp : ffff80008259b690
> > [    2.588346] x29: ffff80008259b690 x28: ffff80008259bc30 x27: ffff80008259b8f8
> > [    2.588349] x26: ffffb973346978d0 x25: ffff68590225e7f0 x24: ffff80008259b8f8
> > [    2.588351] x23: 00000000dfc00000 x22: 0000000000001000 x21: ffff68590396ce80
> > [    2.588354] x20: ffff6859068fa4f8 x19: ffff6859068fa480 x18: fffffffffffef6a8
> > [    2.588356] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> > [    2.588359] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> > [    2.588362] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> > [    2.588364] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> > [    2.588367] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> > [    2.588369] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff68590bc25640
> > [    2.588372] Call trace:
> > [    2.588373]  __arm_lpae_unmap+0x3cc/0x468 (P)
> > [    2.588376]  __arm_lpae_unmap+0xf4/0x468
> > [    2.588379]  __arm_lpae_unmap+0xf4/0x468
> > [    2.588381]  arm_lpae_unmap_pages+0x70/0x84
> > [    2.588383]  arm_smmu_unmap_pages+0x48/0x10c
> > [    2.588385]  __iommu_unmap+0xf0/0x1c0
> > [    2.588387]  iommu_unmap_fast+0x10/0x20
> > [    2.588389]  __iommu_dma_unmap+0xb8/0x2c0
> > [    2.588391]  iommu_dma_free+0x2c/0x54
> > [    2.588392]  dma_free_attrs+0x9c/0xc0
> > [    2.588395]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> > [    2.588399]  iris_core_init+0xd8/0x138 [iris]
> > [    2.588401]  iris_open+0x3c/0x318 [iris]
> > [    2.588403]  v4l2_open+0xa8/0x124 [videodev]
> > [    2.588406]  chrdev_open+0xb0/0x21c
> > [    2.588409]  do_dentry_open+0x138/0x4c4
> > [    2.588412]  vfs_open+0x2c/0xe4
> > [    2.588413]  path_openat+0x6fc/0x10a0
> > [    2.588415]  do_filp_open+0xa8/0x170
> > [    2.588417]  do_sys_openat2+0xc8/0xfc
> > [    2.588418]  __arm64_sys_openat+0x64/0xc0
> > [    2.588420]  invoke_syscall+0x48/0x104
> > [    2.588423]  el0_svc_common.constprop.0+0xc0/0xe0
> > [    2.588426]  do_el0_svc+0x1c/0x28
> > [    2.588428]  el0_svc+0x30/0xcc
> > [    2.588431]  el0t_64_sync_handler+0x10c/0x138
> > [    2.588433]  el0t_64_sync+0x198/0x19c
> > [    2.588435] ---[ end trace 0000000000000000 ]---
> > [    2.588438] ------------[ cut here ]------------
> > [    2.588439] WARNING: CPU: 4 PID: 659 at
> > drivers/iommu/dma-iommu.c:841 __iommu_dma_unmap+0x290/0x2c0
> > [    2.588497] CPU: 4 UID: 0 PID: 659 Comm: v4l_id Tainted: G        W
> >          6.13.0-rc4-00092-g1bbe1a937cf6 #21
> > [    2.588499] Tainted: [W]=WARN
> > [    2.588500] Hardware name: Microsoft Corporation Microsoft Surface
> > Laptop, 7th Edition/Microsoft Surface Laptop, 7th Edition, BIOS
> > 160.2.235 08/05/2024
> > [    2.588501] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [    2.588502] pc : __iommu_dma_unmap+0x290/0x2c0
> > [    2.588503] lr : __iommu_dma_unmap+0xb8/0x2c0
> > [    2.588505] sp : ffff80008259b8f0
> > [    2.588505] x29: ffff80008259b930 x28: ffff80008259bc30 x27: 0000000000020100
> > [    2.588508] x26: 0000000000020100 x25: ffff68590bf76a08 x24: ffff80008259b910
> > [    2.588511] x23: ffff80008259b8f8 x22: ffff6859113cd260 x21: ffff68590bf76a00
> > [    2.588513] x20: 00000000dfc00000 x19: 0000000000001000 x18: fffffffffffef6a8
> > [    2.588516] x17: ffff685900b8c040 x16: 0000000000000000 x15: ffff80008259b248
> > [    2.588518] x14: ffffb9733457e768 x13: 6465776f6c6c6120 x12: 746f6e2073692045
> > [    2.588521] x11: ffffb9733457e768 x10: 000000000000030c x9 : ffffb973345d6768
> > [    2.588523] x8 : 0000000000017fe8 x7 : 00000000fffff30b x6 : ffffb973345d6768
> > [    2.588525] x5 : ffff685c75f4b848 x4 : 40000000fffff30b x3 : ffffaee941a6a000
> > [    2.588528] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> > [    2.588530] Call trace:
> > [    2.588531]  __iommu_dma_unmap+0x290/0x2c0 (P)
> > [    2.588532]  iommu_dma_free+0x2c/0x54
> > [    2.588534]  dma_free_attrs+0x9c/0xc0
> > [    2.588535]  iris_hfi_queues_deinit+0x70/0xa0 [iris]
> > [    2.588537]  iris_core_init+0xd8/0x138 [iris]
> > [    2.588539]  iris_open+0x3c/0x318 [iris]
> > [    2.588541]  v4l2_open+0xa8/0x124 [videodev]
> > [    2.588543]  chrdev_open+0xb0/0x21c
> > [    2.588545]  do_dentry_open+0x138/0x4c4
> > [    2.588547]  vfs_open+0x2c/0xe4
> > [    2.588549]  path_openat+0x6fc/0x10a0
> > [    2.588550]  do_filp_open+0xa8/0x170
> > [    2.588551]  do_sys_openat2+0xc8/0xfc
> > [    2.588553]  __arm64_sys_openat+0x64/0xc0
> > [    2.588555]  invoke_syscall+0x48/0x104
> > [    2.588557]  el0_svc_common.constprop.0+0xc0/0xe0
> > [    2.588560]  do_el0_svc+0x1c/0x28
> > [    2.588562]  el0_svc+0x30/0xcc
> > [    2.588564]  el0t_64_sync_handler+0x10c/0x138
> > [    2.588566]  el0t_64_sync+0x198/0x19c
> > [

-- 
With best wishes
Dmitry

