Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EF46545EE
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 19:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiLVSYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 13:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiLVSYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 13:24:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B70E193C7
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 10:24:38 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B816471;
        Thu, 22 Dec 2022 19:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671733476;
        bh=WF2PIOS2o2wozO2DnkSi0x0rMbfs+tpwGkmRpZpvBKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FXnHd+xUdCmKxZiN2HaASVtV8BA28DNCbmLsijVN6+mc5RZtF+9O19Q2G0yuzrUB6
         j4q0eViEnNXs0y+cEC7OPU5wGCNgcgi4DVa2BdpxhgMMCod9mCbW56SvIvaNtXXvYm
         n02wjcxIql/e2hmjkPlkdm3g98YxugfDIypJECvs=
Date:   Thu, 22 Dec 2022 19:24:33 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 3/3] media: ov5640: Honor power on time in init_setting
Message-ID: <20221222182433.lwixmexooahbc6gn@uno.localdomain>
References: <20221219143056.4070-1-j-luthra@ti.com>
 <20221219143056.4070-4-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219143056.4070-4-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Mon, Dec 19, 2022 at 08:00:56PM +0530, Jai Luthra wrote:
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
>  drivers/media/i2c/ov5640.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 7b0ff04a2c93..0ea8691ecded 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -551,7 +551,7 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
>  	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
>  	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
>  };
>
>  static const struct reg_value ov5640_setting_low_res[] = {
> @@ -1735,9 +1735,12 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
> +	int ret;
> +	ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> +			       OV5640_REG_SYS_CTRL0_SW_PWUP :
> +			       OV5640_REG_SYS_CTRL0_SW_PWDN);
> +	usleep_range(5000, 6000);

Do you need to delay also when !on ?

> +	return ret;
>  }
>
>  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> --
> 2.17.1
>
