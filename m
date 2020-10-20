Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9C3284AC3
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 13:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgJFLU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 07:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFLU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 07:20:56 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEB3C0613D1
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 04:20:54 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id j2so13119246eds.9
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wen69TLHUbxCgCs/H5qxqX6NSpZw4Fgitk7piiLUW1A=;
        b=YUUoj+h2Lgpn4wY2uwdieC+LUP/sEG7wzi5HHQrWu7D3q7Vzww8DbongmzlNe7Puo7
         VOwJMKY65e7xXWNJv6HXh66IqvXbPt0ORpz7QgAYmFQEGGbOqdSD36rsieLLGx65TjzC
         aIXDL/ZYYxQAUhMM842Gp44TFBhOUeuSad3LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wen69TLHUbxCgCs/H5qxqX6NSpZw4Fgitk7piiLUW1A=;
        b=mc38brSTJAZxfhgC/zHS3RCNuITpX55Nv11vnDhSc3VAVIAOn6YJK0JJU0Pj2sawwD
         9isxEP562xkAre7MBatMvPB6n8bIOeT6lxFqgYXvkCEm6sc9H2f/6KX0C2+TWNpiR1ay
         pjugjFYqgz/CMSlvSF9zLMI2ftEUujaPHghXTVfaKkaQO+QXpsjhVsw9OAYWuhjzwP5G
         G1ONe0BZ6V49q5caGx4COncMaY3gHETSCbRQIBpwrGNywFgZs+1j/Z1uBuvptWd9eMQX
         pSUiVMJ75x5wlTrA++ZXJoWOinWtXwSyMrPfWKfnWOB5ZFZDBh5AtHoGwo1gfIfSoGz1
         HDGg==
X-Gm-Message-State: AOAM533tvrE8ciVJpBXzoK9zsjCMLyft6qZwVxIRDAgj7obWIlN1qTxa
        ifgVOMLGMaxDdQEG+Sj7ZQ0WySRf17Hzfg==
X-Google-Smtp-Source: ABdhPJziyauoIFV86or9GsYTzyMlU7URwwQ8TCCyZ3/Cb0J4Kel8KEXdv+2a5ZokPe+Qu74jxCbVbQ==
X-Received: by 2002:a05:6402:7d2:: with SMTP id u18mr4910803edy.69.1601983252753;
        Tue, 06 Oct 2020 04:20:52 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id g3sm2101824edy.12.2020.10.06.04.20.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 04:20:51 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id g12so7570807wrp.10
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 04:20:50 -0700 (PDT)
X-Received: by 2002:adf:fe08:: with SMTP id n8mr4321480wrr.159.1601983249983;
 Tue, 06 Oct 2020 04:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com> <20200903081550.6012-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20200903081550.6012-7-sakari.ailus@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 6 Oct 2020 13:20:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
Message-ID: <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Sep 3, 2020 at 10:15 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being powered off. For this to happen, a hint in form
> of a device property is required from the firmware.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/misc/eeprom/at24.c | 43 +++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 8f5de5f10bbea..2d24e33788d7d 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -595,6 +595,7 @@ static int at24_probe(struct i2c_client *client)
>         bool i2c_fn_i2c, i2c_fn_block;
>         unsigned int i, num_addresses;
>         struct at24_data *at24;
> +       bool low_power;
>         struct regmap *regmap;
>         bool writable;
>         u8 test_byte;
> @@ -733,25 +734,30 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> -       err = regulator_enable(at24->vcc_reg);
> -       if (err) {
> -               dev_err(dev, "Failed to enable vcc regulator\n");
> -               return err;
> -       }
> +       low_power = acpi_dev_state_low_power(&client->dev);
> +       if (!low_power) {
> +               err = regulator_enable(at24->vcc_reg);
> +               if (err) {
> +                       dev_err(dev, "Failed to enable vcc regulator\n");
> +                       return err;
> +               }
>
> -       /* enable runtime pm */
> -       pm_runtime_set_active(dev);
> +               pm_runtime_set_active(dev);
> +       }
>         pm_runtime_enable(dev);
>

What's the guarantee that at this point the runtime PM wouldn't
suspend the device? Notice that the nvmem device is already exposed to
the userspace, which could trigger pm runtime gets and puts (and thus
idles as well).

Best regards,
Tomasz

>         /*
> -        * Perform a one-byte test read to verify that the
> -        * chip is functional.
> +        * Perform a one-byte test read to verify that the chip is functional,
> +        * unless powering on the device is to be avoided during probe (i.e.
> +        * it's powered off right now).
>          */
> -       err = at24_read(at24, 0, &test_byte, 1);
> -       if (err) {
> -               pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> -               return -ENODEV;
> +       if (!low_power) {
> +               err = at24_read(at24, 0, &test_byte, 1);
> +               if (err) {
> +                       pm_runtime_disable(dev);
> +                       regulator_disable(at24->vcc_reg);
> +                       return -ENODEV;
> +               }
>         }
>
>         pm_runtime_idle(dev);
> @@ -771,9 +777,11 @@ static int at24_remove(struct i2c_client *client)
>         struct at24_data *at24 = i2c_get_clientdata(client);
>
>         pm_runtime_disable(&client->dev);
> -       if (!pm_runtime_status_suspended(&client->dev))
> -               regulator_disable(at24->vcc_reg);
> -       pm_runtime_set_suspended(&client->dev);
> +       if (!acpi_dev_state_low_power(&client->dev)) {
> +               if (!pm_runtime_status_suspended(&client->dev))
> +                       regulator_disable(at24->vcc_reg);
> +               pm_runtime_set_suspended(&client->dev);
> +       }
>
>         return 0;
>  }
> @@ -810,6 +818,7 @@ static struct i2c_driver at24_driver = {
>         .probe_new = at24_probe,
>         .remove = at24_remove,
>         .id_table = at24_ids,
> +       .flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
>  };
>
>  static int __init at24_init(void)
> --
> 2.20.1
>
