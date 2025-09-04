Return-Path: <linux-media+bounces-41780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD3B440B8
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68201C86267
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30C726C3A4;
	Thu,  4 Sep 2025 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l1cE2wrC"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693EB2566E2;
	Thu,  4 Sep 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999974; cv=none; b=Ufda5nzjZbQ98p9tuS+zHcN46kBXaPiu4u6bkE/5TQpBmQDe1cYQxddNwwt/Xea5FgPnLcU4n5lIbZVSA5/qstIjrla3UhzZBDVT81tkuAFNjL+aEtt7J+RlLuVGkbcjaknPiqzmwWlvotecWlUCf1dw2Cd46EGOILkBSmFSR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999974; c=relaxed/simple;
	bh=tDTbE3SehodMHw7uN73rIR5YQxukV3vhONZfNB5DYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEFZ9DVbRlu4cMMF8+akZ9Izbkt7ruGv0FRrQrdXlyLD6rkQE25MIxH2Dm+7TjE3Y93r78P32IgdisaNglZdkJiVmFSc+30p/WXATEvuNmsComt9UyKdBqlU1xlv/Jy2zZv9/RB4J2e6EzGRt5XJbv+XUzXmw9j7DXTKI8wUpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l1cE2wrC; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHk4w4LNXz9sWS;
	Thu,  4 Sep 2025 17:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756999968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIzZVheBRvd0iBPFoIGMoS2ar7q8yBpuYylj7gKGkt8=;
	b=l1cE2wrC8tFhr3lNLLGeDqyCiW5tXKlSkRZVLpTDb48ra5RX9AJXKOZfJwOnKu89Ijxnix
	kMsI0zpruaAlJZZ9m0nENDX0vd1rJra2I3jYNtKzJtE6+60uVRwKQ6VpPJPSwuhn8GpvVl
	5BUMdnlvFb2J7hWIi8u9FVbydwX1g+aO725fJhgLg2IfvonEndnN8JXtTnrpWN4oclufdO
	X30Uy1moDoUgSYRl0HVGo+o6BnJb4mlb45DtVqxuL2KQMYW7RGkVXor3+G3Av5MlEvlo0A
	8XO4qy0E1NsmBHxR4eAlr7kr8e3j2LuqTDdVOAF18LShrgpzyaCV+qZwWnHSUw==
Message-ID: <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
Date: Thu, 4 Sep 2025 17:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2dd240b7f7c824b2b50
X-MBO-RS-META: nbjes31bh5qwrbn7sqdhimymj64fxzc6

On 9/4/25 3:25 PM, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 03 septembre 2025 à 23:47 +0200, Marek Vasut a écrit :
>> On 4/22/25 11:31 AM, Nas Chung wrote:
>>> This patch series introduces support for the Chips&Media Wave6 video
>>> codec IP, a completely different hardware architecture compared to Wave5.
>>>
>>> The wave6 driver is a M2M stateful encoder/decoder driver.
>>> It supports various video formats, including H.264 and H.265,
>>> for both encoding and decoding.
>>> While other versions of the Wave6 IP may support VP9 decoding and
>>> AV1 decoding and encoding those formats are not implemented or validated
>>> in this driver at this time.
>>>
>>> On NXP i.MX SoCs, the Wave6 IP functionality is split between two regions:
>>> VPU Control region, Manages shared resources such as firmware memory.
>>> VPU Core region, Provides encoding and decoding capabilities.
>>> The VPU core cannot operate independently without the VPU control region.
>>>
>>> This driver has been tested with GStreamer on:
>>> - NXP i.MX95 board
>>> - pre-silicon FPGA environment
>>>
>>> Test results for decoder fluster:
>>> - JVT-AVC_V1, Ran 77/135 tests successfully              in 35.519 secs
>>> - JVT-FR-EXT, Ran 25/69 tests successfully               in 17.725 secs
>>> - JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.549 secs
>>> - All failures are due to unsupported hardware features:
>>> -- 10bit, Resolutions higher than 4K, FMO, MBAFF
>>> -- Extended profile, Field encoding and High422 sreams.
>>>
>>> Test results for v4l2-compliance:
>>> v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53
>>>
>>> Compliance test for wave6-dec device /dev/video0:
>>>                   fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180): !have_source_change || !have_eos
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>> Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0
>>>
>>> Compliance test for wave6-enc device /dev/video1:
>>>                   fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>> Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
>>>
>>> Note: the failures are all related with the eos event.
>>
>> For what its worth, the whole series:
>>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org> # NXP i.MX95 rev. A0
> 
> Do you mind sharing what tests you have done ? Are you confirming the same
> fluster and compliance results, have you done more ? Since this is largely
> inspired on Wave5, I'd like to see people testing real-world playback, with
> seeks, dynamic resolution changes, data lost. On Wave5, latest performance
> patches leads to crash or hangs.
I did not use fluster this time, I used h264 decode of 1920x1080 60 FPS 
stream. The pipeline was very basic, something along the lines of:

gst-launch-1.0 -v filesrc location=/test.mp4 ! qtdemux ! h264parse ! 
v4l2h264dec ! fpsdisplaysink text-overlay=false video-sink=waylandsink

