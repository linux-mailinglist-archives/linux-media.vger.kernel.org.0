Return-Path: <linux-media+bounces-19839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D95919A3521
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 08:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66814B2144A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F42C17E8E2;
	Fri, 18 Oct 2024 06:13:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1020E30C;
	Fri, 18 Oct 2024 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231984; cv=none; b=B0FgvvFL/VNl+cKsZ14RRCevSeYKvXn73l+MS7bHzj6aMRkOgMGarOrjLTEJJU1nYLSRmFJT2stQzN4XQTbaI58eSHyfg2xbZ0EGvQhsX/at5nWcnxnaRbUniG9h3GinY7EBHySIEYVz4ipycOPf5iCVEdq3lGXeS+gIw5sr0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231984; c=relaxed/simple;
	bh=4zn77wTjy2lY0YdfdyQ+2BV/N2BJFqLRbeXxSX+m6Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/UNIaYqoYie7JvCmpMvDz/DPLRuiB8flvwFVuP6nHg0q+gXVa900j2sJ8k8IX8Hh3WjkNnDH2OiWtqNMfix4eYSEn5DInBEk52TFACrR+tsiCBmuWIQH/6kwpel56gi9434abBH2cvumfX5oEGyv7srniL93XvurZarqcB9SOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D10C4CEC3;
	Fri, 18 Oct 2024 06:13:03 +0000 (UTC)
Message-ID: <2caf0dfc-6d7c-4561-b126-4f3c654706fe@xs4all.nl>
Date: Fri, 18 Oct 2024 08:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for
 v4l2_g_ctrl()
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
 <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2024 07:53, Mauro Carvalho Chehab wrote:
> As detected by Coverity, the error check logic at get_ctrl() is
> broken: if ptr_to_user() fails to fill a control due to an error,
> no errors are returned and v4l2_g_ctrl() returns success on a
> failed operation, which may cause applications to fail.
> 
> Add an error check at get_ctrl() and ensure that it will
> be returned to userspace without filling the control value if
> get_ctrl() fails.
> 
> Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index e5a364efd5e6..a0de7eeaf085 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -753,9 +753,10 @@ static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control *c)
>  		for (i = 0; i < master->ncontrols; i++)
>  			cur_to_new(master->cluster[i]);
>  		ret = call_op(master, g_volatile_ctrl);
> -		new_to_user(c, ctrl);
> +		if (!ret)
> +			ret = new_to_user(c, ctrl);
>  	} else {
> -		cur_to_user(c, ctrl);
> +		ret = cur_to_user(c, ctrl);
>  	}
>  	v4l2_ctrl_unlock(master);
>  	return ret;
> @@ -770,7 +771,10 @@ int v4l2_g_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_control *control)
>  	if (!ctrl || !ctrl->is_int)
>  		return -EINVAL;
>  	ret = get_ctrl(ctrl, &c);
> -	control->value = c.value;
> +
> +	if (!ret)
> +		control->value = c.value;
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(v4l2_g_ctrl);
> @@ -811,10 +815,12 @@ static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
>  	int ret;
>  
>  	v4l2_ctrl_lock(ctrl);
> -	user_to_new(c, ctrl);
> +	ret = user_to_new(c, ctrl);
> +	if (ret)
> +		return ret;

A lock was taken above and that isn't unlocked here.

It is better to write this as:

	if (!ret)
		ret = set_ctrl(fh, ctrl, 0);

>  	ret = set_ctrl(fh, ctrl, 0);
>  	if (!ret)
> -		cur_to_user(c, ctrl);
> +		ret = cur_to_user(c, ctrl);
>  	v4l2_ctrl_unlock(ctrl);
>  	return ret;
>  }

Regards,

	Hans

