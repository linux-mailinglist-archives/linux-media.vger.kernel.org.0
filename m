Return-Path: <linux-media+bounces-39973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1FB27BF0
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E7B1D01F9C
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCE42BE7A5;
	Fri, 15 Aug 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6+BpbAd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB329D284;
	Fri, 15 Aug 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248044; cv=none; b=YFl1RjSk9/K9kJYZlGQZ9fIP2bWYwNAi/dzI6JZY3+3TzdEczGwBrd2Ha7gTIVFlVDTBmfNpJrRkBuwGEewFEGQraW9/RlX/3AwjiFjzEgJHLLdusrXW6R5tGlfRIM7yRRMxrM+JpFtKyVspHQ2Z0iV074Z7Qzy9IKiCO7ZinxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248044; c=relaxed/simple;
	bh=fkLFrZT5rOePvj8oL1FKGxrVLn/3EwqTARx7crpxGnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WK+CDSKL7jTfjzVHeHRnj4br3xLThYa4tD3v8ErHWd0/uNVcu3hm42G2diZ3nMZO60G1BOCuAhMS0UNQuVJHxaAPTfGEwoqAVAnj0UsZnh2eJQ52PskUl3RtHtFJMfJ+DnlFZOLLGfdG5/3TNdv5U1qV73s59t+d/SV23dHQVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6+BpbAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68880C4CEF5;
	Fri, 15 Aug 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755248044;
	bh=fkLFrZT5rOePvj8oL1FKGxrVLn/3EwqTARx7crpxGnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6+BpbAdMl1b7cUK3TpFifshNNefnhQLvVcVU+acszFV7a8rNmULcOC0ybwIMtZ0X
	 LpLegNnz/QMJLIak1ZcpGljvgrWbliBYbaYC0m0DV4TJEpOatp2i9cKrr3K7SxuO8n
	 rqMNnDHnMRNRkqKWS3JuZ3cyMKFQ52+lUAo/r7nHsfQu3h9G3t+AhcDXEAyUwy8lKk
	 jLxFc6Ji/coGoghOWOl72f7EdOjamppbzH7YP2nlHoMWWFqH8N0UPv0QHKYHumx2KR
	 kidWdhhIu+Xnj/Nx/1e5oeVv0ZgmMkeOHAW7h6S2Ek2CE0ZFpJR6fhDw6u8AAPFEo4
	 kA8uhr/n5yulg==
Date: Fri, 15 Aug 2025 10:54:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Message-ID: <20250815-meek-porcelain-oarfish-1411e3@kuoka>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
 <20250814085642.17343-6-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814085642.17343-6-kyrie.wu@mediatek.com>

On Thu, Aug 14, 2025 at 04:56:41PM +0800, Kyrie Wu wrote:
> From: Irui Wang <irui.wang@mediatek.com>
> 
> Add MT8196 encoder compatible string, which will reference VCP device.

You ignored comments from v2.

> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Incorrect SoB chain.

> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index ebc615584f92..bb4dbf23ccc5 100644
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
> @@ -58,6 +59,11 @@ properties:
>      description:
>        Describes point to scp.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Describes point to vcp.

For what? You just repeated the property name. You must say here
something useful instead: why this is needed, what is its purpose.


> +
>    power-domains:
>      maxItems: 1
>  
> @@ -76,6 +82,17 @@ required:
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

else

mediatek,vcp: false


Best regards,
Krzysztof


