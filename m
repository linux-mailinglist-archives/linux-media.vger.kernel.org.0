Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B46B441992
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhKAKOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhKAKOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:14:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9521C06120E
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 03:02:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w15so62677432edc.9
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCjdLh3r9FbYMfoWk9NvG7UtTNyhszvuorMKcfvZpCk=;
        b=q0+IDd8Ewe/tHufgcXazs13Iru8gJwB/BCLq2C+g1Asto+Dsmxq6UGQMIhqlaXaPuh
         02PlMz55JSIlampNed7chqTahGT3iO7k/JUm5isrm4oC9ht8eieTJVojugiQjAlrgq46
         Sss/pULkksbDZhL07gbwiqzs7Dj3bAAvkt7vVdta3L+g//5QO+hnnUOTfoyZIQT7FFoB
         1M4pkICnRIbM5F3nzHw60pkXTBe7Y+NL79KlPIKOYvi4/l2Z2o24W41AR8wM3Mqjy9u8
         /kzrc9HcFGbPu136rHorxJJj+nirQkB02asHKTZb1arenf7AmmQ8bvqMdUqJR341PfyP
         oSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCjdLh3r9FbYMfoWk9NvG7UtTNyhszvuorMKcfvZpCk=;
        b=SshlC6Td/TvdZdKheZjsjntHtqNJivCCkGmgIfThRstASwH9uxALdr9nqJX/U26UFr
         bOJQhrdjB7zL2X8oSj06gTnZQxIByxCohoTajeXZfupnvldbCX8Ku/QqLdnABIKe6RnL
         AawpsN3jWQW8GoBhSxXMxeAOYth1CvvY5jB5wYXyJpNhq1qZHb+m3Ec2dPjdqHsd6fy3
         Hja3Um9ph3wj3sgsBKbIsb0r5y84DKLBGR9WsYOxSqXWzoR99z9LCgSFbwVBpb+rpp/Z
         IJrivkfId3Q/Rap+rmSP8CsUS96BkTnz41xwV7WwCTL6RB707jzbJ4TT2pBK0QVtsAfX
         wuvg==
X-Gm-Message-State: AOAM533J37L2D+YPTpEcFbnZv/TyTaxDi6JPugiy5J+ZikEmk4GSglgZ
        78tas6/Esgy0fZa3VgGkH/2MK+KQjZrPwistux57tNNQ1qg=
X-Google-Smtp-Source: ABdhPJzjSqlEk4O08A+9BYPn/W9shH6sc/yoBKE3RPIokupaYIroHwRWJIpUbeGWQbKUlE0aLPsasnxpZYzU3bVmOwE=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr7697183ejc.141.1635760926301;
 Mon, 01 Nov 2021 03:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211101001119.46056-1-djrscally@gmail.com> <20211101001119.46056-2-djrscally@gmail.com>
In-Reply-To: <20211101001119.46056-2-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:01:16 +0200
Message-ID: <CAHp75Vf_kOH28O6ZO9h5jpm2Wvcoi3vUifEqYFpD4nfojy4=UA@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] media: i2c: Add ACPI support to ov8865
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 2:12 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> The ov8865 sensor is sometimes found on x86 platforms enumerated via ACPI.
> Add an ACPI match table to the driver so that it's probed on those
> platforms.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index ce50f3ea87b8..7626c8608f8f 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>

>  #include <linux/of_graph.h>

I'm wondering if the code even uses of_*() APIs.
If nbo, maybe it's good to replace of_graph.h with property.h.

>  #include <linux/pm_runtime.h>
> @@ -2946,6 +2947,12 @@ static const struct dev_pm_ops ov8865_pm_ops = {
>         SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
>  };
>
> +static const struct acpi_device_id ov8865_acpi_match[] = {
> +       {"INT347A"},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
> +
>  static const struct of_device_id ov8865_of_match[] = {
>         { .compatible = "ovti,ov8865" },
>         { }
> @@ -2956,6 +2963,7 @@ static struct i2c_driver ov8865_driver = {
>         .driver = {
>                 .name = "ov8865",
>                 .of_match_table = ov8865_of_match,
> +               .acpi_match_table = ov8865_acpi_match,
>                 .pm = &ov8865_pm_ops,
>         },
>         .probe_new = ov8865_probe,
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
