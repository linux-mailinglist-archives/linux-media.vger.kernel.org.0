Return-Path: <linux-media+bounces-17537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8796B46A
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2D71C2431B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8AA187357;
	Wed,  4 Sep 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="MFyLQhvj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D2187325;
	Wed,  4 Sep 2024 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438083; cv=pass; b=TETgPIG+KX6hMhehw4VDBLZDpZU4dDbC5LWA6sxQf+xLHRFJApIq2VzBYn0i0HkH/qfLpkiEqc4c5aOmCRjVESNfzDH/4Rg9v0NtcRDZX0gdliVzSDOdLWXeK+oEaMrzcKFiKsR1wuEZVzGsfOr/OA9HYWQilt2nHXI+3p+9ndE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438083; c=relaxed/simple;
	bh=fAe7BehVfBPzJre9p8zkJogfaom01kYJy+vEbFAGpg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUCXdM4s6PMTcL8vfvpF0PaikoRW4FBRFupCD5oiNt9RpaUzoSsM72gluI6760fRIDofgW8OXTqxNiCMIE3NUpcmlA4g+//VPzxQDhsZ6/71coA+5kwzPp/bZotpl3ajO9eS881gB9nLMdambde9N1OQpdMfOfQBo8k016RXR5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=MFyLQhvj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725438069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f2zlIs39HXck0hgrqrWq30mnvqrXXWmzeS/YrSe+4LX+P3Ws7pKH0uCrChxLLkqZiRLqpUMs2fes23tY914w5K41kNY+jg4DGdd3tkKNR7nmYUZ5LltXQ0Wlwu5PlJBpVvBnDGPi8MWq4WRl6Eei87lIwtD396fvekblsG8Q1zU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725438069; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6uIIN8p86qe3CHxykPYDQHiQt4oK0OH0FovXG73TUfc=; 
	b=GA7+7oAorOJKAC/pIaNDfAdu7Zv6zAvqrBIZDV6oYmByw7mEIJr7M6yaTkt8z6DUSUqt0MsPguGJoC1BFTXXJl1Uztmw/cYE+5frJKWYXyvLdm2tNDnd0sebUPahTlqGo52tKCdadNKquSSOyD6HF7dxmCsHE+tMeGct8i7+2RA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725438069;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=6uIIN8p86qe3CHxykPYDQHiQt4oK0OH0FovXG73TUfc=;
	b=MFyLQhvjcuEleK88+gx6/pBF/kW0z8sf6eC+SOiXWD1iun3J1D2aVYnovzOhO0nJ
	CkQ3pq7cvOQPbKm+3A1dUp4l0Dm/UAfsgXwoHqUbaHKjMi/pzrET5OqSuHZBuXc7HGm
	2O5SEC4b82je797bvb//r0I1T1BTzWQkNaBi6NWo=
Received: by mx.zohomail.com with SMTPS id 1725438067269951.898668764037;
	Wed, 4 Sep 2024 01:21:07 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:21:02 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	"Brnich, Brandon" <b-brnich@ti.com>
Subject: Re: [RESEND PATCH v7 0/4] Add features to an existing driver
Message-ID: <20240904082102.dxutsm3apyke7dhd@basti-XPS-13-9310>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB1303DB297A43A97CFACFD504ED8D2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB13030F374CC079CAC0C98F4BED9C2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <SE1P216MB13030F374CC079CAC0C98F4BED9C2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
X-ZohoMailClient: External

Hey Jackson,

On 04.09.2024 00:30, jackson.lee wrote:
>
>Hi nicolas and Sebastian
>
>I sent v7 patch for upstreaming , can you review the following ?

Yes we have that on our list and look into that as soon as possible.

>
>https://patchwork.linuxtv.org/project/linux-media/cover/20240812070823.125-1-jackson.lee@chipsnmedia.com/
>
>thanks

Regards,
Sebastian

