Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF082B1292
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 00:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgKLXTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 18:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgKLXTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 18:19:03 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7E2C0613D1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 15:19:03 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id i6so11092630lfd.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 15:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=M0XNWgKp55drXJUg1v5sfOygGL/vxnFizKD6kGW5+wI=;
        b=zWfX9VxEO+Px+mq/wauBiNMxnKWA98JvweWm+rpZDmdHTbE9GT4NSmtWa1/HuUN+0N
         khvGNvlbohmhC6nsw9VmbV/EJoEn0nwVaBa8t2rJm/ElbOja+lAX0tQ+pEI6Wn3cT/6O
         uhKiDh6mapLFWRSuFSd+wPtbxyaLWtQtYZDoN7cnkBofO4GbgO8kKfGaYdf9Em89duJZ
         qH4AFQ82u8HGTI1BBC92NZKISpRKQIIqX7tX088ANXgnzngzd87AdvZqKPMPmY2/a9QE
         7RydujegmVwWT9lTNcYD+g6ZrwAUBb63egnSWvqkv2W3MmYQfv+MokicMd9GjRMpcYee
         OcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M0XNWgKp55drXJUg1v5sfOygGL/vxnFizKD6kGW5+wI=;
        b=LecM7DWuuqUj/8rmH4zQuW4JPAnhaDtPkw2QJj0083G2/EBSH+hCQbeYZmojwFQZZG
         j41rEBZcY6MlvMBzzMfCqgd6vjHtwFIH0F8SxEB/e6IIG0eheTx43UQce0X6+I5L352R
         OuBB6eq7rO+DSHmZc9p55nE1U9Div/MkFbehm78qcjhMwPO9ZgX58ywdtH+cXJeShO9t
         2KRqBnulGAEVeshVoq2bI7JAPGXV4/ad3yL6gjxk/1PfIyUbJ817p6aGxoXAk4d0lban
         8saGYa5GNoEpAAfE7z12MomyMIW3kUbb6NkuqIUSX48ENqH+ZNBxX7Yo6fJuuOqe9dGK
         v9oA==
X-Gm-Message-State: AOAM5319pETQ6ZPpYl/fZqiv74HhAlZtaDslMc8+2CbtzwKW+7aeFt2R
        FzX8HmTMcIr1VeyuJQGcaTluwIZ0fdzNTw==
X-Google-Smtp-Source: ABdhPJwXffuOxcJGOaFLIwy9ta4/28GzGNENnr4JwYErIJS6xYcLrRNEiBxj1E/qRgiog8RSX9E9IA==
X-Received: by 2002:a05:6512:405:: with SMTP id u5mr738629lfk.286.1605223141469;
        Thu, 12 Nov 2020 15:19:01 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r25sm837019ljj.42.2020.11.12.15.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 15:19:00 -0800 (PST)
Date:   Fri, 13 Nov 2020 00:19:00 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     koji.matsuoka.xm@renesas.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Message-ID: <20201112231900.GB1603296@oden.dyn.berto.se>
References: <20201112160851.99750-1-jacopo+renesas@jmondi.org>
 <20201112160851.99750-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112160851.99750-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2020-11-12 17:08:51 +0100, Jacopo Mondi wrote:
> The VNCSI_IFMD register controls the data expansion mode and the
> channel routing between the CSI-2 recivers and VIN instances.
> 
> According to the chip manual revision 2.20 not all fields are available
> for all the SoCs:
> - V3M, V3H and E3 do not support the DES1 field has they do not feature
>   a CSI20 receiver.
> - D3 only supports parallel input, and the whole register shall always
>   be written as 0.
> 
> Add a bit mask to the per-SoC rcar_info structure and clear the register
> value before writing it to the hardware.
> 
> This patch upports the BSP change commit f54697394457
> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990")

I like that this issue is finally being addressed it's been in my list 
for a while. Unfortunately I'm not super keen on how it's solved here. I 
hoped the needed information could be extracted from the strcut 
rvin_info routes member inside rvin_set_channel_routing().

