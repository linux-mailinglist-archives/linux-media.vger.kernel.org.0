Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8EA2B94CB
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 15:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgKSOiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 09:38:46 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:55639 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKSOim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 09:38:42 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id D5ADB100003;
        Thu, 19 Nov 2020 14:38:37 +0000 (UTC)
Date:   Thu, 19 Nov 2020 15:38:41 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v5 0/8] media: i2c: Add RDACM21 camera module
Message-ID: <20201119143841.62hn535fj4rncblv@uno.localdomain>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <53e43d23-483a-adc2-a3c4-3a2b821da832@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53e43d23-483a-adc2-a3c4-3a2b821da832@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On Wed, Nov 18, 2020 at 01:34:54PM +0000, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 16/11/2020 13:52, Jacopo Mondi wrote:
> > Hello,
> >    this v5 mostly changes how the rdacm21 driver handles writes to the
> > OV490 chip by handling the 'high' part of the sensor register through an
> > helper function as suggested by Kieran and Laurent.
> >
> > The diff is available at:
> > https://paste.debian.net/1172700/
> >
> > Minor fixes in patches subjects and in bindings as reported by Sergei and
> > Kieran.
> >
> > Bindings have now been sent to DT people now that they've been reviewed
> > by Kieran.
> >
> > v4: https://patchwork.linuxtv.org/project/linux-media/list/?series=3847
> > v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3657
> >
> > Background in v1 cover letter:
> > https://www.spinics.net/lists/linux-renesas-soc/msg52886.html
> >
> > I have tested on Eagle V3M with 4 RDACM21, but the whole point of
> > this series is to retain compatibility with RDACM20.
> >
> > For this reason I have included 2 patches on top, not intended for merge
> > that re-propose DTS support for the MAXIM max9286 expansion board connected
> > to Salvator-X and add the newly introduced property to the DTS file.
> >
> > Kieran, I know you have a working setup with RDACM20, the final patches are
> > meant for ease your testing. Can you give this series a spin ?
>
>
> After some rabbit-holes :-D:
>
> A 5-camera capture on Salvator-X - https://pasteboard.co/JAW0PSr.png
> For this series, on both Eagle-V3M and Salvator-X
>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

>
>
>
> > Series based on latest renesas-drivers tag: renesas-drivers-2020-11-10-v5.10-rc3
> >
> > Thanks
> >   j
> >
> > Jacopo Mondi (7):
> >   media: i2c: Add driver for RDACM21 camera module
> >   dt-bindings: media: max9286: Document
> >     'maxim,initial-reverse-channel-mV'
> >   media: i2c: max9286: Break-out reverse channel setup
> >   media: i2c: max9286: Make channel amplitude programmable
> >   media: i2c: max9286: Configure reverse channel amplitude
> >   [DNI] arm64: dts: renesas: salvator-x-max9286: Specify channel
> >     amplitude
> >   [DNI] arm64: dts: renesas: eagle: Specify channel amplitude
> >
> > Laurent Pinchart (1):
> >   arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
> >
> >  .../bindings/media/i2c/maxim,max9286.yaml     |  23 +
> >  MAINTAINERS                                   |  12 +
> >  .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   1 +
> >  .../boot/dts/renesas/salvator-x-max9286.dtsi  | 396 ++++++++++++
> >  drivers/media/i2c/Kconfig                     |  13 +
> >  drivers/media/i2c/Makefile                    |   2 +
> >  drivers/media/i2c/max9286.c                   |  58 +-
> >  drivers/media/i2c/rdacm21.c                   | 595 ++++++++++++++++++
> >  8 files changed, 1087 insertions(+), 13 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> >  create mode 100644 drivers/media/i2c/rdacm21.c
> >
> > --
> > 2.29.1
> >
>
