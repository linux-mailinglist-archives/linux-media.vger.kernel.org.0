Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F24675F76E1
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 12:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiJGKcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 06:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJGKcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 06:32:47 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015273FD55
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 03:32:45 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ot12so10424329ejb.1
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RnAH/Gm/1GUDTRLqU0itcvxGpxgtT2ENwkPZZ9gOSyk=;
        b=mpCMY24Xq7L60Py1/ZOQG28gvE3xJXzfWPyN0LQCsMUOoxU4i/KUjAqu6fdXacDGdA
         lbntAqpbHmJ9SfWLk6o/CO5Vzz6jyBtJjomZJ0O7HoxkUsnN/aj7cJu4D/qIKJBNSmX3
         Xj20c6zoAysJXbw6V8Y6VU0tx5z62yBLEUBVGESfkhHqW8Mgu/ts4B3l0yrgApU08/3t
         VlTGR+aH1lcIRJ0HI8GfWjvHhtnjqepYsm7teXNNyZvAa7QGuLLnewvcbploo675B/bj
         zSCJJrrTrNJaq8r4EqDnZlhx0/zcJV0qS9eozuHA1Eu2X47WVyzjYGypfJhxstsxSn+8
         WZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnAH/Gm/1GUDTRLqU0itcvxGpxgtT2ENwkPZZ9gOSyk=;
        b=Ke//y336c7nqUNrHs/l7fR0R6yEnPDSYxECG9ayqOiTckzebijkwnTYeyQB+8MtUOn
         CnBwdz4CxoiKC83/2iD+j2d+ycW/gXetXcz59QHsavHLrU2Z+2Gyo2rWrnZST4TFOL7M
         m3ABJyu+Ba1u/8E6WaB/kaonpbYtEjyNL7tVwDC8noSvpCulH/D1wlnGlrglXHICGall
         ZFiXJ+AsQB7egbKNqPAcuYfIwsCV9wXErkuPhMtboB9zkdjyHcm1wdZ+zGyCaJYOTE1x
         tB+sG0l/HSTOzbEX4QUP3OQrzYQyuGtGzbtN0ashKEQahLtDuSHoyz1xf2Joiy+sYR9S
         d0zQ==
X-Gm-Message-State: ACrzQf3r3v1u4kfok2t+ZZooaTw6uASBBtNQsX3e4R7YVz7uqAYYg0Yy
        1ug5X18FRrrzLu0zEDHnx4KreGdtgv8NCFtrRplJDzwlHFk=
X-Google-Smtp-Source: AMsMyM45QSAhKuIBRhddYAGRP1wBb120Fy2sR2eWfRY7k+4cIsBjVZeICUnbmOHpLqQcdDRvqG0WfZZtGQa4rhxLy78=
X-Received: by 2002:a17:907:2703:b0:78d:2f6e:3add with SMTP id
 w3-20020a170907270300b0078d2f6e3addmr3524971ejk.154.1665138764584; Fri, 07
 Oct 2022 03:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com> <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
 <Yz/fMH5iEWtKDWNF@pendragon.ideasonboard.com>
In-Reply-To: <Yz/fMH5iEWtKDWNF@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 7 Oct 2022 11:32:27 +0100
Message-ID: <CAPY8ntDa11Psmpg8XbnZqZCWXO1c4WxEkXR5e4sAG95X-Tmvww@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Jacopo.

On Fri, 7 Oct 2022 at 09:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Fri, Oct 07, 2022 at 09:29:59AM +0200, Jacopo Mondi wrote:
> > On Thu, Oct 06, 2022 at 07:33:45PM +0300, Laurent Pinchart wrote:
> > > On Wed, Oct 05, 2022 at 09:06:04PM +0200, Jacopo Mondi wrote:
> > > > Implement the enum_frame_size pad operation.
> > > >
> > > > The sensor supports a continuous size range of resolutions.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/ar0521.c | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > > index c7bdfc69b9be..89f3c01f18ce 100644
> > > > --- a/drivers/media/i2c/ar0521.c
> > > > +++ b/drivers/media/i2c/ar0521.c
> > > > @@ -798,6 +798,24 @@ static int ar0521_enum_mbus_code(struct v4l2_subdev *sd,
> > > >   return 0;
> > > >  }
> > > >
> > > > +static int ar0521_enum_frame_size(struct v4l2_subdev *sd,
> > > > +                           struct v4l2_subdev_state *sd_state,
> > > > +                           struct v4l2_subdev_frame_size_enum *fse)
> > > > +{
> > > > + if (fse->index)
> > > > +         return -EINVAL;
> > > > +
> > > > + if (fse->code != MEDIA_BUS_FMT_SGRBG8_1X8)
> > > > +         return -EINVAL;
> > > > +
> > > > + fse->min_width = AR0521_WIDTH_MIN;
> > > > + fse->max_width = AR0521_WIDTH_MAX;
> > > > + fse->min_height = AR0521_HEIGHT_MIN;
> > > > + fse->max_height = AR0521_HEIGHT_MAX;
> > >
> > > This matches the driver implementation of .set_fmt(), but that's because
> > > the driver is *really* wrong :-( It uses the format to configure the
> > > crop rectangle, which is not right. This needs to be fixed.
> >
> > As far as I understand it, the driver supports smaller resolutions by
> > cropping only, while the sensor would be actually capable of binning.
> >
> > As the driver currently only crops, the analog rectangle always matches the
> > output size hence adding s_selection(CROP) just to replicate what
> > s_ftm() does feels a little dumb ?
> >
> > I concur that ideally the driver should be capable of producing
> > smaller resolution by binning, and in that case being able to
> > configure the analog crop rectangle would be useful. But as long as it
> > doesn't...
>
> We have enough issues with sensor drivers implementing binning or
> skipping in different ways to not make it worse by implementing cropping
> in a creative way as wall :-)
>
> The first step is to fix the driver to implement the selection API. Then
> binning and skipping can be implemented on top, if anyone becomes
> interested in them.

The datasheet and register reference have a fair number of references
to SMIA standards. I wonder if the CCS driver can take over from this
driver entirely....

  Dave

> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > >  static int ar0521_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> > > >  {
> > > >   struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > > > @@ -864,6 +882,7 @@ static const struct v4l2_subdev_video_ops ar0521_video_ops = {
> > > >
> > > >  static const struct v4l2_subdev_pad_ops ar0521_pad_ops = {
> > > >   .enum_mbus_code = ar0521_enum_mbus_code,
> > > > + .enum_frame_size = ar0521_enum_frame_size,
> > > >   .get_fmt = ar0521_get_fmt,
> > > >   .set_fmt = ar0521_set_fmt,
> > > >  };
>
> --
> Regards,
>
> Laurent Pinchart
