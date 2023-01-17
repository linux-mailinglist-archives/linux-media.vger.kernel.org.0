Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0F4A66E0F2
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 15:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbjAQOiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 09:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjAQOiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 09:38:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60033125B0
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:38:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id b10so1067570pjo.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EHiYKm51L849ANN7LFdrZKJ0v5AwtepFjNOoClfQ46M=;
        b=MCkr0PeUciN1Hw8X7Uh3hFxKFh9d/Qx4nZkX4GL/iwrLSJUCIVT2vny3MVz4Aon6+T
         7blIvKkw0mQ5O6rAIh4IXKqZcM61ug/6h5GcOEQ3EiOqgMuXiEUtISLalvsIPVJfBt9T
         enbPsnDsxFDlvc+aO33ut9VYFX2q9qgw44mj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHiYKm51L849ANN7LFdrZKJ0v5AwtepFjNOoClfQ46M=;
        b=zvIMT0d3d9qgFb61EiTaTfkl+3wUF+PusYsEv20/2tqpXrdniaWhfTSI0jGzw5E9tb
         TBPnPQ5oZEYay5u2QN9G7ckhS9qdgwpp2qwoMMSGcMxMuzCAH01YYyHcVa8jQbCrNqvE
         i9IyuOtAe8XYqvb9EY0BYEpAw1/lnkMyXTDO1UyrHERcAQ+reHcoRKpy/vi/aHghu2JE
         6F7YHn/vsYGdWYBA9gP/C1l99KdTroew/lNoURU7TaZIF1QjwzUE0cj5mBrMb5pcCXcB
         SDfjjPM8AmsQCn2nmoQVdanjywQ2IAVobqHcRBUoDNwA5qKCkA2/Qz52i4B27N9ssJhP
         8CVA==
X-Gm-Message-State: AFqh2krC7eraKC8iL0DUYZ25bSJz+e0XMULO/Jz8jJPwVi7GOdNZwYZt
        s/5mBwe6Fy0lBWfNawVDfNbRCb8vltRH9aNH
X-Google-Smtp-Source: AMrXdXsQuXhg8+rNa6WWaHsY7j2FDoyq1mXQ50m2ViS3IFxQyOkAy5dG6IkzQ9Rtuaz/9Mep6YCl6w==
X-Received: by 2002:a05:6a20:7d8d:b0:a9:e225:6f7b with SMTP id v13-20020a056a207d8d00b000a9e2256f7bmr3842258pzj.0.1673966300395;
        Tue, 17 Jan 2023 06:38:20 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id z18-20020a63c052000000b0049f2c7e59f5sm17220579pgi.27.2023.01.17.06.38.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:38:19 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id 20so18193453pfu.13
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:38:19 -0800 (PST)
X-Received: by 2002:aa7:978d:0:b0:589:8362:c7ce with SMTP id
 o13-20020aa7978d000000b005898362c7cemr297110pfp.21.1673966298967; Tue, 17 Jan
 2023 06:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvhXdyFuA2y2Sob4yx2=RK+uuCBJ2r_jBc+L4aZABLwPw@mail.gmail.com> <Y8auNeu1qFygIxUt@pendragon.ideasonboard.com>
In-Reply-To: <Y8auNeu1qFygIxUt@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 17 Jan 2023 15:38:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCt=17Yf9q8MWn+BGSDF_2XfSn4JpCtYkLwbV1EuSeHvLA@mail.gmail.com>
Message-ID: <CANiDSCt=17Yf9q8MWn+BGSDF_2XfSn4JpCtYkLwbV1EuSeHvLA@mail.gmail.com>
Subject: Re: [PATCH v5] media: uvcvideo: Fix bandwidth error for Alcor camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Ai Chao <aichao@kylinos.cn>,
        Jackie Liu <liuyun01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 17 Jan 2023 at 15:18, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Jan 17, 2023 at 03:08:07PM +0100, Ricardo Ribalda wrote:
