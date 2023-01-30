Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8B7681FB6
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 00:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjA3XeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 18:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjA3XeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 18:34:01 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770D33AA2
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:34:00 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id x4so16137591ybp.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LY2vkLkf4C8ICSzbwkb0+hMBf0H+P/zs5ftavDuD/PQ=;
        b=MOoCe4vDVr9+rpZ3Y6fUHXTQH/N3TbzxzROU/G+HsNjrmtRyRgdjeN7VcqTlqeYUiK
         YGfNPNC1TinctA+k0bhrIsHzeoG+r273XXzVwYjStbxOa6FEyVY6uKpE6mRbDGG7XFCT
         wpwSYJDqmuXrvY//eEkXe09uJf2r/uTD6taOMlKL/f6hmBUPeWVR3pdXe5dOC99XmGi7
         ljlFOZ9OGPi1VNWv6XMdwZa+zpezoW/0GJJ6MM6ARsvCN79LMrO80fXO1s8Jm/JJTKvn
         iFY7zWbFybqclAi1GPK34kKi7riM3q9RC/3BclNWVyd3K7irslB6qtG8VHD1x6E4tdb3
         u7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LY2vkLkf4C8ICSzbwkb0+hMBf0H+P/zs5ftavDuD/PQ=;
        b=6pJmk7XTRVP2QgwoOLZIKBr4DxX0Pu+/ntOxAXjTXarESN1gwjKa+yiqjppVCIdKoh
         LcgXtYFnDmZRWkyrRcjxRBpJz0cHW7RGyJDIW9AXMKxDi8/p7OCTqmcmEQUg7AV5toZb
         JgnH2x/Xemz4kTyJCTJOEwQAWNjJfeSNwaBnAAxNAPr7EMFf08S1c7fYtWCAQSNomfAd
         t7GUj96FlGFKND4mpgYrepmF0EXGcR36h+IPixupfOmrWModTy2RAqlkcJFOk9GI/0xa
         OCbiJGYwFridAbIU3f37Scs7CTMlghBY9UOwelnqwjxTFcZ9BY4CJzoqWZqPv9sDI2fz
         3lEA==
X-Gm-Message-State: AFqh2kqa9wlKD+bNoZ/azCN35qNwsB6gN7HUo/NGCR46kKj7aVAuWNBO
        TZBeiN62YP7uT25xQ8uczSOyxc21gQHKGpMw+YF/0eno1+JFTw==
X-Google-Smtp-Source: AMrXdXuFNcmDGBpP4qgpRjli/LKwkx/Fy6D5T3a7vI8aLV0cdQTZZpW+hA4W7KajnLoJlKm9eaI39+627Oa0YB3wlYg=
X-Received: by 2002:a25:9f06:0:b0:7ea:7935:dc64 with SMTP id
 n6-20020a259f06000000b007ea7935dc64mr6371597ybq.337.1675121639654; Mon, 30
 Jan 2023 15:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl> <20230126150657.367921-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230126150657.367921-3-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 30 Jan 2023 23:33:33 +0000
Message-ID: <CA+V-a8vCKiYMmFroGWU6FnSdSogkD9NLOdfyroYzskBxCfVR0g@mail.gmail.com>
Subject: Re: [PATCH 02/17] media: davinci/vpif.c: drop unnecessary cast
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Jan 26, 2023 at 3:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> DEFINE_RES_IRQ_NAMED already casts to (struct resource), so no
> need to do it again.
>
> This fixes a sparse warning:
>
> vpif.c:483:20: warning: cast to non-scalar
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>  drivers/media/platform/ti/davinci/vpif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
> index da27da4c165a..832489822706 100644
> --- a/drivers/media/platform/ti/davinci/vpif.c
> +++ b/drivers/media/platform/ti/davinci/vpif.c
> @@ -480,7 +480,7 @@ static int vpif_probe(struct platform_device *pdev)
>                 ret = irq;
>                 goto err_put_rpm;
>         }
> -       res_irq = (struct resource)DEFINE_RES_IRQ_NAMED(irq, of_node_full_name(pdev->dev.of_node));
> +       res_irq = DEFINE_RES_IRQ_NAMED(irq, of_node_full_name(pdev->dev.of_node));
>         res_irq.flags |= irq_get_trigger_type(irq);
>
>         pdev_capture = kzalloc(sizeof(*pdev_capture), GFP_KERNEL);
> --
> 2.39.0
>
