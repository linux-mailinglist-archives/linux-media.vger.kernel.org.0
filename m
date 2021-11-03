Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A19C44429E
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 14:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhKCNrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 09:47:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42399 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCNru (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 09:47:50 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 81CD424000B;
        Wed,  3 Nov 2021 13:45:11 +0000 (UTC)
Date:   Wed, 3 Nov 2021 14:46:03 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     sakari.ailus@linux.intel.com, akinobu.mita@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov7740: implement get_mbus_config
Message-ID: <20211103134603.ke2ireimojupi3yf@uno.localdomain>
References: <20211102153008.1349895-1-eugen.hristev@microchip.com>
 <YYJDcIiBXo/XlKCX@paasikivi.fi.intel.com>
 <84ff4389-3458-0811-b43f-ded957c01f88@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84ff4389-3458-0811-b43f-ded957c01f88@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

   for a bit more of context

On Wed, Nov 03, 2021 at 12:39:52PM +0000, Eugen.Hristev@microchip.com wrote:
> On 11/3/21 10:08 AM, Sakari Ailus wrote:
> > Hi Eugen,
> >
> > Thanks for the patch.
> >
> > On Tue, Nov 02, 2021 at 05:30:08PM +0200, Eugen Hristev wrote:
> >> Implement the get_mbus_config callback.
> >> ov7740 is a parallel sensor, and according to datasheet, the register
> >> REG12 controls the CCIR656 mode. This register is written to 0 in yuyv mode.
> >> According to REG12[5] , CCIR656 mode, the behavior is:
> >> CCIR656: disabled
> >> REG28 controls the polarity of the signals. This register is unused.
> >> The default behavior is then:
> >> HSYNC polarity : positive
> >> VSYNC polarity : positive
> >> HREF polarity: positive
> >>
> >
> > Doesn't the receiver driver get this information from DT?
> >
>
> Hi Sakari,
>
> This patch comes as a result of my discussions with Jacopo, he advised
> to get mbus configuration via the get_mbus_config . I agree that this

That's where getting info at runtime was suggested

https://patchwork.linuxtv.org/project/linux-media/patch/20200826065142.205000-1-eugen.hristev@microchip.com/#122336


> information can be taken from DT as you said.
> In the end , my understanding is that get_mbus_config should be used
> only for runtime configuration which can change.
> Thus, if all this information is static, then, I will proceed with
> obtaining it from DT, and you can disregard this patch, as it is not useful.

And the latest comment where getting it from DTS was suggested

https://patchwork.linuxtv.org/project/linux-media/patch/20211022075247.518880-4-eugen.hristev@microchip.com/#132605

Thanks
   j

>
> Thanks,
> Eugen
>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >>   drivers/media/i2c/ov7740.c | 14 ++++++++++++++
> >>   1 file changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> >> index 2539cfee85c8..f8a717aecb6f 100644
> >> --- a/drivers/media/i2c/ov7740.c
> >> +++ b/drivers/media/i2c/ov7740.c
> >> @@ -873,12 +873,26 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
> >>        return ret;
> >>   }
> >>
> >> +static int ov7740_get_mbus_config(struct v4l2_subdev *sd,
> >> +                               unsigned int pad,
> >> +                               struct v4l2_mbus_config *cfg)
> >> +{
> >> +     cfg->type = V4L2_MBUS_PARALLEL;
> >> +     cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_HSYNC_ACTIVE_HIGH |
> >> +                  V4L2_MBUS_VSYNC_ACTIVE_HIGH |
> >> +                  V4L2_MBUS_PCLK_SAMPLE_RISING |
> >> +                  V4L2_MBUS_FIELD_EVEN_LOW | V4L2_MBUS_DATA_ACTIVE_HIGH;
> >> +
> >> +     return 0;
> >> +}
> >> +
> >>   static const struct v4l2_subdev_pad_ops ov7740_subdev_pad_ops = {
> >>        .enum_frame_interval = ov7740_enum_frame_interval,
> >>        .enum_frame_size = ov7740_enum_frame_size,
> >>        .enum_mbus_code = ov7740_enum_mbus_code,
> >>        .get_fmt = ov7740_get_fmt,
> >>        .set_fmt = ov7740_set_fmt,
> >> +     .get_mbus_config = ov7740_get_mbus_config,
> >>   };
> >>
> >>   static const struct v4l2_subdev_ops ov7740_subdev_ops = {
> >
> > --
> > Regards,
> >
> > Sakari Ailus
> >
>
