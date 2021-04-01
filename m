Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99DE35274B
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 10:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbhDBIPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 04:15:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42940 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234265AbhDBIPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 04:15:10 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131E25ku044178;
        Thu, 1 Apr 2021 09:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617285725;
        bh=o5OsD0dIT4mdLwSiySYzL5mU5U1vDdtWdogi7i01ygQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=oHHKxvsGGKIR+kJBdmUxvuLkDCh4WheGYYcb1BKn+d8Cak/p3FrGVAa1sJqNF9kgZ
         cOrLcMTfc8dVKVu2pRlYsgEX+L1KZo/dvweV3PGxLRPXv43KAl3QikzRchgogmFcr1
         GCcmzQbTQYoT5PnERItR28Akr+S5ZJRsa4PoH2pk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131E255A036088
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Apr 2021 09:02:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 09:02:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 09:02:05 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 131E2424090463;
        Thu, 1 Apr 2021 09:02:04 -0500
Date:   Thu, 1 Apr 2021 09:02:04 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>
Subject: Re: [PATCH -next] media: ti-vpe: sc: remove redundant dev_err call
 in sc_create()
Message-ID: <20210401140204.bikghitzypf7fraf@ti.com>
References: <20210401103015.1555941-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210401103015.1555941-1-yangyingliang@huawei.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yang,

Thank you for the patch.

Yang Yingliang <yangyingliang@huawei.com> wrote on Thu [2021-Apr-01 18:30:15 +0800]:
> There is an error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/ti-vpe/sc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/sc.c b/drivers/media/platform/ti-vpe/sc.c
> index 98f95082a6fd..0202d278523f 100644
> --- a/drivers/media/platform/ti-vpe/sc.c
> +++ b/drivers/media/platform/ti-vpe/sc.c
> @@ -294,10 +294,8 @@ struct sc_data *sc_create(struct platform_device *pdev, const char *res_name)
>  	}
>  
>  	sc->base = devm_ioremap_resource(&pdev->dev, sc->res);
> -	if (IS_ERR(sc->base)) {
> -		dev_err(&pdev->dev, "failed to ioremap\n");
> +	if (IS_ERR(sc->base))
>  		return ERR_CAST(sc->base);
> -	}

Reviewed-by: Benoit Parrot <bparrot@ti.com>

>  
>  	return sc;
>  }
> -- 
> 2.25.1
> 
