Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2736F57D1A7
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 18:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiGUQhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 12:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiGUQhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 12:37:42 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCE67B793
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:37:40 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g1so2818125edb.12
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=clXoWmLpHJO9OqjNmb9EMqOCGhvp+L6btacFj3MKBfk=;
        b=fXyo+i0ytF3PlfLid4evVBDvIufknIJlgX1ZDD9Z325nLo2bEopDuIYOJFlnsG3Eim
         FMt81v6EvIFbWokf0wKVpRnRZXnTmn5DHDdVO0iezSNIiiMNkyoyDRsLIf+R95LCnu2d
         fzf4dmzzXvdVDCmatTf8QmykfeEQEurYqmqyzrzWQl1y8gTMNxHsirgIXEw/ITw0BXT4
         mL3oBV3ksBJgTW8B+phfvuWBNAjCjKH9WDZOjF3LXLflTYQ0dXwP75VDlkdDcmIyEgaz
         RoiKVXZikumG3IjE8uu0LINCzz01L4wVo66m7PH+8F6LMW02u1S7if1e35qr13kIzTdA
         h9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=clXoWmLpHJO9OqjNmb9EMqOCGhvp+L6btacFj3MKBfk=;
        b=Vmni7Vv8uHJSpNj4WVZZWGNv6NyDI+GfEdOSnxJ75zd9P6hmBfM76k8n+xMLFXou/s
         RIsYM9DiAPN9Br27NfXOPZhjxX/cSS2m/1eQI7N7bz4NpeMKlDe/HH3ozGptP0v8anQo
         nNwXWjzM9funmGjnHZtqRlYbQhupKAeS93TwVS2QwNP9SRM104ucyDwcQ1aErBkfEuAM
         +hd8m76YxjmTZwLg0b5alqS/ze0ivWCHV/XnaMMRK3lw2fOdIsi6cFvQSvnucZThk+wZ
         qiG8Q/PJ/V/WymLjsxbpjVDyOti2uNkP3p3GysS0ZFRHV67/+WeLPURLkvQ9ZY9p7uQ5
         ZOSA==
X-Gm-Message-State: AJIora8nA0fRfX5ltj7HLu4ADeFhGqLWiLwqK/KPtT0wheZfhPbKvETa
        FHNBDDkFTa96Bbm0nja0YzAxNNQ1zTI6qE3bwC4jNw==
X-Google-Smtp-Source: AGRyM1uHf9jpzYOlD/+zAVrv+HsAeQLjK82Yt1M6efD9iPFDRjf6JxR6tlVZi1XJhSYZ1r5g9h9Rsuoghi7TDyOVhUo=
X-Received: by 2002:a05:6402:194f:b0:43a:298f:f39c with SMTP id
 f15-20020a056402194f00b0043a298ff39cmr57701873edz.106.1658421459295; Thu, 21
 Jul 2022 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <3399452.atdPhlSkOF@steina-w> <Ytk1wWOec2tkOB8M@pendragon.ideasonboard.com> <4167869.k3LOHGUjKi@steina-w>
