Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A005F67C3
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiJFNWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 09:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiJFNWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 09:22:17 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3476C9AFFE
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 06:22:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w10so2791666edd.4
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=I3z8jrAwlh8cxl/J2vACZdbaLxBQi4EhtqmwFlkswsc=;
        b=RMvkh9jxKwYTZ0RCxg8c5/GTPpKIQqCHG7WaEdsNCmsfmSd+IWPxxT18BiQP8vFU9i
         kKwm4j305TZLa66qcvcFKD3Nb2tI5zxII+pK9IfHOsUo06/Sa1kA+CZsodNwtQGjlPVS
         8Twn+A6AQs1IAQ7N2ZdII/ImUrAaq8A4GrryLyweRBHUjrwdvtTwKOvAJ722KPDIGrxw
         XmlqOsylNO00H9FpBi4ruCRBva0L5MUQtmKmLGBK/zIn05ybBjyhPv7mjZ04v+fjp0JI
         BIwhq5UyovmvEu0Q+9XgyAgblN+ZBO1sAnf4sRoRruQahfj+GwEcNkCs3/t+kP/epaJ3
         moBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=I3z8jrAwlh8cxl/J2vACZdbaLxBQi4EhtqmwFlkswsc=;
        b=dztBI17TpUsDi2BOy0boKdm8uPVebB/8gJGwRzGaSbe91uF+b4hY4OKiHNEHDvQfqC
         /3F/iDNa5XiwELll0/udbav6LRaWAZt4tlSujXu7Kf+t8tlHTO5e/HHKJwAa0F40m1Al
         rQzslr60R6jWcSwjzsb8YY7jO7h11xhxyxTC3XMF1erhjS7/1AHh3gNN5SwN3+HRJnel
         naI4qUN8iCJkB7K+ecdbGmJk7yvFMSvcfMkbpH6mrAYx6Ku49SOmKayXjTgTr0F3wKIl
         u5j1xkDxkG+kE3QgI9rgSQmY+YF9JAJKvrfGtLckvDndqIocQrDV4zOlkixIGcMMOqOk
         /eRw==
X-Gm-Message-State: ACrzQf0WNvX/zaKOYNYOffyfsiIxbxgBBY37Siae73Fz0IIws1F1n2qV
        /iRXxdaB5/R4r9IFZ/Lsp/rl1i2ADfbf2Ni4CJMkpDzfz4QYNQ==
X-Google-Smtp-Source: AMsMyM42ceFrm3g1obNO2lMsim2VhCoScRF6o5nvV+wqoI2/JySdrptVxCxRrva9BrJlnA88+aBsed8TD7Ysnx1u/Vk=
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id
 fi14-20020a056402550e00b00456f79f2bedmr4654643edb.106.1665062534789; Thu, 06
 Oct 2022 06:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-11-dave.stevenson@raspberrypi.com> <20221006092948.aosyb6weieoevlbq@uno.localdomain>
In-Reply-To: <20221006092948.aosyb6weieoevlbq@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 14:21:57 +0100
Message-ID: <CAPY8ntBmB++um4GTwqg2CUXdSxuRxdJibi0nX3E0ZRpZ2imCZQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: i2c: ov9282: Action CID_VBLANK when set.
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Thu, 6 Oct 2022 at 10:29, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:28:03PM +0100, Dave Stevenson wrote:
> > Programming the sensor with TIMING_VTS (aka LPFR) was done
> > when triggered by a change in exposure or gain, but not
> > when V4L2_CID_VBLANK was changed. Dynamic frame rate
> > changes could therefore not be achieved.
> >
> > Separate out programming TIMING_VTS so that it is triggered
> > by set_ctrl(V4L2_CID_VBLANK)
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 29 ++++++++++++++++-------------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 183283d191b1..5ddef6e2b3ac 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -419,22 +419,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >   */
> >  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  {
> > -     u32 lpfr;
> >       int ret;
> >
> > -     lpfr = ov9282->vblank + ov9282->cur_mode->height;
> > -
> > -     dev_dbg(ov9282->dev, "Set exp %u, analog gain %u, lpfr %u",
> > -             exposure, gain, lpfr);
> > +     dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> > +             exposure, gain);
> >
> >       ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
> >       if (ret)
> >               return ret;
> >
> > -     ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
> > -     if (ret)
> > -             goto error_release_group_hold;
> > -
> >       ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
> >       if (ret)
> >               goto error_release_group_hold;
> > @@ -465,6 +458,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >               container_of(ctrl->handler, struct ov9282, ctrl_handler);
> >       u32 analog_gain;
> >       u32 exposure;
> > +     u32 lpfr;
>
> Only a nit about the fact lpfr is a u32 while you're writing 2 bytes.
> I guess it's safe as we likely don't risk any overflow

I was moving u32 lpfr from ov9282_update_exp_gain to here. All the
handling of lpfr (aka TIMING_VTS) is done as u32 in this driver.

The max range of V4L2_CID_VBLANK is set from the ov9282_mode
definition (not strictly necessary as it should be a fixed max value
handled by the register), so as long as the mode is defined correctly
then there should be no overflow.

  Dave

> >       int ret;
> >
> >       switch (ctrl->id) {
> > @@ -482,10 +476,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                                              OV9282_EXPOSURE_OFFSET,
> >                                              1, OV9282_EXPOSURE_DEFAULT);
> >               break;
> > +     }
> > +
> > +     /* Set controls only if sensor is in power on state */
> > +     if (!pm_runtime_get_if_in_use(ov9282->dev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> >       case V4L2_CID_EXPOSURE:
> > -             /* Set controls only if sensor is in power on state */
> > -             if (!pm_runtime_get_if_in_use(ov9282->dev))
> > -                     return 0;
> >
> >               exposure = ctrl->val;
> >               analog_gain = ov9282->again_ctrl->val;
> > @@ -495,14 +493,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >
> >               ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
> >
> > -             pm_runtime_put(ov9282->dev);
> >
> Double empty line
> With this fixed:
>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>    j
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             lpfr = ov9282->vblank + ov9282->cur_mode->height;
> > +             ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
> >               break;
> >       default:
> >               dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >               ret = -EINVAL;
> >       }
> >
> > +     pm_runtime_put(ov9282->dev);
> > +
> >       return ret;
> >  }
> >
> > --
> > 2.34.1
> >