For D3 the length of the routes will be 0 and the driver should not 
attempt to write to the register at all. In this patch the register is 
still written the value of VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0.

For the rest I was hoping the routes array would be examined and tested 
for if it contains RVIN_CSI40, RVIN_CSI41, RVIN_CSI20 and RVIN_CSI21 
routes and set DES0 and DES1 bits accordingly.

As rvin_set_channel_routing() is never called in a hot path the cost of 
iterating over the small array I think is worth it to guarantee the 
routes always are the authoritative source, just as it is for the media 
graph links.

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++----
>  drivers/media/platform/rcar-vin/rcar-vin.h  | 6 ++++++
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 0b67d58dd727..57ac43a93f5e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1241,6 +1241,7 @@ static const struct rvin_info rcar_info_r8a77970 = {
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77970_routes,
> +	.ifmd_mask = VNCSI_IFMD_DES1,
>  };
>  
>  static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
> @@ -1270,6 +1271,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77980_routes,
> +	.ifmd_mask = VNCSI_IFMD_DES1,
>  };
>  
>  static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
> @@ -1287,6 +1289,7 @@ static const struct rvin_info rcar_info_r8a77990 = {
>  	.max_width = 4096,
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77990_routes,
> +	.ifmd_mask = VNCSI_IFMD_DES1,
>  };
>  
>  static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
> @@ -1306,6 +1309,8 @@ static const struct rvin_info rcar_info_r8a77995 = {
>  	.max_height = 4096,
>  	.routes = rcar_info_r8a77995_routes,
>  	.scalers = rcar_info_r8a77995_scalers,
> +	/* VNCSI_IFMD_REG not available on R-Car D3. */
> +	.ifmd_mask = 0xff,
>  };
>  
>  static const struct of_device_id rvin_of_id_table[] = {
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 378514a75bc2..c0e09c5d9c79 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -134,8 +134,6 @@
>  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
>  
>  /* Video n CSI2 Interface Mode Register (Gen3) */
> -#define VNCSI_IFMD_DES1		(1 << 26)
> -#define VNCSI_IFMD_DES0		(1 << 25)
>  #define VNCSI_IFMD_CSI_CHSEL(n) (((n) & 0xf) << 0)
>  
>  /* Video n scaling control register (Gen3) */
> @@ -1583,8 +1581,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	vnmc = rvin_read(vin, VNMC_REG);
>  	rvin_write(vin, vnmc & ~VNMC_VUP, VNMC_REG);
>  
> -	ifmd = VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0 | VNCSI_IFMD_CSI_CHSEL(chsel);
> -
> +	/* Write only available fields to IFMD_REG. */
> +	ifmd = (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1 | VNCSI_IFMD_CSI_CHSEL(chsel))
> +	     & !vin->info->ifmd_mask;
>  	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
>  
>  	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index be10e06b0880..2cf8952faab1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -31,6 +31,10 @@
>  /* Max number on VIN instances that can be in a system */
>  #define RCAR_VIN_NUM 8
>  
> +/* CSI_IFMD register bit fields to mask per-SoC. */
> +#define VNCSI_IFMD_DES1		BIT(26)
> +#define VNCSI_IFMD_DES0		BIT(25)
> +
>  struct rvin_group;
>  
>  enum model_id {
> @@ -174,6 +178,7 @@ struct rvin_group_scaler {
>   * @routes:		list of possible routes from the CSI-2 recivers to
>   *			all VINs. The list mush be NULL terminated.
>   * @scalers:		List of available scalers, must be NULL terminated.
> + * @ifmd_mask:		Mask of unavailable bit fields of the CSI_IFMD register
>   */
>  struct rvin_info {
>  	enum model_id model;
> @@ -184,6 +189,7 @@ struct rvin_info {
>  	unsigned int max_height;
>  	const struct rvin_group_route *routes;
>  	const struct rvin_group_scaler *scalers;
> +	u32 ifmd_mask;
>  };
>  
>  /**
> -- 
> 2.29.1
> 

-- 
Regards,
Niklas Söderlund
