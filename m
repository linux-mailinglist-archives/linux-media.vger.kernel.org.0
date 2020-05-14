Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B351D30C8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 15:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgENNM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 09:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726763AbgENNM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 09:12:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77418C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 06:12:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 50so3988134wrc.11
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npgQi9gfzI+vqce3nXjJa+yPHqXwLMPWXp8Y51T6pJU=;
        b=CZkeI7DX6voMS4uA9Y3/+UBBVJq7vaOZ4yvKmLHn97i66myLGSCpK6are538wqrdyS
         MOAM1TUtG5qNn9BIRzQP3GBsyXXgK2MkxaMDjdQznWHT1ZVYR0HjXRsFGquEMWxJOYnV
         BRkn5sURIMUoNhouZ0yVN37Q2fHIHxp99oi1gQNOtYoKIt9DSfZ6tqExPkihcFf/kJwD
         P4Gh1j57hg6KPg1dYTcC+5pdsk65u/RdUqd+7LSOVKXJYgY/xT3L5BDUhWU6ePBOXVWr
         0f6tJx39vvHSsBpI88bJ4aqYC2y9sbFbc5fFhd8/lgNX5eA40Eln+Pqp1VYKK0KyShqy
         Bh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npgQi9gfzI+vqce3nXjJa+yPHqXwLMPWXp8Y51T6pJU=;
        b=fvm0dwbWTdM5XghsbRulEylSigr9pZsUzIIXdRNqrbgCqBh0sJqvBoejJOJaP1DrdB
         HiOX80lqUHjEZcYeqZLHgVXNcfLejyEy9lJNobQQ48m4hPOmy6cedklVuzzuMcimaZ+1
         hqAJJ4oDAEZAi9dYwFz34l4nt4HcX66eBPuy0swRsD6R+xVw1C3WgNoFoHltLci5sznF
         VMUi1ejyjl2PoD8vxozYJML3iX7lXLPftVHewLFkmXdAyBjwplvEl8koII3rx3vORP8o
         PvrAMwAXmVwL/e2LYZWGYrPgMwZHqDnu/PJlK+LYR8abfJNZO/QDGZbGaAaWazvlAWE6
         1ZSg==
X-Gm-Message-State: AOAM530ksUKPJiDXO9Qizj6VYLFW9M426VHyD+RX9tXIO6Kig+WmKPhC
        e0NBagxpe54v2fOHCrO22UT8B1QVshomjScH6BK6uw==
X-Google-Smtp-Source: ABdhPJxFWRfw7frnpjdcK38CKzL25GKS46O57jSHWs+DZytaKz3MplfFifGGGpb+8BG54zgJ74HDgfU9Nzo9WHizw5U=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr5159530wru.47.1589461977273;
 Thu, 14 May 2020 06:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200506120304.31550-1-geert+renesas@glider.be>
In-Reply-To: <20200506120304.31550-1-geert+renesas@glider.be>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 14 May 2020 14:12:40 +0100
Message-ID: <CAPY8ntDwffdgQadkBLSdJr0q7nThFHEBO_nPmja1EUVhnRa7YQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 6 May 2020 at 13:03, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> The IMX219 camera driver is not a clock provider, but merely a clock
> consumer, and thus does not need to include <linux/clk-provider.h> and
> <linux/clkdev.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'm no expert on the clock frameworks, but that seems logical.
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

The same appears to be true for drivers/media/i2c/ov5640.c unless it's
been fixed since 5.7-rc5.

> ---
>  drivers/media/i2c/imx219.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cb03bdec1f9c8954..078f2093d881d7c2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -15,8 +15,6 @@
>   */
>
>  #include <linux/clk.h>
> -#include <linux/clk-provider.h>
> -#include <linux/clkdev.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> --
> 2.17.1
>
