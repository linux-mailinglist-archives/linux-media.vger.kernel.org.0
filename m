Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98773DDFED
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2019 20:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfJTSOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 14:14:55 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39825 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfJTSOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 14:14:54 -0400
Received: by mail-io1-f65.google.com with SMTP id a1so13200020ioc.6;
        Sun, 20 Oct 2019 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgBHL3Hg6DULz07YvguvOUSAtPkJU4hcoWlGTR9Yby0=;
        b=qobTQG+fLmSlzFJYb+gVfrBa7hlja7CEwuRkpgh4xpmyaEYcJRRCKVLttf6/Pnno0o
         gTZ/iX812XL0zZIJca72KonOlO3iAjC8lZTj2B3/J0Eih5ixBjsMP7Oge1MVaROyerSY
         MDUmigHZTJ+TvnrxX96WUIO59pVVfBlFA+pTqGVOMLacuUOdYLMLoooW7XjPB6LAksR0
         KUSkef0pGQK6RqwrpV/qe03l4ueNC0idjzmzD7c1kfLPps+1F8px75dcSSW7163cSnMS
         58411p3jdWHiABb1QWocgbE3/X7EJYseOakSuB0Su5HmE5OshHPvtlOb7kQqEBKSHvQr
         0zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgBHL3Hg6DULz07YvguvOUSAtPkJU4hcoWlGTR9Yby0=;
        b=mkpp9hvhT1qXo3g6f7bl23RJNBIP6aNKKuAgBeciofUtM2K44f3A7ju/NAZBL/Xu1D
         ui4ENfXj8ZyoZQU117Df5sDJipHIq9BpUFxRhL4uwcGVYexB38fAmuVjgqvoJVTFrXBc
         aIeHr0QZ1JTe9POMngGYsJP1R6mkwHttYBv8/hOdvBRqCL6Z5jqpay0wje7y9WewrYzk
         vJ4UhjqIf00hr3KKaBGVxRF3iUBt9epLbvPme3uTn01pLGqo94ANgbd6uDvBFQzhHQNB
         AxwgEFT+KfWIn5xEHeJLr/UiZJdOg5zIvEfK6ce7M/gBXZTvviJxY+2UTC/iMwrFOGfz
         EfGg==
X-Gm-Message-State: APjAAAXKxQ/YST9rnBkaEKsmE5BomjK6POaIGU5P3W+ya6FCS/oMp8lG
        ESUlpJuxR6OdpRI4xvUTiAERb+6vORlQEvOitls=
X-Google-Smtp-Source: APXvYqxwII1TrI8wu3oH87ZzSZAXLbRAbSPLYc6g9hyiIpUJJHZFxrbJp924zPsTkswmLOZ0FA65Q+2QcHWuegmRPFs=
X-Received: by 2002:a5e:8414:: with SMTP id h20mr17611978ioj.276.1571595292733;
 Sun, 20 Oct 2019 11:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
 <20191018210020.GG4735@valkosipuli.retiisi.org.uk> <CAHCN7xJ6yphLvTo2wG4=5HHQ=t+MsBuvZBFRv4EksHYU3fnO4w@mail.gmail.com>
 <20191018211651.GH4735@valkosipuli.retiisi.org.uk> <CAHCN7xKYYStpJu91i6ReDQVxdxfZiK_jEg9AHHFiaHGvo8JC1w@mail.gmail.com>
 <20191020053532.GC4991@pendragon.ideasonboard.com> <e82419ee-1441-a1d8-4bd7-025b7999e406@xs4all.nl>
 <20191020173915.GC11723@pendragon.ideasonboard.com>
