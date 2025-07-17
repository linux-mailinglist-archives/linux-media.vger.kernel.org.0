Return-Path: <linux-media+bounces-37934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C0B08423
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD86418885C6
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 04:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B59202996;
	Thu, 17 Jul 2025 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOBCP8RO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276591FFC6D
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752727503; cv=none; b=ScV5PfaTF9FWJiZu3UhJ5nJRnaGdDmszxfoQtgsvLVsuPaH6snIlzl3O6UG9nKdARSZWtQ/0GZsk6zn75iKVTz9QbxmBPpywAYyzXJR6YxfUWMrze9keaXmbIkTZlrxW3ItGLjmgswCF1fR3fXh1woVb4Z0jzQvi6aFSjZcEs2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752727503; c=relaxed/simple;
	bh=xYY88o1HZHO/K9meJ92FwNw3WDacmrol27HB7s9lxng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBGlKD9kqghWpU6UtAVgK1d0Z4pWsUt6Ztiu28IH57NOxF1Yu1tNUtPQ5hNM1edxlDfnUm2arQBY018zEIti/dLdQjqI3Ywn69/95Au2tFIKmevS3vaKBCU9FEa3sz3xXeGrg2OtqUGYJd3AYWmVoklqlIUbxLhCYePrGz3byWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zOBCP8RO; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e64e87d49so334567a34.2
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752727501; x=1753332301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=zOBCP8ROTjU6dQtTHbwJI5I1zdAblQe3B2f966EtAokEGXWS6sbp/YA5ZO95dLsnc3
         KdmuyUR4gqBHLNqmh3WG5qM8fWuVhbOzo1dGAw8hMpRLyQSDTqfxq0GIA2ILsNKGP15X
         P+/JTYp3TecDJ/U4+JImEJ4xHQ/8MIKesG4gjdm2ApvLBKx6K/2E88my3c3vSwr2bUNo
         vlc1A5c4GKUGP6YihIzCxgeRfa0EbQIDB8go+q9DU+Ni8hg2Zx2G9/TpVkz46J1/7eTy
         eociT01XXpe7sqGyMFmvx76BroR1lFCB6cFUW7xEz9moB4ijMnNB79sLIC/HHxyS2eJN
         9org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752727501; x=1753332301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=JCIwUzsNMuSmmremMIqEe9iVfGoEAvrBte3Xf5prIwOu/QMYcVz1C9334FLBs991WS
         x1H9yfceVsu0B2xAYIWFRCxaPp5/t4xW990yeAKZyDZQz6v0TJS/LqtPhcY9dIssW2SP
         CO+g5QD1hR3NTNdfTpG0Bqb+1Uyq7Lmp+OTbsefV/zl/8asS1JG+ukcFjjYVImUm48Ra
         /7i10t+bBPratI/gY869qR1a6rMBgtoZlHe12dHfQSc31JaN6wU3baJ3HAGpRhk5lNzV
         FNI9uI+eh1kffmv/dVe3/qlH3HBRpOU5pLL4+WDTua9EzuV72sk0tgTD+esagMudP9B5
         2ckg==
X-Forwarded-Encrypted: i=1; AJvYcCVmEvL5l8h3mfK4H9Y5TPCIUY9yKkanTw/yO1Keip+vOXSwJ3fd1+U01JJg2/kIZkrvoDge055Smy9yLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxatLe2g06zeKwvb/qWACTGTvx4LQChN3f/qRRli6JWp5Tb2pAe
	7RieJKTK0LzwJlsXghWR1JK2ISsuHZf8pCBy9Fq2nEsBo0P2NA6GDBWV6DcyyrmFQTZu6Vr0vHM
	BSzCM
X-Gm-Gg: ASbGncv+rzKFc9oINojoADb4YF+8FJTtvmBORb57NP1y0DdVdNP7UHDmdSU2rghtMoo
	4zVSHA1kPzsFvwHceQzbGpEl9gzdGHxwFM0+/vhk/RWNMYqhKGOg5VSZ1KMAEl8dMvq8qZZaK1E
	OfBHdoIPCW7k0q3hzLFkpymNM9jyh5POI2eS9Yxfj6w5QseW3EkIIS5X1Sen8ewytajGEyBihJy
	iybZ6KTvgmA/JY+moenMlEW7gc9UDXAQflU4ZBx+72ttJCfqYzBRCUCfAL9m1SQF/zcdldRyfZu
	9yqD+TDLJX9UlRefy57u7OqNj/SeM8P5mDfgMeBksLJGmQfYAJVLkrKxYcfXIgXZIGnkPvwF/UU
	S0aGXqovxqvV/kaecDM+ImUqAS0lS
X-Google-Smtp-Source: AGHT+IE+DpDEa75xpbSgyLwwke9OcELJPLIznBHV4EgtqVLoSi+kaH/6b3ycchLcJ6wlacIG2Wojvw==
X-Received: by 2002:a05:6830:71a4:b0:72b:98d9:6b1c with SMTP id 46e09a7af769-73e66604fbcmr4375731a34.21.1752727501133;
        Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e776b0dc9sm202888a34.26.2025.07.16.21.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 21:45:00 -0700 (PDT)
Date: Thu, 17 Jul 2025 07:44:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <06f61db2-da3d-4de0-8ce5-04e135add870@suswa.mountain>
References: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 04:30:03AM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8b2f2213b0..d3b8e480065e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/cleanup.h>
>  
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> @@ -416,8 +417,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>  			     struct v4l2_format *f)
>  {
>  	struct video_device *vdev = video_devdata(file);
> +	struct atomisp_device *isp = video_get_drvdata(vdev);
> +

Delete this blank line.

> +	int ret;
>  
> -	return atomisp_set_fmt(vdev, f);
> +	scoped_guard(mutex, &isp->mutex)
> +	{
This open curly brace should have gone on the line before:

	scoped_guard(mutex, &isp->mutex) {

But actually just use:

	guard(mutex)(&isp->mutex);

It will hold the lock until the end of the function.

regards,
dan carpenter


> +		ret = atomisp_set_fmt(vdev, f);
> +	}
> +	return ret;
>  }


