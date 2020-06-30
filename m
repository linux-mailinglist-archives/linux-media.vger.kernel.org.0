Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2B920FFE7
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 00:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgF3WIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 18:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgF3WIT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 18:08:19 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B01C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:08:19 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so24519971ljo.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fpBRo4YYaRCPuKo9+pFNAbcc/b2rHaPYMI/vHtn3fbI=;
        b=lPLR2ofgjg2De24AQXS19wK3lpxDUbnWl4gIjKZzTdlJi6mQnVR7flAfx+cnZrS0Nj
         U2C9jXVP7qjdb4el2ChIUP8CpPwJP8f6lhFDmvBQYXVGXUEkO4pDK24+z8mopDA3mMvu
         8ETC+MCGQFp1XZf0tPSxRroFLWSo4lZAVN4oD63EpKygx1o40jNoJEqBWk0QqmBuTvCN
         SWHa9QKeOSTROvjiHIeDk3MP8awvfz94Jbpd4SFNpO3KglS3GhlPvEA112tP5h2kTKVI
         xBu3iuM/T3IlcO/wjVjTyN/9rtqMQQwy0JPhJU3XbNtmS98fGr/8a5Scc7ZM2ZviWChn
         fFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fpBRo4YYaRCPuKo9+pFNAbcc/b2rHaPYMI/vHtn3fbI=;
        b=mSVGQCJYnufkoBjCeOMBbrZVT/i64cr2MJBEiy5Dbw1E6a8+z9YYijrNr5VMtQkB2z
         MuyUz7at0MO7+EWn1K1gJdrqbFBKu9C/1wrONhDYc0L22C+bPqvvCklPZ/OyBOcSXizH
         6Nvu6C6nGQFOim3SsbyfAGBKskBSbakqut7EnAPu0ZC1HvnGNj0YB2uTXBhvqDyYXLJs
         0iuLGBiW5oZJ/4xlwwRRO3Cp+aW98ef9NdFU5nJ+XPDHGKrNBmoR+dZRYA4GH0KbZZvl
         ckDncqLhj3KK6xQ3CoM2Fmvyst+h57lynDauh3CU9ialw9CaJsfRhixNotaeYqx0RRTs
         80LQ==
X-Gm-Message-State: AOAM531VKAuhnbiKDVqGNjVvumXmd03/uTI8ofMtsxo/jbNzYTGzdhrn
        Ku7xp1eSXYCIIW1wVUFXZNZR4Q==
X-Google-Smtp-Source: ABdhPJxIRWTSCtF7hLFn/dacR/yNlFJfL5TwxFKzzCY5yqyeKmV7nOiJ+wc2k9zo/wxV1bU0fIQCHQ==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr6235047lji.253.1593554897805;
        Tue, 30 Jun 2020 15:08:17 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y25sm1138733ljc.29.2020.06.30.15.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 15:08:17 -0700 (PDT)
Date:   Wed, 1 Jul 2020 00:08:16 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     mrodin@de.adit-jv.com, akiyama@nds-osk.co.jp,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mchehab@kernel.org,
        michael@rodin.online, securitycheck@denso.co.jp
Subject: Re: [PATCH v8 3/3] media: rcar-csi2: Optimize the selection PHTW
 register
Message-ID: <20200630220816.GL2365286@oden.dyn.berto.se>
References: <20200617133705.GA88066@vmlxhi-121.adit-jv.com>
 <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
 <1592476472-26235-3-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1592476472-26235-3-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your work.

On 2020-06-18 19:34:32 +0900, Suresh Udipi wrote:
> PHTW register is selected based on default bit rate from Table[1].
> for the bit rates less than or equal to 250. Currently first
> value of default bit rate which is greater than or equal to
> the caculated mbps is selected.This selection can be further

Missing space 'selected.This'.

> improved by selecting the default bit rate which is nearest to
> the calculated value.
> 
> [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.12]
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Nit-pick: No need for a blank line between fixes and SoB.

> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 1184527..d7bf59f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -917,10 +917,18 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
>  				 const struct rcsi2_mbps_reg *values, u16 code)
>  {
>  	const struct rcsi2_mbps_reg *value;
> +	const struct rcsi2_mbps_reg *prev_value = NULL;
>  
> -	for (value = values; value->mbps; value++)
> +	for (value = values; value->mbps; value++) {
>  		if (value->mbps >= mbps)
>  			break;
> +		prev_value = value;
> +	}
> +
> +	if (prev_value &&
> +	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
> +		value = prev_value;
> +

One to many blank lines. With this and the commit message fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Nice work, thanks again for being persistent with this!

>  
>  	if (!value->mbps) {
>  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
