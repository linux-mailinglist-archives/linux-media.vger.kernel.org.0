Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E602D9529
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 10:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392934AbgLNJZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 04:25:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732158AbgLNJZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 04:25:03 -0500
Received: from [192.168.0.217] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FB0E3E;
        Mon, 14 Dec 2020 10:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607937857;
        bh=dMasbpkgAFewrDWYt0LKSsXeJYXjZFEXDlk0PkueXcc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QFqYmWuWqKa379wTcDmmyhwiv5Yv16YqQcATQHQziYojHLKhC+bx2e33Oos2dmxh/
         X6pPt4dUtTasKWZ3xXysP8vJ8wFdLJ+w4KXhpCeVn7soYJmUI9dsfTGWTJPTXgF9wU
         Ti+eCC3Au+eUTFhz8atJIP4Bu+oqP7NxWIPsLVPw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe
 function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <592359b9-8e2a-6b5c-053f-ec16d9085b22@ideasonboard.com>
Date:   Mon, 14 Dec 2020 09:24:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christophe,

On 12/12/2020 17:41, Christophe JAILLET wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index dc62533cf32c..aa66e4f5f3f3 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -882,8 +882,10 @@ static int vsp1_probe(struct platform_device *pdev)
>  	}
>  
>  done:
> -	if (ret)
> +	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> +		rcar_fcp_put(vsp1->fcp);
> +	}
>  
>  	return ret;
>  }
> 

