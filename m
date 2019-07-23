Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED077173D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfGWLhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 07:37:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:37194 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726575AbfGWLhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 07:37:53 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6798D634C87;
        Tue, 23 Jul 2019 14:37:45 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hpt72-0000Vp-N6; Tue, 23 Jul 2019 14:37:44 +0300
Date:   Tue, 23 Jul 2019 14:37:44 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] v4l2-dev/ioctl: require non-zero device_caps, verify
 sane querycap results
Message-ID: <20190723113744.GE1263@valkosipuli.retiisi.org.uk>
References: <1025a223-5625-2776-4524-473590a664eb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1025a223-5625-2776-4524-473590a664eb@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jul 23, 2019 at 10:21:25AM +0200, Hans Verkuil wrote:
> Now that all V4L2 drivers set device_caps in struct video_device, we can add
> a check for this to ensure all future drivers fill this in.
> 
> Also verify that when the querycap ioctl is called the driver didn't mess
> with the device_caps value and that capabilities is a superset of device_caps.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index cbb74f748555..3af72e3bbd65 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -859,6 +859,9 @@ int __video_register_device(struct video_device *vdev,
>  	/* the v4l2_dev pointer MUST be present */
>  	if (WARN_ON(!vdev->v4l2_dev))
>  		return -EINVAL;
> +	/* the device_caps field MUST be set */
> +	if (WARN_ON(!vdev->device_caps))
> +		return -EINVAL;
> 
>  	/* v4l2_fh support */
>  	spin_lock_init(&vdev->fh_lock);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e36629ae2203..61846c355627 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1057,14 +1057,18 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
> 
>  	ret = ops->vidioc_querycap(file, fh, cap);
> 
> -	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
>  	/*
> -	 * Drivers MUST fill in device_caps, so check for this and
> -	 * warn if it was forgotten.
> +	 * Drivers must not change device_caps, so check for this and
> +	 * warn if this happened.
> +	 */
> +	WARN_ON(cap->device_caps != vfd->device_caps);
> +	/*
> +	 * Check that capabilities is a superset of
> +	 * vfd->device_caps | V4L2_CAP_DEVICE_CAPS
>  	 */
> -	WARN(!(cap->capabilities & V4L2_CAP_DEVICE_CAPS) ||
> -		!cap->device_caps, "Bad caps for driver %s, %x %x",
> -		cap->driver, cap->capabilities, cap->device_caps);
> +	WARN_ON((cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=

This is over 80, it'd be nicer it it was wrapped.

Either way,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +	        (vfd->device_caps | V4L2_CAP_DEVICE_CAPS));
> +	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
>  	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;
> 
>  	return ret;

-- 
Kind regards,

Sakari Ailus
