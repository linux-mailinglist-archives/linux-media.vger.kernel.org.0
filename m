Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD79F342C69
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 12:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhCTLnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 07:43:13 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55541 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229546AbhCTLm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 07:42:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NVyRldoar4XAGNVyVlQ9S7; Sat, 20 Mar 2021 08:24:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616225083; bh=kSJ5k+bpHBDO+CZzejHLlhAkhS4Tn9q6YhrEPeg93Cs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QZRxAKjt2vCx6og3grP1SOssj7wnqDiN57v1joEYhZcuEQN28OsL1JUsI/K2fsF+d
         1RIVgQnDyPGTzTzBPL/oUrAurmeevXhdI2Ritpgc7ytrs9EhPHKHiLg4MmHGmOcGf9
         LSRzoBveQzO1tYU6KbbsHWhCouGZCkCfEkqijOTAIwCrKyqdi1Gi/8D+4avgwQTPhb
         Ro4uIhKDGOIUWaD256rPm0eTrMDcR9YMu0u1qU1eYk4Bs03eHAejhrOMvH7ds2srHq
         sGRg1P30BOkL/05GovPx4G1KimHCOh0+E5ms7k13wkNoar5S2VSofcugVCeDnz4zOW
         HePrzNeH+9r/A==
Subject: Re: [PATCH v8 04/19] media: v4l2-ioctl: S_CTRL output the right value
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210319170906.278238-1-ribalda@chromium.org>
 <20210319170906.278238-5-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <54749b51-ed1c-d2f9-caf2-3cd34597535d@xs4all.nl>
Date:   Sat, 20 Mar 2021 08:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319170906.278238-5-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC+YPWBQmjhTbgkfM5CR/oYduPN30JO/87SZfLICKt4VedEqpJf3BusQV71T+pyQojIh7FW0Wz6Fr5Nr5z6pY4bvKmrzuTiQDvVj0ZEIHyrWByBk2Smv
 A1YkfkaonVVO07dkdWMj40D+gpDUiktO3Jt10kuHxcCnr+PJ5ZYGzHvO9gUmW+8ZE9De3IcEr2/7SWpzl0MLic7JJdV2tTQg0DMJa54kHVe3/YgSJkRVgUQZ
 9M8BgZrPbSxBof/RELDl2hx1UiAxJP+Cc7iLnFUWQEOtZlN7xdDzf/NTb5maEhbDisq6sIV45pxgHP7SHlInUwc1//xlrTl+4LqcEwbwKLpUBWTo/VV1RQu2
 +kvUaJoI/HEWPQw/ro1k/IE8okGzlUiQypJG1A5p+4LDB2VkZoN9b/QIoQ0TGeHFbhXzPfPf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/03/2021 18:08, Ricardo Ribalda wrote:
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
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

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
> 

