Return-Path: <linux-media+bounces-4172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894C83BC31
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 09:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB50E1C24E94
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 08:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8960C1B94F;
	Thu, 25 Jan 2024 08:43:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E31B944
	for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706172209; cv=none; b=hsb9Qj4clhksY2PAQ5qo/74mxQFnOb7o0gfpgvq0vZXvgLPkxPeD3F5kIy/tW6XG4MTwL/KUh+jbovIawbUdWZ+f6AMihwVlN3w2wjTF61cplPmP2mnrxy+2afROdPFtcYTD8vNu6nT6rdITqJqt2/sr3DoJ+GJ6vvsKeuk+Q4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706172209; c=relaxed/simple;
	bh=oBPYSRRIvuHXxmQlmAGsOhtiu70XaFxR53lewV+BuRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV2PLyxOONsV+u8kTNNEbWQxP9EmiKEwZM/2x/2EktEVyGjMB+Dv1fWD6nhAUClw2TvnDzgYgp48wwHZ8XxDZXFnsgM80lNF3ktjdXRPdEmMk95+pM6ze4FHDDjX3Plz4WqsPejhxG5SICDDq+ohzOT4pv/XXjSbPmv38bk5Dxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1rSvKG-00066k-03; Thu, 25 Jan 2024 09:43:08 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1rSvKA-002FBI-4u; Thu, 25 Jan 2024 09:43:02 +0100
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1rSvKA-001iUn-2K; Thu, 25 Jan 2024 09:43:02 +0100
Date: Thu, 25 Jan 2024 09:43:02 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Bo Liu <liubo03@inspur.com>
Cc: kernel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: isl7998x: convert to use maple tree register
 cache
Message-ID: <20240125084302.GA383229@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Bo Liu <liubo03@inspur.com>, kernel@pengutronix.de,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240117030910.2790-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117030910.2790-1-liubo03@inspur.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Tue, 16 Jan 2024 22:09:10 -0500, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/i2c/isl7998x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index 89e13ebbce0c..c7089035bbc1 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -1337,7 +1337,7 @@ static const struct regmap_config isl7998x_regmap = {
>  	.rd_table	= &isl7998x_readable_table,
>  	.wr_table	= &isl7998x_writeable_table,
>  	.volatile_table	= &isl7998x_volatile_table,
> -	.cache_type	= REGCACHE_RBTREE,
> +	.cache_type	= REGCACHE_MAPLE,
>  };
>  
>  static int isl7998x_mc_init(struct isl7998x *isl7998x)
> -- 
> 2.31.1
> 
> 

