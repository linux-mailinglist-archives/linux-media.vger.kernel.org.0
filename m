Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE02D3D5083
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 00:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhGYWSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 18:18:11 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58808 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhGYWSL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 18:18:11 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m7n4o-0007er-IY; Mon, 26 Jul 2021 00:58:30 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, cmuellner@linux.com
Subject: Re: [PATCH v2 0/6] Support second Image Signal Processor on rk3399
Date:   Mon, 26 Jul 2021 00:58:29 +0200
Message-ID: <7055305.V25eIC5XRa@diego>
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 10. Februar 2021, 12:10:14 CEST schrieb Heiko Stuebner:
> The rk3399 has two ISPs and right now only the first one is usable.
> The second ISP is connected to the TXRX dphy on the soc.
> 
> The phy of ISP1 is only accessible through the DSI controller's
> io-memory, so this series adds support for simply using the dsi
> controller is a phy if needed.
> 
> That solution is needed at least on rk3399 and rk3288 but no-one
> has looked at camera support on rk3288 at all, so right now
> only implement the rk3399 specifics.
> 
> changes in v2:
> - enable grf-clock also for init callback
>   to not break if for example hdmi is connected on boot
>   and disabled the grf clock during its probe
> - add Sebastian's Tested-by
> - add Rob's Ack for the phy-cells property

finally found the time and applied patches 1-3 to drmmisc-next
after fixing the alphabetical kconfig ordering Helen pointed out
and also applied patches 4-6 to my rockchip tree for 5.15


> 
> Heiko Stuebner (6):
>   drm/rockchip: dsi: add own additional pclk handling
>   dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>   drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>   arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>   arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>   arm64: dts: rockchip: add isp1 node on rk3399
> 
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
>  drivers/gpu/drm/rockchip/Kconfig              |   2 +
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 349 ++++++++++++++++++
>  4 files changed, 391 insertions(+)
> 
> 




