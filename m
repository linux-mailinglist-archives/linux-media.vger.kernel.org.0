Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCAA33C8DF
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhCOVxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhCOVxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:53:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CEBC06174A;
        Mon, 15 Mar 2021 14:53:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94AC8316;
        Mon, 15 Mar 2021 22:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615845209;
        bh=NP09BMA6VB3qBcwkU03/j0FFvyDG5Q9dDt1gweluTKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qiiGM42aYQ2GOn5d9W+5s0Fx5BeY7d5KLKbjSYYI0MX9eK0QiZg3VH3nWyAveDtQG
         IEKnil3weHxaxduP6d07JV0LdqtBfaYwmbqzUVIt+BHqLbkz3c4dFMf8ep2z5VlL9w
         uMFZJJcLBri6N4zBs8HRgyt8btpstzbUo9SW9RDI=
Date:   Mon, 15 Mar 2021 23:52:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] media: i2c: rdacm21: Give more time to OV490 to
 boot
Message-ID: <YE/XNaSLw2Gq+llE@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-13-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-13-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:15:06PM +0100, Jacopo Mondi wrote:
> It has been observed through repeated testing (250 boots) that in the
> 10% of the cases the RDACM21 initialization sequence errors out due a
> timeout waiting for the OV490 firmware to complete its boot phase.
> 
> Albeit being the current timeout relatively large (300-600 milliseconds),

"Even if the current timeout is already relatively large" ?

> doubling it reduces the sporadic error rate down to 1 over an 80 boot
> sequences test run.
> 
> The firmware boot delay is unfortunately not characterized in the camera
> module manual.
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
