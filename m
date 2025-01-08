Return-Path: <linux-media+bounces-24463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE7A062CD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08523A7488
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 17:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E8B1FFC44;
	Wed,  8 Jan 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NbR3NjGC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AFE1FFC79
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355622; cv=none; b=ZWDTm6RaQRoNXU22Rxz1rA7OhuYh/5XTtZgIY0jTmJ5GyG1MwvtK+PV1gvHeuk4RQQICqXKi+Nb9vDPJDL+TwAAMtp8++xqlhNoPhjczwi9H2JA9E3v+Zyh0luadTA7i9xn8LINkz3Se8MKg75bF7XbthOqf+s+QrB04Dd2YGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355622; c=relaxed/simple;
	bh=KNTKwpTDOBZ3JvxA89xfYdEmAIKDz73xnLGpVRdxu80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8/ycVVGQxpV5bZoEotJcCfEvZlyNbJsqIU+WpP3Qqv32quPfandKMNwJGNyhVs33hfXIGwU45ROXFCbXJed67DGEbWZMiWbkf6O9uPrwP5A2xP9Eloq+InxeWUslU1i5Lx7EIWad8FsTbdPq+qYwIOZh8AdpGhSVW1oZqbHwR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=NbR3NjGC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso481855e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736355619; x=1736960419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
        b=NbR3NjGC7tnEi3Tyk1y10ipWrRN+0QYhGfCJreR2JugpeZkt2jgyH3Xp4KJM8BvgwT
         ZzvZLsQFRkaW1aHCggXEUPAzjcZxNmscT4eXNdjT4BTfOwrk9dg5qJPuRolliQQfKqRy
         Y7/3xcXlp+Wq680LgYKdX46ce/DXHLF4EZgq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355619; x=1736960419;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=max4o05U6BdkP5TJyZsv6kGDcb+vMqaGNhBvv2OXqQk=;
        b=e6H3Cb8KMA7/P6p8Jg7zyfI+sqPm+JG5eCJvG96criLVkEfpGt7ASMRVOL+xRLxXHf
         uB3/fUy792X5K5eHOOWY8Pyqh6+Val3AHM8PY82TDJQtcONvmTTAQtdNpYEe4mJUoFWa
         qTwNf8TZKstVnR4pg9AM8htiiDztGWu7Irwqfu/yXNBVbOYgopMYGwgVNNwHVje9CSbX
         jF84hGeWhTw9vsnkVJ64A8o2nN+Wgv50ump1jOz6W7wkc1tpBPznPAwpQp/nAyJXrWRZ
         pJHhkAqAxq4HxD8ls4RJwxlpCgeSGPU0N4CnGUFxYtPQlnvJWMheDWTYZKMaYGoh+ocp
         8EFw==
X-Forwarded-Encrypted: i=1; AJvYcCV3G7lR64Yifr1fMWM8O6FG9+vVlnecTZxyUkM1wRStDlHOIvus3GjyvdyEqLu7Jq8MVafSz42VMxo34w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw486Dt5IjRYtB1yPiIxfM1BBP4HR8wsz4afca9SXmGdbVbANZx
	GUs+kSvSdjGwD+nOvgcp+sarwk0kRHkXMEKbr6vlcShqomABLaCshA1TCm+xaYI=
X-Gm-Gg: ASbGncuykfc8lHt5LYex7OJFwBSsW8CQqpLZyUQL3QdVFevdpph0PvnX25cpLyYJWfO
	B8Z6Q16WrCvSB1pk66pEl4FtLCByfTQjVgOnE7UMSDGbEziVSFuz4T6pyC6y7UxS5/zH5zn7t1K
	o1/p32mlXydOmgTpPBgXmKRCqLgbv97DzFwmBxaXkLHHRXoYkXo1SjGv370ke0Bm/1rl0yYa+Vf
	KSS9zNVc3PyktQ5aZsRDxFUvOyLqHaFYi2VoXs01VX2O2TDutoxQZwHPmK/ZUhuE8il
X-Google-Smtp-Source: AGHT+IFmXBbhRF/ktEnx5uywuanupMYlXu4JXUiqRvhVOlqL+e96UOlNBaIepmawU04+oF/ngviO2Q==
X-Received: by 2002:a05:600c:524f:b0:435:d22:9c9e with SMTP id 5b1f17b1804b1-436e26d0cf9mr31801485e9.19.1736355619213;
        Wed, 08 Jan 2025 09:00:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8287adsm52618501f8f.16.2025.01.08.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:00:18 -0800 (PST)
Date: Wed, 8 Jan 2025 18:00:16 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <Z36vIB-JrF5Ddhuf@phenom.ffwll.local>
Mail-Followup-To: Lukas Wunner <lukas@wunner.de>,
	Sumit Garg <sumit.garg@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <CAFA6WYMEjT5EAG3AL8NpbET6L=M86LBgnhLnWirvDZg9cUUiuA@mail.gmail.com>
 <Z209ZegsmgN1xlNG@wunner.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z209ZegsmgN1xlNG@wunner.de>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Thu, Dec 26, 2024 at 12:26:29PM +0100, Lukas Wunner wrote:
> On Thu, Dec 26, 2024 at 11:29:23AM +0530, Sumit Garg wrote:
> > On Tue, 24 Dec 2024 at 14:58, Lukas Wunner <lukas@wunner.de> wrote:
> > > However in the case of restricted memory, the situation is exactly
> > > the opposite:  The kernel may *not* be able to access the data,
> > > but the crypto accelerator can access it just fine.
> > >
> > > I did raise a concern about this to the maintainer, but to no avail:
> > > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> > 
> > Herbert's point is valid that there isn't any point for mapping
> > restricted memory in the kernel virtual address space as any kernel
> > access to that space can lead to platform specific hardware error
> > scenarios. And for that reason we simply disallow dma_buf_mmap() and
> > don't support dma_buf_vmap() for DMA-bufs holding TEE restricted
> > memory.
> 
> The API for signature generation/verification (e.g. crypto_sig_sign(),
> crypto_sig_verify()) no longer accepts scatterlists, only buffers in
> virtual address space:
> 
> https://lore.kernel.org/all/ZIrnPcPj9Zbq51jK@gondor.apana.org.au/
> 
> Hence in order to use buffers in restricted memory for signature
> generation/verification, you'd need to map them into virtual address
> space first.

Nope, you need to get that old api back. Kernel virtual address space
mappings for dma-buf are very intentionally optional.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

