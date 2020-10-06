Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B7F284ACA
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 13:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJFLXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 07:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgJFLXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 07:23:51 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D990C0613D1
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 04:23:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p15so17076851ejm.7
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ovJafHDU9uI3o5jwB33XcL1gPgJBOOsd+4u2vpM/tYM=;
        b=HQ1dtyHdOS6P7Lfe8OYx6aLXnJVD5mZIOFmCFsDxvs18CsiE5R1H8iVMcQuyJtsAa8
         DXF9/CukDbczmBWTMt/AwlyXp8aaR4RaX9ep822myEtyo5SjfOVzRJPezwtLCy14+mB5
         PEXxXLdy6o1Rt2W/LOiQUWlUWj1D7Yu3Vp38A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ovJafHDU9uI3o5jwB33XcL1gPgJBOOsd+4u2vpM/tYM=;
        b=f0fNH7SbmTl7JDOnqf+kCIg4B1Eg1+y13tcaumn8hPCWT6YQky9TK4ZPQ+895IS7ZQ
         KmsK14izi1ZRz8dVCEOPPFP7mIUFTdQkqB08yy0cbFASqdUPQ3zA6tL/eEVcdLH5cNiJ
         TH4VzyBGwKPJ1GlP0mXB3UwETXeFItxLEfVC3Zfi/30GZKTFeAFdPJdG45y2uzSim4dq
         HLkYvl8x0d+7ic0vSA1jnGuoNKdyTs/ez9mxewW3C3qs9k9OsTT6L04VKLItoJsnmVEx
         o8u8lp6FNB5YK+ztFooCbSd3jRHkUodTnPVewfuLg7TIgWXdzZyJ0Ar8Djkbw6PAKFZT
         vbqA==
X-Gm-Message-State: AOAM532XFjXQF7uJFfSUDCTTky9howFFxAOFZ/LNcQ2m6JIUbeQbXzeN
        ca95uRnypVED4l1TjqD94z0yM2Dydh6vGQ==
X-Google-Smtp-Source: ABdhPJzUwe/FZ8J5KHa+JvxMAno5Gbyz+HLl3M8bjn1RnVtNfwThA5YWuNmpvo+SQFRNR9K9F9LrPg==
X-Received: by 2002:a17:906:7088:: with SMTP id b8mr4799732ejk.541.1601983429685;
        Tue, 06 Oct 2020 04:23:49 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id k19sm1960970ejz.28.2020.10.06.04.23.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 04:23:49 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id t9so4386471wrq.11
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 04:23:48 -0700 (PDT)
X-Received: by 2002:adf:df8e:: with SMTP id z14mr4285634wrl.32.1601983428264;
 Tue, 06 Oct 2020 04:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20200903081550.6012-7-sakari.ailus@linux.intel.com> <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
In-Reply-To: <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 6 Oct 2020 13:23:35 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Br6DePtvAukfjyPc9JEveZzg6ymSv2B+sfN0eOWLvDNw@mail.gmail.com>
Message-ID: <CAAFQd5Br6DePtvAukfjyPc9JEveZzg6ymSv2B+sfN0eOWLvDNw@mail.gmail.com>
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

On Tue, Oct 6, 2020 at 1:20 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Sakari,
>
> On Thu, Sep 3, 2020 at 10:15 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > In certain use cases (where the chip is part of a camera module, and the
> > camera module is wired together with a camera privacy LED), powering on
> > the device during probe is undesirable. Add support for the at24 to
> > execute probe while being powered off. For this to happen, a hint in form
> > of a device property is required from the firmware.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 43 +++++++++++++++++++++++---------------
> >  1 file changed, 26 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 8f5de5f10bbea..2d24e33788d7d 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -595,6 +595,7 @@ static int at24_probe(struct i2c_client *client)
> >         bool i2c_fn_i2c, i2c_fn_block;
> >         unsigned int i, num_addresses;
> >         struct at24_data *at24;
> > +       bool low_power;
> >         struct regmap *regmap;
> >         bool writable;
> >         u8 test_byte;
> > @@ -733,25 +734,30 @@ static int at24_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, at24);
> >
> > -       err = regulator_enable(at24->vcc_reg);
> > -       if (err) {
> > -               dev_err(dev, "Failed to enable vcc regulator\n");
> > -               return err;
> > -       }
> > +       low_power = acpi_dev_state_low_power(&client->dev);
> > +       if (!low_power) {
> > +               err = regulator_enable(at24->vcc_reg);
> > +               if (err) {
> > +                       dev_err(dev, "Failed to enable vcc regulator\n");
> > +                       return err;
> > +               }
> >
> > -       /* enable runtime pm */
> > -       pm_runtime_set_active(dev);
> > +               pm_runtime_set_active(dev);
> > +       }
> >         pm_runtime_enable(dev);
> >
>
> What's the guarantee that at this point the runtime PM wouldn't
> suspend the device? Notice that the nvmem device is already exposed to
> the userspace, which could trigger pm runtime gets and puts (and thus
> idles as well).
>
> Best regards,
> Tomasz
>
> >         /*
> > -        * Perform a one-byte test read to verify that the
> > -        * chip is functional.
> > +        * Perform a one-byte test read to verify that the chip is functional,
> > +        * unless powering on the device is to be avoided during probe (i.e.
> > +        * it's powered off right now).
> >          */
> > -       err = at24_read(at24, 0, &test_byte, 1);

Actually never mind. Someone pointed out to me that at24_read() calls
pm_runtime_get_sync() internally, so we should be fine. Sorry, for the
noise.

Best regards,
Tomasz

> > -       if (err) {
> > -               pm_runtime_disable(dev);
> > -               regulator_disable(at24->vcc_reg);
> > -               return -ENODEV;
> > +       if (!low_power) {
> > +               err = at24_read(at24, 0, &test_byte, 1);
> > +               if (err) {
> > +                       pm_runtime_disable(dev);
> > +                       regulator_disable(at24->vcc_reg);
> > +                       return -ENODEV;
> > +               }
> >         }
> >
> >         pm_runtime_idle(dev);
> > @@ -771,9 +777,11 @@ static int at24_remove(struct i2c_client *client)
> >         struct at24_data *at24 = i2c_get_clientdata(client);
> >
> >         pm_runtime_disable(&client->dev);
> > -       if (!pm_runtime_status_suspended(&client->dev))
> > -               regulator_disable(at24->vcc_reg);
> > -       pm_runtime_set_suspended(&client->dev);
> > +       if (!acpi_dev_state_low_power(&client->dev)) {
> > +               if (!pm_runtime_status_suspended(&client->dev))
> > +                       regulator_disable(at24->vcc_reg);
> > +               pm_runtime_set_suspended(&client->dev);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -810,6 +818,7 @@ static struct i2c_driver at24_driver = {
> >         .probe_new = at24_probe,
> >         .remove = at24_remove,
> >         .id_table = at24_ids,
> > +       .flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
> >  };
> >
> >  static int __init at24_init(void)
> > --
> > 2.20.1
> >
