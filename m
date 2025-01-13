Return-Path: <linux-media+bounces-24669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDEDA0B1B2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36C1618862C5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 08:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72AF23498E;
	Mon, 13 Jan 2025 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSCk0ViU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4F2343C2
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758278; cv=none; b=dkfaf0XprewG8xSHjFF+kQcsOIkgremHRNqRfd9LOff06vbOcQDPk2wbk4lEL0p82NQZsSSv6jWo+59K3eAZGcvw/n2kRD02ZnNDWccTqR9A4jmGixkTxpxXF6vhtiYVvfvQxxWKY6eOqxKwdysWMd4gWCg0QJIm4FbR82mJhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758278; c=relaxed/simple;
	bh=+Z5prmTCb+oDs07079cuNL2SGjlnIAeMhBOQqymQnA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrqPvcBl1KAOW4hT2J4XzEWks4+QTrxAqT+YppzPTQ7uEuv+RARZUcdgOwX2JM/yc7x8E9NkN6fuRzc4RShw54oObXy5UuYM+IkgF4GK9ZDtfx1Cbj0TcP0khGqi46CvIXnF4W5ole4aQ9pSueaqUkUYF+Kw8jMp/D+bSnrxYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uSCk0ViU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540201cfedbso3633304e87.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736758272; x=1737363072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=048DNHsUr5Lyejn6F8rF+CJuBLOrQRkkM5wh163rrhE=;
        b=uSCk0ViUFJFnpgaVeyHe6YRFsJ/kF/ZtR/D80/FCzireUucEJcTkMVVDeNENPt/dcE
         pUSbzzuhR4qdyESr5W5qPVIbdb5WbjM1FkC98qhhUGcHiyeqmDPmndkBaByaFBWYGSJc
         CRN6u5xehW4f7PnnP7dp3F4zCXOhpo2tTIUJ5HwJRKrzOI7VSpS2um7q4Fhg4T0WXiLX
         2SjKWtJRdURXCWRoIeyTb//aQqIWsOQnU78FgvF+Q46ciVUqNuLx0T+OALID69ajc3rE
         uSk6AyTfUiFKYu/PGosY/UOCdsxwdmqSPVKJgG184OhJQYf49XqkDkyslO4Hj8msvCwZ
         jUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758272; x=1737363072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=048DNHsUr5Lyejn6F8rF+CJuBLOrQRkkM5wh163rrhE=;
        b=b306q4tts8iJ+aK9nuCVHpl6E9p/SY8uKK0n20ohfjmFfeTR1hJIxJiZ12kO1YOG6B
         EgjiGt0O6DepuFZJXIWWfgGE9Vv/svZQABJPpWCq+fSiTb+xd5w38UP4PNtR6WTW7iEU
         rCeMJh7t20+macSDdHeO3wl7X37U08oxiVJEpFw0lO+kdSW4V7TRbNPhsxEdu6pdHUAr
         MFlgkQUoTfPEIrtPxdOCavQRGo23WgikAJLDXiVm24aCHyjdOLjQWT+OJ1uWqlOknqvk
         MJqgmBymoVYGM73YwbNA8JBs2gm0a56ssM2TYehIKx3V8jnvYNNAorbX/fynOF7ksjQu
         VHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKB9IlkA4YmStdTa5VCkRmOpjoRqisXpREAJKu4yqCE7aQGJ/cyHrwhssSgMCQZCrRWZA155lMOvGloA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTlSCbASB1dFPIgkLNgyOvHn/yAn6YnJjhw2ITLTVRLklYiZXu
	ddyIxAaykZA1/6TCK4oB3aiTDHSbnA4V+6JzTnsz6yE4D3Pni4eYafup7xkuwyQ=
X-Gm-Gg: ASbGncvxJO/4sYZK3KMe9Gj89Z/oEBCpnnK8D340X/nhB/oIxyMU0ibCMUeR5vsWuLL
	g1h1KHhWYAVne96KVkOfIQMhLsrfaMLqtST9Fp4y4x0LrFcL6rGokEEDISB0UgLNzAiGhsyb+Lj
	gYxrVNR6AWRjejjHEdhIGIgilTn3ydzwDxIfffXUg/nT8hJnpnWaEP9VdcTQ/4tZYX7eOoQbhJM
	FVIkPH5BPg3PdndoLKJAv82nuwcW4HUqo/cQlxi5Srsln3lVz6pZPvlbAPHJ8050tk3iFSlO5ln
	cN0e25aWtkkylSwVz6PuDPeqoe5pi541+OIs
