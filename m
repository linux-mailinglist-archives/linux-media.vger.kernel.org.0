Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5320E2C3F91
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 13:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgKYMHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 07:07:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38990 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgKYMHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 07:07:20 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30D5D292;
        Wed, 25 Nov 2020 13:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606306038;
        bh=dZHCY34P/JjFJlm2r4qOhcYo7MpyN6ZEwi6gDtyYss4=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=tDfigy6RoZEyFMP2qn1z1HRtQgMp/8qi9ZXeh83E/hv46CFzxyCyMxpcGR4lO/PcC
         Lhlt7KJ3LCBdo1MRDn7POBDqaJ3Zy/FJfMAd6ZAkbGPdM6jOaz3BraSM5wbre1+8jR
         D2O2r7bmvrHwQ0/ccdP/6cZxdQzVDVmVzvtYA74o=
Subject: Re: [PATCH] adv748x: Only set i2c addresses once during probe
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163048.3587032-1-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2131bebc-2045-c5e5-b9bb-686871012bab@ideasonboard.com>
Date:   Wed, 25 Nov 2020 12:07:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122163048.3587032-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 22/11/2020 16:30, Niklas Söderlund wrote:
> During probe the i2c slave addresses are set two times in a row, once in
> adv748x_initialise_clients() and once directly after in adv748x_reset().
> Remove the call to adv748x_set_slave_addresses() in
> adv748x_initialise_clients() as it's only called during probe while
> adv748x_reset() is called during probe and normal operation.

Yes, and the call to reset will completely reset the first setting in
the first place - so it's quite redundant.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index ae8b7ebf3830aa1c..00966fe104881a14 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -198,7 +198,7 @@ static int adv748x_initialise_clients(struct adv748x_state *state)
>  			return ret;
>  	}
>  
> -	return adv748x_set_slave_addresses(state);
> +	return 0;
>  }
>  
>  /**
> 

