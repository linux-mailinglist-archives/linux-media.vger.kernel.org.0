Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2A12F193F
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 16:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbhAKPNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 10:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731300AbhAKPNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 10:13:08 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3832C061786
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 07:12:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t16so149041wra.3
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mx5ydVe3rKHzeiOaHX1KLoNpiy4h3vkH8cH6i0qOWRM=;
        b=fwVuftyT8A4lbv/Yb2bz+X4NwNoBXUWL/OfhNxdXjGJahSrBNbe2PRIDCmkUL6QIIk
         atAixBSUN8e5gmK3G0ebMaDYFfNHXxPTjoK8CvuRfFMWzzB/sMkwFkxJZRV2Ufzusorc
         fx5OQLB88Ej7FkWxJ5mlt7YmoqrXCkUP5qVR6PAEjpVCTVf2fPc65kgm5ZDZqEtbrdof
         0OfSEasmtYKrSbZfgPob8wY56TbpxtVmTjXPOagtOCxW6wLBCTzKZ+tt0s9YKDb1Z3ne
         l9rCEpeJwupXrv2ABni1Rq0USJNNrb3BYRsIB6lhinEhv02twfJhU+Rt2c1EVKOIeHN8
         lfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mx5ydVe3rKHzeiOaHX1KLoNpiy4h3vkH8cH6i0qOWRM=;
        b=OS9uYZKOp97rPyaFOxkxNMvCMr/BWBwUKDCRHs0NIM+MJoR47jnU/9U8ZCH1XuFQCw
         YGKm6UnW9yZ7wLVP6mMp3xfsWegbL+anG2AqXWsmdz9wOdkyKPMCLkES8H37hOwYlHmk
         M0ef9Yn+437F5oBS5WXQ2nPSGRY1VfGT1RMUndx8XGKBrGEH0t1V5Zqlq9r5pBW2yoGK
         Szn5lLXe8cTLwitD00HoUhotVv9xKR+h8jAEGyb+sOJzXv3V0APu9nshNfRfwypPTOpY
         Q3VWzTiIFSMhG+Buda2NQ0+TmqPH9OYL3DTZXgum6U+pd9e/YE5pzl9WmSTdF5LGpI3i
         ABpA==
X-Gm-Message-State: AOAM533xTm9w/MhHIIxQSEbDcBVUIuGdVWG2/dMNwIs8fxGPMZG46wSz
        ujeoCuzuu+91Vbg0+fTpKCdd0G7zIdIM726VUh7TFw==
X-Google-Smtp-Source: ABdhPJy7ydGaU2Ei3ypPcsrEunDHuOIyqKf2cH4hqn0IDmsKH6Ol0Pna4yRVvNHYkNBMo+d+ltiLNKM1HHvB2auG8EU=
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr16542586wrq.47.1610377946699;
 Mon, 11 Jan 2021 07:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20201110174036.220883-1-jacopo@jmondi.org> <20201110174036.220883-6-jacopo@jmondi.org>
 <20201202220635.GC4351@valkosipuli.retiisi.org.uk> <CAPY8ntC42KJ-8SB2JbG=bbHKOD7u7qs8kqTJZ7unz63nxpXtZQ@mail.gmail.com>
 <X/Rp3KUGPd3ZKXm0@pendragon.ideasonboard.com>
In-Reply-To: <X/Rp3KUGPd3ZKXm0@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 11 Jan 2021 15:12:10 +0000
Message-ID: <CAPY8ntCViDgXic-r83U8yeyEBVLDcCQbTzLDuek9c4e3Tv7bwg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: bcm2835-unicam: Add TODO file
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>,
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

Hi Laurent

