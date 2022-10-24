Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA4F60B7D5
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 21:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbiJXTew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 15:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiJXTeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 15:34:18 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7132088A36
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 11:04:59 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id 137so8361234iou.9
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 11:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7s4qkz8Ht8W4T0VqWESJK92Fw334wnz7muMnBAFUEo=;
        b=gz3UJe/Etxv/Qr5cDhLVgp9LXgHQ4AHliglyz0CHoHU2uUPp3/YCtg2mp9Gycq+3cx
         EDYqu7sDyl13j6V97GFRfglAuCBAwuvmYpm+9N2J0DebqQvzygxiXmUReLZ5HcI3NguD
         bZYo/+Q3T6oEPX+vcN729+Vc1p/aVfM+QSlVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7s4qkz8Ht8W4T0VqWESJK92Fw334wnz7muMnBAFUEo=;
        b=4xlpoTiTqI3xgMIkR2s+zgraBfulikIdgxkKcleywOTH35J7ZRXquzbNr3FCaOnvcR
         f9swvmw7KvLLy9Q/n3k0+UlXY+RY5P9L+FvEIaCiFMvRHSkila8GUUUPPB/1pqRU6oMj
         Hb/edD4XytbL9rv15RII1yLb/uutFdIbF32eBgbIZ8uR4fLnldDR3uwiOEGCDnjQeUjC
         ImUN/6gYpgpFx2s7yPal45wQ2/LOKiaI73BGyVfAG7RQIWjfrlfysbAaLxlTNswM4t4u
         E1RcKPncuZrMzobd1jTDEg5ghBwr4ThaoL1L24DTa1UuyoJC7UaBMzP5Awh6AKvVdf8S
         u8+Q==
X-Gm-Message-State: ACrzQf0EbtDj1jN/Cj/rJZcKzaS47XqjEu3IciJVKS6pdFiVn5ZQw7UV
        3gqVFFtDsOgpkmwSkNI2PPuP5Znm/0nXfw==
X-Google-Smtp-Source: AMsMyM5zKbwlZMUUJpgQgnLhb7I/8tdnzP5MSk6SGnS90PWFMxuwG9rnw8fNwwCia17y/nm4iEn/YA==
X-Received: by 2002:a5d:8913:0:b0:6a4:71b5:8036 with SMTP id b19-20020a5d8913000000b006a471b58036mr19522758ion.171.1666634633520;
        Mon, 24 Oct 2022 11:03:53 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id q28-20020a05663810dc00b0036cc14af7adsm40514jad.149.2022.10.24.11.03.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 11:03:52 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id u2so5583519ilv.6
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 11:03:52 -0700 (PDT)
X-Received: by 2002:a92:c547:0:b0:2fa:d5f4:e9ed with SMTP id
 a7-20020a92c547000000b002fad5f4e9edmr20958367ilj.243.1666634631725; Mon, 24
 Oct 2022 11:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221024134932.2873081-1-yangyingliang@huawei.com>
In-Reply-To: <20221024134932.2873081-1-yangyingliang@huawei.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 24 Oct 2022 20:03:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCswa1UTGvw6_W0iz=ORGPcrDpmRyNf8e_fnO6Hf8-93wA@mail.gmail.com>
Message-ID: <CANiDSCswa1UTGvw6_W0iz=ORGPcrDpmRyNf8e_fnO6Hf8-93wA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix return value check in uvc_gpio_parse()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang

Good catch, luckily the only effect is whether the error message is
printed or not. But it has to be fixed.

On Mon, 24 Oct 2022 at 15:50, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> gpiod_to_irq() may return -EPROBE_DEFER, add a minus sign to fix it.
>
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 215fb483efb0..1e6bdd6104ef 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1267,7 +1267,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>
>         irq = gpiod_to_irq(gpio_privacy);
>         if (irq < 0) {
> -               if (irq != EPROBE_DEFER)
> +               if (irq != -EPROBE_DEFER)
>                         dev_err(&dev->udev->dev,
>                                 "No IRQ for privacy GPIO (%d)\n", irq);
>                 return irq;
> --
> 2.25.1
>


-- 
Ricardo Ribalda
