Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC07D63D28C
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 10:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiK3Jyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 04:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiK3Jyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 04:54:41 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4278828E1E;
        Wed, 30 Nov 2022 01:54:40 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id p18so11839844qkg.2;
        Wed, 30 Nov 2022 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3pFP5eHdwJ8xVAduEA55Vvy3vc6xPFygfrMRPcVO4g=;
        b=cFd2XMo7xtVe4naxkm1MTsoM0ZcNPnt4JkdNZHdvnnH4gEJH428WDQ7I8TJET/J/ng
         XfZyQn2Wsh6xP8aFp8oz23GzQvYvcQhg76DUgi4tyHuuOpInydmLoYQ6XhUlAJEJKQVI
         NadRyHH4LntgyUgtMgTO6ZBcgxXXd8xFxJ2jwIdtzXuHZypp+TS9E8AR63gffi5pmuab
         LelNQi23s05AAzMB03IzOWRfy7Rb7qiErNG7zNXXsvUCirtuJuTceJG+Nr+Cv9pOc1jE
         xIHAH0iSW1a0RK3Vjci/mu762gCJzfotrg6dqQZh2N+yqeernxYuv4i3j5WhBr+2lqFg
         P4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3pFP5eHdwJ8xVAduEA55Vvy3vc6xPFygfrMRPcVO4g=;
        b=a2IVI6HC/owLRfmQ3ggb0HJFkg3BU4x+fWLqewlx1ejqGATx19kdC4qE8D029tULsM
         4LA2ebqYR2NkUB4tmV6RrnUgy8dYJ5NcsfgQk+F9z89JIFi7MhHnW5XlpcCt0ROcQp8M
         a1WqtyqCDXjc9+eSi/tE2r75UxEt/XWdhwSN6ZjcAkWRPa5fWT+uEHXMGORJaEMw/bBX
         XJxxEWPPPZYFnFNNj5u9G73McQTFCGSXxzRqr6EqMo8T25EFE/6aRloJLigpSRMi3Q8F
         VZla90mKWW7u1OkIMqPIqhLXSOcaGq0NwTvcHaK5MdCnp2vLOcJVOGEfUPiavKkTstHs
         NL0A==
X-Gm-Message-State: ANoB5pn/5HspLGejsQ9XUCuZLvCOrqcwQS9od9Fk+/BPN/sAOuC+OMu0
        y3/0dj/Z8a8ODIcPdDmxmf0XO8K96jy/WtgDEP8FIpT2Ci2Vag==
X-Google-Smtp-Source: AA0mqf6yk2iYPuxsrlh94TezuS5tzutL/JB+h25HtZxLkaDACcVxSDkbv9Z0JmtCtjfLB2eyqhwQDf95KZ8/wMJN4CQ=
X-Received: by 2002:a37:b404:0:b0:6fa:4a82:1152 with SMTP id
 d4-20020a37b404000000b006fa4a821152mr55538969qkf.504.1669802079321; Wed, 30
 Nov 2022 01:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-4-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Nov 2022 11:54:03 +0200
Message-ID: <CAHp75VfZ2Lk-AaQDazaUJARiHrGrMH46d5La7qwVTU8fkDiPAQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] platform/x86: int3472/discrete: Treat privacy LED as
 regular GPIO
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
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

On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
> X1 Nano gen 2 there is no clock-enable pin, triggering the:
> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
> LED to not work.
>
> Fix this by treating the privacy LED as a regular GPIO rather then
> integrating it with the registered clock.
>
> Note this relies on the ov5693 driver change to support an (optional)
> privacy-led GPIO to avoid the front cam privacy LED regressing on some
> models.

...

> -       case INT3472_GPIO_TYPE_PRIVACY_LED:
> -               gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
> -               if (IS_ERR(gpio))
> -                       return (PTR_ERR(gpio));
>
> -               int3472->clock.led_gpio = gpio;
> -               break;

I'm not sure how the previous patch makes this one work without
regressions. We have a "privacy-led" GPIO name there and here it used
to be with a prefix. Maybe I'm missing something...

-- 
With Best Regards,
Andy Shevchenko
