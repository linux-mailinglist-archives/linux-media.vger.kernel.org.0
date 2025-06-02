Return-Path: <linux-media+bounces-33891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10726ACAC49
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 12:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F38A189DC41
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624F11F5846;
	Mon,  2 Jun 2025 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN6BQhXF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2842D7BF;
	Mon,  2 Jun 2025 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859063; cv=none; b=c6WkH8ishNLqJxZNkD1+H2WJ4X9eMIo9kqqtc9N7Ki0/RB4kwp7XYWrVw+XDulzJx6pJhDWUev7pk/4BtKQMWY1qgQFzdyC6+t6WJt/95sLa/O3uFXppcVMz5kWt9gLGyuoks6RrVixZzvIW7CxdUWXOeYAE3glqa3MqN8pJWbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859063; c=relaxed/simple;
	bh=49CE/luc5OMBXikwCko3fRANx1ylY3xXS/3fFqs5kYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOwc7lIj+r/39bMFX7R8F1+Boz0+HAdiGpupz6timHypDr4y3mRzUdqXlar7JoEHkVEcedOkG5sUDtFgCYSZIeU9+hTESwT7YXw6M2Xoa8tKIKSCcg46+WqXW1IlO3Aat7dDAKMzHnquiaakkBi4q9bE2v6D2tKiHZ+p6nWEC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN6BQhXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA6C4CEEB;
	Mon,  2 Jun 2025 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748859063;
	bh=49CE/luc5OMBXikwCko3fRANx1ylY3xXS/3fFqs5kYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dN6BQhXFH4KU9rKSVR9Gp3W6GsSIR9vFY1zWGNmSxUqUDiJS2F68wuacpVgI3uzRn
	 UMDMRUOSbglrAIuGJ8iB44+8I9nQHKfaWoqVnHPMcCFjt2yTAUmoK4v2nxWuqQ9ftg
	 45kbSXntFJJkiSZvOdjTTDcj95X2KlDxIyiKN1FVorEPJkv0qLjO8jOz4Y29psBTxo
	 olF2I9pKtn4TJpQxs1uhC391feI+MRlT1hHK/YFiJIi6eVUnVNAbXYtwQgYBoiVlhP
	 JfOzPfZQ6DXrDfxfyXuuDie/4qtfcd6gNKU/uN2pofC60ofuKMMVqR/C0wrMJ8cKM7
	 htKa6Z1KHfewg==
Message-ID: <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
Date: Mon, 2 Jun 2025 12:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 28-May-25 19:58, Ricardo Ribalda wrote:
> Right now we cannot support granular power saving on compat syscalls
> because the VIDIOC_*32 NRs defines are not accessible to drivers.
> 
> Use the video_translate_cmd() helper to convert the compat syscall NRs
> into syscall NRs.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
>  include/media/v4l2-ioctl.h           | 1 +
>  3 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
>  				    unsigned int cmd, unsigned long arg)
>  {
> -	/*
> -	 * For now, we do not support granular power saving for compat
> -	 * syscalls.
> -	 */
> -	if (in_compat_syscall())
> -		return uvc_v4l2_pm_ioctl(file, cmd, arg);
> +	unsigned int converted_cmd = video_translate_cmd(cmd);

It looks like something went wrong here and you did not test-compile this?
video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
so this should not compile.

You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
otherwise that symbol is not available.

Regards,

Hans



>  
>  	/* The following IOCTLs do need to turn on the camera. */
> -	switch (cmd) {
> +	switch (converted_cmd) {
>  	case UVCIOC_CTRL_QUERY:
>  	case VIDIOC_G_CTRL:
>  	case VIDIOC_G_EXT_CTRLS:
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  	return ret;
>  }
>  
> -static unsigned int video_translate_cmd(unsigned int cmd)
> +unsigned int video_translate_cmd(unsigned int cmd)
>  {
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  	switch (cmd) {
> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
>  
>  	return cmd;
>  }
> +EXPORT_SYMBOL(video_translate_cmd);
>  
>  static int video_get_user(void __user *arg, void *parg,
>  			  unsigned int real_cmd, unsigned int cmd,
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
>  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
>  			       void *mbuf, size_t array_size,
>  			       unsigned int cmd, void *arg);
> +unsigned int video_translate_cmd(unsigned int cmd);
>  
>  /**
>   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
> 


