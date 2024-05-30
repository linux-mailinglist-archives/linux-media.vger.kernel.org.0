Return-Path: <linux-media+bounces-12242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B808D4C71
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6454E1F22819
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583D18307E;
	Thu, 30 May 2024 13:20:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AC172BB5;
	Thu, 30 May 2024 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075200; cv=none; b=Gvum+x1IiT2eT3YvzW+3cSgu777yZ4aZx3Q2dqOz50VsCWwSElcR8llr8/DpBoMqAsDEm+YZHyu4S46Bzo2IEf9jFwCnsN1JsSLXeu8wbILWtFax/T5hgK2H+yLKLALAZRAEanVL/bPDK7Mye7P0a3qDYXSpOaA+Pcf9iurq2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075200; c=relaxed/simple;
	bh=MDOT65malcD6rP/s8pa7oK8QqVpVwkpRc8XURsDqUGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVeCUn/gyGyY7nr8dlvXEKbz7Cj+28oONHJbAigSpvLsL32BaXQ61k4pA+J09nviStiUl3HtwWhggv3syd8GqSRo60HHm4VV5aMrIO2dBjb+3idI6vFcK1R9AGOTIxJindDzenx2+ksZJPxEDtDL69E8FhAXFwkmOC9TH086SWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DF5C2BBFC;
	Thu, 30 May 2024 13:19:58 +0000 (UTC)
Message-ID: <27d438e0-8c57-4029-ba53-8f6995de6c33@xs4all.nl>
Date: Thu, 30 May 2024 15:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open
To: Ricardo Ribalda <ribalda@chromium.org>,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>,
 Jarod Wilson <jarod@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240506-cocci-locks-v1-0-a67952fe5d19@chromium.org>
 <20240506-cocci-locks-v1-5-a67952fe5d19@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240506-cocci-locks-v1-5-a67952fe5d19@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 23:10, Ricardo Ribalda wrote:
> Move the shared frontend logic to its own function. This allows using
> guard() to handle the mfe_lock mutex, and using lockdep asserts.
> 
> There is no intended change of behavior in this code.
> 
> This fixes the following cocci warnings:
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809

OK, this patch is really hard to review. And since it is refactoring core
framework code, I think this might work better if it is reworked.

I *think* (not 100% certain) that it is enough to just split off
__dvb_frontend_open.

The dvb_frontend_open() can then just do:

	if (!adapter->mfe_shared)
		return __dvb_frontend_open(inode, file);

and after that you can just take the mfe_lock and keep the existing code.
While you can introduce the use of guard(), I don't think it is necessary.
This keeps the 'get_shared_frontend' code in dvb_frontend_open() rather
then splitting it up, but I think this will produce a much more readable patch.

Which IMHO is really important for code like this.

