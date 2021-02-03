Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32AC30E3A2
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 20:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhBCTze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 14:55:34 -0500
Received: from gloria.sntech.de ([185.11.138.130]:60808 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230106AbhBCTzc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 14:55:32 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l7OET-0000yQ-R9; Wed, 03 Feb 2021 20:54:33 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date:   Wed, 03 Feb 2021 20:54:32 +0100
Message-ID: <16624224.lhrHg4fidi@diego>
In-Reply-To: <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de> <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Am Mittwoch, 3. Februar 2021, 19:14:22 CET schrieb Sebastian Fricke:
> Hey Heiko,
> 
> I have tested your patch set on my nanoPC-T4, here is a complete log
> with:
> - relevant kernel log entries
> - system information
> - media ctl output
> - sysfs entry information
> 
> https://paste.debian.net/1183874/
> 
> Additionally, to your patchset I have applied the following patches:
> https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup
> 
> And just to not cause confusion the `media_dev` entries come from this
> unmerged series:
> https://patchwork.kernel.org/project/linux-media/list/?series=426269
> 
> I have actually been able to stream with both of my cameras at the same
> time using the libcamera cam command.
> I would like to thank you a lot for making this possible.

Thanks for testing a dual camera setup. On my board I could only test
the second ISP. And really glad it works for you tool :-) .

Out of curiosity, do you also see that green tint in the images the cameras
produce?

Thanks
Heiko


> If you like to you can add:
> Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> 
> On 02.02.2021 15:56, Heiko Stuebner wrote:
> >The rk3399 has two ISPs and right now only the first one is usable.
> >The second ISP is connected to the TXRX dphy on the soc.
> >
> >The phy of ISP1 is only accessible through the DSI controller's
> >io-memory, so this series adds support for simply using the dsi
> >controller is a phy if needed.
> >
> >That solution is needed at least on rk3399 and rk3288 but no-one
> >has looked at camera support on rk3288 at all, so right now
> >only implement the rk3399 specifics.
> >
> >
> >Heiko Stuebner (6):
> >  drm/rockchip: dsi: add own additional pclk handling
> >  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
> >  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
> >  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
> >  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
> >  arm64: dts: rockchip: add isp1 node on rk3399
> >
> > .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> > arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
> > drivers/gpu/drm/rockchip/Kconfig              |   2 +
> > .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
> > 4 files changed, 384 insertions(+)
> >
> 




