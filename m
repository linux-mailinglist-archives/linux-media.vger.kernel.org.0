Return-Path: <linux-media+bounces-34164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB2ACF685
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 20:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA3F3AD839
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 18:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3D227A445;
	Thu,  5 Jun 2025 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0V+21dw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3158B3B19A;
	Thu,  5 Jun 2025 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147972; cv=none; b=K8pTQsNKzIrGQFyG39OdZ/jK4+ChVJ4Td5mG1AV2hPlXH1EM9cf2CJxCrIXc5vihfeeDopXGZTyloiBw6/zzS7MnDZg11YsigIc9z7Fu/v6NRlLLXhtfGt1yhlpGLRzDodwUDWQxXGXJzzDecTcZyofmxd4+gnWSw4rzrelEdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147972; c=relaxed/simple;
	bh=38lVXRE3Mp1KY0IrURvIDl45/b1nVSn7zSo6GGgz/1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWF7t4XVE4vDpp0fmTnSG4/Wt/l0tZDUcHUc20CGZnXoQevaDjzwexCMeadYQS2AFD4lq0Kt3YxjH7IH2YyMQ/HNsq+XxcrTQyVKVNyC7E/ZGRu76YE9uA9H5pFOLb521K0mtP7Puqx8dFpSgIFbsLgAYg/nfbdt9P0CdbSu0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0V+21dw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5502EC4CEE7;
	Thu,  5 Jun 2025 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749147970;
	bh=38lVXRE3Mp1KY0IrURvIDl45/b1nVSn7zSo6GGgz/1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0V+21dwPHis0WH2aMCEh1W7DDxlEcptzjIiUkHqYfEYyGIkrHVsLdF48zbsAGCEk
	 Nq1VTfUV8Gtx920aHzIDCf686hAgK6jrJsUeZy9UzG9jZ/Q+DVIRT7lN63W3a+y0Dy
	 oTia446jU9dpKbcU6ou4y0SlAsa5WXpzlyZWFLYgKyPEeqOs+8H80CrEnJ8qOL5yzd
	 UwT4qcBbsPnXsu8EK1RrAnC6pKrQx9nOzqXaGH+cleNgAHW61khnhdcZdA1BwT7sa6
	 2oZBg0lXuAU+EE7IpPUQtmLRVhSLoCU0rg2isdFhxyaR+h3QI903eqVJsOXDg5QDHx
	 0wRFdiCqggauw==
Date: Thu, 5 Jun 2025 13:26:07 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	nicolas.dufresne@collabora.com, wenst@chromium.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add
 encoder dt-bindings for MT8196
Message-ID: <20250605182607.GA2983549-robh@kernel.org>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
 <20250528063633.14054-6-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528063633.14054-6-irui.wang@mediatek.com>

On Wed, May 28, 2025 at 02:36:31PM +0800, Irui Wang wrote:
> Add MT8196 encoder compatible string, which will reference VCP device.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index ebc615584f92..7675391d7eb0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -24,6 +24,7 @@ properties:
>                - mediatek,mt8188-vcodec-enc
>                - mediatek,mt8192-vcodec-enc
>                - mediatek,mt8195-vcodec-enc
> +              - mediatek,mt8196-vcodec-enc
>        - items:
>            - const: mediatek,mt8186-vcodec-enc
>            - const: mediatek,mt8183-vcodec-enc
> @@ -76,6 +77,17 @@ required:
>    - iommus
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-vcodec-enc
> +
> +    then:
> +      required:
> +        - mediatek,vcp

Where is this property defined?

> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.45.2
> 

