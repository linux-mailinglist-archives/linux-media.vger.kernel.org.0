Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FD0447E3A
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 11:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbhKHKs4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 8 Nov 2021 05:48:56 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:42589 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238640AbhKHKsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 05:48:55 -0500
Received: by mail-vk1-f182.google.com with SMTP id b125so7960271vkb.9;
        Mon, 08 Nov 2021 02:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LFz9q9vf1rJJTJnPH2rWFkKI5M8ykBsvOOUc6VCwHFI=;
        b=HvOJxdQuRhi6pJI4cekalYUUbAH+ZUeBlpVAu67b2gErmMfyFERH8vZh1U8MGwlNlC
         /1q7S0ivmo3nFMgZMvm7ibDjQ0zPRzFDQjPt85Kdr46g2u5oUYm1l/Bze7MLG1HqOino
         zXxDK3ky9glJ2HuHH2+iAz6NGg/PotNqJzstpBUDC39rP3ICdne1W+la/qzxOyN76MgU
         Upz9cJPDB+1QQz3qtp6Idrlo/gd1qZBJUJVNSasUXNt2ZQc2YNPOdu7cWEey4lbUDs8c
         5npbIu20suwhsisVw5jpvGThSj/2i2XYHZjpJQ1ZnYenf+v78uTolxR+tjaTePRjeS02
         zU6Q==
X-Gm-Message-State: AOAM530HmcgyiLtedogtpXovdXuP1szHOAaLhgfE8oNKWkBSJrfz8DEZ
        AGBmhBzhBM2b+rj3XQtaTqDbi+3EQpjhkg==
X-Google-Smtp-Source: ABdhPJwtgoKr6t8DwYwEAxVuYiKLyD8nw1oXGQEPNAwZ6B8lSqKplvLqEN3h2wXldjml/Df7vB/BWQ==
X-Received: by 2002:a05:6122:997:: with SMTP id g23mr6008894vkd.15.1636368370335;
        Mon, 08 Nov 2021 02:46:10 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id l6sm2552482vkd.16.2021.11.08.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 02:46:10 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id l43so30529162uad.4;
        Mon, 08 Nov 2021 02:46:09 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr19082120vst.37.1636368369654;
 Mon, 08 Nov 2021 02:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org> <20211104110924.248444-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20211104110924.248444-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 11:45:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF2fU4UTZTe_xjJUg7khUwhT_1kHQq49rbzZJygbpbow@mail.gmail.com>
Message-ID: <CAMuHMdVF2fU4UTZTe_xjJUg7khUwhT_1kHQq49rbzZJygbpbow@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: max9271: Ignore busy loop read errors
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Nov 4, 2021 at 12:10 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Valid pixel clock detection is performed by spinning on a register read
> which if repeated too frequently might fail. As the error is not fatal
> ignore it instead of bailing out to continue spinning until the timeout
> completion.
>
> Also relax the time between bus transactions and slightly increase the
> wait interval to mitigate the failure risk.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>
> v1->v2:
> - Do not continue but jump to a label to respect the sleep timout after a
>   failed read

Thanks for the update!

> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
>  /*
>   * max9271_pclk_detect() - Detect valid pixel clock from image sensor
>   *
> - * Wait up to 10ms for a valid pixel clock.
> + * Wait up to 15ms for a valid pixel clock.
>   *
>   * Returns 0 for success, < 0 for pixel clock not properly detected
>   */
> @@ -64,15 +64,16 @@ static int max9271_pclk_detect(struct max9271_device *dev)
>         unsigned int i;
>         int ret;
>
> -       for (i = 0; i < 100; i++) {
> +       for (i = 0; i < 10; i++) {
>                 ret = max9271_read(dev, 0x15);
>                 if (ret < 0)
> -                       return ret;
> +                       goto skip;

Edgar Dijkstra: Go To Statement Considered Harmful?

>
>                 if (ret & MAX9271_PCLKDET)

"if (ret > 0 && (ret & MAX9271_PCLKDET))"?

>                         return 0;
>
> -               usleep_range(50, 100);
> +skip:
> +               usleep_range(1000, 1500);
>         }
>
>         dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
