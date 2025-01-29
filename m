Return-Path: <linux-media+bounces-25401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750CA21C24
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 12:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDD916697F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 11:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C691BC9F4;
	Wed, 29 Jan 2025 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWj29di4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F581A9B53
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738150058; cv=none; b=N/qRBrOCPW5fNwDPVbmPIp74K/n/HxROsUKqWM/63aUSbM/OHvuPd1vD6X3GkX2ssxzdBP5bEVmUikHqGI1YcbbkrqKNtxZyg2s4HEbB45veTkI1zfLw5zuPw0VYEJl9AYtk/KpeKmxeWQFsOgcHpklMYtQ02oaT2hLauwsK3Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738150058; c=relaxed/simple;
	bh=QbzMdo5twuN8qHdUuuA8eKAEXsCU81mC2eMowoF6pkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa+535Qx3CYLfkpFg5/R6T9oE1VKVw28Ek6Ta9T1YFwt92is4wJrRkONvuPK9mdnwI7/BAax86Ux/5iMlOwlEzklJvKXoX4lW8LakTxzTtMRBrIUPxSO++twqCuwppP1y1fSVkAxpjb2aoNPfaOMIpR9/ZxPqhFt3GCSD2mZd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWj29di4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54298ec925bso7779716e87.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738150055; x=1738754855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdMhtxP5R+RhzbtYpl+nDYBC1VN7c30OWolTsuKS8Es=;
        b=vWj29di4IP3TNXPK3gzSGQuOHcrcyYXppym3TmeABM4iG0x+wofmD7dneNKRhlwC22
         b4Zt3GIghhTTyRBgkkyWEjSBoc3SfZ46puJujWzyT2YhdH8bGM9IW5A1eCDh6UN+0Vb+
         QvuveqUYT2tb8o+f+t5bmK+YQFtI/uo3uKW/GAx45jA5nkIKwr25nuBLTHYc9zLX12s/
         fQY4Q8Uy0DPakT6CUqY+ZXyYrb/1qJtkEzM6KgdbIh5NR9pv1f+ZFQXVNh9S9vSidxAv
         7VimNHfALmxYe8V9DB0p+dDlsqwJa7fCI8FHGHKVIQJ/tyh/r21t6Rftoz4x0SRVsd1Q
         pg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150055; x=1738754855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdMhtxP5R+RhzbtYpl+nDYBC1VN7c30OWolTsuKS8Es=;
        b=iX2M3uLKNqHLp5CitfJRsD81jQ+S4VImoZPACePL+VyMXfu+0lHV4kAtcUD8qcaDUa
         qIjiFi9+Gwe4Pa07/CBpHBAidlTcoIrLEEsoQ1J5KnPMI7YNpPUovB1gx7MviY5iwUx6
         9gu1Z0pC13NuLNIAWRxYlZBjWojBi28OnYjdyw5xdeoDNsxL3kxp900S6+uaM72ZWo4s
         bxdxRElPaWWgDv7WrL8wNSnatXptRPeE57bq0hvgJ+p8tabYvMhmr0int3Ii42XOBwSV
         //gxaGt3ZgT8tbx0E2l50hspanUQQ/3Xggbua+eL6KCF3LyZ82YsMAPFJbdYI3nMr4Dp
         os6g==
X-Forwarded-Encrypted: i=1; AJvYcCXc2x2YVxFkiq3Pt/v/dPLiXfFAWHULG8y7pdNHznQ4aDYCqiy2DooRThEzRmHdwrHtF9D/GA4ey6KeDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhRS5ivHI8yfxtRoOHdRTXww8bM1ckzyhBAAE7oe7+E25OlKV
	6ijpPQfhq+PbOJuO/6ZzPStdzFN/Zu+S2g/rkGUicTF36oXRIWN/D75s04dmhuKFOa8rwPwfrgL
	0ipA=
X-Gm-Gg: ASbGncs4qAPR5fkuPjBRPL1qbxQbOhz8CW0TPMXhGf5ToeGRNLQAEe5NLAzGi0vYwCX
	6PzY4MPcjJWrIW53sweo0oa24Tyo8iYVRZ+/SJyYGTLDTn9pRv0pf4/LzQQKK0+pDv3RG+BXo5d
	tZmpf/X/wn0kc9qOuO6tiqvwZqw1IWyYtFia05x4vdtSJC/1sBBdiAzk2kAgmw3OzpX60C6SJHN
	WJbsMKvAytkKUhtdBO9pmM8FdTmY26pbe4DmeF5zI2KnynzQ4aIkG96VV7FauscIpfo3AY7MhX9
	keXP09JDf3JOx06AZ6V1BMM/1QpLouFS/qgDwdpfAxNZxAejBF3LoyTdnALHcplViWfvS/Q=
