Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD08581299
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 14:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238105AbiGZMBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 08:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232819AbiGZMBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 08:01:13 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F2332EC3
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:01:11 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z15so5632558edc.7
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7j64NYTxwVHL5vg1hXNiMGW5cPlriIyDBY+ss11GeUM=;
        b=Ap5IfhZAgO8SUQ68kofCHLuAj6mxQBXWZ0J0LQVkGgq/ORiEQElEW13wlTz9bGn+1L
         BJTm6Ysr3c8Ti/f7CRNgdizHAB2NLN3GUVzGn9uRd6Wiw0tHQWb7aN4roSp+y5qEjqeG
         U5lnYy1+tRh/bdAAQYfI4J+BosQdTSF91/sGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7j64NYTxwVHL5vg1hXNiMGW5cPlriIyDBY+ss11GeUM=;
        b=RZbvfUHyCfuPTUMnhP4TbX8bdc2KC15Kxikp+CyAe4eT0uJLtGzpGEFXhj904sNFyj
         DlUb6NI/v0AtVfAjLVhsD1VZ6EYp+n46szKJEycynwSlWplroELejKvzxdcRJKxtm3p6
         wnOXE3mnLG68WOUH8h4XOPMBxnRcksVAA0pmP992Auoodp9R7+JPjBTsXGTOCmPUnviW
         cZ7eagmB3xJpFCaZ8Ae4ixpq0Sdc3us78Z6ATG5dQGmkbtfYbjJPtoulisPE4f3LSczP
         MKVGq/f3zzDBC9Ravnho/i2r25oArK3m1vY/6DhrZGALk3AXDh8DueKZy+tviLMX9mPQ
         klPQ==
X-Gm-Message-State: AJIora/unV8p2IM9dsQX0s3DD50RhXu5r8gOQ+MNDn9ev2exir30njTb
        Z+ss+9gPCL8YLxL2lPSyxysn2D/Gzq+gOw==
X-Google-Smtp-Source: AGRyM1vInhba+b3BYMcxW3sPBT2w9Ek6qcPs+ERmm2tAV3wVD8lmLGPEpigkEgS1yx7wa4WC7pZNyw==
X-Received: by 2002:a05:6402:3481:b0:43c:460:731c with SMTP id v1-20020a056402348100b0043c0460731cmr9428673edc.413.1658836869725;
        Tue, 26 Jul 2022 05:01:09 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id jw7-20020a170906e94700b00715705dd23asm6400337ejb.89.2022.07.26.05.01.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 05:01:09 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id m8so17412246edd.9
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:01:09 -0700 (PDT)
X-Received: by 2002:a05:6402:248f:b0:43a:b89c:20e3 with SMTP id
 q15-20020a056402248f00b0043ab89c20e3mr18232125eda.335.1658836868838; Tue, 26
 Jul 2022 05:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220718121219.16079-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220718121219.16079-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Jul 2022 14:00:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCuSW4et50rjNi33z4mwhy6fAnub1cXZFJ2wUKaOObTD8Q@mail.gmail.com>
Message-ID: <CANiDSCuSW4et50rjNi33z4mwhy6fAnub1cXZFJ2wUKaOObTD8Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix invalid pointer in uvc_ctrl_init_ctrl()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
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

Is this needed?

It is already part of v8

https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.321917-3-ribalda@chromium.org/

On Mon, 18 Jul 2022 at 14:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The handling of per-device mappings introduced in commit 86f7ef773156
> ("media: uvcvideo: Add support for per-device control mapping
> overrides") overwrote the mapping variable after it was initialized and
> before it was used, leading to usage of an invalid pointer for devices
> with per-device mappings. Fix it.
>
> Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e4826a846861..8c208db9600b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2413,9 +2413,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  {
>         const struct uvc_control_info *info = uvc_ctrls;
>         const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> -       const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
> -       const struct uvc_control_mapping *mend =
> -               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +       const struct uvc_control_mapping *mapping;
> +       const struct uvc_control_mapping *mend;
>
>         /*
>          * XU controls initialization requires querying the device for control
> @@ -2468,6 +2467,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>         }
>
>         /* Process common mappings next. */
> +       mapping = uvc_ctrl_mappings;
> +       mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +
>         for (; mapping < mend; ++mapping) {
>                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>                     ctrl->info.selector == mapping->selector)
>
> base-commit: 8bd1dbf8d580c425605fb8936309a4e9745a7a95
> prerequisite-patch-id: 89d2dc61eb83afb89fb075a63e161ea0b87fdcc7
> prerequisite-patch-id: 01354ee4b874fea1acc040a23badff034588362f
> prerequisite-patch-id: 7ae47f109892b89675acbdc0c6bcc1487436ec78
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
