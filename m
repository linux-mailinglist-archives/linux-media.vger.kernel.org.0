Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C117F248
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 09:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCJIuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 04:50:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:47014 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgCJIue (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 04:50:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 01:50:33 -0700
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
   d="scan'208";a="353571216"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 01:50:30 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8506F209DF; Tue, 10 Mar 2020 10:50:27 +0200 (EET)
Date:   Tue, 10 Mar 2020 10:50:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5645: Switch to assigned-clock-rates
Message-ID: <20200310085027.GA5379@paasikivi.fi.intel.com>
References: <1583754373-16510-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583754373-16510-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583754373-16510-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Mar 09, 2020 at 11:46:13AM +0000, Lad Prabhakar wrote:
> This patch switches to assigned-clock-rates for specifying the clock rate.
> The clk-conf.c internally handles setting the clock rate, as a result
> setting the clk rate from the driver is dropped.
> 
> Correspondingly imx6qdl-wandboard.dtsi which references to ov5645 has been
> updated to use assigned-clock-rates in the same patch to avoid bisect
> failures.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm/boot/dts/imx6qdl-wandboard.dtsi | 3 ++-
>  drivers/media/i2c/ov5645.c               | 9 ++-------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> index c070893..71f5f75 100644
> --- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> @@ -126,7 +126,8 @@
>  		reg = <0x3c>;
>  		clocks = <&clks IMX6QDL_CLK_CKO2>;
>  		clock-names = "xclk";
> -		clock-frequency = <24000000>;
> +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates = <24000000>;
>  		vdddo-supply = <&reg_1p8v>;
>  		vdda-supply = <&reg_2p8v>;
>  		vddd-supply = <&reg_1p5v>;

Shouldn't this be a separate patch?

> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a6c17d1..2aa2677 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1094,7 +1094,8 @@ static int ov5645_probe(struct i2c_client *client)
>  		return PTR_ERR(ov5645->xclk);
>  	}
>  
> -	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> +	ret = of_property_read_u32(dev->of_node, "assigned-clock-rates",
> +				   &xclk_freq);

I think you'd still need to check for clock-frequency to be compatible with
existing DT binaries.

>  	if (ret) {
>  		dev_err(dev, "could not get xclk frequency\n");
>  		return ret;
> @@ -1107,12 +1108,6 @@ static int ov5645_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> -	}
> -
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];
>  

-- 
Regards,

Sakari Ailus
