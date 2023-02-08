Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37FE68EC4E
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 11:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjBHKE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 05:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBHKEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 05:04:02 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F025D35BB
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 02:04:00 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u21so19698288edv.3
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 02:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+MKsAgNDECJNr7eMNpaLeacOaefQQKTyy5x3zYKwJc=;
        b=L5/YqM2y4zXvNIHu8hHVmDZHKwSASI9vFWwQM0eJTMhL1WAAP6ppPH6EMEQ9E8HJur
         6v7MRZ3Gu0aHxW3UB81WjirBFpSZKe3CxKWaoSSTRJP5eK5za9Na4uEa4mBTDVPGw83U
         LjprxgObBiZoHfJ2LHtNnBbwCbV9sclsQNKSucwMOMhOhtL5Xc+1mZzDUgk7CClA1v/5
         KnPn0Ug88rWl1W/mfJYV5ttYq/FGTrGhf/t6uiXM+MzF1uB7pGTIFIWXrZB8ls4g9k3q
         zQ3Ul3DPo7+kAlvzAyTxevtPfa1pDiT8GtHLsXdVbNNi2crNLuZgn47Q19hDxTt9mbcg
         x0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+MKsAgNDECJNr7eMNpaLeacOaefQQKTyy5x3zYKwJc=;
        b=38/hgOPJHuUXt24TS0q0FIhN8FfowDHkGXsckIejwu+AUvPTVnbAKyx5DP3saFnHgk
         yCCZWshQGA29aXA7JmgR59kUa8b7wHU+9S4PEpNa1dcMfMbb6WSNIkGFefVbOS57lUkW
         NyGnJskDyxEALdqhOotT8askcqCd2QNUbR5HhZiieuwywlJI1kZ9b6Nh+4lUqsUtKAgV
         UVrkwnNm+dLQPD80ttJDyQ41snd9XRx/fEwyPOJWXASJ4hYZxSSUvelJkEnEcbKQLVa2
         tfcKjbZOQlvL+6SI2cNtYvfWFO/pNZVqjoCOdchEZTow33wDXRrsJvvWNvZoKFg8JVcr
         C36Q==
X-Gm-Message-State: AO0yUKWtXJ3EUG9p/W8/hz5OjOsc7QgqrPhtv/pTrXZa4ooaZX2d3R/T
        rlONFPaNtjEX+2ZFH3wXdxdUfv3Am8yvd07VESc=
X-Google-Smtp-Source: AK7set8UVI3GFjjZ9+gVal+0sRv8IrpfJOpwhuo8tSLoaO04fElwyDBtqDiB8DKCXs9a0oiE1Rux8A==
X-Received: by 2002:a50:99c5:0:b0:4aa:b63f:a0e with SMTP id n5-20020a5099c5000000b004aab63f0a0emr7361416edb.17.1675850639600;
        Wed, 08 Feb 2023 02:03:59 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id k10-20020aa7c04a000000b0049e09105705sm7546541edo.62.2023.02.08.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:03:59 -0800 (PST)
Date:   Wed, 8 Feb 2023 11:03:58 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     ye.xingchen@zte.com.cn
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: =?iso-8859-1?Q?platform?=
 =?iso-8859-1?Q?=3A_renesas=3A_use=A0devm=5Fplatform=5Fget=5Fand=5Fioremap?=
 =?iso-8859-1?B?X3Jlc291cmNlKCk=?=
Message-ID: <Y+NzjmNHaZFA5dxf@oden.dyn.berto.se>
References: <202302081659401393135@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202302081659401393135@zte.com.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ye,

Thanks for your work.

On 2023-02-08 16:59:40 +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 10b3474f93a4..a3cfd21f8aae 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -419,10 +419,7 @@ static const struct media_entity_operations risp_entity_ops = {
>  static int risp_probe_resources(struct rcar_isp *isp,
>  				struct platform_device *pdev)
>  {
> -	struct resource *res;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	isp->base = devm_ioremap_resource(&pdev->dev, res);
> +	isp->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>  	if (IS_ERR(isp->base))
>  		return PTR_ERR(isp->base);
> 
> -- 
> 2.25.1

-- 
Kind Regards,
Niklas Söderlund
