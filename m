Return-Path: <linux-media+bounces-39405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7FB2015F
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D323ACA58
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156C32DA763;
	Mon, 11 Aug 2025 08:08:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E511DE8B2;
	Mon, 11 Aug 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899681; cv=none; b=LIoqLkep62Pn4+FBqkqBWkIGZT74XVneNmQUp2SO7g+4Cxd5whf6M6wYYvpBBg1h1g2NMXlcEQ83MU9OFiJjV5r7tW8DYLsELLFk12j2zOUoj9FnJnNYpXuMl2mJhZo79mhRj0GnTSNCEMjydQSX7V/p+z/apYVn9oWQ85Owwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899681; c=relaxed/simple;
	bh=urHKffTCadBnwDtXUJhiGML9U8gJ888C64uM//E9l/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TStM2TM+vq+UU1yucGG1BATaS+k+au6u8WhH+/8oRknoDKmfLIApHfqGG3GGUJd7F5nebWBx/v7RCk+vD4JxXmSioscbMJ3iEiODrI1HOiZFRNrUZRsEwpPrTZ38P+Bur39pG0ZxANdrqJCsvTvoEP97r7YlWjr9pVrzFHf24kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68ADC4CEED;
	Mon, 11 Aug 2025 08:08:00 +0000 (UTC)
Date: Mon, 11 Aug 2025 10:07:58 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH v2 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Message-ID: <20250811-determined-truthful-terrier-5ca5eb@kuoka>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
 <20250811032616.1385-8-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811032616.1385-8-kyrie.wu@mediatek.com>

On Mon, Aug 11, 2025 at 11:26:14AM +0800, Kyrie Wu wrote:
> Add MT8189 encoder compatible string to distinguish former ICs
> MTK's. Compared with MT8196, the maximum resolution of MT8189
> encoder is only 4K, and the fps is only 30, which cannot reach
> the highest parameter of MT8196: level6.2, 8K@60fps.
> Compared with MT8188, the level can only support 5.1, which is less
> than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
> that of MT8188. And MT8189 could support NBM mode.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 7675391d7eb0..faee838d684e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -25,6 +25,7 @@ properties:
>                - mediatek,mt8192-vcodec-enc
>                - mediatek,mt8195-vcodec-enc
>                - mediatek,mt8196-vcodec-enc
> +              - mediatek,mt8189-vcodec-enc

Same issue... you got these comments on your v1 of your other patchset,
didn't you?

Best regards,
Krzysztof