> > On Sun, 15 Jan 2023 at 22:17, Laurent Pinchart wrote:
> > >
> > > From: Ai Chao <aichao@kylinos.cn>
> > >
> > > The Alcor Corp. Slave camera (1b17:6684 and 2017:0011) returns a wrong
> > > dwMaxPayloadTransferSize value for compressed formats. Valid values are
> > > typically up to 3072 bytes per interval (for high-speed, high-bandwidth
> > > devices), and those faulty devices request 2752512 bytes per interval.
> > > This is a firmware issue, but the manufacturer cannot provide a fixed
> > > firmware.
> > >
> > > Fix this by checking the dwMaxPayloadTransferSize field, and hardcoding
> > > a value of 1024 if it exceeds 3072 for compressed formats transferred
> > > over isochronous endpoints. While at it, document the other quirk that
> > > handles a bandwidth issue for uncompressed formats.
> > >
> > > Signed-off-by: Ai Chao <aichao@kylinos.cn>
> > > ---
> > > I have dropped the Reviewed-by tags as the patch has changed
> > > significantly.
> > >
> > > Ricardo, do you know if the 3072 bytes limit is fine with super-speed
> > > devices, or does it need to be increased ?
> > Tried with a couple of super-speed:
> >
> > If I print: ctrl->dwMaxPayloadTransferSize
> >
> > [  237.269972] drivers/media/usb/uvc/uvc_video.c:239 bw 3072
> > [  175.761041] drivers/media/usb/uvc/uvc_video.c:239 bw 3060
> >
> > Format YUYV stall when I cap the dwMaxPayloadTransferSize to 1024, but
> > works fine with MJPEG and even NV12
> >
> > How does it sound to cap dwMaxPayloadTransferSize to 3072 for
> > superspeed and 1024 for high speed?
>
> Won't you still run out of bandwidth when using multiple cameras
> concurrently ? Is it the interval that is shorter with SS, or the
> maximum bytes per interval that is larger ?

From UVC:


In the context of the USB Video Class, a Payload Transfer is a unit of
data transfer common to bulk and isochronous endpoints. Each Payload
Transfer includes a Payload Header followed by Payload Data. For
isochronous endpoints, a Payload Transfer is contained in the data
transmitted during a single (micro) frame: up to 1023 bytes for a
fullspeed endpoint; up to 1024 bytes for a high-speed endpoint; and up
to
3072 bytes for a high-speed/high-bandwidth endpoint. For bulk
endpoints, a Payload Transfer is contained in the data transmitted in a
single bulk transfer (which may consist of multiple bulk data
transactions).


What are the chances of having multiple broken cameras on the single
device VS having a single broken camera?

Actually, now that I think about this, maybe we should go back to the
previous version where we quirk based on vid:pid, hoping that this bug
is just one of.

Maybe we can use this logic to something like

if payloadTransfer > standard:
   print(Blame vendor, contact mailing list)

:)


>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index d4b023d4de7c..c6351d3b24cf 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -200,6 +200,20 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > >         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
> > >                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
> > >
> > > +       /*
> > > +        * Many devices report an incorrect dwMaxPayloadTransferSize value. The
> > > +        * most common issue is devices requesting the maximum possible USB
> > > +        * bandwidth (3072 bytes per interval for high-speed, high-bandwidth
> > > +        * isochronous endpoints) while they actually require less, preventing
> > > +        * multiple cameras from being used at the same time due to bandwidth
> > > +        * overallocation.
> > > +        *
> > > +        * For those devices, replace the dwMaxPayloadTransferSize value based
> > > +        * on an estimation calculated from the frame format and size. This is
> > > +        * only possible for uncompressed formats, as not enough information is
> > > +        * available to reliably estimate the bandwidth requirements for
> > > +        * compressed formats.
> > > +        */
> > >         if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> > >             stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
> > >             stream->intf->num_altsetting > 1) {
> > > @@ -236,6 +250,23 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > >
> > >                 ctrl->dwMaxPayloadTransferSize = bandwidth;
> > >         }
> > > +
> > > +       /*
> > > +        * Another issue is with devices that report a transfer size that
> > > +        * greatly exceeds the maximum supported by any existing USB version
> > > +        * for isochronous transfers.  For instance, the "Slave camera" devices
> > > +        * from Alcor Corp. (2017:0011 and 1b17:66B8) request 2752512 bytes per
> > > +        * interval.
> > > +        *
> > > +        * For uncompressed formats, this can be addressed by the FIX_BANDWIDTH
> > > +        * quirk, but for compressed format we can't meaningfully estimate the
> > > +        * required bandwidth. Just hardcode it to 1024 bytes per interval,
> > > +        * which should be large enough for compressed formats.
> > > +        */
> > > +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> > > +           ctrl->dwMaxPayloadTransferSize > 3072 &&
> > > +           stream->intf->num_altsetting > 1)
> > > +               ctrl->dwMaxPayloadTransferSize = 1024;
> > >  }
> > >
> > >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
