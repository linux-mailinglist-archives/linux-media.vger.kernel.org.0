Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C9025D78E
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 13:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbgIDLiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 07:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgIDLhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 07:37:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF70C061244;
        Fri,  4 Sep 2020 04:37:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83CA9540;
        Fri,  4 Sep 2020 13:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599219421;
        bh=v4Z7JQgnaOh9nvWOj7JFdNCu6zXTFwaHwC8tD4qm2Xc=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=rul1eb2lj8E7r/ziTW+GhVhSV/Mx3kC4TsxlC/T1g0Q/dPioR7dQS0i6c7Skc/bqB
         /mcUsOesilFTTvtpL4LL6Zz3VnxT8SX9J2AZuMeUOlCKZkJJ7eUbTnkrBMh5dEvKxF
         GnJbg1tQ8hVyqhjhwDMeHu5fsw13JDYcx0q4/lBc=
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
To:     Robin Murphy <robin.murphy@arm.com>, stanimir.varbanov@linaro.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <919c3cec-c67c-d9d2-f6ac-8df286a754d1@ideasonboard.com>
Date:   Fri, 4 Sep 2020 12:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On 03/09/2020 22:14, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Also the DMA segment size is simply a size, not a bitmask.

Well, I guess that answers my previous question ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..2fa9275d75ff 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -226,13 +226,7 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	if (!dev->dma_parms) {
> -		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> -					      GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> -	}
> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +	dma_set_max_seg_size(dev, UINT_MAX);
>  
>  	INIT_LIST_HEAD(&core->instances);
>  	mutex_init(&core->lock);
> 

