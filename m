Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CDD70FB5B
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 18:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbjEXQHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 12:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXQHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 12:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA99612B
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684944361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZhmKVosQZ4JQVcRnOlE4vKtMbROWwC8k2YBKHPSiQTc=;
        b=SZeGFqmU65XVZGuJeos/DBf98uzj2K4LzCsyVkJJqbVs1fCZX5OhmZs9HprSiEu4bNRlzK
        rf6q9tsAhXIUY63k260bj4Mm5pqp4WCuVUJ6X7EDskviIsBhUqlqVuStkC0mu+kLHV4DYr
        nByz2esfyMw0eBlTcIvXWMoxntSslog=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-rVhpIIe1M9CDz2r6DQ2Ysw-1; Wed, 24 May 2023 12:05:59 -0400
X-MC-Unique: rVhpIIe1M9CDz2r6DQ2Ysw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso135585966b.2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 09:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684944358; x=1687536358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhmKVosQZ4JQVcRnOlE4vKtMbROWwC8k2YBKHPSiQTc=;
        b=Jcubsrmea1lTWe02nt/N5spilLvtkBYXkgHjiJPmPqfsU50CeqH3tYXbYdCcQ5UGLM
         iIrdkmtc3UG7X3JBWRz+rilla15TaG7ZdaMVd7r77pGNVK217wwX9Ebi4tO2pX46Jz0D
         JisJi3BLhaBM65h49pJN3xvYjnhg4nzhlEHRzkTj7Dar6qwXwccAIINVls2uKAghI9hv
         xllOHzq/KtEUjME0ZVVaGw/KdDKAYuHC9h/oLXZ+EZKV073ZnXA5zTcOL0DFDMsk/K2b
         XXYhPhZmoC6p0FDZgY0UzOa2GzOwm6EjGedwfGay1rGprbE2KBpKrO3RLTnDYr7iA5Af
         F51A==
X-Gm-Message-State: AC+VfDw5TjevxQffpO4O4FIPNf+sG5+jPlBFT3+017cicYtNRwebmJOz
        gUEGpJs5KxrGdBTbTLCC8/TIcyrMtw8YiNZ7dINInn1bHTSceG70+T66QUTLgqITxRt1OvUUQGy
        tVsCLeAz2xEh1p0HkEwvseT4=
X-Received: by 2002:a17:907:2d8e:b0:96f:f046:9a92 with SMTP id gt14-20020a1709072d8e00b0096ff0469a92mr11389047ejc.37.1684944358683;
        Wed, 24 May 2023 09:05:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4e5txwqOZ3SZtKs2/NS+0PjYyPaaNd5bixnCBezKSQfj3syizAy6TIio0foEQIMBGJV1un/Q==
X-Received: by 2002:a17:907:2d8e:b0:96f:f046:9a92 with SMTP id gt14-20020a1709072d8e00b0096ff0469a92mr11389028ejc.37.1684944358324;
        Wed, 24 May 2023 09:05:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b009663cf5dc3bsm6004615ejb.53.2023.05.24.09.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 09:05:57 -0700 (PDT)
Message-ID: <29320512-aac1-92c0-545f-a83f4606cf55@redhat.com>
Date:   Wed, 24 May 2023 18:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use
 .probe()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, Steven@pengutronix.de,
        Rostedt@pengutronix.de, Corey Minyard <cminyard@mvista.com>,
        Haowen Bai <baihaowen@meizu.com>, Tom Rix <trix@redhat.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
 <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/24/23 17:16, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thank you for the patch. I have merged this into:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And I'll include this in the atomisp linux-media pull-req
which I send to Mauro around rc5 / rc6 time.

(I'm currently doing a lot of work on the atomisp code,
so merging this through my atomisp branch is best to
avoid conflicts)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c        | 2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-lm3554.c        | 2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c        | 2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 +-
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 273155308fe3..21eb4234a081 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -483,7 +483,7 @@ static struct i2c_driver gc0310_driver = {
>  		.pm = pm_sleep_ptr(&gc0310_pm_ops),
>  		.acpi_match_table = gc0310_acpi_match,
>  	},
> -	.probe_new = gc0310_probe,
> +	.probe = gc0310_probe,
>  	.remove = gc0310_remove,
>  };
>  module_i2c_driver(gc0310_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index cb4c79b483ca..9fa390fbc5f3 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -864,7 +864,7 @@ static struct i2c_driver gc2235_driver = {
>  		.name = "gc2235",
>  		.acpi_match_table = gc2235_acpi_match,
>  	},
> -	.probe_new = gc2235_probe,
> +	.probe = gc2235_probe,
>  	.remove = gc2235_remove,
>  };
>  module_i2c_driver(gc2235_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> index c4ce4cd445d7..cf5d9317b11a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -945,7 +945,7 @@ static struct i2c_driver lm3554_driver = {
>  		.pm   = &lm3554_pm_ops,
>  		.acpi_match_table = lm3554_acpi_match,
>  	},
> -	.probe_new = lm3554_probe,
> +	.probe = lm3554_probe,
>  	.remove = lm3554_remove,
>  };
>  module_i2c_driver(lm3554_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 0e5a981dd331..1c6643c442ef 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1600,7 +1600,7 @@ static struct i2c_driver mt9m114_driver = {
>  		.name = "mt9m114",
>  		.acpi_match_table = mt9m114_acpi_match,
>  	},
> -	.probe_new = mt9m114_probe,
> +	.probe = mt9m114_probe,
>  	.remove = mt9m114_remove,
>  };
>  module_i2c_driver(mt9m114_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 63de214916f5..b5d93a96d588 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -719,7 +719,7 @@ static struct i2c_driver ov2680_driver = {
>  		.pm = pm_sleep_ptr(&ov2680_pm_ops),
>  		.acpi_match_table = ov2680_acpi_match,
>  	},
> -	.probe_new = ov2680_probe,
> +	.probe = ov2680_probe,
>  	.remove = ov2680_remove,
>  };
>  module_i2c_driver(ov2680_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 5d2e6e2e72f0..6a72691ed5b7 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -1019,7 +1019,7 @@ static struct i2c_driver ov2722_driver = {
>  		.name = "ov2722",
>  		.acpi_match_table = ov2722_acpi_match,
>  	},
> -	.probe_new = ov2722_probe,
> +	.probe = ov2722_probe,
>  	.remove = ov2722_remove,
>  };
>  module_i2c_driver(ov2722_driver);
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> index da8c3b1d3bcd..c94fe8e861a5 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> @@ -1794,7 +1794,7 @@ static struct i2c_driver ov5693_driver = {
>  		.name = "ov5693",
>  		.acpi_match_table = ov5693_acpi_match,
>  	},
> -	.probe_new = ov5693_probe,
> +	.probe = ov5693_probe,
>  	.remove = ov5693_remove,
>  };
>  module_i2c_driver(ov5693_driver);

