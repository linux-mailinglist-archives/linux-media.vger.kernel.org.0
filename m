Return-Path: <linux-media+bounces-11353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAF8C2B99
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 23:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78CE1F22470
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 21:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB6A13B5AB;
	Fri, 10 May 2024 21:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV6lfcdM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246450A93;
	Fri, 10 May 2024 21:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715375775; cv=none; b=U24OP4iKFcdyEechwB1Y4Rctesn8rDuHyPppVi0yvYBiv4sV9CJB39aULYihMflJyLIPgg9eHjdTnxqOslxGw7rCJBM9ZwUNYHYqAoz+/sZ8oUYLF6xF9zmUNcCXnVgC8eSsVGu6melxg0cjyE/YgIQd08hPrYkixGzYnrY0I4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715375775; c=relaxed/simple;
	bh=K6EhDqPaBDztZnvn/KM7LNk+8HMiGpLYxVSS9Ir0nE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWFw9O8oGGNcvHfLSBGnTR43d6w/Yhwzlfsne8UE3zYdNd9HYiQG2jvA04/b+hp2NobMUcyhRHPe9unKk0sNrqfIvOndkUQR7ZgCuadR1FGr88Te9tYXoSiU9ufdfhUGeizui2RHe3OCWMuT7WY3jxSZUqBGanv//xFsGc3T2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV6lfcdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C08C113CC;
	Fri, 10 May 2024 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715375775;
	bh=K6EhDqPaBDztZnvn/KM7LNk+8HMiGpLYxVSS9Ir0nE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VV6lfcdMZ0TEjobmN5Nzgr3+3HR8pdRWF9d4Tnw0OacGPSKaGVHIlittLNo2vJrfJ
	 WHLsw1Dx9SSdjnHP4Fhea7jUQT/K8F1xt0pv0S6o4tbO96gx8ONtXYiIxV8Ygv75/z
	 cjjqP5ML5eRiwqhovQDS7Jn+mbuVBzCvMGuR3sY1ujFgSBscZGBPlVpB0GxKWihM+x
	 oJby08HePcWDP3vAiw++HgLIOXapLAZhB5wBd8C6bIHJgBlLXLI9v5UD8iDVlG0OIJ
	 JOPmRKvMgaHqPzMpyxQ/KyLFhe1F00hbYN+rFEm5Esg2qTTXN82HpuFrjbU1d95o1Y
	 eE2aByExTAlpQ==
Date: Fri, 10 May 2024 16:16:13 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
Message-ID: <20240510211613.GA751688-robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-6-panikiel@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-6-panikiel@google.com>

On Tue, May 07, 2024 at 03:54:08PM +0000, Paweł Anikiel wrote:
> Add a DisplayPort bus type and a multi-stream-support property
> indicating whether the interface supports MST.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
>  include/dt-bindings/media/video-interfaces.h               | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 26e3e7d7c67b..7bf3a2c09a5b 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -94,6 +94,7 @@ properties:
>        - 5 # Parallel
>        - 6 # BT.656
>        - 7 # DPI
> +      - 8 # DisplayPort
>      description:
>        Data bus type.
>  
> @@ -217,4 +218,10 @@ properties:
>        Whether the clock signal is used as clock (0) or strobe (1). Used with
>        CCP2, for instance.
>  
> +  multi-stream-support:

If MST is a known term for DP, then perhaps "dp-mst-support" for the 
name. In any case, 'dp' should be in there somewhere.

> +    type: boolean
> +    description:
> +      Support transport of multiple independent streams. Used for
> +      DisplayPort MST-capable interfaces.

Wouldn't this be implied by the devices at each end of the link? The 
drivers for each device should really list out features supported for 
the link. The mode used is then the union of those 2 lists with DT 
properties only used when the union is not definitive.


> +
>  additionalProperties: true
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> index 68ac4e05e37f..b236806f4482 100644
> --- a/include/dt-bindings/media/video-interfaces.h
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -12,5 +12,7 @@
>  #define MEDIA_BUS_TYPE_CSI2_DPHY		4
>  #define MEDIA_BUS_TYPE_PARALLEL			5
>  #define MEDIA_BUS_TYPE_BT656			6
> +#define MEDIA_BUS_TYPE_DPI			7
> +#define MEDIA_BUS_TYPE_DISPLAYPORT		8
>  
>  #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 

