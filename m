Return-Path: <linux-media+bounces-25631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E0A26E95
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 10:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C0477A59BC
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 09:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2DF207DEB;
	Tue,  4 Feb 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNAfueIy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F219C54B;
	Tue,  4 Feb 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661698; cv=none; b=e/rphNM0ePRZ3JXGOe4A9oDGEUUmcFu3VEwTqN0XPKLz380uSWyjXBvbgIhk8EE07VuquLEuM3AnIl3+sr53b6BaAenDP+Zn/o/aXIRFYQjt3Msv5vtw12ONi+/rrZjRDOCJ5CCnOxSS/Q9nByhlenXabi6wLnHrQPtvKp/KPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661698; c=relaxed/simple;
	bh=Eb1OMUA8ttEG9jHLyuxnDuERqXFDShNqpNHEICU9Ejw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHEvaLlDEhtl4pdDMKOPwpGFFFKKrGwgynit2859p34DDVTsEc590f/D67dCG7fIBqmstjI1JUAUvBePLXhjlWOg2px0FqibiSzmklm88xsb1Cl35Y+rvOYkO5gsqfZLu/JfqIg5Dz54IG7/QFhyIXCNKwWxY4aFWX72qFo9DwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNAfueIy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2775EC4CEDF;
	Tue,  4 Feb 2025 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738661698;
	bh=Eb1OMUA8ttEG9jHLyuxnDuERqXFDShNqpNHEICU9Ejw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNAfueIyFJNDNirRHzflngZwgZxbrLv5GJlB13TY5T2q5fGh/F8p5m0UB7CN45Oc7
	 ZByttBN0ZmNZaSy9IGtdn+C77vLIit9VZ2OXDF2NMZEd6q6RoTQ2V8fumb/Ed7ULOd
	 zOXoTgWEgouphAoS62e1OXGlL5/sBO4reu9HJSFcGur220o3Cg5k6pxMbJJZFM4q7z
	 t/B471b650nwBlFoti8+dJZcmqq9j/JGJblB52cMYHhcFF926m0SfcXmqqXTDBS+wQ
	 Bz4PuBIoWWjQSOB9Og+wQjI8HcSQYBFZ+IXDj1smXSSrqL6mdGt3rfk52GOBc8O8Gz
	 5e1w+g/BRYQuQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfFKg-0000000080X-13t0;
	Tue, 04 Feb 2025 10:35:02 +0100
Date: Tue, 4 Feb 2025 10:35:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	neil.armstrong@linaro.org, nicolas@ndufresne.ca,
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
	lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6HfRiqTQqb6sJVS@hovoldconsulting.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <0708dbf1-5914-4372-9df2-5cf590fd7bd6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0708dbf1-5914-4372-9df2-5cf590fd7bd6@kernel.org>

On Mon, Feb 03, 2025 at 05:34:20PM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 16:16, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> >> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> >>> On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
> >>>> On 28/01/2025 09:04, Dikshita Agarwal wrote:

> >>>>> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> >>>>>   	u64 dma_mask;
> >>>>>   	int ret;
> >>>>>   
> >>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
> >>>>> +		return -ENODEV;
> >>>>
> >>>> Wouldn't it mark the probe as failed and cause dmesg regressions?
> >>
> >> No, this is perfectly fine. Probe can return -ENODEV and driver core
> >> will continue with any further matches.

> >>> 2) with current approach, one of the probes (either venus or iris) will 
> >>> certainly fail as video_drv_should_bind() will fail for one of them. 
> >>> This can be considered as a regression and should not happen.
> >>
> >> How can that be a regression? One driver must fail to probe (see above).
> > 
> > I also don't think that it's a regression. I think Krzysztof was
> > concerned about the 'failed to bind' messages in dmesg.
> 
> I never used word "regression" alone. I said "dmesg regression", which
> means you have error in logs or any system facility which provides you
> self-information about device probe history. I don't remember if -ENODEV
> leads to any printks, so maybe I am wrong here, but regardless normal
> and expected operation of a driver should never result in -ERRNO, except
> deferred probe of course.

A probe function returning -ENODEV is not an error and is used to signal
that the driver should not bind to the device it has just probed. So
that part is perfectly fine here as I mentioned above.

Johan

