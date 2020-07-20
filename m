Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C49226EA5
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgGTTEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:04:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58816 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTTEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:04:41 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53CDB2A4;
        Mon, 20 Jul 2020 21:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595271878;
        bh=KNtCu6HocOzqYYKCsCcla3s8hAt3olADl6cr5CFqkeg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WbDdGeNdkv05sl6Ov9CNPMuHACNQnhIp4Dc0zQjfZs5rfGa8+Quj9JrD/WxX8AiHu
         353+vdl1fuLoKhPVVOEVYYISYvegNPtONOh+T/ZQyeJxp7YGFkX7TX3bmyI3fMX1NM
         mwsN7iYnwSsPCXJcaqIN3/dP9piBOsd4zev3wN88=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH][next] media: i2c: fix error check on max9286_read call
To:     Colin King <colin.king@canonical.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200720161335.339174-1-colin.king@canonical.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ac2e793b-0f29-ac7b-d29f-3a4695c2eedc@ideasonboard.com>
Date:   Mon, 20 Jul 2020 20:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720161335.339174-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Colin,

On 20/07/2020 17:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return from the call to max9286_read is masked
> with 0xf0 so the following check for a negative error return is
> never true.  Fix this by checking for an error first, then masking
> the return value for subsequent conflink_mask checking.

Ooops!

> Addresses-Coverity: ("Logically dead code")
> fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 47f280518fdb..b364a3f60486 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -405,10 +405,11 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	 * to 5 milliseconds.
>  	 */
>  	for (i = 0; i < 10; i++) {
> -		ret = max9286_read(priv, 0x49) & 0xf0;
> +		ret = max9286_read(priv, 0x49);
>  		if (ret < 0)
>  			return -EIO;
>  
> +		ret &= 0xf0;
>  		if (ret == conflink_mask)
>  			break;
>  
> 

