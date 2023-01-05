Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D08865E9AA
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 12:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjAELSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 06:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbjAELSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 06:18:00 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CB712A80
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 03:17:58 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so1742987pjd.0
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pUDI94tIgs3+J7Ouph3ufWVswMyAqVybiLlfQ16M2gg=;
        b=avh+3Fi1o8iRgh7hlfpSXQ7nnFK1gPORj5OXM45kMdPeOAZ5ysPrFuQSlbyFhYNKgm
         rwSD9DdI80dsFWFJrXcPVQQArbaTi6b5kHVJslNzBh7v6y5YBvhZWtCffguzR80ijTP3
         V1CZH6bKaCZSQYNsuel9nrAcd5nFIrRtp1cvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUDI94tIgs3+J7Ouph3ufWVswMyAqVybiLlfQ16M2gg=;
        b=sa1hyE5/r8pbNq7Dig9lzWKCErHcYsjW/9qUTyz5o2pHVKFlV2ODFhunc379oDImp+
         J2AmG0TzrcsAM7E6SAqTgQqlfbjSEPoiOXZPwg90YpXKZpaMIaDScOFZgNbtmr9q5aOy
         +6W8qbi/+yq4DB2M5HwiiObnpoO7fnRaC/PRs0iKGGpeIr6d0s2Zz4EQE2bjisFHcC4o
         YqWXq9jC7OpmE/UaJ0uRfElpx4OHJgaGZmvar/nJvaS8MY7eAI0zuuK5ZzGNlRGJYV6+
         2xGVqwertXhE/yPP4q65zDFpTKEaelHXVrFZtHI7lcxbC58fRCr7H88rqJJA4RFGYYIH
         9aDw==
X-Gm-Message-State: AFqh2krOjq/QRneLlQaWPiPfvKARWPbiY9uvWaxPsO6sHGfLD6wzWRG4
        5vyfZnb+8lxOiycm0TnLbPBoI4JeAi/n4jmvfk8=
