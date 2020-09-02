Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D5C25B389
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 20:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgIBSPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 14:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIBSPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 14:15:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB00C061244;
        Wed,  2 Sep 2020 11:15:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so86489pgl.3;
        Wed, 02 Sep 2020 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vtl3n48D2RamTfu02tHfFlcVBwihiAAmXZsJlHdich8=;
        b=YHRR4fkOh6Yc/m9THnxBi/mTq4tR5Mj5/dkq5wm0RE7xXY9Uq1bDAIWBVjye3/ead4
         1JnCUs9J7Fy2kTJHMiMyBm0fr/eRsVaDP9Bs2DRgqmwB7xE9q1az316JY3pt7cLj2xpl
         +7wGvElgd5loHqkMZLvUJ8AU+8QuDBMWImTHp1fzU0dHj1M5vEfcmRc0HYY34vjXDAHP
         n6md8OPXT+UPj/NRfZtmuK+cGwdq6I3kkNBh0qLXgAWXDtVtlwCufkB45Iqy7qrp9pGa
         MXpezNLMUHkiNvSZf33JfV4/sBhRldlA3NizjYh37MF6qtofb4+kmM1dA66/p09LQxuO
         yH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vtl3n48D2RamTfu02tHfFlcVBwihiAAmXZsJlHdich8=;
        b=VDz9KjFzJcL2B5G3HIoNg9kpzHhTkrbfWupN3ZSBdLMA++MwMr90+t8iJ4ILWLJiWs
         BDJbetbwjXxfA0DIhS4EpJfe8XpEkbdMVo1b2ZUPuXR34eL3yhETpGFBgjVZT1XJ6oSj
         Ru4W+q5XRonlX9EEypULUa59mhPrFbKQ8j3fST7hGH3oG2icqib5ztwHZRY3Hk+0kiWL
         AMup6OyX4PSgIG+uj45prkgg1wXgcXnNMpZh61W+MBIwD4wTPhKHuj4+HOjfY8l26J/e
         4yW3ds4mN6QluMWj9dfy3B4FFm8B7ob3SydNlvY/vP9p1XKhpdiLeY3NSV6NTwoUZQGu
         DrBg==
X-Gm-Message-State: AOAM530AB3TQqnUIEEwpX69L8Ir2EEAyR06LaA1JGlwy2c335KySQqwB
        BYJ322Le1nRUyp/D1QYm/dREVgvvnmESSCeg5towJC3g7M0=
X-Google-Smtp-Source: ABdhPJzlZehTjcert4vrrM30ECovJgH0g82qxJamlR2zHduAeUjGBJSha5UnR68gTOC6oXzqQgW5PLyscX+TP2ijGjE=
X-Received: by 2002:a63:c543:: with SMTP id g3mr2899557pgd.203.1599070549499;
 Wed, 02 Sep 2020 11:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200902165852.201155-1-colin.king@canonical.com>
In-Reply-To: <20200902165852.201155-1-colin.king@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Sep 2020 21:15:31 +0300
Message-ID: <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
Subject: Re: [PATCH][next] staging: media: atomisp: fix memory leak of object flash
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 2, 2020 at 8:02 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where the call to lm3554_platform_data_func returns an
> error there is a memory leak on the error return path of object
> flash.  Fix this by adding an error return path that will free
> flash and rename labels fail2 to fail3 and fail1 to fail2.
>

Wouldn't be proper fix to move to devm_kmalloc() and return
dev_err_probe() where appropriate?

> Fixes: 9289cdf39992 ("staging: media: atomisp: Convert to GPIO descriptors")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  .../media/atomisp/i2c/atomisp-lm3554.c        | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> index 7ca7378b1859..5516c98f63bc 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -843,8 +843,10 @@ static int lm3554_probe(struct i2c_client *client)
>                 return -ENOMEM;
>
>         flash->pdata = lm3554_platform_data_func(client);
> -       if (IS_ERR(flash->pdata))
> -               return PTR_ERR(flash->pdata);
> +       if (IS_ERR(flash->pdata)) {
> +               err = PTR_ERR(flash->pdata);
> +               goto fail1;
> +       }
>
>         v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
>         flash->sd.internal_ops = &lm3554_internal_ops;
> @@ -856,7 +858,7 @@ static int lm3554_probe(struct i2c_client *client)
>                                    ARRAY_SIZE(lm3554_controls));
>         if (ret) {
>                 dev_err(&client->dev, "error initialize a ctrl_handler.\n");
> -               goto fail2;
> +               goto fail3;
>         }
>
>         for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
> @@ -865,14 +867,14 @@ static int lm3554_probe(struct i2c_client *client)
>
>         if (flash->ctrl_handler.error) {
>                 dev_err(&client->dev, "ctrl_handler error.\n");
> -               goto fail2;
> +               goto fail3;
>         }
>
>         flash->sd.ctrl_handler = &flash->ctrl_handler;
>         err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
>         if (err) {
>                 dev_err(&client->dev, "error initialize a media entity.\n");
> -               goto fail1;
> +               goto fail2;
>         }
>
>         flash->sd.entity.function = MEDIA_ENT_F_FLASH;
> @@ -884,14 +886,15 @@ static int lm3554_probe(struct i2c_client *client)
>         err = lm3554_gpio_init(client);
>         if (err) {
>                 dev_err(&client->dev, "gpio request/direction_output fail");
> -               goto fail2;
> +               goto fail3;
>         }
>         return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> -fail2:
> +fail3:
>         media_entity_cleanup(&flash->sd.entity);
>         v4l2_ctrl_handler_free(&flash->ctrl_handler);
> -fail1:
> +fail2:
>         v4l2_device_unregister_subdev(&flash->sd);
> +fail1:
>         kfree(flash);
>
>         return err;
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
