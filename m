Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE4062EF1A
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 09:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241333AbiKRIU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 03:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240934AbiKRIU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 03:20:56 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690221B1C3
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 00:20:55 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id m15so2208923ilq.2
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iHLUAjf4eP/2wmdRdZ8pbVX5diTV37Cg55kuRCq5aSw=;
        b=JnqHtTEqE5X+231MLBjSba97Jk60SbU2C+L+6WVXvEhuhQ0tkgif/5sCw6DKMBdO/H
         eTgvTIDJcxjBsLWCDVMg0aJUqHXx8kcXBshr6VN1D/xihOMJyYEaXk/l4H1dvm6rnRRM
         Xj78Ki1vme0IDR8N7L6DJxo2woO1LdNgXZ9YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHLUAjf4eP/2wmdRdZ8pbVX5diTV37Cg55kuRCq5aSw=;
        b=c+CwInAGZsWLZ096b6ZzU95JlEHqkAkIo99HNXycxp7xs94w4p7aqMxvHnE2VDHR1l
         gbCVfADo/ul0e2XvFEkjACUCDfK86fxBuDV2WM2w3hCKR7w5y/0M7xymkvYmhswEaF2X
         pVPBuLkDWF1SGiFaiRgyp7IIk+qxlLlyZdl9wKGClBmp4fOLq0bdpGjwyYzM/aG2APGq
         Xoi3vYdhkGFZgCtuOcHxK4Ai/JY4DMbN5ChL6jvN9WtNwMc+5BsorDMfxevprqc00Srt
         GXxQMPC4EfYiwlm5WOpMuwf0zGzkiP0vbr48i2X1BHLRNZG0+rx/aUkCCUNVE0/qYgoL
         dcVw==
X-Gm-Message-State: ANoB5pk8yIxFD7jvicfKh4vIblbH44NtqxL2de0Y7LyEvl/YF04iTjGc
        uSxpKG1Io48TDe1Vt1p5Ll+PkIsLucKdFA==
X-Google-Smtp-Source: AA0mqf7R3LCi385fvzbE+kYtiMuar6ogX2zRLknKD5yigrd8CI7S/FeEhZBK5RJFjwf1EYFrEGa1Ig==
X-Received: by 2002:a92:6c12:0:b0:2eb:1f07:5a7e with SMTP id h18-20020a926c12000000b002eb1f075a7emr2907066ilc.0.1668759654409;
        Fri, 18 Nov 2022 00:20:54 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id m11-20020a0566022e8b00b0068869b84b02sm1152202iow.21.2022.11.18.00.20.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:20:53 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id n188so3310779iof.8
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 00:20:53 -0800 (PST)
X-Received: by 2002:a02:9422:0:b0:373:2c18:a37e with SMTP id
 a31-20020a029422000000b003732c18a37emr2722013jai.51.1668759653340; Fri, 18
 Nov 2022 00:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20221118022302.112121-1-aichao@kylinos.cn> <CANiDSCs746jMSfzPJN9SzUfU-1xhRqG7G2Z9mVF_h=zThNoPxA@mail.gmail.com>
In-Reply-To: <CANiDSCs746jMSfzPJN9SzUfU-1xhRqG7G2Z9mVF_h=zThNoPxA@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 18 Nov 2022 09:20:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCujsJtwgu8j-Njn17S4Nu-QkjGXhgxMvpYqd4+BXYdtBw@mail.gmail.com>
Message-ID: <CANiDSCujsJtwgu8j-Njn17S4Nu-QkjGXhgxMvpYqd4+BXYdtBw@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Fix bandwidth error for Alcor camera
To:     Ai Chao <aichao@kylinos.cn>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Nov 2022 at 09:15, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Ai
>
> Thanks for your patch!
>
> On Fri, 18 Nov 2022 at 03:23, Ai Chao <aichao@kylinos.cn> wrote:
> >
> > For Alcor Corp. Slave camera(1b17:6684/2017:0011), it support to
> > output compressed video data, and it return a wrong
> > dwMaxPayloadTransferSize fields. This is a fireware issue,
> s/fireware/firmware/
> > but the manufacturer cannot provide a const return fields
> > by the fireware. For some device, device requested 2752512
> >  B/frame bandwidth. For some device, device requested 3072
> >  B/frame bandwidth. so we check the dwMaxPayloadTransferSize
> >  fields,if it large than 0x1000, reset dwMaxPayloadTransferSize
> > to 1024, and the camera preview normally.
>
> 3072 is smaller than 0x1000.
>
> It is ok to have values between 1024 and 0x1000 (4096) ?
>
> Thanks
>
> >
> > Signed-off-by: Ai Chao <aichao@kylinos.cn>
> >
> > ---
> > change for v3
> > - Add VID/PID 2017:0011
> >
> > change for v2
> > - Used usb_match_one_id to check VID and PID
> > ---
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index d2eb9066e4dc..1260800ef8bd 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -135,6 +135,10 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >         static const struct usb_device_id elgato_cam_link_4k = {
> >                 USB_DEVICE(0x0fd9, 0x0066)
> >         };
> > +       static const struct usb_device_id alcor_corp_slave_cam = {
> > +               USB_DEVICE(0x1b17, 0x6684),
> > +               USB_DEVICE(0x2017, 0x0011),
> > +       };
> >         struct uvc_format *format = NULL;
> >         struct uvc_frame *frame = NULL;
> >         unsigned int i;
> > @@ -234,6 +238,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >
> >                 ctrl->dwMaxPayloadTransferSize = bandwidth;
> >         }
> > +
> > +       /* Alcor Corp. Slave camera return wrong dwMaxPayloadTransferSize */
> > +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> > +           (ctrl->dwMaxPayloadTransferSize > 0x1000) &&
> > +            usb_match_one_id(stream->dev->intf, &alcor_corp_slave_cam)) {

You cannot use usb_match_one_id when you have multiple ids. Use
usb_match_id (add add the sentinel at the end of the list)

> > +               ctrl->dwMaxPayloadTransferSize = 1024;
> > +       }
> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > --
> > 2.25.1
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
