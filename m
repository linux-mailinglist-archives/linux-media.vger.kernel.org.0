Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7BC644247
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 12:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbiLFLkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 06:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbiLFLkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 06:40:01 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F16FCE05
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 03:40:00 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id f189so9370696vsc.11
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wXkPoKjNu7IZGLInnqBVxRW+ksyVC8afOtfigTuS6eo=;
        b=DTPlldEK2Mt8U+VuLUaVTowQ9JD0oC7ZG3GdzsEdvX/vmf2wHy+t5ERTdmr1aWMEb9
         QP8IjkDPWwKUyPjNqNYBNQBdy0rP182aesEwyTbDpXjFy1eZ/ID6enjqOigtHVDuUZu2
         4+w+IJ0JfRCQvfZIHdvir8i6d42HuBe54YCXqlUDP6mATuHx+7sNhXJVJU2Xwt6+BvqE
         6Ksa17QrReimXAsUwCpBF2wiTmrbfTX41XGlunefuR3wJgDDWsBME3inLXmIkcBsg8r/
         OY4iENoBkVGovngmcdyKgYfpzmY0NnUioTQb3+/R11M2GLAQsESv8l/TucZsu1RK2pef
         zT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXkPoKjNu7IZGLInnqBVxRW+ksyVC8afOtfigTuS6eo=;
        b=Y8JosgPZ4zT+BxKoHpD9AnBMBkvb4r0T8sG6uNqwktwVib7v0j+Xt7ewQYPWDU9rxs
         iom8zrP+dxVb+lSQ8xFfmJEgYLpdtjbZsZXDzPEMKJELEg8pGbdGiXv/+Hul1sR4wnwe
         0YifgZ6VmXGCaU01B5/kMxL7um5zK7zF+nhzZO6o30914iImlQA1HPFhByT+ZG9yAIdU
         tkNNjHdwI5uWbSp3c/SFyKZ+AXiwLklGIF4lJSDllEYLh9sX3WGfCBzjQmt6tsmbcf3/
         WfVJ9UbiDJXcFyTpJnIQOe0MgZedN5owTF+WezaicWQYtkLP0P+3SVfpita9rxVQiP+d
         iEpA==
X-Gm-Message-State: ANoB5plE6iav+yf0JXS6cQRkkR+kLqqfmSWY1dY4VahGuJt6/+NA+jK8
        flQyf369m6xkHT37aF4UaLthQ+FTyaGVvMr5ANw9SA==
X-Google-Smtp-Source: AA0mqf7h+GXyI1E/jzEHKApomRcEoqpKQe63/FcNQ7s6D3IiKWhAN35cvWaLnreFK4RHwwJL9VEsCaNe3HgsnyxiPJQ=
X-Received: by 2002:a67:1703:0:b0:3b0:4c2f:354a with SMTP id
 3-20020a671703000000b003b04c2f354amr38921334vsx.28.1670326799579; Tue, 06 Dec
 2022 03:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
 <20221205152149.1364185-4-dave.stevenson@raspberrypi.com> <DM8PR11MB56532AC6ED60D4503E5AAB11991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB56532AC6ED60D4503E5AAB11991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 6 Dec 2022 11:39:43 +0000
Message-ID: <CAPY8ntAAAT2JHypD5M61qDVxiR0Ed-6Hv4WWu0V=P+Wkb3B+vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT
 on flips
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Su, Jimmy" <jimmy.su@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Tue, 6 Dec 2022 at 03:42, Cao, Bingbu <bingbu.cao@intel.com> wrote:
>
> Stevenson,
>
> Thanks for your patch.
>
> I am wondering how V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was used in current
> v4l2 ctrl framework, literally it means the v4l2 ctrl will change the buffer
> layout. From my understanding, such as 90 degrees rotation apparently change
> the layout. But I am not sure this is also the case for vflip/hflip, user can
> notice the bayer order update from get_fmt.

Documentation at [1]
"3.5.1. Interactions between formats, controls and buffers
...
The set of information needed to interpret the content of a buffer
(e.g. the pixel format, the line stride, the tiling orientation or the
rotation) is collectively referred to in the rest of this section as
the buffer layout."
pixel_format is part of the buffer layout.

V4L2_CTRL_FLAG_MODIFY_LAYOUT is telling the userspace that it must
call get_fmt after changing the control in order to find out how the
format has changed. Without it there is no obligation to call get_fmt,
and userspace can legitimately expect the format/layout to be the
same.
Not all sensors change the Bayer order with flips (OnSemi sensors in
particular tend not to), so you can't make assumptions over the
behaviour.

> Sakari, what do you think?

Seeing as Sakari has accepted the patches and created a pull request
to Mauro including them suggests that this is indeed the correct thing
to do.

There is now a unified behaviour across all sensor drivers that change
Bayer order due to flips.
libcamera is relying on correct behaviour in order to be able to work
out the native Bayer order of the sensor, and that is why I was
checking that all mainline drivers were doing the right thing.

Thanks
  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#interactions-between-formats-controls-and-buffers

> ________________________
> BRs,
> VTG - Linux&Chrome IPU SW
> Bingbu Cao
>
> > -----Original Message-----
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Sent: Monday, December 5, 2022 23:22
> > To: Rui Miguel Silva <rmfrfs@gmail.com>; Sakari Ailus
> > <sakari.ailus@linux.intel.com>; Cao, Bingbu <bingbu.cao@intel.com>; Qiu,
> > Tian Shu <tian.shu.qiu@intel.com>; Su, Jimmy <jimmy.su@intel.com>; linux-
> > media@vger.kernel.org
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Subject: [PATCH v2 3/5] media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT
> > on flips
> >
> > The driver changes the Bayer order based on the flips, but does not define
> > the control correctly with the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
> >
> > Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx319.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c index
> > 245a18fb40ad..45b1b61b2880 100644
> > --- a/drivers/media/i2c/imx319.c
> > +++ b/drivers/media/i2c/imx319.c
> > @@ -2328,8 +2328,12 @@ static int imx319_init_controls(struct imx319 *imx319)
> >
> >       imx319->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
> >                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +     if (imx319->hflip)
> > +             imx319->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >       imx319->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
> >                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +     if (imx319->vflip)
> > +             imx319->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >
> >       v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> >                         IMX319_ANA_GAIN_MIN, IMX319_ANA_GAIN_MAX,
> > --
> > 2.34.1
>
