Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934676C9E1E
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjC0IkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbjC0Ijp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:39:45 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FF483E4
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679906073; x=1711442073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6khKAQhsm+xNh5X8HrlsOHITWRdeJE4rIHPv7g4TTu4=;
  b=QvVZXPE+geYCwWKMxuc2yfVNNoy0lWOXIcgTA4d8Htc5j8K6kMy0D+xm
   ycF3Zy5C1uMiePxh+GM+Zgr4MnfWvWFkX2PCP38vJw+Zxhm3j/O+bku6v
   Vb5dqR3p6vVC8mCIQwfb0CpnGPoD4nDtCUPIT5g54JZmmTv8oKoSVWsXi
   W0vHxkF3S/DnHSbs/CK141x7MHGPbk60qSRktiuuvSUT+b8ciHPPEgxOR
   hrwp0u6iwqRlX7aHLPuEarqY11mLusiz//Yzuml6dRc3HMvQEOejgDq49
   dx2GtXhug+YNSvosZHvZVMmDmocNk5Dg9K/38xZ3yJ+BSnnoOPNqjekGP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="337713880"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="337713880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 01:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685891344"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="685891344"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.71]) ([10.213.25.71])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 01:34:31 -0700
Message-ID: <259d6ca2-7d05-5e1a-56c2-faa66bdf65c3@intel.com>
Date:   Mon, 27 Mar 2023 10:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 071/117] media: s5p_mfc: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-74-u.kleine-koenig@pengutronix.de>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230326143224.572654-74-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.03.2023 16:31, Uwe Kleine-König wrote:
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

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> index 9d2cce124a34..e30e54935d79 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> @@ -1431,7 +1431,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>   }
>   
>   /* Remove the driver */
> -static int s5p_mfc_remove(struct platform_device *pdev)
> +static void s5p_mfc_remove(struct platform_device *pdev)
>   {
>   	struct s5p_mfc_dev *dev = platform_get_drvdata(pdev);
>   	struct s5p_mfc_ctx *ctx;
> @@ -1463,7 +1463,6 @@ static int s5p_mfc_remove(struct platform_device *pdev)
>   	s5p_mfc_unconfigure_dma_memory(dev);
>   
>   	s5p_mfc_final_pm(dev);
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -1690,7 +1689,7 @@ MODULE_DEVICE_TABLE(of, exynos_mfc_match);
>   
>   static struct platform_driver s5p_mfc_driver = {
>   	.probe		= s5p_mfc_probe,
> -	.remove		= s5p_mfc_remove,
> +	.remove_new	= s5p_mfc_remove,
>   	.driver	= {
>   		.name	= S5P_MFC_NAME,
>   		.pm	= &s5p_mfc_pm_ops,

