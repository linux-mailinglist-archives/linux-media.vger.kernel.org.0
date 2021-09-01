Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2B3FD4C7
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 09:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242731AbhIAHyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 03:54:46 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41818 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230161AbhIAHyq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 03:54:46 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1817luOu002739;
        Wed, 1 Sep 2021 09:53:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Xx86pN97kMtAWkcw0/SusOoJIl8xWRKhEOTJbhiBsmI=;
 b=TQ2qF4PPwKBDVP45Mnp7RPZ1DA6i4TERhPj6C2TGkr8/N3yRZX7MeR0WPaIdLMDk0NPH
 2zBWyAhSYOdYFQnJs//ltzXtNFXMbCqHr68lirUPxESxduYtGNSHWpv0JkYmRMzJ35nT
 DwhEqVUNhZxMkhr14vrjo+v8knl99BR3QaMt2YVejF7xVkGSLSy9lo3rJoLeMeL0GMgl
 emUaGmLycAeApQep9CEEO7nCXJQw5M/8+rQbMOfnIosyIkFGM2ghAymjVzCKi7Cpev9k
 3jTYHD64Q4jr+pIuPvkanZ2j5y/3sMPiPOR6qaZFAqm7jf9dfcUuI8b1A/G8UuTNPU+7 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3asxg027r7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Sep 2021 09:53:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A533C10002A;
        Wed,  1 Sep 2021 09:53:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95BF52138DA;
        Wed,  1 Sep 2021 09:53:32 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 09:53:31 +0200
Subject: Re: [PATCH] media: sti/c8sectpfe: Make use of the helper function
 devm_platform_ioremap_resource_byname()
To:     Cai Huoqing <caihuoqing@baidu.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210901055631.7829-1-caihuoqing@baidu.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <73002944-80b0-ba24-f490-0aaefd4ea08b@foss.st.com>
Date:   Wed, 1 Sep 2021 09:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055631.7829-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_02,2021-08-31_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai

On 9/1/21 7:56 AM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index 02dc78bd7fab..9f05984f711a 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -665,7 +665,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *child, *np = dev->of_node;
>  	struct c8sectpfei *fei;
> -	struct resource *res;
>  	int ret, index = 0;
>  	struct channel_info *tsin;
>  
> @@ -676,14 +675,11 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  
>  	fei->dev = dev;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "c8sectpfe");
> -	fei->io = devm_ioremap_resource(dev, res);
> +	fei->io = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe");
>  	if (IS_ERR(fei->io))
>  		return PTR_ERR(fei->io);
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					"c8sectpfe-ram");
> -	fei->sram = devm_ioremap_resource(dev, res);
> +	fei->sram = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe-ram");
>  	if (IS_ERR(fei->sram))
>  		return PTR_ERR(fei->sram);
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
