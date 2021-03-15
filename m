Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E975C33C405
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhCORWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:22:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhCORWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:22:41 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFA59316;
        Mon, 15 Mar 2021 18:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615828960;
        bh=mwXOublgZNN3WsSwROdW/VWjnxX1/dxf4nAZk0poaPA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=c8ML28d7nCiuZtt5wetJPDBn0aHcSoBg2QrFtkelETAXucTbwbip5vBfw56MhEp4F
         8Js2Jlm41PdGBjIKWYlwafhiVaqTZaEYP+5d7mlTzgce1lYvXnFDGgz+xzVkG4g9Mo
         Pykzgo01HLnYcEYJlufBN2PMkl9pEmdPTPcqu9Wg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to
 boot
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-13-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0826484e-8ae7-677e-6de2-8f019e9733fc@ideasonboard.com>
Date:   Mon, 15 Mar 2021 17:22:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-13-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 13:15, Jacopo Mondi wrote:
> It has been observed through repeated testing (250 boots) that in the
> 10% of the cases the RDACM21 initialization sequence errors out due a
> timeout waiting for the OV490 firmware to complete its boot phase.
> 
> Albeit being the current timeout relatively large (300-600 milliseconds),
> doubling it reduces the sporadic error rate down to 1 over an 80 boot
> sequences test run.
> 
> The firmware boot delay is unfortunately not characterized in the camera
> module manual.
> 

I wonder if we could characterize this alone by pulling this down until
we see failures increase, with all the other fixes in place...

I don't think that's required, but it might be something to check later
if we don't get rid of that 1/80 failure.



> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 50a9b0d8255d..07cf077d8efd 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -53,7 +53,7 @@
>  #define OV490_PID			0x8080300a
>  #define OV490_VER			0x8080300b
>  #define OV490_PID_TIMEOUT		20
> -#define OV490_OUTPUT_EN_TIMEOUT		300
> +#define OV490_OUTPUT_EN_TIMEOUT		600
>  
>  #define OV490_GPIO0			BIT(0)
>  #define OV490_SPWDN0			BIT(0)
> 

