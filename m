Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF7346FBEC
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 08:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbhLJHnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 02:43:51 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36458 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230138AbhLJHns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 02:43:48 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BA1aYmq012128;
        Fri, 10 Dec 2021 08:39:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y8fXV96zWdDMZeLFEEa1AkerZm20bgHfV165wlhhHdQ=;
 b=3vx+nwIFetFFP8jvuCz0gkpk4l9X4p8XBaUZVtFjiQQJc47k/00AzqDvgswjHDMin+Nh
 zRRSmAzhCaqF3ogT7Vzpod1ybIg1ka92RX38FjAoNUjmY7o0LjLGpXrRi+DuRIzPrGy3
 xtCnPUcJa5ycU4GPCKuSZ7QtIrdtjo4NA77FvS7Fak3sjrZ6BGHKsXeSxUrJk82tygJ6
 XTdZZpyD6dutg4j1C1Wjnh9luEmkxGr/Bm47hXJ9craxjyYzDtkzhu5KkUSuaM7Cbe5x
 m1y3pDEAigteKYYJD6RSR7en8kCQPatGstcliAYaKuiedYxDrtfMoArDz/aknuK94ibV 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cuf7sw5bw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Dec 2021 08:39:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C02010002A;
        Fri, 10 Dec 2021 08:39:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2102821CA77;
        Fri, 10 Dec 2021 08:39:50 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 10 Dec
 2021 08:39:49 +0100
Subject: Re: [PATCH] media: c8sectpfe: fix double free in configure_channels()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Peter Griffin <peter.griffin@linaro.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20211208073544.GA22020@kili>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c7cc65ab-e778-cde5-1496-d0f0929b822c@foss.st.com>
Date:   Fri, 10 Dec 2021 08:39:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208073544.GA22020@kili>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_02,2021-12-08_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On 12/8/21 8:35 AM, Dan Carpenter wrote:
> The configure_channels() function has a double free because
> configure_memdma_and_inputblock() calls free_input_block() and then
> it's called again in the error handling code.
> 
> Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index e1f520903248..7bb1384e4bad 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -925,7 +925,6 @@ static int c8sectpfe_remove(struct platform_device *pdev)
>  static int configure_channels(struct c8sectpfei *fei)
>  {
>  	int index = 0, ret;
> -	struct channel_info *tsin;
>  	struct device_node *child, *np = fei->dev->of_node;
>  
>  	/* iterate round each tsin and configure memdma descriptor and IB hw */
> @@ -943,10 +942,9 @@ static int configure_channels(struct c8sectpfei *fei)
>  	return 0;
>  
>  err_unmap:
> -	for (index = 0; index < fei->tsin_count; index++) {
> -		tsin = fei->channel_data[index];
> -		free_input_block(fei, tsin);
> -	}
> +	while (--index >= 0)
> +		free_input_block(fei, fei->channel_data[index]);
> +
>  	return ret;
>  }
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
