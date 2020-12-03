Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4F32CD4D6
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbgLCLnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgLCLnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:43:39 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F428C061A4D
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:42:58 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id v14so2474173wml.1
        for <linux-media@vger.kernel.org>; Thu, 03 Dec 2020 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iD48VB81NN4I5q21Vy1Q7V0BWEYlEg8ANFvbfRsvo1w=;
        b=jRP/qwkEHEXaoU3vsKvj0a76Oi2yc3WKhjsE+loPCqeNS7N2N8NvK6+N8uJ6TLiwxp
         +zYplge7udDbiCWu1DR4an7Z8LlD7A79EyGW/wlh9jP3A/QyPUdad/jsF9u7ouh3yyY0
         CM2/edJ/eeJx0M7c6YbotqiKb8kacoCl8lIKWqDJHqOH+Ceh9qN1oq5wKsiaYm744kkG
         q7ab/Yyt/sqUYhW30x/QYhle4JaUaXwrO6vMb6h5Y43rPQ9IJfCAYc+w8G7z98NrDhBQ
         eLQHdhu26NltEFTmyyvgrWJQ5M3bLp4I1RAFA5DryGoRGFxYgS0BTGsjGN0+HS15o/Xl
         nvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD48VB81NN4I5q21Vy1Q7V0BWEYlEg8ANFvbfRsvo1w=;
        b=FCQsTZT9RzGgjQUzTZ3OMW9ZLT0asb4Zdj3Gvs2FiR9hemsdq6Uu+RlKg0SwRQUD3x
         6d8id/E8j9LcltClo+t4tRIRXn7z2y/CsDNog5a+ROVKfzZn0oaLVbA/AZzhdzMItTZK
         11tJKUSIovwdaf9Cj7aYRiV5uwfCqU6InKPYjil7FEY5IW5IjtX2jcvQY68sJMGwuyvm
         dPol7bQewJxrrvSuo+LCfV6/hDh3CwuQdhTddQd7q4EBjgn/RVbnk5KbMSXtZAasapdt
         mixj7UCPDGPvukEhZxNVHgJqC3Z9qzNKrE9W1CZsG/54T2Mx4KfXAVhjywzcBVirAudF
         l0FA==
X-Gm-Message-State: AOAM533XJdbR5nVXeN2paALsimHmHWbgGLeAjYQ2AihZQ12dH7ArzrRW
        c3/MaUdKAhNR+SgdR5JK2v2HD2IPvIFl5jrZkAOkMuqigLrmEw==
X-Google-Smtp-Source: ABdhPJzGCckT1K2CZlyiHXcsmrA7FfJx14VB2PUmGVPkSSArCiMdOBtxwFmUVgKCeUC2l5XIeQwh14wgesejEoLAIdk=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr2948688wmf.82.1606995777276;
 Thu, 03 Dec 2020 03:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20201110174036.220883-1-jacopo@jmondi.org> <20201110174036.220883-6-jacopo@jmondi.org>
 <20201202220635.GC4351@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201202220635.GC4351@valkosipuli.retiisi.org.uk>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 3 Dec 2020 11:42:38 +0000