X-Google-Smtp-Source: AGHT+IFtlc94QWGgPJciAfKJd6iML1fdimMywpw4Q1xwQVsFRb8X3q+yuNtr1tZBr1nfLKPhKsx6OQ==
X-Received: by 2002:a05:6512:148:b0:540:2ff1:3c7c with SMTP id 2adb3069b0e04-543e4bdff2amr733639e87.7.1738150054904;
        Wed, 29 Jan 2025 03:27:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c837949esm1965905e87.160.2025.01.29.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:27:33 -0800 (PST)
Date: Wed, 29 Jan 2025 13:27:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com, 
	stefan.schmidt@linaro.org, lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, johan@kernel.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <dl5gxjxvajoq3tszujqrew7ynvepufcr2qj7ztj7ksgv2fxtdt@zaeqtxuwbayb>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <sb3beoyhnlcdfjbm37ogpdoph7m4fecpbuu3myglnpzblpnqhw@wdyskeps3uuh>
 <45c3676a-aafe-59e8-910d-af82031c24a6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c3676a-aafe-59e8-910d-af82031c24a6@quicinc.com>

On Wed, Jan 29, 2025 at 03:23:22PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/28/2025 9:44 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 01:34:28PM +0530, Dikshita Agarwal wrote:
> >> Introduce a helper module with a kernel param to select between
> >> venus and iris drivers for platforms supported by both drivers.
> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/Makefile          |  1 +
> >>  drivers/media/platform/qcom/iris/iris_core.h  |  1 +
> >>  drivers/media/platform/qcom/iris/iris_probe.c |  3 +
> >>  drivers/media/platform/qcom/venus/core.c      |  5 ++
> >>  .../platform/qcom/video_drv_helper/Makefile   |  4 ++
> >>  .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
> >>  .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
> >>  7 files changed, 95 insertions(+)
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> >>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> >>
> >> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> >> index ea2221a202c0..15accde3bd67 100644
> >> --- a/drivers/media/platform/qcom/Makefile
> >> +++ b/drivers/media/platform/qcom/Makefile
> >> @@ -2,3 +2,4 @@
> >>  obj-y += camss/
> >>  obj-y += iris/
> >>  obj-y += venus/
> >> +obj-y += video_drv_helper/
> >> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >> index 37fb4919fecc..7108e751ff88 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >> @@ -107,5 +107,6 @@ struct iris_core {
> >>  
> >>  int iris_core_init(struct iris_core *core);
> >>  void iris_core_deinit(struct iris_core *core);
> >> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> > 
> > s/extern //g
> > 
> >>  
> >>  #endif
> >> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> >> index 954cc7c0cc97..276461ade811 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> >>  	u64 dma_mask;
> >>  	int ret;
> >>  
> >> +	if (!video_drv_should_bind(&pdev->dev, true))
> >> +		return -ENODEV;
> >> +
> >>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> >>  	if (!core)
> >>  		return -ENOMEM;
> >> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >> index 77d48578ecd2..b38be7812efe 100644
> >> --- a/drivers/media/platform/qcom/venus/core.c
> >> +++ b/drivers/media/platform/qcom/venus/core.c
> >> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
> >>  static void venus_remove_dynamic_nodes(struct venus_core *core) {}
> >>  #endif
> >>  
> >> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> > 
> > Use #include instead.
> > 
> >> +
> >>  static int venus_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >>  	struct venus_core *core;
> >>  	int ret;
> >>  
> >> +	if (!video_drv_should_bind(&pdev->dev, false))
> >> +		return -ENODEV;
> >> +
> >>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
> >>  	if (!core)
> >>  		return -ENOMEM;
> >> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
> >> new file mode 100644
> >> index 000000000000..82567e0392fb
> >> --- /dev/null
> >> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
> >> @@ -0,0 +1,4 @@
> >> +# Makefile for Video driver helper
> >> +
> >> +obj-m := video_drv_helper.o
> > 
> > Always built as a module? And what if iris or venus are built into the
> > kernel?
> iris and venus are always built as module,

This is not correct.

> and if we are adding the
> dependency of this module on IRIS && VENUS then this can't be Y I think.

It surely can. Moreover, if one doesn't enable both Iris and Venus, this
module is completely unnecessary.

> > Add a normal Kconfig symbol, tristate, no Kconfig string. Use depends on
> > IRIS && VENUS (and maybe default y) to let it be built only if both
> > drivers are enabled.

-- 
With best wishes
Dmitry

