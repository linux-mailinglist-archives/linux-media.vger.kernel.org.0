Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9DB1943
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 09:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbfIMH5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 03:57:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfIMH5u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 03:57:50 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFDDD20830;
        Fri, 13 Sep 2019 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568361469;
        bh=G+tpwlHhHN4Uq2Y+D3u2USOsp4VVgIF3lrlIxrgfRZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUspfkv+jER4uH9H6OWriR6kaRD0ON4ZJQPyp1P/2vG6Tw1xyHskIbZVuaHXjHw1s
         WutwVnqVYrcfL80RvJiV7VsoY+EoibYqqTJkObjpKKcSqTcOmXqPLQOSG4ItcslXms
         zx1P9KzuFY4Lmec1/jJHxC59wveY2Sz05VYjoRTA=
Date:   Fri, 13 Sep 2019 09:57:46 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Add MBUS controller node
Message-ID: <20190913075746.gws6u6hbextzleke@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <1679881.yZ8pMUtPNZ@jernej-laptop>
 <20190912203427.ajbmtm5djctpkz6p@localhost.localdomain>
 <5193854.KWMFve8tAi@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5193854.KWMFve8tAi@jernej-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 12, 2019 at 10:46:58PM +0200, Jernej Škrabec wrote:
> Dne četrtek, 12. september 2019 ob 22:34:27 CEST je Maxime Ripard napisal(a):
> > On Thu, Sep 12, 2019 at 10:28:37PM +0200, Jernej Škrabec wrote:
> > > Dne četrtek, 12. september 2019 ob 22:20:57 CEST je Maxime Ripard 
> napisal(a):
> > > > Hi,
> > > > 
> > > > On Thu, Sep 12, 2019 at 07:51:29PM +0200, Jernej Skrabec wrote:
> > > > > Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
> > > > > access system memory.
> > > > > 
> > > > > MBUS controller is responsible for arbitration between channels based
> > > > > on set priority and can do some other things as well, like report
> > > > > bandwidth used. It also maps RAM region to different address than CPU.
> > > > > 
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > ---
> > > > > 
> > > > >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > > > b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index eba190b3f9de..ef1d03812636
> > > > > 100644
> > > > > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > > > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > > > > @@ -109,6 +109,7 @@
> > > > > 
> > > > >  		compatible = "simple-bus";
> > > > >  		#address-cells = <1>;
> > > > >  		#size-cells = <1>;
> > > > > 
> > > > > +		dma-ranges;
> > > > > 
> > > > >  		ranges;
> > > > >  		
> > > > >  		display_clocks: clock@1000000 {
> > > > > 
> > > > > @@ -538,6 +539,14 @@
> > > > > 
> > > > >  			};
> > > > >  		
> > > > >  		};
> > > > > 
> > > > > +		mbus: dram-controller@1c62000 {
> > > > > +			compatible = "allwinner,sun8i-h3-mbus";
> > > > > +			reg = <0x01c62000 0x1000>;
> > > > > +			clocks = <&ccu 113>;
> > > > > +			dma-ranges = <0x00000000 0x40000000
> > > 
> > > 0xc0000000>;
> > > 
> > > > > +			#interconnect-cells = <1>;
> > > > > +		};
> > > > > +
> > > > 
> > > > If that's easy enough to access, can you also add the references in
> > > > the devices that are already there? (CSI and DE comes to my mind, but
> > > > there might be others).
> > > 
> > > Strangely, DE2 doesn't use this offset. That was tested on OrangePi
> > > Plus2E,
> > > which has 2 GiB of RAM and subtracting this offset causes corrupted image.
> > 
> > Ok, weird. But if it was tested then fine by me :)
> > 
> > > But I can add this properties to CSI too. However, wouldn't that need CSI
> > > DT binding expansion with those properties? othetwise DT check will fail.
> > Oh right, we definitely need to update the binding indeed. The code
> > should be able to cope with both cases already.
> 
> I guess it's better to handle that with another patch series then? Changing 
> CSI bindings doesn't fit here.

Yeah, you can do it in a separate series if you prefer

Maxime
