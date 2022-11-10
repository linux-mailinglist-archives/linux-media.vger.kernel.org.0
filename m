Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E32623CC8
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 08:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbiKJHix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 02:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiKJHiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 02:38:50 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4841132B99
        for <linux-media@vger.kernel.org>; Wed,  9 Nov 2022 23:38:48 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id z18so1758515edb.9
        for <linux-media@vger.kernel.org>; Wed, 09 Nov 2022 23:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FAaDdwy7j9m7doWZKZGjGQzA/1cIC49JHIOrwYtvrM=;
        b=USinKoBm1FL0xfkzCbi8cDnxk/yd4luSXeq7KdOzEE6b3TLqQM/V8c8IgyeOMmF1yC
         gY/tm36lhG3A7h7fhU3SYegev3X4IuPubNRq/geQxmCIXj+mnkHCgR3VkLp0vMki4TSL
         YlEWnDhPW/OG0z3syZ4+wOU1MwXyLdB/kKD/Gcq57zAYY4yscEDV/rqzqI3w474+f/T7
         Z5qSKmJyhm18/Gy1nq/MLOm65eXzqe4jbcAf1WRlXu+SwbMyUtXYoCVngWn3YEAL19f9
         t6zPKq6PhcfQqqKuJX9L3Wfn2FL2wxd3rv9Yl78gzaDcqaq4L4gRbYBE4yS+x8fv2tmN
         Ah4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FAaDdwy7j9m7doWZKZGjGQzA/1cIC49JHIOrwYtvrM=;
        b=gLecLs0sfmMOE+EbjCYdncxAuK4k7oTml+TCBwzpj8g9RmUsz8OEMAOhgE+D+CtJ/p
         t8n8Ucs6f+QKM6rJH/YrGO/s+6RFXoEDBmwo/A79cY8UWBlKMwNo2wiRwbQifKrgTwnZ
         oa2oVyAHY1E2iDgm5+E4p5Ty9RFU0ert080TjEkCF6VIAZREEgGh57NY5CKjWzGg5bWt
         FkkABrLrDFK2C+p5UBvYLocwzuQEgTzOfmVxhoQKb+ikTEAKGUOa865RccgBYLhFNU4f
         P3k2LKzNGzo+0gUdbImgudkZI9HoIJTdUTytSknJ5Ia2G/flv7aqcEGMg4Gp3dVLotsD
         i/zg==
X-Gm-Message-State: ACrzQf243jqfcbD4bsLnTnWLxBI1yzHpLC6BkMT0XwOuvMsHaaImZXt9
        YJJV9B78vKlm7LDcPGmsOuaJENv5uXB8o3rOgcvwXg==
X-Google-Smtp-Source: AMsMyM443aK/VA/51tI5l2tmpnUznSHbJ3oDG9sf1JYsiiBGUSEWJoom1DvOdcM03E5LsNsrIwClOTex+CufQU9tCmY=
X-Received: by 2002:a05:6402:c07:b0:461:87ab:78aa with SMTP id
 co7-20020a0564020c0700b0046187ab78aamr63148529edb.258.1668065926601; Wed, 09
 Nov 2022 23:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org> <20221107204959.37691-2-jacopo@jmondi.org>
 <CAPY8ntDJVJftyxRsRg+cdbPfLpFXP4Mijy8F5ZOWLTtPqUt-LA@mail.gmail.com> <20221108120243.smg54xeqv5dmyect@uno.localdomain>
In-Reply-To: <20221108120243.smg54xeqv5dmyect@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 10 Nov 2022 07:38:29 +0000
Message-ID: <CAPY8ntCqHGTRFiGOP1BbYE7VDCGAvm9aQSWYZD7Ky2S8WGVdXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame interval
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Tue, 8 Nov 2022 at 12:02, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>    thanks for the reply
>
> On Tue, Nov 08, 2022 at 11:41:58AM +0000, Dave Stevenson wrote:
> > Hi Jacopo.
> >
> > On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > The formula to compute the frame interval uses the analogue crop
> > > rectangle dimensions to compute the total frame size in conjunction with
> > > blankings.
> > >
> > > Horizontal and vertical blankings are realized by extending the time
> > > interval during which no valid pixels are sent on the bus between
> > > visible lines and between consecutive frames, whose size is smaller than
> > > the analogue crop rectangle if any additional cropping or pixel
> > > subsampling is applied on the sensor processing pipeline.
> > >
> > > Correct the documentation to use the visible line length and frame
> > > height instead of the analogue crop dimensions.
> >
> > I'll defer to Sakari on this, but I think the original text is correct.
> >
> > Consider something like CCS where you have a separate array with
> > analogue crop, and then binning and scaling steps. AIUI the pixel rate
> > and [HV]BLANK will be defined for the array, not on the binned and
> > scaled values which finally give the visible frame. See [1].
> >
> > For the majority of sensors where analogue cropping, binning, and
> > scaling are not broken out separately, then it may well have been
> > incorrectly implemented as they do often look at the output
> > width/height. Should they be using the w/h values returned by
> > V4L2_SEL_TGT_CROP on V4L2_SUBDEV_FORMAT_ACTIVE for the sensor modes
> > instead? Quite probably, but that also makes the userspace more
> > complex (and probably needs fixing).
>
> More or less this was my reasoning, please see the cover letter.

 A thought came to me on this one.
If defined as the output width/height of the subdev implementing the
blanking controls, then both CCS and the majority are correct as they
are.

Doing so also avoids a load of mess in drivers where H & V binning
each double the pixel rate if VBLANK/HBLANK are with regard the
analogue cropped area, which results in more controls to update in the
driver, and more to reread in userspace.

Cheers.
  Dave

> >
> >   Dave
> >
> > [1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L734
> >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  Documentation/driver-api/media/camera-sensor.rst | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index c7d4891bd24e..bb7d62db4cd1 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -87,12 +87,11 @@ less all modern raw camera sensors.
> > >
> > >  The frame interval is calculated using the following equation::
> > >
> > > -       frame interval = (analogue crop width + horizontal blanking) *
> > > -                        (analogue crop height + vertical blanking) / pixel rate
> > > +       frame interval = (visible width + horizontal blanking) *
> > > +                        (visibile height + vertical blanking) / pixel rate
> > >
> > >  The formula is bus independent and is applicable for raw timing parameters on
> > > -large variety of devices beyond camera sensors. Devices that have no analogue
> > > -crop, use the full source image size, i.e. pixel array size.
> > > +large variety of devices beyond camera sensors.
> > >
> > >  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > >  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > --
> > > 2.38.1
> > >
