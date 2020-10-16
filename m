Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D312902F2
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395431AbgJPKke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395429AbgJPKka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:40:30 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EE5C0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:40:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l16so1803853eds.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rihM4hHYK0piQ9XxG2Pab4pfabbspiBy5V27intYOt4=;
        b=QryGfC+iFaUBVyL5duX1wRwAjtJJnwdo57WYE1kfQxlG5lsvBrICPRVzOv22M3fM0y
         pdJfMDVFEtlWMoxjKBPynobocyHBEGbQ88+HMkeXmig8xLN88BIzIMKkj/N2UjgCq0FD
         MfhSoH6QWStkJZP0AQn7LUsPSpJp08AIiY/PJu4souTFHwEM+ELmDWDsp5ZCAeNq1aI0
         /oxUtD4u6IzUf2KZ/WwquVuHhi6vwzemuM0Awt5lQZ1HrwvCChb6pjoibBq96R3HATTP
         Pgeuu+9VBQhZZoPByWTvlBlO6Oe4X5DmnMixWHrALFLlWq5vEDmPfcJZ3HAh4cbwWJvY
         fQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rihM4hHYK0piQ9XxG2Pab4pfabbspiBy5V27intYOt4=;
        b=i9ANDPQ8IY1UXvuJMqm3KKUyBQxtKq2E/p+LpVqp0r7wq9ro7jN+ANKoK5wKzvzCSj
         ll2aP3yzA5NM4ap2fdDztK+vCXedeYWDh8Is+Cz9cMvq3a6vPz2FVXAttQrwsoKTM2yi
         X5kQKchxdDKLHZ/j86aIo9ud+jVXjI905XaYK5IB9vp85n8zU3qJFfvTpvOc2Pef0Rrl
         blj2SwWhUrBrsiGQhPZynC3lhrXjZGf/ZSd+6bt85TfqFoY8RWZDplUwmbHJybWWamHu
         Dja8v9vwa9bBxO9qJFcew9VQf1muBVNFlISeAJKvAal5VrsHc9vsLdKjVDGaFFKlVR8i
         qn5g==
X-Gm-Message-State: AOAM53356hV0SsVofg60Tqz4wdwicwUPkcHKU4N8z5oCWamx3LRHmGll
        rmi48Trx2iIggj6CUz/eSXHucVEHt/GMIqfihB+N1zI+u1xta7OG9XM=
X-Google-Smtp-Source: ABdhPJwyxT5BvzrjwcLs3LGZRiWsgfdZDOBeWSBEJPsw05f3W12zr662PW1k1vHorQyAz9JqCQ9h56gVZMDhx8zGGd8=
X-Received: by 2002:a05:6402:754:: with SMTP id p20mr3097432edy.109.1602844828555;
 Fri, 16 Oct 2020 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200821220038.16420-1-amurray@thegoodpenguin.co.uk>
 <20200823223339.GI6002@pendragon.ideasonboard.com> <CALqELGy_mwGQDn=bumogLf4H7ZVS4F+axpEyGSwEL4dYYWDKvA@mail.gmail.com>
 <d181ade9-32e2-edd9-00bf-e72f4ad0f081@ideasonboard.com>
In-Reply-To: <d181ade9-32e2-edd9-00bf-e72f4ad0f081@ideasonboard.com>
From:   Andrew Murray <amurray@thegoodpenguin.co.uk>
Date:   Fri, 16 Oct 2020 11:40:17 +0100
Message-ID: <CALqELGxmwhvFF-4=VR9L4=1Bqoy9JLmErcuOOw8zBQc9UVmTbg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add bandwidth_cap module param
To:     kieran.bingham+renesas@ideasonboard.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for the feedback...

