Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7462F2A9713
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 14:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgKFNhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 08:37:41 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56062 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgKFNhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 08:37:41 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6DbGJ8102374;
        Fri, 6 Nov 2020 07:37:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604669836;
        bh=a/oKUWOuKW3ydPesK1Xly4sled9yN1hC7tAR646Mr6U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eWB9jV/3IRkMGKzVpRcoSFtbBTO1+tFzf2zseIuXMZL7v3jLbprFGMuDxfIefbP7h
         gr5fA2fj/YomyzUD43uycDx2WlUE7ANmGW3RHz1NBuCJ5mpuWu92YrcmknbP164JX9
         LiZOPsGrq8lXpDwB861e6Pveryh/dUpapGB48gew=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6DbFMs119490
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Nov 2020 07:37:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 07:37:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 07:37:15 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6DbB3W081197;
        Fri, 6 Nov 2020 07:37:12 -0600
Subject: Re: [PATCH 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote
 non-conformant kernel-doc
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        <linux-mtd@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-8-lee.jones@linaro.org>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5ba82a34-5dfe-71f0-703e-6603de6ef468@ti.com>
Date:   Fri, 6 Nov 2020 19:07:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102115406.1074327-8-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/2/20 5:23 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'np' not described in 'hisi_spi_nor_register'
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'host' not described in 'hisi_spi_nor_register'
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> index 95c502173cbda..7c26f8f565cba 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -320,7 +320,7 @@ static const struct spi_nor_controller_ops hisi_controller_ops = {
>  	.write = hisi_spi_nor_write,
>  };
>  
> -/**
> +/*
>   * Get spi flash device information and register it as a mtd device.
>   */
>  static int hisi_spi_nor_register(struct device_node *np,
> 

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
