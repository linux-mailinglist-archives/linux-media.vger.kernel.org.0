Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7607B66C2CE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjAPOyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbjAPOxY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:53:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6E122793
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:40:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D44F802;
        Mon, 16 Jan 2023 15:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880041;
        bh=JGTapkST4k4uhlPTL0xDXPbGqucj9spbxBmmuhCjLFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBu9psN7K+zm5aXyPxizx34MlLnBg8OAVPHjEHYnD6lhR01/iXqXtUAcW8VGgRKhw
         LpwjGooo3H4ggcsTFUycSes0iqBnZB1+zJxhPlvUQLUoN0j48uyZi3B9W0Q2Qqu9Qh
         yIne+75Q44vjEgSduuoSvHNMi1TBE/HvjcmJFI9M=
Date:   Mon, 16 Jan 2023 16:40:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, Ai Chao <aichao@kylinos.cn>,
        Jackie Liu <liuyun01@kylinos.cn>
Subject: Re: [PATCH v5] media: uvcvideo: Fix bandwidth error for Alcor camera
Message-ID: <Y8Vh6Xhbrb6pcxNf@pendragon.ideasonboard.com>
References: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCtWkRd_oya97Qd9wHMM+ZC=2pVQz2a1NCLYximTDrwNkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtWkRd_oya97Qd9wHMM+ZC=2pVQz2a1NCLYximTDrwNkQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Jan 16, 2023 at 03:14:39PM +0100, Ricardo Ribalda wrote:
> On Sun, 15 Jan 2023 at 22:17, Laurent Pinchart wrote:
> >
> > From: Ai Chao <aichao@kylinos.cn>
> >
> > The Alcor Corp. Slave camera (1b17:6684 and 2017:0011) returns a wrong
> > dwMaxPayloadTransferSize value for compressed formats. Valid values are
> > typically up to 3072 bytes per interval (for high-speed, high-bandwidth
> > devices), and those faulty devices request 2752512 bytes per interval.
> > This is a firmware issue, but the manufacturer cannot provide a fixed
> > firmware.
> >
> > Fix this by checking the dwMaxPayloadTransferSize field, and hardcoding
> > a value of 1024 if it exceeds 3072 for compressed formats transferred
> > over isochronous endpoints. While at it, document the other quirk that
> > handles a bandwidth issue for uncompressed formats.
> >
> > Signed-off-by: Ai Chao <aichao@kylinos.cn>
> > ---
> > I have dropped the Reviewed-by tags as the patch has changed
> > significantly.
> >
> > Ricardo, do you know if the 3072 bytes limit is fine with super-speed
> > devices, or does it need to be increased ?
> 
> We have enough documentation to let ChatGPT make the code for us :)

It will still need some improvements :-)

> I am going to try tonight on two superspeed cameras. Will let you know tomorow.
> 
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index d4b023d4de7c..c6351d3b24cf 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -200,6 +200,20 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
> >                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
> >
> > +       /*
> > +        * Many devices report an incorrect dwMaxPayloadTransferSize value. The
> > +        * most common issue is devices requesting the maximum possible USB
> > +        * bandwidth (3072 bytes per interval for high-speed, high-bandwidth
> > +        * isochronous endpoints) while they actually require less, preventing
> > +        * multiple cameras from being used at the same time due to bandwidth
> > +        * overallocation.
> > +        *
> > +        * For those devices, replace the dwMaxPayloadTransferSize value based
> > +        * on an estimation calculated from the frame format and size. This is
> > +        * only possible for uncompressed formats, as not enough information is
> > +        * available to reliably estimate the bandwidth requirements for
> > +        * compressed formats.
> > +        */
> >         if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> >             stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> >             stream->intf->num_altsetting > 1) {
> > @@ -236,6 +250,23 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >
> >                 ctrl->dwMaxPayloadTransferSize = bandwidth;
> >         }
> > +
> > +       /*
> > +        * Another issue is with devices that report a transfer size that
> > +        * greatly exceeds the maximum supported by any existing USB version
> > +        * for isochronous transfers.  For instance, the "Slave camera" devices
> > +        * from Alcor Corp. (2017:0011 and 1b17:66B8) request 2752512 bytes per
> > +        * interval.
> > +        *
> > +        * For uncompressed formats, this can be addressed by the FIX_BANDWIDTH
> > +        * quirk, but for compressed format we can't meaningfully estimate the
> > +        * required bandwidth. Just hardcode it to 1024 bytes per interval,
> > +        * which should be large enough for compressed formats.
> > +        */
> > +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> > +           ctrl->dwMaxPayloadTransferSize > 3072 &&
> > +           stream->intf->num_altsetting > 1)
> > +               ctrl->dwMaxPayloadTransferSize = 1024;
> 
> - Maybe we should add a debug message if we are doing this?

I can do that.

> - Also I do not like that the value that we use as trigger (3072) is
> different than the quirked value (1024)
> 
> Something like:
> 
> value = min(3072, value)
> 
> makes more sense

That would prevent two such devices from working in parallel, when they
likely could as 1024 bytes should be enough. That's the reason for the
UVC_QUIRK_FIX_BANDWIDTH for uncompressed formats.

> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

-- 
Regards,

Laurent Pinchart