Regards,

	Hans

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 116 ++++++++++++++++++++--------------
>  1 file changed, 69 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index 4f78f30b3646..d04a6092f1ba 100644
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
> @@ -2760,66 +2761,70 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
>  	return 0;
>  }
>  
> -static int dvb_frontend_open(struct inode *inode, struct file *file)
> +static int dvb_get_shared_frontend(struct dvb_adapter *adapter,
> +				   struct dvb_device *dvbdev,
> +				   struct file *file)
>  {
> -	struct dvb_device *dvbdev = file->private_data;
> -	struct dvb_frontend *fe = dvbdev->priv;
> -	struct dvb_frontend_private *fepriv = fe->frontend_priv;
> -	struct dvb_adapter *adapter = fe->dvb;
> -	int ret;
> +	struct dvb_device *mfedev;
> +	struct dvb_frontend *mfe;
> +	struct dvb_frontend_private *mfepriv;
> +	int mferetry;
>  
> -	dev_dbg(fe->dvb->device, "%s:\n", __func__);
> -	if (fe->exit == DVB_FE_DEVICE_REMOVED)
> -		return -ENODEV;
> +	lockdep_assert_held(&adapter->mfe_lock);
>  
>  	if (adapter->mfe_shared == 2) {
> -		mutex_lock(&adapter->mfe_lock);
>  		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
>  			if (adapter->mfe_dvbdev &&
>  			    !adapter->mfe_dvbdev->writers) {
> -				mutex_unlock(&adapter->mfe_lock);
>  				return -EBUSY;
>  			}
>  			adapter->mfe_dvbdev = dvbdev;
>  		}
> -	} else if (adapter->mfe_shared) {
> -		mutex_lock(&adapter->mfe_lock);
> +		return 0;
> +	}
>  
> -		if (!adapter->mfe_dvbdev)
> -			adapter->mfe_dvbdev = dvbdev;
> +	if (!adapter->mfe_dvbdev) {
> +		adapter->mfe_dvbdev = dvbdev;
> +		return 0;
> +	}
>  
> -		else if (adapter->mfe_dvbdev != dvbdev) {
> -			struct dvb_device
> -				*mfedev = adapter->mfe_dvbdev;
> -			struct dvb_frontend
> -				*mfe = mfedev->priv;
> -			struct dvb_frontend_private
> -				*mfepriv = mfe->frontend_priv;
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
> +	if (adapter->mfe_dvbdev == dvbdev)
> +		return 0;
>  
> -			mutex_lock(&adapter->mfe_lock);
> -			if (adapter->mfe_dvbdev != dvbdev) {
> -				mfedev = adapter->mfe_dvbdev;
> -				mfe = mfedev->priv;
> -				mfepriv = mfe->frontend_priv;
> -				if (mfedev->users != -1 ||
> -				    mfepriv->thread) {
> -					mutex_unlock(&adapter->mfe_lock);
> -					return -EBUSY;
> -				}
> -				adapter->mfe_dvbdev = dvbdev;
> +	mfedev = adapter->mfe_dvbdev;
> +	mfe = mfedev->priv;
> +	mfepriv = mfe->frontend_priv;
> +	mferetry = (dvb_mfe_wait_time << 1);
> +
> +	mutex_unlock(&adapter->mfe_lock);
> +	while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
> +		if (msleep_interruptible(500)) {
> +			if (signal_pending(current)) {
> +				mutex_lock(&adapter->mfe_lock);
> +				return -EINTR;
>  			}
>  		}
>  	}
> +	mutex_lock(&adapter->mfe_lock);
> +
> +	if (adapter->mfe_dvbdev != dvbdev) {
> +		mfedev = adapter->mfe_dvbdev;
> +		mfe = mfedev->priv;
> +		mfepriv = mfe->frontend_priv;
> +		if (mfedev->users != -1 || mfepriv->thread)
> +			return -EBUSY;
> +		adapter->mfe_dvbdev = dvbdev;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __dvb_frontend_open(struct inode *inode, struct file *file)
> +{
> +	struct dvb_device *dvbdev = file->private_data;
> +	struct dvb_frontend *fe = dvbdev->priv;
> +	struct dvb_frontend_private *fepriv = fe->frontend_priv;
> +	int ret;
>  
>  	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
>  		if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
> @@ -2871,8 +2876,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>  
>  	dvb_frontend_get(fe);
>  
> -	if (adapter->mfe_shared)
> -		mutex_unlock(&adapter->mfe_lock);
>  	return ret;
>  
>  err3:
> @@ -2892,11 +2895,30 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>  	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
>  		fe->ops.ts_bus_ctrl(fe, 0);
>  err0:
> -	if (adapter->mfe_shared)
> -		mutex_unlock(&adapter->mfe_lock);
>  	return ret;
>  }
>  
> +static int dvb_frontend_open(struct inode *inode, struct file *file)
> +{
> +	struct dvb_device *dvbdev = file->private_data;
> +	struct dvb_frontend *fe = dvbdev->priv;
> +	struct dvb_adapter *adapter = fe->dvb;
> +	int ret;
> +
> +	dev_dbg(fe->dvb->device, "%s:\n", __func__);
> +	if (fe->exit == DVB_FE_DEVICE_REMOVED)
> +		return -ENODEV;
> +
> +	if (!adapter->mfe_shared)
> +		return __dvb_frontend_open(inode, file);
> +
> +	guard(mutex)(&adapter->mfe_lock);
> +	ret = dvb_get_shared_frontend(adapter, dvbdev, file);
> +	if (ret)
> +		return ret;
> +	return __dvb_frontend_open(inode, file);
> +}
> +
>  static int dvb_frontend_release(struct inode *inode, struct file *file)
>  {
>  	struct dvb_device *dvbdev = file->private_data;
> 


