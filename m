Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5520218C327
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgCSWop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:44:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53244 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSWop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:44:45 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMigrS115390;
        Thu, 19 Mar 2020 17:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657882;
        bh=tT5nK49bDnWhkN5n7mpXuhGAYti+MQHvo6WstjEQzaA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dlfvN0EtAexukB8qLUqaLz7T8+Do4JCvOct8XRV4mbZha6qrNpQE4zq8JP1JL8UGN
         HMYzurZxNdmdya9N2XrmSw0NqPF1iuYr9/Gz7RYFOU1SvMwmhhh0+rJN+Nwns8noAj
         MKJ+U+7o7fMJ1QkLAbqXyzW38+I4YohvGKdFgz2I=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMigQs031041
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:44:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:44:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:44:42 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMifL5055977;
        Thu, 19 Mar 2020 17:44:41 -0500
Subject: Re: [PATCH v2 15/19] media: ti-vpe: cal: set DMA max seg size
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-16-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <b4b40771-a3c0-17c6-bef5-8ecd23a29f08@ti.com>
Date:   Thu, 19 Mar 2020 17:44:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-16-tomi.valkeinen@ti.com>
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
> Set DMA max seg size correctly to get rid of warnings on 64 bit
> platforms:
> 
> DMA-API: cal 6f03000.cal: mapping sg segment longer than device claims to support [len=720896] [max=65536]
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index a59931ba3ed7..b1b9616b12b6 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -2322,6 +2322,8 @@ static int cal_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = pm_runtime_get_sync(&pdev->dev);
> @@ -2336,6 +2338,8 @@ static int cal_probe(struct platform_device *pdev)
>  	return 0;
>  
>  runtime_disable:
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +
>  	pm_runtime_disable(&pdev->dev);
>  	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
>  		ctx = dev->ctx[i];
> @@ -2378,6 +2382,8 @@ static int cal_remove(struct platform_device *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +
>  	return 0;
>  }
>  
> 
