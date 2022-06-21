Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E50553AF3
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 21:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354105AbiFUT6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 15:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353085AbiFUT6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 15:58:48 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF99728E24
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 12:58:47 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f9-20020a9d2c09000000b0060bf1fa91f4so11438956otb.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hus04FdGBKK8AP3iVxkYFGBCXjWQQTrXqwxSeItGyo0=;
        b=S5rh2STYxP7KdMGTMLOjkHZB2hXSDuFjmRrfB9I4SVGR2qBRMxTFhQw2qKEQ3WFm8B
         XcaXBMJ0MU8fM63vRQ6CWP0G3rM0JaZ8DhAe+yYGlKQ49C2WZdeQyMJ4d8NEE5A01i02
         /ZYvujj37k+m451Cl2hL1DaUG7HR8b4qjfzbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hus04FdGBKK8AP3iVxkYFGBCXjWQQTrXqwxSeItGyo0=;
        b=qni248ovcsPS0CZyXR3GEArN8CH/tGVg9CKWfGv6V/NJ+A8a6u0ErnYs+6Y/ydHmjq
         f/JVGyZ6VevjzZNuHwV3CXoyGJMrEfUMfY41bsndcFYfqkKrCt4pyJn9HEYTlTnFCRre
         t7A88mdfgNaYeyS8anZA43AU0M5BjgVMCJ+hbPuao/7IJ0pWJQnBhQ3nnEAvkOGX1pKy
         vAPCN5Z3YZNiLIdFBXd10vD/HaAPgMunMMghfhUQ3Yhez04QVoN7NtpE59ixMV6ifZ+Y
         PSBgcOlC5Gy3d6fsmj8uHub+CeGMhYFIvIOyxGZi6ndKnbNb/cDBoEU+jUbXyL6rJ2D/
         q/PA==
X-Gm-Message-State: AJIora+hv7b4nEwQzqUZ0iFPKloPUi1YznwWEjA9nUMp3GqUYtOBXR5n
        5HM5wcXGH3zRlxHCOxpZ1a/NyGHKV0xtuQ==
X-Google-Smtp-Source: AGRyM1vM8i3dGoWNl+sS0TmX+ti3GOpnMPztIzVo2DnqRYGqwlORAQwD6bfVx2xylnrfvDB7UWiYSA==
X-Received: by 2002:a9d:1927:0:b0:60c:336b:5c48 with SMTP id j39-20020a9d1927000000b0060c336b5c48mr12141525ota.222.1655841526848;
        Tue, 21 Jun 2022 12:58:46 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id y2-20020a056870388200b000f3321caa73sm9487517oan.16.2022.06.21.12.58.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 12:58:46 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id i25so18445721oii.7
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 12:58:45 -0700 (PDT)
X-Received: by 2002:a05:6808:1896:b0:32f:6cec:af9f with SMTP id
 bi22-20020a056808189600b0032f6cecaf9fmr14650936oib.223.1655841524943; Tue, 21
 Jun 2022 12:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220621061532.3108909-1-yunkec@google.com>
In-Reply-To: <20220621061532.3108909-1-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 21 Jun 2022 21:58:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
Message-ID: <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
To:     Yunke Cao <yunkec@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
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

Hi Yunke

Thanks for your patch

Another way to do it could be:

__uvc_ctrl_load_cur() {
if (loaded)
   return
   if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
       memset
       loaded = true;
       return
  }
...
}

int __uvc_ctrl_get() {
if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
return -EACCES;
....
}

Then you could even simplify more the code in uvc_ctrl_set, and limit
the m handling of the loaded flag.


if ( (ctrl->info.size * 8) != mapping->size)
 ___uvc_ctrl_load_cur()


But It is probably just a matter of taste ;). It is up to you and
Laurent to pick what do you prefer.

Regards!


On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
>
> Entity controls should get_cur using an entity-defined function
> instead of via a query. Fix this in uvc_ctrl_set.
>
> Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changelog since v1:
> -Factored out common logic into __uvc_ctrl_load_cur().
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0e78233fc8a0..e25177c95571 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>         return value;
>  }
>
> -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -       s32 *value)
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +                              struct uvc_control *ctrl)
>  {
> -       int ret;
> +       int ret = 0;
nit :  why do you init to 0?
>
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
>
> -       if (!ctrl->loaded) {
> -               if (ctrl->entity->get_cur) {
nit: is this spaced properly?
> -                       ret = ctrl->entity->get_cur(chain->dev,
> -                               ctrl->entity,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> -               } else {
> -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                               ctrl->entity->id,
> -                               chain->dev->intfnum,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> -               }
> -               if (ret < 0)
> -                       return ret;
> +       if (ctrl->loaded)
> +               return 0;
>
> -               ctrl->loaded = 1;
> +       if (ctrl->entity->get_cur) {
> +               ret = ctrl->entity->get_cur(chain->dev,
> +                       ctrl->entity,
> +                       ctrl->info.selector,
> +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                       ctrl->info.size);
> +       } else {
> +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +                                    ctrl->entity->id, chain->dev->intfnum,
> +                                    ctrl->info.selector,
> +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                                    ctrl->info.size);
>         }
>
> +       if (ret < 0)
> +               return ret;
> +
> +       ctrl->loaded = 1;
> +
> +       return ret;
> +}
> +
> +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> +       s32 *value)
> +{
nit: Is the alignment correct here?
> +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> +
> +       if (ret < 0)
> +               return ret;
> +
>         *value = __uvc_ctrl_get_value(mapping,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>                                 0, ctrl->info.size);
>                 } else {
> -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                               ctrl->entity->id, chain->dev->intfnum,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
>                         if (ret < 0)
>                                 return ret;
>                 }
> --
> 2.37.0.rc0.104.g0611611a94-goog



-- 
Ricardo Ribalda
