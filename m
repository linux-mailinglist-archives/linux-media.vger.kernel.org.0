Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E969E544DCE
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 15:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbiFINgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 09:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343877AbiFINg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 09:36:27 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADC84C434
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 06:36:24 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-fe539f9afbso11025fac.5
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oPstKletxYiqOD41TzLwnqcZnRI89EDEef5HeIiMLrU=;
        b=PCN714nixfKE4FsFzfufHem52xXaTU89w1eO1kqV1/oVKFbIgByoVGgUG99GSA6HP+
         5OZ2PusPn9uuiYEVFw2jArYWidTxqh0hDxOdITOEfW2AJPzn1qOIiZA5nPaEmld4QiGm
         UfkjcQepBB04lK1qSGC62XS5pcJyoljNQZMsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oPstKletxYiqOD41TzLwnqcZnRI89EDEef5HeIiMLrU=;
        b=tay/QXPgR5go8nNJnDm70A9dFy2zY94gEX78EsjqMvLvmXaTW7mq+dt7HAmtf6fPnH
         g4RDv7hKIrgvHeF4PnNE29zpnNk+DTobUuBuxJmm9ZMy1oI3CEbieiuP/ZjsSwRXZgBZ
         Xr5bZJbi8fp8Su9CnI3LpEh1bd2aq+4J8UsUYuQxN+TGsddnftla1lDzS/gdDaljwPot
         R+Or7xhNMTqG2uKDCDgmDSaVgRjglgdaMhaVLLgAM/JYOTOG3iTmzmsTlFpb9KFoKM67
         ubmZZ2VPZ22TIt0HDlRcEZI6R7vWFmWA6jQhsloG89HbXHDJ21lLlQgi/L6GfctYhZbI
         dx8Q==
X-Gm-Message-State: AOAM533kERGhY8mEqu9yTu9cgJGags6A32JTK62+G+ZWFmTmByI7oGgY
        r2qHHXgWN3NRLIIfGWqvuXVAxDnJjZP3zA==
X-Google-Smtp-Source: ABdhPJylRehKjRvhPXok10i8iGUrbzbkugNlea607wO/mF7ejbGXIv0TaNMWugnL+/a10Mm2R7hlhQ==
X-Received: by 2002:a05:6870:796:b0:da:3d6a:101d with SMTP id en22-20020a056870079600b000da3d6a101dmr1762589oab.20.1654781783598;
        Thu, 09 Jun 2022 06:36:23 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id l17-20020a056830155100b0060c0b3c1b2asm3636928otp.33.2022.06.09.06.36.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 06:36:22 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id bl34so324736oib.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 06:36:22 -0700 (PDT)
X-Received: by 2002:a05:6808:150f:b0:32b:888:f534 with SMTP id
 u15-20020a056808150f00b0032b0888f534mr1665892oiw.223.1654781782266; Thu, 09
 Jun 2022 06:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com> <20220609090843.16423-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220609090843.16423-3-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 9 Jun 2022 15:36:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCvJzJtZGW0W2BLfh224BNzin9YEmMobiUwvMR0htc89GA@mail.gmail.com>
Message-ID: <CANiDSCvJzJtZGW0W2BLfh224BNzin9YEmMobiUwvMR0htc89GA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] media: uvcvideo: Add support for per-device
 control mapping overrides
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 9 Jun 2022 at 11:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Ricardo Ribalda <ribalda@chromium.org>
>
> Some devices do not implement all their controls in a way that complies
> with the UVC specification. This is for instance the case for several
> devices that do not support the disabled mode for the power line
> frequency control. Add a mechanism to allow per-device control mapping
> overrides to avoid errors when accessing non-compliant controls.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>
> - Turn the power line quirk into a control mapping overrides array
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 27 +++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h |  1 +
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 95fdd41ab20b..e4826a846861 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2444,14 +2444,37 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>         if (!ctrl->initialized)
>                 return;
>
> -       /* Process common mappings first. */
> +       /*
> +        * First check if the device provides a custom mapping for this control,
> +        * used to override standard mappings for non-conformant devices. Don't
> +        * process standard mappings if a custom mapping is found. This
> +        * mechanism doesn't support combining standard and custom mappings for
> +        * a single control.
> +        */
> +       if (chain->dev->info->mappings) {
> +               bool custom = false;
> +               unsigned int i;
> +
> +               for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
> +                       if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> +                           ctrl->info.selector == mapping->selector) {
> +                               __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +                               custom = true;
> +                       }
> +               }
> +
> +               if (custom)
> +                       return;
> +       }
> +


 If there is a custom mapping you are overwriting the variable
mapping, the next loop will iterate with no limit.....
This is, you need:
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 362f84e280d6..c26b0b9fd36b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2493,9 +2493,8 @@ static void uvc_ctrl_init_ctrl(struct
uvc_video_chain *chain,
 {
        const struct uvc_control_info *info = uvc_ctrls;
        const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
-       const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
-       const struct uvc_control_mapping *mend =
-               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+       const struct uvc_control_mapping *mapping;
+       const struct uvc_control_mapping *mend;
        const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;

        /* XU controls initialization requires querying the device for control
@@ -2551,6 +2550,8 @@ static void uvc_ctrl_init_ctrl(struct
uvc_video_chain *chain,
        }

        /* Process common mappings next. */
+       mapping = uvc_ctrl_mappings;
+       mend =  mapping + ARRAY_SIZE(uvc_ctrl_mappings);
        for (; mapping < mend; ++mapping) {
                if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
                    ctrl->info.selector == mapping->selector)


with that in place it works fine with a device with a quirk and a
device without a quirk


> +       /* Process common mappings next. */
>         for (; mapping < mend; ++mapping) {
>                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>                     ctrl->info.selector == mapping->selector)
>                         __uvc_ctrl_add_mapping(chain, ctrl, mapping);
>         }
>
> -       /* And then version-specific mappings. */
> +       /* Finally process version-specific mappings. */
>         if (chain->dev->uvc_version < 0x0150) {
>                 mapping = uvc_ctrl_mappings_uvc11;
>                 mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index d2eb107347ea..24c911aeebce 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -668,6 +668,7 @@ struct uvc_device_info {
>         u32     quirks;
>         u32     meta_format;
>         u16     uvc_version;
> +       const struct uvc_control_mapping **mappings;
>  };
>
>  struct uvc_device {
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