In-Reply-To: <4167869.k3LOHGUjKi@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jul 2022 17:37:23 +0100
Message-ID: <CAPY8ntC-GF5QEVZ_VQqi+LJzt7==_t2u2W=VDfeYw-3mk4mnmg@mail.gmail.com>
Subject: Re: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK controls
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 21 Jul 2022 at 12:32, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Laurent,
>
> Am Donnerstag, 21. Juli 2022, 13:17:21 CEST schrieb Laurent Pinchart:
> > Hi Alexander,
> >
> > On Thu, Jul 21, 2022 at 12:05:46PM +0200, Alexander Stein wrote:
> > > Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> > > > Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> > > > imx290 driver. Make the controls read-only to start with, to report the
> > > > values to userspace for timing calculation.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >
> > > >  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 4408dd3e191f..7190399f4111 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -146,6 +146,8 @@ struct imx290 {
> > > >
> > > >   struct v4l2_ctrl_handler ctrls;
> > > >   struct v4l2_ctrl *link_freq;
> > > >   struct v4l2_ctrl *pixel_rate;
> > > >
> > > > + struct v4l2_ctrl *hblank;
> > > > + struct v4l2_ctrl *vblank;
> > > >
> > > >   struct mutex lock;
> > > >
> > > >  };
> > > >
> > > > @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > >
> > > >           if (imx290->pixel_rate)
> > > >
> > > >                   __v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> > > >
> > > >
> imx290_calc_pixel_rate(imx290));
> > > >
> > > > +
> > > > +         if (imx290->hblank) {
> > > > +                 unsigned int hblank = mode->hmax - mode-
> >width;
> > > > +
> > > > +                 __v4l2_ctrl_modify_range(imx290->hblank,
> hblank, hblank,
> > > > +                                          1, hblank);
> > > > +         }
> > > > +
> > > > +         if (imx290->vblank) {
> > > > +                 unsigned int vblank = IMX290_VMAX_DEFAULT -
> mode->height;
> > > > +
> > > > +                 __v4l2_ctrl_modify_range(imx290->vblank,
> vblank, vblank,
> > > > +                                          1, vblank);
> > > > +         }
> > > >
> > > >   }
> > > >
> > > >   *format = fmt->format;
> > > >
> > > > @@ -880,9 +896,10 @@ static const struct media_entity_operations
> > > > imx290_subdev_entity_ops = {> >
> > > >  static int imx290_ctrl_init(struct imx290 *imx290)
> > > >  {
> > > >
> > > > + unsigned int blank;
> > > >
> > > >   int ret;
> > > >
> > > > - v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> > > > + v4l2_ctrl_handler_init(&imx290->ctrls, 7);
> > > >
> > > >   imx290->ctrls.lock = &imx290->lock;
> > > >
> > > >   v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > >
> > > > @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > >
> > > >
> ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> > > >                                0, 0,
> imx290_test_pattern_menu);
> > > >
> > > > + /*
> > > > +  * Horizontal blanking is controlled through the HMAX register,
> which
> > > > +  * contains a line length in INCK clock units. The INCK frequency
> is
> > > > +  * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> > > > +  * convert it to a number of pixels based on the nominal pixel
> rate.
> > > > +  */
> > >
> > > Currently the driver only supports 37.125 MHz, please refer to
> > > imx290_probe.
> > Indeed. Re-reading the comment, I suspect something is wrong, as hmax is
> > not converted to pixels here (and is also not fixed to 1100). The only
> > datasheet I found that is publicly accessed doesn't explain very clearly
> > how the HMAX value should be computed. Based on your experience with IMX
> > sensors, would you be able to shed some light on this ?

It is pretty much a standard HTS setting based on a pixel rate that is
fixed at 148.5MPix/s. Likewise VMAX is equivalent to a traditional
VTS.
I've been through the same path in
https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx290.c

> Can you share the link to this datasheet you found?
> Sorry, my experience is more like try and error. I don't fully understand this
> as well, but apparently this depends on frame rate select (FRSEL).

FRSEL is the one difference between IMX327 and IMX290 (and presumably
IMX462 too). IMX290 adds "0" as a valid value for 120/100fps mode.
However there is no need to change FRSEL for standard frame rate
control - you can set it at 0x01 and get a full range of frame rates
through VMAX and HMAX. If you wished to extend that range for slower
rates, you could conditionally set it to 0x2 to double the frame time.

  Dave

> Best regards,
> Alexander
>
> > > > + blank = imx290->current_mode->hmax - imx290->current_mode->width;
> > > > + imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls,
> &imx290_ctrl_ops,
> > > > +                                    V4L2_CID_HBLANK,
> blank, blank, 1,
> > > > +                                    blank);
> > > > + if (imx290->hblank)
> > > > +         imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > +
> > > > + blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> > > > + imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls,
> &imx290_ctrl_ops,
> > > > +                                    V4L2_CID_VBLANK,
> blank, blank, 1,
> > > > +                                    blank);
> > > > + if (imx290->vblank)
> > > > +         imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > +
> > > >
> > > >   imx290->sd.ctrl_handler = &imx290->ctrls;
> > > >
> > > >   if (imx290->ctrls.error) {
>
>
>
>
