Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8F4435C87
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 09:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhJUIBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 04:01:47 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:38884 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhJUIBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 04:01:46 -0400
Received: by mail-ua1-f41.google.com with SMTP id h19so11563580uax.5;
        Thu, 21 Oct 2021 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JqD7D3pbeGKTvxzUJ9i8K7JJYOkSeWMS6MSFRPQ+gGI=;
        b=tW9lLHgCHZ8rZuhtVnntIFE6GyW27SRrNvXKWErYz+KB+BhYykLvxgk2S3NDwHhJ1J
         0scKg2Ecdge4BrIetLbhqzMvt5Tc5ZQlc4cX8IyJRph5qnPKCVm6gbb9TrRrD0udNe/L
         VlCDotj+cStUPcmD1NFhWTQ259ZXjO5xEoB9thkqdkL2Q6pzHnFPrLnQE5OW0GbZYy3H
         b7lBPTIpmvoorag6lH7WrkLtYFoVQ5U7t6J8zoufOoJXJu757jSQz9YMtNw1MhuqVRsg
         j2UlYRNTtQKz4XiiGbqLkh/CnWMowdAGg4Yr1QYHEfzzxuyAEVNmSmQKyJ7M4BC0+X5W
         7L3A==
X-Gm-Message-State: AOAM533Usr2vnZ6nJQE+xWgVaJNu+1Pqwagx/pi8HJ8i5HkGjZVwP9yq
        6KKjP1iLKWBOU3JLFAJInnMJ/4zObZ1Q8w==
X-Google-Smtp-Source: ABdhPJwg6PWPU4n9FHepey5GHZsDOBg4NW389GQeglcjtsnQydzCz+uXSETymOJHPMfF7irD9TlTTw==
X-Received: by 2002:a67:e15b:: with SMTP id o27mr4329457vsl.22.1634803170400;
        Thu, 21 Oct 2021 00:59:30 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id u13sm2646960vsl.11.2021.10.21.00.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 00:59:30 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id h4so11622088uaw.1;
        Thu, 21 Oct 2021 00:59:29 -0700 (PDT)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr4686380uam.14.1634803169371;
 Thu, 21 Oct 2021 00:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211021030938.51884-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20211021030938.51884-1-tangbin@cmss.chinamobile.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 09:59:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD+FXt-rUz6oiU9MNq3EiKExgic17kCnUjynidii470w@mail.gmail.com>
Message-ID: <CAMuHMdWD+FXt-rUz6oiU9MNq3EiKExgic17kCnUjynidii470w@mail.gmail.com>
Subject: Re: [PATCH] media: rcar_fdp1: Fix the correct variable assignments
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tang,

Thanks for your patch!

On Thu, Oct 21, 2021 at 5:10 AM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
> In the function fdp1_probe(), when get irq failed, the
> function platform_get_irq() log an error message, so
> remove redundant message here. And the variable type
> of "ret" is int, the "fdp1->irq" is unsigned int, when
> irq failed, this place maybe wrong, thus fix it.

The second issue is not actually present, as the error check
operates on ret, not fdp1->irq?

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2289,11 +2289,10 @@ static int fdp1_probe(struct platform_device *pdev)
>                 return PTR_ERR(fdp1->regs);
>
>         /* Interrupt service routine registration */
> -       fdp1->irq = ret = platform_get_irq(pdev, 0);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "cannot find IRQ\n");
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret < 0)
>                 return ret;
> -       }
> +       fdp1->irq = ret;
>
>         ret = devm_request_irq(&pdev->dev, fdp1->irq, fdp1_irq_handler, 0,
>                                dev_name(&pdev->dev), fdp1);

Anyway, the code is correct, so:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
