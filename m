Return-Path: <linux-media+bounces-49652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29BCE85A1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 00:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93E330054B5
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 23:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528DE2E8E16;
	Mon, 29 Dec 2025 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icO1QuhO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A503E86347;
	Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767051566; cv=none; b=O+onp7OqdlmhNFS5Drw2zDre5tuHHwEE947NwUmFOGeVnerQuBDIgW+vagPKsUdEHNQN0TBwDu0Bnqu7gbML7edV1dVNYJNBMke/x9c2y+RLo2jRw32lj8cyyyptVfgAZHH7IIz/OGVoyQadAJxE5VGh3RX3nP0SkK7e912gUMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767051566; c=relaxed/simple;
	bh=EmSJ5RDGVomtHdjap3p2iZ3idrkRaL1n89LOHs60OJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RheJR6m62sxcTRF7JhZYFJVHxqPBylJTfu1EPAxAcikpWwo/FGxRJurE2dWVXg5BHuR8zvCWgPLFF4F/EPJ0n/oGaqck/QsOoT87BAcozNKWP/0mbgewyudwytS9br+/EBkKVFthFh1uIioRymFwKlfHuAQUia1e2dHwiG5T7qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icO1QuhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25287C4CEF7;
	Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767051566;
	bh=EmSJ5RDGVomtHdjap3p2iZ3idrkRaL1n89LOHs60OJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icO1QuhOjcRTRYphaT9ckAEZt0a0F+8OshHNBctrUvrJXtiiy7JaMhapPmNeMdbbH
	 FxF/OsXFQt969xNxNdQtlo2E5D0g43ylTD/qTFQf8pfELCjts7u+xl9lxFMgFc4nwb
	 XH+1qzLXwx6wQKy7+NXrxQpJD0N6Rp+NTLaKPtkzC3tlxnQns8GrJjZ2HWgNdHOrbH
	 nP+wLabskLg8g0/SDbxwZvpG9xIbWVosokA3/pdLKS4HKzoGwB4WAVYe9XXZS+TkdB
	 mrRMRwFEn5eHYbKrCWo402kuwyHMpxP6G8soqrjfkKkummYcTTccAb4cTtNqcbZrSf
	 zdJXogqnZM0gw==
Date: Mon, 29 Dec 2025 17:39:25 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
Message-ID: <20251229233925.GA2796847-robh@kernel.org>
References: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
 <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>

On Thu, Dec 18, 2025 at 07:44:49PM +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 34147127192f..ccaa2d0a2669 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -27,11 +27,14 @@ properties:
>        - const: mclk
>  
>    dmas:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    dma-names:
>      items:
>        - const: tx
> +      - const: mdma_tx
> +    minItems: 1
>  
>    resets:
>      maxItems: 1
> @@ -40,6 +43,14 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandles to a reserved SRAM region which is used as temporary

phandle to...

> +      storage memory between DMA and MDMA engines.

> +      The region should be defined as child nodes of the AHB SRAM node
> +      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml

Drop this sentence.

Rob

