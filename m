Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3DA271EFF
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 11:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgIUJhI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 05:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUJhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 05:37:05 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDB4C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 02:37:00 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w1so12135104edr.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lylPpVE/OJThn8Y+rLFsEiipKXUI5RqcUgh3h88X8KA=;
        b=GrWqVeohXijayLrMdVQI1Nk0EE+/uLik1yuQwYvE31xAMWlVuQOJmgDnc4M2FODtVx
         m55QRzCh8/NFLy6hvMJpXaOzuCZb8rGTMzLFOnKvwKLTqh3PN+0WPdZjoS3dAnykH4z9
         AKcS5rPqf/PCr2s2ih7Cv+Rc8K4R9y1fhBiF0uYP0u2DvdvdzOG4tfn14t5DBFocS6h0
         0X4cHvD63nbl1H79J/mt2PoF0GY/kCTgNiZhastdMKOXCZRq9KOeKr44EAVOwXMOMx5M
         oPB8kvHkRnyDXMKDXTk/uP4PyiDbYAl9XEHAYZ9qllyByKulym5wvZVFR0S3UGb0ecUy
         UW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lylPpVE/OJThn8Y+rLFsEiipKXUI5RqcUgh3h88X8KA=;
        b=sheYB1MppKVUIYHhZ76ntoEUUtTAne+Jvosu4g6VWw/fOunMYmHtK/ATggRCZSIJnl
         nqEGZ4rI6M/qHbJGFMjbPJmAX9YKou4+kam7MynsXWFSP0gu2pXgeJxbbte8LKfqCY6f
         jLQx329O1QgndM3HRejzyb7dVjB6jG3PCJDMm7yWZYktfw+O11IQ3OtoCzNUw0OkkTrT
         pqgpaVmq0CZPX78o5LMGnHkQCYBQbBMPVsidH0nGeRuGoudLyj58uQx7dH/isJwjd4Kt
         FH+vIQ1IDCRJxFR15slgTRsNdDreR+d7LrXL4fciFX1r2Jq5XvJxHAXAyby1r2GL7Kds
         LYmQ==
X-Gm-Message-State: AOAM530hzSNN/mJlLAU//mp8EGore7jLaH3fwfwgoJPE2E7MzAOnkPHa
        FDNMogoro1L8DiiIjxklkyekWxUB5ZPcp8t+1/y6jQ==
X-Google-Smtp-Source: ABdhPJxvdAH2kZVH6rXrU43CvmIGk+J0s6lfZ4c9fgrw7VD6T5Q4h7+rQLjRX20znchkiNXde3QUzx4B+Xre86DvnnU=
X-Received: by 2002:a50:fd83:: with SMTP id o3mr50353677edt.176.1600681019430;
 Mon, 21 Sep 2020 02:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200821220038.16420-1-amurray@thegoodpenguin.co.uk>
 <20200823223339.GI6002@pendragon.ideasonboard.com> <CALqELGy_mwGQDn=bumogLf4H7ZVS4F+axpEyGSwEL4dYYWDKvA@mail.gmail.com>