X-Google-Smtp-Source: AMrXdXuY+kiX/GvcUVkWH0f71e+EgIUYRQjoM2CU9iXvI9+vzWSau4j+Zy2vHSN09TTwocoxcpuc8w==
X-Received: by 2002:a17:902:c106:b0:192:d4ba:98f4 with SMTP id 6-20020a170902c10600b00192d4ba98f4mr11774713pli.25.1672917477888;
        Thu, 05 Jan 2023 03:17:57 -0800 (PST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id j14-20020a170903024e00b001869079d083sm25899324plh.90.2023.01.05.03.17.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 03:17:57 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id d10so24278829pgm.13
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 03:17:56 -0800 (PST)
X-Received: by 2002:a05:6a00:178c:b0:582:7a69:4f8b with SMTP id
 s12-20020a056a00178c00b005827a694f8bmr1000790pfg.64.1672917476223; Thu, 05
 Jan 2023 03:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-v4l2-compliance-v3-0-598d33a15815@chromium.org> <20220920-resend-v4l2-compliance-v3-6-598d33a15815@chromium.org>
In-Reply-To: <20220920-resend-v4l2-compliance-v3-6-598d33a15815@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 5 Jan 2023 12:17:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCttszXDXk0CKSES6O_z4+z=fJ2MyBMN6gF+OZ-L4f4Mmg@mail.gmail.com>
Message-ID: <CANiDSCttszXDXk0CKSES6O_z4+z=fJ2MyBMN6gF+OZ-L4f4Mmg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Laurent

There is a bug here as well.

When you drop "Fix power line control for Lenovo Integrated Camera"
Can you drop this as well?


Thanks!


On Tue, 3 Jan 2023 at 15:36, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace the count with a mask field that lets us choose not only the max
> value, but also the minimum value and what values are valid in between.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvc_driver.c |  3 ++-
>  drivers/media/usb/uvc/uvc_v4l2.c   |  3 ++-
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  4 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7622c5b54b35..aa7a668f60a7 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -6,6 +6,7 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#include <linux/bitops.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -525,7 +526,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
>                 .menu_info      = exposure_auto_controls,
> -               .menu_count     = ARRAY_SIZE(exposure_auto_controls),
> +               .menu_mask      = BIT_MASK(ARRAY_SIZE(exposure_auto_controls)),
This should say
               .menu_mask      =
                       GENMASK(ARRAY_SIZE(exposure_auto_controls) - 1, 0

>                 .slave_ids      = { V4L2_CID_EXPOSURE_ABSOLUTE, },
>         },
>         {
> @@ -731,7 +732,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>                 .menu_info      = power_line_frequency_controls,
> -               .menu_count     = ARRAY_SIZE(power_line_frequency_controls) - 1,
> +               .menu_mask      = BIT_MASK(ARRAY_SIZE(power_line_frequency_controls) - 1),

       .menu_mask      = GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
                                 V4L2_CID_POWER_LINE_FREQUENCY_50HZ),



>         },
>  };
>
> @@ -745,7 +746,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
>                 .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>                 .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>                 .menu_info      = power_line_frequency_controls,
> -               .menu_count     = ARRAY_SIZE(power_line_frequency_controls),
> +               .menu_mask      = BIT_MASK(ARRAY_SIZE(power_line_frequency_controls)),
>         },
>  };
>
> @@ -975,7 +976,9 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>                 const struct uvc_menu_info *menu = mapping->menu_info;
>                 unsigned int i;
>
> -               for (i = 0; i < mapping->menu_count; ++i, ++menu) {
> +               for (i = 0; BIT(i) <= mapping->menu_mask; ++i, ++menu) {
> +                       if (!test_bit(i, &mapping->menu_mask))
> +                               continue;
>                         if (menu->value == value) {
>                                 value = i;
>                                 break;
> @@ -1228,12 +1231,14 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
> +               for (i = 0; BIT(i) <= mapping->menu_mask; ++i, ++menu) {
> +                       if (!test_bit(i, &mapping->menu_mask))
> +                               continue;
>                         if (menu->value == v4l2_ctrl->default_value) {
>                                 v4l2_ctrl->default_value = i;
>                                 break;
> @@ -1354,7 +1359,7 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
>                 goto done;
>         }
>
> -       if (query_menu->index >= mapping->menu_count) {
> +       if (!test_bit(query_menu->index, &mapping->menu_mask)) {
>                 ret = -EINVAL;
>                 goto done;
>         }
> @@ -1868,8 +1873,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
> @@ -2305,7 +2315,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>
>         INIT_LIST_HEAD(&map->ev_subs);
>
> -       size = sizeof(*mapping->menu_info) * mapping->menu_count;
> +       size = sizeof(*mapping->menu_info) * fls(mapping->menu_mask);
>         map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
>         if (map->menu_info == NULL) {
>                 kfree(map->name);
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e4bcb5011360..f9e6208c4636 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/atomic.h>
> +#include <linux/bits.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -2384,7 +2385,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
>         .v4l2_type      = V4L2_CTRL_TYPE_MENU,
>         .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
>         .menu_info      = power_line_frequency_controls_limited,
> -       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> +       .menu_mask      = BIT_MASK(ARRAY_SIZE(power_line_frequency_controls_limited)),
>  };
>
>  static const struct uvc_device_info uvc_ctrl_power_line_limited = {
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 3edb54c086b2..ed2525e7e2a5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -6,6 +6,7 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#include <linux/bits.h>
>  #include <linux/compat.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -80,7 +81,7 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>                         goto free_map;
>                 }
>
> -               map->menu_count = xmap->menu_count;
> +               map->menu_mask = BIT_MASK(xmap->menu_count);
>                 break;
>
>         default:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a151f583cd15..f75e5864bbf7 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -117,7 +117,7 @@ struct uvc_control_mapping {
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
> 2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae



-- 
Ricardo Ribalda
