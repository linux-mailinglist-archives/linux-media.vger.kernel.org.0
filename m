Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C786581266
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 13:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbiGZLxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 07:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiGZLxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 07:53:08 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCAC32ED1
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 04:53:07 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w5so4994179edd.13
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bwS+khpv6EP4aP4FNRns/an4h1UZJr+LY6V08kFcBJs=;
        b=itFwoXNz87xEBalMCM912KZ7R+ECxy7184LlPjabNYEKTz/OMrS+qwg0btDyvOlQ30
         8ya3+WvvjD9kyxes/e98UrwOj+s58qX/7zAAWLjUDhf4FALRX34l+O591rQLWQciBeqi
         Cp6Ssa/At0S4bubpLfzF1ZpGb7D+6y+Xw+E1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bwS+khpv6EP4aP4FNRns/an4h1UZJr+LY6V08kFcBJs=;
        b=FNFGCXPUtBFX7Og5HtKUZGYJMP17Q2kXtwbKeOvUOplrLXD68LDhC4y2ZxERdWz2qa
         RF1kdLWUywAm3RMCJBbAKdL48iaGobANTX6SGTD8+MrkeghPKd7LE8amq35d+sk9GjXO
         7t8XfG+RcTMlTHcWVSnCXVFPfUUlJnN01ixbDj0F7CkvOZyUpcqRDVOV7ojZAB1SVKnt
         SgCI2ZvPjUpUnb9/zjfAM0BNjWTU3SkVWicK0uKdzI7QYCMl6TGlZQSpE7nYImMXJsuX
         OGF/KKk4q6Lz86wEoXvEe1GMWmFNOO5RVen+kZH4BJzeIhEbe/5Z6jGa238R5W1crqbN
         9Gtw==
X-Gm-Message-State: AJIora8HSPZrfLl1VM7kVUB4TNeZZeesw5duElwWmip1/2W9+y6O/YSt
        CyIP5EI/SYPJM595y1S5zjxU7VrPzePnqA==
X-Google-Smtp-Source: AGRyM1t3ukf3/53tjoC2LB8fHQSd7KxwpRsv+iA+0JbMiBC2pLJs8/dJ9DW4itdYpg9WlMwxwdZG6Q==
X-Received: by 2002:aa7:d857:0:b0:43b:ce0a:98ca with SMTP id f23-20020aa7d857000000b0043bce0a98camr17980518eds.412.1658836385675;
        Tue, 26 Jul 2022 04:53:05 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b00726b8e84c1asm6432633ejt.21.2022.07.26.04.53.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:53:05 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id c12so10044858ede.3
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 04:53:04 -0700 (PDT)
X-Received: by 2002:a05:6402:34c8:b0:43b:e7b1:353c with SMTP id
 w8-20020a05640234c800b0043be7b1353cmr13020112edc.171.1658836384655; Tue, 26
 Jul 2022 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220718222757.8203-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220718222757.8203-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Jul 2022 13:52:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCsNnefj1Wyj33QX56MQ8VBZhbyvX2+=geDEnSPgaRro3w@mail.gmail.com>
Message-ID: <CANiDSCsNnefj1Wyj33QX56MQ8VBZhbyvX2+=geDEnSPgaRro3w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Use indexed loops in uvc_ctrl_init_ctrl()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

it definitely looks nicer :)

Thanks!

On Tue, 19 Jul 2022 at 00:28, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> As shown by the bug introduced in commit 86f7ef773156 ("media: uvcvideo:
> Add support for per-device control mapping overrides"), the loop style
> used by uvc_ctrl_init_ctrl() is error-prone. Rewrite the loops to use
> indices instead.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
> This patch depends on https://lore.kernel.org/linux-media/20220718121219.16079-1-laurent.pinchart@ideasonboard.com
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 34 ++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 8c208db9600b..5c33b0b7ef9a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2411,10 +2411,9 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>  static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>                                struct uvc_control *ctrl)
>  {
> -       const struct uvc_control_info *info = uvc_ctrls;
> -       const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> -       const struct uvc_control_mapping *mapping;
> -       const struct uvc_control_mapping *mend;
> +       const struct uvc_control_mapping *mappings;
> +       unsigned int num_mappings;
> +       unsigned int i;
>
>         /*
>          * XU controls initialization requires querying the device for control
> @@ -2425,7 +2424,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>         if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
>                 return;
>
> -       for (; info < iend; ++info) {
> +       for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
> +               const struct uvc_control_info *info = &uvc_ctrls[i];
> +
>                 if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
>                     ctrl->index == info->index) {
>                         uvc_ctrl_add_info(chain->dev, ctrl, info);
> @@ -2452,9 +2453,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>          */
>         if (chain->dev->info->mappings) {
>                 bool custom = false;
> -               unsigned int i;
>
> -               for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
> +               for (i = 0; chain->dev->info->mappings[i]; ++i) {
> +                       const struct uvc_control_mapping *mapping =
> +                               chain->dev->info->mappings[i];
> +
>                         if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>                             ctrl->info.selector == mapping->selector) {
>                                 __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> @@ -2467,10 +2470,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>         }
>
>         /* Process common mappings next. */
> -       mapping = uvc_ctrl_mappings;
> -       mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +       for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> +               const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>
> -       for (; mapping < mend; ++mapping) {
>                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>                     ctrl->info.selector == mapping->selector)
>                         __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> @@ -2478,14 +2480,16 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>
>         /* Finally process version-specific mappings. */
>         if (chain->dev->uvc_version < 0x0150) {
> -               mapping = uvc_ctrl_mappings_uvc11;
> -               mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
> +               mappings = uvc_ctrl_mappings_uvc11;
> +               num_mappings = ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
>         } else {
> -               mapping = uvc_ctrl_mappings_uvc15;
> -               mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
> +               mappings = uvc_ctrl_mappings_uvc15;
> +               num_mappings = ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
>         }
>
> -       for (; mapping < mend; ++mapping) {
> +       for (i = 0; i < num_mappings; ++i) {
> +               const struct uvc_control_mapping *mapping = &mappings[i];
> +
>                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>                     ctrl->info.selector == mapping->selector)
>                         __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> --
> Regards,
>
> Laurent Pinchart
>


--
Ricardo Ribalda
