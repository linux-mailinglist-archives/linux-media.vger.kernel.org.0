Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579C366BEA5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjAPNGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjAPNGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:06:20 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C621E5EE
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:05:42 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id p24so30249419plw.11
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHEN6NRkyow7uUjKRMEr8ke6VmFpUwa/vD6NWEe4Dj4=;
        b=n4oMOOAAD2IqVNFJjQnDftb1tm9uDXwWoABmCcyeM9IG5NnEpQvPGbuHiTzPLYDVwe
         kklh6hxeytmBkCo5NjQFhby33DvlJQit9UuBZK9JmBthRgo21O6DguUl3pWCcz8Osl9d
         mYuwIQNd6y5h3W1XIzwKslvsiaFHpZP2L9rnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHEN6NRkyow7uUjKRMEr8ke6VmFpUwa/vD6NWEe4Dj4=;
        b=2fEve0IXpENrIF/7kyjERbykm8Emnui/1Mdw3GZOeY+5KlKLGuh2rC3Cm/e4R20OYv
         5hc0TURmcRuS42UOBQndHSej/7/5ymDkixSewjgjaPYZqdXJ492pzDfRiuYTDvxXojnV
         /kkT0iBEc9wnjdevT8Op+33w+0BAfw6rsIiXdtT9dTrUapQcjTxyuGECCiqU+i3We3s3
         sfjPRmfBllkEDTcVWR0aHYdvO9YdQlxBdOy2BB5qE8pIuyQlPuO801cFcJV/n21GOpwO
         ovugpWSRm7lmGUFybOoU7BfcJv2ZubEQ7mXncJnjAFqheAygGWn9xDzxvR+cdh7AtNZB
         RX1g==
X-Gm-Message-State: AFqh2kohPaHalIWkVaw+24bNHJP5MJEOnQGLr9xcVV2UwP515TyJo8Tm
        WPmCX6xqUVeOXiz3u/oyb2yCYRt4d5uxsg79QW8=
X-Google-Smtp-Source: AMrXdXtCUan2+aP6nfV9i9bf65+z6wvDZwalU0k9opbpeAGDc1XVqZnSFP2bnzUTP/jZFrwteS+q6Q==
X-Received: by 2002:a17:902:ee82:b0:193:30bc:ed86 with SMTP id a2-20020a170902ee8200b0019330bced86mr21694592pld.48.1673874341303;
        Mon, 16 Jan 2023 05:05:41 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902780900b00188fc6766d6sm19187952pll.219.2023.01.16.05.05.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 05:05:40 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso31006036pjo.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:05:40 -0800 (PST)
X-Received: by 2002:a17:90a:c984:b0:219:8132:70db with SMTP id
 w4-20020a17090ac98400b00219813270dbmr9189148pjt.183.1673874339367; Mon, 16
 Jan 2023 05:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 14:05:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com>
Message-ID: <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Giuliano Lotta <giuliano.lotta@gmail.com>,
        "kolbjorn@kodemaker.no" <kolbjorn@kodemaker.no>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> long. Force the UVC version for that device.

Don't we also want to include 4035:4033 ?

I am curious about the PowerLine Control (does it have one?) will it
behave like 1.1 or 1.5

Would it be possible to get the output with uvc_debug enabled?

Regards!


>
> Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>
> Giuliano, I believe you've successfully tested this patch. If so, could
> you reply with a Tested-by tag ? Just copying the following in your
> reply will do:
>
> Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
>
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1a186abeb4fa..742eeaff333e 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
>           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> +       /* Quanta ACER HD User Facing */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x0408,
> +         .idProduct            = 0x4035,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> +               .uvc_version = 0x010a,
> +         } },
>         /* LogiLink Wireless Webcam */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1
> --
> Regards,
>
> Laurent Pinchart
>


--
Ricardo Ribalda
