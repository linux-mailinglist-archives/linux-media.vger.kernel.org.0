Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CE5B05BA
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 00:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfIKWly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 18:41:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42784 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfIKWlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 18:41:53 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E01D133A;
        Thu, 12 Sep 2019 00:41:51 +0200 (CEST)
Subject: Re: [PATCH] rcar-vin: Use bytes per line instead of width for UV
 offset
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kbingham@kernel.org>
Message-ID: <08a28d4c-e975-91a6-8830-51f96ec371c6@kernel.org>
Date:   Wed, 11 Sep 2019 23:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 05/09/2019 22:25, Niklas Söderlund wrote:
> The image size is doubled for NV16 and is calculated as bytesperline *
> height * 2 to accommodate the split of UV data. When writing the offset
> to hardware width is used instead of bytesperline, fix this.

s/hardware width/hardware, the width/ ?


> 

Eeep, Subtle bug :)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index c7859b329dd4f02a..af4f774149f08597 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -703,8 +703,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  	switch (vin->format.pixelformat) {
>  	case V4L2_PIX_FMT_NV16:
>  		rvin_write(vin,
> -			   ALIGN(vin->format.width * vin->format.height, 0x80),
> -			   VNUVAOF_REG);
> +			   ALIGN(vin->format.bytesperline * vin->format.height,
> +				 0x80), VNUVAOF_REG);
>  		dmr = VNDMR_DTMD_YCSEP;
>  		output_is_yuv = true;
>  		break;
> 

