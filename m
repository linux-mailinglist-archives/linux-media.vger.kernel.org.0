Return-Path: <linux-media+bounces-44195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E6BCF3F6
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 12:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA41406C64
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 10:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8B4260586;
	Sat, 11 Oct 2025 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X1f3Vrv3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9F2253A1;
	Sat, 11 Oct 2025 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760180197; cv=none; b=ly1SyL/FONGF2LQCw6o2RM287Y59tq2HR7DCVRxr1Lkjlig/v8ueuTCixBWB0uOtpoCE50W0nHMd46ZChLjeDbsI0NXEpVS+KQlKVogbDKFXjTsAbXcsd+MP3etGIDMM25MWdEYeEVRg3uQQPuASI8DN5g2+GbYMCr2b0aOh9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760180197; c=relaxed/simple;
	bh=u0GrzsxZ5xneQUO9cG+wrZy59SAQcDG3WwePM64zvbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqSWcPSRdje6UKR0Tn9T4EKwamcWmr0Vxdkoz02jhR5crRlkMJzRRFfVinFAC06EgAGVNPMk1BYe1ENH7Ke8bYekUdzXz/bO/oT6c/CKM5pyA0x8ztW37s0PDFH7QUyGGDZHsmp33YemnNkHGprcSe5h5dBxTqcTNacREFX6McQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X1f3Vrv3; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckLBt5lpbz9tVW;
	Sat, 11 Oct 2025 12:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760180182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlD2P0vh4QctxwHfq2M6FdIuQFnDksvOeT2RgNmErfA=;
	b=X1f3Vrv31VGri0Z6FGxkPdP5J7eAfFCyaidp+0O9tyPB+QRlnjPuiZE0OLaoc2pkXabqxx
	aBoI2NvWS9ZspjF/smBrgY+54n/CN1W338BD9T5A6Qrh3Dhf0AVNUcdCd6ALNio3dHFSgn
	HE/u/0V3Z1DBIFSP4FJD2EPEqaefW/VTGP8W6MUvQm3I29uV7irxwqJ4c5YTNiZevza5ba
	NZcpQVW/y7e55Jh9HTBhxpf1LtitaDntIACqUhs3oHp01IGtH/n7XadsQUwbA7FXZ8YRrI
	yDjW8+ZytcQfT41dM2nvEgZpdARVH/p8dpp7yzzG+aGgo1bbFVKXcTsw/jZ+jQ==
Message-ID: <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
Date: Sat, 11 Oct 2025 12:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Ming Qian <ming.qian@nxp.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "jackson.lee@chipsnmedia.com" <jackson.lee@chipsnmedia.com>,
 "lafley.kim@chipsnmedia.com" <lafley.kim@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3fbf18e32a64d5ad371
X-MBO-RS-META: fgs43jn9dqyou4fmp6oizdaezrust547

On 9/5/25 3:22 AM, Ming Qian wrote:

Hello everyone,

>>>> Le mercredi 03 septembre 2025 à 23:47 +0200, Marek Vasut a écrit :
>>>>> On 4/22/25 11:31 AM, Nas Chung wrote:
>>>>>> This patch series introduces support for the Chips&Media Wave6
>>>>>> video codec IP, a completely different hardware architecture compared
>> to Wave5.
>>>>>>
>>>>>> The wave6 driver is a M2M stateful encoder/decoder driver.
>>>>>> It supports various video formats, including H.264 and H.265,
>>>>>> for both encoding and decoding.
>>>>>> While other versions of the Wave6 IP may support VP9 decoding
>>>>>> and
>>>>>> AV1 decoding and encoding those formats are not implemented or
>>>>>> validated in this driver at this time.
>>>>>>
>>>>>> On NXP i.MX SoCs, the Wave6 IP functionality is split between two
>> regions:
>>>>>> VPU Control region, Manages shared resources such as firmware
>> memory.
>>>>>> VPU Core region, Provides encoding and decoding capabilities.
>>>>>> The VPU core cannot operate independently without the VPU control
>> region.
>>>>>>
>>>>>> This driver has been tested with GStreamer on:
>>>>>> - NXP i.MX95 board
>>>>>> - pre-silicon FPGA environment
>>>>>>
>>>>>> Test results for decoder fluster:
>>>>>> - JVT-AVC_V1, Ran 77/135 tests successfully              in
>>>>>> 35.519 secs
>>>>>> - JVT-FR-EXT, Ran 25/69 tests successfully               in
>>>>>> 17.725 secs
>>>>>> - JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in
>>>>>> 81.549 secs
>>>>>> - All failures are due to unsupported hardware features:
>>>>>> -- 10bit, Resolutions higher than 4K, FMO, MBAFF
>>>>>> -- Extended profile, Field encoding and High422 sreams.
>>>>>>
>>>>>> Test results for v4l2-compliance:
>>>>>> v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
>>>>>> v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53
>>>>>>
>>>>>> Compliance test for wave6-dec device /dev/video0:
>>>>>>                    fail:
>>>>>> ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180):
>>>>>> !have_source_change || !have_eos
>>>>>>            test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL Total
>>>>>> for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1,
>>>>>> Warnings: 0
>>>>>>
>>>>>> Compliance test for wave6-enc device /dev/video1:
>>>>>>                    fail:
>>>>>> ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169):
>>>>>> node->codec_mask & STATEFUL_ENCODER
>>>>>>            test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL Total
>>>>>> for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1,
>>>>>> Warnings: 0
>>>>>>
>>>>>> Note: the failures are all related with the eos event.
>>>>>
>>>>> For what its worth, the whole series:
>>>>>
>>>>> Tested-by: Marek Vasut <marek.vasut@mailbox.org> # NXP i.MX95 rev.
>>>>> A0
>>>>
>>>> Do you mind sharing what tests you have done ? Are you confirming
>>>> the same fluster and compliance results, have you done more ? Since
>>>> this is largely inspired on Wave5, I'd like to see people testing
>>>> real-world playback, with seeks, dynamic resolution changes, data
>>>> lost. On Wave5, latest performance patches leads to crash or hangs.
>>> I did not use fluster this time, I used h264 decode of 1920x1080 60
>>> FPS stream. The pipeline was very basic, something along the lines of:
>>>
>>> gst-launch-1.0 -v filesrc location=/test.mp4 ! qtdemux ! h264parse !
>>> v4l2h264dec ! fpsdisplaysink text-overlay=false video-sink=waylandsink
>>
>> Thanks for the detail. Since you have a running setup, perhaps consider testing
>> with the following, left/right keyboard arrow will let you jump around in the
>> media.
>>
>>   gst-play-1.0 --audiosink=fakeaudiosink --videosink=waylandsink /test.mp4
>>
>> That would at least cover seeking use cases. I provided Nas a stream that
>> aggressively do resolution changes to reproduce a Wave5 crash, I would expect
>> him to test and report against Wave6 too. If you'd like to have that sample, let
>> me know, its not very big, and free, but I'd rather not do attachements over the
>> mailing list.
> 
> Would you please share the stream to me? I want to test this resolution-change case too.
How can we proceed with the wave6 driver upstreaming ?

