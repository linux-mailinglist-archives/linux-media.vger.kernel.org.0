Return-Path: <linux-media+bounces-24539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2687A07B79
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 16:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03D763A5C22
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE38222564;
	Thu,  9 Jan 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ydmt4Add"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4721D5AF;
	Thu,  9 Jan 2025 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435465; cv=none; b=M/Zw0UcQ3Z/m+7+NQLUDUfkrrLapD2ktglW4sm7m5UyHjhTV0u/la1uf8ylkn1MDJh8URkW8/fGug/vnNy/b26xc96Fanur6YQE7U5kSg8k3w/c80LBS/9pMOr1Ddw0KVf0TNzS18VdZejNbUAeZe48N/AWzCn9HQRU0rKOasEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435465; c=relaxed/simple;
	bh=7lEZNV0X+29VoxSEr+AVzaoiYcr7CIhLBP2VNpg3G1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgLLX+kqaBfYe9pZUeaWm+UvDl47oFes895nzWmWzY8B+djNfixeKnCS/Esy/aa10vGJwCb7mETI1ytdpGZqaspE/Va0TUWWWlqU2i/Lm91NGaY7hljb1OrU2IwUxqI9HR6tUg7cyVMF+KNHee6Sd4NYGH2bpQeXXGj2+/NFmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ydmt4Add; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6975C4CED2;
	Thu,  9 Jan 2025 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435464;
	bh=7lEZNV0X+29VoxSEr+AVzaoiYcr7CIhLBP2VNpg3G1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydmt4AddvxmMsy/OZlA//EqGAPtyAbU06w4cxyaV8NaXJvV+wgHWHkYLcbys4e4QP
	 JOQVEEWz/XovHBzHYXctnczLh0wqRoRQUTIBvX0jiT5fV0XT08KZPiie8/MVCzlAlA
	 UhCUPzQ9HgRmrR4vzYoOwviIvpJp4soeVQenDkL+laGczi+jHp9kYg/CptN9YuoR+i
	 dJfy+g+057W/9b0/0/YVaEl0vh9wgFCu7P+1oWSGCrcRkLWgBrZRb26CCRb8+lK3xh
	 2GvTWW3/RZAV13vdivfV2eupxhL17U5VzJXjhgcqbOOjJwmuXyFOyDY9kKmXAEykja
	 Zx5ERAWmua7ag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVuBc-000000008Hc-3jVi;
	Thu, 09 Jan 2025 16:11:05 +0100
Date: Thu, 9 Jan 2025 16:11:04 +0100
From: Johan Hovold <johan@kernel.org>
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
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <Z3_nCPk_g8znto4A@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>

On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> Initialize the platform data and enable video driver probe of SM8250
> SoC. Add a kernel param to select between venus and iris drivers for
> platforms supported by both drivers, for ex: SM8250.

Why do you want to use a module parameter for this? What would be the
default configuration? (Module parameters should generally be avoided.)

Why not simply switch to the new driver (and make sure that the new
driver is selected if the old one was enabled in the kernel config)?
 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell

Looks like something is missing from Stefan's Tested-by tag throughout
the series ("Dell XPS13"?)

> Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
 
> +static bool prefer_venus = true;
> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> +module_param(prefer_venus, bool, 0444);
> +
> +/* list all platforms supported by only iris driver */
> +static const char *const iris_only_platforms[] = {
> +	"qcom,sm8550-iris",
> +	NULL,
> +};

Surely you don't want to have to add every new platform to two tables
(i.e. the id table and again here).

> +
> +/* list all platforms supported by both venus and iris drivers */
> +static const char *const venus_to_iris_migration[] = {
> +	"qcom,sm8250-venus",
> +	NULL,
> +};
> +
> +static bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> +{
> +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
> +		return is_iris_driver;
> +
> +	/* If it is not in the migration list, use venus */
> +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
> +		return !is_iris_driver;
> +
> +	return prefer_venus ? !is_iris_driver : is_iris_driver;
> +}
> +
>  static int iris_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
>  	u64 dma_mask;
>  	int ret;
>  
> +	if (!video_drv_should_bind(&pdev->dev, true))
> +		return -ENODEV;

AFAICT nothing is preventing venus from binding even when 'prefer_venus'
is false.

> +
>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> @@ -324,6 +355,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8550-iris",
>  		.data = &sm8550_data,
>  	},
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);

Johan

