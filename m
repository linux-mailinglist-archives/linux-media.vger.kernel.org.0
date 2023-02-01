Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5369F686CD3
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 18:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbjBARYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 12:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjBARY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 12:24:29 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEC277DEA
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 09:24:28 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 143so12999175pgg.6
        for <linux-media@vger.kernel.org>; Wed, 01 Feb 2023 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ4gk63LToCuSDUH/6EK6xaX1kBgO8Ejb/2RDU6gVvs=;
        b=kj3L6Beq6PcPoZqMWkoHDZdfQ5JjcXoRFNpr0/MOUzFqoT9RlYhkR1Dv8n/UuHXsFN
         uaQ9iniLQBFbVeaVYyvHgRW+kZDgVCyUvlshj0ccVLehz0VaUeclZi/p3hVItAZKOQBk
         O7lh/ky+wtTo3rhc8gCrcR9MHFyxfPaO45N4el3+0AiS62ndKAfZm//0bClgf7LC0JZW
         gUwbuwNsYCOj7UVJbWO1f1WwSQ5BLh1m0ImxDNM7w0+lKEYj8gWev8GVMozMST222cNE
         jEY7gb27ffLVHOJgZ7+u2TpPAPRUCRWb4STc9zSAWABj6YSKbE7awQHxuMvy7t2ndjd4
         /GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ4gk63LToCuSDUH/6EK6xaX1kBgO8Ejb/2RDU6gVvs=;
        b=AVRHiKCbvR1meCTotEjTWM2AE0vP4wJjRIyvVsZ/6/ICb78nCMvSa+F/6EW1OmGxRU
         RD5QsOSCbboErLKTYz05O4zewm+Eax7IIXZCj7ufPju+4Zaw/j2aZSsOBjoB8S6qwg/4
         6XO7du3S5j6/4lQMNyyCsIvd0rte3GhGU02oidnb6V0gTNx4mYJgUlcA5U7zTWyQ5n9W
         SyPhOr594w+3212R6e/cwg8LybKWTw+BpKOuiLA5BWevz5pST9fdIoH5QBxCbHyYmaRl
         +DZungVO1BfcMOPOUQQzi20GCER5BQNhoDGlx6kQap7AKhpBx2EyHzJ8tdXixIKnLKrr
         xWAA==
X-Gm-Message-State: AO0yUKWhe00T2SmQAjdIMhyov9n/eGMVo1vKBzOwIdBBv/d5Td7eHfJ+
        N5bh3x+N12lH30AyR99w+EhxgbmsNGQSs2z/bbNSRg==
X-Google-Smtp-Source: AK7set90UWFosYNGBdl3XnZox3OHXkp0JWRwDy4zr/pT39pNeg0ySvcYQ0fE6vha6vSNRUyUsrWy+QXylYFKpmREb/M=
X-Received: by 2002:aa7:94b9:0:b0:593:1253:2ff5 with SMTP id
 a25-20020aa794b9000000b0059312532ff5mr725570pfl.14.1675272267889; Wed, 01 Feb
 2023 09:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20230129-ov2685-improvements-v2-0-210400f2b63e@z3ntu.xyz> <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
In-Reply-To: <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 1 Feb 2023 17:24:10 +0000
Message-ID: <CAPY8ntDvviyCox5_WpmOcgMgHuok9LcF1NSgRkfcHFcSgGVuSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: i2c: ov2685: Make reset gpio optional
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca

On Wed, 1 Feb 2023 at 17:07, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> In some setups XSHUTDOWN is connected to DOVDD when it's unused,
> therefore treat the reset gpio as optional.

The binding doc [1] says that reset-gpios is a required property.
Making it optional should therefore have a patch for the binding
first, and then a patch updating the driver.
Unfortunately my understanding is that means converting it to YAML as
well due to the txt docs being frozen.

I know the pain - I was doing exactly the same thing for ov7251 earlier today.
I haven't run the dt schema checks or had them reviewed yet, but
"media: dt-bindings: Convert ov7251.txt to YAML" and "media:
dt-bindings: ov7251: Make enable-gpio optional" on [2] may be of help
to you.

  Dave

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/i2c/ov2685.txt#L10
[2] https://github.com/6by9/linux/commits/rpi-6.2.y-ov7251

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/i2c/ov2685.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> index a3b524f15d89..a422f4c8a2eb 100644
> --- a/drivers/media/i2c/ov2685.c
> +++ b/drivers/media/i2c/ov2685.c
> @@ -734,7 +734,7 @@ static int ov2685_probe(struct i2c_client *client,
>         if (clk_get_rate(ov2685->xvclk) != OV2685_XVCLK_FREQ)
>                 dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
>
> -       ov2685->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +       ov2685->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ov2685->reset_gpio)) {
>                 dev_err(dev, "Failed to get reset-gpios\n");
>                 return -EINVAL;
>
> --
> 2.39.1
>
