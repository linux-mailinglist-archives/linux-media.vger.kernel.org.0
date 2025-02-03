Return-Path: <linux-media+bounces-25530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F3A2544F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ED2916195C
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8691FBCBD;
	Mon,  3 Feb 2025 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTelIAoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5C26AE4;
	Mon,  3 Feb 2025 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570968; cv=none; b=NnrNKxdsAlqfhSaxhQB82qHwy9DhM/QnKvr8KDagx5vZxj4cEmo0aMxBK04u6TxFZPHnIJRmrCOOSgwIytudLiFMVPEV2lvGbP/gkIcalaAbMSuPWmXYZtke8+XCWJif1VWefZLpXdxnxOv51c6PD5P85Dnwd78hOXi5UpFDMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570968; c=relaxed/simple;
	bh=4D7ohBd8vmVNBGTLY4YrjYleLW9zHfaWxTOXamEVLwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQWbel7JxRfJh23g25M7ttYPFds1ePR5AI2gSykiqI7Qcigu+ywbz6DIhTE4rPPJfl3xKNppnwNB6534u7+A7jADAKVgG43+bn96puKOf6vU3PhZNd7x3WPxzJTZwEbqRBRETzut4LL85y37I5Dobyy+uwfUS3fTZ1ryqOhdotQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTelIAoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC841C4CED2;
	Mon,  3 Feb 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738570968;
	bh=4D7ohBd8vmVNBGTLY4YrjYleLW9zHfaWxTOXamEVLwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTelIAoZeqoIWeB3c1gNsMUXJ6xWGMo4LmQp5j7AgoESIts8OpPCaGRYezr4evlGx
	 sRwgqa9PHWgnsvDtEaMiTF/i9WWzC7lECrFOx+6kNvKbZI3Aoz3DX3WweG1lWwXDp5
	 1cewTdIfkg1l08fCeiZ7nFkpRcbJoWkua3Ouufy+vpiZD8O5vuI9to1LH8UXlBcpLP
	 jRFBeM2CC0DRxnnxBkwwNVIGKAakJO9TmOLNpisLrr8nKHddC2k1j7yiDasYhER6N7
	 Tth2Jmvx+3ga2eL5/ZWlmsu15Yw34U2Jwe6QicvWpC+h8GDoPQ+L8q+Wf3I0wa6Mcp
	 bCX0lCdkl/VYg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1terjH-000000006IC-0zOo;
	Mon, 03 Feb 2025 09:22:51 +0100
Date: Mon, 3 Feb 2025 09:22:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
	stefan.schmidt@linaro.org, lujianhua000@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6B822-6UTxQfX46@hovoldconsulting.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>

On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
> > On 28/01/2025 09:04, Dikshita Agarwal wrote:

> >> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> >> index 954cc7c0cc97..276461ade811 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> >>   	u64 dma_mask;
> >>   	int ret;
> >>   
> >> +	if (!video_drv_should_bind(&pdev->dev, true))
> >> +		return -ENODEV;
> > 
> > Wouldn't it mark the probe as failed and cause dmesg regressions?

No, this is perfectly fine. Probe can return -ENODEV and driver core
will continue with any further matches.

> >> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> >> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> >> +{
> >> +	/* If just a single driver is enabled, use it no matter what */
> >> +	return true;
> >> +}
> >> +
> >> +#else
> >> +static bool prefer_venus = true;
> >> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> >> +module_param(prefer_venus, bool, 0444);
> > 
> > 
> > The choice of driver is by module blacklisting, not by failing probes.
> > 
> > I don't understand why this patchset is needed and neither commit msg
> > nor above longer code comment explain me that. Just blacklist the module.

> Summarizing the discussion with myself, Krzysztof and Dmitry:
> 
> 1) module blacklisting solution will not be ideal if users want to have 
> both venus and iris or either of them built-in

Module blacklisting is not the way to go, you shouldn't have two drivers
racing to bind to the same device ever.

> 2) with current approach, one of the probes (either venus or iris) will 
> certainly fail as video_drv_should_bind() will fail for one of them. 
> This can be considered as a regression and should not happen.

How can that be a regression? One driver must fail to probe (see above).
 
> Solution: If the user prefers iris driver and iris driver has not probed 
> yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
> iris probes and succeeds. Vice-versa when the preference is venus as well.

This sounds wrong too.

Look, first you guys need to explain *why* you want to have two drivers
for the same hardware (not just to me, in the commit message and cover
letter).

That's something that really should never be the case and would need to
be motivated properly.

Second, if the reasons for keeping both drivers are deemed justifiable,
you need to come up with mechanism for only binding one of them.

I already told you that module parameters is not the way to go here (and
the msm drm driver's abuse of module parameters is not a good precedent
here).

If this is a transitional thing (which it must be), then just add a
Kconfig symbol to determine which driver should probe. That's good
enough for evaluating whatever needs to be evaluated, and doesn't
depend on adding anti-patterns like module parameters (and helper
modules for them).

Keep it simple.

Johan

