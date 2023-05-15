Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4AC702C2B
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbjEOMCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241645AbjEOMCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:02:21 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577D826B9
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:00:38 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-619ca08c166so58508686d6.1
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684152015; x=1686744015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf2dV/uQOR+kagmoIZ54CT0MrE/3fIsluxNHuJjOuQg=;
        b=m9pCo+2JJvillefp3lWU6YInJexzOtzdeVt6Vh5rwcStaCY6kbHmVXXTnfym9c7QHz
         nWJ49krPxUP0ytBuzk/H+4zvh2BMAKW9rYEYpaXUB1NIyLdOkAtCOYvoajg9V04CT7z0
         prjv51BJUGX9UjBF91vF9pBx9hGQBwAiOxAT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152015; x=1686744015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kf2dV/uQOR+kagmoIZ54CT0MrE/3fIsluxNHuJjOuQg=;
        b=BR8q29YE4GwOkJVQBkZRtiC8c/mWpWw5wZ5XL87mZ7naWbmOCF5MyUGNSZ20zZ8N9L
         VrHl5PW60jVlQMXMN60zDsg/RX8lzMeSVwQnEYHl34vh/jKIx9w8MxLoCADPluxjGEyR
         jKYO9qbqrwcKOLfwqRfc1HWWVIca1U0HyUhK5mDXma0dy6PC+oV5Kxl9aIE93/SabCwN
         LTcPj7Ki4mOPABrtgOUoXi50QW3AnSntK6LxxdLUDf8knP7JlG/7iva7I7MrBTvWGLNS
         942Ww2i9hzfE7katbjrYz0JMn29XGRJYqcYNKL83S66BOCnmHJcv3ewmDg4T+CVDXMRp
         MuOQ==
X-Gm-Message-State: AC+VfDx3BISY8Czg/W0EGkqdR4E9MNPwTaV2X33ML0uNKSgORyp7QbLu
        g5KYmhBCcGbky5mk6SVJM5h/5BMj1VkSVJV0g3A=
X-Google-Smtp-Source: ACHHUZ5/prt0esEaWDMeuGAjpDrYVK7UyP+7zTqtt5P91qOP6kg3XXRi894StB9rq3pBw82OZMWzWQ==
X-Received: by 2002:a05:6214:21aa:b0:600:5dbc:c31a with SMTP id t10-20020a05621421aa00b006005dbcc31amr53016796qvc.7.1684152014750;
        Mon, 15 May 2023 05:00:14 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a146300b0074e0951c7e7sm7215662qkl.28.2023.05.15.05.00.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:00:14 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-757942bd912so387911485a.2
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:00:14 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:5ef:519:b27 with SMTP id q8-20020ad45ca8000000b005ef05190b27mr53571662qvh.35.1684152013844;
 Mon, 15 May 2023 05:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com> <20230506071427.28108-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230506071427.28108-4-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 14:00:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCtSUPQGD7hWfD88RLm-1VFLD8si6i2MbnooU+ofaj9V0w@mail.gmail.com>
Message-ID: <CANiDSCtSUPQGD7hWfD88RLm-1VFLD8si6i2MbnooU+ofaj9V0w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: uvcvideo: Use clamp() to replace manual implementation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
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

On Sat, 6 May 2023 at 09:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The kernel has a nice clamp() macro, use it to replace a manual
> implementation based on min() and max(). No functional change is
> intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1539eaf8f7d8..9e597bbbfe07 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -437,9 +437,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>                  */
>                 n -= frame->bFrameIntervalType ? 1 : 2;
>                 frame->dwDefaultFrameInterval =
> -                       min(frame->dwFrameInterval[n],
> -                           max(frame->dwFrameInterval[0],
> -                               frame->dwDefaultFrameInterval));
> +                       clamp(frame->dwDefaultFrameInterval,
> +                             frame->dwFrameInterval[0],
> +                             frame->dwFrameInterval[n]);
>
>                 if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
>                         frame->bFrameIntervalType = 1;
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
