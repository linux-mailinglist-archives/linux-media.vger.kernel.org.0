Return-Path: <linux-media+bounces-36937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25DAFAB31
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285E5189D836
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 05:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E64274B55;
	Mon,  7 Jul 2025 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYuD4PVb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22313A3F7;
	Mon,  7 Jul 2025 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867261; cv=none; b=Sx7sgPKN7cFSMc8p19i+9ojoff0HR3UBixpuwFqcsZQDuQ7RuKz7misMt/FNnh5RTDK/XOl7Qo2h1PXHoCbenkc6w9olbchnNRSTIc7ZYAPCnh7+xffTm4Ic3IBpvMBR7BckaF6AkjYbte0A3Nt2/Y+VD0YhbeNroJf4DjPXugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867261; c=relaxed/simple;
	bh=RUg14gaLugN27TRVwpe1/3n2sC7iFkyWvPiH9pWUG9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAkawO88skCkFfhapcmMX08AAdGXuJDaBsgfxmeo8SgI9UhHeVqCii1UHW/3Mwvgtmbf3z1IGb52cVRxGWXyDQFP7VickqkYP83Y9re4HgsAzT2a4JVJN/1zlXv6kqX5viX7paXtxavaT6pZGuGUwcfTAaA5QbAMmlgjamOM/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYuD4PVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE30C4CEE3;
	Mon,  7 Jul 2025 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867261;
	bh=RUg14gaLugN27TRVwpe1/3n2sC7iFkyWvPiH9pWUG9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYuD4PVbP0qSkgXbrQHODHCo9u5/BJOYbdMDgQAtUvpp2B7ucekEBv+AksbJPBRpP
	 8WzKchoYO8ih/2WNgc2BwGMjbSbLRwZ/JDRgyJsSvEou+QHFaGG7Pp42YtVaL9voaQ
	 kBelBtaSmUfBb78jf2ZgxiaJXUE6eY2u4as2WPBoweekJjLif26ZHZFpdZGmkbsR2A
	 5So4v0MbtIcuNnu9GpJ7MbMizRRgiAQP+PDGT3HAyciWBrofZBaOo15KBhvqAmvELw
	 qjRYUCqb0Hri3Irx1cCLavkraaTQ8IQwYewBq0Nf3IWVsF0/ymbURtoBJer16JV7lW
	 c4I+0Tiy/AY5A==
Date: Mon, 7 Jul 2025 07:47:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv
 binding
Message-ID: <20250707-fiery-conscious-squirrel-e0fa1e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>

On Mon, Jul 07, 2025 at 09:31:45AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-yuv.yaml
>   - Various fixes per review comments
>   - Update maintainers list

Where did you post v1?

Please use standard email subjects, so with the PATCH keyword in the
title. 'git format-patch -vX' helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +properties:
> +  compatible:
> +    const: mediatek,mt8188-cam-yuv
> +
> +  reg:
> +    minItems: 1

What, why?

Look at other bindings.

> +    maxItems: 2
> +    description:
> +      Base address and optional inner base address of the cam-yuv hardware block.

Why are you stating obvious? From where did you take it?

> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: inner_base
> +    minItems: 1
> +    maxItems: 2

No, really no. You did not follow any existing patterns and this binding
does not look at all as anything else. Why making this things up? Just
use recently reviewed binding as starting point.

Best regards,
Krzysztof


