Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691245B1569
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 09:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIHHLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 03:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIHHL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 03:11:29 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB2D9CCFB
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 00:11:27 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gb36so35855231ejc.10
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=u7chpfvYjQoJSfpcM79EYoRQuTB5MAVZOIsjo6FQD9g=;
        b=QsEaCIxqzbvLmUrdlmwL1NkZPwrG++jMO86l9c9k7FBYgv6HXVNWEKDTFiXQnFSGQA
         3QCIkbVnAKXmzCE7qGO4h0pIBU23PCBukbfw/s76i3tCFUQdkK232EDEB68jikwlpr9C
         ieg1zrFxOhT2ztu8+krg3/eIS/53LqQbZfqGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=u7chpfvYjQoJSfpcM79EYoRQuTB5MAVZOIsjo6FQD9g=;
        b=Ljq/fsvQIjvZzsLRzg/s22AYqWNMK7d5sn0XdCLndMQkgadQWxle1i4dXKgpGGezeQ
         Jo4/V5HsXkDvM/rsCIF6PULmOCVLS+yf5SEfo7txJNXrRXYTcTheVSGm6P0iJaYWRjNu
         JhXB4Fxz7ujTU1ZXTKZ+/B/15McvCe8FRw3VS07iyWIrOh/me3c+xz2xpZEWsHkB8V0P
         wsChDwx9hjfnEv032scrHgW/JGYvx6qmirJfpIUyO2W9LVDo0DQDlIr10GE/I43JHazw
         FnC9i9X+KgMBmwFixTnasUZG2qZbBzkJVrSJlGKwyY54jT5Gm6en4cV+7O6IDbFcD9pI
         gGUQ==
X-Gm-Message-State: ACgBeo3OZ7+0gl/f8wCP715rh2Zf6hJbYfSvtvhHJcZb/n5yFKJrrRiJ
        zclLLkbVyL9HaarMJUHidtGb2dghUEbxbZx80yY=
X-Google-Smtp-Source: AA6agR4qZbZoN31Rpu48HboNHTtGLN5wYE/K1q041/4IFpFJ6GZUyguD50Pp9KKdAZbA1FOMkNqmYA==
X-Received: by 2002:a17:906:7311:b0:772:a5c0:1f05 with SMTP id di17-20020a170906731100b00772a5c01f05mr2399396ejc.77.1662621086419;
        Thu, 08 Sep 2022 00:11:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id gt23-20020a170906f21700b007708851c6f0sm856649ejb.146.2022.09.08.00.11.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 00:11:23 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id b35so4943409edf.0
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 00:11:23 -0700 (PDT)
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr5814978edc.329.1662621082858; Thu, 08
 Sep 2022 00:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
In-Reply-To: <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 8 Sep 2022 09:11:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
Message-ID: <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 7 Sept 2022 at 12:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 07, 2022 at 09:55:12AM +0200, Ricardo Ribalda wrote:
> > Hi
> >
> > On ChromeOS we have opted to have a camera stack based on the upstream kernel.
> >
> > The camera ecosystem has become extremely heterogeneous thanks to the
> > proliferation of complex cameras. Meaning that, if ChromeOS wants to
> > keep with our upstream commitments, we have to look into how to get
> > more involvement from vendors and standardise our stack.
> >
> > Kcam is an initiative to support complex cameras in a way that can be
> > scalable, is acceptable by the vendors and respect the users rights.
> >
> > Slides at: https://drive.google.com/file/d/1Tew21xeKmFlQ7dQxMcIYqybVuQL7La1a/view
>
> Thank you. A few questions and comments for clarification:
>
> - Slide 4 mentions proprietary drivers and UIO drivers. Do you mean UIO
>   as in the upstream UIO API, or as in UIO-like drivers with a vendor
>   API ?

It is really a jungle. You get UIO-like, real UIO (less common), franken V4L2...

