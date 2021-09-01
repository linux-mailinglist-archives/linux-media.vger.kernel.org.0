Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA5D3FD4C3
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 09:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242753AbhIAHwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 03:52:16 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13480 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242622AbhIAHwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 03:52:13 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1813jTgx002894;
        Wed, 1 Sep 2021 09:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x2sdEFF3omXZq4WfTo+c7UFNrvtdFkqCbssOXxfI3Tw=;
 b=QStFamwqG6oo1RsRuzT16hUolrCdBIs7Tg2ioJVOMVQ0orEm6Bnh5/YLlXSgOLYT9xg4
 0x1qYRpYOFwSsnX/r7x9W0FiNnr/2ViXutTuGa5hL0blYk87M5WaD+91QYbNI1IPf7iC
 KjdzZdlSJl+Kt4ReiMUDL3JLu+NP7ISISSusDKV887dnwhxMmv92HE7Uwp7XxqGomPR1
 ZGv9LyMtH0+c3zA4wg0fqHFh41CzsbFaxWzkc6eqjg4jYOmprpym0ngZ4nIs49MvMeLL
 ZR7kJb2hlZ+ho1nYcW4bviXfKBZSjAc1+7TKFCuuQD33mQNV6XUOrTKsgKJawjC57yyO sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3aspy4c3nb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Sep 2021 09:50:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5E4F10002A;
        Wed,  1 Sep 2021 09:50:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BED42138C4;
        Wed,  1 Sep 2021 09:50:57 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 09:50:57 +0200
Subject: Re: [PATCH] media: rc: st_rc: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
CC:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210901055455.7179-1-caihuoqing@baidu.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <da8241fe-8d6e-d9f2-1394-fc758536100b@foss.st.com>
Date:   Wed, 1 Sep 2021 09:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055455.7179-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_02,2021-08-31_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai

On 9/1/21 7:54 AM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/rc/st_rc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
> index d79d1e3996b2..4e419dbbacd3 100644
> --- a/drivers/media/rc/st_rc.c
> +++ b/drivers/media/rc/st_rc.c
> @@ -231,7 +231,6 @@ static int st_rc_probe(struct platform_device *pdev)
>  	int ret = -EINVAL;
>  	struct rc_dev *rdev;
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct st_rc_device *rc_dev;
>  	struct device_node *np = pdev->dev.of_node;
>  	const char *rx_mode;
> @@ -274,9 +273,7 @@ static int st_rc_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	rc_dev->base = devm_ioremap_resource(dev, res);
> +	rc_dev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rc_dev->base)) {
>  		ret = PTR_ERR(rc_dev->base);
>  		goto err;
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
