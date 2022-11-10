Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2C0624026
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 11:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiKJKmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 05:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiKJKmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 05:42:07 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCC5A18B
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 02:42:06 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id l127so1392258oia.8
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 02:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8B5mWkyToYr2vNuXzPC54pNDWrXFrhZfhiV/iv6BGu0=;
        b=JB33/r+SZkDlxPzFsPYwQ2WEOFT8yzKm5+a++KartRyp+5FRuEE+U7kNqLzXfzEYbo
         J5akQfuqHcv5g0XKBhh+nil+Caue50wOoUSo+BeHevkih4sOq+ONN+5pAxfAwXeDI3Pu
         4UOHOMS71fJUzeJxANxjK8l+ojeVTGsXZv+iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8B5mWkyToYr2vNuXzPC54pNDWrXFrhZfhiV/iv6BGu0=;
        b=JVi2m5ceQ8eEzsgXQU6mGBgPPUvxftr5Oy6/4PGcRDq6JADQbqddi7XSJpp5PAQm6X
         Gn+V/I7W/UIdl2//7L1O/RZygqNHZ7sf/8zu8XkKGMc3/uwRD0ghYfs35Dzk+yvH0BND
         XJRUjzXxwkl8A4hpASRjIWaUfs0t4eb7duTEJ82kqhXW3TfT87R8Uy0gzY5bIGWGTxkd
         w0ooMlrWkiCUDvc1I5FwvQqTBZpPbIWQsHLBcZnOQ2t0UCMNbsicDvmGxH3P3njjnJe7
         9Vno5pCavrjwcQqi15cnqRvndlAaPnmTugpb4y1+JImqxm5n9TjKxe5s25KNxfrsDtFA
         SBlA==
X-Gm-Message-State: ACrzQf2myKcVODwtcQPf6G44xrk9FW/uyFL4Fa3OkLa121HDlsGM7lX0
        px+Qr6tYLLNG++iUZRgDyibDjgEjUBz4QqaO
X-Google-Smtp-Source: AMsMyM7ApEmuYnzFdzTQYQ9wSnnm+ynI/DUid/GKSo54YULH6ZfGKxSZd+dFaOeEGfEK/Rwo9R/ryg==
X-Received: by 2002:a05:6808:1292:b0:35a:5645:171c with SMTP id a18-20020a056808129200b0035a5645171cmr18242127oiw.146.1668076925655;
        Thu, 10 Nov 2022 02:42:05 -0800 (PST)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id e27-20020a4a91db000000b004805b00b2cdsm4592447ooh.28.2022.11.10.02.42.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 02:42:04 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13c569e5ff5so1708264fac.6
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 02:42:04 -0800 (PST)
X-Received: by 2002:a05:6870:a901:b0:136:b801:e24c with SMTP id
 eq1-20020a056870a90100b00136b801e24cmr37742224oab.60.1668076924149; Thu, 10
 Nov 2022 02:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20221110081259.947269-1-aichao@kylinos.cn>
In-Reply-To: <20221110081259.947269-1-aichao@kylinos.cn>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 11:41:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCs2BdgWOO=1K6k=Ow0gvrfnMj8RyoVfa5tb+00soUD=6w@mail.gmail.com>
Message-ID: <CANiDSCs2BdgWOO=1K6k=Ow0gvrfnMj8RyoVfa5tb+00soUD=6w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bandwidth error for Alcor camera
To:     Ai Chao <aichao@kylinos.cn>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ai

Thanks for your patch

On Thu, 10 Nov 2022 at 09:15, Ai Chao <aichao@kylinos.cn> wrote:
>
> For Alcor Corp. Slave camera(1b17:6684), it support to
> output compressed video data, and it return a wrong
>  dwMaxPayloadTransferSize fields. This is a fireware issue,

s/fireware/firmware/

> but the manufacturer cannot provide a const return fields
> by the fireware. so we check the dwMaxPayloadTransferSize fields,
> if it large than 0x1000, reset dwMaxPayloadTransferSize to 1024.


Can you also provide the output of lsusb -d 1b17:6684 -v

>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index d2eb9066e4dc..49226c3f423c 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -234,6 +234,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>
>                 ctrl->dwMaxPayloadTransferSize = bandwidth;
>         }
> +
> +       /*Alcor Corp. Slave camera return wrong dwMaxPayloadTransferSize*/
> +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> +           (ctrl->dwMaxPayloadTransferSize > 0x1000) &&
> +           (le16_to_cpu(stream->dev->udev->descriptor.idVendor) == 0x1b17) &&
> +           (le16_to_cpu(stream->dev->udev->descriptor.idProduct) == 0x6684)) {
> +               ctrl->dwMaxPayloadTransferSize = 1024;
> +       }


What happens to transfersize between 1024 and 0x1000  (4096), are they ok?

Instead of le16_to_cpu(stream->dev->udev->descriptor.idVendor) ==
0x1b17) you can use usb_match_one_id

Thanks!

>  }
>
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> --
> 2.25.1
>


-- 
Ricardo Ribalda