Message-ID: <CAPY8ntC42KJ-8SB2JbG=bbHKOD7u7qs8kqTJZ7unz63nxpXtZQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: bcm2835-unicam: Add TODO file
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "cc: Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        mchehab+huawei@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, 2 Dec 2020 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Jacopo,
>
> On Tue, Nov 10, 2020 at 06:40:36PM +0100, Jacopo Mondi wrote:
> > The bcm2835-unicam driver is currently in staging mainly for
> > two reasons:
> > - Handling of CSI-2 embedded data
> > - Usage of both media controller API and subdev kAPI
> >
> > Provide a more detailed description of the currently on-going design
> > discussions in the associated TODO file.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/staging/media/bcm2835-unicam/TODO | 37 +++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 drivers/staging/media/bcm2835-unicam/TODO
> >
> > diff --git a/drivers/staging/media/bcm2835-unicam/TODO b/drivers/staging/media/bcm2835-unicam/TODO
> > new file mode 100644
> > index 0000000000000..c7840872eea4c
> > --- /dev/null
> > +++ b/drivers/staging/media/bcm2835-unicam/TODO
> > @@ -0,0 +1,37 @@
> > +BCM2835 Unicam driver TODO list
> > +===============================
> > +
> > +The unicam driver could be considered ready to be moved out of the staging
> > +directory in terms of code quality and expected functionalities.
> > +
> > +However there currently are two design issues that suggest the driver is
> > +better kept in staging for the time being.
> > +
> > +CSI-2 Embedded data support:
> > +----------------------------
> > +
> > +The RaspberryPi camera stack and camera applications rely on the availability of
> > +the sensor produced CSI-2 embedded data, whose support is currently not
> > +finalized in mainline Linux.
> > +
> > +The driver conditionally registers an additional video device node
> > +'unicam-embedded' with a single sink pad which connects to the sensor
> > +sub-device source pad #1 to expose ancillary data.
> > +
> > +Currently none of the mainline sensor drivers register more than a single pad,
> > +and consequentially no embedded data from the sensor are exposed to userspace.
> > +
> > +The current implementation is then subject to changes depending on how support
> > +for CSI-2 embedded data gets finalized in Linux.
>
> Are you looking to use out-of-tree sensor drivers that have two pads? I'd
> rather see sensor drivers merged to mainline proper.
>
> But as noted in the other e-mail, we need VC / stream support so this needs
> to be addressed for reasons not related to Unicam.

There's a downstream patch for imx219 that adds the second pad [1].
The imx477 driver that is currently only out-of-tree also supports it,
and should be upstreamed once this first wave of patches have got
somewhere.

[1] https://github.com/raspberrypi/linux/commit/fa8131cb1399f2c22de3f29e08ec1658db76552b
It's on the rpi-5.10.y branch too, but that is still being frequently
rebased so no stable commit hashes

> > +
> > +Media controller support:
> > +-------------------------
> > +
> > +Due to compatibility reasons with the existing RaspberryPi software ecosystem
> > +the unicam driver implements the media controller interface to allow the
> > +enumeration of the connected entities but handles the configuration of the
> > +sensor sub-device using the v4l2-subdev kAPI instead of delegating that to
> > +user-space.
> > +
> > +Discussions are on-going on how this should be better handled (driver option,
> > +KConfig option etc etc).
>
> That's a fair use case. There are two ways to handle it, either in the
> kernel where the choice affects how the user space looks like. You have an
> option of module parameter or Kconfig option there, and both are true
> annoyances.
>
> Another option is to work around it in the user space, wrapping the IOCTL
> calls. This way no kernel build or module load time parameters would be
> needed to switch between the two sets of user space programs.
>
> We probably can't decide it now, but could an MC-only driver + user space
> compatibility layer be an option here?

Iff the user-space compatibility layer worked with all standard users
(eg v4l2-ctl, FFmpeg and Gstreamer), then it's plausible, but is that
realistic?

The non-MC approach is mainly for things like the TC358743 HDMI->CSI
bridge and ADV728x-M chips where MC adds nothing, and they do just
work with the likes of FFmpeg and Gstreamer.
Image sensors are generally going to be used under libcamera umbrella,
so there MC works.

Kconfig isn't an option for us as one kernel build needs to support
all potential source devices via DT / runtime changes alone.

I haven't looked in detail at what the previous VC / stream patches
proposed as the API for passing the configuration. We only need MC for
the more complex use cases, so if that VC/stream API usage can be
detected at probe then we can switch to MC. It doesn't seem
unreasonable to expect any sensor drivers to be upgraded to correctly
use the new API even if they don't actually produce embedded data.
We also want MC for ADV748x HDMI&analog->CSI bridges that expose
multiple subdevs, but there we can look at the upstream endpoint and
see if it has any sink pads. Sink pads mean MC is needed. (I now have
a board with an ADV7482 on, so when time allows I'm intending to have
an experiment with it).
Use a module parameter as a last resort should the detection fail, or
I guess if you want to override the detected setting for some reason
(a simple sensor being used outside of libcamera for example).

Cheers.
  Dave
