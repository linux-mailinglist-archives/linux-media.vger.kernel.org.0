Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB642746F51
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbjGDLDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjGDLDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:03:22 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9231DA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:03:16 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-47e06acce3bso1569711e0c.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688468596; x=1691060596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIkYZNSSLzd/Q7BKjVA0VhNCaXvEzotB6tIWIMSfpE8=;
        b=kCl2zhYmR+NkzjVnH3QHDqj2rndHE2TTBYD6C0voW8hpKDUa0szPiELNxLq3XkUuQv
         ukyyAK/MHQTwGdvCvBt67Ru0+b99AF9diBZxrOJfYm0v5ltSqmczl8RvvLfx2RMnAfnB
         iPl6ZHEbGWEGC4huLgon7PWG8KvD+xM64puMCQtGEDgKc9nonyKCd4Wg2/KHtWuqhkUz
         9euaKQCRX6THaqS0ONdyh0m2xPF5B3SPqGvK6MdCrCAgn8JI+ZwllHpjqYrCAen6v0T5
         a6NTybtf17laeggX8UTrLgFSwAu/PeAGVrJQJ4eZcesb3aJsTqg/PeYme5S89UW+qAIV
         7VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688468596; x=1691060596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIkYZNSSLzd/Q7BKjVA0VhNCaXvEzotB6tIWIMSfpE8=;
        b=CKa44nljGTFyT9Qb59tledrz/YooPbLO0NAv6jfM14AE/LxDrQqQ/NTJS2eCVbJUyR
         zGmDJRFdpGygZ7xAd/d9oqu4mz+rDHw0XG5KG7NZX66ot6yWx3UHqJj229Zbfnuj0W02
         LMIXBiEr/Wev0bv/FzVVL4OqWYkIz8X6NCdnC+gzhuAhYnPXNjcj7swbvG/LluPQdXAL
         746uZZmWDsYH31vc0dIlpS6m99Boj+GGNtdgkQgkLewSsnasTUnY4ihbCgPmr9Xju7jo
         wXlKU9EOgBmVMTIQpUTc8tlsmIcyYY7RYPYt2ZjmxsZSNeKvC5bBx8itP8eXV2JZyg59
         WRJw==
X-Gm-Message-State: ABy/qLbhnqI2zhK8pAguxPMaRTvst6p0S4Q7f25cpMmc7wPRyceopQHQ
        2quB91pZ3A9nTZUL6GYVYzbX4YRlSCvmTBGRPVmOiEIEU75/PJ3xr3I=
X-Google-Smtp-Source: APBJJlFOvTL6PrjneQW8fGsMEO9wPsLY5OgxLS5imDI9nNM58wqCT2yeKtUWGIjjbxRz2Xdd/q4Fk8Wh5JS1AFgZDdM=
X-Received: by 2002:a05:6122:4b:b0:46e:7102:7211 with SMTP id
 q11-20020a056122004b00b0046e71027211mr6387089vkn.11.1688468595971; Tue, 04
 Jul 2023 04:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-2-jacopo.mondi@ideasonboard.com> <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
 <bnk6t3td26dlrik54gw4jf33anajvfpgah4qut6nn4bstxd6zu@b2ajma7t4hf5>