>
>
>> -----Original Message-----
>> From: jackson.lee
>> Sent: Monday, August 12, 2024 4:09 PM
>> To: mchehab@kernel.org; nicolas@ndufresne.ca;
>> sebastian.fricke@collabora.com
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
>> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee
>> <jackson.lee@chipsnmedia.com>
>> Subject: [RESEND PATCH v7 0/4] Add features to an existing driver
>>
>> The wave5 codec driver is a stateful encoder/decoder.
>> The following patches is for supporting yuv422 inpuy format,
>> supporting runtime suspend/resume feature and extra things.
>>
>> v4l2-compliance results:
>> ========================
>>
>> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>>
>> Buffer ioctls:
>>        warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>>        warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>     test VIDIOC_EXPBUF: OK
>>     test Requests: OK (Not Supported)
>>
>> Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0,
>> Warnings: 2 Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed:
>> 0, Warnings: 0
>>
>> Fluster test results:
>> =====================
>>
>> Running test suite JCT-VC-HEVC_V1 with decoder
>> GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
>> Ran 132/147 tests successfully               in 89.870 secs
>>
>> (1 test fails because of not supporting to parse multi frames, 1 test
>> fails because of a missing frame and slight corruption,
>>  2 tests fail because of sizes which are incompatible with the IP, 11
>> tests fail because of unsupported 10 bit format)
>>
>> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
>> Using
>> 1 parallel job(s)
>> Ran 77/135 tests successfully               in 30.364 secs
>>
>> (58 fail because the hardware is unable to decode  MBAFF / FMO / Field
>> / Extended profile streams.)
>>
>> Change since v6:
>> ================
>> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>  - Change autosuspend delay to 100ms
>>  - Add to enable/disable hrtimer in the runtime suspend/resume
>> function for hw not using irq
>>
>> Change since v5:
>> ================
>> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to
>> calculate bytesperline and sizeimage.
>>  - Fix v4l2-compliance error for the vidioc_enum_framesizes
>>
>> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS
>> generation for each IDR
>>  - Remove warning messages for the checkpatch.pl script
>>
>> Change since v4:
>> ================
>> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>  - Fix warning message
>>
>> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to
>> calculate bytesperline and sizeimage.
>>  - Fix warning message
>>  - add Reviewed-By tag
>>
>> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw
>> pixel- formats on the encoder
>>  - add Reviewed-By tag
>>
>> Change since v3:
>> =================
>>
>> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS
>> generation for each IDR
>>  - add Reviewed-By tag
>>
>> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>  - add Reviewed-By tag
>>
>> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to
>> calculate bytesperline and sizeimage.
>>  - modify the commit message
>>  - define three framesize structures for decoder
>>
>> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw
>> pixel- formats on the encoder
>>  - modify the commit message
>>  - use the v4l2_format_info to calculate luma, chroma size
>>
>> Change since v2:
>> =================
>>
>> * For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS
>> generation for each IDR
>>  - add the suggested _SHIFT suffix
>>
>> * For [PATCH v3 1/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>  - change a commit message
>>
>> * For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to
>> calculate bytesperline and sizeimage
>>  - add pix_fmt_type parameter into wave5_update_pix_fmt function
>>  - add min/max width/height values into dec_fmt_list
>>
>> Change since v1:
>> =================
>>
>> * For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS
>> generation for each IDR
>>  - define a macro for register addresses
>>
>> * For [PATCH v2 1/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>  - add auto suspend/resume
>>
>> * For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to
>> calculate bytesperline and sizeimage
>>  - use helper functions to calculate bytesperline and sizeimage
>>
>> * For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw
>> pixel- formats on the encoder
>>  - remove unnecessary codes
>>
>> Change since v0:
>> =================
>> The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a
>> simple define, tab and multiple lines has been removed, The macro is
>> defined using one line.
>>
>> Jackson.lee (4):
>>   media: chips-media: wave5: Support SPS/PPS generation for each IDR
>>   media: chips-media: wave5: Support runtime suspend/resume
>>   media: chips-media: wave5: Use helpers to calculate bytesperline and
>>     sizeimage.
>>   media: chips-media: wave5: Support YUV422 raw pixel-formats on the
>>     encoder.
>>
>>  .../platform/chips-media/wave5/wave5-helper.c |  37 +-
>>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>>  .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
>>  .../chips-media/wave5/wave5-vpu-dec.c         | 321 +++++++-----------
>>  .../chips-media/wave5/wave5-vpu-enc.c         | 313 +++++++++--------
>>  .../platform/chips-media/wave5/wave5-vpu.c    |  50 +++
>>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>>  .../platform/chips-media/wave5/wave5-vpuapi.c |  33 +-
>>  .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
>>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>>  .../media/platform/chips-media/wave5/wave5.h  |   3 +
>>  11 files changed, 460 insertions(+), 365 deletions(-)
>>
>> --
>> 2.43.0
>
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

