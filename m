Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171DF2C0EDE
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389451AbgKWPb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732376AbgKWPb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:31:27 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433DDC0613CF
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 07:31:27 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s27so4341525lfp.5
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JRF+rLwewREO4rIyeHCTBXq42dsVx1D9BSn3MiMmrM0=;
        b=rJBPTcCmJ3+mg/4z6nktjrzadD4E+14x0ePKoWDUViOe6ROl5LijE3wuZHEi6cwMdx
         l960f/nn7svgye+GDtpL83SxEMo2UxGBANB9JY5oU6LFd8rDo6au2DjHZ/T7ISCIds3T
         qNmWi8YBFDPKprwAlRATv0k6T0edvH+97GJwCn+K10Xy9tlvxmeIG+W+n0QBUm5LElib
         FqBDRpvS5ra9MM3ncUE8JLl6K72i+4BWs4VWe/wYLRCCAlPy3eqdeE5S3y+KBOSK9cS6
         qh32nFxzG0lQiDH7x+dZIxztVgKYBnuf+JcmAlhfty94SXziy+hnW8faLZrYqWxVz0n6
         Tuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JRF+rLwewREO4rIyeHCTBXq42dsVx1D9BSn3MiMmrM0=;
        b=caH/rplTSuo7p3feA2ETDZPLGOyJLp18g5FhdEfH54eavI6LJfu5Gcbj/l+XMfpRKq
         KBGXLoHVzgmRJnYhh6bYlErs3vdedE+zmYvI2afNe7tdaAb1AZLj1nNg9GLVF0hT1H8j
         vVF1MthMuFB2kFYSSPwAYpuxFyRKp5HakTkMcNNiWvX/dvLQ8uAZsLeUMHFxSr6qwSXN
         TZfJ7wBNlY8KG7dDgN7iK5MaZyDFN+642ZtB15uQJq6Ma1D2loxow8FfGVI0l8+FyFip
         673U2bm03Ei9VlFAZEsqflUo4L0t0OShfo54s7iF5B81aMfkXyJQefxGg0UoOp/4dhdc
         x+KA==
X-Gm-Message-State: AOAM533nuqylayQty1spfTtCU7Ej4nc2DFMbPnM0T9Os1chzy/AP3LFH
        kAU7Wq1+TaNpP3P5gTyr2tBgg0NgHYrRd3Wt
X-Google-Smtp-Source: ABdhPJyk5FChYVni+HhXXqyuETiODb2SsgeW8exbc1rEV2bRX25xz98wAvSxsQO0yYEk+iBNhVfD/g==
X-Received: by 2002:a19:bce:: with SMTP id 197mr15080870lfl.468.1606145485778;
        Mon, 23 Nov 2020 07:31:25 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id g8sm1417638lfb.223.2020.11.23.07.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:31:24 -0800 (PST)
Date:   Mon, 23 Nov 2020 16:31:24 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     koji.matsuoka.xm@renesas.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Message-ID: <20201123153124.GC1773213@oden.dyn.berto.se>
References: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
 <20201116110428.27338-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201116110428.27338-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2020-11-16 12:04:28 +0100, Jacopo Mondi wrote:
> The VNCSI_IFMD register controls the data expansion mode and the
> channel routing between the CSI-2 receivers and VIN instances.
> 
> According to the chip manual revision 2.20 not all fields are available
> for all the SoCs:
> - V3M, V3H and E3 do not support the DES1 field has they do not feature
>   a CSI20 receiver.
> - D3 only supports parallel input, and the whole register shall always
>   be written as 0.
> 
> Inspect the per-SoC channel routing table where the available CSI-2
> instances are reported and configure VNCSI_IFMD accordingly.
> 
> This patch upports the BSP change commit f54697394457
> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990")

I really like this approach, nice work.

> 
> Suggested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 26 +++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 378514a75bc2..ab6818b34e5a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1570,7 +1570,9 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>   */
>  int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  {
> -	u32 ifmd, vnmc;
> +	const struct rvin_group_route *route;
> +	u32 ifmd = 0;
> +	u32 vnmc;
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(vin->dev);
> @@ -1583,9 +1585,27 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	vnmc = rvin_read(vin, VNMC_REG);
>  	rvin_write(vin, vnmc & ~VNMC_VUP, VNMC_REG);
>  
> -	ifmd = VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0 | VNCSI_IFMD_CSI_CHSEL(chsel);
> +	/*
> +	 * Set data expansion mode to "pad with 0s" by inspecting the routes
> +	 * table to find out which bit fields are available in the IFMD
> +	 * register. IFMD_DES1 controls data expansion mode for CSI20/21,
> +	 * IFMD_DES0 controls data expansion mode for CSI40/41.
> +	 */
> +	for (route = vin->info->routes; route->mask; route++) {
> +		/* CSI21 is only available in r8a7795es1 and not documented. */

I would drop this comment as we do not know what will happen in future 
SoCs.

> +		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
> +			ifmd |= VNCSI_IFMD_DES1;
> +		else
> +			ifmd |= VNCSI_IFMD_DES0;
>  
> -	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
> +		/* If both have been set stop looping. */
> +		if (ifmd == (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1))
> +			break;

I would remove the comment here as I think the code is quiet self 
explanatory and reading the comment made me think I was missing 
something obvious ;-)

> +	}

Missing blank line.

With these small nits fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +	if (ifmd) {
> +		ifmd |= VNCSI_IFMD_CSI_CHSEL(chsel);
> +		rvin_write(vin, ifmd, VNCSI_IFMD_REG);
> +	}
>  
>  	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
>  
> -- 
> 2.29.1
> 

-- 
Regards,
Niklas Söderlund
