Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C65A35274A
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 10:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhDBIPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 04:15:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42940 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234204AbhDBIPJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 04:15:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131E0oSk043683;
        Thu, 1 Apr 2021 09:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617285650;
        bh=6vwQNZo5ftmpAQDWiqrSRII+Nhoan6pvhRRC3VNDWDk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bZqY+GbYWHyJo4dSw8JY1kWRmo/fpxBEoyPS3qIK4xd7D55CXixhjDWFpnUkaVIAG
         qF71Nvz0BuBBYBnFPzFdK20AYZrOzzLU4TN9FvU3yny6DweCINUXVeksNiKpr8fu+E
         Ao7ORKEz2769omR/wtWQIxy/YqqNTTseL19eITJ0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131E0o82015784
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Apr 2021 09:00:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 09:00:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 09:00:49 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 131E0n3h086947;
        Thu, 1 Apr 2021 09:00:49 -0500
Date:   Thu, 1 Apr 2021 09:00:49 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>
Subject: Re: [PATCH -next] media: ti-vpe: csc: remove redundant dev_err call
 in csc_create()
Message-ID: <20210401140049.snh4z53hj7a7eizg@ti.com>
References: <20210401102850.1555368-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210401102850.1555368-1-yangyingliang@huawei.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yang,

Thank you for the patch.

Yang Yingliang <yangyingliang@huawei.com> wrote on Thu [2021-Apr-01 18:28:50 +0800]:
> There is an error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/ti-vpe/csc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
> index f4e0cf72d1cf..ff15bc589f1b 100644
> --- a/drivers/media/platform/ti-vpe/csc.c
> +++ b/drivers/media/platform/ti-vpe/csc.c
> @@ -267,10 +267,8 @@ struct csc_data *csc_create(struct platform_device *pdev, const char *res_name)
>  	}
>  
>  	csc->base = devm_ioremap_resource(&pdev->dev, csc->res);
> -	if (IS_ERR(csc->base)) {
> -		dev_err(&pdev->dev, "failed to ioremap\n");
> +	if (IS_ERR(csc->base))
>  		return ERR_CAST(csc->base);
> -	}

Reviewed-by: Benoit Parrot <bparrot@ti.com>

>  
>  	return csc;
>  }
> -- 
> 2.25.1
> 
