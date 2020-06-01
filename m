Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977201EB107
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 23:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgFAVil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 17:38:41 -0400
Received: from gloria.sntech.de ([185.11.138.130]:34530 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728182AbgFAVil (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 17:38:41 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jfs8h-00050b-1D; Mon, 01 Jun 2020 23:38:35 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] media: rockchip: Introduce driver for the camera interface on PX30
Date:   Mon, 01 Jun 2020 23:38:34 +0200
Message-ID: <1779471.kMuJgyiE6z@diego>
In-Reply-To: <CAAFQd5AVD+LhYZziqNUfga1sCp98MMu+ESgBMagS1n6++ae=pg@mail.gmail.com>
References: <20200529130405.929429-1-maxime.chevallier@bootlin.com> <CAAFQd5AVD+LhYZziqNUfga1sCp98MMu+ESgBMagS1n6++ae=pg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

Am Montag, 1. Juni 2020, 20:45:14 CEST schrieb Tomasz Figa:
> On Fri, May 29, 2020 at 3:04 PM Maxime Chevallier
> <maxime.chevallier@bootlin.com> wrote:
> >
> > Hello everyone,
> >
> > Here's a V2 of the series adding very basic support for the camera interface on
> > the Rockchip PX30 SoC.
> >
> > Thanks to everyone that commented on the first series, your reviews were
> > very helpful :)
> >
> > This Camera Interface is also supported on other Rockchip SoC such as
> > the RK1808, RK3128, RK3288 and RK3288, but for now I've only been able to
> > test it on the PX30, using a PAL format.
> 
> How does this hardware relate to the one handled by the rkisp1 driver
> that is available under staging/media/rkisp1? It was written with
> RK3399 in mind, but I have a loose recollection that the hardware in
> RK3288 was roughly the same.

(un-)educated guess would be that the rk3288 has both.

When introducing new IPs Rockchip often keeps the previous incarnation
around - probably as a fallback.

From a bit of digging around manuals and vendor-dtsi [0] I found:

in rk3288.dtsi both:
- isp: isp@ff910000
- cif_isp0: cif_isp@ff910000

- grf_con_disable_isp in GRF_SOC_CON6
- dphy_rx1_src_sel (1: isp, 0: csi host) in GRF_SOC_CON14


Heiko


[0] https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm/boot/dts/rk3288.dtsi


> +Helen Koike +Dafna Hirschfeld working on the rkisp1 driver.
> 
> Best regards,
> Tomasz
> 
> >
> > This driver is mostly based on the driver found in Rockchip's BSP, that
> > has been trimmed down to support the set of features that I was able to test,
> > that is pretty much a very basic one-frame capture and video streaming
> > with GStreamer.
> >
> > This first draft only supports the Parallel interface, although the
> > controller has support for BT656 and CSI2.
> >
> > Finally, this controller has an iommu that could be used in this driver,
> > but as of today I've not been able to get it to work.
> >
> > Any review is welcome.
> >
> > Thanks,
> >
> > Maxime
> >
> > --- Changes since V1 ---
> >
> >  - Took reviews from Rob, Hans, Robin and Heiko into account :
> >   - Renamed the clocks in the binding
> >   - Fixed the DT schema compiling
> >   - Fixed a few typos
> >   - Used the clk bulk API
> >   - Used the reset array API
> >   - Changed a few helpers for more suitable ones
> >   - Rebased on 5.7-rc7
> >
> >
> >
> > Maxime Chevallier (3):
> >   media: dt-bindings: media: Document Rockchip CIF bindings
> >   media: rockchip: Introduce driver for Rockhip's camera interface
> >   arm64: dts: rockchip: Add the camera interface description of the PX30
> >
> >  .../bindings/media/rockchip-cif.yaml          |  100 ++
> >  arch/arm64/boot/dts/rockchip/px30.dtsi        |   12 +
> >  drivers/media/platform/Kconfig                |   13 +
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/rockchip/cif/Makefile  |    3 +
> >  drivers/media/platform/rockchip/cif/capture.c | 1170 +++++++++++++++++
> >  drivers/media/platform/rockchip/cif/dev.c     |  358 +++++
> >  drivers/media/platform/rockchip/cif/dev.h     |  213 +++
> >  drivers/media/platform/rockchip/cif/regs.h    |  256 ++++
> >  9 files changed, 2126 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml
> >  create mode 100644 drivers/media/platform/rockchip/cif/Makefile
> >  create mode 100644 drivers/media/platform/rockchip/cif/capture.c
> >  create mode 100644 drivers/media/platform/rockchip/cif/dev.c
> >  create mode 100644 drivers/media/platform/rockchip/cif/dev.h
> >  create mode 100644 drivers/media/platform/rockchip/cif/regs.h
> >
> > --
> > 2.25.4
> >
> 