On Fri, 16 Oct 2020 at 09:37, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> >>
> >> On Fri, Aug 21, 2020 at 11:00:38PM +0100, Andrew Murray wrote:
> >>> Many UVC devices report larger values for dwMaxPayloadTransferSize than
> >>> appear to be required. This results in less bandwidth available for
> >>> other devices.
> >>>
> >>> This problem is commonly observed when attempting to stream from multiple
> >>> UVC cameras with the host controller returning -ENOSPC and sometimes a
> >>> warning (XHCI controllers: "Not enough bandwidth for new device state.").
>
> So perhaps is this something we can detect at runtime?

I don't think so. We can't detect that a camera is requesting more
bandwidth that it really
needs (except perhaps for specific cameras that are known to be bad).
When we get this
error message, it may not be any fault of the most recently plugged in
camera - it may be
an earlier plugged in camera that erroneously used up most, but not
all of the bandwidth.


>
> >>> For uncompressed video, the UVC_QUIRK_FIX_BANDWIDTH works around this issue
> >>> by overriding the device provided dwMaxPayloadTransferSize with a
> >>> calculation of the actual bandwidth requirements from the requested frame
> >>> size and rate. However for compressed video formats it's not practical to
> >>> estimate the bandwidth required as the kernel doesn't have enough
> >>> information.
>
> Is it something that can be retried with lower and lower values until it
> works when the issue is detected? Or is that difficult because it will
> require interacting/negotiating with other devices on the same bus?

As the kernel has no way of knowing if a device is requesting more
bandwidth than it needs
 - you don't know which device is causing problems. Thus you only know
you have a problem
when you run out of bandwidth, in which case that may be because you
have used too many
devices - or it may be because one or more of them have requested more
bandwidth than
needed. At this point you wouldn't want to reconfigure existing
devices, and reducing the
bandwidth requirement of the new device may be incorrect - given it's
not the device at fault.


> >>> Let's provide a pragmatic solution by allowing the user to impose an upper
> >>> threshold to the amount of bandwidth each UVC device can reserve. If the
> >>> parameter isn't used then no threshold is imposed.
> >>
> >> Hmmmm... This is a bit annoying as it will apply equally to all formats
> >> and all cameras. It may solve a real issue, but it's quite a bit of a
> >> hack.
> >
> > Yes you're right. There is certainly a real issue here though, if you google
> > 'usb web cam no space left on device' or similar, you'll find plenty
> > of people having
> > issues. Many of those which could be resolved with a patch like this.
> > Part of the
> > motivation for sharing this patch was so that those people may come across this
> > patch rather than hack their own or give up - though I'd prefer to
> > make this less of a
> > hack.
> >
> > I could respin this to only apply for UVC_FMT_FLAG_COMPRESSED formats, as
>
> One worry I would have is that if the kernel can't decide an appropriate
> value, can we expect users to ?
>
> (And as soon as we can expect users to, can we emulate that decision
> process in the kernel?)


There isn't a perfect solution here. So it's trial and error (!!) from
the user, or the
status quo - where the user can't use multiple cameras at once.

Besides are there any other use-cases where capping the bandwidth per device is
beneficial?

