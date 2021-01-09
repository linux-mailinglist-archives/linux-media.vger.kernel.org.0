Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC552F0031
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 14:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbhAINu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 08:50:29 -0500
Received: from gloria.sntech.de ([185.11.138.130]:35890 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbhAINu2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Jan 2021 08:50:28 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kyEcX-0000Ht-R5; Sat, 09 Jan 2021 14:49:33 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, mchehab@kernel.org, jacob-chen@iotwrt.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v1 1/4] media: dt-bindings: rockchip-rga: add more rga compatible properties
Date:   Sat, 09 Jan 2021 14:49:32 +0100
Message-ID: <1863232.usQuhbGJ8B@diego>
In-Reply-To: <20201219112653.10705-1-jbx6244@gmail.com>
References: <20201219112653.10705-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Samstag, 19. Dezember 2020, 12:26:50 CET schrieb Johan Jonker:
> Add more rga compatible properties.
> 
> "rockchip,px30-rga", "rockchip,rk3288-rga"
> "rockchip,rk3328-rga", "rockchip,rk3288-rga"
> "rockchip,rk3368-rga", "rockchip,rk3288-rga"
> 
> make ARCH=arm64 dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

this patch1 should probably go through the media-tree.
So hopefully media-people will notice this series?


> ---
>  Documentation/devicetree/bindings/media/rockchip-rga.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> index dd645ddcc..a609b63bb 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> @@ -21,7 +21,11 @@ properties:
>        - const: rockchip,rk3288-rga
>        - const: rockchip,rk3399-rga
>        - items:
> -          - const: rockchip,rk3228-rga
> +          - enum:
> +              - rockchip,px30-rga
> +              - rockchip,rk3228-rga
> +              - rockchip,rk3328-rga
> +              - rockchip,rk3368-rga
>            - const: rockchip,rk3288-rga
>  
>    reg:
> 




