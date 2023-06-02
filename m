Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97D77205BF
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 17:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbjFBPSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 11:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbjFBPSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 11:18:42 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89C318D
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 08:18:39 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6af7a84b2bdso1684429a34.2
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685719119; x=1688311119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j+4qhMVi0B2zvgx90anQBBrvjjddXuuOegU4U4Gosus=;
        b=rwu/awid8mbBUkkrdNfJbUZPK0KJw/j9t/TLB2JEuyo6ORAM34xCOyR7LehjawTI4q
         5dNRX9+C1v5jxJKva3mFO/HWVww8cvieiBUnaaaV1J4yLpTOQbZmkZmkfshEVPpq02i1
         A6SZWwQZH7F1H8IwE4GJFh0wMaPwR+GNGa0UKCAftKRfRQZ7Ms1IoGRaGLUcHJ+kprbO
         cPUD3NXxQ0upLj+fBzsmHP5DWKdBecEVtRcg3TGnOrz35Wna8ymXPxyR1opb2nQE7uUO
         NbY3ZPNSjc/qsss8eo6KMLTDyQTYNTbzf33swrXr0rRUJ1T6jDMWtw4pFDDoMTRgpjMi
         thwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685719119; x=1688311119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+4qhMVi0B2zvgx90anQBBrvjjddXuuOegU4U4Gosus=;
        b=jzQ/iQGOalK22WJy5wJ3jPz7epbHY/oEC1pa8MuckldGWJ1Su+1Xq6qHJM8mfrlTOf
         dAxRf1CaZNdh3tYAB1+lLF/AT8qOJh8pxHhIqfCX7mwgr5IpIuYM3I077ys4sGF+zkk0
         Aqtw8wRJPperqL6TKWYMgNw3HXOKCI5uN3nbxd9/YSMRM4kPcidESeWmfrC/6tDEtGBE
         i+LyQaAx3TXrJ5lOdfoCzYB5M7LxTYYnABFLHP0r2xDa9RdQjQKlyxSNmxKRvKkss4R8
         dJqKe0MWeWGrN+PS6lt0ywLwn2VaMhfjU4g0EV/lJvj9ILf8PWMok3KVRXTe4u0uj5Rl
         Jlsw==
X-Gm-Message-State: AC+VfDxT9k9kEfvoRyRct4PqaTYP5QmG8jZHsnwvK+gExHtxs9o2I9ue
        AVqinmhqYy+NrW8EMQcRgMtpNIEmLxd2ipbh/7S09w==
X-Google-Smtp-Source: ACHHUZ4qNh10ksxpPcM8GSsDr5lZGOevUabbbtBIaMFlh1DQSfYsF01uMvxSaFWA3m8/5+XGtJ6T84n3/iFiUCovydE=
X-Received: by 2002:a05:6358:63a5:b0:121:4227:8d7c with SMTP id
 k37-20020a05635863a500b0012142278d7cmr5974574rwh.14.1685719119257; Fri, 02
 Jun 2023 08:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-13-dave.stevenson@raspberrypi.com> <oxixqip6yhr3huqg4odozxqrtb6zqpbnla6eytrcdpeurclwor@z6dvre5jgji4>
In-Reply-To: <oxixqip6yhr3huqg4odozxqrtb6zqpbnla6eytrcdpeurclwor@z6dvre5jgji4>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 2 Jun 2023 16:18:22 +0100
Message-ID: <CAPY8ntB-pOcCwwyrPAXNKU19cx0pY3TF6oZ9YnOUFg81jGc=Fg@mail.gmail.com>
Subject: Re: [PATCH 12/21] media: i2c: imx258: Allow configuration of clock
 lane behaviour
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Fri, 2 Jun 2023 at 14:27, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Tue, May 30, 2023 at 06:29:51PM +0100, Dave Stevenson wrote:
> > The sensor supports the clock lane either remaining in HS mode
> > during frame blanking, or dropping to LP11.
> >
> > Add configuration of the mode via V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.
>
> Assuming a follow-up patch for DT
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

It's already covered in video-interfaces.yaml, and is an optional flag
as the driver will work in either manner, so do the bindings need
updating?

In checking the default value for this register, it is 0x01, or non-continuous.
The original omission of this property from the binding and driver
therefore means that an existing binding will most likely have omitted
it and be believing the sensor is in continuous clock mode when it
isn't.
Now that we check the mode requested, it will actually adopt
continuous clock mode and may no longer work with the receiver.

Perhaps it's best to drop this patch, and add it as a note to anyone
preparing a talk on Camera Sensor Drivers Compliance ;-)

  Dave

> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx258.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index 1fa83fe82f27..b5c2dcb7c9e6 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -72,6 +72,8 @@
> >  /* Test Pattern Control */
> >  #define IMX258_REG_TEST_PATTERN              0x0600
> >
> > +#define IMX258_CLK_BLANK_STOP                0x4040
> > +
> >  /* Orientation */
> >  #define REG_MIRROR_FLIP_CONTROL              0x0101
> >  #define REG_CONFIG_MIRROR_FLIP               0x03
> > @@ -634,6 +636,7 @@ struct imx258 {
> >       const struct imx258_link_freq_config *link_freq_configs;
> >       const s64 *link_freq_menu_items;
> >       unsigned int nlanes;
> > +     unsigned int csi2_flags;
> >
> >       /*
> >        * Mutex for serialized access:
> > @@ -1072,6 +1075,15 @@ static int imx258_start_streaming(struct imx258 *imx258)
> >               return ret;
> >       }
> >
> > +     ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
> > +                            IMX258_REG_VALUE_08BIT,
> > +                            imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
> > +                            1 : 0);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s failed to set clock lane mode\n", __func__);
> > +             return ret;
> > +     }
> > +
> >       /* Apply default values of current mode */
> >       reg_list = &imx258->cur_mode->reg_list;
> >       ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
> > @@ -1486,6 +1498,8 @@ static int imx258_probe(struct i2c_client *client)
> >               goto error_endpoint_poweron;
> >       }
> >
> > +     imx258->csi2_flags = ep.bus.mipi_csi2.flags;
> > +
> >       /* Initialize subdev */
> >       v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> >
> > --
> > 2.25.1
> >
