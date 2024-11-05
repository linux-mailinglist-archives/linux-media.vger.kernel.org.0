Return-Path: <linux-media+bounces-20942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3024F9BCF7A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8DC1C24059
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C2C1D4173;
	Tue,  5 Nov 2024 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnHDbG9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7514A91;
	Tue,  5 Nov 2024 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817245; cv=none; b=MjkIJcEufWebqkxq+zA4Suu2cEdBKKIKNJ3VY6dWil74IUoBgo0vu/OZv9YpQ+pOeOKLD4eU+4lO6fC8g7chg0n3VLnnqhRWmfrijQcqLsIxPXArfijadHLHdk3h5UlX58mdwD0AHLLXqUY2qmIcrqFR+inbHSmNhZA5XIuKRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817245; c=relaxed/simple;
	bh=YQGq8BeG/Fp5PyaG/BAkgPdJeomV8W8Km5kHMMWU1Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEkrFH79xnLkLPq/PYL6GnIKqf0zyA2O0DfrwdpM9xPhyzMWs9+TyK0KYui7Mz1lBJXTqmhOvr+8PB56GSeBn2m9wgHLd9t2d0uBYUoqHojIKuBNmR2qXnKbR9+BsvvfIGoCfZCLvr0Y5F+uuLb2Tc/ZabPhXtntV5vlWQF7hPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHDbG9R; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720d5ada03cso4358926b3a.1;
        Tue, 05 Nov 2024 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817243; x=1731422043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wkZkgieCQJSdGFL1nFVjSANilf4JopahWQIFB2y57g=;
        b=RnHDbG9RKxkQdmdNXyRgBU+IT25U/o6j50oq/pkoQQnMuc7oUwcYWUZ5W3IO0ypfP6
         sot2PeOVAFl+jUb/SYizsVTIbFOsB9OS5wwv92IbcafbZw6yA57M4mcQktKbr+0q/TTD
         iOCIvjsUbhCqEpXwIMWIXG/iuMyPFFqOZ1mYe1Eo5+9KHXRat8FhnUEV2aUtwqFAvJai
         P96SgxTM8p1HxZQzhnFHh5b3epVp6uCZShuDh5P0o2wnuiJLWuhrrWNheHlqE4Hq5Faw
         1Y+w2+We8GygkUlBzPoiJeux4etP4s4xC/CanYMSUX5y+OL3/vAyYAbyGQ8bx3mYkgDB
         8vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817243; x=1731422043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wkZkgieCQJSdGFL1nFVjSANilf4JopahWQIFB2y57g=;
        b=sCVRInOXD6YviuapQ/95MENKZTXD1fNqGy3EL3GHbxt1hEP8WfLWB6N4zySN7osZII
         E1JMB8oHE4ZlBtXnK0+TachmRozmOV+5OMoW/u5tHqw22OYEDMJrIiRcdCNZr0xfED6X
         QwKAogPNS3dZcmaMYoVm57U1mOKfqlYe9Olu6Fy9bSu3UUN3xU440e9wxM2ZwXqaxp25
         pJG62JUKOslA12Ym95+aDMZAMJFbD8bBBr6rbkKmxD84fYlmvdqfA02DK8Xhq+LpeWx5
         a4OB7r/sxeTNnXLSV/c+wZT+3ozbsdiF/3PzQJv50Mq9y4xnr5P0/CnD6YmOajnRGRyN
         YoAA==
X-Forwarded-Encrypted: i=1; AJvYcCU7clMYCTbHIl8DzhXf/CTAvXwGlA7/pjzuEc7I1xX5wXkTbKnNSOu47zq4Id0yMTZf72FVH3euWPW4kY7ggw==@vger.kernel.org, AJvYcCVf/4ZzgYVz7f1L4cvkXugaHKexsp3Uz8WDvMes19W5whFGL8ur1GDRhHkgG5rtzwmmQQv33x8PDkfPp4Fs@vger.kernel.org, AJvYcCWFQlpMXXCFOOmQr09dbM4z4iNJYs1O/BIgoPmBjMao6v7yIGvty1TjWxENW6EtMpBGcMmq7JOVfWWpeb0=@vger.kernel.org, AJvYcCWrvvGj4W1oBrWp3qHOXn84VTtgEKcP7L2LeBn007+J7GlkhWtTPuJLYRhnDO+ZdEOD0Noo4kFn4bgG@vger.kernel.org
X-Gm-Message-State: AOJu0YwSY2NWqG319/x5Cs220/QpcXqdyERoLdd6H6K1HMXE25wLmtFV
	YHl/uYPtyzCpw0x/f91TlAjIcsrcxD6Vyz1W1+c7RfR2zI873BjBNwOZnQ==
X-Google-Smtp-Source: AGHT+IF6Jhd8ae1eb4MRSXHY+M5pbxaJWy0HAbzhTRzH9XRbPEvOHf4v9oASvTrDMZVFx5DA3DfGjQ==
X-Received: by 2002:a05:6a00:148f:b0:71e:4296:2e with SMTP id d2e1a72fcca58-720b9c942damr23160857b3a.11.1730817243149;
        Tue, 05 Nov 2024 06:34:03 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c54acsm9685528b3a.124.2024.11.05.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:34:02 -0800 (PST)
Date: Tue, 5 Nov 2024 22:34:06 +0800
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
Message-ID: <Zyos3pGYWfUSTlxV@localhost.localdomain>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-27-a88e7c220f78@quicinc.com>
 <ZyoqGaSMc2z9xsr1@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyoqGaSMc2z9xsr1@localhost.localdomain>

On Tue, Nov 05, 2024 at 10:22:17PM +0800, Jianhua Lu wrote:
> On Tue, Nov 05, 2024 at 12:25:47PM +0530, Dikshita Agarwal wrote:
> > Initialize the platform data and enable video driver probe of SM8250
> > SoC. Add a kernel param to select between venus and iris drivers for
> > platforms supported by both drivers, for ex: SM8250.
> > 
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
> [..]
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> [..]
> > +struct iris_platform_data sm8250_data = {
> 
> You should qualitfy it with static too.

Sorry, I overlooked some code above, please ignore this comment.

> 
> > +	.get_instance = iris_hfi_gen1_get_instance,
> > +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> > +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> [..]
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 7b7378b7abb3..4cbaa889322e 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> [..]
> > +static bool video_drv_should_bind(struct device *dev, bool iris_driver)
> 
> Variable name iris_driver isn't good enough, rename it to
> is_iris_driver please.
> 
> > +{
> > +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
> > +		return iris_driver;
> > +
> > +	/* If it is not in the migration list, use venus */
> > +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
> > +		return !iris_driver;
> > +
> > +	return prefer_venus ? !iris_driver : iris_driver;
> > +}
> > +
> > -- 
> > 2.34.1
> > 

