Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2561E7188ED
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 19:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjEaR4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 13:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjEaR4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 13:56:49 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CB3126;
        Wed, 31 May 2023 10:56:48 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62614f2eee1so378776d6.0;
        Wed, 31 May 2023 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685555808; x=1688147808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV/c9biBREnkCQhVOfi4+gGEBOdEBNIO9x1pDQfIhIc=;
        b=rnbmb5JlCSJDAEgSUjcHfGlPCWBH6Ob3WXHiWCb8icD/V4HzAFoDfxoebts+CwnVDj
         DGXevcQNVkHXz+69508oAva6lUdvfcqSAKulxIe+DPJMnrPnNEnkeLilVGD08FTlqyQm
         ZqnhtIIaLo1wB+BBN6/hSfbdJHtKhlfSjx1kmwpVVC6/LQwl64fGaqF+0fDA3WWzXIbz
         d/QAf6FIyEVjO8N67m6guyuXEpqAtRDqnE9X8fOnkCYJucPb7tCZslyWscd6trza6enc
         rWYQJGcfOWpwY+I6FcQ60PH2+QXu9UUEyaqqaZ7R8beShSaTZlG0MsqYPsmwP/PnwrQR
         NlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555808; x=1688147808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV/c9biBREnkCQhVOfi4+gGEBOdEBNIO9x1pDQfIhIc=;
        b=XLRdOFhfOpSyvWJVOJkRaFlCfCf/7A6Huz/b8ub8K1ASMRKLpQPTJqL3qpDzHNA937
         INkwwUChXAEqKrlIpC/ixWnlCzqSXYDFPUAYFu9SMn7RGqG7UHrz1wothUm07AcZlEYC
         hm6oMlLCyVJbc5dVGHxQGR/4u05TUO5NXXgWOy9Fw3JoHtsT3jw1D54st8Anxwv4Ugbl
         ND9GuEPlu2dyZ6bqigpoHMot0zKg6zVzce1boVTHvSEDpgCd6aTBFn7bJS4Ok1QhRb+Y
         Do6TbEtGxjhQ9au8FscrT1lOW+SGlXlk0+vtLgaHhMw1FyQ1msaxoFGZNWB77/paKvfU
         J/Vg==
X-Gm-Message-State: AC+VfDyEvrNq2iUO4exiQ4O1VFToQh57O+X3CLNGxiFjDQfvZ4JwCi3B
        Z3xf6KdA7NlEYq4+RsQgZHCc4Smm5EGzBWVOsZU=
X-Google-Smtp-Source: ACHHUZ7oPzEnX2sTgdrIybaJqGhrKECjZE6ClvGKPggqB4ZsjxGeTwBJKYWUj0dGV+eukpHw2u/ObwzaonunVzVeww0=
X-Received: by 2002:a05:6214:2245:b0:618:e1d9:75b8 with SMTP id
 c5-20020a056214224500b00618e1d975b8mr8920500qvc.34.1685555807697; Wed, 31 May
 2023 10:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230531134429.171337-1-hdegoede@redhat.com>
In-Reply-To: <20230531134429.171337-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 20:56:11 +0300
Message-ID: <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 31, 2023 at 4:44=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> On some platforms, the imaging clock should be controlled by evaluating
> specific clock device's _DSM method instead of setting gpio, so this
> change register clock if no gpio based clock and then use the _DSM method
> to enable and disable clock.

...

> +       if (clk->ena_gpio)
> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +       else
> +               skl_int3472_enable_clk_acpi_method(clk, 1);

Looking at this, can we avoid duplicative validation of the GPIO?
Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
check so they won't be called together?

...

> +       if (clk->ena_gpio)
> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +       else
> +               skl_int3472_enable_clk_acpi_method(clk, 0);

Ditto.

--=20
With Best Regards,
Andy Shevchenko
