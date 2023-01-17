Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EE966DFF4
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 15:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbjAQOIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 09:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjAQOIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 09:08:22 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5393239BA4
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:08:21 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 20so18118502pfu.13
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRx+SDtWdRVp9FdYK1J9YNmhFmT7DnkypCgjfhnhTBY=;
        b=L5FgEizoZ6Ju8Wu1GuDRgHTwBHXrKsz0nnuGTWeDine1EJV5Ohkgvpf4MTMcoFLakb
         zOgiMDVOcQu0RbMMWNOTx5D994GCOvym/LkW9c32ndrE5Cb07UMsxNxPR4CyvNXcM5Zh
         ZIg4IFMtWjvjCV969k5NtH48BqxJkfCcv7Ptk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRx+SDtWdRVp9FdYK1J9YNmhFmT7DnkypCgjfhnhTBY=;
        b=zStB6JkyHlKrJXemDxUCt7EchX4JSMDEQljnVAryjic47J5lsQGIxJltB3qKk2vgkT
         TZBP78LmNuOfUKHkvpjma4RlGZ2aofOpyl+0LcsDxkXqs36DDuKwZoSKQy+T+I6dEnmP
         KFp97AZ7lKSEe5EKPtEhRG1n008ZR6NP4u1LH2lF6iGfMfnIc0+ovvCyX4iyfD+lVH4d
         L+MmiWcVkd3mbaWeQPoYXZDK4VrB1drotcINSwgd385/aQSgIGs1tn9O+mSeM2cg/+lq
         PpL34sBFii3+5NDCI0lFRqUkC1MsY5TF4RAk4+XreWdYAM6C/SxPNf0iGroiGx/gsEpD
         cNAw==
X-Gm-Message-State: AFqh2ko4pV2pCCW9BVdopAx2bbrm9goHvd0gpQ50m4vEwtE7/+y3TFEO
        kQAbPuB4/vZYj0Rq8ZyivWofheej8JNwzeEe
X-Google-Smtp-Source: AMrXdXvvv0TR+Wd7V5zEMBYQ2QUT6IzOnV8vkAiWS7406zrqarxYiR2m3bLOg/ODGzW1ldzPGED8uA==
X-Received: by 2002:aa7:9586:0:b0:580:e549:559e with SMTP id z6-20020aa79586000000b00580e549559emr26437858pfj.17.1673964500497;
        Tue, 17 Jan 2023 06:08:20 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id s62-20020a625e41000000b00580a0bb411fsm19672228pfb.174.2023.01.17.06.08.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:08:19 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id dw9so31045717pjb.5
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:08:19 -0800 (PST)
X-Received: by 2002:a17:90b:386:b0:228:d42b:b9f3 with SMTP id
 ga6-20020a17090b038600b00228d42bb9f3mr264543pjb.116.1673964498635; Tue, 17
 Jan 2023 06:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230115211735.3877-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 17 Jan 2023 15:08:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCvhXdyFuA2y2Sob4yx2=RK+uuCBJ2r_jBc+L4aZABLwPw@mail.gmail.com>
Message-ID: <CANiDSCvhXdyFuA2y2Sob4yx2=RK+uuCBJ2r_jBc+L4aZABLwPw@mail.gmail.com>
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
Tried with a couple of super-speed:

If I print: ctrl->dwMaxPayloadTransferSize

[  237.269972] drivers/media/usb/uvc/uvc_video.c:239 bw 3072
[  175.761041] drivers/media/usb/uvc/uvc_video.c:239 bw 3060

Format YUYV stall when I cap the dwMaxPayloadTransferSize to 1024, but
works fine with MJPEG and even NV12

How does it sound to cap dwMaxPayloadTransferSize to 3072 for
superspeed and 1024 for high speed?

Regards!


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
