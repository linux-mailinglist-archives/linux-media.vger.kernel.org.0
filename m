Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C663B3A307D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhFJQZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:25:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhFJQZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:25:31 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D7628D4;
        Thu, 10 Jun 2021 18:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623342213;
        bh=MZnu7jeHkrOC9ykNYM9T9iwN0lLDKaGxg+GIuh8egJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uKJvScU2kYUtm1Pqx88BCeAjDhFsgZ04IksyqaFWp2HNwIQLU0sJjCzQUkSBD0iWj
         Ar4/e8abXLgxhOWJDv6OJF7e6u8T4rSizDgjZZHHJ+p6depJSGjJsCXLwFH+rFsqbX
         Q0p+T6TWUKapKsNZg6hlHavy76nm94COIK99bI2U=
Date:   Thu, 10 Jun 2021 19:23:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 04/22] media: v4l2-ioctl: S_CTRL output the right value
Message-ID: <YMI8cobtlkzdBLnU@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:22AM +0100, Ricardo Ribalda wrote:
> If the driver does not implement s_ctrl, but it does implement
> s_ext_ctrls, we convert the call.
> 
> When that happens we have also to convert back the response from
> s_ext_ctrls.
> 
> Fixes v4l2_compliance:
> Control ioctls (Input 0):
> 		fail: v4l2-test-controls.cpp(411): returned control value out of range
> 		fail: v4l2-test-controls.cpp(507): invalid control 00980900
> 	test VIDIOC_G/S_CTRL: FAIL
> 
> Fixes: 35ea11ff8471 ("V4L/DVB (8430): videodev: move some functions from v4l2-dev.h to v4l2-common.h or v4l2-ioctl.h")
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 7b5ebdd329e8..b8f73a48872b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2266,6 +2266,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
>  		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
>  	struct v4l2_ext_controls ctrls;
>  	struct v4l2_ext_control ctrl;
> +	int ret;
>  
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_s_ctrl(vfh, vfh->ctrl_handler, p);
> @@ -2281,9 +2282,11 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
>  	ctrls.controls = &ctrl;
>  	ctrl.id = p->id;
>  	ctrl.value = p->value;
> -	if (check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
> -		return ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
> -	return -EINVAL;
> +	if (!check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
> +		return -EINVAL;
> +	ret = ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
> +	p->value = ctrl.value;
> +	return ret;
>  }
>  
>  static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,

-- 
Regards,

Laurent Pinchart
