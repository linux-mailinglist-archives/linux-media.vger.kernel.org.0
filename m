Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE0D5B04E4
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 15:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiIGNNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 09:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiIGNNH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 09:13:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828ED7E000
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 06:13:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so30218627ejc.10
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yt9Fbba45IRvhKabsVbjWFmSEcJCYQEjb3Wd9KIhmPc=;
        b=QdpXYeu2yLQiVBKKKgQLgxH0U/3iXcma43cV8xYRJfGk0UZZh8dSZqb41nK6M1aL0B
         2xdrsj2JFNV9taUzeEJ2uHmLwkReCxAcUyy0Go/0Rg94dk/8bGlljcB0OvpR96a/w/+B
         h/QYnvzOskdKz+IzjZkbsllty9SFFmv2cvMZUIwPcQJFtFsTOsAAdehXbq1iDGRwqfym
         sQf6AJ+GKhwBSWCORp8MVJ/MoN2puOnipUPFiGekJrl12vzU8wrXsM0gzUiwdLBZx6Zz
         5bxjwN2FUAMettJMwP/q1O9JtGYrUZLHTVU5furemhuuhD58wAGuVwEnDONCBE4/Nxor
         o6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yt9Fbba45IRvhKabsVbjWFmSEcJCYQEjb3Wd9KIhmPc=;
        b=nLAMfvdcoFUNRIOr5Irraz7Du1U+UykzLCs83A+ydxuWM1J+ZP5SYyc+gt2XEz1lGl
         bDGuoDj5i2MK4P+oNmnrqlu6pTxGsGhlIjgTtzjtwpX7euy3Yp/VJ97a+GES7vesnn9Z
         peM0tEczubZ95kKLY9ZyjK939mpkUFtfTJEHDKCMGGKk08WsUcfTFWhTRJpHOS3UfikZ
         7k2kj5eOVzPKz0gorq0NZRsLzoY2TlaMW5UxnyeA+r+3wCQyuQqox3i1wzkMLhnUY5NX
         tV3OdG+JrIN7ChkrHMS/ecxuKldPSMJ97ZCQr0rmk03BFqkoPbpoetrOLzE1sglkZ0FR
         C41A==
X-Gm-Message-State: ACgBeo1t07Yiks9LRrcl3C9q2/9P6ywOvogsNKB5LkCne4815/VhVk2l
        WLzKsYnfvPVwuSfh/Tz6pd/sPn8qlRVEpKcEpSlgLw==
X-Google-Smtp-Source: AA6agR6fjrigOm0zVJmzTk1iku9nTllH8FjKkSu3Ua4tIXApC8Yofjol+qeUWCGKl48qai1+8fXVNuNxpXjvfBuG1ck=
X-Received: by 2002:a17:907:7e8a:b0:732:ff29:d1d6 with SMTP id
 qb10-20020a1709077e8a00b00732ff29d1d6mr2389457ejc.175.1662556378963; Wed, 07
 Sep 2022 06:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
 <YxeJI8Fwf0ExkMTI@pendragon.ideasonboard.com> <Yxfoyy9bP1HEv3JL@pendragon.ideasonboard.com>
In-Reply-To: <Yxfoyy9bP1HEv3JL@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 7 Sep 2022 14:12:42 +0100
Message-ID: <CAPY8ntCzd3FyFLgZJ7-CrDFLiuqkqi1vX6B_nxe33xAayjMBEA@mail.gmail.com>
Subject: Re: [Media Summit] Imaging Sensor functionality
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 7 Sept 2022 at 01:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Tue, Sep 06, 2022 at 08:53:41PM +0300, Laurent Pinchart wrote:
> > On Tue, Sep 06, 2022 at 05:14:30PM +0100, Dave Stevenson wrote:
> > > Hi All.
> > >
> > > I realise that I'm in a slightly different position from many mainline
> > > Linux-media developers in that I see multiple use cases for the same
> > > sensor, rather than a driver predominantly being for one
> > > product/platform. I'm therefore wanting to look at generic solutions
> > > and fully featured drivers. Users get to decide the use cases, not the
> > > hardware designers.
> >
> > Could you clarify here what you mean by users and hardware designers ?
> > Users can be understood as
> >
> > - Users of the camera sensor, i.e. OEMs designing a product
> > - Users of the hardware platform , i.e. software developers writing
> >   applications
> > - Users of the software, i.e. end-users
> >
> > Hardware designers could then equally mean
> >
> > - Sensor vendors
> > - SoC vendors
> > - Board vendors
> > - Product vendors
> >
> > > The issues I've raised are things that I've encountered and would
> > > benefit from a discussion to get views as to the direction that is
> > > perceived to be workable. I appreciate that some can not be solved
> > > immediately, but want to avoid too much bikeshedding in the first
> > > round of patches.
> > > What's realistic, and what pitfalls/limitations immediately jump out at people.
> > >
> > > Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing
> >
> > Thank you, I will review that ASAP.
>
> A few questions:
>
> - Regarding the sensor synchronization, are you considering the trigger
>   signal as signaling the beginning of exposure only, or also use cases
>   where it controls the exposure duration ?

I was predominantly thinking of the modes offered by the sensor
vendors for synchronisation with other identical modules. Exactly
which phase of the capture is synchronised is therefore down to the
sensor vendor.

(AIUI typically this will be the start of exposure that is triggered.
If the sensors are programmed for different exposure times, then start
of readout will be at slightly different points. That would mean that
trying to synchronise the two streams based on timestamps will fail,
but sequence numbers should match as long as the slave is started
before the master).

> - For VCM ringing reduction and standardization of parameters, are there
>   examples you could share to explain this in more details, with the
>   type of parameters that need to be specified ?

This was one that I hadn't fully thought through as to whether it
could be standardised, but a discussion that ended with acceptance
that we needed module specific DT parameters was equally valid.
A couple of examples:
Fitipower FP5510E offers a linear slope mode, or two step control mode
http://www.jifangsz.com/FP5510E-Preliminary%200.2-JAN-2018.pdf.
Dongwoon DW9714A is nearly identical to FP5510E.
Dongwoon DW9807 and DW9817 are nearly identical to each other, but
DW9807 drives 0-100mA, whilst DW9817 is bi-drectional and +/- 100mA.
"Smart Actuator Control" is derived off an internal oscillator and
takes a prescaler (x1, x2, or x4), timing (7 bit as 0.03ms steps), and
a mode (target movement time against a "mechanical vibration period").

> And one comment. On slide 20/23, you wrote
>
>   Likely to produce a load of boilerplate in all drivers. Abstract out
>   an image sensor pinctrl helper?
>
> I think we need more than that, we need a large helper for camera
> sensors (in particular for raw sensors) that will bridge the large gap
> between the sensor and the V4L2 subdev API. There's too much boilerplate
> code already, and worse, different sensor drivers exposing the same
> feature to userspace in different ways.

Absolutely on too much boilerplate and then variation already. If
helpers can do all the work then that's great, and I'm happy to look
at doing some of that.
It does need the "correct" implementation to have been defined in the
first place.....

  Dave

> > > See you on Monday.
>
> --
> Regards,
>
> Laurent Pinchart
