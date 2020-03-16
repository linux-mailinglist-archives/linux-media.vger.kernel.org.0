Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD48186AD8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbgCPM27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:28:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbgCPM27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:28:59 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 553AEA3B;
        Mon, 16 Mar 2020 13:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361737;
        bh=E9Zb5ZVZsnjV1m92y30FZ6OxuGnHrkx4IJYg0AZ1ClE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f8srCPws+KQVV2G0CjL67JWpuvVfmgc7EvivPq7EbEJRPygJLs2qshyq3Z0iE/Uds
         aigDcroR54mkqnNxVY5XXb3qGxZKQmJyU/kWC/7zcoVOhrBqvacEPerYsYhfOp6odK
         sddah+c44bDgbbQnQMQn7Y8DigDuFm12307O8yPU=
Date:   Mon, 16 Mar 2020 14:28:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 01/16] media: ti-vpe: cal: fix use of wrong macro
Message-ID: <20200316122851.GY4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:06PM +0200, Tomi Valkeinen wrote:
> i913_errata() sets a bit to 1 in PHY_REG10, but for some reason uses
> CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE for the bit value. The value of
> that macro is 1, so it works, but is still wrong.
> 
> Fix this to 1.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index e44b34dfac1a..4b584c419e98 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -645,8 +645,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
>  {
>  	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
>  
> -	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
> -		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
> +	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
>  
>  	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
>  	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);

-- 
Regards,

Laurent Pinchart
