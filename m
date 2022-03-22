Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EA04E3E9D
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 13:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbiCVMlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 08:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234949AbiCVMlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 08:41:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3BD85960
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 05:40:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id p15so35901135ejc.7
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tk8Q45bHdMaMc+x2KQVChxZKg3UtMeERg8aZSfVpGWs=;
        b=n+Jdd22Bgq7ATlyt//him6vooPJEpd4htrk1OZIwiw2JVaiKk8V+WCwXRW7V5V4z65
         tpbzrqzXeyog8R4QOUDX/k0uxiqfGqZTtcFUftxcKTov0IMAQ2slOgLGqfZUl/QHFjLf
         MqZNnGCarzMQnxd6s5HmAZoFnxcI8z7fB1kKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tk8Q45bHdMaMc+x2KQVChxZKg3UtMeERg8aZSfVpGWs=;
        b=vQaFbPdPD4k1hLZ6kb/R1f/ZXOjYIR2AlqH0EIxKki1cE8QRuvEyyInQRcG1w3/os2
         mKTH/qN6NZN/TX4l3/zLutGqoTvRh+fizb317fMhVYo/f3YSA/8Hh292d91zmmL9V/Bi
         Ht7lFOyTLSveXEMy0ZljK0xbhrQ6VN+NGk7534WoujvK3+RYR0848c0u4bV3WLTNX6Kd
         Kb0p/UFXs1Tli8dIlYJwEpk9mpV4lNtLIPEpP1RdTmOsz+4BeQfewsvnD7Ina1NYFU3t
         Wora09mM7UM4F9pQQ3Kgaf3s9cL9Ayn439hkQ5HzDfkR665ap8pWrUpnuuAGq4YROFGA
         35DQ==
X-Gm-Message-State: AOAM532YweuuDKDgTlb1TTm1w15H/tA7TFNYECXA3mrkGo5bO42xQRyT
        xjoQmQTFQ1D533/Q66fkLm0MVPGxkQTd8w==
X-Google-Smtp-Source: ABdhPJzw6yAcrFvKyXiOTsJlzNCVoCzsR8Y77PYJ9d+7L+Sl6xuFLFS0GQeITEiX+Hut/VqT5RXw6A==
X-Received: by 2002:a17:906:a20c:b0:6ce:a87e:5013 with SMTP id r12-20020a170906a20c00b006cea87e5013mr24425580ejy.379.1647952821017;
        Tue, 22 Mar 2022 05:40:21 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm8201831ejh.204.2022.03.22.05.40.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 05:40:19 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id qx21so35813084ejb.13
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 05:40:19 -0700 (PDT)
X-Received: by 2002:a17:906:dc81:b0:6df:87eb:8340 with SMTP id
 cs1-20020a170906dc8100b006df87eb8340mr25709118ejc.435.1647952819044; Tue, 22
 Mar 2022 05:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220319102222.3079-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220319102222.3079-1-xiam0nd.tong@gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 22 Mar 2022 13:40:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCugwwNc8HjqNX2Mp8GdFN0s=jgPkT_2d4kiVygp=XZa4w@mail.gmail.com>
Message-ID: <CANiDSCugwwNc8HjqNX2Mp8GdFN0s=jgPkT_2d4kiVygp=XZa4w@mail.gmail.com>
Subject: Re: [PATCH] uvc: fix missing check to determine if element is found
 in list
To:     Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xiaomeng

Thanks for the patch. Maybe it would be better to just make a function
to find the ITERM entity with a given id?

Regards!

On Mon, 21 Mar 2022 at 16:33, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> The list iterator will point to a bogus position containing HEAD if
> the list is empty or the element is not found in list. This case
> should be checked before any use of the iterator, otherwise it will
> lead to a invalid memory access. The missing check here is before
> "pin = iterm->id;", just add check here to fix the security bug.
>
> In addition, the list iterator value will *always* be set and non-NULL
> by list_for_each_entry(), so it is incorrect to assume that the iterator
> value will be NULL if the element is not found in list, considering
> the (mis)use here: "if (iterm == NULL".
>
> Use a new value 'it' as the list iterator, while use the old value
> 'iterm' as a dedicated pointer to point to the found element, which
> 1. can fix this bug, due to 'iterm' is NULL only if it's not found.
> 2. do not need to change all the uses of 'iterm' after the loop.
> 3. can also limit the scope of the list iterator 'it' *only inside*
>    the traversal loop by simply declaring 'it' inside the loop in the
>    future, as usage of the iterator outside of the list_for_each_entry
>    is considered harmful. https://lkml.org/lkml/2022/2/17/1032
>
> Fixes: d5e90b7a6cd1c ("[media] uvcvideo: Move to video_ioctl2")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 711556d13d03..e7cdc01ad277 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -871,6 +871,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>         struct uvc_video_chain *chain = handle->chain;
>         const struct uvc_entity *selector = chain->selector;
>         struct uvc_entity *iterm = NULL;
> +       struct uvc_entity *it;
>         u32 index = input->index;
>         int pin = 0;
>
> @@ -878,22 +879,27 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
>             (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
>                 if (index != 0)
>                         return -EINVAL;
> -               list_for_each_entry(iterm, &chain->entities, chain) {
> -                       if (UVC_ENTITY_IS_ITERM(iterm))
> +               list_for_each_entry(it, &chain->entities, chain) {
> +                       if (UVC_ENTITY_IS_ITERM(it)) {
> +                               iterm = it;
>                                 break;
> +                       }
>                 }
> -               pin = iterm->id;
> +               if (iterm)
> +                       pin = iterm->id;
>         } else if (index < selector->bNrInPins) {
>                 pin = selector->baSourceID[index];
> -               list_for_each_entry(iterm, &chain->entities, chain) {
> -                       if (!UVC_ENTITY_IS_ITERM(iterm))
> +               list_for_each_entry(it, &chain->entities, chain) {
> +                       if (!UVC_ENTITY_IS_ITERM(it))
>                                 continue;
> -                       if (iterm->id == pin)
> +                       if (it->id == pin) {
> +                               iterm = it;
>                                 break;
> +                       }
>                 }
>         }
>
> -       if (iterm == NULL || iterm->id != pin)
> +       if (iterm == NULL)
>                 return -EINVAL;
>
>         memset(input, 0, sizeof(*input));
> --
> 2.17.1
>


-- 
Ricardo Ribalda
