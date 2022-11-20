Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63926315D9
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 20:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKTT12 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 14:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTT11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 14:27:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D12DAA1
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 11:27:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DF4330A;
        Sun, 20 Nov 2022 20:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668972441;
        bh=OPTnyuAMhbgCI9M9cZLRQq1C4zmUg12g7IiobUNZrd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SvyfRnJnhi5CPDkciTi3E21kgDuj+uTfqPmZnY3AF6bqplhK6P63QxncuS0SHt7XY
         3H0j1uWXjJdcOPlnviLf6Vtk8+vvpM/oV0EG4bJ9olJI3JT+Kne9qjzz18U5jQ5H5k
         DtDv8SFNcGgkl+ipZfAA4pnGYiqvBC9dZ5v21Tic=
Date:   Sun, 20 Nov 2022 21:27:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH v2] media: mt9p031: Increase post-reset delay
Message-ID: <Y3p/ioswT4W4IW3L@pendragon.ideasonboard.com>
References: <20220823222216.411656-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823222216.411656-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Wed, Aug 24, 2022 at 12:22:16AM +0200, Marek Vasut wrote:
> The MT9P006 sensor driver sporadically fails to probe because the sensor
> responds with a NACK condition to I2C address on the bus during an attempt
> to read the sensor MT9P031_CHIP_VERSION register in mt9p031_registered().
> 
> Neither the MT9P006 nor MT9P031 datasheets are clear on reset signal timing.
> Older MT9M034 [1] datasheet provides those timing figures in Appendix-A and
> indicates it is necessary to wait 850000 EXTCLK cycles before starting any
> I2C communication.
> 
> Add such a delay, which does make the sporadic I2C NACK go away, so it is
> likely similar constraint applies to this sensor.
> 
> [1] https://www.onsemi.com/pdf/datasheet/mt9m034-d.pdf
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Given the lack of information regarding the MT9P006 reset timings, this
seems to be the best we can do.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> V2: - In case clk_get_rate() returns 0, use slowest supported clock
>       to avoid division by zero
> ---
>  drivers/media/i2c/mt9p031.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 45f7b5e52bc39..5f5caafe56887 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -307,6 +307,7 @@ static inline int mt9p031_pll_disable(struct mt9p031 *mt9p031)
>  
>  static int mt9p031_power_on(struct mt9p031 *mt9p031)
>  {
> +	unsigned long rate, delay;
>  	int ret;
>  
>  	/* Ensure RESET_BAR is active */
> @@ -334,7 +335,12 @@ static int mt9p031_power_on(struct mt9p031 *mt9p031)
>  	/* Now RESET_BAR must be high */
>  	if (mt9p031->reset) {
>  		gpiod_set_value(mt9p031->reset, 0);
> -		usleep_range(1000, 2000);
> +		/* Wait 850000 EXTCLK cycles before de-asserting reset. */
> +		rate = clk_get_rate(mt9p031->clk);
> +		if (!rate)
> +			rate = 6000000;	/* Slowest supported clock, 6 MHz */
> +		delay = DIV_ROUND_UP(850000 * 1000, rate);
> +		msleep(delay);
>  	}
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