In-Reply-To: <20191020173915.GC11723@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 20 Oct 2019 13:14:41 -0500
Message-ID: <CAHCN7xJ6_U+tRpBuV=zGj4o2n3ayY6bmGDmjca1DdtuaYrutyw@mail.gmail.com>
Subject: Re: OMAP3 ISP v4l2 inconsistency on DM3730
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 20, 2019 at 12:39 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hans,
>
> On Sun, Oct 20, 2019 at 07:26:20PM +0200, Hans Verkuil wrote:
> > On 10/20/19 7:35 AM, Laurent Pinchart wrote:
> > > On Sat, Oct 19, 2019 at 11:14:03AM -0500, Adam Ford wrote:
> > >> On Fri, Oct 18, 2019 at 4:17 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >>> On Fri, Oct 18, 2019 at 04:10:23PM -0500, Adam Ford wrote:
> > >>>> On Fri, Oct 18, 2019 at 4:00 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >>>>> On Fri, Oct 18, 2019 at 02:38:57PM -0500, Adam Ford wrote:
> > >>>>>> I have a DM3730 with a parallel mt9p031 sensor attached.  I am trying
> > >>>>>> to troubleshoot some issues with streaming video with G-streamer, but
> > >>>>>> I I think the issue is in how the ISP driver reports the video info.
> > >>>>>>
> > >>>>>> I have the pipeline to grab from the resizer:
> > >>>>>>
> > >>>>>> media-ctl -v -V '"mt9p031 1-0048":0 [SGRBG8 1280x720
> > >>>>>> (664,541)/1280x720], "OMAP3 ISP CCDC":2 [SGRBG8 1280x720], "OMAP3 ISP
> > >>>>>> preview":1 [UYVY 1280x720], "OMAP3 ISP resizer":1 [UYVY 480x272]'
> > >>>>>>
> > >>>>>> This make /dev/video6 the output of the resizer and shows the format
> > >>>>>> and resolution of the output of the resizer as:
> > >>>>>>
> > >>>>>>      Setting up format UYVY8_1X16 480x272 on pad OMAP3 ISP resizer/1
> > >>>>>>      Format set: UYVY8_1X16 480x272
> > >>>>>>
> > >>>>>> I used 480x272 because it's the resolution of my LCD, and I was hoping
> > >>>>>> the resizer would be able to scale this so the ARM would not need to
> > >>>>>> do the work, and it appears to not have any issues with this
> > >>>>>> resolution.
> > >>>>>>
> > >>>>>> However, if I query the video format, I don't get UYVY:
> > >>>>>>
> > >>>>>> # v4l2-ctl  -d6 --list-formats-ext
> > >>>>>> ioctl: VIDIOC_ENUM_FMT
> > >>>>>>         Type: Video Capture
> > >>>>>>
> > >>>>>>         [0]: 'RGB3' (RGB3, emulated)
> > >>>>>>         [1]: 'BGR3' (BGR3, emulated)
> > >>>>>>         [2]: 'YU12' (YU12, emulated)
> > >>>>>>         [3]: 'YV12' (YV12, emulated)
> > >>>>>>
> > >>>>>> This becomes an issue when I attempt to stream video from my camera to
> > >>>>>> anything, include fake sink:
> > >>>>>>
> > >>>>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! fakesink
> > >>>>>> Tried to capture in RGB3, but device returned format UYVY
> > >>>>>>
> > >>>>>> So for some reason, when queried, it reports different values than
> > >>>>>> UYVY, but when attempting to set the video capture to the listed
> > >>>>>> formats, it returns an error.
> > >>>>>>
> > >>>>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! video/x-raw,
> > >>>>>> format=UYVY ! fakesink
> > >>>>>
> > >>>>> I don't have any experience on v4l2src recently but I can comment on the
> > >>>>> omap3isp driver.
> > >>>>>
> > >>>>> In general, the format the omap3isp may produce on a given video node
> > >>>>> depends on the format of data which the block associated with the video
> > >>>>> node is fed with.
> > >>>>>
> > >>>>> For instance, in case of the raw Bayer formats, the pixel order does not
> > >>>>> change, and thus the pixel order remains all the way from the sensor to the
> > >>>>> video node.
> > >>>>
> > >>>> From what I can tell, it looks like the output of the resizer is only
> > >>>> capable of two formats,
> > >>>> from ispresizer.c:
> > >>>>
> > >>>>      /* resizer pixel formats */
> > >>>>      static const unsigned int resizer_formats[] = {
> > >>>>      MEDIA_BUS_FMT_UYVY8_1X16,
> > >>>>      MEDIA_BUS_FMT_YUYV8_1X16,
> > >>>>      };
> > >>>>
> > >>>> Also:
> > >>>>
> > >>>>  * resizer_try_format - Handle try format by pad subdev method
> > >>>>  * @res   : ISP resizer device
> > >>>>  * @cfg: V4L2 subdev pad configuration
> > >>>>  * @pad   : pad num
> > >>>>  * @fmt   : pointer to v4l2 format structure
> > >>>>  * @which : wanted subdev format
> > >>>>
> > >>>> switch (pad) {
> > >>>> case RESZ_PAD_SINK:
> > >>>>      if (fmt->code != MEDIA_BUS_FMT_YUYV8_1X16 &&
> > >>>>          fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
> > >>>>               fmt->code = MEDIA_BUS_FMT_YUYV8_1X16;
> > >>>>
> > >>>> So it looks to me like if we're trying to do anything other than
> > >>>> either of those,we set it to MEDIA_BUS_FMT_YUYV8_1X16
> > >>>>
> > >>>> Am I missing something?
> > >>>
> > >>> I guess for this particular video node there's no need for V4L2 extensions
> > >>> to implement ENUM_FMT. Ideally the other nodes would support ENUM_FMT that
> > >>> could provide meaningful information as well.
> > >>
> > >> I applied a variation of the patch in question, and I was able to both
> > >> successfully use g-streamer-1.0 and I was able to see UYVY appear in
> > >> the list.  in fact, G-Streamer-1.0 was faster than FFPEG with less
> > >> lag.
> > >>
> > >> ioctl: VIDIOC_ENUM_FMT
> > >>         Type: Video Capture
> > >>
> > >>         [0]: 'UYVY' (UYVY 4:2:2)
> > >>         [1]: 'RGB3' (RGB3, emulated)
> > >>         [2]: 'BGR3' (BGR3, emulated)
> > >>         [3]: 'YU12' (YU12, emulated)
> > >>         [4]: 'YV12' (YV12, emulated)
> > >>
> > >> I don't know enough about VL2.  It looks like all the V4L stuff is in
> > >> the common isp files and not unique to the preview output, resizer
> > >> output or the CCDC output.  I don't have a CSI camera, so I cannot
> > >> test anything.
> > >>
> > >> I checked all the video outputs, and they are all showing the same
> > >> information.  I realize the patch I found won't be accepted upstream
> > >> as-is, but it would be nice to have some mechanism in place that can
> > >> determine which output node is being used and somehow return the
> > >> correct data for each node.
> > >>
> > >> I would like to do something to help improve this driver and/or make
> > >> it more compatible with some of the V4L tools (like G-Streamer), so if
> > >> someone has a recommendation on how we could move forward, I'm willing
> > >> work on it.
> > >
> > > While I'm not totally opposed to implementing VIDIOC_ENUM_FMT for the
> > > resizer video node, I'm not sure it would be the best solution to your
> > > problem. Sure, it will fix an existing issue, but we already know that
> > > it won't scale, as the other video nodes can't be supported the same
> > > way.
> > >
> > > So far, our position was mostly that userspace should grow support for
> > > MC-based devices where VIDIOC_ENUM_FMT isn't implemented. Maybe I'm
> >
> > Well, I disagree: implementing G/S/TRY_FMT without ENUM_FMT is out-of-spec.
> > The v4l2-compliance utility would flunk any driver that tries that.
> > Unfortunately, v4l2-compliance didn't exist (or was in its infancy) when
> > omap3isp was written.
>
> We've never agreed :-)

I am not trying to start a fight.  :-)

>
> > I didn't even know that ENUM_FMT wasn't implemented for the omap3 ISP.
> >
> > It makes no sense either: the driver is smart enough to validate the
> > pixelformat, but not smart enough to be able to enumerate the list of
> > valid formats for the current pipeline configuration?
>
> That's not the problem, the issue is that for MC-enabled drivers subdevs
> and video nodes are configured in isolation of each other. You thus
> can't enumerate formats on a video node *for the current pipeline
> configuration* as there's no such thing, we have no global "test"
> pipeline configuration. Enumerating formats for the active configuration
> is possible, but that will confuse userspace even more, as most
> applications enumerate formats first and then decide how to configure
> the device based on what is supported.

After the media-ctl commands issue the pipeline requests, the 2nd
command I issue defines the various formats for each stage, ccdc,
previewer, resizer, etc.  In the case I am doing, we're defining
"OMAP3 ISP resizer":1 [UYVY 480x272]'.  In my case, this is being
setup a subdev4, but the output of the OMAP3 Resizer is routed to
/dev/video6.  Is not some way to set a flag in whatever driver is
configuring /dev/video6 that it's going to be UYVY so when video6 is
queried that it returns the current state?

I realize I may be over simplifying it.

adam
>
> > I suspect that omap3isp can use some TLC, and this would be one of the
> > things that need addressing.
>
> We need to address this issue in the V4L2 spec first and decide, once
> and for all, what set of ioctls MC-based drivers need to support, and
> how they should support them. There's little point in sending patches
> for the driver until we agree on the spec.
>
> > > relaxing my standards because I'm growing older and wiser (or possibly
> > > just older and lazier :-)), but we need a better solution than this in
> > > any case. Compared to the last time I made this statement, we now have
> > > one possible solution in view in the form of libcamera ([1]). The
> > > project is still young, doesn't support the OMAP3 ISP, and isn't
> > > integrated with GStreamer, but fixing all that is on our roadmap.
> > >
> > > What I would like to know is whether libcamera would fit your use cases,
> > > or if you have needs that would require a different solution.
> > >
> > > [1] https://www.libcamera.org/
> > >
> > >>>>> This also means that there is no way to provide an enumeration of supported
> > >>>>> formats without knowing the media bus format. There have been proposals to
> > >>>>> support ENUM_FMT in such cases by providing the source media bus format,
> > >>>>> but those proposals haven't materialised into patches.
> > >>>>>
> > >>>>> So for now, the format needs to be simply set using S_FMT.
> > >>>>>
> > >>>>>>
> > >>>>>> Setting pipeline to PAUSED ...
> > >>>>>> Pipeline is live and does not need PREROLL ...
> > >>>>>> Setting pipeline to PLAYING ...
> > >>>>>> New clock: GstSystemClock
> > >>>>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > >>>>>> Internal data stream error.
> > >>>>>> Additional debug info:
> > >>>>>> gstbasesrc.c(3055): gst_base_src_loop ():
> > >>>>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > >>>>>> streaming stopped, reason not-negotiated (-4)
> > >>>>>>
> > >>>>>> This leads me to believe that v4l2 is trying to set the format to
> > >>>>>> something it does not think it is able to negotiate, and it's being
> > >>>>>> rejected.
> > >>>>>>
> > >>>>>> I can even explicitly set the output video format to UYVY with:
> > >>>>>>
> > >>>>>> v4l2-ctl -d /dev/video6
> > >>>>>> --set-fmt-video=width=480,height=272,pixelformat=UYVY --verbose
> > >>>>>>
> > >>>>>> VIDIOC_QUERYCAP: ok
> > >>>>>> VIDIOC_G_FMT: ok
> > >>>>>> VIDIOC_S_FMT: ok
> > >>>>>> Format Video Capture:
> > >>>>>>         Width/Height      : 480/272
> > >>>>>>         Pixel Format      : 'UYVY'
> > >>>>>>         Field             : None
> > >>>>>>         Bytes per Line    : 960
> > >>>>>>         Size Image        : 261120
> > >>>>>>         Colorspace        : JPEG
> > >>>>>>         Transfer Function : Default (maps to sRGB)
> > >>>>>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > >>>>>>         Quantization      : Default (maps to Full Range)
> > >>>>>>         Flags             :
> > >>>>>> #
> > >>>>>>
> > >>>>>> This shows me the UYVY format, but upon a follow-up query, it does not
> > >>>>>> appear to retain the pixel format of UYVY.
> > >>>>>>
> > >>>>>> v4l2-ctl -d /dev/video6 --list-formats-ext
> > >>>>>> ioctl: VIDIOC_ENUM_FMT
> > >>>>>>         Type: Video Capture
> > >>>>>>
> > >>>>>>         [0]: 'RGB3' (RGB3, emulated)
> > >>>>>>         [1]: 'BGR3' (BGR3, emulated)
> > >>>>>>         [2]: 'YU12' (YU12, emulated)
> > >>>>>>         [3]: 'YV12' (YV12, emulated)
> > >>>>>> #
> > >>>>>>
> > >>>>>> If I use ffmpeg to stream video, I the video codec there recognizes it
> > >>>>>> as uyvy and I can convert it to RGB to display on my LCD, but it has
> > >>>>>> limited framerate, and it seems to me like this should be do-able in
> > >>>>>> G-Streamer with v4l2src.
> > >>>>>>
> > >>>>>> # ffmpeg -an -re -i /dev/video6 -f v4l2 -vcodec rawvideo -pix_fmt bgra
> > >>>>>> -f fbdev /dev/fb0
> > >>>>>>
> > >>>>>> Input #0, video4linux2,v4l2, from '/dev/video6':
> > >>>>>>   Duration: N/A, start: 908.826490, bitrate: N/A
> > >>>>>>     Stream #0:0: Video: rawvideo (UYVY / 0x59565955), uyvy422,
> > >>>>>> 480x272, 17.42 tbr, 1000k tbn, 1000k tbc
> > >>>>>> Stream mapping:
> > >>>>>>   Stream #0:0 -> #0:0 (rawvideo (native) -> rawvideo (native))
> > >>>>>> Press [q] to stop, [?] for help
> > >>>>>> Output #0, fbdev, to '/dev/fb0':
> > >>>>>>   Metadata:
> > >>>>>>     encoder         : Lavf57.83.100
> > >>>>>>     Stream #0:0: Video: rawvideo (BGRA / 0x41524742), bgra, 480x272,
> > >>>>>> q=2-31, 72765 kb/s, 17.42 fps, 17.42 tbn, 17.42 tbc
> > >>>>>>     Metadata:
> > >>>>>>       encoder         : Lavc57.107.100 rawvideo
> > >>>>>>
> > >>>>>>
> > >>>>>> This shows me the information is available in some ways from v4l2, but
> > >>>>>> I wonder if there is a missing IOCTL for VIDIOC_ENUM_FMT for the isp
> > >>>>>> driver somewhere.  Shouldn't VIDIOC_ENUM_FMT  return UYVY?
> > >>>>>>
> > >>>>>> I noticed vpbe_display.c has a function that appears to correspond to
> > >>>>>> this.  There is a patch at [1] for an older kernel.  Is this something
> > >>>>>> worth pursuing?
> > >>>>>>
> > >>>>>> [1] - https://stackoverflow.com/questions/20693155/gstreamer-failed-to-enumerate-video-formats-and-inappropriate-ioctl-for-device
>
> --
> Regards,
>
> Laurent Pinchart
