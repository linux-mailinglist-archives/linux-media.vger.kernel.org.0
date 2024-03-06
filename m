Return-Path: <linux-media+bounces-6585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694018738FB
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 15:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5F928495A
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 14:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB81C132C16;
	Wed,  6 Mar 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XrN62mpo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E97130E40
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735173; cv=none; b=hyjcfgpWluVxMHI/yfAk3+M7Fi20u4Ux1Nj/I8ETmD61pWtb0TUQhMpKso65Kkyw2EMkz/16cpw6sxje39z7Hmkjj0/2iFqFxSEZqV1hBdubf+PpZxTZ8DTCFda2zZwzE3+YpxH+/dRXGIbd6EIymax62DUJ7mdNGu7shgtQmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735173; c=relaxed/simple;
	bh=KrW/CZ/APueN64R2bxzAAsZpXWtmKM6iihQbhPlVSsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbS9v3o9UDb5IYw1fSiCOgJbLDFJPVodEMBhKlpr/Ta1Jrt1BQte6QMyHvQ5eNbIBGii+jFETF+cMZaIggN0or2DYJ+K4PEI3yILh73Yf+Z3e94zptjQBtCBGTX1S5ywyMcALDCHGjLpTq7jAesldyckb7ytOTA51ilwRbUitpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XrN62mpo; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d204e102a9so75990801fa.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735169; x=1710339969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILaJ1ndBrtJxnoedpR0nNpThqGu/CpGbTx1REHQje5Q=;
        b=XrN62mpo+B2Xoe0MeYK8c2TQWUbmfF/4le4FjE+ESMRGMk5kX4j86xOZdEwlkwXPXP
         mINAp/+rVmMsJ3EZjvTWqgmgdY6hjp/d9f/xO9lP0dz/Yf2yTqZcE2ziWdIPhezAknES
         CvYuXTHUMZcWpZKxOMx64MF/cE8g57JQe5o4HeWpGlTf2we2iQNdHuWFzZukEo0GoOc6
         kFisBPolurtSmdYY8Q05IuiG+lt/YeXZLR0CkhmtDMklDHSbTq1DFZbxnurhEl4ctxKQ
         Cb452UyBxbbCZDgcJG+fD3vHFUPcSrG/bUNh7DnRMOjGPhGrIfjMK6u3pBIP61/ILYph
         Z39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735169; x=1710339969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILaJ1ndBrtJxnoedpR0nNpThqGu/CpGbTx1REHQje5Q=;
        b=xN75cgfBrhkZoC4Q7g+vZk6mcD1XmoDeIAAIrq1jSJp8sR4gbQug3GyDjJRVF+fI2K
         70LaOoX3Szpvi8NCw9WHe4IGGLdjIw5ZVqjVwhOZv29aUm5HxKWXwa/op5G8sqC0lqo6
         tglxB1/fU7nIuyVcRD+QBl6IlLaZcswBrE8bi5Kgn90qV5GdXS8z1L5XiLnpjYAu435Z
         Qx3LPiWPlbAhER96LXIAlbtxskmulBVqeR1ulfB+J4uwRerU+aYYd6GrIwLUPIsaW99A
         jdG7cVJELjFCJ/ozPtHWh2Vxq7vItzUyTQeTfqNxgV742M31He6/UYi+xJuBLvfIkUQF
         WweA==
X-Forwarded-Encrypted: i=1; AJvYcCUvEqkz5TjttVOLejHMZ4CAHo9U3SI0hGpQ+CHmomn9/m8qsyVVGwFGnEQFw/hd7xMlJD/OUJhctCvCd0TxclMUEh+PRfs9fyxzOSs=
X-Gm-Message-State: AOJu0Yx5XmSv9em2BKi/Rl9OLtsd+5Woj1wxC08xJeWIvuaRttZ0l7HJ
	96oPmdv28NElsfVc0uiZUuPZjxiO7i7wysGfn1Uo9b7VdCzwJ6ahjUVMJDNTvmE=
X-Google-Smtp-Source: AGHT+IFaN3MqR0SWCUrtnsqaYb6hwQk83zKUsyA3y/yhWoXR93flI0IncrRaIiKLVUV6LlSrQuFR0Q==
X-Received: by 2002:ac2:52ac:0:b0:512:98d1:d5e1 with SMTP id r12-20020ac252ac000000b0051298d1d5e1mr3022225lfm.21.1709735169200;
        Wed, 06 Mar 2024 06:26:09 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b00413011933e6sm391818wmq.39.2024.03.06.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 06:26:08 -0800 (PST)
Date: Wed, 6 Mar 2024 17:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 5/7] staging: media: starfive: Add ISP raw video device
Message-ID: <c474bd8f-6c23-4536-a915-efbc197a223e@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306093334.9321-6-changhuang.liang@starfivetech.com>

I wasn't able to get this patch to apply.  I tried applying the patch
mentioned in the cover letter first but it didn't help...  It's not
your fault, but it made reviewing the rest hard so I might have made
some mistakes.

On Wed, Mar 06, 2024 at 01:33:32AM -0800, Changhuang Liang wrote:
> Add raw video device to capture raw data from ISP.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-camss.c  | 19 ++++++
>  .../media/starfive/camss/stf-capture.c        | 58 ++++++++++++++++++-
>  .../staging/media/starfive/camss/stf-video.h  |  1 +
>  3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index 81fc39f20615..90ac8b67c76e 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -126,6 +126,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
>  static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
> +	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  	int ret;
>  
> @@ -150,8 +151,18 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  	cap_yuv->video.source_subdev = &isp_dev->subdev;
>  
> +	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_RAW,
> +				    &cap_raw->video.vdev.entity, 0, 0);
> +	if (ret)
> +		goto err_rm_links0;
> +
> +	cap_raw->video.source_subdev = &isp_dev->subdev;
> +
>  	return ret;
>  
> +err_rm_links0:
> +	media_entity_remove_links(&isp_dev->subdev.entity);

I don't think this line is correct.  I think we only need to
remove &cap_yuv->video.vdev.entity.

> +	media_entity_remove_links(&cap_yuv->video.vdev.entity);
>  err_cap_unregister:
>  	stf_capture_unregister(stfcamss);
>  err_isp_unregister:
> @@ -162,6 +173,14 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
>  {
> +	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
> +	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
> +	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
> +
> +	media_entity_remove_links(&isp_dev->subdev.entity);

I think this line should be deleted.

> +	media_entity_remove_links(&cap_raw->video.vdev.entity);
> +	media_entity_remove_links(&cap_yuv->video.vdev.entity);

I think this "&cap_yuv" should be submitted by itself as a bugfix patch.

> +
>  	stf_isp_unregister(&stfcamss->isp_dev);
>  	stf_capture_unregister(stfcamss);
>  }

regards,
dan carpenter


