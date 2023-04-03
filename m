Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCF86D4D90
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjDCQYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 12:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232835AbjDCQYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 12:24:41 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A0A35BE
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680539053; x=1712075053;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TUR3EjtNbhZlzWg+BnATQOoTCZuxIFb7QTevEqWMtbU=;
  b=2K8OdzATVkuyc6P+xMTaes7kPo8bvyLfZFzVXuLvTplTvIKL6DTxuIP7
   y9yY3DFgJT6NfDxcLWSx/MrsdTkq5TjCWsJUWKm73/2Yjeve0/efmX0WR
   M36Nr5Ifq60b0tAsHyTs9UF/iSaw3OaXDHrHY7TjhCHnHQ5So7LTzJszx
   eXfL6NJp/LlRzIQG/TwfyaBIflnEyrq74RHjxDwnICtQfGBkpxAczNEGe
   fZ4Vsu26Xl/EF9teckciTakH9OA5tFkFHbhaDA6tSMKDmmD5zKKorOilL
   JVVM9WDjgme6bugY8iKtQWmRnFnH12pj4chdBsBH59RMPrQVOL5eZ+nUx
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,315,1673938800"; 
   d="scan'208";a="207937073"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 09:24:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:24:10 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 09:24:08 -0700
Message-ID: <3a883f8b-9f28-34cc-84f2-e6efc5186140@microchip.com>
Date:   Mon, 3 Apr 2023 18:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/24] staging: media: atmel-sama5d2-isc: Convert to
 platform remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "Eugen Hristev" <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
CC:     <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-7-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230403154014.2564054-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2023 at 17:39, Uwe Kleine-König wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks. Best regards,
   Nicolas

> ---
>   drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index ba0614f981a2..cc744cea1d0e 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -580,7 +580,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
>          return ret;
>   }
> 
> -static int atmel_isc_remove(struct platform_device *pdev)
> +static void atmel_isc_remove(struct platform_device *pdev)
>   {
>          struct isc_device *isc = platform_get_drvdata(pdev);
> 
> @@ -594,8 +594,6 @@ static int atmel_isc_remove(struct platform_device *pdev)
>          clk_disable_unprepare(isc->hclock);
> 
>          atmel_isc_clk_cleanup(isc);
> -
> -       return 0;
>   }
> 
>   static int __maybe_unused isc_runtime_suspend(struct device *dev)
> @@ -638,7 +636,7 @@ MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
> 
>   static struct platform_driver atmel_isc_driver = {
>          .probe  = atmel_isc_probe,
> -       .remove = atmel_isc_remove,
> +       .remove_new = atmel_isc_remove,
>          .driver = {
>                  .name           = "atmel-sama5d2-isc",
>                  .pm             = &atmel_isc_dev_pm_ops,
> --
> 2.39.2
> 

-- 
Nicolas Ferre

