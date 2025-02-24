Return-Path: <linux-media+bounces-26793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D5A41AAE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB2F1891209
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F01724BC11;
	Mon, 24 Feb 2025 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4oomikQy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3A224A04A
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392354; cv=none; b=WOtUp1qRG7n8eUpX2qd1+zu6omoNQkUmU6/mQghqV2Dy2tjux+qePoArM8JpLkE6c8aHzGsyZO58KLZ2a+ScFWU3JyMubIlbySq3sB5rLQR/CKUSBemDYMuew6k+3iCSTEJxCkihU+f/Zwb31TrSBac9GTIOf6PdmWB/9TxJ0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392354; c=relaxed/simple;
	bh=2jOh4pJYdbTzoNRPiNIvr3w4ehDXkE58fmaK9/W94tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uOeM0mS7V3R6TsYFi3SqUCZMVCbVheCPY+7eBPD5+/pB4hmDnk8TNLVZQ1WFpqKCgn3hPDcg+bw2NRHl7O2jJjiSisuGRr+RR4yf9s+CdWeocpYuZ97mx1DVDGN3aZ7dYsKY4D9B4uykNzBH3zeCO5KYCDCRrHoTDLtgNrCHpFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4oomikQy; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9JSgH026635;
	Mon, 24 Feb 2025 11:18:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+cOdB66XHjoSBhPkW1k9P2Sz47UfnWVCejVc4JRM38Q=; b=4oomikQyZJn8xt2R
	tz9DM4jhVfEGTOZUaBPudol1QM9vqdc7n5pmCWhQPa9rThHgUyQEsUOvksl9a6ux
	fDiR2oirdAcVuSu3JgHlr4/u4kjJ9FzbNGAmhoVfRWFfQCu8cP9hSeLhZm1mZ1FF
	qZqJzMO9F6ipBEa2j2ySep5bXuM0OaHzxG2/KnpP8IjBD7v2TLLRVrp5s1Ocvm+g
	sN9BKL8jRwqjcJGg7If3/5jPstoINQbMYZ2mTs82X5iXuYqRHTDcFiaDb/xPq3co
	I9nk8gk2jw1T8ZhVldpkTm3WhdGsSOIW6VBckHICCptH3ayXVwgpisg3Z9pnaryb
	HoZ6WA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ys144gfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 11:18:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7A5B24002D;
	Mon, 24 Feb 2025 11:16:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1922A4A53B7;
	Mon, 24 Feb 2025 11:15:57 +0100 (CET)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 11:15:56 +0100
Message-ID: <fa780238-6222-41e5-af86-a1001fafe1cc@foss.st.com>
Date: Mon, 24 Feb 2025 11:15:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
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
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda
	<ribalda@chromium.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
        Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
        Steve
 Cho <stevecho@chromium.org>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Kevin Hilman <khilman@baylibre.com>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01

Hi Hans,

Thanks a lot for organizing this once again.

On 2/20/25 11:24, Hans Verkuil wrote:
> [Repost because I mixed up a Lyon and Nice, and to provide more info on the other
>  events that take place in Nice. Also added Kevin Hilman to the CC list.]
> 
> Hi all,
> 
> We want to organize a Media Summit this year as well to meet each other face-to-face.
> We try to co-locate with an existing conference, and this year there are two options:
> 
> 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
> 
>    https://embedded-recipes.org/2025/
> 
>    So a media summit would probably take place on May 11 or 12.
> 
>    This conference is a one room, one track format. But the room holds up to 200
>    people and the expectation is that it is not a problem to get tickets for it.
>    And we might be able to reserve some tickets for us as well.
> 
>    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
>    GStreamer plans an event during the weekend after ER.
> 
> 2) Co-locate with the Open Source Summit Europe in Amsterdam which is held on August 25-27.
> 
>    https://events.linuxfoundation.org/open-source-summit-europe/
> 
>    The Embedded Linux Conference Europe is part of that event. The summit would
>    probably be on August 24 or 28.
> 

I just asked for my company approval to join these events. Nice would
undoubtedly be easier for me to arrange.
I'll keep you posted.

> I know that getting permission to travel is still a problem for many, which is why we
> try to co-locate with a larger event.
> 
> So: if you are a core media maintainer or an active media developer, and want to join
> the Media Summit, which of these two options would work for you?
> 
> If possible, I would like to get an idea of what I can expect in about two weeks time.
> I'll send out a reminder in about a week as well.
> 
> Feel free to forward this if you know other people who might be interested.
> 
> If you haven't been to one of these Media Summits before, then you can find the report
> on last year's summit here:
> 
> https://lore.kernel.org/linux-media/45e4f5d4-f6c4-4f0b-96b5-f5e1125b0845@xs4all.nl/
> 
> That should give you an idea of what to expect.
> 
> Regards,
> 
> 	Hans

-- 
Regards,

Benjamin

