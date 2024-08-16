Return-Path: <linux-media+bounces-16367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDD9543C3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 10:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077B1285A76
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 08:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5B712C549;
	Fri, 16 Aug 2024 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEeDIR7O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEB81D69E;
	Fri, 16 Aug 2024 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723796215; cv=none; b=TIAOwlCumP5hdXuk07IuIVa1aQgun5APGlQP62NM5q4GIrljGsfNPxkYxIQGBEbb5uCfbrsnwvnMRsusBy91gTy1z1x5kxJDJ4vWZEaqBlF7tF9VIGlL8xxWXVBpnpgReJJvSAeKOXOTOvUC+TplywG5rwABra5DT95QihLWoDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723796215; c=relaxed/simple;
	bh=2KW7ZfCfAPxL/c/Dj8juAjP5x/6affa9XObmS8J9Yhs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7UPK5zNppQlT5xQL4F0r9low50htGVUNzKdW+nDL95hsbf4TuW6isIieGCcHMPGx8O7KZGUF0rMDvs/gTnWgMEzIrqCbSKhjgKTs+YFQOsrKq77bTdyUvjNVntXH9voYr+RCMGe3EuCgPdJ5pO12++8/2wlNQFnNPtWY/tXZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEeDIR7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6222DC4AF09;
	Fri, 16 Aug 2024 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723796215;
	bh=2KW7ZfCfAPxL/c/Dj8juAjP5x/6affa9XObmS8J9Yhs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HEeDIR7O1mP0wljV1V72QP8QXruC2zG4FfvIXuI9/HIaXcH+Jpro7g08QP3JCi59P
	 AySmbsqFOFtlEIkve7stuiBxFrL2BQyoEKCaFSOE8f5PCAepUU/00ppRPsDuS1Wfr8
	 zzGyAiaGX1asJYnoVnfrNUlJwcPEQ/6DPXrvg4jFUNVzunkZ/J3YPRKsMsO/LIWyZk
	 8Ln/M25m6YEYyzLqmQrNwkVjJ+UqPwP8tbGnkUDk1b9ZYvTCZK0USBP/FQT9IPVAf3
	 joVaU1xDlrvzdu470RGwJiCKfkxuraLBEe4IqZwFokV3ZADBbiEmUlL6A3rHDEDrEm
	 pEguyI1K9ZCIw==
Date: Fri, 16 Aug 2024 10:16:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Message-ID: <20240816101642.5ef4e461@foz.lan>
In-Reply-To: <20240814-coccinelle-followup-v2-2-88b4e4a9af56@chromium.org>
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
	<20240814-coccinelle-followup-v2-2-88b4e4a9af56@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Aug 2024 14:10:23 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> Split out the wait function, and introduce some new toys: guard and
> lockdep.
> 
> This fixes the following cocci warnings:
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809

Hi Ricardo,

Every time someone tries to fix this lock, we end having regression reports,
because of the diversity of devices, and the way they registers there.

That's specially true for devices with multiple frontends and custom
zigzag methods.

On what devices have you tested this patch?

Regards,
Mauro

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 58 ++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index e81b9996530e..7f5d0c297464 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -30,6 +30,7 @@
>  #include <linux/kthread.h>
>  #include <linux/ktime.h>
>  #include <linux/compat.h>
> +#include <linux/lockdep.h>
>  #include <asm/processor.h>
>  
>  #include <media/dvb_frontend.h>
> @@ -2826,6 +2827,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
>  	return ret;
>  }
>  
> +static int wait_dvb_frontend(struct dvb_adapter *adapter,
> +			     struct dvb_device *mfedev)
> +{
> +	struct dvb_frontend *mfe = mfedev->priv;
> +	struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
> +	int mferetry = (dvb_mfe_wait_time << 1);
> +	int ret = 0;
> +
> +	lockdep_assert_held(&adapter->mfe_lock);
> +
> +	if (mfedev->users == -1 && !mfepriv->thread)
> +		return 0;
> +
> +	mutex_unlock(&adapter->mfe_lock);
> +
> +	while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
> +		if (msleep_interruptible(500))
> +			if (signal_pending(current)) {
> +				ret = -EINTR;
> +				break;
> +			}
> +	}
> +
> +	mutex_lock(&adapter->mfe_lock);
> +
> +	return ret;
> +}
> +
>  static int dvb_frontend_open(struct inode *inode, struct file *file)
>  {
>  	struct dvb_device *dvbdev = file->private_data;
> @@ -2840,19 +2869,16 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>  	if (!adapter->mfe_shared)
>  		return __dvb_frontend_open(inode, file);
>  
> +	guard(mutex)(&adapter->mfe_lock);
> +
>  	if (adapter->mfe_shared == 2) {
> -		mutex_lock(&adapter->mfe_lock);
>  		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
>  			if (adapter->mfe_dvbdev &&
> -			    !adapter->mfe_dvbdev->writers) {
> -				mutex_unlock(&adapter->mfe_lock);
> +			    !adapter->mfe_dvbdev->writers)
>  				return -EBUSY;
> -			}
>  			adapter->mfe_dvbdev = dvbdev;
>  		}
>  	} else {
> -		mutex_lock(&adapter->mfe_lock);
> -
>  		if (!adapter->mfe_dvbdev) {
>  			adapter->mfe_dvbdev = dvbdev;
>  		} else if (adapter->mfe_dvbdev != dvbdev) {
> @@ -2862,34 +2888,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>  				*mfe = mfedev->priv;
>  			struct dvb_frontend_private
>  				*mfepriv = mfe->frontend_priv;
> -			int mferetry = (dvb_mfe_wait_time << 1);
> -
> -			mutex_unlock(&adapter->mfe_lock);
> -			while (mferetry-- && (mfedev->users != -1 ||
> -					      mfepriv->thread)) {
> -				if (msleep_interruptible(500)) {
> -					if (signal_pending(current))
> -						return -EINTR;
> -				}
> -			}
>  
> -			mutex_lock(&adapter->mfe_lock);
> +			ret = wait_dvb_frontend(adapter, mfedev);
> +			if (ret)
> +				return ret;
> +
>  			if (adapter->mfe_dvbdev != dvbdev) {
>  				mfedev = adapter->mfe_dvbdev;
>  				mfe = mfedev->priv;
>  				mfepriv = mfe->frontend_priv;
>  				if (mfedev->users != -1 ||
> -				    mfepriv->thread) {
> -					mutex_unlock(&adapter->mfe_lock);
> +				    mfepriv->thread)
>  					return -EBUSY;
> -				}
>  				adapter->mfe_dvbdev = dvbdev;
>  			}
>  		}
>  	}
>  
>  	ret = __dvb_frontend_open(inode, file);
> -	mutex_unlock(&adapter->mfe_lock);
>  
>  	return ret;
>  }
> 



Thanks,
Mauro

