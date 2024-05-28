Return-Path: <linux-media+bounces-12067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54F8D161D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5841C21045
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8EF13C3D4;
	Tue, 28 May 2024 08:19:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81F6F079;
	Tue, 28 May 2024 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884359; cv=none; b=CsUOl9pR6vrlmOzJ+Nexzn/pm7AzBFdmXRkNirxi+AsINOLmLKR9Ibb3qDJYjtUbsWHFDPX+M9PrLsFGgEBfxMVvbtv/NhS07DtXBm1d4cJu5bm96sb3iw8eaeOfZbuXMclH1BBO6V7s7whOkr8g47BpsrP/AyJ8A7t8WQOejqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884359; c=relaxed/simple;
	bh=gJZogRnYwW9QFjcyMClNf4KTStnwLtJOXf/ejk2ylZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGmUM9DgvL9DqgT1+OFQ/hNSle34zGslTVBNijSSHxqhJit9msEgVFVrxLaT6jBQ5CYjMsTtGTyMOqfA99DPcw86hu9gEAX2+S6oFP5aAeWrcnZwAEX6ISHnDg8fiqe8QzyEucpLKsgriHeTx0S0hrCw5UMj9BjgHbDi1tEwa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sBs33-0001fu-Iu; Tue, 28 May 2024 10:19:09 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Subject:
 Re: [PATCH 1/3] dt-bindings: media: rockchip,vpu: Document RK3128 compatible
Date: Tue, 28 May 2024 10:19:08 +0200
Message-ID: <3639993.hdfAi7Kttb@diego>
In-Reply-To: <20240523185633.71355-2-knaerzche@gmail.com>
References:
 <20240523185633.71355-1-knaerzche@gmail.com>
 <20240523185633.71355-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 23. Mai 2024, 20:56:31 CEST schrieb Alex Bee:
> The integration for this SoC is similar to RK3066/RK3188.
> 
> Document it's compatible.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Media people, can you apply this patch alone from the series?

Thanks
Heiko

> ---
>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index c57e1f488895..d1b47b14ca57 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -26,7 +26,9 @@ properties:
>            - rockchip,rk3568-vpu
>            - rockchip,rk3588-av1-vpu
>        - items:
> -          - const: rockchip,rk3188-vpu
> +          - enum:
> +              - rockchip,rk3128-vpu
> +              - rockchip,rk3188-vpu
>            - const: rockchip,rk3066-vpu
>        - items:
>            - const: rockchip,rk3228-vpu
> 





