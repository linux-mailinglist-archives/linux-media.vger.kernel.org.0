Return-Path: <linux-media+bounces-13976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F491392C
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 11:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A062813E8
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 09:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1D377105;
	Sun, 23 Jun 2024 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DKAdnLAp"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A3175AD;
	Sun, 23 Jun 2024 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719134184; cv=pass; b=WFwNwEZHr8Ln3rJHnGHjZhoWT04n7YmAAtPDdBG3GVUFZd0WV+i2syR1QC/828VwILQ6dgVGZEXAi5xK+X023qzHYPV+Msj5XAd5ZFLSkpJBWGGNalixIL5zmrpPYDnKgYb67lE74i3xKOjF0AnnftNiW77a4wFjjboxSgNR/pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719134184; c=relaxed/simple;
	bh=nPWeMCedcgFftU/0HJc6LZ7eiTaosK3SBHfL8IAzQj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtCEBiQfvP2LQ8CFfQVn7q/2E2kE5logdM6PhK9bUlpLv71UoyR7Lewbpy0u19RG4ogzce430mgwoSX5fMsHfUuLvcIsQNNF9KYPI0J1WoZEDrb/+/LZWSNnVGGE6EYft3fsZpf2bcUdCDrtCINBCviBhObcrutp/Nj2UlzVWz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DKAdnLAp; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W6QSd36DhzyQR;
	Sun, 23 Jun 2024 12:16:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719134178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fAIHXA5S/hMdTusZVNRukEhyzBKoUa5BV7UEOEP9+fo=;
	b=DKAdnLAp3O6+36mG0MnJ7wW2vchgLCsHReH5Jo5oCWnUtXtoZ/7rsaVI0or4wpaVDFm77l
	SoPfOPgbYl2MbhTOdxTEZydrFyNuH8zbok2M1BCOhRUSxrNVCgLWZlJcJ8u1ZbK85/4rO/
	ooXiO29o0lp0gyuqDhTmMfltmc/6CaQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719134178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fAIHXA5S/hMdTusZVNRukEhyzBKoUa5BV7UEOEP9+fo=;
	b=h/01ZVvXki1zXGhEcprR6knUgigmVPUk8U+8KgTwK9sxP4T4lXVqGKEjXXxeRxuyb8bdMh
	4fvXLv8yh54TJXM9VDJgf/tNOpr3JuctkrflIMBgZT/Uzf/k2hDwg4QeWDbJqT9cI18SjO
	lQxJzQpxAAUYNw8j3FoppapKB5U8Wwg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719134178; a=rsa-sha256; cv=none;
	b=MClumkULgxosIAnOBcCugRqtVwzL+jR9nVU9Yv1bep876ej2QeBW/UfXLx0p2eX39eTls/
	gRLx7RewhSFvU1Dv05gwXre7TRKBMdq3IevSrDkCnguJ2cDEcRKsyqSFOAB4QEiesbly86
	DdZAq3gioqdFq1WkvjgXlopBNchwqcQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CCA98634C94;
	Sun, 23 Jun 2024 12:16:16 +0300 (EEST)
Date: Sun, 23 Jun 2024 09:16:16 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete email for Anton Sviridenko
Message-ID: <Znfn4F_jg7YAuX88@valkosipuli.retiisi.eu>
References: <20240603100346.10678-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603100346.10678-2-wsa+renesas@sang-engineering.com>

On Mon, Jun 03, 2024 at 12:01:17PM +0200, Wolfram Sang wrote:
> The email address bounced. I couldn't find a newer one in recent git history,
> so update MAINTAINERS accordingly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Rewrapped the commit log while applying (was over 75 chars).

-- 
Regards,

Sakari Ailus

