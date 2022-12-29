Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837FD659022
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 19:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiL2SKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Dec 2022 13:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiL2SKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Dec 2022 13:10:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C0512A90
        for <linux-media@vger.kernel.org>; Thu, 29 Dec 2022 10:10:40 -0800 (PST)
Received: from ideasonboard.com (host-79-41-191-169.retail.telecomitalia.it [79.41.191.169])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74C97283;
        Thu, 29 Dec 2022 19:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672337438;
        bh=tuEIFxJ1fNnqU6GI4jfwk4LOrNR9BNv6DzRfKBW1bBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Van/6C9Jyrkmdng06HCycK9OjbF3SzoUdj7cLy0dgypwmDeCSGiAT66uSEPmwqngs
         HO0Fia1DstYzmkHOBdcx+NecJfeutWmb7G/Th5v5OTWtzx4d2VYC1+caCOJc0hvXCk
         N9zc5cQEp8DbZzaX9No/hbqSMES/X+EX8c/eK6hE=
Date:   Thu, 29 Dec 2022 19:10:36 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 3/3] media: ov5640: Honor power on time in init_setting
Message-ID: <20221229181036.a6eldz42eaksared@uno.localdomain>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-4-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227173634.5752-4-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again

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

This might also allow to remove the

		/* remain in power down mode for DVP */
		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
		    !ov5640_is_csi2(sensor))
			continue;

in ov5640_load_regs()

Prabhakar since you have introduced it, coudl you test if you still
need it with Nishanth's patch applied ?

Thanks
  j


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
>  }
>
>  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> --
> 2.17.1
>
