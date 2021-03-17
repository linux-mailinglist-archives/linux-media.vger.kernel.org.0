Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614C233EFB6
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 12:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhCQLkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 07:40:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42721 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231348AbhCQLjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 07:39:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MUWilAUKrGEYcMUWmlNJRm; Wed, 17 Mar 2021 12:39:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615981192; bh=9gTwjo4wrLiBHinK1nJlnhn0Jbicl4JlCeOmkBNlrPA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JeI/AYk85pSMdb3Lndmc6qWKok7TZ50l4Di5SnMGcwDrbwBCYKzweG67YiNb1kd7o
         1YlzyEpX6bQwi159HvQqZGkcIRL5dj6NtYrKziufuNO4gvKIURwxwxuIRtvgIpMZIX
         klcWL1gPcwao4wsYHHmFP1AeKB753JvY7G7N2mJJuiLpNNGPi+x/2UB1uB6I+4kBC4
         YOnBa3zemb6S20jyTh8F7tr2ddHGgB+H830tmICBug0g01iS4Du8h9mimqrehFHUq/
         1napf0btGgNd3027jWleI4W36onRvn82YR8kstrjlvQThmPsrdTiSPz3ZNgFiYVWjS
         BkCtkBZNrCVbg==
Subject: Re: [PATCH v5 12/13] media: v4l2-ioctl: Set error_idx to the right
 value
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-13-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6ae5c944-3257-d74e-d061-6d4704e7df88@xs4all.nl>
Date:   Wed, 17 Mar 2021 12:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-13-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO2M0hqNjzqleOGCaN035EddLIduT695iILznWZlBWtCSywoE/dbDAx2lQitBrRKG9Zmd1igVnrFYakmCFdZMMyr+p4XR1AuNZPlqpNaxCRW1GEce3Pg
 Fuswk0SZCg61kn/lpp5UbKShXgrjwhzQWkQepQDrIHa1XGLRNAa8wZgVxUYDmcAH9xumCic3QXmvJRgDvU2v1nV9K0OOcya5h9GkvqhQyNeGPzmDZVn8BpNe
 G38FWtK+yqrlOEaqM+aWlSPIiC0IuMGDovlOnM36d8afwM2c5FIRuJVQbB85VxXo/Eom25adIqd61RjI/ZBga0SSc1VxveYbstQ7z/mAUVXkCdJyQsQ1LL3w
 TGhB8mdpNXGSJWGfnSplp5yTN0kCasLM/d7BtvxlzRcTsgIWesJTeH1J9cll8dKzqhhuN+Mw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 19:00, Ricardo Ribalda wrote:
> If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
> indicate to userspace that no actual hardware was touched.
> 
> It would have been much nicer of course if error_idx could point to the
> control index that failed the validation, but sadly that's not how the
> API was designed.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
> 	warn: v4l2-test-controls.cpp(834): error_idx should be equal to count
> 	warn: v4l2-test-controls.cpp(855): error_idx should be equal to count
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 
> Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9406e90ff805..936ae21a0e0e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2294,8 +2294,12 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  					vfd, vfd->v4l2_dev->mdev, p);
>  	if (ops->vidioc_g_ext_ctrls == NULL)
>  		return -ENOTTY;
> -	return check_ext_ctrls(p, 0) ? ops->vidioc_g_ext_ctrls(file, fh, p) :
> -					-EINVAL;
> +
> +	if (check_ext_ctrls(p, 0))
> +		return ops->vidioc_g_ext_ctrls(file, fh, p);
> +
> +	p->error_idx = p->count;
> +	return -EINVAL;
>  }
>  
>  static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> @@ -2315,8 +2319,11 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  					vfd, vfd->v4l2_dev->mdev, p);
>  	if (ops->vidioc_s_ext_ctrls == NULL)
>  		return -ENOTTY;
> -	return check_ext_ctrls(p, 0) ? ops->vidioc_s_ext_ctrls(file, fh, p) :
> -					-EINVAL;
> +	if (check_ext_ctrls(p, 0))
> +		return ops->vidioc_s_ext_ctrls(file, fh, p);
> +
> +	p->error_idx = p->count;
> +	return -EINVAL;
>  }
>  
>  static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> 

No, this patch is wrong. In all cases where check_ext_ctrls() is called the
code had already set error_idx to count. The real culprit is check_ext_ctrls()
that sets error_idx to the index of the failing control. But it can only do that
for the TRY ioctl.

In my review of patch 1 I mentioned that adding a bool is_get is a good idea.
I now this that it is best to pass the ioctl (G/S/TRY_EXT_CTRLS) instead and
based on that set error_idx here. In fact, if v4l_g/s_ctrl pass G/S_CTRL as the
ioctl argument to check_ext_ctrls(), then the allow_priv argument can be dropped
as well, since that can be decided based on the ioctl for which this function is
called.

Regards,

	Hans
