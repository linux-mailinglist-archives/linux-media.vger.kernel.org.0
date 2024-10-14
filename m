Return-Path: <linux-media+bounces-19608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1799CC1B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 16:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B76DB2233B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C8E1AAE32;
	Mon, 14 Oct 2024 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGlaTC7b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC819C557;
	Mon, 14 Oct 2024 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914401; cv=none; b=R1dRv1bXOfkGoXulQj31pbLtg+CRQfNwiiQOPoXCTzRVf6E0U7v9PnAy0Uhv4iQuscW3lR9qNDmelQRQkoHSmQcwBVpU0wCkxWmBOK7Jx1gb2dIgcc3CXM0pilTUJDEHBsT0d/cQkMITgdeNLB8WFJrVLxOVw5JRoqP3KgOPEHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914401; c=relaxed/simple;
	bh=Ot6KI4/aX9+94sigBkkQUxKZPjmPMSk2BxYrlxSnfp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4f+Ven2DQMiStY+1zjdE+IzJdR2c9q6vt6fO2r+AjX3kSnsbq0LpaGw8WXekE5dN8hv/dTh57z+h3UNs22qNu9HPjWWvod8yAU/hLsG8WG/5U1SqVqTnpeoU8podBP/eTvVYuDDuGniuVf7+lT/pwBpBFNAUPmIquOJ5P8d7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGlaTC7b; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-716ab0c7873so1172564a34.2;
        Mon, 14 Oct 2024 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728914399; x=1729519199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TciJDqM/oynQN7SuulzmnyT4zsxsL81U0wRwHqFFwI0=;
        b=KGlaTC7bB9vX4v+4umcrWQzUvlA+ZmhCoubFLzxBU7/RvMYe+M7b+xjYWPdTQEH5wG
         C3jXyS5+HTkZJ5+yyN6vKXJgPCKLrbHaErpZm3foWksx6Wf+GIAfZSIc7cQXuyqIGGHQ
         J/LwUk/gPiwtch64nVhCDjgU8OUwZaFXAME66JvczPqTVJSP3cswKIJz5yS6Za5z+W96
         Gih+WxGLHDZg6lbKo61f3P513RlDl7atRy4KyqZRH87LLqKeQqdKYCgjBrr24xu+Daxx
         /H/WO9Wyy48JiPMa6f6dnkkqOEAYlpu86mhX8Xk1Tu3NkOPkid75p1Jun+Pyy/P4NR+q
         2qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914399; x=1729519199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TciJDqM/oynQN7SuulzmnyT4zsxsL81U0wRwHqFFwI0=;
        b=mz7xT9KM+ABeK42YzK/ev/ajbZEDk2l8CxU3Xt6r4tM2inFZHymq/uwZoAJq341KmY
         iivygeIOyeW8QpFPmX6yxvwMwSyC16eEZMB+YOQeE94zte3Q/1e6Aww4WOJ9Kuiirp/G
         3UIoOhH9omGWXbRT1Sjr8pOoyFn3a3kHado5naeZukNRBiP58Ce0kQPtiH3c3EdWKNMS
         yKAlicmlxIhMu1gJe/X5kfMbJ5K6s1vuQ27+2zN0nwQDJW7mfHJz6tvs/HYerYvwa4sS
         H+sGq/FxxjbXPSXyWyzEDOnxdw3Oa2Sv8xa1ad9V+M2C1i6GCDggjSmk8AYGv+KCcd9L
         GEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCULU2d0xclNdTmwY+c1XjC/vZiTzD3iKTS/NejbKTkPRnCX4gNMn6ERGccBZsXDDJe+CSxl7UyUeZNnwpY=@vger.kernel.org, AJvYcCVJFnDXmg/Z3R086TTm72qpCE7XnQqGNh3h3sU0mV/20VrmMy75/jOkDRV9AqiIeo6UfuuMDGjj7XnX3+rk@vger.kernel.org, AJvYcCWI7FQVvueRQgOEM4kxmyRyvgC78gHaHu2cqPZssDqkKY4BEajQ8mgfJWq3yVa7/lZhsl4oJn2OCZx4@vger.kernel.org, AJvYcCWj3laIMeCqPUuvDgEElrwUBT0OUyLi6S65UJrbNnlKU7GkSGiRX6lq3e9aHUKKUiAgtX1uH1v2+L1Dw513iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYR/AkA4GtXaze6Kp33qNty97MAv8ALpKIjERPs1XsdJGO6Ky
	Mffef6v+yj7qeWPTRGoU94SPAejXg67wjT5QJXiLHXisdLpYsjVJ
X-Google-Smtp-Source: AGHT+IF1DO38bcqmfhG3Bvj6vycHvTrsuNZGFmtCdNfPnG2YcslUQ1TwRlOxbKNUbxaVUPpTmBe/mA==
X-Received: by 2002:a05:6358:6f82:b0:1c2:fe94:abda with SMTP id e5c5f4694b2df-1c340c656dfmr60367355d.5.1728914399188;
        Mon, 14 Oct 2024 06:59:59 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea448f9542sm6863045a12.33.2024.10.14.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:59:58 -0700 (PDT)
Date: Mon, 14 Oct 2024 22:00:21 +0800
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
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <Zw0j9UeJmC1MZ3Xt@localhost.localdomain>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>

On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
> Initialize the platform data and enable video driver
> probe of SM8250 SoC.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
[..] 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 86ef2e5c488e..a2aadd48926f 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
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

qcom-venus driver has already supported sm8250 soc, I think you should add
an extra patch to drop sm8250 releated code from qcom-venus driver if you
tend to add support for sm8250 in qcom-iris driver.

