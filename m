Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E97BB1567
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbfILU2n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Sep 2019 16:28:43 -0400
Received: from mailoutvs11.siol.net ([185.57.226.202]:35428 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725995AbfILU2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:28:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 4E4D55208E3;
        Thu, 12 Sep 2019 22:28:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id PegbFYo6SQrO; Thu, 12 Sep 2019 22:28:39 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C0A7952079B;
        Thu, 12 Sep 2019 22:28:38 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id CA8BF522798;
        Thu, 12 Sep 2019 22:28:37 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Add MBUS controller node
Date:   Thu, 12 Sep 2019 22:28:37 +0200
Message-ID: <1679881.yZ8pMUtPNZ@jernej-laptop>
In-Reply-To: <20190912202057.czb6nzgssg442isi@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <20190912175132.411-4-jernej.skrabec@siol.net> <20190912202057.czb6nzgssg442isi@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 12. september 2019 ob 22:20:57 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, Sep 12, 2019 at 07:51:29PM +0200, Jernej Skrabec wrote:
> > Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
> > access system memory.
> > 
> > MBUS controller is responsible for arbitration between channels based
> > on set priority and can do some other things as well, like report
> > bandwidth used. It also maps RAM region to different address than CPU.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index eba190b3f9de..ef1d03812636
> > 100644
> > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > @@ -109,6 +109,7 @@
> > 
> >  		compatible = "simple-bus";
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > 
> > +		dma-ranges;
> > 
> >  		ranges;
> >  		
> >  		display_clocks: clock@1000000 {
> > 
> > @@ -538,6 +539,14 @@
> > 
> >  			};
> >  		
> >  		};
> > 
> > +		mbus: dram-controller@1c62000 {
> > +			compatible = "allwinner,sun8i-h3-mbus";
> > +			reg = <0x01c62000 0x1000>;
> > +			clocks = <&ccu 113>;
> > +			dma-ranges = <0x00000000 0x40000000 
0xc0000000>;
> > +			#interconnect-cells = <1>;
> > +		};
> > +
> 
> If that's easy enough to access, can you also add the references in
> the devices that are already there? (CSI and DE comes to my mind, but
> there might be others).

Strangely, DE2 doesn't use this offset. That was tested on OrangePi Plus2E, 
which has 2 GiB of RAM and subtracting this offset causes corrupted image.

But I can add this properties to CSI too. However, wouldn't that need CSI DT 
binding expansion with those properties? othetwise DT check will fail.

Best regards,
Jernej

> 
> Thanks!
> Maxime




