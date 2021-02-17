Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FF831DAC1
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhBQNhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbhBQNhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:37:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8F8C061574;
        Wed, 17 Feb 2021 05:36:26 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB458C4;
        Wed, 17 Feb 2021 14:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613568984;
        bh=+EIDtJGElwUu1YoNn7Gn2jv0r0HlxOC8PpA0vzmIBTo=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AXeo4kF4hT6ZjVjBoFStkJHyMp0O0y63V6rOqKu0UzdaqaOPQ7faXxybLfgD7pNPU
         X9uvVpehxQqyLuL/6wdcbxilYA/fmsL9KexVSdCqtdp45wGjsfiaeGcOX9wpOSUWL9
         HH+XzuLbYi9+8x8d1vX97Pm5ZsYffoJZwB94RT2o=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 08/16] media: i2c: max9286: Adjust parameters indent
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-9-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a8fcbe68-7e31-e4fa-5cef-38c036b121c1@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:36:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-9-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> The parameters to max9286_i2c_mux_configure() fits on the previous
> line. Adjust it.
> 
> Cosmetic change only.

Cosmetic tag ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 6fd4d59fcc72..1d9951215868 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -287,9 +287,8 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
>  
>  	priv->mux_channel = chan;
>  
> -	max9286_i2c_mux_configure(priv,
> -				  MAX9286_FWDCCEN(chan) |
> -				  MAX9286_REVCCEN(chan));
> +	max9286_i2c_mux_configure(priv, MAX9286_FWDCCEN(chan) |
> +					MAX9286_REVCCEN(chan));
>  
>  	return 0;
>  }
> 

