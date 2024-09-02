Return-Path: <linux-media+bounces-17393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC1D968E9E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFEAC28383C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8781C62D6;
	Mon,  2 Sep 2024 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fsyOdO+o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029619CC29;
	Mon,  2 Sep 2024 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307243; cv=none; b=SGpqShw/kr/EqS9W9c1M56BlICumRG3DqeU8746XWtPtR5EbMCB8ZA8IsQpszoSD3psF+z8YkGFysku2BnkuJ/Xf4Fak6A6e2Ar/M7s7WcaAqIGqAWIu2Q1JQ/X7c6DE3ssoaQNNikIOvKAFMy7MdM+K2UCEVGBEhRGJfdw84Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307243; c=relaxed/simple;
	bh=8BLO+XQ9cUWqwC9eRwZcfMlSqY0nFKS3INemLMPVcbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIFuvagYskrhmKYQ4qwKRmqjVWxU7iGJjZnCZli4X0ldglGa2bnKF1s/HJqRFZtnzdV4s5pNqjPvrGUJrO7/k5mK1Ff10WQveyPXd+MYUw/BdzxWOazhmGsu0jLV5phZ8dX1rOZVSNhmoz/1tzuqOX5IbrGiGoIBb0v8iIBweTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fsyOdO+o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 561864CE;
	Mon,  2 Sep 2024 21:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725307166;
	bh=8BLO+XQ9cUWqwC9eRwZcfMlSqY0nFKS3INemLMPVcbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsyOdO+oBJGzrFnAVjzzJc0lbIB72/iZYMd4tDm6E+mGESQ19Nnijqze4Sq7mMTn8
	 5uAaPrJzL+zuhg9bCUd4EyZbu+ebV5/8Fahgiiw5sBNO5NYPI/wxoTT7E3vdfKVKfZ
	 L//C6jZiOOEgPhq4OSkFOzWkfUZHsZlgTx3OOBr0=
Date: Mon, 2 Sep 2024 23:00:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: bbara93@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 5/7] media: i2c: imx290: Avoid communication during
 probe()
Message-ID: <20240902200004.GR1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-5-b32a12799fed@skidata.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902-imx290-avail-v3-5-b32a12799fed@skidata.com>

On Mon, Sep 02, 2024 at 05:57:30PM +0200, bbara93@gmail.com wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> As we don't know the mode during probe(), it doesn't make sense to
> update the sensors' registers with assumptions. Avoid the communication
> in this case.

That doesn't seem right. I think you can fix the problem by
moving initialization of the controls at probe time after the device
gets runtime-suspended. Please try it, and if it doesn't work, let's
figure out why.

> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v2:
> - new
> ---
>  drivers/media/i2c/imx290.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ece4d66001f5..9610e9fd2059 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -769,6 +769,10 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (!pm_runtime_get_if_in_use(imx290->dev))
>  		return 0;
>  
> +	/* V4L2 controls values will be applied only when mode is known */
> +	if (imx290->current_mode == &imx290_mode_off)
> +		return 0;
> +
>  	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
>  	format = v4l2_subdev_state_get_format(state, 0);
>  

-- 
Regards,

Laurent Pinchart

