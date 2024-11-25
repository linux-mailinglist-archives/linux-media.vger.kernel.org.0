Return-Path: <linux-media+bounces-21930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E20489D7C95
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BFE282139
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A8A187FF4;
	Mon, 25 Nov 2024 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aneOgUSW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A38827;
	Mon, 25 Nov 2024 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732522244; cv=none; b=BzBW0jaXBBtZ5l7C3hII8H9C6gL/BnqqOVWfYnJwliqSuD6s8AWy5TETUk3t/dc3lKRkMaI0oMV75y3FX0AOE5fxzgK0pReBjMuqF5JvH23aL7pSMU+fcRNS4zsR2kf5h40wZ2ST5KLZu0edpBAqcuMgA+XUEiEYODyHY05b0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732522244; c=relaxed/simple;
	bh=CAeJ4TBeE4F6WgCR4Tq0ZhhVGFmTZMlXsT3ZeSniNqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uQ6KXOwbvXfUxJVlosspvDw/22U306A8Nf7YaQf8RN5dOCQGTRIejrGOG9DzoBkaEXj6Z5Mf031G/rehf8z1m9e7nmM8XVrzhYHPkOZRBS2ADfGlO186SwlGkttIesqLUpXNzOLpnKBoFCdhLGDuiM0rAQaog2PF7RP6t5fY+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aneOgUSW; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0pxIm014099;
	Mon, 25 Nov 2024 08:52:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8uBVTRIhltASLptHNO7ciiwgZge8tWTzAnEQix+o5ms=; b=aneOgUSW5PDCg37+
	DG9relJ49AvPvEuOXPn8ES9/OQulIf/AbqSTo4GOLNn3o+370d5JyWNNridoQ3IA
	Eu+PCeRVTkNuzS4+DqGOzvF+70dxS3HibdT75Y7IGfLYKAoRFziUSKwS08bgGZI8
	1fq2Ra9oSfTmZTg7HCxp8L+KsrvhGagmLz1UZvbSpCqOmEaDI0cb5GuNH74arWlP
	+DfFk8coZpGZtXctottRwO9TRJAAiJ/yrNmQW9EFhyXhFJYPMWL0iChZC4rKeDdu
	w6HNpaZp4o8iFUwCJ+j4Mc6Rg8MmQKeGqTSSZR/OoghJxTuytpgk6HcsMzFeKpsA
	KzV+Ig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 433791p7e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:52:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 305AE4002D;
	Mon, 25 Nov 2024 08:51:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A74C26550D;
	Mon, 25 Nov 2024 08:49:47 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 25 Nov
 2024 08:49:46 +0100
Message-ID: <f989e43a-8622-43cb-af6d-fd02b2374ac1@foss.st.com>
Date: Mon, 25 Nov 2024 08:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add WebP support to hantro decoder
To: Adam Ford <aford173@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
 <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Adam,

On 11/24/24 04:09, Adam Ford wrote:
> On Thu, Nov 21, 2024 at 7:22 AM Hugues Fruchet
> <hugues.fruchet@foss.st.com> wrote:
>>
>> Add WebP image decoding support to stateless V4L2 VP8 decoder.
>>
>> This have been tested on STM32MP257-EV board using GStreamer.
> 
> I want to test this on an i.MX8M Mini.  Is there a certain gstreamer
> version or branch I should use, or is 1.24 sufficient?


The corresponding GStreamer code has been pushed here (v4l2slwebpdec):
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7939

BR,
Hugues.

> 
> adam
>>
>> Simple basic test:
>> $> wget https://www.gstatic.com/webp/gallery/1.webp
>> $> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
>>
>> Slideshow of a set of WebP pictures and WebM video files:
>> $> wget https://www.gstatic.com/webp/gallery/2.webp
>> $> wget https://www.gstatic.com/webp/gallery/3.webp
>> $> wget https://www.gstatic.com/webp/gallery/4.webp
>> $> wget https://www.gstatic.com/webp/gallery/5.webp
>> $> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
>> $> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
>> <hit key ">" to display next file >
>>
>> Large WebP image > 16777215 (size > 2^24)
>> $> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
>> $> ls -l 4096x3072_HQ_random.webp
>> [...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
>> $> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
>>
>> Large WebP image decoding using post-processor is untested because of lack
>> of hardware support on this platform, nevertheless support is provided in
>> this serie for further testing on another platform having post-processor
>> support.
>>
>> ===========
>> = history =
>> ===========
>> version 3:
>>     - Fix remarks from Nicolas Dufresne:
>>      - Document constraint about key frame only for WebP
>>      - Fix rebase issue
>>     - Fix typo detected by Diederik de Haas
>>
>> version 2:
>>     - Fix remarks from Nicolas Dufresne:
>>      - Use bytesperline helper to compute chroma size
>>      - Introduce a new explicit WEBP frame compressed format
>>        instead of relying on VP8 + WebP flag
>>      - 4K support in both decoder and post-proc
>>
>> version 1:
>>    - Initial submission
>>
>> Hugues Fruchet (3):
>>    media: uapi: add WebP uAPI
>>    media: verisilicon: add WebP decoding support
>>    media: verisilicon: postproc: 4K support
>>
>>   .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
>>   .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
>>   drivers/media/platform/verisilicon/hantro.h     |  2 ++
>>   .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
>>   .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>>   .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
>>   .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>>   .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>>   drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>>   include/uapi/linux/videodev2.h                  |  1 +
>>   10 files changed, 68 insertions(+), 4 deletions(-)
>>
>> --
>> 2.25.1
>>
>>

