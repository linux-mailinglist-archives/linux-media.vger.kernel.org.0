Return-Path: <linux-media+bounces-38252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B956B0F1EE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B5E1AA64A2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC5C2E54DB;
	Wed, 23 Jul 2025 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HTMJFGU1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401D1DE3C8;
	Wed, 23 Jul 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272591; cv=none; b=abBIz10hhEJPNjXgpz1FgIPwZeGwVNMyuYyoLStURZNTvOLKf0wz1p4JS51f2dEl0uslXCmbosNjFkMYHorNdzsgv8mukmeavko/8Kt7BdBlaZWGcbpxZp8yHUAZlddDALLYwPzir17biPlpWQzHdf0fQa/iRhO5eoJwR/nOG6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272591; c=relaxed/simple;
	bh=siE8fG3tOa4csUecyxtY0hUOvcCp6sqnC8Vo2a9kR/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoAzUKjeeTUyzpS7Vj21TSvUUDjyuysxi7UAlt2QfGtIwkFj/oBH2unIVFVZb/VnnA/BlEXxjXkFL+cjVN/TqHMU26HAEFc2d1DY55tggec3wrcvFDS/ljWORXoaJ8aL+3ctYiwUa+WEYE9Ge0+epQid64biNBf739GTbBEkdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HTMJFGU1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06899346;
	Wed, 23 Jul 2025 14:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753272547;
	bh=siE8fG3tOa4csUecyxtY0hUOvcCp6sqnC8Vo2a9kR/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTMJFGU14p10/IwOa7/UFpK/pDUt/w7K6xknyd7yj0E+Z+etsPiDRFNQUCPmXeCRc
	 xO2GDyIJ2qefRL/3HeF2X7qhGuXEoxOQsrAqVaaYNzweILJ8gGsfGAktcm8N33fQE+
	 g2MDZwgP3QWB7R+eaOKCLAr4CD+DrN315ufz7ERM=
Date: Wed, 23 Jul 2025 15:09:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
Message-ID: <20250723120942.GB10291@pendragon.ideasonboard.com>
References: <m3h5zbxkc6.fsf@t19.piap.pl>
 <m38qknx939.fsf@t19.piap.pl>
 <175308758352.3134829.9472501038683860006@localhost>
 <m31pq9y98z.fsf@t19.piap.pl>
 <175326599663.2811177.16620980968274114885@localhost>
 <m3seinw1po.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3seinw1po.fsf@t19.piap.pl>

On Wed, Jul 23, 2025 at 02:06:43PM +0200, Krzysztof Hałasa wrote:
> Stefan Klug writes:
> 
> > Just a quick heads up. I ran the tester and so far no unexpected
> > results. I'll run it from time to time after a reboot to see if I ever
> > hit that condition.
> >
> > How does your device tree look like? Any chance the ISP is clocked for
> > overdrive but the device is not or something similar? Although I have a
> > hard time imagining how that would lead to such effects.
> 
> Interesting.
> I tested it on two different devices (a Compulab UCM-based camera and
> a Solidrun Hummingboard Mate) and it's the same on both. I think the
> first one uses 1600 MHz industrial CPU:
> 
> (U-boot) CPU: i.MX8MP[8] rev1.1 at 1200 MHz
> 
> Not sure about the Hummingboard.
> 
> Both cameras apparently are connected to the second MIPI.
> 
> Well... maybe if it's only the second ISP, and there is only one camera,
> then we could reroute the data to the first ISP? The MIPI receiver has
> a crossbar I think.

There's a crossbar switch in the ISI, but the connections from CSI-2
receivers to ISPs are fixed.

Have you tried reporting the issue to NXP ?

