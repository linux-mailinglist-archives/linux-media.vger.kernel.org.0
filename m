Return-Path: <linux-media+bounces-25437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F02A2315E
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 17:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BF03A6B92
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 16:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9867F1E9B32;
	Thu, 30 Jan 2025 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jlmdsHqM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846451E9B23
	for <linux-media@vger.kernel.org>; Thu, 30 Jan 2025 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252801; cv=none; b=WRsuT7lsK5W5G0ryiURLBPQH1+H4g47ev6yAEpDT8vTbu39uimhPSwzJQX4TIbeD/ZE8I4ucHrnMlKg4OrfgqX9FcPpj43TqZwlY9zfv7BqcOaXpR5FzxMhnCylm6hfeekN4BtoDwEK2+di28luNtj1qicAZq3d3+YrE3AkMGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252801; c=relaxed/simple;
	bh=ngWQPRETD9N17bAwKGrksUnr574UVGVFHxMohMEaErM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9GkqIc6f9uuvW048J075OFs89xNo7cNJSeDkmxIbulkB2t1rniK+OM7D5Za/IoSJqAi9jd0MGF1grxVn9swWODd7EYEdgsYONHp85yDWBuHNNXWVNj1Bb1RwTaoZ7nBoMExSbL7dQhjB3oBMovzIL+ATWLhphVJrzHzsXvkqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jlmdsHqM; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f0afda3fso115279385a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2025 07:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738252798; x=1738857598; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vrukcyab91NQAAPHSNd07R2nM2xtss7X+LvbFgz2NCI=;
        b=jlmdsHqMk2JPh+LrItXa+q0NpMCbv/Ld3CngfnQH6EnRZD9ma6FNG+WnkfrGq2+fGU
         kjlAKK+M8J5Pz9/wDMeqBB1htfO8S8WuiAinYOApE4mLCXEfdZmttzhtOfbBecwX0Tq8
         Z+AjNjZyCCSWCooCM3/PYL/4uh7Qk1sFG8HCwnS0zrcbwEoUqDJSEJShQ2SHXBUuE/0u
         jzBQj53gAHhSv8zTCMBgLhaiaoMrQEkeYX0oUonNZ7yjaKQ1m44F2EbSJQQlq3hNQWrB
         258j1cyrVr1RGdsgJZHKmMkweclF5IBClM2iVo0kCYr1PT+QGkW08jO3Eqz8yeeVOfxB
         eSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252798; x=1738857598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vrukcyab91NQAAPHSNd07R2nM2xtss7X+LvbFgz2NCI=;
        b=ehHSscaDhYqT9BqVnpita5B4xHXC5/ZD2YPAYbKvK8Jt4lvRE10nXRDxLEWnkaxRBV
         j0RrTxQdkphr20ywP2Yk9s7MBAQkQnUz4MPjD5M2wCokBqvV7a568PFipQ6IYJVFrhko
         BIDcu0l7Gl8hjVhQ7jREUj+Jg2Ph92KzIa2fDzT+9nAk6yEojptuF/6+V2aTrd27pAxg
         THcMVfMeIG2w8BdDXJGc5LJx9oi4ei6XtXWQv26CwbYVppKk3coCcext/0/izyVNvziw
         iCK2tvpjyi0/Qlbrn+RU3qqu9wY5vjyDuI61KE+rCtJwIv7sxwB7NNs9G5dKuFG+asO7
         Z/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwso60THC+f2SX3nRbEXuxOqZDZEtjNV04UPS6oloXfBQQvQlXgIczmzppGExOW6AFuBiSbWv4bIAQyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHpV2mGjjz4JOw0CI4vzM7cmZnPKpcR5XRFBj7vG2gCuuTg98j
	I8fXdijtOLKAZ1bEcbqdjN9TrbmkcP3MlYDO/86Diq6Thc743EzH2Q9OXPwSah0=
X-Gm-Gg: ASbGncvBD6+7gXyeV+lBt1gjiMSFgxw2idkrLoet5DyM2B3NdABHK+YRrMxXsA1d0J6
	B42Em1ar+2PjN1aEH3koEsOBd40Ygy0xyZz/R+Vqz3B9BBjt1Q3zBbJSfYrLa4tc9c44UUDfPuR
	WkTgtIiQ9Zo4FohU8WN4VA7YQx2MXwdkQ8VsJoxNc3CCWnt/0TBkAjPwVA+PCxT7NPieg/03pcj
	KAX0uUsOGlenQ5ofvfrviH3KZDqJyEnFMOZL8HC+LI5x6Az4F74yGwGEVKxQ8iszdhgOSoR+AWb
	gKKHP007diXaCUFG
X-Google-Smtp-Source: AGHT+IHjdyr1ZGxcyMCqDyCVkI8EVFcDwH70UC+E+hsL30A1qjTpY04odV1a3HSLhMUSwyh/u08bDw==
X-Received: by 2002:a05:620a:44ca:b0:7b7:342:a0a5 with SMTP id af79cd13be357-7bffcda883bmr1361614185a.55.1738252798246;
        Thu, 30 Jan 2025 07:59:58 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d14asm85504285a.104.2025.01.30.07.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:59:57 -0800 (PST)
Message-ID: <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>, Florent Tomasin
	 <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey	
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Date: Thu, 30 Jan 2025 10:59:56 -0500
In-Reply-To: <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
References: <cover.1738228114.git.florent.tomasin@arm.com>
	 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> I started to review it, but it's probably best to discuss it here.
>=20
> On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > Hi,
> >=20
> > This is a patch series covering the support for protected mode executio=
n in
> > Mali Panthor CSF kernel driver.
> >=20
> > The Mali CSF GPUs come with the support for protected mode execution at=
 the
> > HW level. This feature requires two main changes in the kernel driver:
> >=20
> > 1) Configure the GPU with a protected buffer. The system must provide a=
 DMA
> >    heap from which the driver can allocate a protected buffer.
> >    It can be a carved-out memory or dynamically allocated protected mem=
ory region.
> >    Some system includes a trusted FW which is in charge of the protecte=
d memory.
> >    Since this problem is integration specific, the Mali Panthor CSF ker=
nel
> >    driver must import the protected memory from a device specific expor=
ter.
>=20
> Why do you need a heap for it in the first place? My understanding of
> your series is that you have a carved out memory region somewhere, and
> you want to allocate from that carved out memory region your buffers.
>=20
> How is that any different from using a reserved-memory region, adding
> the reserved-memory property to the GPU device and doing all your
> allocation through the usual dma_alloc_* API?

How do you then multiplex this region so it can be shared between
GPU/Camera/Display/Codec drivers and also userspace ? Also, how the secure
memory is allocted / obtained is a process that can vary a lot between SoC,=
 so
implementation details assumption should not be coded in the driver.

Nicolas

>=20
> Or do you expect to have another dma-buf heap that would call into the
> firmware to perform the allocations?
>=20
> The semantics of the CMA heap allocations is a concern too.
>=20
> Another question is how would you expect something like a secure
> video-playback pipeline to operate with that kind of interface. Assuming
> you have a secure codec, you would likely get that protected buffer from
> the codec, right? So the most likely scenario would be to then import
> that dma-buf into the GPU driver, but not allocate the buffer from it.
>=20
> Overall, I think a better abstraction would be to have a heap indeed to
> allocate your protected buffers from, and then import them in the
> devices that need them. The responsibility would be on the userspace to
> do so, but it already kind of does with your design anyway.
>=20
> Maxime


