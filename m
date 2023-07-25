Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979DB760DFC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 11:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbjGYJJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 05:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbjGYJJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 05:09:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED6110C9
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 02:09:26 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 216894E6;
        Tue, 25 Jul 2023 11:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690276106;
        bh=OBODB7RONu8DQ6qyonlUUEEGp/RsmGZaxZ2IzpGOy38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YQ5iLxs2D+PEUmyZ/LsDNL2+WFGfu8vRencsoGXaWyHKhHLvE2eGKB/5YosbHE8Gy
         EH+h0xv3FY1NW+ynuNjNi1CwIEhBf3bKrxzmXB1DDfEGvAXhG/VU3pNonpAu5GXcEw
         nNEiBGpoEyS2ESiKmOpCcA/rtlWEI3jSoW4EkZ5w=
Date:   Tue, 25 Jul 2023 11:09:20 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>, Jai Luthra <j-luthra@ti.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] media: ov5640: Fix initial RESETB state and annotate
 timings
Message-ID: <4ileh7epyghpyy4sldufzgbssdplpli7motchwo2gosf3grxst@dnvnxfdm5mlv>
References: <20230724222116.162555-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230724222116.162555-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cc Jai which has recently changed this part to accomodate a design
where RESETB and PWDN are not exposed as separate lines

On Tue, Jul 25, 2023 at 12:21:16AM +0200, Marek Vasut wrote:
> The initial state of RESETB input signal of OV5640 should be
> asserted, i.e. the sensor should be in reset. This is not the
> case, make it so.
>
> Since the subsequent assertion of RESETB signal is no longer
> necessary and the timing of the power sequencing could be
> slightly adjusted, add annotations to the delays which match
> OV5640 datasheet rev. 2.03, both:
>   figure 2-3 power up timing with internal DVDD
>   figure 2-4 power up timing with external DVDD source
>
> The 5..10ms delay between PWDN assertion and RESETB assertion
> is not even documented in the power sequencing diagram, and
> with this reset fix, it is no longer even necessary.
>
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Reported-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/i2c/ov5640.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 7c065c39082dd..74b58380b5e69 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2452,16 +2452,13 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>  static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
>  	if (sensor->pwdn_gpio) {
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>
>  		/* camera power cycle */
>  		ov5640_power(sensor, false);

This is also probably a NOP for most designs but the one Jai had, as
in his case a single "powerdown" line controls both PWDN and RESETB
with some internal circuitry that handles signals inversions and
delays. So I guess it is fine to have it here.

> -		usleep_range(5000, 10000);
> +		usleep_range(5000, 10000);	/* t2 */
>  		ov5640_power(sensor, true);
> -		usleep_range(5000, 10000);
> -
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> -		usleep_range(1000, 2000);
> +		usleep_range(1000, 2000);	/* t3 */
>
>  		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>  	} else {
> @@ -2469,7 +2466,7 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
>  				 OV5640_REG_SYS_CTRL0_SW_RST);
>  	}
> -	usleep_range(20000, 25000);
> +	usleep_range(20000, 25000);	/* t4 */


This all looks good to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Jai could you give this a run to make sure this works on your setup as
well ?

Thanks
  j

>
>  	/*
>  	 * software standby: allows registers programming;
> --
> 2.40.1
>
