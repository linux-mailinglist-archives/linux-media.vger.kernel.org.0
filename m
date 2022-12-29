Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF20658FF4
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 18:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiL2Rhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Dec 2022 12:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbiL2RhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Dec 2022 12:37:15 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B683015831
        for <linux-media@vger.kernel.org>; Thu, 29 Dec 2022 09:37:13 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E88061C0002;
        Thu, 29 Dec 2022 17:37:09 +0000 (UTC)
Date:   Thu, 29 Dec 2022 18:37:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v3 3/3] media: ov5640: Honor power on time in init_setting
Message-ID: <20221229173708.mslbxek6eeia7tz7@uno.localdomain>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-4-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227173634.5752-4-j-luthra@ti.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Tue, Dec 27, 2022 at 11:06:34PM +0530, Jai Luthra wrote:
> From: Nishanth Menon <nm@ti.com>
>
> OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
> that is expected during various initialization steps. Note the power
> on time includes t0 + t1 + t2 >= 5ms, delay for poweron.
>
> As indicated in section 2.8, the PWDN assertion can either be via
> external pin control OR via the register 0x3008 bit 6 (see table 7-1 in
> [1])
>
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5df16fb6f0a0..bd7cc294cfe6 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -609,7 +609,7 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>  	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>  	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
>  };
>
>  static const struct reg_value ov5640_setting_low_res[] = {
> @@ -1810,9 +1810,17 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
> +	int ret;
> +
> +	if (on) {
> +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +				       OV5640_REG_SYS_CTRL0_SW_PWUP);
> +		usleep_range(5000, 6000);
> +	} else {
> +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +				       OV5640_REG_SYS_CTRL0_SW_PWDN);
> +	}
> +	return ret;

Nipicking, I prefer maintaining the original version with just an
additional usleep

        int ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
                                   OV5640_REG_SYS_CTRL0_SW_PWUP :
                                   OV5640_REG_SYS_CTRL0_SW_PWDN);

        if (on)
                usleep_range(5000, 6000);

        return ret;

As you prefer

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>



>  }
>
>  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> --
> 2.17.1
>