> And the other way around: for a test, one could reroute MIPI0 to ISP1.
> Will have a look.
> 
> The DT has the usual stuff (for the second MIPI/ISP):
> 
> &i2c6 {
> 	clock-frequency = <400000>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pinctrl_i2c6>;
> 	single-master;
> 	status = "okay";
> 
> 	imx462_camera@1a {
> 		compatible = "sony,imx462";
> 		reg = <0x1a>;
> 		clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> 		clock-names = "xclk";
> 		clock-frequency = <37125000>;
> 		reset-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> 		status = "okay";
> 
> 		port {
> 			imx462_mipi_ep: endpoint {
> 				data-lanes = <1 2 3 4>;
> 				clock-lanes = <0>;
> 				link-frequencies = /bits/ 64 <222750000 148500000>;
> 				remote-endpoint = <&mipi_csi_1_in>;
> 			};
> 		};
> 	};
> 
> };
> 
> &mipi_csi_1 {
>     status = "okay";
> 
>     ports {
>         port@0 {
>             reg = <0>;
>             mipi_csi_1_in: endpoint {
>                 remote-endpoint = <&imx462_mipi_ep>;
>                 data-lanes = <1 2 3 4>;
>             };
>         };
> 
>         port@1 {
>             reg = <1>;
>             mipi_csi_1_out: endpoint {
>                 remote-endpoint = <&isp_1_in>;
>             };
>         };
>     };
> };
> 
> &isp_1 {
>     status = "okay";
> 
>     ports {
>         port@1 {
>             isp_1_in: endpoint {
>                 bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>                 remote-endpoint = <&mipi_csi_1_out>;
>             };
>         };
>     };
> };
> 
> The CCM registers show basically (p. 229 in i.MX8MP ref manual):
>   8 MEDIA_ISP           mux 7       post 0 SYSTEM_PLL2_DIV2 = 500 MHz
>  20 MEDIA_AXI           mux 1 pre 1 post 0 SYSTEM_PLL2_CLK / 2 = 500 MHz
>  21 MEDIA_APB           mux 2 pre 3 post 0 SYSTEM_PLL1_CLK / 4 = 200 MHz
> 123 MEDIA_MIPI_PHY1_REF mux 0 pre 0 post 0 24M_REF_CLK = 24 MHz
> 125 MEDIA_CAM2_PIX      mux 2 pre 0 post 0 SYSTEM_PLL2_DIV4 = 250 MHz
> 
> The first 3 are at the max values, MEDIA_MIPI_PHY1_REF max is 125 MHz,
> MEDIA_CAM2_PIX max is 266 MHz. Maybe I should try changing these clocks,
> but not sure how do I do that (any change causes rkisp1 driver loading
> to fail). Will look at it.
> 
> BTW the double read and double write in NXP driver (isp-vvcam) were
> introduced by (in their repo):
> 
> Author: hexing <Xing.He@verisilicon.com>  2022-08-05 10:19:49
> Committer: Robby Cai <robby.cai@nxp.com>  2022-08-08 04:50:48
> 
> M865SW-1031: the second isp port jump frames
> 
> Reason:mi read or write reg occasionally it does not take effect
> 
> WorkAround:read or write twice of mi reg
> 
> ---------------------------- vvcam/isp/isp_ioctl.c ----------------------------
> index 60741bd..e0d3048 100644
> @@ -118,5 +118,8 @@ void isp_write_reg(struct isp_ic_dev *dev, u32 offset, u32 val)
>  	if (offset >= ISP_REG_SIZE)
>  		return;
> -	__raw_writel(val, dev->base + offset);
> +	writel(val, dev->base + offset);
> +	if ((offset >= REG_ADDR(mi_mp_y_base_ad_init))
> +		&& (offset <= REG_ADDR(mi_mp_y_pic_size)))
> +		writel(val, dev->base + offset);
>  //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
>  }
> @@ -128,5 +131,8 @@ u32 isp_read_reg(struct isp_ic_dev *dev, u32 offset)
>  	if (offset >= ISP_REG_SIZE)
>  		return 0;
> -	val = __raw_readl(dev->base + offset);
> +	val = readl(dev->base + offset);
> +	if ((offset >= REG_ADDR(mi_mp_y_base_ad_init))
> +		&& (offset <= REG_ADDR(mi_mp_y_pic_size)))
> +		val = readl(dev->base + offset);
>  //	  isp_info("%s	addr 0x%08x val 0x%08x\n", __func__, offset, val);
>  	return val;
> 

-- 
Regards,

Laurent Pinchart

