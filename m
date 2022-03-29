Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3B24EA896
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 09:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbiC2HhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 03:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbiC2HhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 03:37:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E2931DDF
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:35:30 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lr4so24821479ejb.11
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqmzVf4HuRmhAchjZgNSPhE8AVhbwZNDHMgFePcWJ64=;
        b=TH05u5GwaYPY4m0KWMEQoIynpfP3ShGtuFaZpPdZWKQpXidPEvntczSz3nnlT7itzJ
         3+4uHXo3zZ2GjGdK6lAhUStazFF8Q6pcpUU//mxVra0oEQWjI1SOlaulqDahxTsclkdq
         XfDPEH37XA/cb03caykepwacucw786o4Bkgi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqmzVf4HuRmhAchjZgNSPhE8AVhbwZNDHMgFePcWJ64=;
        b=56hbWgNXMIIC0rTWOzbTtsnY5TWot9TJwQi8U8kByDazEtZqrHyN934Pf82iS+SuPE
         xiFzNji3GX8Deg0lnuj778TOlJ5GPwY9KTP6UsaYoih2kLVr2SFDDvFs5nYBT/zo7rGv
         6NiFCR3lf2kP+7nvd4Xbx74hyly7cW4YbjXvqvmxSC4RYL8ZzvGzjs/+YLDNdwXTwwCB
         PXzWWOHCXYmzW44quXzDhjTJxTIrpB0leRKnY+iQUMXk9y/pl4x7A0rkMdkac8+W9fad
         FDgiyMZ0aXH23lTfFQzl+hqaYxr6atz7WzTqTQW+BaaK1XKNkoKQsGknDbLED+VwTx/y
         4Ppw==
X-Gm-Message-State: AOAM533uC0tz9i8Tb7qPuVdOjXkIt5x+5gw5aTfFruzcO3pDiJW+L06o
        HV6XdvcSa2aE8tfT/u/sCWuo1+A/hm5PvRNC81U=
X-Google-Smtp-Source: ABdhPJxaXkKJfA0NqNJaofsr+ipag+JaSmikXPYzs/EHknDMR6lYN7DEleqQbDnM4+hY59Jx3saCwg==
X-Received: by 2002:a17:907:168a:b0:6da:9167:47dc with SMTP id hc10-20020a170907168a00b006da916747dcmr32192999ejc.126.1648539328501;
        Tue, 29 Mar 2022 00:35:28 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id i30-20020a1709067a5e00b006df6f0d3966sm6704188ejo.189.2022.03.29.00.35.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 00:35:28 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id lr4so24821435ejb.11
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:35:28 -0700 (PDT)
X-Received: by 2002:a05:6402:5106:b0:419:45cd:7ab0 with SMTP id
 m6-20020a056402510600b0041945cd7ab0mr2822380edd.116.1648538954636; Tue, 29
 Mar 2022 00:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
In-Reply-To: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 29 Mar 2022 09:29:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCu+YBTp098kTYFrFmFNGQ_s8thHR8NgAuwPFXPboXwNmQ@mail.gmail.com>
Message-ID: <CANiDSCu+YBTp098kTYFrFmFNGQ_s8thHR8NgAuwPFXPboXwNmQ@mail.gmail.com>
Subject: Re: [PATCH] Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
To:     James_Lin <ping-lei.lin@mediatek.com>
Cc:     linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Arnd Bergmann <arnd@arndb.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ming Qian <ming.qian@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Sherlock.Chang@mediatek.com,
        TM.Wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James

Thanks for your patch, you should:

- Provide a more descriptive commit message
- Add the new format to the documentation
- Split the uvc changes with the videodev changes
- Keep some kind of alphabetic order in the formats

You could take a look to 0376a51fbe5e11a59d6a5c55e57cc201da06dbe0
media: v4l: Add packed YUV444 24bpp pixel format  for inspiration

Regards

On Tue, 29 Mar 2022 at 09:14, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dda0f0aa78b8..ebb807c33e57 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_H264,
>                 .fcc            = V4L2_PIX_FMT_H264,
>         },
> +       {
> +               .name           = "H.265",
> +               .guid           = UVC_GUID_FORMAT_H265,
> +               .fcc            = V4L2_PIX_FMT_H265,
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
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96e307fe3aab..aeaeb29307a4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_JPEG:         descr = "JFIF JPEG"; break;
>                 case V4L2_PIX_FMT_DV:           descr = "1394"; break;
>                 case V4L2_PIX_FMT_MPEG:         descr = "MPEG-1/2/4"; break;
> +               case V4L2_PIX_FMT_H265:         descr = "H.265"; break;
>                 case V4L2_PIX_FMT_H264:         descr = "H.264"; break;
>                 case V4L2_PIX_FMT_H264_NO_SC:   descr = "H.264 (No Start Codes)"; break;
>                 case V4L2_PIX_FMT_H264_MVC:     descr = "H.264 MVC"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3768a0a80830..636e4236bfb8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -691,6 +691,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_JPEG     v4l2_fourcc('J', 'P', 'E', 'G') /* JFIF JPEG     */
>  #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394          */
>  #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-1/2/4 Multiplexed */
> +#define V4L2_PIX_FMT_H265     v4l2_fourcc('H', '2', '6', '5') /* H265 with start codes */
>  #define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264 with start codes */
>  #define V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
>  #define V4L2_PIX_FMT_H264_MVC v4l2_fourcc('M', '2', '6', '4') /* H264 MVC */
> --
> 2.18.0
>


-- 
Ricardo Ribalda
