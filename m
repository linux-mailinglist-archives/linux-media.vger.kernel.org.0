Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA04760DF3
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 11:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjGYJEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 05:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjGYJEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 05:04:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744B99B
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 02:04:47 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A41E4E6;
        Tue, 25 Jul 2023 11:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690275827;
        bh=ccLYXja1hofuTVdVnSVwnk1jZxD5zFVMYb2OCfuhZjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U3ZVr/3vppJiWWjzCfYws8eiuIzNpUcqFCqf4xFZdhizQPY4e+GEgNne5FfkifW8y
         LJZVr9Cv4gIDIGl2vqVRV7qRLpc+zlld/CYdRHbCgmk5FTGMS3NR6NtV1VLPOoHaax
         A8l7Im2PDviwR6kfLQ+e50yoNanFKSOe2Z9PyDRg=
Date:   Tue, 25 Jul 2023 11:04:41 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Message-ID: <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
References: <20230724222210.162785-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230724222210.162785-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek

On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
> Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
> MIPI CSI2 interface, while 0 means CPI parallel interface.
>
> In the ov5640_set_power_mipi() the interface should obviously be set
> to MIPI CSI2 since this functions is used to power up the sensor when
> operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
> that case.

Does this actually help fixing your 'first frame corrupted issue' ?

I think the logic here was to power up the interface here  in
ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
LP-11 mode (something some receivers like the imx6 one are
particularly sensible to).

Then at stream time the CSI-2 interface is actually enabled in
ov5640_set_stream_mipi() just before streaming is started.

Also the register documentation is very confusing and as reported in
ov5640_set_stream_mipi() it is also probably wrong (at least in the
datasheet version I have).

I would be particularly cautious in touching this sequence as it has
been validated to work with multiple receivers. Of course if it
actually fixes an issue for you it should be taken in, but ideally, as
this sensor is still used in a large number of evaluation boards, it
should be validated by other consumers of this driver (st, imx,
microchip and rensas to name a few).

Thanks
   j

>
> Fixes: aa4bb8b8838f ("media: ov5640: Re-work MIPI startup sequence")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/i2c/ov5640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8f21839b08c78..8b7ff2f3bdda7 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2539,9 +2539,9 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 *		  "ov5640_set_stream_mipi()")
>  	 * [4] = 0	: Power up MIPI HS Tx
>  	 * [3] = 0	: Power up MIPI LS Rx
> -	 * [2] = 0	: MIPI interface disabled
> +	 * [2] = 1	: MIPI interface enabled
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x44);
>  	if (ret)
>  		return ret;
>
> --
> 2.40.1
>
