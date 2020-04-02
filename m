Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5815E19C430
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732492AbgDBObT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 10:31:19 -0400
Received: from gloria.sntech.de ([185.11.138.130]:46710 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731715AbgDBObT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 10:31:19 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jK0sC-00087G-L4; Thu, 02 Apr 2020 16:31:12 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
Date:   Thu, 02 Apr 2020 16:31:11 +0200
Message-ID: <105956984.FXDh2DO4ZE@diego>
In-Reply-To: <970b9e48-e38f-7e7a-3472-7dc5a4737e58@gmail.com>
References: <20200402000234.226466-4-helen.koike@collabora.com> <970b9e48-e38f-7e7a-3472-7dc5a4737e58@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 2. April 2020, 15:48:02 CEST schrieb Johan Jonker:
> Hi Helen,
> 
> > From: Helen Koike <helen.koike@collabora.com>
> 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > index 33cc21fcf4c10..fc0295d2a65a1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> > @@ -1394,6 +1394,17 @@ io_domains: io-domains {
> >  			status = "disabled";
> >  		};
> >  
> 
> > +		mipi_dphy_rx0: mipi-dphy-rx0 {
> 
> For Heiko sort syscon@ff770000 subnodes alphabetical or reg value first?

Similar to main nodes ... so things without reg alphabetical,
the rest by reg address


> 
> > +			compatible = "rockchip,rk3399-mipi-dphy-rx0";
> > +			clocks = <&cru SCLK_MIPIDPHY_REF>,
> 
> > +				<&cru SCLK_DPHY_RX0_CFG>,
> > +				<&cru PCLK_VIO_GRF>;
> 
> Align                            ^
> 
> > +			clock-names = "dphy-ref", "dphy-cfg", "grf";
> > +			power-domains = <&power RK3399_PD_VIO>;
> > +			#phy-cells = <0>;
> > +			status = "disabled";
> > +		};
> > +
> >  		u2phy0: usb2-phy@e450 {
> >  			compatible = "rockchip,rk3399-usb2phy";
> >  			reg = <0xe450 0x10>;
> 
> 




