Return-Path: <linux-media+bounces-33522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7955AC6ACE
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED0317A429E
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32FC28853E;
	Wed, 28 May 2025 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNsjXw9M"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45A288526;
	Wed, 28 May 2025 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439726; cv=none; b=QxhoyCZGRjS3YQ34/MUdaKqTWRoUr/bHoO4FjWPOo5/GZjr29E5h/uDfoUyWIYbdvsG04hv8yBgLf7+1LB4GpreN61pXEgCMsJBWN2p+Ho5JPaj98w3J6UrG5Huyea4t2c68qfegrerj52dV8HkGhSHJFCQoN7aMuLLnl1dYIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439726; c=relaxed/simple;
	bh=V9S/2REy6SRPwlWHL+UjOecCAm58nBM9YBmNFi5Tywo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A01xXwPLpDjaqBG5BScIvwppG1CDEPvM1o9dKc7ixDmS7j9vTMG5XJ6VUkQJfgqHPGIWZwMkUDIV9z9AflZbdtKc9hKpV+J5DxFSeuFpYuM7+GldbJziZiZXQT4rEUHf1bxP/gW/yFedc/zXLQteotgWO9Y9d47MQPfBQ1yujGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNsjXw9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C975C4CEF4;
	Wed, 28 May 2025 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439725;
	bh=V9S/2REy6SRPwlWHL+UjOecCAm58nBM9YBmNFi5Tywo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GNsjXw9M9L1DpZv3jViNj4XkRdb+mXI+2m/G47jUDBV7WxLPvUEubGj+1ixOIJqRZ
	 e717/UmjcPxGcIwM1BREjJHjlHf7DQ6xXKLJDrFl1tj04VPf1Nl1KOdgCgSbhZFqe1
	 fB4uuTK4326ar1JEQv1u6vI97cf23A7RHdJvMGc4fpP8miZY3I2LE258OtWM74XvuF
	 uyjjxH7Jkv2eBczrYAMXiiQ4xzeMUCcmt8tKkGRjgdQl+plEZu+sAUbi3CzKXza/g/
	 qkqGVbbTWmfb3tPdTBHScCSnX5dqhvmCdvqDtXY9/jBXm1ah6dywidLzlVPvpGBgkS
	 H/v7sUXokTZ5Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso6198532a12.2;
        Wed, 28 May 2025 06:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdtAbmoiLXxg2NpIyWwsqEG7J42UhRVk1A0nkoP7m5sJggzseyC6MA5pTNOBf1/DWGFykmxNlfqDDe@vger.kernel.org, AJvYcCV3Cp7hU17NJmrsFwFeoidb7DPFuxPCZA+U+5V2x7u+CFOoBx7oVm/BxLoheOD+YFbn+jjMKpZK2jMxC0A=@vger.kernel.org, AJvYcCX73D11X+0+lxz62B7/QDlmHJzZKFS+UhdTeNPLYr377J6/iIfUa/Clqe0OYO/OSAYnl12xEfZegv8WVLbH@vger.kernel.org, AJvYcCXeW1In+Cg42CG1OuKvYhPAX9K12ySHnulPo+cZGmOlJT8DetDG7/fllGhk3erseAs3bxtqSWVMt50n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DhbO8wojG3FVTKyg4jyvKZDfiX283MHZ1cjmS2Yn14jEHpcv
	Jdzrdkb2lz2MoaatIrqt4gxPcybLDNQxfFBkCdi62TdH2Jl+KveVobuGv6s6nX5IrnHrJjFyBVv
	YjoU952VBTKI3d3E9cFqlXFOvO/nzsA==
X-Google-Smtp-Source: AGHT+IF33pDJOIkUnFeeemo7C8vEsrRKhSwUSbgBJjMPDXVeNtNZPzFqXBOHGol2WTjwYaKgOgXZo2D8V9wI8E6hrhc=
X-Received: by 2002:a17:907:7f09:b0:ad5:23e3:48b6 with SMTP id
 a640c23a62f3a-ad85b2b586fmr1522153166b.45.1748439724013; Wed, 28 May 2025
 06:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net> <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 May 2025 08:41:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
X-Gm-Features: AX0GCFtEoojAQ2L7InqgVIis2qLVvXMe-zX4FDkooFBAAdsDZZRxWtAdT4YSjTY
Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
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
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++++=
++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43c4=
b8250cdd1b9ee86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NV=
IDIA's
> +  open source NVDLA IP.
> +
> +  There is to be a node per each core in the NPU. In Rockchip's design t=
here
> +  will be one core that is special and needs to be powered on before any=
 of the
> +  other cores can be used. This special core is called the top core and =
should
> +  have the compatible string that corresponds to top cores.

Is this really a distinction in the h/w? If you change which core is
the top one in the DT, does it still work?

> +
> +properties:
> +  $nodename:
> +    pattern: '^npu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-rknn-core-top
> +      - rockchip,rk3588-rknn-core
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: pc
> +      - const: cna
> +      - const: core
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +    minItems: 2

It is odd that the non-top cores only have bus clocks and no module
clock. But based on the clock names, I'm guessing the aclk/hclk are
not shared, but the npu and pclk are shared. Since you make the top
core probe first, then it will enable the shared clocks and the
non-top cores don't have to worry about them. If so, that is wrong as
it is letting the software design define the bindings.

Rob

