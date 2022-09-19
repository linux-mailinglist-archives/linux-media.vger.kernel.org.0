Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90645BCEC8
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiISOam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiISOag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:30:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D9432AB0
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:30:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F9E29BA;
        Mon, 19 Sep 2022 16:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663597829;
        bh=GdzqmnoCIH3yH56/nrn2I/3xOIs6BoN2MOx9voPR8gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n9HwerNPQCSnt0QqEAEm4rnShKfuoxkPOHcXqmC8EThXFaDYEo0XhksOvhy6idcUo
         mH5a93yD1VyJkxOTXwcDKCqIBlkaacCTXcuWQBi0hdQHq6KHpgP1sPYcLdjK+ojwCm
         D+8PnmSfGXqZx33bFbzCMpHJJUtcPFW/HV49Q5EM=
Date:   Mon, 19 Sep 2022 17:30:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 04/13] media: i2c: tc358743: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh898dPkpQMvIp1@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-5-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-5-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:15PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()

s/replace/replaced/

Same for all the other patches in this series.

> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/tc358743.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 200841c1f5cf..9197fa0b1bc2 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1891,12 +1891,9 @@ static int tc358743_probe_of(struct tc358743_state *state)
>  	int ret;
>  
>  	refclk = devm_clk_get(dev, "refclk");
> -	if (IS_ERR(refclk)) {
> -		if (PTR_ERR(refclk) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get refclk: %ld\n",
> -				PTR_ERR(refclk));
> -		return PTR_ERR(refclk);
> -	}
> +	if (IS_ERR(refclk))
> +		return dev_err_probe(dev, PTR_ERR(refclk),
> +				     "failed to get refclk\n");
>  
>  	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
>  	if (!ep) {

-- 
Regards,

Laurent Pinchart
