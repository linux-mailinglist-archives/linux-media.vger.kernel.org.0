Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A3E65D135
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjADLKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjADLKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:10:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0026D1583E
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:10:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D101E6C7;
        Wed,  4 Jan 2023 12:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672830644;
        bh=fzQTCAdtyw+O7QPLtwjK2hJrzh3h7bvnfKjbfOqMkI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y3O67mreq5MMlAo2FoiVG7XrYX2QDrLHf7Owiaw7TdoWOA9RtqTDEBGKKjy+n1euD
         9IbT+3pxqhzQ7L/RjMNwsQLLnDuBPnad+/vkrP2/NT4xgeiBfivldg70UZftVqypaF
         tS+1ObfccBqxAEUUGd8KIvT0JI+54pnz1fLH0etQ=
Date:   Wed, 4 Jan 2023 13:10:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH v1] media: uvcvideo: Remove format descriptions
Message-ID: <Y7Ver63AXghcFlop@pendragon.ideasonboard.com>
References: <20221228014200.20462-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCspM4GpF9xrizBMBRTMQKkK+yqGoDYgu=s0f+g3j4qm-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCspM4GpF9xrizBMBRTMQKkK+yqGoDYgu=s0f+g3j4qm-g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Jan 04, 2023 at 11:37:33AM +0100, Ricardo Ribalda wrote:
> On Wed, 28 Dec 2022 at 02:42, Laurent Pinchart wrote:
> >
> > The V4L2 core fills format description on its own in v4l_fill_fmtdesc(),
>
> Maybe make more explicit the rewrite, always fills

Sure.

> > there's no need to manually set the descriptions in the driver. This
> > prepares for removal of the format descriptions from the uvc_fmts table.
>
> With or without the nits:
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >
> > Michael, I'd like to merge this before the "[PATCH v2 5/5] usb: uvc: use
> > v4l2_fill_fmtdesc instead of open coded format name" patch you have
> > submitted, if that's OK with you. It removes the need to call
> > v4l2_fill_fmtdesc() in that patch, which will also allow dropping
> > "[PATCH v2 4/5] media: v4l2: move v4l_fill_fmtdesc to common
> > v4l2_fill_fmtdesc function" in that series. I think we can schedule all
> > of that for v6.3.
> >
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++--------------
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 --
> >  3 files changed, 13 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 8132a5c3bc33..6de3d55daf36 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -227,6 +227,7 @@ static int uvc_parse_format(struct uvc_device *dev,
> >         struct uvc_format_desc *fmtdesc;
> >         struct uvc_frame *frame;
> >         const unsigned char *start = buffer;
> > +       char fmtname[12] = { 0, };
>
> What about
> char fmtname[] = "\0SDL-DV 60Hz"; /* Longest possible string. */

I'm a bit tempted, but I think it will just increase the kernel size a
little bit for no real gain. We will still need to keep this in sync
manually with any change we may make below in the future.

> >         unsigned int width_multiplier = 1;
> >         unsigned int interval;
> >         unsigned int i, n;
> > @@ -251,14 +252,10 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                 fmtdesc = uvc_format_by_guid(&buffer[5]);
> >
> >                 if (fmtdesc != NULL) {
> > -                       strscpy(format->name, fmtdesc->name,
> > -                               sizeof(format->name));
> >                         format->fcc = fmtdesc->fcc;
> >                 } else {
> >                         dev_info(&streaming->intf->dev,
> > -                                "Unknown video format %pUl\n", &buffer[5]);
> > -                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> > -                               &buffer[5]);
> > +                                "Unknown video format %p4cc\n", &buffer[5]);
> >                         format->fcc = 0;
> >                 }
> >
> > @@ -270,8 +267,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                  */
> >                 if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
> >                         if (format->fcc == V4L2_PIX_FMT_YUYV) {
> > -                               strscpy(format->name, "Greyscale 8-bit (Y8  )",
> > -                                       sizeof(format->name));
> >                                 format->fcc = V4L2_PIX_FMT_GREY;
> >                                 format->bpp = 8;
> >                                 width_multiplier = 2;
> > @@ -312,7 +307,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                         return -EINVAL;
> >                 }
> >
> > -               strscpy(format->name, "MJPEG", sizeof(format->name));
> >                 format->fcc = V4L2_PIX_FMT_MJPEG;
> >                 format->flags = UVC_FMT_FLAG_COMPRESSED;
> >                 format->bpp = 0;
> > @@ -330,13 +324,13 @@ static int uvc_parse_format(struct uvc_device *dev,
> >
> >                 switch (buffer[8] & 0x7f) {
> >                 case 0:
> > -                       strscpy(format->name, "SD-DV", sizeof(format->name));
> > +                       strscpy(fmtname, "SD-DV", sizeof(fmtname));
> >                         break;
> >                 case 1:
> > -                       strscpy(format->name, "SDL-DV", sizeof(format->name));
> > +                       strscpy(fmtname, "SDL-DV", sizeof(fmtname));
> >                         break;
> >                 case 2:
> > -                       strscpy(format->name, "HD-DV", sizeof(format->name));
> > +                       strscpy(fmtname, "HD-DV", sizeof(fmtname));
> >                         break;
> >                 default:
> >                         uvc_dbg(dev, DESCR,
> > @@ -346,8 +340,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                         return -EINVAL;
> >                 }
> >
> > -               strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> > -                       sizeof(format->name));
> > +               strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> > +                       sizeof(fmtname));
> >
> >                 format->fcc = V4L2_PIX_FMT_DV;
> >                 format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
> > @@ -375,7 +369,12 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                 return -EINVAL;
> >         }
> >
> > -       uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
> 
> What about simply:
> 
> uvc_dbg(dev, DESCR, "Found format %p4cc %s\n", &format->fcc, fmtname);
> 
> Even when format->fcc is zero, specially in uvc_dbg is nice to have that info.

Note that, when format->fcc is zero, there's already a louder

			dev_info(&streaming->intf->dev,
				 "Unknown video format %p4cc\n", &buffer[5]);

above, and fmtname will not be set. Your proposal would then print
"Found format .... (0x00000000) \n" which I don't think would add much
value.

Another option would be to simply drop the format name for DV formats.
It adds little value, and would simplify the code. I think I'll do so in
v2.

This also makes me realize I shouldn't have changed the dev_info() to
%p4cc. I'll fix that in a v2.

> > +       if (format->fcc) {
> > +               if (fmtname[0])
> > +                       uvc_dbg(dev, DESCR, "Found format %s\n", fmtname);
> > +               else
> > +                       uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
> > +       }
> >
> >         buflen -= buffer[0];
> >         buffer += buffer[0];
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4d4c33b6dfb..dcd178d249b6 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -660,8 +660,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >         fmt->flags = 0;
> >         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> > -       strscpy(fmt->description, format->name, sizeof(fmt->description));
> > -       fmt->description[sizeof(fmt->description) - 1] = 0;
> >         fmt->pixelformat = format->fcc;
> >         return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 84326991ec36..cd5861cae3b0 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -262,8 +262,6 @@ struct uvc_format {
> >         u32 fcc;
> >         u32 flags;
> >
> > -       char name[32];
> > -
> >         unsigned int nframes;
> >         struct uvc_frame *frame;
> >  };

-- 
Regards,

Laurent Pinchart
