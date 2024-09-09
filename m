Return-Path: <linux-media+bounces-17984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D33971517
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8333B1F23612
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020F51B3F38;
	Mon,  9 Sep 2024 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqoyAXHV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B61AC8BF;
	Mon,  9 Sep 2024 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876913; cv=none; b=s9QuZk6aLn5D4JA6hkqztGjDWTuaEAJ1ZK2DFqcXcwX3HbnQtlmamM4UhkyGT3ytUfVZZknCfVy4BgHgt931x3xgUhOABaupSvUYJxG2Y5ReGhqJiGmiGv4aQrTele3oQlvOwFWnXl4WXT/XKMn8z/oD+5J2d17LrAXR9vXKnZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876913; c=relaxed/simple;
	bh=JvPjEY9H1xzob0l1t98pW0PA/og5aOm+LDRIetXTdH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SV2suAGjqLfuwKrYcBoWzUL1YSFwudP8mlbSJc2YHMb5R8PKKXybFKaK0wmi9lAY4OAExXG3Uuo71ka/zRAb/C8FLK7krcVazzGPr9sqhb64muXkug/VbT0Qvr/pJTpWfSD2XahqF6CdHbv3k/xiQeY7OEoPcjC03duv4+xSUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqoyAXHV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D9EC4CEC5;
	Mon,  9 Sep 2024 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876912;
	bh=JvPjEY9H1xzob0l1t98pW0PA/og5aOm+LDRIetXTdH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqoyAXHVBBHzd6uVo1/5XEAELYoYUDMcFfXhwvVyw9p7ZIk6YW1mYXslDYxFzG30p
	 0X6ugtAszkHMhpSljXdWAJgp9gOK7/bwIkLUiF5r7qvS3nwi4p/fHT192XTQwc6HXD
	 ER1NFm4pNf1mfAyc16KdNbnKSDqgLZzTElMyBI936IVxG8xY3qfQtoaLzotwT51+Rq
	 dqPuAZWLdwf12+ouc6d+2ZrpwS+kaNtpsiEtrB8GEe36Tyi3ZZ7fShsb387lRSxMju
	 zaYFGuprt7D5kGYPcHwzdjEjzfS6D7lQX1/pu4KjP4SprpcK3SywtRH8ilw5splfvq
	 PDTXIBrP9KteQ==
Date: Mon, 9 Sep 2024 12:15:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v2 5/9] dt-bindings: media: Add amlogic,c3-isp.yaml
Message-ID: <el2p23rs3p4ng5qqljdc6vr5exvpveoda3rimq3pax7l5rwlju@2ebdcjzf7ju4>
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <20240909-c3isp-v2-5-3c866a1cea56@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-c3isp-v2-5-3c866a1cea56@amlogic.com>

On Mon, Sep 09, 2024 at 03:24:15PM +0800, Keke Li wrote:
> c3-isp is used to process raw image.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> new file mode 100644
> index 000000000000..dfa439cdc380
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,c3-isp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic C3 Image Signal Processing Unit
> +
> +maintainers:
> +  - Keke Li <keke.li@amlogic.com>
> +
> +description:
> +  Amlogic ISP is the RAW image processing module
> +  and supports three channels image output.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,c3-isp
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: isp
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: vapb
> +      - const: isp0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +

Only one port? Then use "port" instead of "ports".

Best regards,
Krzysztof


