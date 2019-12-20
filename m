Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79779127F26
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 16:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfLTPTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 10:19:44 -0500
Received: from mga01.intel.com ([192.55.52.88]:52666 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727233AbfLTPTo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 10:19:44 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 07:19:43 -0800
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; 
   d="scan'208";a="299040892"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 07:19:41 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CAF87209B3; Fri, 20 Dec 2019 17:19:39 +0200 (EET)
Date:   Fri, 20 Dec 2019 17:19:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH] media: i2c: ov5695: Fix power on and off sequences
Message-ID: <20191220151939.GA19828@paasikivi.fi.intel.com>
References: <20191220130800.61589-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220130800.61589-1-tfiga@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Fri, Dec 20, 2019 at 10:08:00PM +0900, Tomasz Figa wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> From the measured hardware signal, OV5695 reset pin goes high for a
> short period of time during boot-up. From the sensor specification, the
> reset pin is active low and the DT binding defines the pin as active
> low, which means that the values set by the driver are inverted and thus
> the value requested in probe ends up high.
> 
> Fix it by changing probe to request the reset GPIO initialized to high,
> which makes the initial state of the physical signal low.
> 
> In addition, DOVDD rising must occur before DVDD rising from spec., but
> regulator_bulk_enable() API enables all the regulators asynchronously.
> Use an explicit loops of regulator_enable() instead.
> 
> For power off sequence, it is required that DVDD falls first. Given the
> bulk API does not give any guarantee about the order of regulators,
> change the driver to use regulator_disable() instead.
> 
> The sensor also requires a delay between reset high and first I2C
> transaction, which was assumed to be 8192 XVCLK cycles, but 1ms is
> recommended by the vendor. Fix this as well.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  drivers/media/i2c/ov5695.c | 41 +++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index d6cd15bb699ac..8d0cc3893fcfc 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -971,16 +971,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
>  	return ret;
>  }
>  
> -/* Calculate the delay in us by clock rate and clock cycles */
> -static inline u32 ov5695_cal_delay(u32 cycles)
> -{
> -	return DIV_ROUND_UP(cycles, OV5695_XVCLK_FREQ / 1000 / 1000);
> -}
> -
>  static int __ov5695_power_on(struct ov5695 *ov5695)
>  {
> -	int ret;
> -	u32 delay_us;
> +	int i, ret;
>  	struct device *dev = &ov5695->client->dev;
>  
>  	ret = clk_prepare_enable(ov5695->xvclk);
> @@ -991,21 +984,24 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
>  
>  	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
>  
> -	ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators\n");
> -		goto disable_clk;
> +	for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
> +		ret = regulator_enable(ov5695->supplies[i].consumer);

The regulator voltage takes some time before it settles. If the hardware
requires a particular order, then presumably there should be a small delay
to ensure that. 1 ms should be plenty.

I also think it'd be necessary to add a comment here explaining the
requirements for enabling regulators, as otherwise I expect someone to
"fix" this sooner or later.

Same for powering off.

> +		if (ret) {
> +			dev_err(dev, "Failed to enable %s: %d\n",
> +				ov5695->supplies[i].supply, ret);
> +			goto disable_reg_clk;
> +		}
>  	}
>  
>  	gpiod_set_value_cansleep(ov5695->reset_gpio, 0);
>  
> -	/* 8192 cycles prior to first SCCB transaction */
> -	delay_us = ov5695_cal_delay(8192);
> -	usleep_range(delay_us, delay_us * 2);
> +	usleep_range(1000, 1200);
>  
>  	return 0;
>  
> -disable_clk:
> +disable_reg_clk:
> +	for (--i; i >= 0; i--)
> +		regulator_disable(ov5695->supplies[i].consumer);
>  	clk_disable_unprepare(ov5695->xvclk);
>  
>  	return ret;
> @@ -1013,9 +1009,18 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
>  
>  static void __ov5695_power_off(struct ov5695 *ov5695)
>  {
> +	struct device *dev = &ov5695->client->dev;
> +	int i, ret;
> +
>  	clk_disable_unprepare(ov5695->xvclk);
>  	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
> -	regulator_bulk_disable(OV5695_NUM_SUPPLIES, ov5695->supplies);
> +
> +	for (i = OV5695_NUM_SUPPLIES - 1; i >= 0; i--) {
> +		ret = regulator_disable(ov5695->supplies[i].consumer);
> +		if (ret)
> +			dev_err(dev, "Failed to disable %s: %d\n",
> +				ov5695->supplies[i].supply, ret);
> +	}
>  }
>  
>  static int __maybe_unused ov5695_runtime_resume(struct device *dev)
> @@ -1285,7 +1290,7 @@ static int ov5695_probe(struct i2c_client *client,
>  	if (clk_get_rate(ov5695->xvclk) != OV5695_XVCLK_FREQ)
>  		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
>  
> -	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov5695->reset_gpio)) {
>  		dev_err(dev, "Failed to get reset-gpios\n");
>  		return -EINVAL;

-- 
Kind regards,

Sakari Ailus