X-Google-Smtp-Source: AGHT+IESNETyoON7XhG6iG8wMZhTF+SNpf8b4JzA6aVM6NNTM9TmEdslkQdtSrWJsx7D2pIHOF33hg==
X-Received: by 2002:a05:6512:282a:b0:540:1d0a:581d with SMTP id 2adb3069b0e04-54284546aa9mr6041929e87.24.1736758271950;
        Mon, 13 Jan 2025 00:51:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4994esm1271981e87.40.2025.01.13.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:51:10 -0800 (PST)
Date: Mon, 13 Jan 2025 10:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <hk3u56pboanfwwai5r6qzbzhrtwgvpvzpzhdcq2hzsqjl6coql@z7xxbnmtjtlu>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>

On Sat, Jan 11, 2025 at 11:45:02AM +0100, Hans Verkuil wrote:
> On 10/01/2025 19:01, Dmitry Baryshkov wrote:
> > On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
> >>
> >>
> >> On 1/10/2025 7:58 PM, Johan Hovold wrote:
> >>> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> >>>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> >>>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> >>>>>> Initialize the platform data and enable video driver probe of SM8250
> >>>>>> SoC. Add a kernel param to select between venus and iris drivers for
> >>>>>> platforms supported by both drivers, for ex: SM8250.
> >>>>>
> >>>>> Why do you want to use a module parameter for this? What would be the
> >>>>> default configuration? (Module parameters should generally be avoided.)
> >>>
> >>>> This was discussed during v4 [1] and implemented as per suggestion
> >>>>
> >>>> [1]
> >>>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> >>>
> >>> First, the background and motivation for this still needs to go in the
> >>> commit message (and be mentioned in the cover letter).
> >>>
> >>> Second, what you implemented here is not even equivalent to what was
> >>> done in the mdm drm driver since that module parameter is honoured by
> >>> both drivers so that at most one driver tries to bind to the platform
> >>> device.
> >>>
> >>> With this patch as it stands, which driver ends up binding depends on
> >>> things like link order and what driver has been built a module, etc. (as
> >>> I pointed out below).
> >>>
> >>>>> Why not simply switch to the new driver (and make sure that the new
> >>>>> driver is selected if the old one was enabled in the kernel config)?
> >>>
> >>>> Its about the platform in migration i.e sm8250. Since new driver is not yet
> >>>> feature parity with old driver, choice is provided to client if it wants to use
> >>>> the new driver (default being old driver for sm8250)
> >>>
> >>> This should be described in the commit message, along with details on
> >>> what the delta is so that the reasoning can be evaluated.
> >>>
> >>> And I'm still not sure using a module parameter for this is the right
> >>> thing to do as it is generally something that should be avoided.
> >>>
> >> I understand your concern of using module params.
> >> I will modify it to rely on Kconfig to select the driver (suggested by
> >> Hans) instead of module param.
> > 
> > Please don't. This makes it impossible to perform side-by-side comparison. Also as venus and iris drivers are not completely equivalent wrt supported platforms, distributions will have to select whether to disable support for older platforms or for new platforms: Kconfig dependency will make it impossible to enable support for both kinds.
> 
> An alternative is that the module option is placed under
> 
> #if defined(CONFIG_VIDEO_QCOM_IRIS) && defined(CONFIG_VIDEO_QCOM_VENUS)
> 
> So it only activates if both drivers are compiled.

s/defined()/IS_REACHABLE()/, but otherwise you are correct.

> 
> But the fact that both drivers can work for the same hardware is something that
> must be clearly documented. Probably in a comment block before this module option.
> Possibly also in the Kconfigs for the IRIS and VENUS drivers.
> 
> Things that are unusual require explanation, so in this case I'd like to see:
> 
> 1) Why are there two drivers?
> 2) Why allow runtime-selection of which driver to use? (E.g. side-by-side comparison)
> 3) Which hardware supports only venus, only iris, or both?
> 4) What is the road forward? (I assume that venus is removed once feature parity is reached?)
> 
> Regards,
> 
> 	Hans
> 
> > 
> >> something like:
> >> config VIDEO_QCOM_IRIS
> >>        tristate "Qualcomm iris V4L2 decoder driver"
> >>       ...
> >>        depends on VIDEO_QCOM_VENUS=n || COMPILE_TEST
> >>
> >> Thanks,
> >> Dikshita
> >>>>>>  static int iris_probe(struct platform_device *pdev)
> >>>>>>  {
> >>>>>>  	struct device *dev = &pdev->dev;
> >>>>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
> >>>>>>  	u64 dma_mask;
> >>>>>>  	int ret;
> >>>>>>  
> >>>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
> >>>>>> +		return -ENODEV;
> >>>>>
> >>>>> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
> >>>>> is false.
> >>>>>
> >>>>>> +
> >>>>>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> >>>>>>  	if (!core)
> >>>>>>  		return -ENOMEM;
> >>>
> >>> Johan
> > 
> 

-- 
With best wishes
Dmitry

