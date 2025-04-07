Return-Path: <linux-media+bounces-29443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE323A7D20D
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 04:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C86D1889381
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 02:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95872212FAA;
	Mon,  7 Apr 2025 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwX7Cit3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8241A8F60;
	Mon,  7 Apr 2025 02:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743992002; cv=none; b=E6wOvKGtqSzGjWzq/v7OMh9H/OMsVvVsTYp5EiJQLRIEFyuBcVpO9UhssaSSDe3B11CXYK1/OBMCXDHQ9PDAmBdf+BKTKcjn6x+iGo2uqa9Xjkw2zsteXYM6mnonRYnsuGU2L4vuzN6R0NpVf5nGNueIG7RepQoThTTSN8fwSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743992002; c=relaxed/simple;
	bh=o4z3lShe5fWdIHOHh/S+LH5XWcmb3GCdzef4vuTNzr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIBmN08Z8IcQ1FXVBv9ULFcajzXXTaBHSFbn91hqbZtiwksJOSxRxwNkMf3B3sXQAa64DEUib+3SMp23GRqb6HFKe80Zqo2puiPosp3xlXQ0pdcVCx+tziItYQuT3Vz2+3vivLOtDD2JyknTwkjmyNFRJfJkFWNhWBcQ654D/Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwX7Cit3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FA3C4CEE7;
	Mon,  7 Apr 2025 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743992001;
	bh=o4z3lShe5fWdIHOHh/S+LH5XWcmb3GCdzef4vuTNzr0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cwX7Cit32NcnoA4V0nWHvtDo6VEeOxOMtuNZdyDm76v6LLAm4m6m2wlED28x19Br+
	 7txtKy6jywWU/sn/V9b8ZYXwq5vFHQ6WlVph5+VxqAFGzUIUMYwK+eZwHLhrpg+QIj
	 lLbssbxGLatk252iUDug1V4N1xvf7CcLWUecnuefwOOtT+yinw8D7tXQq7cei4lOdP
	 7LwnqdUO/4KT1WTI3tsCffK5XKzL2ChOv7EnnIv8Y5PJxYzG02HrzbDbUPGPan6Gim
	 EipdknXnZ2O1vs3n8Q81yDJ2kKVUzLXu7hKrQLNiRVhTeEt8EtHbNiji5mxSXJUefO
	 p+GNL4M6VbcbQ==
Date: Mon, 7 Apr 2025 10:11:54 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: mchehab@kernel.org, yujiaoliang@vivo.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] media: dvb: Add error checking for bcm3510_writeB()
Message-ID: <20250407101154.191f87cd@sal.lan>
In-Reply-To: <20250401041141.2016-1-vulab@iscas.ac.cn>
References: <20250401041141.2016-1-vulab@iscas.ac.cn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Apr 2025 12:11:41 +0800
Wentao Liang <vulab@iscas.ac.cn> escreveu:

> In  bcm3510_bert_reset(), the function performed multiple writes
> without checking the return value of bcm3510_writeB(). This could
> result in silent failures if the writes failed, leaving the BER
> counter in an undefined state.

Did you actually had an issue here with a real hardware? If do, please
describe what happened.

> 
> Add error checking for each bcm3510_writeB call and propagate any
> errors immediately. This ensures proper error handling and prevents
> silent failures during BER counter initialization.
> 
> Fixes: 55f51efdb696 ("[PATCH] dvb: flexcop: add BCM3510 ATSC frontend support for Air2PC card")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/dvb-frontends/bcm3510.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
> index d935fb10e620..fc5853fc9595 100644
> --- a/drivers/media/dvb-frontends/bcm3510.c
> +++ b/drivers/media/dvb-frontends/bcm3510.c
> @@ -270,10 +270,18 @@ static int bcm3510_bert_reset(struct bcm3510_state *st)
>  	if ((ret = bcm3510_readB(st,0xfa,&b)) < 0)
>  		return ret;
>  
> -	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
> -	b.BERCTL_fa.RESYNC = 1; bcm3510_writeB(st,0xfa,b);
> -	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
> -	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1; bcm3510_writeB(st,0xfa,b);
> +	b.BERCTL_fa.RESYNC = 0;
> +	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
> +		return ret;
> +	b.BERCTL_fa.RESYNC = 1;
> +	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
> +		return ret;
> +	b.BERCTL_fa.RESYNC = 0;
> +	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
> +		return ret;
> +	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1;
> +	if ((ret = bcm3510_writeB(st,0xfa,b)) < 0)
> +		return ret;
>  
>  	/* clear residual bit counter TODO  */
>  	return 0;

