Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE28565D1C5
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbjADLv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjADLvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:51:25 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CA9E48
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:51:24 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id w3so4003758ply.3
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 03:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nv/RrfPjniKrZy4KOHSCuJAXeVO/9f29DJaE9bmAFCU=;
        b=J+YUro0xlJVmSsrLN92NUNL1YXXNmhL2T+zxfBjlAO3y9Jbvua26NVZ8cWhpPNiDUg
         XqYg4WlmjBen4bfZPcQZbixxi2d0D2INhsQdPsNqeES7YXgiqHCzH86s6T5Vm8onxvPx
         OgfTNMtJqK2Xaz55/MK/3fwTbpQxJEu3KkhlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv/RrfPjniKrZy4KOHSCuJAXeVO/9f29DJaE9bmAFCU=;
        b=Eoj37CaTwlORJx7CQ9wNSrbKILTAQUsaP3X6nTB1fvRdslm5G3SEqZsBtysUnc0RSm
         xj8dFVNTWdHpfpz4DGBN/IgjZcpN7saz/KnnlHI79dDHoMnNQhrI3kGNg+YwnrlKhjW2
         gmrPym/oYYsUfaSfkAHSZrkhjEMeXInTH8RubfbsAhDvj54oZytno8AkqG3RxDzisvT1
         FP+8VynyfBO7e1lxy4mdegDx1ZNjW6QLjvHj2V5KLvcVUG0q2e+40AH6egmaRJ2S2VDG
         j5PBtIzTgNnzxaQjbczAhIo6Vk3KMU2381FfEcuzzZFJJjqU12KUBN5TfZKgsqZMZyo/
         eeTA==
X-Gm-Message-State: AFqh2kq+5vXEG6ZVzg/Okp7qD5E6w2SAnE2n5pksfauhhz7w7ne2Dl7m
        A41FqcdQq++fJ4Z1LQmKUYFM/98DLEFE7ZIgRJ0=
X-Google-Smtp-Source: AMrXdXvkWavSY6Q8zQq6cMaZy/zRQC1J3Sc5UmQOVtzKfZSu4c6I2OR5T8jih6b5MdabIZ9ombw9fA==
X-Received: by 2002:a17:902:da86:b0:188:f570:7bdf with SMTP id j6-20020a170902da8600b00188f5707bdfmr64732406plx.40.1672833083821;
        Wed, 04 Jan 2023 03:51:23 -0800 (PST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709026f1000b00192dcd1b0e5sm3383348plk.265.2023.01.04.03.51.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 03:51:23 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id g16so25978652plq.12
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 03:51:23 -0800 (PST)
X-Received: by 2002:a17:90a:c984:b0:219:8132:70db with SMTP id
 w4-20020a17090ac98400b00219813270dbmr4515130pjt.183.1672833082610; Wed, 04
 Jan 2023 03:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20230104111944.962-1-laurent.pinchart@ideasonboard.com> <20230104111944.962-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230104111944.962-3-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Jan 2023 12:51:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCs=hc7M8ymXiVnp5MoSrB3E53v6eMrdriKXmnc790L31A@mail.gmail.com>
Message-ID: <CANiDSCs=hc7M8ymXiVnp5MoSrB3E53v6eMrdriKXmnc790L31A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Drop custom format names for DV formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
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

For what it's worth, I am pro squash :)

On Wed, 4 Jan 2023 at 12:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Unlike V4L2, UVC makes a distinction between the SD-DV, SDL-DV and HD-DV
> formats. It also indicates whether the DV format uses 50Hz or 60Hz. This
> information is parsed by the driver to construct a format name string
> that is printed in a debug message, but serves no other purpose as V4L2
> has a single V4L2_PIX_FMT_DV pixel format that covers all those cases.
>
> As the information is available in the UVC descriptors, and thus
> accessible to users with lsusb if they really care, don't log it in a
> debug message and drop the format name string to simplify the code.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

With or without my nits

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9852d6f63ae8..ba41f13a2491 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -228,7 +228,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_format_desc *fmtdesc;
>         struct uvc_frame *frame;
>         const unsigned char *start = buffer;
> -       char fmtname[12] = { 0, };
>         unsigned int width_multiplier = 1;
>         unsigned int interval;
>         unsigned int i, n;
> @@ -325,14 +324,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 switch (buffer[8] & 0x7f) {
>                 case 0:
> -                       strscpy(fmtname, "SD-DV", sizeof(fmtname));
> -                       break;
>                 case 1:
> -                       strscpy(fmtname, "SDL-DV", sizeof(fmtname));
> -                       break;
>                 case 2:
> -                       strscpy(fmtname, "HD-DV", sizeof(fmtname));
>                         break;
> +
>                 default:
>                         uvc_dbg(dev, DESCR,
>                                 "device %d videostreaming interface %d: unknown DV format %u\n",
> @@ -341,9 +336,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> -                       sizeof(fmtname));
> -
>                 format->fcc = V4L2_PIX_FMT_DV;
>                 format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
>                 format->bpp = 0;
> @@ -370,12 +362,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 return -EINVAL;
>         }
>
> -       if (format->fcc) {
> -               if (fmtname[0])
> -                       uvc_dbg(dev, DESCR, "Found format %s\n", fmtname);
> -               else
> -                       uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
> -       }

Maybe it is the way that I debug the issues. I run an OK execution
with a FAIl one and then I compare results. I tend to prefer that the
extra lines are errors and there is no missing lines.... but I if your
prefer it this way, I am ok with it ;)
> +       if (format->fcc)
> +               uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
>
>         buflen -= buffer[0];
>         buffer += buffer[0];
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