On Tue, 5 Jan 2021 at 13:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave and Sakari,
>
> On Thu, Dec 03, 2020 at 11:42:38AM +0000, Dave Stevenson wrote:
> > On Wed, 2 Dec 2020 at 22:07, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > On Tue, Nov 10, 2020 at 06:40:36PM +0100, Jacopo Mondi wrote:
> > > > The bcm2835-unicam driver is currently in staging mainly for
> > > > two reasons:
> > > > - Handling of CSI-2 embedded data
> > > > - Usage of both media controller API and subdev kAPI
> > > >
> > > > Provide a more detailed description of the currently on-going design
> > > > discussions in the associated TODO file.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  drivers/staging/media/bcm2835-unicam/TODO | 37 +++++++++++++++++++++++
> > > >  1 file changed, 37 insertions(+)
> > > >  create mode 100644 drivers/staging/media/bcm2835-unicam/TODO
> > > >
> > > > diff --git a/drivers/staging/media/bcm2835-unicam/TODO b/drivers/staging/media/bcm2835-unicam/TODO
> > > > new file mode 100644
> > > > index 0000000000000..c7840872eea4c
> > > > --- /dev/null
> > > > +++ b/drivers/staging/media/bcm2835-unicam/TODO
> > > > @@ -0,0 +1,37 @@
> > > > +BCM2835 Unicam driver TODO list
> > > > +===============================
> > > > +
> > > > +The unicam driver could be considered ready to be moved out of the staging
> > > > +directory in terms of code quality and expected functionalities.
> > > > +
> > > > +However there currently are two design issues that suggest the driver is
> > > > +better kept in staging for the time being.
> > > > +
> > > > +CSI-2 Embedded data support:
> > > > +----------------------------
> > > > +
> > > > +The RaspberryPi camera stack and camera applications rely on the availability of
> > > > +the sensor produced CSI-2 embedded data, whose support is currently not
> > > > +finalized in mainline Linux.
> > > > +
> > > > +The driver conditionally registers an additional video device node
> > > > +'unicam-embedded' with a single sink pad which connects to the sensor
> > > > +sub-device source pad #1 to expose ancillary data.
> > > > +
> > > > +Currently none of the mainline sensor drivers register more than a single pad,
> > > > +and consequentially no embedded data from the sensor are exposed to userspace.
> > > > +
> > > > +The current implementation is then subject to changes depending on how support
> > > > +for CSI-2 embedded data gets finalized in Linux.
> > >
> > > Are you looking to use out-of-tree sensor drivers that have two pads? I'd
> > > rather see sensor drivers merged to mainline proper.
> > >
> > > But as noted in the other e-mail, we need VC / stream support so this needs
> > > to be addressed for reasons not related to Unicam.
> >
> > There's a downstream patch for imx219 that adds the second pad [1].
> > The imx477 driver that is currently only out-of-tree also supports it,
> > and should be upstreamed once this first wave of patches have got
> > somewhere.
> >
> > [1] https://github.com/raspberrypi/linux/commit/fa8131cb1399f2c22de3f29e08ec1658db76552b
> > It's on the rpi-5.10.y branch too, but that is still being frequently
> > rebased so no stable commit hashes
> >
> > > > +
> > > > +Media controller support:
> > > > +-------------------------
> > > > +
> > > > +Due to compatibility reasons with the existing RaspberryPi software ecosystem
> > > > +the unicam driver implements the media controller interface to allow the
> > > > +enumeration of the connected entities but handles the configuration of the
> > > > +sensor sub-device using the v4l2-subdev kAPI instead of delegating that to
> > > > +user-space.
> > > > +
> > > > +Discussions are on-going on how this should be better handled (driver option,
> > > > +KConfig option etc etc).
> > >
> > > That's a fair use case. There are two ways to handle it, either in the
> > > kernel where the choice affects how the user space looks like. You have an
> > > option of module parameter or Kconfig option there, and both are true
> > > annoyances.
> > >
> > > Another option is to work around it in the user space, wrapping the IOCTL
> > > calls. This way no kernel build or module load time parameters would be
> > > needed to switch between the two sets of user space programs.
> > >
> > > We probably can't decide it now, but could an MC-only driver + user space
> > > compatibility layer be an option here?
> >
> > Iff the user-space compatibility layer worked with all standard users
> > (eg v4l2-ctl, FFmpeg and Gstreamer), then it's plausible, but is that
> > realistic?
>
> We have a compatibility layer in libcamera, implemented with a
> best-effort approach (as the gap between a V4L2 video node and a complex
> camera is larger to bridge than between a video node and an MC-based
> device with a simple linear capture pipeline). It works, but has its
> share of issues as LD_PRELOAD'ing a library isn't always a practical
> option.
>
> I believe the wrapper that Sakari envisions is feasible to implement as
> the problem space is smaller (in a way the code already exists in kernel
> space in the unicam driver, it bridges between the video node and the
> input subdev). The tricky part will be to make it nice to use.
>
> > The non-MC approach is mainly for things like the TC358743 HDMI->CSI
> > bridge and ADV728x-M chips where MC adds nothing, and they do just
> > work with the likes of FFmpeg and Gstreamer.
>
> There are of devices that won't benefit much from an MC-based approach,
> but note that in the non-camera use cases, you could have chips such as
> the ADV748x which has one HDMI input, 8 analog inputs and two CSI-2
> outputs with configurable routing in-between.

The main difference there is that no one has ever been able to use
ADV748x without MC.

Running a mono image sensor, ADV728x-M or TC358743 is all perfectly
possible in a non-MC world. I don't want the headache of all the user
complaints should that get removed, even if able to workaround it with
a LD_PRELOAD library.

Should a wrapper appear then that would potentially remove the need
for the kernel to support a non-MC mode, but currently it looks like a
driver supporting both modes is the only answer.

> > Image sensors are generally going to be used under libcamera umbrella,
> > so there MC works.
> >
> > Kconfig isn't an option for us as one kernel build needs to support
> > all potential source devices via DT / runtime changes alone.
> >
> > I haven't looked in detail at what the previous VC / stream patches
> > proposed as the API for passing the configuration. We only need MC for
> > the more complex use cases, so if that VC/stream API usage can be
> > detected at probe then we can switch to MC. It doesn't seem
> > unreasonable to expect any sensor drivers to be upgraded to correctly
> > use the new API even if they don't actually produce embedded data.
>
> I'm not sure that would be the case, support for multiplexed streams
> would be on top of the V4L2 subdev in-kernel API, and I don't expect
> changes in camera sensors that don't support multiple streams.
>
> > We also want MC for ADV748x HDMI&analog->CSI bridges that expose
>
> There we go :-)

New use case, therefore no existing user expectations on how it would work.

> > multiple subdevs, but there we can look at the upstream endpoint and
> > see if it has any sink pads. Sink pads mean MC is needed. (I now have
> > a board with an ADV7482 on, so when time allows I'm intending to have
> > an experiment with it).
>
> Note that we will likely, in the future, introduce media entities for
> connectors, which means that a device such as the TC358743 would have a
> sink pad connected to an HDMI connector entity.

Would that count as an improvement?
I thought the golden rule was not to break userspace, but you'd be
enforcing extra userspace steps in configuring the device if it gains
more MC entities. Not my call though.

I'm tied up with other stuff at present, but will be looking at adding
MC rather than video node based mode of operation when time allows.

  Dave

> > Use a module parameter as a last resort should the detection fail, or
> > I guess if you want to override the detected setting for some reason
> > (a simple sensor being used outside of libcamera for example).
>
> --
> Regards,
>
> Laurent Pinchart
