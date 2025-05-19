Return-Path: <linux-media+bounces-32848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AEABC8F2
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 23:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553D61B61706
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DA32144CF;
	Mon, 19 May 2025 21:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSiHz0E8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AE44C94;
	Mon, 19 May 2025 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689348; cv=none; b=WLEgDM/bbbtLwpOPFcSFG9Ii9Zp/CG8y7aB4WvpH1b0KLCR/On0+Y21mGNOyNn8K32DNr9UabwvikL6OgAsBlWe0s5ToVa/ESBXvgk3qwP2UJU1U4unKztwXShdM1ajk0n3Apnv2rkfz0Qv6EA90KijM+uJPkVBkF/4vAhoXKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689348; c=relaxed/simple;
	bh=muFhmXyLo0DEmnYrqAEiQ7Yzh6caV+km2177Wl6cRao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLt7ApGNa19ssbx1BwQsP0SE1De91mw+IAXez1dZw0szRuvmSTRaQ5NjbFcEql7KkEw0H+R8P6rhUUkXu8AIq+rptMaxEEqcALBIP8+hqIFowxyFTJpe8z9P9MUO/BTzmRWR888zeaROLitr+zdgqlzzk5i2lDNbgddTFFCmfkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSiHz0E8; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-601dd3dfc1fso3611259a12.0;
        Mon, 19 May 2025 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747689345; x=1748294145; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfCxvNrNXH6YMvxiBWl55URv30Vk5ImyK9KqXeiCoPg=;
        b=HSiHz0E82U1H/9bMs2aAg566Uoa1j6/eUyWq6VGF2en6q6VP+zvLDVAicDcDgXtnj0
         rZws/VnZXT7TkNTTSL3bq9vjIimpik7ztB36OTORvhKm5XMYRBzaHxRtxQRlf6ocHqId
         FUle8tpeR81j6G47MkZCGsAXQCrph/2IKOnaCWJDHIbyg5F15k6QK7dppLNFVzex//7G
         NWv2HzgYEcVPUQCyDFk4bhF6JqY5/Si/aV9iOYn9/OIPPH4BvEwoXb5uREAEZt+h4A2g
         Ry29oGQ6TNsznpfxO26zCSP4/F/vSp1os10EZClxowQdBK6A7u5beXPcGd0rGbl08bVV
         hy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689345; x=1748294145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfCxvNrNXH6YMvxiBWl55URv30Vk5ImyK9KqXeiCoPg=;
        b=Zt/ZQwdEERZVE3B1uATANXg1WrL1LrKNU/I/gdTwKkOX55LhBxU68jupLOLTt2CtrM
         48SzZQsHdbPicN5tXRN2A8byIjJ/ubZjzDD04I6Yp2rAC0dHySMgwa2jWLDuWCqDyumS
         cgf5XkJhsVj7ygYoRpfltosI7TnZ8cLYSEw68dXwZeUtQTMa/q4+NH3tGdSlU0gSzZtK
         h0H8sFwYZ12/z6kxXC06XM3xxMjeKa8ZPwfz0/AWNwrXCny6uJ/IXaQirxv9+ia+rHwK
         psGLtouIsBJX+5jFd1gcxMgUUYZoudIvLU6AQT+XNK9wg3ii4qZbe/Jv4RjfHsEB/+Qn
         QQng==
X-Forwarded-Encrypted: i=1; AJvYcCUR1M1Wryg0pvQqqFzB4rO+O+x8AfwrvLqJZPbwtyjtSFyuBg43MzhH7aCGw+7f0ioTGOXljZRzhnsq+XY=@vger.kernel.org, AJvYcCVXRm2oqU3oI2GzKTj5VBuywl1rrnHQpWiZ6khDMimIlZytrYFnYQLXXywIWR/Yq/R1brdUe2mG1I/eixNW@vger.kernel.org, AJvYcCXYn3WikETmHd20iX8ZqAhe09Ej5Wqdam1XvdssJVCBzyva5Ha3eb5LUChZInmkfRpef4kzIyFEQTnqo20c@vger.kernel.org
X-Gm-Message-State: AOJu0YxOg5MHJyO5Y9XGTJPrVXWujWGgZ8CyRPzcWeP2qc4gyjvfl+Xp
	Qspjw1M1TvySdaJwy8vhf1Xp8ZdpHQEBs1QpyNasqSJI4CgqfGn6S2YOo4T8N1eLSkCnwP8K5N0
	y3De0CZpmy8dJBID9s8vpaloGCFcRUHU=
X-Gm-Gg: ASbGncuuMbAXPHUDuaMkK/dSDDsGIG3vKZI9VxdY0C5WTc8E08WTutcjxrtloBDFEMd
	eOPYslJYD/bGR2O8YrhHAA9dFTWPj5/pOIwBeT0G34JUHOwPe3kdNMGE5jXAH+shi1X6njtcBug
	BaScPjHMaz9ffnbbr5BKvUR6JNrwqg+xI=
X-Google-Smtp-Source: AGHT+IEdHJ5TsiYJUOSilPNO+z3JABvgvB65Ct1aB4PjJ2fABaDgZlQuvx2XmPkklIghfrLSC+0u0HMeQGgesMbdSWY=
X-Received: by 2002:a17:907:94d0:b0:ad2:2949:bdfc with SMTP id
 a640c23a62f3a-ad536b7ca51mr1349013266b.3.1747689344467; Mon, 19 May 2025
 14:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com>
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 20 May 2025 07:15:32 +1000
X-Gm-Features: AX0GCFs4JnXwsJdajW1l7s7toaeaNTWjF5f0e497pSZ8wodPL0eA75PFrE0O5i4
Message-ID: <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Christopher Snowhill <chris@kode54.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>, 
	"m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
>
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>    MAP_NULL/UNMAP commands
>
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
>
> I did not implement support for synchronous VM_BIND commands.  Since
> userspace could just immediately wait for the `SUBMIT` to complete, I don't
> think we need this extra complexity in the kernel.  Synchronous/immediate
> VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

This seems suboptimal for Vulkan userspaces. non-sparse binds are all
synchronous, you are adding an extra ioctl to wait, or do you manage
these via a different mechanism?

Dave.

