Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8063B35DF
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 20:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFXSjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 14:39:49 -0400
Received: from gloria.sntech.de ([185.11.138.130]:36770 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhFXSjr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 14:39:47 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lwUEB-000109-9v; Thu, 24 Jun 2021 20:37:27 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH 02/12] arm64: dts: rockchip: Add panel orientation to Odroid Go Advance
Date:   Thu, 24 Jun 2021 20:37:26 +0200
Message-ID: <3249046.u6TykanW85@diego>
In-Reply-To: <20210624182612.177969-3-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com> <20210624182612.177969-3-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 24. Juni 2021, 20:26:02 CEST schrieb Ezequiel Garcia:
> The Odroid Go Advance panel is rotated, so let's reflect this
> in the device tree.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

similar patch already applied for 5.14:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts?id=edb39de5d731f147c7b08c4a5eb246ae1dbdd947

> ---
>  arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> index 49c97f76df77..cca19660e60a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> @@ -240,6 +240,7 @@ panel@0 {
>  		iovcc-supply = <&vcc_lcd>;
>  		reset-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
>  		vdd-supply = <&vcc_lcd>;
> +		rotation = <270>;
>  
>  		port {
>  			mipi_in_panel: endpoint {
> 




