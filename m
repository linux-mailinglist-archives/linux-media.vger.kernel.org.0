Return-Path: <linux-media+bounces-26255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AFA3941F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BE718917AE
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 07:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5FC1EEA34;
	Tue, 18 Feb 2025 07:49:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060A1EDA3B;
	Tue, 18 Feb 2025 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864958; cv=none; b=axRNcCMKh/ukJEXTe79g9a9zXRak3h1ajH3V2JqxRsbgCJMCV5PrIidsMT6fLcX62nVxwRrKU+N1sUJQIcfhixkjG9dSb+SmrJwDUVR4fCsPqT/WRWcFeNvLHfCVutIWssYQgrhnt7AI5vN8zLaIViKq6UsHTqVCWj0RNkC/hDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864958; c=relaxed/simple;
	bh=8G/jZQUu/2ePH59JV1iOjs5AsAiIOG2M2TSM5/z8VoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPuH6rLRnAh+m2t0NS+NrmVXJbx3wzOkyDeSxnbR2hPnbEXohyw7VjmPwW8BoO+SSu8F9BlEEsSvcKUOwZGOsdJcrpbbgVe28Qdx6grakSZqTJt3llXv0SKexedqQKqOAIsGX54heZ90qeH8ikdPa/uWVNXX2D8tF9Yfjwrmt1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F7AC4CEE2;
	Tue, 18 Feb 2025 07:49:16 +0000 (UTC)
Message-ID: <56c81a10-4058-49e3-95f5-f8823072e350@xs4all.nl>
Date: Tue, 18 Feb 2025 08:49:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Avermedia DVD EZMaker 7 video distortion on capture
To: Randy Kimmett <linuxish@outlook.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <PH8PR12MB71128FAC43D4FF7BC3D64050EAF92@PH8PR12MB7112.namprd12.prod.outlook.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <PH8PR12MB71128FAC43D4FF7BC3D64050EAF92@PH8PR12MB7112.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2025 17:18, Randy Kimmett wrote:
> Avermedia DVD EZMaker 7
> Model: C039
> VID:07CA PID:C039
> Module used: cx231xx
> Distro: Manjaro
> Kernel version: 6.13.0-1
> Components used: Conexant CX23012-11Z (according to https://www.linuxtv.org/wiki/index.php/AVerMedia_DVD_EZMaker_7_(C039))
> 
> When capturing analog video from my old Hi8 video camera (NTSC M), the captured video has banding and is grainy, it doesn't matter if I capture from the S-Video or Composite, the results are the same.  On my windows PC the capture is perfect.
> 
> dmesg output:
> 
> [31173.105709] cx231xx 3-1:1.1: New device AVerMedia TECHNOLOGIES, Inc. AVerMedia C039 USB Pure Capture @ 480 Mbps (07ca:c039) with 7 interfaces
> [31173.106062] cx231xx 3-1:1.1: can't change interface 4 alt no. to 3: Max. Pkt size = 0
> [31173.106065] cx231xx 3-1:1.1: Identified as Conexant VIDEO GRABBER (card=5)
> [31173.106649] i2c i2c-13: Added multiplexed i2c bus 15
> [31173.106704] i2c i2c-13: Added multiplexed i2c bus 16
> [31173.214440] cx25840 12-0044: cx23102 A/V decoder found @ 0x88 (cx231xx #0-0)
> [31175.444434] cx25840 12-0044: loaded v4l-cx231xx-avcore-01.fw firmware (16382 bytes)
> [31175.493936] cx231xx 3-1:1.1: v4l2 driver version 0.0.3
> [31175.620281] cx231xx 3-1:1.1: Registered video device video2 [v4l2]
> [31175.620318] cx231xx 3-1:1.1: Registered VBI device vbi0
> [31175.620423] cx231xx 3-1:1.1: audio EndPoint Addr 0x83, Alternate settings: 3
> [31175.620426] cx231xx 3-1:1.1: video EndPoint Addr 0x84, Alternate settings: 5
> [31175.620429] cx231xx 3-1:1.1: VBI EndPoint Addr 0x85, Alternate settings: 2
> [31175.620431] cx231xx 3-1:1.1: sliced CC EndPoint Addr 0x86, Alternate settings: 2
> [31175.620433] cx231xx 3-1:1.1: TS EndPoint Addr 0x81, Alternate settings: 6
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=219764 (also contains a sample video clip of the issue)
> https://www.linuxtv.org/wiki/index.php/AVerMedia_DVD_EZMaker_7_(C039)
> 
> 
> Any help and/or suggestions would be greatly appreciated. :)

I'll try this with my own cx231xx device, mostly to check if it is a regression of
some kind. I don't have this specific device, so if it works for me, then there isn't
a lot that can be done.

Support for it was originally added through this bug:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1620762

It says:

I built the cx231xx driver with the patch and made a few tests.
Tested and working:
- Video capture on the composite input
- NTSC source
- PAL source
Not tested:
- Audio capture
- S-Video input
- SECAM source

I hope to find some time to test this in 1-2 weeks.

Regards,

	Hans

