Return-Path: <linux-media+bounces-50732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E290D21739
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44A873017861
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1753A7F7C;
	Wed, 14 Jan 2026 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwWwxiky"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839053A89C0;
	Wed, 14 Jan 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427525; cv=none; b=JsAV6QLH01h79z/Dj8/p59Xm+9pkRDQQonHHFSIrM95Py80JgokQTpn5Sl2KSivmQWzuaFUqLhequPI8zbwDTJ4XGHbEgw0SSZsW5wiTmHaO2rjzjXg2rKwOadUgkg0v3uLpNYG774JnAhNUgbZhQbU1ZlhCreZ3yuXziDppjVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427525; c=relaxed/simple;
	bh=M1gJhCbLOU4I/BZFPxEOzvEA0Bnn9+kKwnxcwbbgbkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWrrawlwo70GKHjIzXAaVJkr1xLysUxUDifNmFXaG3NzonhB82BPU5YF5ATvZ1x+hdo2gK9UeVCD36D3pg3MXnHibHYTppoaEea0jIq7ZwsaFLDbXPV54VpUBpgBIstzlbtl2+69yxk8PchqMmrybXQjj8d9X3PLmLjkQH8CRH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwWwxiky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14CC4CEF7;
	Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768427524;
	bh=M1gJhCbLOU4I/BZFPxEOzvEA0Bnn9+kKwnxcwbbgbkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwWwxikyHO4uMF7uRfY8WsAKTfTOC5gGgvBeg80DGMtleeRKM40iWnh8pdsn4DKtp
	 q3Y+R51snbfadJlsqcQeacKH64t3GUoczhhBU38DtbP1sMw06HgZmdfHubYNXatH1f
	 Uj3y3WqXHdBr5rDXDrwOO6/BBE9pOxRD73krvnp661saWIQ3hjOh4GCHlOXMS1nLxV
	 AhBWXK1AHTENiCh5Usa0mwV6rXL6dAFEXxm4CxblQmzHW9SqxakDsS+IOsHhSFRFaF
	 PFUV/1ffmIP+0IHbpsi1UQ/iBwZbkUr5wD6CULCpPSQ/eFEiBcsJPSfEon0yr2gxHz
	 I1+eqycXqmEMA==
Date: Wed, 14 Jan 2026 15:52:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	devicetree@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
Message-ID: <176842752326.3259543.1333457446847101857.robh@kernel.org>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
 <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>


On Tue, 06 Jan 2026 12:34:37 +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> Change in v2:
>   - correct typo (phandles -> phandle)
>   - remove explanation about generic binding sram.yaml
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