>
>
> > if there is a problem with compressed video then a better solution is to use the
> > existing UVC_QUIRK_FIX_BANDWIDTH.
> >
> > I didn't add this as a quirk that is only applied to specific
> > idVendor/idProducts, as I
> > felt the list might get large, and in any case my assumption is that
> > most of the people
> > that suffer from this issue will likely have a specific camera setup
> > and a bandwidth cap
> > wouldn't cause any issues - for example if you have 4 cameras on a
> > EHCI (perhaps with
> > one camera with a bandwidth issue) platform - then you could cap all
> > cameras high at
> > 90Mbps - that would resolve the camera with the bandwidth issue but
> > not likely affect the
> > other cameras.  (Many cameras that I've played with seem to request 195 Mbps).
> >
> >> I'm also concerned that users will be confused regarding how to
> >> use this parameter properly, as there's no documentation that explains
> >> its usage, and how to pick a proper value. Is there any way we could do
> >> better ?
> >
> > I'm happy to write some, though I couldn't find any (in-tree) for the
> > existing parameters
> > (uvc_no_drop_param, uvc_trace_param, etc) so I wasn't sure the best
> > place for this.
> > Any suggestions?
>
> It should probably go somewhere that ends up in the linux-media kernel
> documentation.
>
> > Just as per the UVC_QUIRK_FIX_BANDWIDTH quirk, this works by adjusting
> > dwMaxPayloadTransferSize, which results in the kernel selecting a different USB
> > alternate configuration from those made available by the device. It selects a
> > configuration that matches or provides more bandwidth than that
> > requested. I'm not
> > sure what happens if you stream at a high resolution but select an
> > alternate configuration
> > that has a (too) low bandwidth, perhaps it depends on the camera. It
> > also requires
> > knowledge of the camera to determine how much bandwidth it genuinely
> > needs. Without
> > such knowledge - the best approach is to come up with a reasonable
> > estimate of bandwidth
> > based on compression codec, framesize, rate, etc, look at the
> > available alternate configs
> > (e.g. from lsusb), and then set a value of bandwidth_cap larger than
> > that required. And then
> > of course test to see if it meets your needs.
>
> This sounds quite complex to be able to use a webcam (or two)...

What is the alternative?

Andrew Murray

>
> Ayeee....
>
> Kieran
>
>
> >
> > Thanks,
> >
> > Andrew Murray
> >
> >>
> >>> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_driver.c | 3 +++
> >>>  drivers/media/usb/uvc/uvc_video.c  | 8 ++++++++
> >>>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
> >>>  3 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>> index 431d86e1c94b..d5ecac7fc264 100644
> >>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>> @@ -33,6 +33,7 @@ unsigned int uvc_no_drop_param;
> >>>  static unsigned int uvc_quirks_param = -1;
> >>>  unsigned int uvc_trace_param;
> >>>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> >>> +unsigned int uvc_bandwidth_cap_param;
> >>>
> >>>  /* ------------------------------------------------------------------------
> >>>   * Video formats
> >>> @@ -2389,6 +2390,8 @@ module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
> >>>  MODULE_PARM_DESC(trace, "Trace level bitmask");
> >>>  module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
> >>>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> >>> +module_param_named(bandwidth_cap, uvc_bandwidth_cap_param, uint, S_IRUGO|S_IWUSR);
> >>> +MODULE_PARM_DESC(bandwidth_cap, "Maximum bandwidth per device");
> >>>
> >>>  /* ------------------------------------------------------------------------
> >>>   * Driver initialization and cleanup
> >>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>> index a65d5353a441..74a0dc0614cf 100644
> >>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>> @@ -196,6 +196,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >>>
> >>>               ctrl->dwMaxPayloadTransferSize = bandwidth;
> >>>       }
> >>> +
> >>> +     if (uvc_bandwidth_cap_param &&
> >>> +         ctrl->dwMaxPayloadTransferSize > uvc_bandwidth_cap_param) {
> >>> +             uvc_trace(UVC_TRACE_VIDEO,
> >>> +                     "Bandwidth capped from %u to %u B/frame.\n",
> >>> +                     ctrl->dwMaxPayloadTransferSize, uvc_bandwidth_cap_param);
> >>> +             ctrl->dwMaxPayloadTransferSize = uvc_bandwidth_cap_param;
> >>> +     }
> >>>  }
> >>>
> >>>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>> index 6ab972c643e3..c7d9220c9a7a 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -718,6 +718,7 @@ extern unsigned int uvc_no_drop_param;
> >>>  extern unsigned int uvc_trace_param;
> >>>  extern unsigned int uvc_timeout_param;
> >>>  extern unsigned int uvc_hw_timestamps_param;
> >>> +extern unsigned int uvc_bandwidth_cap_param;
> >>>
> >>>  #define uvc_trace(flag, msg...) \
> >>>       do { \
> >>
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
>
