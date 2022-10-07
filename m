Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF79A5F76CC
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 12:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJGKWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 06:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiJGKWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 06:22:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AED2CA8B8
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 03:22:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bj12so10232699ejb.13
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BP33Ef8DLwzht1Pp9O/Mz/wS+8ZXznCvNckEasYKbMY=;
        b=UsPCfyieAXA6OnYODxhig4ofA9UhFwasNJcJCmt0RY5djnezPsNhTmAhMKSQnQGsnR
         glLJhbDA+O7TAlwFh68Q2tut1sKgWD9zdRBCyJya3bzheaXwDdkK09Nhu7HNNaUkaGUW
         0cUdeYsZeWJYX+T+tclCdN+18VNQVCJRoB7S81V4G2oQ/TltxrLDeERD9qUdDYvz63LV
         JNl0vkVUwTrWcPmdwLUkuOdEHq4PnM3x3tdzi4peg4YB/BuN4wMG9Z2gdXkNWXNfj1Zi
         lAhGTOTppY/pym00F7wmsYv/NqXFiFgfvkmu0u40Tv64uJ1IJFqCZ/d9oVf8xeV0fROs
         //lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP33Ef8DLwzht1Pp9O/Mz/wS+8ZXznCvNckEasYKbMY=;
        b=tZM0GYJ0jPpA89CwItLgG7WQJlPP0PHtl9TilcbbJjpcX98dpnZg3KRT7cgM6C+Jfs
         DQl1YxSoXlaybMU8q/Q3Y++U0yvIbeQA5EEkBva6i1+2RwEJxU2MUJDGeXj/aQW/8WvN
         3oVfr2+1ee2zbw+th5I+q728gxTKp+apXomZK6xsLT3AZ2SY4hXR5qgkJ/0AOAP/NX3I
         pDCjmLN1XcM1UskHTN5D3A2Fuzrd5PrlE67RZLt6/62LctTyE57PH6hQg3n/SOfwP9Nz
         4lV8UnV2leVspIVkEy3wWBjq3QsgycMEqQcfPMAGLnMJtCFDaAZo7JOEm9L+TYdKe0nM
         YjWg==
X-Gm-Message-State: ACrzQf0+kW6G9hWDYUb4Vz5T+5iYFrelYmMNV5OFa1OqS6jMJwXPUdAE
        s2cj3/bQX2LyoEmo5/P+WiXiRCSgMQDEkD2wppI7uA==
X-Google-Smtp-Source: AMsMyM7LfSkjDp7yAtiK270mhGemnZSQS44b+XX0x5ZYZOM2ihZ+ZifLoAFOgs7jjg19CQx1SxSSwvmn4DWrtSlWQeI=
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr3650186ejc.200.1665138160728; Fri, 07
 Oct 2022 03:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-17-dave.stevenson@raspberrypi.com> <20221006095956.dy5x3ie2gf635b3w@uno.localdomain>
In-Reply-To: <20221006095956.dy5x3ie2gf635b3w@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 7 Oct 2022 11:22:23 +0100
Message-ID: <CAPY8ntCg0nM84qsauexXHSAdCKc0K9fco6wDjZ-KzfOdqMyrFQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: i2c: ov9282: Support event handlers
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

+ Hans for comment on compliance / controls framework

On Thu, 6 Oct 2022 at 10:59, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:28:09PM +0100, Dave Stevenson wrote:
> > As noted in the headers for V4L2_SUBDEV_FL_HAS_EVENTS,
> > "controls can send events, thus drivers exposing controls
> > should set this flag".
> >
>
> I was expecting this to only apply to drivers that actually generate
> events...
>
> Not sure I can give a tag here as my understanding of this part is
> limited, let's wait for other opinions :)

I had to rack my memory on this one.

It fixes a v4l2-compliance failure:
fail: v4l2-test-controls.cpp(835): subscribe event for control 'User
Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
(v4l-utils built at ToT from today, so fd544473800 "support INTEGER
and INTEGER64 control arrays")

So either it is required by all drivers that expose controls, or it's
an issue in v4l2-compliance.
I believe it's the former as all controls can create a V4L2_EVENT_CTRL
event should the value or range change (very common for things like
HBLANK and VBLANK in image sensor drivers).

Thanks
  Dave

> > This driver exposes controls, but didn't reflect that it
> > could generate events. Correct this, and add the default
> > event handler functions.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index bc429455421e..416c9656e3ac 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/regulator/consumer.h>
> >
> >  #include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -1189,6 +1190,11 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
> >  }
> >
> >  /* V4l2 subdevice ops */
> > +static const struct v4l2_subdev_core_ops ov9282_core_ops = {
> > +     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > +};
> > +
> >  static const struct v4l2_subdev_video_ops ov9282_video_ops = {
> >       .s_stream = ov9282_set_stream,
> >  };
> > @@ -1203,6 +1209,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
> >  };
> >
> >  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> > +     .core = &ov9282_core_ops,
> >       .video = &ov9282_video_ops,
> >       .pad = &ov9282_pad_ops,
> >  };
> > @@ -1419,7 +1426,8 @@ static int ov9282_probe(struct i2c_client *client)
> >       }
> >
> >       /* Initialize subdev */
> > -     ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> >       ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >
> >       /* Initialize source pad */
> > --
> > 2.34.1
> >
