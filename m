Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5ED640C37
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 18:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbiLBReo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 12:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbiLBRen (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 12:34:43 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F22ADBF59
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 09:34:42 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so5756351pjj.4
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 09:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uinJfuu5LnvKsdfYUZFeW7RB1NDhITtuOHigeJVTSr8=;
        b=lTIcpV5Vq0lkLfI2WUIPMNBGAXmECylcef43teVtdDdIE4Qkr+tMv6QmcPVCVVUsAZ
         Oau9LYettxpWZgPsrPrnFDluuYKtUWGxhiqT6nm3y0P0+OBW84HV/PpnoNnV24fLPY90
         iYUjrL7a2o/g7ZvrfkyCxFHnkXdD4xHP/Fmrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uinJfuu5LnvKsdfYUZFeW7RB1NDhITtuOHigeJVTSr8=;
        b=0uIOpflcoUs+GpmYH3zY6K4Vt1hsiDb3ahI9EWi6BF2Hq8DLnTQdib7+3k7eNmwo6W
         /QIpf+SekHtJ4qsuL6GyDZG9KSY23ckqPbsTihaIA5gVl7gWV3xeHxVaZtvMhhyKs+g6
         6LAWuL9GcajChyKZVdShHQDz0rKA2mLcVFU4Skk56wBqKWcOpKD3btkSbUVcs5B76NeK
         LsauMVVdjYZh8EfBhMlono8GHvsaGacRPCUpHcfto0lslAb4gfgmQMcq2wOXT/negYkh
         n0/F+Akm76SmzVuH656V3kRhAR3n/9yGkDLq8IktyIY08M3ZDbTqCOwUX5Zknh9HHv1j
         chQg==
X-Gm-Message-State: ANoB5pnOG5Ob0l/QFrnB8LzzLEjwAqVbtSiJP58MVq81JA7TOoBad5TT
        tPE6Eq+tvwrKsxmjvsfYBgVbFsq4UobBRHsIkW0=
X-Google-Smtp-Source: AA0mqf5BJjfv9JG8uG4zCmT5QhGavfRAOIDCRlqCaBQRMaazsxLfa7gXqOF50PTLj5/A4e4DE+evsg==
X-Received: by 2002:a17:902:ce86:b0:189:48b0:807 with SMTP id f6-20020a170902ce8600b0018948b00807mr46818629plg.81.1670002481633;
        Fri, 02 Dec 2022 09:34:41 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902dc8300b00189a50d2a3esm5776373pld.241.2022.12.02.09.34.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 09:34:40 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id c7so2144060pfc.12
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 09:34:40 -0800 (PST)
X-Received: by 2002:a63:e646:0:b0:470:15cd:d428 with SMTP id
 p6-20020a63e646000000b0047015cdd428mr65757085pgj.213.1670002479835; Fri, 02
 Dec 2022 09:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20220920-standard-menues-v2-0-323be5539c22@chromium.org> <20220920-standard-menues-v2-1-323be5539c22@chromium.org>
In-Reply-To: <20220920-standard-menues-v2-1-323be5539c22@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 2 Dec 2022 18:34:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCtzuOmSCPfYxm-uynfHRbr2AbvbqEGPniy+=vkKjdgadA@mail.gmail.com>
Message-ID: <CANiDSCtzuOmSCPfYxm-uynfHRbr2AbvbqEGPniy+=vkKjdgadA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

Please ignore this one. It is already part of the series Follow-up
patches for uvc v4l2-compliance

Sorry for sending it duplicated

On Fri, 2 Dec 2022 at 18:26, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace the count with a mask field that let us choose not only the max
> value, but also the minimum value and what values are valid in between.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 32 ++++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvc_driver.c |  3 ++-
>  drivers/media/usb/uvc/uvc_v4l2.c   |  2 +-
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  4 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 8c208db9600b..13bc57e2a08d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -524,7 +524,8 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
>                 .menu_info      = exposure_auto_controls,
> -               .menu_count     = ARRAY_SIZE(exposure_auto_controls),
> +               .menu_mask      =
> +                       BIT_MASK(ARRAY_SIZE(exposure_auto_controls)),
>                 .slave_ids      = { V4L2_CID_EXPOSURE_ABSOLUTE, },
>         },
>         {
> @@ -730,7 +731,8 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>                 .menu_info      = power_line_frequency_controls,
> -               .menu_count     = ARRAY_SIZE(power_line_frequency_controls) - 1,
> +               .menu_mask      =
> +                       BIT_MASK(ARRAY_SIZE(power_line_frequency_controls) - 1),
>         },
>  };
>
> @@ -744,7 +746,8 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>                 .menu_info      = power_line_frequency_controls,
> -               .menu_count     = ARRAY_SIZE(power_line_frequency_controls),
> +               .menu_mask      =
> +                       BIT_MASK(ARRAY_SIZE(power_line_frequency_controls)),
>         },
>  };
>
> @@ -974,7 +977,9 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>                 const struct uvc_menu_info *menu = mapping->menu_info;
>                 unsigned int i;
>
> -               for (i = 0; i < mapping->menu_count; ++i, ++menu) {
> +               for (i = 1; BIT(i) <= mapping->menu_mask; ++i, ++menu) {
> +                       if (!test_bit(i, &mapping->menu_mask))
> +                               continue;
>                         if (menu->value == value) {
>                                 value = i;
>                                 break;
> @@ -1148,12 +1153,14 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>
>         switch (mapping->v4l2_type) {
>         case V4L2_CTRL_TYPE_MENU:
> -               v4l2_ctrl->minimum = 0;
> -               v4l2_ctrl->maximum = mapping->menu_count - 1;
> +               v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
> +               v4l2_ctrl->maximum = fls(mapping->menu_mask) - 1;
>                 v4l2_ctrl->step = 1;
>
>                 menu = mapping->menu_info;
> -               for (i = 0; i < mapping->menu_count; ++i, ++menu) {
> +               for (i = 1; BIT(i) <= mapping->menu_mask; ++i, ++menu) {
> +                       if (!test_bit(i, &mapping->menu_mask))
> +                               continue;
>                         if (menu->value == v4l2_ctrl->default_value) {
>                                 v4l2_ctrl->default_value = i;
>                                 break;
> @@ -1268,7 +1275,7 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
>                 goto done;
>         }
>
> -       if (query_menu->index >= mapping->menu_count) {
> +       if (!test_bit(query_menu->index, &mapping->menu_mask)) {
>                 ret = -EINVAL;
>                 goto done;
>         }
> @@ -1776,8 +1783,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 break;
>
>         case V4L2_CTRL_TYPE_MENU:
> -               if (xctrl->value < 0 || xctrl->value >= mapping->menu_count)
> +               if (xctrl->value < (ffs(mapping->menu_mask) - 1) ||
> +                   xctrl->value > (fls(mapping->menu_mask) - 1))
>                         return -ERANGE;
> +
> +               if (!test_bit(xctrl->value, &mapping->menu_mask))
> +                       return -EINVAL;
> +
>                 value = mapping->menu_info[xctrl->value].value;
>
>                 /*
> @@ -2227,7 +2239,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>
>         INIT_LIST_HEAD(&map->ev_subs);
>
> -       size = sizeof(*mapping->menu_info) * mapping->menu_count;
> +       size = sizeof(*mapping->menu_info) * fls(mapping->menu_mask);
>         map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
>         if (map->menu_info == NULL) {
>                 kfree(map->name);
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9c05776f11d1..09cc459c1253 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2675,7 +2675,8 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>         .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>         .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>         .menu_info      = power_line_frequency_controls_limited,
> -       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> +       .menu_mask      =
> +               BIT_MASK(ARRAY_SIZE(power_line_frequency_controls_limited)),
>  };
>
>  static const struct uvc_device_info uvc_ctrl_power_line_limited = {
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 4cc3fa6b8c98..07c7acce8025 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -80,7 +80,7 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>                         goto free_map;
>                 }
>
> -               map->menu_count = xmap->menu_count;
> +               map->menu_mask = BIT_MASK(xmap->menu_count);
>                 break;
>
>         default:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 24c911aeebce..fde4e975334f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -255,7 +255,7 @@ struct uvc_control_mapping {
>         u32 data_type;
>
>         const struct uvc_menu_info *menu_info;
> -       u32 menu_count;
> +       unsigned long menu_mask;
>
>         u32 master_id;
>         s32 master_manual;
>
> --
> 2.39.0.rc0.267.gcb52ba06e7-goog-b4-0.11.0-dev-696ae



-- 
Ricardo Ribalda
