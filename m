Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BA120FFDA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 00:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgF3WFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 18:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgF3WFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 18:05:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8592DC03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:05:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b25so20900999ljp.6
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2sdEB61RJtM8BDd2CIWT1nB0HX2JryiKHhO/D2jAqk8=;
        b=IV8PI5CQ8lFS8fDfntNPJAhkpzSbt1Sm0P3/RptH8g9/vYG9k0my4HasL3nqVUOM6E
         Z5JLQXxOZWuWYPQqwFoTxmJla02+XbIFy6jJHuFywI1neiPX9qTdmmFwGweyD4GIXb+d
         Wt9SbMg05AucKleo3PjcbXcoEr7Q9oqNvTSz8oQP7JcV3RjS0kWe5dqMsptWNnX74pgs
         og+43De9aCjqCRk4Y7Ejihdak8GdolWxyynHKVpLve61H8jJ1bf0kiWT7IVGNAtG8Sdq
         2Be+5dTKLJdx5QqLam5VrTE7NAOKYbungLUKRSYE6oErMmBdzPFiH76AlVh7cnYST0ef
         Mb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2sdEB61RJtM8BDd2CIWT1nB0HX2JryiKHhO/D2jAqk8=;
        b=ogcH4t1hvEAAswome9weT8cJqb5R4YgXZQXU1Ka56W5BrB+Cgp+CyZJa1V6mhq0kZw
         zArbSgWJ7WtCqSBX6JrLD2hRTW2rBmf8gFl1Wdu1kTPCK1gRDdA1vdSR5/bVyqysui/L
         vHqpPzdqof3+o6yXGWBQb6e8f3g42ZL22DEVrcOPLUa0SLiLxrotg5QloiXJiauH6+cj
         XKPpu6ZxeEPPoV7KrDH6+6LlWlAL6VUxDNp6sfWZfMzMuJv3eFS3h0bURDhnKG8jUVhH
         o8ZcL9l/4fvg7odFw7vdzoVv7ZdrupvWXj9kdOh+07I1UJk+XbFOZqC6e5GHoq6/wvCt
         E/3g==
X-Gm-Message-State: AOAM530ofaPmoQFIuyo6OzNgQV+emCwexVGfptXQW00NLASoJxaeIPav
        x3VTFs6de6JFVGXj/oImjDQ1/A==
X-Google-Smtp-Source: ABdhPJzuCDzU6N0J+RjoUepz5/Fcr5Ej88rFAeg0TRp0twjz7ihjFHu7iKSNwBUrjZzoNQiBPpno/Q==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr11076513lja.7.1593554703070;
        Tue, 30 Jun 2020 15:05:03 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t15sm1135067lji.49.2020.06.30.15.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 15:05:02 -0700 (PDT)
Date:   Wed, 1 Jul 2020 00:05:02 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     mrodin@de.adit-jv.com, akiyama@nds-osk.co.jp,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mchehab@kernel.org,
        michael@rodin.online, securitycheck@denso.co.jp
Subject: Re: [PATCH v8 2/3] media: rcar-csi2: Add warning for PHY speed less
 than minimum
Message-ID: <20200630220502.GK2365286@oden.dyn.berto.se>
References: <20200617133705.GA88066@vmlxhi-121.adit-jv.com>
 <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
 <1592476472-26235-2-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1592476472-26235-2-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your patch.

On 2020-06-18 19:34:31 +0900, Suresh Udipi wrote:
> Add a warning message when the selected PHY speed is less
> than supported minimum PHY speed given in the hsfreq table[1].
> 
> For raspberry pi camera capture on Kingfisher board with resolution
> 640x480, the calculated PHY speed is 48 mbps which is less than
> the minimum PHY speed 80 Mbps from the table[1]. But in this cases
> capture is successful.
> 
> [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]
> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index f18dedc..1184527 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -433,6 +433,10 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	const struct rcsi2_mbps_reg *hsfreq;
>  	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
>  
> +	if (mbps < priv->info->hsfreqrange->mbps)
> +		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
> +			 mbps, priv->info->hsfreqrange->mbps);
> +
>  	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
>  		if (hsfreq->mbps >= mbps)
>  			break;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
