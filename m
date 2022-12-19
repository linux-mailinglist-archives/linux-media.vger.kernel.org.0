Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA646509C7
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 11:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbiLSKK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 05:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiLSKK2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 05:10:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84875FCB
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 02:10:27 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21592825;
        Mon, 19 Dec 2022 11:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671444626;
        bh=hOq8Pkztqg5oE/x9LbX/sSre5kgLt2bOOF5V59w5uWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VM3ScZFyIqCnpdhpHXx5P1AaYR+elQTAZCaoDZ51G/fygPEu656T9PyeDqM00cqwk
         FZ5nUC16AvcIAewdU9wyLHmXwlGTReH6IlDZbx17lKlVwmbt8tPOrEiKoH9XZKlAhE
         5vANWS8XqwddRzRHpmXtLj8fDo7yt78bDBlWGa/I=
Date:   Mon, 19 Dec 2022 11:10:23 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 3/3] media: ov5640: Honor power on time in init_setting
Message-ID: <20221219101023.kgctbtqbuq6ajjmo@uno.localdomain>
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-4-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216134409.6868-4-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Fri, Dec 16, 2022 at 07:14:09PM +0530, Jai Luthra wrote:
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
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index fa84e60de0db..ff2a2c9358e7 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -608,7 +608,7 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>  	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>  	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},

Two observations:

as per the description of register 0x3008

3008 default value = 0x02
3008[7] = Software Reset
3008[6] = Software Power Down

The init_settings[] register table has these entries at the very
beginning

	{0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},

and ends with the entry you have modified

        {0x3008, 0x02, 0, 5}

As I read from the 2.8 section of the datasheet

A reset can also be initiated through the SCCB interface by setting
register 0x3008[7] to high.

So I presume the first two registers entries:

	{0x3008, 0x82, 0, 5} -> Start a SW reset and wait 5 msec
                                for the chip to resume
	{0x3008, 0x42, 0, 0} -> SW standby mode

SW standby mode is described as:

        Executing a software standby through the SCCB interface
        suspends internal circuit activity but does not halt the
        device clock. All register content is maintained in standby
        mode.

I presume that the first

	{0x3008, 0x42, 0, 0}

 exists from SW standby mode to program the chip and the last

        {0x3008, 0x02, 0, 5}

puts the chip in sw standby at the end of init_settings[].
Software standby is then exited by ov5640_set_stream_dvp() for DVP and
by clearing 0x300e[4:3] in MIPI mode, as the datasheet reports:

        To initiate hardware standby mode, the PWDN pin must be tied to high
        (while in MIPI mode, set register 0x300E[4:3] to 2’b11 before the PWDN
        pin is set to high)

My second observation is that those entries in the init_settings[]
table performs SW reset/standby regardless if there's a GPIO or not
installed to control the reset and pwdn lines.

Would it be worth in your opinion trying to modify ov5640_power()
and ov5640_reset() to use either SW or HW standby/reset conditionally
on the avialability of sensor->reset_gpio and sensor->pwdn_gpio and
remove the initial SW standby/reset from init_setting[] ?

>  };
>
>  static const struct reg_value ov5640_setting_low_res[] = {
> --
> 2.17.1
>
