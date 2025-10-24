Return-Path: <linux-media+bounces-45491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F2C060F1
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B11C5657CF
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6166313E29;
	Fri, 24 Oct 2025 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hds0sijd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AD3128DC;
	Fri, 24 Oct 2025 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305670; cv=none; b=ZujbkTrnuXGzIV8uH0LLDYk9GDk2cjcJi8LPrAWUsNM8RlR3DXxiKBpKBIHyXOZza9qIETxV5lSywAaq+eIVLiyp3DW8HKkiNR9Xp4luHp0qSPmwLlaOPlp4P+GS1+MpjeZHbhLlfaMuZcYNYOLyz2MpmY+7u6kEg1vdp8W+KJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305670; c=relaxed/simple;
	bh=C2071/4y7/j52Jeu+ERq03SVVMZ5dIN9u1f1mb/b9vQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=R9stG/lmXJdsXHGgKia+oTkvUI4izzLltEX1pw82UMgWBX3jOp4SYKyGSPeP/65vIbg8ObE+Pv/PU000ZJl0YndCG5mvIRdT3H/PBILDTauoRp4+YrHnXDG5epK09GXTNH1CrQdrHLj6so0+8bcCUNLh7XGSRUN5VSLxOt4KfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hds0sijd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9BEC4CEF1;
	Fri, 24 Oct 2025 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761305669;
	bh=C2071/4y7/j52Jeu+ERq03SVVMZ5dIN9u1f1mb/b9vQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=hds0sijd3DpmsMZEdqENMgI9IkUzM1SysXUOE7+1iSLj3LZQowSCdwya7THigUfFN
	 jCj6J3zgN7FDNy2936BUyuVb2acinCRajGsjPfkEnBVpmggk5F3AGlBPHyV1tZMKMS
	 +a8P8ozie7oz7NLosPF2bPbIV//61MVzzMkVsN1RfBiaH8u9/ZRc7sDHc/NxpxLYTL
	 VrJZBPR3347TWkt1m4xXZXabk+7cOQrYi6HSv8XuqkNJuEkH6f7O218k+iBn92f+0I
	 tGi2Dw1pMnR/SacbDyl+BatQJMM6+pHyvtq5VapgyZn7Bhwkr+EZremykwk8sE7Xf6
	 oqJk4HDV9OvCQ==
Message-ID: <51b0a361379b26ff14dd2f5b0aa4d6df@kernel.org>
Date: Fri, 24 Oct 2025 11:34:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Barry Song" <21cnbao@gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
In-Reply-To: <20251021042022.47919-1-21cnbao@gmail.com>
References: <20251021042022.47919-1-21cnbao@gmail.com>
Cc: 21cnbao@gmail.com, Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, sumit.semwal@linaro.org, tjmercier@google.com, v-songbaohua@oppo.com, zhengtangquan@oppo.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On Tue, 21 Oct 2025 17:20:22 +1300, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We can allocate high-order pages, but mapping them one by
> one is inefficient. This patch changes the code to map
> as large a chunk as possible. The code looks somewhat
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

