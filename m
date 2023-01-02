Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E20A65B276
	for <lists+linux-media@lfdr.de>; Mon,  2 Jan 2023 13:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjABM7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Jan 2023 07:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjABM7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Jan 2023 07:59:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C261AB
        for <linux-media@vger.kernel.org>; Mon,  2 Jan 2023 04:59:08 -0800 (PST)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:c40c:10ff:feac:d8bd])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5C547C5;
        Mon,  2 Jan 2023 13:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672664347;
        bh=DUH4mv8QIFyQbN46NvGW+NmB3bT1yvZz9wzivD9GYK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VqXi8LDfNRXCssP9Kt3yLnpfPZWR1plV7PP49m4n5V68ghkDlycMfwZdVUcmqNk/7
         BQ4fW6mJKuQuRg5fXldN3yiEMpBRrM/Wymzr9IJRYWSYilH/SylbgHgFV9N4je7B1V
         fZgkVt2b8jZAD2zfpCBdLN88hmshMK+brO2FM18o=
Date:   Mon, 2 Jan 2023 13:59:03 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jai Luthra <j-luthra@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 3/3] media: ov5640: Honor power on time in init_setting
Message-ID: <20230102125903.5r3ot4v3gbskrstc@uno.localdomain>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-4-j-luthra@ti.com>
 <20221229181036.a6eldz42eaksared@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221229181036.a6eldz42eaksared@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello again

On Thu, Dec 29, 2022 at 07:10:36PM +0100, Jacopo Mondi wrote:
> Hi again
>
> On Tue, Dec 27, 2022 at 11:06:34PM +0530, Jai Luthra wrote:
> > From: Nishanth Menon <nm@ti.com>
> >
> > OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
> > that is expected during various initialization steps. Note the power
> > on time includes t0 + t1 + t2 >= 5ms, delay for poweron.
> >
> > As indicated in section 2.8, the PWDN assertion can either be via
> > external pin control OR via the register 0x3008 bit 6 (see table 7-1 in
> > [1])
> >
> > [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> >
> > Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 5df16fb6f0a0..bd7cc294cfe6 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -609,7 +609,7 @@ static const struct reg_value ov5640_init_setting[] = {
> >  	{0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
> >  	{0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
> >  	{0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> > -	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
> > +	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
>
> This might also allow to remove the
>
> 		/* remain in power down mode for DVP */
> 		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
> 		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
> 		    !ov5640_is_csi2(sensor))
> 			continue;
>
> in ov5640_load_regs()
>
> Prabhakar since you have introduced it, coudl you test if you still
> need it with Nishanth's patch applied ?

No, it doesn't, sorry for the confusion.

The following patch would allow to remove the above quirk by removing
        {0x3008, 0x02}
from the init_sequence[].

Unfortunately the first 3 images are then black when running in CSI-2
mode.

-------------------------------------------------------------------------------
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 96b986051414..bfb60648c72a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -609,7 +609,7 @@ static const struct reg_value ov5640_init_setting[] = {
        {0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
        {0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
        {0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
-       {0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 5}, {0x3c00, 0x04, 0, 300},
+       {0x3a1f, 0x14, 0, 0}, {0x3c00, 0x04, 0, 300},
 };

 static const struct reg_value ov5640_setting_low_res[] = {
@@ -1808,7 +1808,7 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
                              BIT(1), on ? 0 : BIT(1));
 }

-static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
+static int ov5640_set_stream(struct ov5640_dev *sensor, bool on)
 {
        int ret;

@@ -3725,11 +3725,13 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
                        sensor->pending_fmt_change = false;
                }

-               if (ov5640_is_csi2(sensor))
+               if (ov5640_is_csi2(sensor)) {
                        ret = ov5640_set_stream_mipi(sensor, enable);
-               else
-                       ret = ov5640_set_stream_dvp(sensor, enable);
+                       if (ret)
+                               goto out;
+               }

+               ret = ov5640_set_stream(sensor, enable);
                if (!ret)
                        sensor->streaming = enable;
        }
-------------------------------------------------------------------------------

I do however now question the patch utility itself. SW PWDN is the
software standby state, while Figure 2.3 and 2.4 you mention in the
commit message report:

t2 = 5 ms: delay from DVDD stable to sensor power up stable

I doubt this apply to SW standby as it the delay is probably required
to have the internal circuitry stabilize after the power rail has been
enabled.

Does this patch make any practical difference in your setup ? I'm
asking as in my case it doesn't, but I'm on a CSI-2 setup.

>
> Thanks
>   j
>
>
> >  };
> >
> >  static const struct reg_value ov5640_setting_low_res[] = {
> > @@ -1810,9 +1810,17 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> >
> >  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> >  {
> > -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> > -				OV5640_REG_SYS_CTRL0_SW_PWUP :
> > -				OV5640_REG_SYS_CTRL0_SW_PWDN);
> > +	int ret;
> > +
> > +	if (on) {
> > +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> > +				       OV5640_REG_SYS_CTRL0_SW_PWUP);
> > +		usleep_range(5000, 6000);
> > +	} else {
> > +		ret = ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> > +				       OV5640_REG_SYS_CTRL0_SW_PWDN);
> > +	}
> > +	return ret;
> >  }
> >
> >  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> > --
> > 2.17.1
> >
