Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4086D4D8F
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 18:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbjDCQY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 12:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbjDCQYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 12:24:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27972700
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680539041; x=1712075041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Jb7mW8GgKs3X7qIWTnQ9maer3rwE4789mQjXaeVBpE=;
  b=Y9CsEmieAtpwi7S9nf7V69xnRGAFIrjXOnC5fDhHfx6AsdribqWQ8/Si
   7zpfSWCaml/xEO7Qx5cdRD5QwSSsZTuopxHfMoMBsYB9GUrZLqxPtNTMY
   09wrQR8kT5ph/ppSiTtvvo3hdnezH8K9UjoQE15v37zYj2hY4ZTzi9hbB
   qXVjXibjTnWBCTs2IEVjVdpjox/w4BOEhikJnInZPxa46BVJB/lt4YuXi
   AeTzh7dXDWeHTLwU4cMt25mww9moU5sVwsOHGzsbpA6niJBpnwZo5mv8V
   9Uic34yCKBE2oP9bmC1uE8GFHje8w0IVR+eZJnJkDlN24VGj/BebzlCh7
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,315,1673938800"; 
   d="scan'208";a="208610422"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 09:23:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:23:49 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 09:23:46 -0700
Message-ID: <9ffe89c5-260a-a95e-0e7b-b5eca0b8c050@microchip.com>
Date:   Mon, 3 Apr 2023 18:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/24] staging: media: atmel-sama7g5-isc: Convert to
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
 <20230403154014.2564054-8-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230403154014.2564054-8-u.kleine-koenig@pengutronix.de>
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

> ---
>   drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> index 01ababdfcbd9..315bfc4ac4ff 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> @@ -549,7 +549,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
>          return ret;
>   }
> 
> -static int microchip_xisc_remove(struct platform_device *pdev)
> +static void microchip_xisc_remove(struct platform_device *pdev)
>   {
>          struct isc_device *isc = platform_get_drvdata(pdev);
> 
> @@ -562,8 +562,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
>          clk_disable_unprepare(isc->hclock);
> 
>          atmel_isc_clk_cleanup(isc);
> -
> -       return 0;
>   }
> 
>   static int __maybe_unused xisc_runtime_suspend(struct device *dev)
> @@ -601,7 +599,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
> 
>   static struct platform_driver microchip_xisc_driver = {
>          .probe  = microchip_xisc_probe,
> -       .remove = microchip_xisc_remove,
> +       .remove_new = microchip_xisc_remove,
>          .driver = {
>                  .name           = "microchip-sama7g5-xisc",
>                  .pm             = &microchip_xisc_dev_pm_ops,
> --
> 2.39.2
> 

-- 
Nicolas Ferre

