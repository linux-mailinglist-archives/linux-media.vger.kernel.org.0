Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C3818C2FB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgCSW2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:28:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32784 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgCSW2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:28:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMSi1T038574;
        Thu, 19 Mar 2020 17:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584656924;
        bh=0EqYtuXm2WSJxcyJWHQjMxB0YRabbn0YF5eYhYyf4Aw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=McdEOnWSIO9q1nEqwPTwwWUVkFJsLms4NEvVS0ciXRbl0R1LdHy1BYP+5DZSeCRWW
         cHU7jFXFdgMIAlUO1FFUHxxCMCBHTGivuFnxE8EChT6BJkY8/VbAquZYYXeyOpxWr+
         cigJqpwzuhtB2JYw6vnhukWb7/BAXcReF0qHsWjY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMSiqg007848
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:28:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:28:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:28:43 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMSh0p026727;
        Thu, 19 Mar 2020 17:28:43 -0500
Subject: Re: [PATCH v2 04/19] media: ti-vpe: cal: use runtime_resume for
 errata handling
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-5-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <a021d938-4b67-f4eb-a0e8-37b55933b345@ti.com>
Date:   Thu, 19 Mar 2020 17:28:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-5-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> We need to do errata handling every time CAL is being enabled. The code
> is currently in cal_runtime_get(), which is not the correct place for
> it.
> 
> Move the code to cal_runtime_resume, which is called every time CAL is
> enabled.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index c418296df0f8..4fe37f284b54 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -653,20 +653,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
>  
>  static int cal_runtime_get(struct cal_dev *dev)
>  {
> -	int r;
> -
> -	r = pm_runtime_get_sync(&dev->pdev->dev);
> -
> -	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> -		/*
> -		 * Apply errata on both port eveytime we (re-)enable
> -		 * the clock
> -		 */
> -		i913_errata(dev, 0);
> -		i913_errata(dev, 1);
> -	}
> -
> -	return r;
> +	return pm_runtime_get_sync(&dev->pdev->dev);
>  }
>  
>  static inline void cal_runtime_put(struct cal_dev *dev)
> @@ -2409,11 +2396,32 @@ static const struct of_device_id cal_of_match[] = {
>  MODULE_DEVICE_TABLE(of, cal_of_match);
>  #endif
>  
> +static int cal_runtime_resume(struct device *dev)
> +{
> +	struct cal_dev *caldev = dev_get_drvdata(dev);
> +
> +	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> +		/*
> +		 * Apply errata on both port everytime we (re-)enable
> +		 * the clock
> +		 */
> +		i913_errata(caldev, 0);
> +		i913_errata(caldev, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cal_pm_ops = {
> +	.runtime_resume = cal_runtime_resume,
> +};
> +
>  static struct platform_driver cal_pdrv = {
>  	.probe		= cal_probe,
>  	.remove		= cal_remove,
>  	.driver		= {
>  		.name	= CAL_MODULE_NAME,
> +		.pm	= &cal_pm_ops,
>  		.of_match_table = of_match_ptr(cal_of_match),
>  	},
>  };
> 
