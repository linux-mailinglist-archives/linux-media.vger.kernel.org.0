Return-Path: <linux-media+bounces-26570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADDAA3F36C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2B2C3BC173
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8155D20A5D1;
	Fri, 21 Feb 2025 11:53:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598D209F58;
	Fri, 21 Feb 2025 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138803; cv=none; b=OgxL9WO/T1Dnsh7ifO3b8WO3n+HqVQ8LtqYhbvFD7WhLnOT9kSDwi6y9u5Y/3dv2DKROYD+u2CMqT/m0Ls8W0cwc4RFKP7X5TEOIdo1W3ywfj7xr+BeNDifsby40wAmxoQmgUmGfinIrbx0+y92ApKRVyGRsJjLRCBSafAlc03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138803; c=relaxed/simple;
	bh=Qv9L4McVK5QBI+vfse7b1xafWClLHFi8Xno6vCoVDFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJwuPuf+rFccUyr5GVxaNRaNL0fFKC0E50Vh3sX8/S0CxvBEEtunavKWL5n1luDK4ghGd1dlmNLkIsyM0rJKRJnyn5twq2rxtA/WuFWS0o2OsqKYT39h9dVZgYVEVYqrGavBrH+AZbGS07Ckc6Sgjf/d1RUYp423HV69d8nTqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD9AC4CED6;
	Fri, 21 Feb 2025 11:53:20 +0000 (UTC)
Message-ID: <fe6ae416-7d30-4d4d-b27a-fa8852abf86f@xs4all.nl>
Date: Fri, 21 Feb 2025 12:53:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
 <20241210-queryctrl-v2-1-c0a33d69f416@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241210-queryctrl-v2-1-c0a33d69f416@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2024 10:28, Ricardo Ribalda wrote:
> v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
> not implement v4l2_queryctrl we can implement it with
> v4l2_query_ext_ctrl.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 37 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 5bcaeeba4d09..252308a67fa8 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	   and that can't be tested here. If the bit for these control ioctls
>  	   is set, then the ioctl is valid. But if it is 0, then it can still
>  	   be valid if the filehandle passed the control handler. */
> -	if (vdev->ctrl_handler || ops->vidioc_queryctrl)
> +	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
> +	    ops->vidioc_query_ext_ctrl)
>  		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
>  	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
>  		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..7d615ebc511e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
>  	struct video_device *vfd = video_devdata(file);
> +	struct v4l2_query_ext_ctrl qec;

Zero this struct (qec = {}). The VIDIOC_QUERY_EXT_CTRL ioctl will zero everything
after the id field when called from userspace, but that does not happen if you call
the op directly, as you do below. So just zero it here instead.

Regards,

	Hans

>  	struct v4l2_queryctrl *p = arg;
>  	struct v4l2_fh *vfh =
>  		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> +	int ret;
>  
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_queryctrl(vfh->ctrl_handler, p);
> @@ -2294,7 +2296,40 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
>  		return v4l2_queryctrl(vfd->ctrl_handler, p);
>  	if (ops->vidioc_queryctrl)
>  		return ops->vidioc_queryctrl(file, fh, p);
> -	return -ENOTTY;
> +	if (!ops->vidioc_query_ext_ctrl)
> +		return -ENOTTY;
> +
> +	/* Simulate query_ext_ctr using query_ctrl. */
> +	qec.id = p->id;
> +	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
> +	if (ret)
> +		return ret;
> +
> +	p->id = qec.id;
> +	p->type = qec.type;
> +	p->flags = qec.flags;
> +	strscpy(p->name, qec.name, sizeof(p->name));
> +	switch (p->type) {
> +	case V4L2_CTRL_TYPE_INTEGER:
> +	case V4L2_CTRL_TYPE_BOOLEAN:
> +	case V4L2_CTRL_TYPE_MENU:
> +	case V4L2_CTRL_TYPE_INTEGER_MENU:
> +	case V4L2_CTRL_TYPE_STRING:
> +	case V4L2_CTRL_TYPE_BITMASK:
> +		p->minimum = qec.minimum;
> +		p->maximum = qec.maximum;
> +		p->step = qec.step;
> +		p->default_value = qec.default_value;
> +		break;
> +	default:
> +		p->minimum = 0;
> +		p->maximum = 0;
> +		p->step = 0;
> +		p->default_value = 0;
> +		break;
> +	}
> +
> +	return 0;
>  }
>  
>  static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
> 


