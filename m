Return-Path: <linux-media+bounces-25597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BAA25EFC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802893AB4DC
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 15:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4F320A5CF;
	Mon,  3 Feb 2025 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpiY7HNG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9D20A5D2
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597055; cv=none; b=Nvmg14dm7s84ucU6qEz+R+5Ebb5LcAhQ6UpJEuNulpMHRPmfTOcwh/181cHtx7rwAn6oYK4FZLyFGS1DfiiQ44U/S/cBKBrjGfY0pQDFaVymBCFqFEqhk8SvCSNPyBpyMfc1PXsai+ZtNx7HTguIIwY5EIkTAXml5Du2RGBjwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597055; c=relaxed/simple;
	bh=fXSwyb6kluFm+mPLGWZ4iJ5T4rAna3D85/lI9eoXJ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvG+c+RVy4me4CQzxXO1pQD3fMeDOUF7pgxPJFBtoTq+Z0r9R+6yQz4D9cJFFkZNWdjZwLRa7hXP1nnxKqhlHRdLoORwq3XpcGzlTICoIICL0A5JZDXMz6abaElPKtapZQGvKJCWXwYP8u7/CtViA4ENEkUD0wqnyUDx7zKy2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpiY7HNG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54024aa9febso4568462e87.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738597051; x=1739201851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHRIhzqvNH1bzn0adefvZWos6ZS5C0TEuaPKGujIOQI=;
        b=TpiY7HNGSkPhFMjPF96dMgtKofwLOuWS4oXrZAhxjPtpf+OmGsadqTiOhlQGKx7ymm
         Qxu2fQ+50v91dRjkoot8X7DxphsKitpL3+QIsyXB+RKoWkxCkvyKyKgdm7OlmugmJ0d6
         SRPiwp8kWRgLQgHU6Zwfibwx2xKgYcHGRKclx8Dzkqiu5LXQ/+HyPQGX6c1TBQedNDqr
         8XLwpw35Azd3iDbzM+QT1ZkfawbAWX+toqxc9h1n4Hmyn87ixrjOtIDN+c3nWsJApWuT
         ILbCqB6/g/u5eHSxfORLQJgCk+64Y1s1teflNmSNS+UeAw9xDHTT0jUKIp2WE6lo/iP/
         cWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597051; x=1739201851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHRIhzqvNH1bzn0adefvZWos6ZS5C0TEuaPKGujIOQI=;
        b=EES1IULvS+Nc3hH5i4wfgsiKLjyuKzraxFuaEv/0hj4mypttU/MgpyCAZKxEDylBdU
         2lqowclOWEXUWkiypYKMQNWH98bm1BTftml+p7qNoVtukEo3C+FMmkfOL/qSRioTDDUd
         pQFYXQMexeDlcT0Uc/tJmjGJ5hgiknanhSFzXT2a0GnaUlsMBANdfUnyRfr0k4rlpoNf
         RoOFp0BK4kkj1GjReFmGxNkLR920mJ3DSVPc5f3MpCCGcwcYPqNMoA2Igmpz/cvpuO3F
         PhkDJu+9ReLZPYyp1x3vSWsmiG3WOXz9X50+iFJf19X5GfJtN6EZK7vo9nzFaQ4Gcw2A
         rEBg==
X-Forwarded-Encrypted: i=1; AJvYcCUcP3upT+bwtrLSoczuaIGyUmxj0EvHRUlD5ii3kq1BQOm6DF7X+M7g0/ppAzzpdI00BZlLnumOR4F/ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuv87dSOSCB3p9Y4W+bhNX+qsML8dnN+VQ4MTffTRE3jaah8TR
	TkG2akCKwrUxUimcs0wbT9YXRu5O1KVQhF/EAKRrl3WPShGse6hqfl+9Yit4PuQ=
X-Gm-Gg: ASbGncsD+1qayrpTo5Jn7DCPhanLkQ/EVJvtV1cT2J8Tg/qEOF+WD4OepDqQ1gR02UR
	QdqHVFRbTswY+hRmAdKRs8/W2e/NVmKlkX8ZRHKPJsB7uGxvWsPrywm1D64Mhx0iP5q98qnBdBs
	uzhLb2NOMweG+CyEf1aarxYXQmu+EgpCIZ5DyYHah0ZCLXZUO/MQOzO+mqY/0+AwmVkW3p3ctz/
	zHbBgf0gjhgAtZe15+xR47v2WATgBykfbOXQ4Nc0PPcruX420tkTbaotL8zhin9605jV45EQ6GD
	p/Mc/ihEtoZo+ACRElQ5PA80ju0VuShhFD63mP9u+koCTYRioIwSM08j2aINzf9WojI0Q9o=
