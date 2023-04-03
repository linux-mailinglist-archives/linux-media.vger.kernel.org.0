Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC17F6D438C
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 13:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjDCLcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjDCLc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 07:32:29 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035722D4A
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680521547; x=1712057547;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UeZwXh8GuD8cGLzoLSzFe3FO1OaiMZeXUEusvR7VwV4=;
  b=Otp4zn+BkYJWpOavjiqvFhwOTpN8YVQDrGw+Eyl2Frqt8bQhoyhllxc5
   8GXoEcbghJj8WgxX8iJXKITStyjsp3QgG77/chd2JK3Li7wgUhURNukCk
   GKGDS//h106a+7g3sFV/5Iy+H8moGcRW7F8A2A3k6bUByp7JE/tDqohQ4
   741sZxRn6ONxr3z1Fbp71jT/8mtSKULK0fqrQzxdNRltugJB1dcww1fX7
   Dfv8EPCiFs9Zq1119nXn1Q6eUxhMG0koRq5KVHaR9qIWumRLsmQ7sBB24
   YguS4Zgx0O1DE0hVUjpkhtRLyQjdnJpm/7sgh+oappYX4HtPjJsjsHjai
   A==;
X-IronPort-AV: E=Sophos;i="5.98,314,1673938800"; 
   d="scan'208";a="204702039"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 04:32:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 04:32:25 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 04:32:23 -0700
Message-ID: <7606de67-9be1-cf00-d9db-23544204deb1@microchip.com>
Date:   Mon, 3 Apr 2023 13:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 018/117] media: atmel-isi: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "Eugen Hristev" <eugen.hristev@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Balamanikandan Gunasundar 
        <Balamanikandan.Gunasundar@microchip.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-21-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230326143224.572654-21-u.kleine-koenig@pengutronix.de>
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

On 26/03/2023 at 16:30, Uwe Kleine-König wrote:
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
>   drivers/media/platform/atmel/atmel-isi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 4d15814e4481..b063f980f9e0 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -1317,7 +1317,7 @@ static int atmel_isi_probe(struct platform_device *pdev)
>          return ret;
>   }
> 
> -static int atmel_isi_remove(struct platform_device *pdev)
> +static void atmel_isi_remove(struct platform_device *pdev)
>   {
>          struct atmel_isi *isi = platform_get_drvdata(pdev);
> 
> @@ -1329,8 +1329,6 @@ static int atmel_isi_remove(struct platform_device *pdev)
>          v4l2_async_nf_unregister(&isi->notifier);
>          v4l2_async_nf_cleanup(&isi->notifier);
>          v4l2_device_unregister(&isi->v4l2_dev);
> -
> -       return 0;
>   }
> 
>   #ifdef CONFIG_PM
> @@ -1368,7 +1366,7 @@ static struct platform_driver atmel_isi_driver = {
>                  .pm     = &atmel_isi_dev_pm_ops,
>          },
>          .probe          = atmel_isi_probe,
> -       .remove         = atmel_isi_remove,
> +       .remove_new     = atmel_isi_remove,
>   };
> 
>   module_platform_driver(atmel_isi_driver);
> --
> 2.39.2
> 

-- 
Nicolas Ferre

