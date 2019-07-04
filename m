Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880D55F9D2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 16:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfGDONI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 10:13:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfGDONI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 10:13:08 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 842C824B;
        Thu,  4 Jul 2019 16:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562249586;
        bh=dglkbnfZ3C4DFXrB/Pn4L+daSveV7B4rpHo9mBsyZIo=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=qjlH+KyKYk9D/vHbZsp1H57YIHiAaaF5hpjWJklyuCt1HCjGyEbEiWwQhCS113LMG
         4iTjDxv8mp9xyLqzVvBjaei80H2AjsrszwvZo60kfhRZzHBNbiVNm670oNtjNE+U+x
         cah+yeFUvfru5GQ0F1jUyYEbKiLkBRu/o8XIetWk=
Subject: Re: [PATCH v3 1/4] rcar-vin: Rename VNDMR_DTMD_ARGB1555 to
 VNDMR_DTMD_ARGB
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-2-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d234a4f4-2dfb-8840-43b0-01ea9d91314c@ideasonboard.com>
Date:   Thu, 4 Jul 2019 15:13:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190704015817.17083-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 04/07/2019 02:58, Niklas Söderlund wrote:
> The value have nothing to do with ARGB1555, it controls if the alpha
> component should be filled in for ARGB1555 or ARGB888. Rename it to
> reflect this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 91ab064404a185af..2d146ecf93d66ad5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -114,7 +114,7 @@
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
>  #define VNDMR_DTMD_YCSEP	(1 << 1)
> -#define VNDMR_DTMD_ARGB1555	(1 << 0)
> +#define VNDMR_DTMD_ARGB		(1 << 0)
>  
>  /* Video n Data Mode Register 2 bits */
>  #define VNDMR2_VPS		(1 << 30)
> @@ -721,7 +721,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  		output_is_yuv = true;
>  		break;
>  	case V4L2_PIX_FMT_XRGB555:
> -		dmr = VNDMR_DTMD_ARGB1555;
> +		dmr = VNDMR_DTMD_ARGB;
>  		break;
>  	case V4L2_PIX_FMT_RGB565:
>  		dmr = 0;
> 

