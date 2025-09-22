Return-Path: <linux-media+bounces-42911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBBB8F6BF
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870D33A34F2
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D9C2FD7BA;
	Mon, 22 Sep 2025 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBevXoa7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF58120E023;
	Mon, 22 Sep 2025 08:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528668; cv=none; b=jiHrXfjnVzL+9RKZLVwpOvs+x/kY/qJwVh2Wdc63fTYBqa3XNDHLYflqelboQIzGJEpR8QFuqZ7hWLxWzAOmfcEZj2a8ldyl3Md1N5uYZpthQZAVuqlqJxvLkVaStTnpxg0eutvrOn2x7ji5oITJRS1Nql2+xAZSPwKRqDY7I3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528668; c=relaxed/simple;
	bh=JIW9M3iR2HQQJJ0SVOTM9LqopydspXiw/QFO03vz47M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PjFAiSuvi1dOwQl0/NQXqlce4cBf5S6IWmfriqk1fdUDV3rMC3qVdRZZ9XwvyRzHBeKMTi0JIdxzAKMEVO5KDAKhndqtledPnscuGfRE8UoQg/llRiVD1lhPgOSsrPoVO3Kl7ce7MNXDBOuhd4a4zQC0qcwEelbgRCLriRhIOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBevXoa7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C6C4CEF5;
	Mon, 22 Sep 2025 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758528668;
	bh=JIW9M3iR2HQQJJ0SVOTM9LqopydspXiw/QFO03vz47M=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YBevXoa7hYL5A7UPZY6ccWB+dd6jEhpcBdgIQ5Y+u06CtYfOWAXsf+rPojGck/wPN
	 juUHHx6j/XxXudOplLPDkNQG9CaKd7u25jCeVkf6pvJ19zH7eZTSA+8Gyd35meaVBW
	 mUlPe7JCVRGPD77Ihv9ENCgPsVRcM6KBU1mxWCjLMCPFXw9BCNOpic6IBBfE7VNixH
	 oLHMeGrK80Ewp3EgBN12SU6HKdWGCVowoI2XFibjijuTMfPJ6dm4GZRqlCnKlWzBdR
	 /BzAVk8TCtEyPY/i7atr57W5qE7NU3ooGWcwtmV9obHbODWSssJN0eX0JThxmHxXuo
	 iVfAUd7KIp0dA==
Message-ID: <097124ea-cf9b-425c-bb5f-a305224328f6@kernel.org>
Date: Mon, 22 Sep 2025 10:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 07/10] media: v4l2-ioctl: Pass device state for
 G/S/TRY_FMT ioctls
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-7-b2c42426965c@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250919-vdev-state-v2-7-b2c42426965c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2025 11:55, Jai Luthra wrote:
> Now that video device state is accepted as an argument in ioctl
> implementations across all video device drivers, populate that argument
> with the actual state data.
> 
> Pass the active state for G_FMT and S_FMT ioctls, and the try state for
> TRY_FMT ioctl to drivers that have opted to use device state for format
> storage.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> --
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)

There is one more occurrence of this in v4l2_compat_ioctl32.c in function
ctrl_is_pointer() where vidioc_query_ext_ctrl is called.

Regards,

	Hans

> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 644f06521673ff7ce5b194335d50f0e375ca7f51..500fc20627c97ce70016f4524301835142b7bebd 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3070,6 +3070,21 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
>  }
>  EXPORT_SYMBOL(v4l_printk_ioctl);
>  
> +static struct video_device_state *
> +video_device_get_state(struct video_device *vfd, struct v4l2_fh *vfh,
> +		       unsigned int cmd)
> +{
> +	switch (cmd) {
> +	default:
> +		return NULL;
> +	case VIDIOC_G_FMT:
> +	case VIDIOC_S_FMT:
> +		return vfd->state;
> +	case VIDIOC_TRY_FMT:
> +		return vfh->state;
> +	}
> +}
> +
>  static long __video_do_ioctl(struct file *file,
>  		unsigned int cmd, void *arg)
>  {
> @@ -3078,6 +3093,7 @@ static long __video_do_ioctl(struct file *file,
>  	struct mutex *lock; /* ioctl serialization mutex */
>  	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
>  	bool write_only = false;
> +	struct video_device_state *state = NULL;
>  	struct v4l2_ioctl_info default_info;
>  	const struct v4l2_ioctl_info *info;
>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
> @@ -3090,6 +3106,9 @@ static long __video_do_ioctl(struct file *file,
>  		return ret;
>  	}
>  
> +	if (test_bit(V4L2_FL_USES_STATE, &vfd->flags))
> +		state = video_device_get_state(vfd, vfh, cmd);
> +
>  	/*
>  	 * We need to serialize streamon/off with queueing new requests.
>  	 * These ioctls may trigger the cancellation of a streaming
> @@ -3138,11 +3157,11 @@ static long __video_do_ioctl(struct file *file,
>  
>  	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
>  	if (info != &default_info) {
> -		ret = info->func(ops, file, NULL, arg);
> +		ret = info->func(ops, file, state, arg);
>  	} else if (!ops->vidioc_default) {
>  		ret = -ENOTTY;
>  	} else {
> -		ret = ops->vidioc_default(file, NULL,
> +		ret = ops->vidioc_default(file, state,
>  			v4l2_prio_check(vfd->prio, vfh->prio) >= 0,
>  			cmd, arg);
>  	}
> 


