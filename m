Return-Path: <linux-media+bounces-29739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135BA82525
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DD7A1BA2D3C
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C404D25F7BD;
	Wed,  9 Apr 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mhh8uLQo"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ACE1D54E9;
	Wed,  9 Apr 2025 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202374; cv=none; b=VBdJhicV0SpPDBNAafT6+ihJ2O42wXO5sBWcSDGfcFH1cNiLyoVih6+j1gUztlL7bQuB9w4gLhgiYNiSmBtvsz+ELcTEjgDOQFRx4gnrQY2qInbjffPDZ3OOjqyssmLXRxytdR7tpW7EUxzA/37twwGQmOOnClBbtzmql05gRfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202374; c=relaxed/simple;
	bh=aC6H39PURz2QUDBngdSNG8br7W7dWUtEUshtsY93R/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTyfOiklWtY2s0kPqwP17QzIpPlVRU4RYrXMiuDNgPdO1KSKKB8vR9+ToB+eLKPj46ZGUvuBBRJs6HE5xkbGnDH5slvy++g9IaDFLEr3RDU+5isXcHx87WLQlKaZOn8S+xqmIs+ACScdiwkIxuc7o0vzG60f3oCvx93biFNax3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mhh8uLQo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744202364;
	bh=aC6H39PURz2QUDBngdSNG8br7W7dWUtEUshtsY93R/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mhh8uLQoI3p3NNc4h7btWWNPb/fPy5xOET+3hALsZt+ufJ4VFnK9G/jPiONDxABjH
	 dhWA3dafoDcKauF+CcDNtzT/SBKik+arVAnRq3kS1rOGn7bkWdrrC39MjxiRJ0/l50
	 p9wavx10I8fwQ9SpVKQtq8AxRo5Y4k1ve2FmCmntqe+mN2J6tEXEsz23B5IHBeNV4g
	 hU6UO19UaYAxApKhvgEBfvbzdLYXBVDolm8+4Ld5uFSC2WzXJl0M5Hm8YHliW08bnb
	 vKihmoVf+K5z6XRc1ZYWdqZMUAkSUeecLllqA2v42v9a9MqJB2MId+V6b4UzVnzNzV
	 TTgvxp3dqvmHw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E67717E0702;
	Wed,  9 Apr 2025 14:39:22 +0200 (CEST)
Date: Wed, 9 Apr 2025 14:39:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Matthew Brost <matthew.brost@intel.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Melissa Wen
 <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Zack
 Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Bas Nieuwenhuizen
 <bas@basnieuwenhuizen.nl>, Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Tim Huang <tim.huang@amd.com>, Sathishkumar S
 <sathishkumar.sundararaju@amd.com>, Saleemkhan Jamadar
 <saleemkhan.jamadar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang
 <jinhuieric.huang@amd.com>, Asad Kamal <asad.kamal@amd.com>, Srinivasan
 Shanmugam <srinivasan.shanmugam@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <mdaenzer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
Message-ID: <20250409143917.31303d22@collabora.com>
In-Reply-To: <20250409120640.106408-3-phasta@kernel.org>
References: <20250409120640.106408-2-phasta@kernel.org>
	<20250409120640.106408-3-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Philipp,

On Wed,  9 Apr 2025 14:06:37 +0200
Philipp Stanner <phasta@kernel.org> wrote:

> dma_fence_is_signaled()'s name strongly reads as if this function were
> intended for checking whether a fence is already signaled. Also the
> boolean it returns hints at that.
> 
> The function's behavior, however, is more complex: it can check with a
> driver callback whether the hardware's sequence number indicates that
> the fence can already be treated as signaled, although the hardware's /
> driver's interrupt handler has not signaled it yet. If that's the case,
> the function also signals the fence.
> 
> (Presumably) this has caused a bug in Nouveau (unknown commit), where
> nouveau_fence_done() uses the function to check a fence, which causes a
> race.
> 
> Give the function a more obvious name.

This is just my personal view on this, but I find the new name just as
confusing as the old one. It sounds like something is checked, but it's
clear what, and then the fence is forcibly signaled like it would be if
you call drm_fence_signal(). Of course, this clarified by the doc, but
given the goal was to make the function name clearly reflect what it
does, I'm not convinced it's significantly better.

Maybe dma_fence_check_hw_state_and_propagate(), though it might be
too long of name. Oh well, feel free to ignore this comments if a
majority is fine with the new name.

Regards,

Boris

