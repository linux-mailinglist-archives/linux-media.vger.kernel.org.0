Return-Path: <linux-media+bounces-23601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE69F4DD4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07316167515
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73F31F755B;
	Tue, 17 Dec 2024 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y47Z/DhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845A1F5435
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445948; cv=none; b=pOf02naSZIcf4BgrF0kDr99/ajEm0DLVDP5l3Cugl22pHB8mebqgN+oIWEw8/nZtWrpDpCZRIrBvDARAUd5CRZFRgZwYAX2wtT1L1LipM8xC8qKCizByAFcX7qZ3rPs5R/ShYIbJHZGOH+LjWHG2I4PkjbIlfY0YUCMdgAgU0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445948; c=relaxed/simple;
	bh=3Ubj9tLOLeQOXJAw73fEpEnCWr2ogxKaByH+MeSQr5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2SilaSyX0rlh4QUWmriQJ5/ImCDB+Wp37bwpOwgbF7r27NxP5nVg1YXsFc1eOi4S6PDFBawS5cNKiSbNERe8MmRzyWb97oFAlssObmgNRfAyMo4uAv94DFkzjPtj6p4IbeB7lsjZwCDYo1fhphCz3M1MXN0rRYiclVFV0oDCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y47Z/DhJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa67f31a858so991077266b.2
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734445944; x=1735050744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJrjAGN0HBxyVLdP1Wdj0w8f0w665FhGinI5szPtW3o=;
        b=Y47Z/DhJ/ZawksS9aw/4puqjA6jV6KY+B5PZZKOF0HQpngRyZWPPeDEpuu00QRuALf
         fJ+bmbOterDM0fcPwYV7ttPq0bK3aw6oPlNDCEXJZc8jJFPGVhxobM5B0tPpbTT/5844
         5OvntECEY9os94CkPk6Mbvze0BpcpTQAylHA3Lhp2eMg/oDqR2gCkK/SpC9uRVDU6hPX
         8GkQ2wdLKGvcfeAGVfvKepWgFMzDy+deODm6IfKuCvlcTjegJecmjNW1Cu/K/lY1o4k2
         2hjtwN5+0ynzEwLai6tutwo07Y0VvHE8s3SB7qno3EWk7g6sU3rb5IE2CzrIYNhUkwQ6
         lfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445944; x=1735050744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJrjAGN0HBxyVLdP1Wdj0w8f0w665FhGinI5szPtW3o=;
        b=LtSF6Ll0EKNkiaWcmzT4mX1exeMZbdVsHQNBeR4/Ob4006ZKnh4okikFzLfrZfZGmw
         UKew08Gwicgju2SXhdkK6smnAnmUCFne8K+x3z7yOBcAhwH4wiX9IFG3HkAoBZQFXgFg
         QTwgIxTy9CwIHf4ok5aPA3+ChnlZHrtjWOnmPcVIQeKSoeMckC0ZhsLt27NrN6NVeIDh
         Z+PhXskxvVoeG8QVBwQF+EJN0tFOZISDFDO9HMNqvM7WB4y2YM/Xh3HC7rEdWd2QtWh7
         bZHBQpjTT81j9TcflczEH79zZWGW4BikpjuMEctle/mwx2vd0JJo7AG1hGgsLZQlUB3a
         4+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmypLFuyV3ro/i5GBLDaV1Ict52pH1UDyhK2UUoQ6h8cD8TKaYEssJcHb1pdIHTt8WIuh3ffH518vfig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJqB4xswRU0AeTSu7WUdRuSan99qZkFTJUY1nsP5EySDNlLB/
	8UQOWD2GZPgLSddGrrITVzYWBRsFGlshCEaVz3djZa+ROQrT7SCWNl6BR93dqno=
X-Gm-Gg: ASbGncual772ISfHjZ+yZlrXNSN8TyWtu4XynG5r5mMRlnr6LP+CG4FYpBOcv232o8L
	a5jERF5M62Xr6ZhDYAaqhMIJAbMj6f5qtvmupB+ckqai5XXY+Et6CnvcE/+MUYVuDjzUNJjy4Cv
	2HyHzK7GbqJ7mKB5vcJXG3d0W3iTJG68RiDu9YXXldpetUf7PgBLlGwdEJniIKf6rxsLLQVYyvv
	i61ekQDl6QzW+sScZPttOl7/EKQWdOPMb/a4xoZkgFFzeb18ykpVsArix2qlw==
X-Google-Smtp-Source: AGHT+IH9x0pYrHktYnakoA5SgdP2YJuanKQlm2iIM2vaxC+YI5jUFTED5F+X3kttC5lV/fK+9yL3gA==
X-Received: by 2002:a17:907:96a5:b0:aa6:9c08:cd3 with SMTP id a640c23a62f3a-aab77ec88d2mr1766174566b.48.1734445944410;
        Tue, 17 Dec 2024 06:32:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9600628asm455640466b.20.2024.12.17.06.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:32:24 -0800 (PST)
Date: Tue, 17 Dec 2024 17:32:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: balance the refcount in the error path
 of __video_register_device()
Message-ID: <7acd1758-1a3b-465a-b8eb-875a2f1cc18f@stanley.mountain>
References: <20241214084853.1781426-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214084853.1781426-1-joe@pf.is.s.u-tokyo.ac.jp>

On Sat, Dec 14, 2024 at 05:48:53PM +0900, Joe Hattori wrote:
> When the device_register() in __video_register_device() fails, current
> implementation does not decrement the refcount of the device which was
> obtained in device_initialize(). Balance the refcount by calling
> put_device() before jumping to the cleanup label.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 5bc3cb743bba ("[media] v4l: move v4l2 core into a separate directory")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5bcaeeba4d09..1e48778cd7de 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1058,6 +1058,7 @@ int __video_register_device(struct video_device *vdev,
>  	mutex_lock(&videodev_lock);
>  	ret = device_register(&vdev->dev);
>  	if (ret < 0) {
> +		put_device(&vdev->dev);

You're very brave.  ;)  I've looked at this before and concluded that it
was better to leak.

For example, when this is called from zoran_init_video_device() via
video_register_device() then the release function is zoran_vdev_release()
which will free vdev.  So the goto cleanup will have use after frees.

I don't think there is a way to fix some of this.

regards,
dan carpenter

>  		mutex_unlock(&videodev_lock);
>  		pr_err("%s: device_register failed\n", __func__);
>  		goto cleanup;
> -- 
> 2.34.1
> 

