Return-Path: <linux-media+bounces-32986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D32ABECA2
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 09:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9923F1BA44E5
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 07:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A29233713;
	Wed, 21 May 2025 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckmoVOQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD06158545;
	Wed, 21 May 2025 07:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810970; cv=none; b=Me6w0C0vAVMXOF9KV1PDXvEpZOcTxyT2ZVYOsEW/tRy5SHXKTHHYm06h4Hc5BQnBlrHWJpcTlXeK1dEwMbAzBYfUL0bt9Nt+TZhiIjr0Gpii5qdOi/gAK+vsKZQ39OkO5j6GpfAgxV62E1y1HuUeZT/IuWL9GR68rwMsyW17S0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810970; c=relaxed/simple;
	bh=rJJFudt4I3SK/FsUgWrU4RNF8V2zQbKq65qLzlHHtm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4Az5NwtITTKCFKwjrUd63i5R8/uuR7AFB6rEk1wgoml4uABJ3xjrn77jCdx0FIwgbz1VNt/YaNjXh0CxOEFFfbgAgomeqDse0o8p5SbL7PoiDVZ7i+n2Ei1gXdnQpeVvE5GpLVJ5t1Am1q1OcyoDv1IHBc3GtakCmxgF4+6B84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckmoVOQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A7C4CEE4;
	Wed, 21 May 2025 07:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810969;
	bh=rJJFudt4I3SK/FsUgWrU4RNF8V2zQbKq65qLzlHHtm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckmoVOQJAGhQ8RMwu7LGRHDrCdz1GrlTq7wOzvcIhVeLgKay8aWoyL3zOVUW3kMTn
	 AwfdR3bMdRPJU2ET5Zv35oJ4S0+zo3jC2l1cKYZ6FJ4Zg54FYZ9JHed0VLFIHQJ6Ep
	 jF4REK8QkUWaAbii5lK7sVFNXbU99il8vftx/IRKGOOS13Psb2VsbDXriYc2E2fcVt
	 wZUDrWohnrLd5rJfgnDXh9A07yVFMpe5QvR9DqzbxbJyOs+Q/1X5HfQ535jmyNKw1w
	 zADXuuYXI6rVDvvR8rwd70tH6HVRF6S3tNc1P5otdpD4DBLv9uiAc34zr5HHdhOGTU
	 LaiBf0yTaSPbA==
Date: Wed, 21 May 2025 09:02:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <20250521-able-heretic-starfish-ff51c4@kuoka>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>

On Tue, May 20, 2025 at 12:26:54PM GMT, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
> 
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
> 
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
> 

This is a big patchset, so please slow down and do not send it every day
but allow people to actually review the version you post.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


