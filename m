Return-Path: <linux-media+bounces-20940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A469BCF24
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC47D1F20EFF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790E81DD88B;
	Tue,  5 Nov 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2GW47Uc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87D1DD0C1;
	Tue,  5 Nov 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816537; cv=none; b=aZfPDRcrHlz1y9gdQgadYLBEA883PPKa95bmIU0EBOC3x/gSBAEP7L5O8yA6dp7Yi3zI+m+h1H6bgtjjxLFRjdwT8Cj5CG4mvPEjkvyGe5/+36X6iImiXRvg4S+97XxAn0VnA0iMJa/S7aajlAwFYZWlFyp2lew1c71rur+pUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816537; c=relaxed/simple;
	bh=sP5RMY8hxe6DXxClXbSAAF5UnVZF/3YYdW1ecNvnqvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBQ2oGUqB/nSZHf/NkB9IB+vUr0rtpkKP5zcvQxokWRCx/zcTtQwitNO52ieZE5MD0HUMKiZQG7TxyRQRWbj7gsqH9VqHpfx4ywn8yVhurl8DhA+FFH3I2QOVQM6taNZXJznPxAQj9lYen3q3SuPZjphQbzj2xtEuvAg1ZXXwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2GW47Uc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2e050b1c3so4817298a91.0;
        Tue, 05 Nov 2024 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730816536; x=1731421336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u9W36PJD1WQmA4X2SxmQGflBy5FWr2N7Wbdhri0Rtxk=;
        b=m2GW47Uct+7plhpksxcFwsXPRlEqXUfBx5thBG1BW8PH5CgEZ7vKqSDJkyYOz8cJkA
         CIsatIcQVAGHJcHBSxuu/eSghnbRRcQcnbbMhtrlmVScJLOw9MZtmk3MyqlFuX0myOUr
         pEDtjA/4rjLxApMBX0pNmSa1sR23td/stfXQmS8jvSWuleYCqSSGco2W2ZGLkEuvWu/a
         Crct6OWugt/ZkrIt551QZ2pVnuzEoov3Z5zSxV5dLZ/UvqdL7eG4m4Bsn4YSxfFcly03
         qW+RszgQSHIy/qR1JxyqjdkvS1BfyqP1Cdw4YcFsBHiXeRPzB6InrFUmHgqSMhIb6/1H
         7uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730816536; x=1731421336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9W36PJD1WQmA4X2SxmQGflBy5FWr2N7Wbdhri0Rtxk=;
        b=q1buMBjVW3p1VFgiy+bUb7HHseB0iowYXfVZ+HfYP8mNT8f7svZTXsOxkaf8NnGEQW
         tmCzMo2OdW7Db39+Syfh+HXOhQHmGKj+SfC0YX99P6W/vNnpOB49fqIc26IXUEalKMow
         BBW/h9QMX/5w7i2DNP/yH0wTH/dOVx8wSPLqQbxB8tnHNIakGMmS/f6rLrYf9ypX45do
         uXMulT6SuZp0B9CdoWqhpTnAPP86M8nV22P2pRArisbWpPeGlEB98fYlzSbfkeUBvd5u
         +9cgpEZo2Jc3pKAQnzsYcwkJqx60An2nORtubzSOf1hdStsVtTjwX6UwdaMb+hYqviYD
         a1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAP3rNa/hmaXQlbx43Cj+T3spEqjFM2Jvh1OeGpwcSjYRNlj4+HrLRm4vzFACwFAVD/Ueci5kqyfoYBwQO7g==@vger.kernel.org, AJvYcCVNWXscCvOwOTLmWQTEUg5QTQ1bNSn1sbnYtmLFT3J7pZHHevfOaY3X+TJ3mZBXmT3SeDoOyH3qF9StN64=@vger.kernel.org, AJvYcCWoBFeJxzmHL2SD2YbVgPMfdKlAawwnG6Ma1fbR9MYJnxCfyCCGPKpggr6DhmlU0zv8GtBqr0VPOGZP@vger.kernel.org, AJvYcCXsIA/y3yyy/+lRWZmYzZevO/UvGLCumwhy9o+WE7+BbP06FqUHqEHACHj/eWVUnH4TCyssL5gmruIiKIo6@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZMDQJhd+G1EVgaMayiS53lbWExg/41uBh92M3hPvEm70QB8A
	bE13YtoDXxAKbARVDm4SiNDmSD/IQdqgIpMpbXCf5rpKgkv2Kt19
X-Google-Smtp-Source: AGHT+IG0S61a2XP28pDo7uNGhJL5Hq4TKSAS4dmj/2FNbmAX8sRwFnS/wYTX7SQYzyioWWZyUUpcDQ==
X-Received: by 2002:a17:90b:3147:b0:2e2:b94a:b6a9 with SMTP id 98e67ed59e1d1-2e94b7c6439mr26354314a91.0.1730816535597;
        Tue, 05 Nov 2024 06:22:15 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d45cfsm78606595ad.260.2024.11.05.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:22:15 -0800 (PST)
Date: Tue, 5 Nov 2024 22:22:17 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <ZyoqGaSMc2z9xsr1@localhost.localdomain>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-27-a88e7c220f78@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-qcom-video-iris-v5-27-a88e7c220f78@quicinc.com>

On Tue, Nov 05, 2024 at 12:25:47PM +0530, Dikshita Agarwal wrote:
> Initialize the platform data and enable video driver probe of SM8250
> SoC. Add a kernel param to select between venus and iris drivers for
> platforms supported by both drivers, for ex: SM8250.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[..]
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
[..]
> +struct iris_platform_data sm8250_data = {

You should qualitfy it with static too.

> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
[..]
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b7378b7abb3..4cbaa889322e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[..]
> +static bool video_drv_should_bind(struct device *dev, bool iris_driver)

Variable name iris_driver isn't good enough, rename it to
is_iris_driver please.

> +{
> +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
> +		return iris_driver;
> +
> +	/* If it is not in the migration list, use venus */
> +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
> +		return !iris_driver;
> +
> +	return prefer_venus ? !iris_driver : iris_driver;
> +}
> +
> -- 
> 2.34.1
> 

