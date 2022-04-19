Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1B0506B59
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 13:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351861AbiDSLtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 07:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351845AbiDSLtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 07:49:11 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE3A33E8D
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 04:46:29 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id i3-20020a056830010300b00605468119c3so5230083otp.11
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zr+VGX0mhBp9NZinaclK39Iaheyjh+GcxufQM98q2T4=;
        b=TaPVENVs6UeX/0wd28BijzB9+2vH3hkykLfAx6Z+TianLJL/RErxbAX9zvCD+siM/Z
         uLqmKaIs6I21/BZuoX5aH54xHpMduMGKHjQmyllRJaUuuBA2culEnlxqKuir7uxiFapV
         3KrFAo/2ggciJwo9Etg/qeEu5hsSc4fTqlm8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zr+VGX0mhBp9NZinaclK39Iaheyjh+GcxufQM98q2T4=;
        b=2k6VTDOwZWYnc3Z/D/UUxU8yj2qkPiUjvB1NnBe2BBPxbrJsOUHVNblNWzKgqXUyTl
         XO2ANdk5sRzOno2avs0Mj/Xlu57P/9ToocMntETz7E1rneKFJQIEpVPhZY9hkpmN0xr6
         2hK7Nu5AU7EIIdOc2w1y5c/zcAtF6GrTElfpX6efFsxYoccGN2xa6PcMxXD3m2UF0ObK
         MVO+ggMNDx8AuXaTKMhDLU8Zwj3Jq39C1xMjmSUUucFsUtCnsypnk/QU1R2Mu1teP1fD
         lVfabGZhfCp59ejpgOR+ZwGyW+7o3Sx15u7SXA743g5qOfO3d6Kz8VbH23XwQQMGjwaH
         CWbA==
X-Gm-Message-State: AOAM530rkUAXiYPFs1dkDft6V0lebhuLnNXAYQbK3S5JWTX6CZREHjtT
        2/oiWgZllHxU5gVUcmeFVPYf9UV1xUL1Gw==
X-Google-Smtp-Source: ABdhPJx92ShHuU9h0GL3RZgMVTUDZB1ZRlMmtow5udaPijaSd7Vdf44ExSB+s+twpvXURPoi7L+d3w==
X-Received: by 2002:a9d:1b68:0:b0:5c9:5da1:3752 with SMTP id l95-20020a9d1b68000000b005c95da13752mr5512789otl.354.1650368788179;
        Tue, 19 Apr 2022 04:46:28 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id x26-20020a056830115a00b0060551592a0asm1199356otq.80.2022.04.19.04.46.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 04:46:27 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id i8-20020a4a6f48000000b00324ada4b9d9so2986308oof.11
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 04:46:26 -0700 (PDT)
X-Received: by 2002:a4a:8081:0:b0:33a:52ed:3b3b with SMTP id
 z1-20020a4a8081000000b0033a52ed3b3bmr1777631oof.26.1650368786395; Tue, 19 Apr
 2022 04:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
In-Reply-To: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 19 Apr 2022 13:46:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
Message-ID: <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
To:     James_Lin <Ping-lei.Lin@mediatek.com>
Cc:     linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Arnd Bergmann <arnd@arndb.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, sherlock.chang@mediatek.com,
        lecopzer.chen@mediatek.com, max.yan@mediatek.com,
        tm.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James

Thanks for your patch

On Mon, 18 Apr 2022 at 11:07, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
>
> This patch aims to add UVC_GUID_FORMAT_H265
> High Efficiency Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
> They describe the same video encoding method.
> So for handling their behavior is the same.
> However, when external camera device describes this encoding method,
> some use hevc, some use h265.
> There is no uniform specification to describe this encoding method.
> So if an external camera device use h265 to describe this encoding method,
> driver will not recognize it.
> Therefore, this patch is to enable driver to read HEVC/H265
> and convert it to V4L2_PIX_FMT_HEVC.
>
> Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
>  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dda0f0aa78b8..e437e9f95890 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_H264,
>                 .fcc            = V4L2_PIX_FMT_H264,
>         },

Maybe I would add a comment here saying that some cameras represent
hevc as h265.

> +       {
> +               .name           = "H.265",
> +               .guid           = UVC_GUID_FORMAT_H265,
> +               .fcc            = V4L2_PIX_FMT_HEVC,
> +       },
>         {
>                 .name           = "Greyscale 8 L/R (Y8I)",
>                 .guid           = UVC_GUID_FORMAT_Y8I,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 143230b3275b..41f4d8c33f2a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -139,6 +139,9 @@
>  #define UVC_GUID_FORMAT_H264 \
>         { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_H265 \
> +       { 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
> +        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>  #define UVC_GUID_FORMAT_Y8I \
>         { 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> --
> 2.18.0
>


-- 
Ricardo Ribalda
