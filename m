Return-Path: <linux-media+bounces-24532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19BA0783C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E918F3A1A55
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6AF218EA6;
	Thu,  9 Jan 2025 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIujkZaX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D689218AD9;
	Thu,  9 Jan 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430873; cv=none; b=gCu/U/52wTM/hFJqnRYge+PntAlh9VtSWXQ+oWxawKbEsLxbLf4aqTvo8pca2r3IkaBxr8Y1X3McdnIW/EODp8la9x4u53vBMNBYplgoFhgRBx5jzaDcf1KGrjlIJ6mEdXnYqBDEKU5sT+VFlmbmY+lC3FymwivAt7kLoGmtI90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430873; c=relaxed/simple;
	bh=bIdzlrQOAX3U44F79+AqJ7ruftZl57F5R7gP3U2Bxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvY7efUkRbHoM01cJMr7cPGNAe1ip3l69GpOn6odev4udPxrj82OGUbxEnCWvzKeuuUN9Lb8M3SyOKSBYhrbR78Wk90vo5+b1uRpE4vbEsVALlRw8iXJctmebR6Z7Wt4DzcguKX6hL5KeBVQe5DtFUlysuqFxajrNPBMtzfsgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIujkZaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152DAC4CEE1;
	Thu,  9 Jan 2025 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736430872;
	bh=bIdzlrQOAX3U44F79+AqJ7ruftZl57F5R7gP3U2Bxvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GIujkZaXHxosqsJ8gWatoA/hOWJuIFT7pu6jF9goFNPQ70zSWzMfajWc5X9BZeBkY
	 SfDizsL2ZTZG8L+pT2B639VrXuKNINrhk9NDFVVjXSc8C729iL1Mmx+b+8uI+ZykKh
	 W3pY5wz21qd1Xcsm2uYRdDVDrqmSIi5hrFSz9maijl1SKiEF4iLxbdrdnD5PZnG7Uo
	 +nxDzMAOjkXLvbjEA1U5c2RkuDdgAjCRZgK+4uMcFCIVyTvW3uHVc4mo0IoUlsnBnL
	 K3Ml5AEK2YxKODI7i3VqLbLUtfAlO/PhWgBqmY0kzF6Zsl90C2TD9ei5CjNZw3JIpQ
	 MXSJ/tUOX3osQ==
Message-ID: <63a97fdb-f348-4ed7-9d7f-8e47d51a4390@kernel.org>
Date: Thu, 9 Jan 2025 14:54:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec
 compatible
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
 <20250109133513.20151-2-kyrie.wu@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250109133513.20151-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2025 14:35, kyrie.wu wrote:
> Add mediatek,mt8196-jpgdec compatible to binding document.

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch -vX` helps here to create proper versioned
patches. Another useful tool is b4. Skipping the PATCH keyword makes
filtering of emails more difficult thus making the review process less
convenient.

> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>  ...5-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} (95%)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml
> similarity index 95%
> rename from Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> rename to Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml


Don't rename the file.

> index e5448c60e3eb..5ec98ddad506 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,multi-core-jpegdec.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
> +$id: http://devicetree.org/schemas/media/mediatek,multi-core-jpegdec.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: MediaTek JPEG Decoder
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8195-jpgdec
> +    enum:
> +      - mediatek,mt8195-jpgdec
> +      - mediatek,mt8196-jpgdec

Devices look compatible, so express it with fallback.

Best regards,
Krzysztof

