Return-Path: <linux-media+bounces-12275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AB58D524D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C368B2313D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA38E14B972;
	Thu, 30 May 2024 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xdx+L+gQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188C14B953
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097278; cv=none; b=DCNXi3ukejNshX4nkZ1rmS+/4wi7bUw/ZL3kDviZNL2WuErSAMTaH7cqbgSQvTJP334ryqTaFbhBk6k4B4Uy2ZRlujsbPBfr/K2FxwrHCu7for/jEGv1ttwQnWTkTy6HsFsbf15cgaHdayxIZlFaLLvox3GLEqhgCyStRG1NKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097278; c=relaxed/simple;
	bh=gXVNdYu258OKW63xO71MUCbjsiQBbMTBvWwPSThViGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLW899+Bvv15XiG9EbTLVMU4YBY9GRWJfjQr9zCwi71bJ9flVDgP7EMxYS12K7mXNC5+WpZgPFwFTm78VYodW4VozOJN+eZtIzGZk6qMpui1yzL1SgxlJdHCYvn0sXpwwf7rYD9E1TxswIpLYGFXMAYbfx3ZxCpU+aVsZlFexLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xdx+L+gQ; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7e24aa659abso7111239f.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097275; x=1717702075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Uex8kgQbo+cqnDBRnzByK7pb0Nkt9DWsU+9pDQbfIY=;
        b=Xdx+L+gQdf+zHFE89fRTjn+eWpCRSwUlL2ftmODV6wRPW9JK1VxCBHZMXmA75Q0/qC
         eMWtC0li/PH+uERUBESyfqxKRnYHkIqyD8FPsOqxzEygA9WYfAgGLFrCuzQnxufUk+bi
         4KH0oX7/7wZzqRBCszesUAmXt7BJ8HS8eMKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097275; x=1717702075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Uex8kgQbo+cqnDBRnzByK7pb0Nkt9DWsU+9pDQbfIY=;
        b=oNM5IYHifJ2aJ9+nOnyxk3GkVJGEiPqOtVi8mjoTNX9VwiKPa30EgHLW/R0pKQQQYV
         jLrtQ4lg5yabqkjxqlFhgC8dk5FeMK6bI1/bPmp/1KgW3jGZtGO/xofmeH0Kww4SXVDp
         Gtp1DIO68Nm+cxqqMA+1ArioVB5/xydjteG4IZj1vIKw5+zHxfcGkWsrKc5DkHs3/1Nm
         2dYkuXG/QHe86K+GXMk3mkiWIDNwGbBHCZ4/FrmWO59fMYz1NvWEdDxCT3wIhD0k+wVn
         i5GbsNznSo2DN/WYccXkH+fbYEAPVrY1u8mpNqaSY6pgS9nKiAstkBCIeZUVmxpejoDH
         lQMw==
X-Forwarded-Encrypted: i=1; AJvYcCU3nR0qUJ5ScOmYupm5kn798VySVnNj1ASqtPQu7qHI+W64F9osjSnhD9gK0slcr4KIaV50AtCI7H3eBhf3YAxPpFq+n7v3DpFnCYg=
X-Gm-Message-State: AOJu0YxQxo8Eg/0LRIxPdUAsxE+4t+oObdMwYOnCZA10rCz+BtAVI1yH
	elcy7pPPn5P+28cjcoL6/FGFTvCaqTOAD4LA8o8mXyksyWrlozBVCZjsss6RUP0=
X-Google-Smtp-Source: AGHT+IHCyTgqKiBajMLwrANC0lD/p4J0VuSh3ru5QzWmPFqNn3nUFWU1nL9t0EvZW1YNoDtD8WqcnA==
X-Received: by 2002:a05:6602:3344:b0:7de:b279:fb3e with SMTP id ca18e2360f4ac-7eaf5d6865bmr298708039f.1.1717097274691;
        Thu, 30 May 2024 12:27:54 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48b8a6dfbsm72882173.102.2024.05.30.12.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:27:54 -0700 (PDT)
Message-ID: <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
Date: Thu, 30 May 2024 13:27:53 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> The .init_state() operations of the debayer and sensor entities iterate
> over the entity's pads. In practice, the iteration covers a single pad
> only. Access the pad directly and remove the loops.
> 

I am not seeing much of a reason to do this. This code is good
even when num_pads change.

Don't change the loops.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-debayer.c |  9 +++------
>   drivers/media/test-drivers/vimc/vimc-sensor.c  | 10 +++-------
>   2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index d72ed086e00b..e1bf6db73050 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -155,16 +155,13 @@ static int vimc_debayer_init_state(struct v4l2_subdev *sd,
>   {
>   	struct vimc_debayer_device *vdebayer = v4l2_get_subdevdata(sd);
>   	struct v4l2_mbus_framefmt *mf;
> -	unsigned int i;
>   
>   	mf = v4l2_subdev_state_get_format(sd_state, 0);
>   	*mf = sink_fmt_default;
>   
> -	for (i = 1; i < sd->entity.num_pads; i++) {
> -		mf = v4l2_subdev_state_get_format(sd_state, i);
> -		*mf = sink_fmt_default;
> -		mf->code = vdebayer->src_code;
> -	}
> +	mf = v4l2_subdev_state_get_format(sd_state, 1);
> +	*mf = sink_fmt_default;
> +	mf->code = vdebayer->src_code;
>   
>   	return 0;
>   }
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 5e34b1aed95e..b535b3ffecff 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -44,14 +44,10 @@ static const struct v4l2_mbus_framefmt fmt_default = {
>   static int vimc_sensor_init_state(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state)
>   {
> -	unsigned int i;
> +	struct v4l2_mbus_framefmt *mf;
>   
> -	for (i = 0; i < sd->entity.num_pads; i++) {
> -		struct v4l2_mbus_framefmt *mf;
> -
> -		mf = v4l2_subdev_state_get_format(sd_state, i);
> -		*mf = fmt_default;
> -	}
> +	mf = v4l2_subdev_state_get_format(sd_state, 0);
> +	*mf = fmt_default;
>   
>   	return 0;
>   }

thanks,
-- Shuah

