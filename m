Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA97056AFF2
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 03:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237132AbiGHBpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 21:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235510AbiGHBpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 21:45:52 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2646C735AF
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 18:45:52 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31caffa4a45so114517117b3.3
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPKPsTBtQ1qYmAaUID1H+HAQA0ysjVNja7d5ivjw5XU=;
        b=Y7kQMSNjUOTnCKwE7MeEy8H6SKTzBCf65cMYieY/7UxRDAM4MpCcEcaEHnxR7WlEVF
         4uW3helP0WS9yNrKzr7w9q9xJU0vSjByxniFsw8uxCawVPl2eosXbEZFHEQcfdlsP2rp
         gpvuSynAtn7lTHS3S//eU3Tl2Tz9EzlEXlCMIM/5jgwOCMoKmJ04VkNSBqmN4nUBqFk3
         I7IM20XKDz0dC5X5UL5IyqO/UvSEKVZqX3r3d/IQcNAPgIwvvg0OTXCD9spdIb33Gc20
         keqizUaJN8JElfw8gJCM7lrxffr22+8YoBN0jyeKbKVnVDSSsefB/G6LkKasecwm6LL2
         FRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPKPsTBtQ1qYmAaUID1H+HAQA0ysjVNja7d5ivjw5XU=;
        b=ES1UZrLX4m3wdLXxrWBDUxzdmo1S7oQubS4GPfe7zals7tIoVJOp3jQN8yfDSqjKP0
         2B7uq/PWy3rezWWe19FuTyEtARPTUmXRWlfPe+HvhutGciTa3Zx+jsqnvHuQZbxm+Q65
         eTY8njzm4Gap4mrITu+iAm7YWNliFlswgU5/KxOS9Ie2NZe5i2ReQ1og7CaH2DwYFAlE
         qXkkVM5ymeco1PXZB2jYzOGjccUxJi/eUPEu4NTDlfVZ1JgNXPvrEy5a5cmdTZeVSEFa
         q/VId9EoSn1NxsmSXA2yNSPLi/VlGTDMi6QNT+kvz/cIgo/RLCAwPJVYm42jQTt/+0vW
         4rPg==
X-Gm-Message-State: AJIora8Ogp96ywqjcIfrFG6cvVfQp6/+7w7BjfKDkyoEvGZaSCmiKiqP
        JtpBLNTo8qGhMd87rcDnkoSXe4Gw6UGtGwfoy34sBrsoHnbRfjEX
X-Google-Smtp-Source: AGRyM1t2P87zLH3wEKV5lmb2QVZQg5RWWfZfraATJL8LF6xpqAk3nE6eYAc4QJPRoh1o3xkMP/KnSp6nVABQDUVqKGE=
X-Received: by 2002:a81:3645:0:b0:31c:1d57:791f with SMTP id
 d66-20020a813645000000b0031c1d57791fmr1381086ywa.37.1657244751158; Thu, 07
 Jul 2022 18:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220707222455.21149-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220707222455.21149-1-laurent.pinchart@ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 8 Jul 2022 10:45:40 +0900
Message-ID: <CANqU6FeC2g-BXRD-5KwLHeTtJ_qtYOxpmCE6CgUMgVZ9K9npHA@mail.gmail.com>
Subject: Re: [PATCH v4] media: uvcvideo: Use entity get_cur in uvc_ctrl_set
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the change.

On Fri, Jul 8, 2022 at 7:25 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Yunke Cao <yunkec@google.com>
>
> Entity controls should get_cur using an entity-defined function
> instead of via a query. Fix this in uvc_ctrl_set.
>
> Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>
> - Reflow code in __uvc_ctrl_load_cur()
>
> Changelog since v2:
>
> - Move the logic of setting ctrl_data to 0 into load_cur.
> - Do not initialize ret=0.
> - Fix __uvc_ctrl_get() spacing.
> - Fix typo in the title.
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 83 ++++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0e78233fc8a0..44071040d764 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -963,35 +963,55 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
>         return value;
>  }
>
> +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> +                              struct uvc_control *ctrl)
> +{
> +       u8 *data;
> +       int ret;
> +
> +       if (ctrl->loaded)
> +               return 0;
> +
> +       data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT);
> +
> +       if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
> +               memset(data, 0, ctrl->info.size);
> +               ctrl->loaded = 1;
> +
> +               return 0;
> +       }
> +
> +       if (ctrl->entity->get_cur)
> +               ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
> +                                           ctrl->info.selector, data,
> +                                           ctrl->info.size);
> +       else
> +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> +                                    ctrl->entity->id, chain->dev->intfnum,
> +                                    ctrl->info.selector, data,
> +                                    ctrl->info.size);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       ctrl->loaded = 1;
> +
> +       return ret;
> +}
> +
>  static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> -       s32 *value)
> +                         struct uvc_control *ctrl,
> +                         struct uvc_control_mapping *mapping,
> +                         s32 *value)
>  {
>         int ret;
>
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
>                 return -EACCES;
>
> -       if (!ctrl->loaded) {
> -               if (ctrl->entity->get_cur) {
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
> -
> -               ctrl->loaded = 1;
> -       }
> +       ret = __uvc_ctrl_load_cur(chain, ctrl);
> +       if (ret < 0)
> +               return ret;
>
>         *value = __uvc_ctrl_get_value(mapping,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> @@ -1783,21 +1803,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>          * needs to be loaded from the device to perform the read-modify-write
>          * operation.
>          */
> -       if (!ctrl->loaded && (ctrl->info.size * 8) != mapping->size) {
> -               if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
> -                       memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               0, ctrl->info.size);
> -               } else {
> -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> -                               ctrl->entity->id, chain->dev->intfnum,
> -                               ctrl->info.selector,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> -                               ctrl->info.size);
> -                       if (ret < 0)
> -                               return ret;
> -               }
> -
> -               ctrl->loaded = 1;
> +       if ((ctrl->info.size * 8) != mapping->size) {
> +               ret = __uvc_ctrl_load_cur(chain, ctrl);
> +               if (ret < 0)
> +                       return ret;
>         }
>
>         /* Backup the current value in case we need to rollback later. */
> --
> Regards,
>
> Laurent Pinchart
>

Reviewed-by: Yunke Cao <yunkec@google.com>

Best,
Yunke
