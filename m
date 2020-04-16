Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7686A1AC5EB
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394247AbgDPOaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:30:20 -0400
Received: from gloria.sntech.de ([185.11.138.130]:60506 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388838AbgDPOaS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:30:18 -0400
Received: from p508fd440.dip0.t-ipconnect.de ([80.143.212.64] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jP5Ws-0006nR-Ft; Thu, 16 Apr 2020 16:30:10 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Johan Jonker <jbx6244@gmail.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
Date:   Thu, 16 Apr 2020 16:30:09 +0200
Message-ID: <5650280.YqRd2a6hF0@phil>
In-Reply-To: <20200416135519.GJ125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com> <f4ad8ea4-7904-1458-e564-2d20c87ed417@gmail.com> <20200416135519.GJ125838@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 16. April 2020, 15:55:19 CEST schrieb Paul Kocialkowski:
> Hi,
> 
> On Thu 16 Apr 20, 15:44, Johan Jonker wrote:
> > On 4/16/20 3:24 PM, Paul Kocialkowski wrote:
> > > Hi,
> > > 
> > > On Thu 16 Apr 20, 15:02, Johan Jonker wrote:
> > >> Hi Paul,
> > >>
> > >> The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
> > >> has been approved by robh.
> > > 
> > > Huh, I looked around for ongoing related work but missed it.
> > > I'll definitely rebase on top of your series and use the yaml description
> > > instead. Thanks!
> > > 
> > >> Maybe place dts patches at the end of a patch serie.
> > >> Could you include a &rga patch if your device is supported in mainline,
> > >> so we can test with:
> > >> make ARCH=arm64 dtbs_check
> > >> DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > > 
> > > I tested with the PX30 EVB so I can surely add a node there if that turns
> > > out necessary (see below).
> > > 
> > >> Johan
> > >>
> > >> On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
> > >>> The PX30 features a RGA block: add the necessary node to support it.
> > >>>
> > >>> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > >>> ---
> > >>>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
> > >>>  1 file changed, 11 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > >>> index 75908c587511..4bfbee9d4123 100644
> > >>> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > >>> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > >>> @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
> > >>>  		status = "disabled";
> > >>>  	};
> > >>>  
> > >>> +	rga: rga@ff480000 {
> > >>> +		compatible = "rockchip,px30-rga";
> > >>> +		reg = <0x0 0xff480000 0x0 0x10000>;
> > >>> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> > >>> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> > >>> +		clock-names = "aclk", "hclk", "sclk";
> > >>> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> > >>> +		reset-names = "core", "axi", "ahb";
> > >>> +		power-domains = <&power PX30_PD_VO>;
> > >>
> > >> 		status = "disabled";
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
> > > 
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

just to add my me too ... what Paul, Ezequiel and Robin said - so no status
for soc internal components without any board-specifics


Heiko


