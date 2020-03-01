Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEE2174A62
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2020 01:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgCAAO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 19:14:26 -0500
Received: from gloria.sntech.de ([185.11.138.130]:55596 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgCAAO0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 19:14:26 -0500
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j8CFP-0004wQ-83; Sun, 01 Mar 2020 01:14:19 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Johan Jonker <jbx6244@gmail.com>, boris.brezillon@collabora.com,
        devicetree@vger.kernel.org, hverkuil@xs4all.nl, jonas@kwiboo.se,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, nicolas@ndufresne.ca,
        paul.kocialkowski@bootlin.com, robh+dt@kernel.org,
        sakari.ailus@iki.fi, tfiga@chromium.org
Subject: Re: [PATCH v6 6/6] arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
Date:   Sun, 01 Mar 2020 01:14:18 +0100
Message-ID: <5203620.inz0EcJmRN@phil>
In-Reply-To: <8b63465c795bb0c8243eb377106138c83e0dfffe.camel@collabora.com>
References: <20200220163016.21708-7-ezequiel@collabora.com> <3584403.hvncmGE4DP@phil> <8b63465c795bb0c8243eb377106138c83e0dfffe.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 26. Februar 2020, 18:22:11 CET schrieb Ezequiel Garcia:
> Hi Heiko, Johan,
> 
> Thanks for pointing this out.
> 
> On Wed, 2020-02-26 at 14:21 +0100, Heiko Stuebner wrote:
> > Am Mittwoch, 26. Februar 2020, 13:24:53 CET schrieb Johan Jonker:
> > > Hi Boris,
> > > 
> > > Dtsi nodes are sort on address.
> > > The vdec node is now inserted between:
> > > 
> > > vdec_mmu: iommu       @ff660480
> > > vdec    : video-codec @ff660000
> > > iep_mmu : iommu       @ff670800
> > > 
> > > This should be:
> > > 
> > > vpu_mmu : iommu       @ff650800
> > > vdec    : video-codec @ff660000
> > > vdec_mmu: iommu       @ff660480
> > > 
> > 
> > Simple things like this I can (and do) fix when applying.
> > 
> > The interesting question would be, did patches 1-5 get applied yet?
> > As I only remember seing Hans' mail from v5, but didn't get any
> > applied mail for v6 so far.
> > 
> 
> Hans sent a pull request to include rkvdec driver in v5.7:
> 
> https://lore.kernel.org/linux-media/d4cc12b2-3d24-95db-102b-e5091c067e76@xs4all.nl/T/#t
> 
> It doesn't include the devicetree changes though,
> which I just noticed.
> 
> Would you be so kind to pick this patch and sort the node?

so far that pull you linked hasn't gone through it seems

And I also cannot see the driver patches in [0] yet, so I'll give this
some more days before applying.

Heiko

[0] https://git.linuxtv.org/media_tree.git/log/

> > > > From: Boris Brezillon <boris.brezillon at collabora.com>
> > > > 
> > > > RK3399 has a Video decoder, define the node in the dtsi. We also add
> > > > the missing power-domain in mmu node and enable the block.
> > > > 
> > > > Signed-off-by: Boris Brezillon <boris.brezillon at collabora.com>
> > > > Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > index 33cc21fcf4c1..a07f857df12f 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > > > @@ -1285,8 +1285,20 @@ vdec_mmu: iommu at ff660480 {
> > > >  		interrupt-names = "vdec_mmu";
> > > >  		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>;
> > > >  		clock-names = "aclk", "iface";
> > > > +		power-domains = <&power RK3399_PD_VDU>;
> > > >  		#iommu-cells = <0>;
> > > > -		status = "disabled";
> > > > +	};
> > > > +
> > > > +	vdec: video-codec at ff660000 {
> > > > +		compatible = "rockchip,rk3399-vdec";
> > > > +		reg = <0x0 0xff660000 0x0 0x400>;
> > > > +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +		interrupt-names = "vdpu";
> > > > +		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
> > > > +			 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
> > > > +		clock-names = "axi", "ahb", "cabac", "core";
> > > > +		power-domains = <&power RK3399_PD_VDU>;
> > > > +		iommus = <&vdec_mmu>;
> > > >  	};
> > > >  
> > > >  	iep_mmu: iommu at ff670800 {
> > > 
> > > 
> > > 
> > 
> > 
> > 
> 
> 
> 




