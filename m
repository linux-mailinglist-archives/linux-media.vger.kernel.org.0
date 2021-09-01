Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242E3FD863
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 13:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239996AbhIALEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 07:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhIALE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 07:04:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36F0C061575;
        Wed,  1 Sep 2021 04:03:32 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8339E3D7;
        Wed,  1 Sep 2021 13:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630494210;
        bh=mk3x5wM5YkkgJapxdLDMS4TyvaggxIATLYzHyiKHKH4=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=RptypDcji3LNzuNFVhgxBrOxO8wg7jriQgLnyXfSGYfjI2YLSY/VrsjpwWhDW4yuI
         fIRdIpYNt3chVPwczs5Uw4MhfYvb/Q/KsRggfjrncREd3rLiqJsPnABFbWZj5BBpkx
         vn4FfIhD3Kpp1sHW1lKllTRIcR/2chY2+4KBdI+w=
Subject: Re: [PATCH] media: rcar_drif: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Cai Huoqing <caihuoqing@baidu.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055517.7329-1-caihuoqing@baidu.com>
 <fe294624-3ad4-2f4e-7a1f-cd4ac3d6b387@xs4all.nl>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <15a77d3a-0e2f-89e7-8d72-61856087602d@ideasonboard.com>
Date:   Wed, 1 Sep 2021 12:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fe294624-3ad4-2f4e-7a1f-cd4ac3d6b387@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 09:19, Hans Verkuil wrote:
> On 01/09/2021 07:55, Cai Huoqing wrote:
>> Use the devm_platform_ioremap_resource() helper instead of
>> calling platform_get_resource() and devm_ioremap_resource()
>> separately
>>
>> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>> ---
>>  drivers/media/platform/rcar_drif.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
>> index a505d991548b..f0a1edb57841 100644
>> --- a/drivers/media/platform/rcar_drif.c
>> +++ b/drivers/media/platform/rcar_drif.c
>> @@ -1376,7 +1376,6 @@ static int rcar_drif_probe(struct platform_device *pdev)
>>  	struct rcar_drif_sdr *sdr;
>>  	struct device_node *np;
>>  	struct rcar_drif *ch;
>> -	struct resource	*res;
>>  	int ret;
>>  
>>  	/* Reserve memory for enabled channel */
>> @@ -1395,8 +1394,7 @@ static int rcar_drif_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	/* Register map */
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	ch->base = devm_ioremap_resource(&pdev->dev, res);
>> +	ch->base = devm_platform_ioremap_resource(pdev, 0);

This could keep struct resource *res above and use:

	ch->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res)

With that, (and the commit message / subject updated accordingly):

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>



>>  	if (IS_ERR(ch->base))
>>  		return PTR_ERR(ch->base);
>>  
>>
> 
> Compile error:
> 
> drivers/media/platform/rcar_drif.c: In function ‘rcar_drif_probe’:
> drivers/media/platform/rcar_drif.c:1401:14: error: ‘res’ undeclared (first use in this function); did you mean ‘ret’?
>  1401 |  ch->start = res->start;
>       |              ^~~
>       |              ret
> drivers/media/platform/rcar_drif.c:1401:14: note: each undeclared identifier is reported only once for each function it appears in
> 
> Regards,
> 
> 	Hans
> 

