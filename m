Return-Path: <linux-media+bounces-6584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D28738F0
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 15:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A82C1F257CB
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 14:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407EF1339BA;
	Wed,  6 Mar 2024 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TESMI/qP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7613248E
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735048; cv=none; b=gZjuC6/o4feTkkaT8Ut9fio/UX2tHndA4aDNql+K1nT+gCNh44iZCfYoJ4NvI7fmimoe4+JSxL68vmd1TObb20Ep+BJ6ZNzyqdTQSGZC3BZly9smrRmgGj/w5NXXGOKTqIls0GQeX2WRW17jfR7OFsOpZC6NYQmSmmbuEwYpQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735048; c=relaxed/simple;
	bh=D55zblidkL3ckE+AmtkNPXQnODfYtAxEddZ5M/AL7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp99b+YZd/t6fsTSXoERd+A+h26GseogUYXgTNI947AqsoEl0wWI+4AyXFMR30fVVSZtBZODaKLblvML/7Rrjld1SO26hYXR3JXZ9QfJQK4BM7Qk85mtoFYpBh7qVbaRFeLp16f29C7h2ag4D+vX1bxrvmG/gfvQJHkGMY5xueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TESMI/qP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412f55695d1so5298435e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735045; x=1710339845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S4nfN6YbZjdl+jd88R4xaz7uFPn5Ccodd8JF1GyHVFM=;
        b=TESMI/qPEhqFVcI31ZSor4EC96UtXFfgUKcufD4oEMQmrEbAVDlsy+ZfLXeXCK0kWC
         10+CAWp1r0rwRZPRW3Yv89MWd7k3o+ZO2G5NNgQmINcH+7pxv2TuaDN/bSdKYMryInfI
         CHzaFATEhtz2Mnf3Rzwh/wY+H+sR4Chg5Y8gxLq0rqvZ3Ng8bAywuC1c/7N8D7qozgte
         C3AgD9V22Zet34RDPi8lNMW0vz0gbj+TSshuQmAThESzWGDzcumLPHjmNfALJvDUDMis
         v2PczK6PB1AGdSI6RO+YoeEYWqKJGAjc6/IQix5HuN522XMql82o4yuMnwGFfNH5rkIF
         rtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735045; x=1710339845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4nfN6YbZjdl+jd88R4xaz7uFPn5Ccodd8JF1GyHVFM=;
        b=ZWy28xqpteELuHM3BQiLVPs+H+FgBB09g38WpUtqtZWskv/Ghsz0AvpzfmdjI+Zr+p
         IAr1tkoHy3EWw2Y33LVLAre43LwJz8czzvrIwSSm8Mdf0Zh3Oso827ZQvm2rNYyyvF0d
         lASJ8vUwvG7NvDRO1rV3EkFNKUA8Gxl5S/C+dokIimpTagNBicLmnb4DWauDsXxP1KNr
         AyUyknzh75bg/YJPQeiPZz6TZhkwMtcqKqRkmoLrQ1HEaQIlw5x7U5SqfoN0ZCJ1mpBn
         9KU5vSCtaG650Lk8XP9Cu6t6kjMqhkMs3vp84x0vW2vRbtvZIfWY1lDtdnVAHbDowdHC
         IipQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfk3NUWhk/vdIKTOC0UXjrmydTrAICmmhtY6Wu/7eKhDxGdKdVIfj4rEZs46RaWWluDRZPuSkjyJgY6aH0HqWv4CDNrDY2cTMKNY4=
X-Gm-Message-State: AOJu0YxRgfoZnVhpXR0HlBZbkXtd1gNNDbuKVwqd/cmUOb2uXH1PkAVA
	eVoGEBfstxhkNa12jXwtKknuClx0/ul1omfNg6UoqbJ3pm6wRLmKC8XuD+2LTDwdQi+r4UAnP82
	j
X-Google-Smtp-Source: AGHT+IERmlyJCEwEASgOi5a4L2ybD14kuymZDGs7u2XrY8A0Ry6r+u23L39/I9/RdxpfQRdKBbC4GA==
X-Received: by 2002:a05:600c:a019:b0:412:e290:3dd1 with SMTP id jg25-20020a05600ca01900b00412e2903dd1mr6740090wmb.9.1709735045052;
        Wed, 06 Mar 2024 06:24:05 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00412a31d2e2asm21339809wmq.32.2024.03.06.06.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:24:04 -0800 (PST)
Date: Wed, 6 Mar 2024 17:24:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 4/7] staging: media: starfive: Add multi streams for
 ISP
Message-ID: <1efd7773-4b53-44dc-8885-4259b5823bb9@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-5-changhuang.liang@starfivetech.com>

On Wed, Mar 06, 2024 at 01:33:31AM -0800, Changhuang Liang wrote:
> ISP support multi streams output. Add stream_count to save the number
> of stream on.
> 

The ISP can support multiple output streams.  Introduce stream_count to
store the number of streams.  No functional change.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-isp.c    | 28 +++++++++++++------
>  .../staging/media/starfive/camss/stf-isp.h    |  1 +
>  2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> index 9b5745669fa6..1bfd336b14a1 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> @@ -92,15 +92,27 @@ static int isp_set_stream(struct v4l2_subdev *sd, int enable)
>  	src = stf_isp_g_index_by_mcode(fmt_t_src, fmt_src->code);
>  
>  	if (enable) {
> -		stf_isp_reset(isp_dev);
> -		stf_isp_init_cfg(isp_dev);
> -		stf_isp_settings(isp_dev, crop, fmt->code);
> -		stf_isp_config_yuv_out_stride(isp_dev, crop->width,
> -					      fmt_t_src->fmts[src].bpp);
> -		stf_isp_stream_set(isp_dev);
> -	}
> +		if (!isp_dev->stream_count) {
> +			stf_isp_reset(isp_dev);
> +			stf_isp_init_cfg(isp_dev);
> +			stf_isp_settings(isp_dev, crop, fmt->code);
> +			stf_isp_config_yuv_out_stride(isp_dev, crop->width,
> +						      fmt_t_src->fmts[src].bpp);
> +			stf_isp_stream_set(isp_dev);
> +
> +			v4l2_subdev_call(isp_dev->source_subdev, video,
> +					 s_stream, enable);

s/enable/true/

> +		}
> +
> +		isp_dev->stream_count++;
> +	} else {
> +		isp_dev->stream_count--;
>  
> -	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
> +		if (!isp_dev->stream_count) {
> +			v4l2_subdev_call(isp_dev->source_subdev, video,
> +					 s_stream, enable);

s/enable/false/

> +		}
> +	}

regards,
dan carpenter

