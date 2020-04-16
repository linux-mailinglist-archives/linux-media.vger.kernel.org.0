Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E461AC649
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393700AbgDPOLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:11:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393673AbgDPOLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:11:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 117862A20C3
Message-ID: <765aa9ab4f354df47f587711603fba6ffd358147.camel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Johan Jonker <jbx6244@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Thu, 16 Apr 2020 11:11:12 -0300
In-Reply-To: <20200416135519.GJ125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
         <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
         <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
         <20200416132442.GI125838@aptenodytes>
         <f4ad8ea4-7904-1458-e564-2d20c87ed417@gmail.com>
         <20200416135519.GJ125838@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-04-16 at 15:55 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Thu 16 Apr 20, 15:44, Johan Jonker wrote:
> > On 4/16/20 3:24 PM, Paul Kocialkowski wrote:
> > > Hi,
> > > 
> > > On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
> > > > Hi Paul,
> > > > 
> > > > The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
> > > > has been approved by robh.
> > > 
> > > Huh, I looked around for ongoing related work but missed it.
> > > I'll definitely rebase on top of your series and use the yaml description
> > > instead. Thanks!
> > > 
> > > > Maybe place dts patches at the end of a patch serie.
> > > > Could you include a &rga patch if your device is supported in mainline,
> > > > so we can test with:
> > > > make ARCH=arm64 dtbs_check
> > > > DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > > 
> > > I tested with the PX30 EVB so I can surely add a node there if that turns
> > > out necessary (see below).
> > > 
> > > > Johan
> > > > 
> > > > On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
> > > > > The PX30 features a RGA block: add the necessary node to support it.
> > > > > 
> > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
> > > > >  1 file changed, 11 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > > > > index 75908c587511..4bfbee9d4123 100644
> > > > > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > > > > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > > > > @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
> > > > >  		status = "disabled";
> > > > >  	};
> > > > >  
> > > > > +	rga: rga@ff480000 {
> > > > > +		compatible = "rockchip,px30-rga";
> > > > > +		reg = <0x0 0xff480000 0x0 0x10000>;
> > > > > +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> > > > > +		clock-names = "aclk", "hclk", "sclk";
> > > > > +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> > > > > +		reset-names = "core", "axi", "ahb";
> > > > > +		power-domains = <&power PX30_PD_VO>;
> > > > 
> > > > 		status = "disabled";
> > > 
> > > As of 5.6, the rk3399 has the node enabled by default. Did that change?
> > 
> > 'status' disappeared during review for rk3399 between v2 and v3, but
> > doesn't mention the reason. If someone can give more info here?
> > 
> > https://lore.kernel.org/lkml/1500101920-24039-5-git-send-email-jacob-chen@iotwrt.com/
> > 
> > https://lore.kernel.org/lkml/1501470460-12014-5-git-send-email-jacob-chen@iotwrt.com/
> > 
> > > Since it's a standalone block that has no I/O dependency, I don't really see
> > > the point of disabling it by default.
> > 
> > Vop, hdmi and other video devices are also disabled.
> > Follow the rest I think...
> 
> Well, these blocks do have related I/O ports so it makes sense not to enable
> them by default because of pinmux, or because there might be no connector
> populated/routed.
> 
> For a memory to memory internal block, I don't see any reason why.
> It's definitely not board-specific and having to add these nodes for every board
> that has them is kind of a pain and might be overlooked. This will easily result
> in the feature not being available for end users without having to change the
> dt.
> 
> Also, the vpu node is always enabled on rockchip (and sunxi) platforms.
> I think these are better examples to follow.
> 

It's exactly as Paul just said :-)

Not board specific, no reason to disable, and also
no way to know under what condition you'd enable.

Thanks,
Ezequiel

