Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF94B061C
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 01:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbfIKXna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 19:43:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34576 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbfIKXna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 19:43:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AFB3B28A178
Message-ID: <598bc8159ae05b640608964628103018c8ce090b.camel@collabora.com>
Subject: Re: [PATCH] rcar-vin: Use bytes per line instead of width for UV
 offset
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Thu, 12 Sep 2019 00:43:25 +0100
In-Reply-To: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Niklas,

On Thu, 2019-09-05 at 23:25 +0200, Niklas Söderlund wrote:
> The image size is doubled for NV16 and is calculated as bytesperline *
> height * 2 to accommodate the split of UV data. When writing the offset
> to hardware width is used instead of bytesperline, fix this.
> 
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

You can make your life easier by simply pulling the pixel format helper
and let someone figure out the math. See v4l2_fill_pixfmt and friends.

Avoiding these type of subtle issues is why we have them.

Eze

