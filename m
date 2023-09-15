Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0018B7A1D83
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbjIOLfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 07:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbjIOLfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 07:35:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F331B1
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 04:34:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97E2EE4;
        Fri, 15 Sep 2023 13:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694777602;
        bh=5kZ5ITV/avymhH2sMKKmLPBjDBDYP0q2N3/lltZBZvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sPzEhb3Ooxz0xkYOI36S87DVh6vp0WFNVhtOTZ08LPqKTyUs3Zw+GJAklecwYdK14
         1OEGAP/NTyRB41VlOeZPRcUo4/2qoEaQhQOWzzR0mc+3pAEe9w7GXqe7Qy4fDMgXrF
         62dP3fRDTzmwMxEjURDOhB79XB/+hpNYxAcOUWR4=
Date:   Fri, 15 Sep 2023 14:35:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 42/57] media: i2c: imx219: Drop system suspend and resume
 handlers
Message-ID: <20230915113509.GL14641@pendragon.ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
 <20230914181704.4811-43-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBVEn7DtFu7Z0-nT4ObrH9Wz=uRKOhhkz=0di+1v3zZVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBVEn7DtFu7Z0-nT4ObrH9Wz=uRKOhhkz=0di+1v3zZVA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Sep 15, 2023 at 11:53:53AM +0100, Dave Stevenson wrote:
> On Thu, 14 Sept 2023 at 19:17, Laurent Pinchart wrote:
> >
> > Stopping streaming on a camera pipeline at system suspend time, and
> > restarting it at system resume time, requires coordinated action between
> > the bridge driver and the camera sensor driver. This is handled by the
> > bridge driver calling the sensor's .s_stream() handler at system suspend
> > and resume time. There is thus no need for the sensor to independently
> > implement system sleep PM operations. Drop them.
> >
> > The streaming field of the driver's private structure is now unused,
> > drop it as well.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Presumably this is superseding effectively the same patch in your
> other imx219 series [1]
> That's fine by me, just an observation.

Good catch :-) The two series indeed fix the same issue. I have included
the imx219 changes in this series for completeness, I'll drop it from
one of the two series depending on which of them gets merged first.

Sorry for forgetting to mention this in the cover letter.

> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20230913135638.26277-16-laurent.pinchart@ideasonboard.com/
> 
> > ---
> >  drivers/media/i2c/imx219.c | 41 --------------------------------------
> >  1 file changed, 41 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 5715bbbc0820..a431dace0f33 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -479,9 +479,6 @@ struct imx219 {
> >         /* Current mode */
> >         const struct imx219_mode *mode;
> >
> > -       /* Streaming on/off */
> > -       bool streaming;
> > -
> >         /* Two or Four lanes */
> >         u8 lanes;
> >  };
> > @@ -991,8 +988,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> >                 imx219_stop_streaming(imx219);
> >         }
> >
> > -       imx219->streaming = enable;
> > -
> >  unlock:
> >         v4l2_subdev_unlock_state(state);
> >         return ret;
> > @@ -1044,41 +1039,6 @@ static int imx219_power_off(struct device *dev)
> >         return 0;
> >  }
> >
> > -static int __maybe_unused imx219_suspend(struct device *dev)
> > -{
> > -       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > -       struct imx219 *imx219 = to_imx219(sd);
> > -
> > -       if (imx219->streaming)
> > -               imx219_stop_streaming(imx219);
> > -
> > -       return 0;
> > -}
> > -
> > -static int __maybe_unused imx219_resume(struct device *dev)
> > -{
> > -       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > -       struct imx219 *imx219 = to_imx219(sd);
> > -       struct v4l2_subdev_state *state;
> > -       int ret;
> > -
> > -       if (imx219->streaming) {
> > -               state = v4l2_subdev_lock_and_get_active_state(sd);
> > -               ret = imx219_start_streaming(imx219, state);
> > -               v4l2_subdev_unlock_state(state);
> > -               if (ret)
> > -                       goto error;
> > -       }
> > -
> > -       return 0;
> > -
> > -error:
> > -       imx219_stop_streaming(imx219);
> > -       imx219->streaming = false;
> > -
> > -       return ret;
> > -}
> > -
> >  static int imx219_get_regulators(struct imx219 *imx219)
> >  {
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > @@ -1464,7 +1424,6 @@ static const struct of_device_id imx219_dt_ids[] = {
> >  MODULE_DEVICE_TABLE(of, imx219_dt_ids);
> >
> >  static const struct dev_pm_ops imx219_pm_ops = {
> > -       SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
> >         SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
> >  };
> >

-- 
Regards,

Laurent Pinchart