In-Reply-To: <CALqELGy_mwGQDn=bumogLf4H7ZVS4F+axpEyGSwEL4dYYWDKvA@mail.gmail.com>
From:   Andrew Murray <amurray@thegoodpenguin.co.uk>
Date:   Mon, 21 Sep 2020 10:36:48 +0100
Message-ID: <CALqELGwFi+36kx6vEtbqchovaZ8222kJZpt_5sRgA-arq_VZGw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add bandwidth_cap module param
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 24 Aug 2020 at 10:13, Andrew Murray
<amurray@thegoodpenguin.co.uk> wrote:
>
> Hi Laurent,
>
> On Sun, 23 Aug 2020 at 23:34, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Andrew,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 21, 2020 at 11:00:38PM +0100, Andrew Murray wrote:
> > > Many UVC devices report larger values for dwMaxPayloadTransferSize than
> > > appear to be required. This results in less bandwidth available for
> > > other devices.
> > >
> > > This problem is commonly observed when attempting to stream from multiple
> > > UVC cameras with the host controller returning -ENOSPC and sometimes a
> > > warning (XHCI controllers: "Not enough bandwidth for new device state.").
> > >
> > > For uncompressed video, the UVC_QUIRK_FIX_BANDWIDTH works around this issue
> > > by overriding the device provided dwMaxPayloadTransferSize with a
> > > calculation of the actual bandwidth requirements from the requested frame
> > > size and rate. However for compressed video formats it's not practical to
> > > estimate the bandwidth required as the kernel doesn't have enough
> > > information.
> > >
> > > Let's provide a pragmatic solution by allowing the user to impose an upper
> > > threshold to the amount of bandwidth each UVC device can reserve. If the
> > > parameter isn't used then no threshold is imposed.
> >
> > Hmmmm... This is a bit annoying as it will apply equally to all formats
> > and all cameras. It may solve a real issue, but it's quite a bit of a
> > hack.
>
> Yes you're right. There is certainly a real issue here though, if you google
> 'usb web cam no space left on device' or similar, you'll find plenty
> of people having
> issues. Many of those which could be resolved with a patch like this.
> Part of the
> motivation for sharing this patch was so that those people may come across this
> patch rather than hack their own or give up - though I'd prefer to
> make this less of a
> hack.
>
> I could respin this to only apply for UVC_FMT_FLAG_COMPRESSED formats, as
> if there is a problem with compressed video then a better solution is to use the
> existing UVC_QUIRK_FIX_BANDWIDTH.
>
> I didn't add this as a quirk that is only applied to specific
> idVendor/idProducts, as I
> felt the list might get large, and in any case my assumption is that
> most of the people
> that suffer from this issue will likely have a specific camera setup
> and a bandwidth cap
> wouldn't cause any issues - for example if you have 4 cameras on a
> EHCI (perhaps with
> one camera with a bandwidth issue) platform - then you could cap all
> cameras high at
> 90Mbps - that would resolve the camera with the bandwidth issue but
> not likely affect the
> other cameras.  (Many cameras that I've played with seem to request 195 Mbps).
>
> > I'm also concerned that users will be confused regarding how to
> > use this parameter properly, as there's no documentation that explains
> > its usage, and how to pick a proper value. Is there any way we could do
> > better ?
>
> I'm happy to write some, though I couldn't find any (in-tree) for the
> existing parameters
> (uvc_no_drop_param, uvc_trace_param, etc) so I wasn't sure the best
> place for this.
> Any suggestions?
>
> Just as per the UVC_QUIRK_FIX_BANDWIDTH quirk, this works by adjusting
> dwMaxPayloadTransferSize, which results in the kernel selecting a different USB
> alternate configuration from those made available by the device. It selects a
> configuration that matches or provides more bandwidth than that
> requested. I'm not
> sure what happens if you stream at a high resolution but select an
> alternate configuration
> that has a (too) low bandwidth, perhaps it depends on the camera. It
> also requires
> knowledge of the camera to determine how much bandwidth it genuinely
> needs. Without
> such knowledge - the best approach is to come up with a reasonable
> estimate of bandwidth
> based on compression codec, framesize, rate, etc, look at the
> available alternate configs
> (e.g. from lsusb), and then set a value of bandwidth_cap larger than
> that required. And then
> of course test to see if it meets your needs.

Hello,

Is there any feedback on this?

Thanks,

Andrew Murray

>
> Thanks,
>
> Andrew Murray
>
> >
> > > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 3 +++
> > >  drivers/media/usb/uvc/uvc_video.c  | 8 ++++++++
> > >  drivers/media/usb/uvc/uvcvideo.h   | 1 +
> > >  3 files changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 431d86e1c94b..d5ecac7fc264 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -33,6 +33,7 @@ unsigned int uvc_no_drop_param;
> > >  static unsigned int uvc_quirks_param = -1;
> > >  unsigned int uvc_trace_param;
> > >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> > > +unsigned int uvc_bandwidth_cap_param;
> > >
> > >  /* ------------------------------------------------------------------------
> > >   * Video formats
> > > @@ -2389,6 +2390,8 @@ module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
> > >  MODULE_PARM_DESC(trace, "Trace level bitmask");
> > >  module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
> > >  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> > > +module_param_named(bandwidth_cap, uvc_bandwidth_cap_param, uint, S_IRUGO|S_IWUSR);
> > > +MODULE_PARM_DESC(bandwidth_cap, "Maximum bandwidth per device");
> > >
> > >  /* ------------------------------------------------------------------------
> > >   * Driver initialization and cleanup
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index a65d5353a441..74a0dc0614cf 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -196,6 +196,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > >
> > >               ctrl->dwMaxPayloadTransferSize = bandwidth;
> > >       }
> > > +
> > > +     if (uvc_bandwidth_cap_param &&
> > > +         ctrl->dwMaxPayloadTransferSize > uvc_bandwidth_cap_param) {
> > > +             uvc_trace(UVC_TRACE_VIDEO,
> > > +                     "Bandwidth capped from %u to %u B/frame.\n",
> > > +                     ctrl->dwMaxPayloadTransferSize, uvc_bandwidth_cap_param);
> > > +             ctrl->dwMaxPayloadTransferSize = uvc_bandwidth_cap_param;
> > > +     }
> > >  }
> > >
> > >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 6ab972c643e3..c7d9220c9a7a 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -718,6 +718,7 @@ extern unsigned int uvc_no_drop_param;
> > >  extern unsigned int uvc_trace_param;
> > >  extern unsigned int uvc_timeout_param;
> > >  extern unsigned int uvc_hw_timestamps_param;
> > > +extern unsigned int uvc_bandwidth_cap_param;
> > >
> > >  #define uvc_trace(flag, msg...) \
> > >       do { \
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
