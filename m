Return-Path: <linux-media+bounces-34165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C22ACF688
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 20:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DEF3AEF88
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E223727A45D;
	Thu,  5 Jun 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS5w7tKC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B03B19A;
	Thu,  5 Jun 2025 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148061; cv=none; b=eD9I7hdgfSaYzNHz/w8XFBgGnvkA+Lr/JVKbdb/65JO/sm3HhjzTwKHERJWql7eyUtbs81EBMdABoc68v1rvyMm/I5NsmZE3urT+9OoFwVHlpY0KN4jp5LN4oZmvwz5+7FESLNqy16ETkLRwstVd6kZp/6Rnl+LpEVM77oSt/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148061; c=relaxed/simple;
	bh=LrHf+kL0S4F64MAYya3xzRVnHNkRHGI5W4EOABOWHXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oL+SYSB+pxBxVaov8svT/7zAFYyF3W8ziWknf+bP4x/mpA100IypFMD4BBA3gQYmIG5Of9bWzI0EyhpODbMTbd5MSnOHQED9W74N/+mw6JZ9R1HtXKjSu4wQRrEMANvzQ21MiBtN0mWfaiY7EqJmPb2S92dQwkV39NtUxiHX+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS5w7tKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83269C4CEE7;
	Thu,  5 Jun 2025 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749148060;
	bh=LrHf+kL0S4F64MAYya3xzRVnHNkRHGI5W4EOABOWHXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS5w7tKC4ZHtosuXqgcOD8vuu3xDAr8tH1Kct+EUSeEtFzs1ul27YTsTfwMi2BBky
	 oPfwt0xjFnvbuIEz+8wd9+nZpMTFAremPqjsm/6kB+/lWDD3CNJ76sa4yw+Uo/bIpF
	 89UL9o7EJRFfGXkCo8PQYFhnM92tqNXyjXydDQNN+eGcvdYDGTHA4kpmPjPLYwcjDs
	 560DTWQnPPNkWndioNb9k4+mkzX8FLcZOpenht3/J44lUV9JyiFSnpYczSrXqLo39X
	 9vDUMwYMcTbtVpRVxOD5qzDiAH3Wc2zZoIzp6a76dFcAL3dxGa0vUnF93iiKhk33t/
	 jRCvGbnMQmsnw==
Date: Thu, 5 Jun 2025 13:27:37 -0500
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
Message-ID: <20250605182737.GB2983549-robh@kernel.org>
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

Also work on your subject. No need to say dt-bindings and encoder twice:

media: dt-bindings: mediatek,vcodec-encoder: Add MT8196

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
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.45.2
> 

