Return-Path: <linux-media+bounces-32864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADFABD07C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1333AEA61
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 07:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF5E25DB09;
	Tue, 20 May 2025 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3/DTfV+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833B21CC48;
	Tue, 20 May 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726437; cv=none; b=HgGp1QclXMBjO7fD3ZcMiwSbwAI7/Ewp4EW5gAh3gpW3AMaZrQQyxYfHFRL6PKcICscyvfWPDRUJjpu1eJ4eQVJtgfcFUv8/74ZpkTnVa6xfO9+KlHbCCM33LppRXYpCKK95xuNKwHYgqQBMOHp0mcYp9Fe+aLmCNje5VCv1zwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726437; c=relaxed/simple;
	bh=IxJDbHhoIBlRsEC8dNmFDP5+Wyd+qkC2iRVS4ulVwEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1RN7i3tUUvdaTR3A8XYyBuXZxD5QZxefLZauDAQvmX+YbZCN+GrpIK72zt4m7anMDkblrf18MG7s8b01XFYNeLzZsT4jufWYTCxj1y6LXAN1Y+KB9bXsBK/zdoGh7xFh9zfOPI4UMc5F/7h3/bUSuYgtPxRSiEfm2NpvMx3Khc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3/DTfV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17977C4CEE9;
	Tue, 20 May 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726436;
	bh=IxJDbHhoIBlRsEC8dNmFDP5+Wyd+qkC2iRVS4ulVwEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3/DTfV+WGGKr8thDEznVcCK6Zt+adMAj/Cp+a9oYEBzujm0rNmpnQvHujGxblbzi
	 cPh3hPmAPQ+Ds/hoPqR3FXN0l6Krw+/cXqSSq0OGKZfAT+PKGA5pHB91ODH4rF2ef+
	 OcVj5zo4rUd7pOzBJWdv0jpI41xu75b4hsVLuDATYt8piVeUv3/p4RhV/IAZtAogxd
	 gvxlAINrqfxUu/KVKoTmVFOwjfPpYkoIVxI+CuFf/HEK6l75v+66vi6nt/n89dDcwW
	 ANzssYus/nb/5ItchaWbUuPm8l7t9JrbwU8qo1yTqYDbXcv/ToHcTGXa1ggFbQ3a7p
	 uTCz7CLBHQcAg==
Date: Tue, 20 May 2025 09:33:54 +0200
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
Subject: Re: [PATCH v4 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <20250520-hypnotic-pink-lori-dece51@kuoka>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
 <20250519-6-10-rocket-v4-1-d6dff6b4c0ae@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519-6-10-rocket-v4-1-d6dff6b4c0ae@tomeuvizoso.net>

On Mon, May 19, 2025 at 03:43:33PM GMT, Tomeu Vizoso wrote:
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
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

This order of SoB is still odd. You as person sending it should be the
last signing person. Are you sure you are using b4 for managing
trailers? I would expect it to re-order these on every update and this
is already v4.

> ---
>  .../bindings/npu/rockchip,rknn-core.yaml           | 149 +++++++++++++++++++++

Filename matching compatible, so rockchip,rk3588-rknn-core.yaml

>  1 file changed, 149 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fafd0b01da215c7396262012988e364ef07ea137
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
> +  open source NVDLA IP.
> +
> +  There is to be a node per each core in the NPU. In Rockchip's design there
> +  will be one core that is special and needs to be powered on before any of the
> +  other cores can be used. This special core is called the top core and should
> +  have the compatible string that corresponds to top cores.
> +
> +properties:
> +  $nodename:
> +    pattern: '^npu@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:

Drop... if you followed my advice you would notice it is not necessary.

> +      - enum:
> +          - rockchip,rk3588-rknn-core-top
> +      - enum:
> +          - rockchip,rk3588-rknn-core

My comments were only partially implemented. This syntax is really not
readable and not necessary and I asked to make it part of previous enum.
This is just one enum:

compatible:
  enum:
    - foo
    - bar

Best regards,
Krzysztof