X-Google-Smtp-Source: AGHT+IGh+KF+0uAYGcEmgM7tPX/mz+NrDdDUP0TAAcJzdf4B7LZrgSe3h4Ylxvx3xmOG8C7EsGJV7w==
X-Received: by 2002:a05:6512:3c8f:b0:543:bbe1:b0fe with SMTP id 2adb3069b0e04-543e4c03049mr7131057e87.24.1738597050676;
        Mon, 03 Feb 2025 07:37:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0993sm1308210e87.132.2025.02.03.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:37:30 -0800 (PST)
Date: Mon, 3 Feb 2025 17:37:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <fhqlt5xsz7yyrbnvhnovt66gzldjjbitpeznlvxztobdxmjnuw@d4avd5fq3muh>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <Z6CApNuSlPGvVL2k@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CApNuSlPGvVL2k@hovoldconsulting.com>

On Mon, Feb 03, 2025 at 09:39:00AM +0100, Johan Hovold wrote:
> On Fri, Jan 10, 2025 at 08:01:21PM +0200, Dmitry Baryshkov wrote:
> > On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
> > >
> > >
> > >On 1/10/2025 7:58 PM, Johan Hovold wrote:
> > >> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> > >>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> > >>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> > >>>>> Initialize the platform data and enable video driver probe of SM8250
> > >>>>> SoC. Add a kernel param to select between venus and iris drivers for
> > >>>>> platforms supported by both drivers, for ex: SM8250.
> > >>>>
> > >>>> Why do you want to use a module parameter for this? What would be the
> > >>>> default configuration? (Module parameters should generally be avoided.)
> > >> 
> > >>> This was discussed during v4 [1] and implemented as per suggestion
> > >>>
> > >>> [1]
> > >>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> > >> 
> > >> First, the background and motivation for this still needs to go in the
> > >> commit message (and be mentioned in the cover letter).
> > >> 
> > >> Second, what you implemented here is not even equivalent to what was
> > >> done in the mdm drm driver since that module parameter is honoured by
> > >> both drivers so that at most one driver tries to bind to the platform
> > >> device.
> > >> 
> > >> With this patch as it stands, which driver ends up binding depends on
> > >> things like link order and what driver has been built a module, etc. (as
> > >> I pointed out below).
> > >> 
> > >>>> Why not simply switch to the new driver (and make sure that the new
> > >>>> driver is selected if the old one was enabled in the kernel config)?
> > >> 
> > >>> Its about the platform in migration i.e sm8250. Since new driver is not yet
> > >>> feature parity with old driver, choice is provided to client if it wants to use
> > >>> the new driver (default being old driver for sm8250)
> > >> 
> > >> This should be described in the commit message, along with details on
> > >> what the delta is so that the reasoning can be evaluated.
> > >> 
> > >> And I'm still not sure using a module parameter for this is the right
> > >> thing to do as it is generally something that should be avoided.
> > >> 
> > >I understand your concern of using module params.
> > >I will modify it to rely on Kconfig to select the driver (suggested by
> > >Hans) instead of module param.
> > 
> > Please don't. This makes it impossible to perform side-by-side
> > comparison.
> 
> Why? You can have two kernel builds and run the same tests. And you
> obviously cannot run iris and venus on the same hardware at once anyway.

At once not. But unbindng and rebinding another driver works perfectly.

> > Also as venus and iris drivers are not completely
> > equivalent wrt supported platforms, distributions will have to select
> > whether to disable support for older platforms or for new platforms:
> > Kconfig dependency will make it impossible to enable support for both
> > kinds.
> 
> You shouldn't have both enabled. The only reason for keeping support
> for the same hardware in both drivers is that the iris support is
> incomplete and considered experimental. No one should enable that except
> for development and evaluation purposes until the driver is up to par.
> And then you drop support from the old driver along with the config
> option.

That's the plan. This modparam is a temporal thing for transition
period. And yes, as a developers / platform enablers we want to be able
to have a quick turnaround between drivers.

Please stop forcing your decisions on other people. The Linux kernel and
its development process has always been about providing a possibility,
not a policy.

> 
> Johan

-- 
With best wishes
Dmitry