In-Reply-To: <bnk6t3td26dlrik54gw4jf33anajvfpgah4qut6nn4bstxd6zu@b2ajma7t4hf5>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 12:03:00 +0100
Message-ID: <CAPY8ntAx5VXQD_NTpSq9D3B-MOSY21P=hA0p5ktkuJK3Ah1VbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: v4l: Flip handling for RAW sensors
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jul 2023 at 11:24, Jacopo Mondi <jacopo.mondi@ideasonboard.com> w=
rote:
>
> Hi Dave,
>    thanks for the comments
>
> On Tue, Jul 04, 2023 at 10:58:11AM +0100, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > Thanks for adding documentation.
> > Sorry I couldn't be at your presentation, but I'll find the slides
> > (and recording if there is one).
> >
>
> videos and slides should be already available for attendees. If not I
> can send you the slide deck, but trust me, there is nothing new for
> you there.
>
> > On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.co=
m> wrote:
> > >
> > > Document the requirement of notifying to userspace the possible
> > > re-ordering of the color sample components when a vertical or horizon=
tal
> > > flip is applied to a RAW camera sensor.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++=
++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Docum=
entation/driver-api/media/camera-sensor.rst
> > > index 93f4f2536c25..ee4a7fe5f72a 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programm=
ed by the register sequences.
> > >  The default values of these controls shall be 0 (disabled). Especial=
ly these
> > >  controls shall not be inverted, independently of the sensor's mounti=
ng
> > >  rotation.
> > > +
> > > +Flip handling for raw camera sensors
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Possibly "for colour raw camera sensors".
> > Mono sensors are still raw in that they need processing for black
> > level, lens shading, etc, but they won't change the colour ordering.
> >
>
> Thanks, good point
>
> > > +
> > > +Applying vertical and horizontal flips on raw camera sensors inverts=
 the color
> > > +sample reading direction on the sensor's pixel array. This causes th=
e
> > > +re-ordering of the color samples on the sensor's output frame.
> >
> > This *may* cause the re-ordering....
> >
> > Not all sensors do. Some shift the readout by one line/column to keep
> > the Bayer order the same, and technically should update the selection.
> > OnSemi sensors in particular seem to do this, as do the Sony
> > IMX327/290/462 family.
> >
>
> Is it the driver doing the shift or is it the sensor automatically
> adjusting ?

The sensor does it.

For IMX290, the array is defined horizontally as:
4 ignored pixels
8 pixels margin for colour processing
1920 recording pixel area
9 pixels margin for colour processing
4 ignored pixels
(3 dummy pixels)
Ignoring the dummy ones, that gives a width of 1945 pixels.

Vertically is similar with 1109 pixels total (9 colour margin / 1080
active / 8 colour margin).

That means it is a red pixel in all 4 corners of the full 1945x1109
array, and it keeps the 8 pixels margin on the left of the image read
out in all circumstances, and 8 at the top too so that readout always
follows that.
It's slightly weird as a sensor in that it has presets for 1080p and
720p, as well as a windowed mode where you can arbitrarily crop from
the whole array. The driver only uses the two presets, so exactly what
is going on is partly reverse engineering.

With regard OnSemi, we asked them about it several years ago, and the
response was that there was no way to change that behaviour for the
sensor we were looking at.
From that datasheet:
"While the sensor=E2=80=99s format is W =C3=97 H, the additional active col=
umns and
active rows are included for use when horizontal or vertical mirrored
readout is enabled, to allow readout to start on the same pixel. The
pixel adjustment is always performed for monochrome or color versions"
Definition of the VERT_FLIP bit
"1: Readout is flipped (mirrored) vertically so that the row specified
by y_addr_end_ (+1) is read out of the sensor first"
and HORIZ_MIRROR bit
"1: Readout is mirrored horizontally so that the column specified by
x_addr_end_ (+1) is read out of the sensor first."

Having just checked a different OnSemi datasheet, that doesn't state
that it alters the pixel read out first when flipped. It possibly
depends on the target market for the sensor, and how configurable they
anticipate the ISPs to be.

  Dave

> > > As an example, a
> > > +raw camera sensor with a Bayer pattern color filter array and a nati=
ve RGGB
> > > +Bayer order will produce frames with GRBG component ordering when a =
vertical
> > > +flip is applied.
> >
> > Vertical flip of RGGB would be GBRG as the RG and GB get swapped, not
> > GRBG (which would be horizontal flip).
>
> I clearly mean horizontal sorry. I'll fix.
>
> Thanks
>    j
>
> >
> >   Dave
> >
> > > Camera sensor drivers where inverting the reading order
> > > +direction causes a re-ordering of the color components are requested=
 to register
> > > +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace th=
at enabling
> > > +a flip can potentially change the output buffer content layout. Flip=
s should
> > > +also be taken into account when enumerating and handling media bus f=
ormats
> > > +on the camera sensor source pads.
> > > --
> > > 2.40.1
> > >
