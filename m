Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D917B780F5B
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 17:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378230AbjHRPiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 11:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378260AbjHRPhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 11:37:45 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD62D5A
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 08:37:43 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IDWg8o012340;
        Fri, 18 Aug 2023 17:37:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=a5OxDAAhSez3B+rl/5uOThzi7WkbhuAtIsbFud/WLu8=; b=y4
        dX7aD3VjHmJJeR/5AUtW3FvO1AGAsAHSxsW5egEB9jVnB45gC11hSopnk10gTvFA
        jzwGOakSLFizlNto4WzpxZDsHdeiWgrZfJwLhn4RYTomobsYOCxSlnRlaFdPD42s
        rWRQYzp3c6rMgiKljhWsgR5+h4T6TH8K+PJWdWQTJc3L/QNPxyKR+AhM4pKWsWUx
        M2VXP9GITueqvZnvmmsKwVYNq2lzuKw/T8Kbyh6swkRRs8BpkfubZqh04FhLj8LK
        6fI+uSgaY7x3ZS/F/njr38zMynTHAnpazR7wdQl0bTxoUjjySbk3busuW0ge4wLG
        jzoD9kAEX9q3ooZMXciQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sj9mc8j4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Aug 2023 17:37:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3ABDB100058;
        Fri, 18 Aug 2023 17:37:22 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2ACA225CE6B;
        Fri, 18 Aug 2023 17:37:22 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 18 Aug
 2023 17:37:21 +0200
Message-ID: <d19fc36a-f2dc-cfee-b2f8-e09952dca332@foss.st.com>
Date:   Fri, 18 Aug 2023 17:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] media: c8sectpfe: Use the devm_clk_get_enabled()
 helper function
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230818101541.1129209-1-ruanjinjie@huawei.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230818101541.1129209-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_19,2023-08-18_01,2023-05-22_02
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/18/23 12:15, Ruan Jinjie wrote:
> With devm_clk_get_enabled() the call to clk_disable_unprepare() can be
> dropped from the error path and the remove callback.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  .../st/sti/c8sectpfe/c8sectpfe-core.c         | 26 +++++--------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> index 5dc1f908b49b..e4cf27b5a072 100644
> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> @@ -695,16 +695,10 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, fei);
>  
> -	fei->c8sectpfeclk = devm_clk_get(dev, "c8sectpfe");
> +	fei->c8sectpfeclk = devm_clk_get_enabled(dev, "c8sectpfe");
>  	if (IS_ERR(fei->c8sectpfeclk)) {
> -		dev_err(dev, "c8sectpfe clk not found\n");
> -		return PTR_ERR(fei->c8sectpfeclk);
> -	}
> -
> -	ret = clk_prepare_enable(fei->c8sectpfeclk);
> -	if (ret) {
>  		dev_err(dev, "Failed to enable c8sectpfe clock\n");
> -		return ret;
> +		return PTR_ERR(fei->c8sectpfeclk);
>  	}
>  
>  	/* to save power disable all IP's (on by default) */
> @@ -722,7 +716,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  			0, "c8sectpfe-idle-irq", fei);
>  	if (ret) {
>  		dev_err(dev, "Can't register c8sectpfe-idle-irq IRQ.\n");
> -		goto err_clk_disable;
> +		return ret;
>  	}
>  
>  	ret = devm_request_irq(dev, fei->error_irq,
> @@ -730,7 +724,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  				"c8sectpfe-error-irq", fei);
>  	if (ret) {
>  		dev_err(dev, "Can't register c8sectpfe-error-irq IRQ.\n");
> -		goto err_clk_disable;
> +		return ret;
>  	}
>  
>  	fei->tsin_count = of_get_child_count(np);
> @@ -739,16 +733,14 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  		fei->tsin_count > fei->hw_stats.num_ib) {
>  
>  		dev_err(dev, "More tsin declared than exist on SoC!\n");
> -		ret = -EINVAL;
> -		goto err_clk_disable;
> +		return -EINVAL;
>  	}
>  
>  	fei->pinctrl = devm_pinctrl_get(dev);
>  
>  	if (IS_ERR(fei->pinctrl)) {
>  		dev_err(dev, "Error getting tsin pins\n");
> -		ret = PTR_ERR(fei->pinctrl);
> -		goto err_clk_disable;
> +		return PTR_ERR(fei->pinctrl);
>  	}
>  
>  	for_each_child_of_node(np, child) {
> @@ -859,7 +851,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(dev, "c8sectpfe_tuner_register_frontend failed (%d)\n",
>  			ret);
> -		goto err_clk_disable;
> +		return ret;
>  	}
>  
>  	c8sectpfe_debugfs_init(fei);
> @@ -868,8 +860,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  
>  err_node_put:
>  	of_node_put(child);
> -err_clk_disable:
> -	clk_disable_unprepare(fei->c8sectpfeclk);
>  	return ret;
>  }
>  
> @@ -903,8 +893,6 @@ static void c8sectpfe_remove(struct platform_device *pdev)
>  
>  	if (readl(fei->io + SYS_OTHER_CLKEN))
>  		writel(0, fei->io + SYS_OTHER_CLKEN);
> -
> -	clk_disable_unprepare(fei->c8sectpfeclk);
>  }
>  
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
