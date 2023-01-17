Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF69F66E02B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 15:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjAQOS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 09:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjAQOSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 09:18:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0FF3C283
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:18:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0014710C;
        Tue, 17 Jan 2023 15:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673965109;
        bh=Fpn4xumyN7lBwCtJ8hhdys84bluglX1Ahz75isShupI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cwmq+vnex7m7A7jrobUwohzpm3cVgDDTPlQZkvnhu4+wGxTJCfNQVGwP6dzB89QtG
         AbejI5+p78+N0qZ7UAS6igvfWclYYumosvGexO4Bgsq9eQ0sFKvRvKAnpzqlIvMXQF
         6PyVx2K5vmkHdjfxbyQPOg7Vz0YtSznTm0nKvS0c=
Date:   Tue, 17 Jan 2023 16:18:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, Ai Chao <aichao@kylinos.cn>,
        Jackie Liu <liuyun01@kylinos.cn>
Subject: Re: [PATCH v5] media: uvcvideo: Fix bandwidth error for Alcor camera
Message-ID: <Y8auNeu1qFygIxUt@pendragon.ideasonboard.com>
References: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvhXdyFuA2y2Sob4yx2=RK+uuCBJ2r_jBc+L4aZABLwPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvhXdyFuA2y2Sob4yx2=RK+uuCBJ2r_jBc+L4aZABLwPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Tue, Jan 17, 2023 at 03:08:07PM +0100, Ricardo Ribalda wrote:
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
> Tried with a couple of super-speed:
> 
> If I print: ctrl->dwMaxPayloadTransferSize
> 
> [  237.269972] drivers/media/usb/uvc/uvc_video.c:239 bw 3072
> [  175.761041] drivers/media/usb/uvc/uvc_video.c:239 bw 3060
> 
> Format YUYV stall when I cap the dwMaxPayloadTransferSize to 1024, but
> works fine with MJPEG and even NV12
> 
> How does it sound to cap dwMaxPayloadTransferSize to 3072 for
> superspeed and 1024 for high speed?

Won't you still run out of bandwidth when using multiple cameras
concurrently ? Is it the interval that is shorter with SS, or the
maximum bytes per interval that is larger ?

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
> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)

-- 
Regards,

Laurent Pinchart
