Return-Path: <linux-media+bounces-3040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8ED81F2F2
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 00:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045D11C21110
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 23:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BA44989E;
	Wed, 27 Dec 2023 23:13:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3749890
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 23:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rId5t-0000x7-Kj; Thu, 28 Dec 2023 00:13:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Subject:
 Re: [PATCH 3/3] dt-bindings: media: rockchip-vpu: Add RK3588 compatible
Date: Thu, 28 Dec 2023 00:13:45 +0100
Message-ID: <2755716.n0HT0TaD9V@diego>
In-Reply-To: <20231227173911.3295410-4-liujianfeng1994@gmail.com>
References:
 <20231227173911.3295410-1-liujianfeng1994@gmail.com>
 <20231227173911.3295410-4-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 27. Dezember 2023, 18:39:11 CET schrieb Jianfeng Liu:
> This patch adds RK3588 compatible in rockchip-vpu dt-bindings.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index c57e1f488..600ad351e 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -24,6 +24,7 @@ properties:
>            - rockchip,rk3399-vpu
>            - rockchip,px30-vpu
>            - rockchip,rk3568-vpu
> +          - rockchip,rk3588-vpu
>            - rockchip,rk3588-av1-vpu

Same thing about the alphabetical ordering and including dt-people
as mentioned in patch1.

Thanks
Heiko


>        - items:
>            - const: rockchip,rk3188-vpu
> --
> 2.34.1
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 





