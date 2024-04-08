Return-Path: <linux-media+bounces-8818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CE89BA21
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 10:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9775F1F22289
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FE72E3F9;
	Mon,  8 Apr 2024 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HeoToARW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0332C69C
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564661; cv=none; b=j3BwPvB/RyKdis8DwcjPjbQyZixWFUuwdC0+1QayUw5D/E2bZ+Xlw6BlYcco/i1D/7wR4DBKBb2ud8+0ePtdyJ8MGh1fTv07htQ/138ohpCYCWujDlOj4XH+/qwB2skoM4fUtNpBvevP7xeP4OFqZZrZNUbGIvPEBKb3OALVF9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564661; c=relaxed/simple;
	bh=dN8OtgxgpxTIe78v+RWWqJFSbvxW4DBP14GUlcFhAEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LGGLaltDPKTz2HaRl8kYDhcJln0G0KlE5QRQ3M9sMFC+3KeTUz5Udvu4c2SFZSfFE2+VqndBKjjEAziU7UqyCFapFnC/7XRyD99II+0/l3nuJFUQ2N6zCCOv3o4snUXAhQX2GGU4cre5NwhDEgmbnN9zLzAyhxrjmkFUgtRmAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HeoToARW; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4387GACK021039;
	Mon, 8 Apr 2024 10:23:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=0g3VWgM0k7KtF9lwLv2wDf3lGD6Vv5F5jK8VeYdkXIo=; b=He
	oToARWdXLSEAKVChcCmHc3ejsLaHX08Bpdqq1/uaVbRtyAYL7BkKZntoS8lY0qJ5
	QF3Cd6YzRHRoNAxiGMXFDSg79sStMM43CUDDUsWYlTWhi44UcVh5S1q5JghD5zxM
	/mfMswwjiBs9OY6YrCO38cSEPhKAbP9ywPQXAJiVxHI6adNf7g9VxQmhmL+9vLlz
	D3r+km9vUjBKsO7hyQCtY+Wn9S3uDcXsZdqxgItJLKtdrequUmKAF1xW8CqbgmfG
	aYE2O/92sTodDAfenjppdq/OkcRjmd9yCXiFwkADkIz0+FkzqofktRoZCJjBfClP
	naKCly/JxNc63LfpOOtg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xauh4wq7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:23:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0FABE4002D;
	Mon,  8 Apr 2024 10:23:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B8E4211601;
	Mon,  8 Apr 2024 10:22:36 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:22:35 +0200
Message-ID: <89c001ce-6030-49b1-a936-9b6d8141ac6f@foss.st.com>
Date: Mon, 8 Apr 2024 10:22:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit 2024: where to hold it?
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List
	<linux-media@vger.kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Sean Young <sean@mess.org>,
        Mauro
 Carvalho Chehab <mchehab@kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        "stanimir.k.varbanov@gmail.com"
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_06,2024-04-05_02,2023-05-22_02

Hi Hans,

Thank your for starting this topic.

On 4/4/24 09:29, Hans Verkuil wrote:
> Hi all,
> 
> Normally we like to have a one day Media Summit meeting co-located with
> the Embedded Linux Conference Europe, however there isn't one this year.
> Instead of organizing an ELC both in North America and in Europe each
> year, the Linux Foundation switched to alternating between NA and Europe,
> and this year it is in North America.
> 
> The problem is that most media subsystem developers are based in Europe
> for some strange reason.
> 
> So we have to make a choice this year: we can co-locate with the gStreamer
> and XDC conference in Montreal, Canada on October 7 or 8, or we can
> organize a meeting somewhere in Europe ourselves. One possibility is
> to try and co-locate with the Open Source Summit Europe/LPC conferences
> in Vienna, Austria in the week of September 16-20. Another is just to
> organize something ourselves somewhere in Europe. But that's a last resort,
> co-locating with a conference is generally more appealing for people.
> 
> The advantage of picking Montreal is that the gStreamer conference is
> more applicable to the work we do, and we can get a meeting room there
> free of charge. Besides, I've never been to Montreal :-)
> 
> But can we get enough of the core media maintainers there? There is no
> point otherwise. I suspect that the same company travel constraints that
> were present last year are still in force this year.
> 
> If we pick Vienna instead (assuming we can get a meeting room for a decent
> price), would that work better?
> 
> So if you are a core media maintainer, or an active media developer interested
> in joining a Media Summit, please let me know if:
> 
> 1) Montreal, October 7 or 8, works for me!
> 2) Vienna, one day in the period September 16-20, works for me!

I will certainly be able to attend in person this time.
Both are fine for me :)

> 
> Please respond asap, I'd like to get a clear picture soon, ideally by the end
> of next week.
> 
> Regards,
> 
> 	Hans
> 

-- 
Regards,

Benjamin