>
> - Slide 5 mentions "Code developed exclusively by vendor" for Android.
>   There's the CameraX initiative (and possibly other I'm not aware of)
>   that mixes the high-level HAL implementation from Google with
>   low-level vendor code, to simplify (in theory at least) the life of
>   vendors. Generally speaking you're right though, the vendor is in
>   charge of providing the HAL, regardless of how it's structured
>   internally.
>
> - Slide 8 is focussed on notebooks (Chrome OS, but I suppose also
>   regular Linux machines) vs. Android when it comes to leveraging the
>   camera stack, but let's not forget there are also other markets (IoT
>   in particular) that may be structured differently. Not all vendors of
>   SoCs that integrate ISPs consider Android as their main target, and
>   they may ignore the notebook and mobile markets completely.


And also not forget about Industry 3.0.
There is a lot of diversity there.

>
> - Slide 11 (and previous slides too) mention "Secret Sauce". I really
>   dislike that term, as it's very vague. I would like discussions to
>   clearly define the scope of that closed-source component, and we
>   should come up with a more descriptive name that reflects that
>   well-defined scope.

I came up with: Closed-loop IQ algorithms. But it is less catchy than
Secret Sauce.

>
> - Slide 16 mentions 122 ioctls to emphasize that V4L2 is a complicated
>   API. Most of those are not relevant to cameras. It is thus a bit
>   misleading technically, but it can be still perceived as complicated
>   by vendors for that reason.

Vivid uses 100... But I agree, it is not the number of ioctls that
makes it complicated.

>
> - Still on slide 16, V4L2 as an API is usable without disclosing vendor
>   IP. What is not possible is upstreaming a driver. I don't see this as
>   significantly different between V4L2 and the new API proposal. I
>   expect this to be discussed on Monday.

I am only considering upstream drivers. There is not much to discuss
for downstream or closed drivers :)

>
> - On slide 17 the color scheme seems to imply that the daemon is
>   open-source, while it's in most cases (maybe in all of them) closed.
>

We get a bit of everything, not only v4l2. So this is why it is
purple: blue + red ;)


> - Do you have a real life example of the type of outcome described on
>   slide 19 (black box hardware) ?

Yes, I am working with the vendor to know how much I can disclose about it.

>
> - Slide 24 mentions parameter buffers, it would be useful to describe
>   what those typically contain, and who consumes them once they're
>   provided by userspace to the driver.

>
> - Slide 27 mentions that upstreaming a driver will require a camera
>   stack with the same open source requirements as V4L2. Doesn't that
>   contradict slide 16 that mentions that V4L2 cannot product vendor IP,
>   or at least infer that the new API wouldn't protect the vendor IP more
>   than V4L2 does ?

Let's discuss that on Monday,

>
> - Slide 31 mentions that entities can send operations internally and
>   listen to each other events. I'd like to better understand how that
>   will work without any abstraction in the API (as that is one of the
>   main design decision behind this new API) when those entities are from
>   different vendors, and handled by different drivers that are developed
>   independently (for instance, the camera sensor and the CSI-2 receiver,
>   or even the CSI-2 receiver and the ISP).

It is still under work.

Hardware, specially for standard buses,  should be resilient (not
crash) to format mismatches. Otherwise a mal-functionling sensor or
too much noise could crash the system (with or without kcam).

Drivers developed together should know about the rest of the system,
so that is not the issue here.

For drivers developed by different vendors for a standard bus, on
hardware that is not resilient (that was a mouthful), then we need to
prepare a set of read-only standard registers.


>
> - Does the bike on slide 32 illustrate the difficult discussions we've
>   had in the past and how progress was hindered ? :-)

This is how we do code review at Google when two developers do not
want to work together. We take the bike to the rooftop and the two
developers that disagree tries to push the other developer to the edge
of the building.

The first second, when you see your colleague falling you think that
you have won.... then you realise that you are falling with them.

(you asked for a metaphor :P )

>
> > Looking forward to see all of you again on Monday :)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
