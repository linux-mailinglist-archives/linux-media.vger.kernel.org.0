Return-Path: <linux-media+bounces-35208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B3ADF7BD
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B70B1BC1C5F
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CD721B9E2;
	Wed, 18 Jun 2025 20:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Btd7GGx+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A620E71E
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278759; cv=none; b=pt9eYAtYH8L6CdN5vQfgA5LOw/Z8mUPVi43dH59l6qrdjAcxmJg7VoC3HK6iazkRYfD6EJKmaLwiXCKODmHcT95njBE/StgyewhW0GLF2hgbzz2uZpogGGrFCKiE4CcWAWZUw2ZXRHGSRKCXk8Be17CXBNOIBb9G67E03A8WQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278759; c=relaxed/simple;
	bh=EGl6OGy4N78D26855h34xmMUVG4WDxjfWIM8e5e5wxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7bbg/dwFN6n0apuYM1MBzE3DFnkDss7b59FeHieux9bce6fmMCQhkrVnncrllOchB4GRzYtT55n/3ZIFWaG6fTfupHA5+TpvR7kc8D59u8KzuRIo35bg5dDoacfFYx14702OgShr/OfUNmcJx+W2H4BUkCFXUIZKc72abqgyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Btd7GGx+; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6021e3daeabso40689eaf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278757; x=1750883557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntRmOHLH3xEiTEq/EoUk0fd3KFAgQFaOvUegSbTQK3U=;
        b=Btd7GGx+AIzxnqEY9dpfk7lV9pQrMZmReqZuEEcly5SD2dXi7z+PeZXEM0vAD5da5j
         qcX64cuR18FZtwqVROMQBHMHxgcqmkjyYfsGGWYt6DlC3MUExbHQUHG4woSvE1VPlCX1
         3o14af+fneMTutNPRDprPMbaLsQ1EayB++KfaBE8lynmrsM7XJ3Slt6tMLEq4TY1KURc
         Ufh+Nr8+8iV1TfuKa4lXJmk2AjZA8oJfRFw5ZT+7CntfKK8j5Z8BCnUMSeaQhVG89BeW
         pT7nEE7qyjXZz25YLcRur6QyIDGWs0o5EEdiN/Ajelu5Tnvk68vV4s15b2OnIDkZ+M1H
         ChAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278757; x=1750883557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntRmOHLH3xEiTEq/EoUk0fd3KFAgQFaOvUegSbTQK3U=;
        b=WQ88traVQI9UuNNJgpaS0gChsghkENswbpmuCdytaZSHM2O5tglW28NTbMivx5URys
         H7T3MiQU+ErsAtRviSsRZd6G4nmCgvcRRhgsNMhpNARnU9f2okPE4VYlQJhjTFkafrAW
         bLlSvtrIw405j/4/r63LUWieZuWTpU85/guSMBqv4L3Z4JrDB2DyH7ROxu3xEHlgmwl4
         fG9jgr2nLolYpY2X6LFPrrZBNrUmBHOcWLwZv2Q9CdNsRvujR9B3Cxkee2U2ffyG+uuI
         RPNSCQzq79yFIBXk3+4i0rE9XlKlnWrmbsCv3FH/WYE+UDbMZQBW5CTctvotJ220DtKz
         S5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXelh7ysM5V4leSqc4uSr65sDXWR7JMHr6fnS6GdGhBqra2czo8++ar8b8yOipJTvBR74DoV7Xv5KNRKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvll1hv2QmzaqBTqgy8VybtF27AJ+8y86mvpLonyOVXV9L3cPY
	rYftFAP3Rt+gpj6UWrWLUS2WsLNAZqmc+BqNFrbDoQfI/IabPoO+OcKrjN5eBjgJwnc=
X-Gm-Gg: ASbGncse7Dg5GO1HRcFgOsn+DCIwZFgui0RSwBzVVNvE7vMV2/vac3rIok9NUh2ivaS
	zh42ZYVDIhsQVaqMc+V7k5PUrWkPPwBajLCu259FYiSzw4a1uvnihCcdpBm5wDiKRXpZOXttl0B
	h6raVYSgNeidJttji2jloW/HNWOzarl6nf2nHaVp3NQP3aDiGihlcNKDptqUICg13aPUkA6BkPw
	bpGUEuW9lopOxPwLJxmcowibOJVLTLm6PMgCHTPLSmNycU4jfknbHGrpNLvOalVRjkdAtkXnYe5
	IdcUMGiWCskbA6c0j4sxl1epuWGplLYdMlFXm6UdQF0P8mCEydqRiMuVDa2/I9NbS3442A==
X-Google-Smtp-Source: AGHT+IHMgROsrVFIEvJPOP9WQYpCWl2X79did0vflyJuKo93NX6XGwmaPK2BjdghvhNLmAeACUSIyw==
X-Received: by 2002:a05:6820:2f03:b0:611:11a3:7cd7 with SMTP id 006d021491bc7-61111a37e53mr7437630eaf.4.1750278757032;
        Wed, 18 Jun 2025 13:32:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108da85f6sm1450668eaf.12.2025.06.18.13.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:32:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/5] Staging: media: atomisp: i2c: hardcoded function name
Message-ID: <1e524a62-a180-4966-bc46-ced517fbe524@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:40AM +0200, Thomas Andreatta wrote:
> Checkpatch fix: use func instead of hardcoded function name
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 857d7175942c..f35d1a16f627 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -779,7 +779,7 @@ static void gc2235_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc2235_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);

Delete.

regards,
dan carpenter


