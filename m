Return-Path: <linux-media+bounces-11135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8F8BF92C
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 11:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C68928641F
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DBB548E8;
	Wed,  8 May 2024 09:00:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7EE3FE28
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158830; cv=none; b=QmhUvHVvMgP1VOj66dk2CXYNYn0x/gfXCcYBAtLn8ZMqTdMdAUQVUIvVwshHK5LByiqNoqX0bnVLqNeZK7Yrsxzy8/NgrvUpClXmcSVjUZtLaNP5ta7l/4ZxxLxG0L9ry4FBKLb7J7GNjKp0KKDmRUXMuNGrOj5/7Ml/jFHMEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158830; c=relaxed/simple;
	bh=Wxt+FgQ2Q0/G0tMMTGNeP/Ut1RZaG35u4YYFO9Y7mpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqRm3+ladNiwakf4jnBVghvSXKfshoRC1otUAKFRyRluc4XivetWHJ36LUBPjjSp55QUonQpAcRQj9niMBQa02GEEBjGnQ81fmJoPzII1S1Z2gtKIkRhPkJXVUUaJOpZM/htkL338rl+fC4COhYpKDiRvzBggx7DLbW8gr7Y9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d9x-0002vH-Ia; Wed, 08 May 2024 11:00:21 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d9x-000F6z-45; Wed, 08 May 2024 11:00:21 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d9x-000ZAB-07;
	Wed, 08 May 2024 11:00:21 +0200
Date: Wed, 8 May 2024 11:00:21 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: platform: allegro-dvt: Constify struct
 regmap_config
Message-ID: <Zjs_Jcin0QJ54luy@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org
References: <01b9b16b2f86f4d16d9871a29dcda9245512a1f7.1714894086.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01b9b16b2f86f4d16d9871a29dcda9245512a1f7.1714894086.git.christophe.jaillet@wanadoo.fr>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sun, 05 May 2024 09:28:25 +0200, Christophe JAILLET wrote:
> 'allegro_regmap_config' and 'allegro_sram_config' are not modified in this
> diver and are only used as a const struct regmap_config.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   79587	   3706	    116	  83409	  145d1	drivers/media/platform/allegro-dvt/allegro-core.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   80219	   3066	    116	  83401	  145c9	drivers/media/platform/allegro-dvt/allegro-core.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index da61f9beb6b4..1a19fef62e81 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -179,7 +179,7 @@ struct allegro_dev {
>  	struct list_head channels;
>  };
>  
> -static struct regmap_config allegro_regmap_config = {
> +static const struct regmap_config allegro_regmap_config = {
>  	.name = "regmap",
>  	.reg_bits = 32,
>  	.val_bits = 32,
> @@ -188,7 +188,7 @@ static struct regmap_config allegro_regmap_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> -static struct regmap_config allegro_sram_config = {
> +static const struct regmap_config allegro_sram_config = {
>  	.name = "sram",
>  	.reg_bits = 32,
>  	.val_bits = 32,
> -- 
> 2.45.0
> 
> 

