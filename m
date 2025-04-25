Return-Path: <linux-media+bounces-30992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA54A9C03A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD0E23ADF11
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2980C23236D;
	Fri, 25 Apr 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="yjr1AF/R"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A0231A3F;
	Fri, 25 Apr 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567933; cv=pass; b=jnw27msxU3LHO6NUuyonhbRKCZxHTuaoSucFxbVGrdA1k5E3isvenltmg6NaYeyxJRGPwaKolfbwDbxW7yt8FFORlIKtSDeYe/RefMve+6kIAl3BRRRMuB7nsuJwFvPjBMtB295yMvgYX5Gl2aL7AQWEx/grma7WwMrSGkpEclY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567933; c=relaxed/simple;
	bh=0Cnj4L+9pVhrf9zcyDoffm6pbwyD3RJzA1qc15nIk20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayg2QsDdKfCeaWLh/0RIfttYxvi3TFbjC/cRzqruyEIL017SPc+4QDewcQmCnEjaoQVcMihjfzZnOdcENWHo3qtE+eYXSNwQAJphWNuW4Bwr6wuD/lnPOoy94/+ycWSv+hZp99aMhtx8Sfm2qi2D6IiQMtahGmjzNHQiHFIggj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=yjr1AF/R; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ZkQFz4rllzyQr;
	Fri, 25 Apr 2025 10:58:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1745567927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3zfamPv07taqr5tBlfn8zwIElkO9QWOZquD+Yd2yWc=;
	b=yjr1AF/RK8n/tLhxeA0JG86y1rqJFtjG7sIkZl1Y2dbar7TJ2PsRl/h3kmEsZM1uxxBZC7
	rAHnxr8Vvk2qHPziE1+0Hj3NGzd0hkOeshBf/sIUuetehaamHpDgv607WN1Ug3d76hIrQr
	wgg4K3KN8etnucIe1kurfNinb//nS1U=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1745567927; a=rsa-sha256; cv=none;
	b=pW04VLfvaSDcMUKqzzAstVqSZwaYdMtZVrkSTfuIhYuzkG/rPuDnd01Cc/vImxUPuGEtNX
	1+ossyzxBdkBDOaV8S2e37boDuYH1SLNsC5D65OUqhWNsd4MKS88mc6BaJj7TaOhpAZzS1
	535Vln7/PqK3yuKxSJg+ky++h+7hQ9c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1745567927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3zfamPv07taqr5tBlfn8zwIElkO9QWOZquD+Yd2yWc=;
	b=vd7sAg+Q3tIvKPiY6ITUGXZDW0ElhZvoi4O4YFrk/r2LDAfx2uSXsXRliNLA+mjGWoL5/m
	lXil9jdiewlkVDcIvB/QpvWfaRVMrBUOgaD8W4TqsyuVcSXlvLTVI1b4+wcYGzC+TIAPWj
	1bfl7KtzJ7uTlKtbm1Dgyq4n6r99ZvI=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 08BA9634C93;
	Fri, 25 Apr 2025 10:58:47 +0300 (EEST)
Date: Fri, 25 Apr 2025 07:58:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: imx335: Use correct register width for HNUM
Message-ID: <aAtAtp2epJCs0RaN@valkosipuli.retiisi.eu>
References: <20250422122052.12601-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422122052.12601-1-kieran.bingham@ideasonboard.com>

Hi Kieran,

On Tue, Apr 22, 2025 at 01:20:52PM +0100, Kieran Bingham wrote:
> From: Umang Jain <umang.jain@ideasonboard.com>
> 
> CCI_REG_HNUM should be using CCI_REG16_LE() instead of CCI_REG8()
> as HNUM spans from 0x302e[0:7] to 0x302f[0:3].
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Does this need Fixes:/Cc: stable tags?

> ---
>  drivers/media/i2c/imx335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index db424b178e98..0418875e996c 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -31,7 +31,7 @@
>  #define IMX335_REG_CPWAIT_TIME		CCI_REG8(0x300d)
>  #define IMX335_REG_WINMODE		CCI_REG8(0x3018)
>  #define IMX335_REG_HTRIMMING_START	CCI_REG16_LE(0x302c)
> -#define IMX335_REG_HNUM			CCI_REG8(0x302e)
> +#define IMX335_REG_HNUM			CCI_REG16_LE(0x302e)
>  
>  /* Lines per frame */
>  #define IMX335_REG_VMAX			CCI_REG24_LE(0x3030)

-- 
Regards,

Sakari Ailus

