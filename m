Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFFC1897F4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgCRJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:32:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41838 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgCRJcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:32:50 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52990F9;
        Wed, 18 Mar 2020 10:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584523968;
        bh=V1vGHCG6nj/+sFqo3Tifzj6GrulkPC5XvOQ+GLH3G2Y=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=IHTFfYZVzZ1Ju2eCFnCbpURMBCC1VooEqr8vsZeq5ktZ1jQzAh5hGtVYsX4DlnozU
         9c8yWlIVEnhz1E5IDxR4hIGqwBUq4XGjyH60itEfHE2nhCl15OL5ENt2raPWIOQv94
         gLm/9rmn6CA8AGrLBwiRLFbXxuJQNcOKG2DyapeY=
Subject: Re: [PATCH 1/5] media: i2c: max9286: Put of node on error
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-2-jacopo+renesas@jmondi.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <09e74f7c-932b-fe63-c234-166b6ebe89f6@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:32:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200316202757.529740-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 16/03/2020 20:27, Jacopo Mondi wrote:
> Put the device of node in case of dt parsing error.
> 

Ooops, it does look like this probably leaks - but isn't it also leaking
in other code paths in this function too?

If we fix here, we should fix all leaks of this usage. (and perhaps
identify if there are leaks of other refcnts too ;-S )


> Fixes: 9eed4185c7a0 ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index a20829297ef6..06edd8bd3e82 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1046,6 +1046,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
>  	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
>  	if (!i2c_mux) {
>  		dev_err(dev, "Failed to find i2c-mux node\n");
> +		of_node_put(dev->of_node);
>  		return -EINVAL;
>  	}
>  
> 

