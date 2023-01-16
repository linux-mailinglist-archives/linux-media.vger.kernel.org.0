Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F75766C23E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbjAPOec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjAPOeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:34:13 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B22722789
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:14:53 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 200so14867216pfx.7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNqJXkPAAc4WHhXGVLeZMV95oQstg+2VjVLPre5zAiw=;
        b=n5zUQUH1RjuWF5oSddP4fx05yBgxdMFQ5VPBjtV0cqGfc2xHp1N4JPbTOryFKJjgbQ
         QMaQot2CUWqpLNmexuiNbiPN+6jetvomvWn/lQ7nB4h0aCSv/CT90Ue2rZW3cbgZxlDV
         f65PoCb0dBRA9TI6oOFM1Lsn0jM0SIVaATGo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNqJXkPAAc4WHhXGVLeZMV95oQstg+2VjVLPre5zAiw=;
        b=damTXeUU8hsDia7J3VpsL+BpqYxoC3wuQLWfpxSi+MQpE52SOmGSzH11Cao03aH1to
         EF6S8bUv5mg6cZX8+LOXZAR5BgzkkaCd4sRhCEaIOMlmmb/TPEZdxhPyTcCHGwvFFrZx
         uqEwN3PSsDOPQAC8D3ogWpYczkUaQBdvzHSfbqh0yo0Tz13Vv/v5TsgdNCYedO/Ygk9G
         lfoV3FluZVo/gvDZ9SUHuGnMqNVBl+yyAFVnPXTDl0Qf5RTqDhtuCAdZv92CdMZ2e9V2
         6qtRhU08M9m9MKvtNEcp6C36/qhOE2Hq6g61dKLd6pQk6psnz1Sg9dm6iXV+ESy5l/AD
         CTvQ==
X-Gm-Message-State: AFqh2kqtQ5WrzYnFeNDAhKvSh39HWzAJoJVQ76mTOVFGa5BvnhHJW99y
        5BDb+8LDYMS6JxhGAzn3TxuLhJHC6Xyhe7s2EIg=
X-Google-Smtp-Source: AMrXdXvE9UvPnho650aMVJl3xCSpJy+BuJOKwMfbRm6gkT4P/pgcVn9eAyja7CM1BZv+rUNx4ixVgQ==
X-Received: by 2002:aa7:9185:0:b0:58d:9850:d56c with SMTP id x5-20020aa79185000000b0058d9850d56cmr5143261pfa.25.1673878492300;
        Mon, 16 Jan 2023 06:14:52 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b0056b9ec7e2desm2580669pfg.125.2023.01.16.06.14.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:14:51 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id k18so6419927pll.5
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:14:51 -0800 (PST)
X-Received: by 2002:a17:902:cf42:b0:192:e615:f070 with SMTP id
 e2-20020a170902cf4200b00192e615f070mr687434plg.36.1673878490931; Mon, 16 Jan
 2023 06:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 15:14:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCtWkRd_oya97Qd9wHMM+ZC=2pVQz2a1NCLYximTDrwNkQ@mail.gmail.com>
Message-ID: <CANiDSCtWkRd_oya97Qd9wHMM+ZC=2pVQz2a1NCLYximTDrwNkQ@mail.gmail.com>
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

Hi Laurent

On Sun, 15 Jan 2023 at 22:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Ai Chao <aichao@kylinos.cn>
>
> The Alcor Corp. Slave camera (1b17:6684 and 2017:0011) returns a wrong
> dwMaxPayloadTransferSize value for compressed formats. Valid values are
> typically up to 3072 bytes per interval (for high-speed, high-bandwidth
> devices), and those faulty devices request 2752512 bytes per interval.
> This is a firmware issue, but the manufacturer cannot provide a fixed
> firmware.
>
> Fix this by checking the dwMaxPayloadTransferSize field, and hardcoding
> a value of 1024 if it exceeds 3072 for compressed formats transferred
> over isochronous endpoints. While at it, document the other quirk that
> handles a bandwidth issue for uncompressed formats.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> I have dropped the Reviewed-by tags as the patch has changed
> significantly.
>
> Ricardo, do you know if the 3072 bytes limit is fine with super-speed
> devices, or does it need to be increased ?

We have enough documentation to let ChatGPT make the code for us :)

I am going to try tonight on two superspeed cameras. Will let you know tomorow.

> ---
>  drivers/media/usb/uvc/uvc_video.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index d4b023d4de7c..c6351d3b24cf 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -200,6 +200,20 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         if ((ctrl->dwMaxPayloadTransferSize & 0xffff0000) == 0xffff0000)
>                 ctrl->dwMaxPayloadTransferSize &= ~0xffff0000;
>
> +       /*
> +        * Many devices report an incorrect dwMaxPayloadTransferSize value. The
> +        * most common issue is devices requesting the maximum possible USB
> +        * bandwidth (3072 bytes per interval for high-speed, high-bandwidth
> +        * isochronous endpoints) while they actually require less, preventing
> +        * multiple cameras from being used at the same time due to bandwidth
> +        * overallocation.
> +        *
> +        * For those devices, replace the dwMaxPayloadTransferSize value based
> +        * on an estimation calculated from the frame format and size. This is
> +        * only possible for uncompressed formats, as not enough information is
> +        * available to reliably estimate the bandwidth requirements for
> +        * compressed formats.
> +        */
>         if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) &&
>             stream->dev->quirks & UVC_QUIRK_FIX_BANDWIDTH &&
>             stream->intf->num_altsetting > 1) {
> @@ -236,6 +250,23 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>
>                 ctrl->dwMaxPayloadTransferSize = bandwidth;
>         }
> +
> +       /*
> +        * Another issue is with devices that report a transfer size that
> +        * greatly exceeds the maximum supported by any existing USB version
> +        * for isochronous transfers.  For instance, the "Slave camera" devices
> +        * from Alcor Corp. (2017:0011 and 1b17:66B8) request 2752512 bytes per
> +        * interval.
> +        *
> +        * For uncompressed formats, this can be addressed by the FIX_BANDWIDTH
> +        * quirk, but for compressed format we can't meaningfully estimate the
> +        * required bandwidth. Just hardcode it to 1024 bytes per interval,
> +        * which should be large enough for compressed formats.
> +        */
> +       if ((format->flags & UVC_FMT_FLAG_COMPRESSED) &&
> +           ctrl->dwMaxPayloadTransferSize > 3072 &&
> +           stream->intf->num_altsetting > 1)
> +               ctrl->dwMaxPayloadTransferSize = 1024;

- Maybe we should add a debug message if we are doing this?

- Also I do not like that the value that we use as trigger (3072) is
different than the quirked value (1024)

Something like:

value = min(3072, value)

makes more sense

Thanks!


>  }
>
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
