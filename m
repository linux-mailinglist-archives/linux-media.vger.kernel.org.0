Return-Path: <linux-media+bounces-12721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5955A900310
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B9A284606
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE252190675;
	Fri,  7 Jun 2024 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="wXtWNkOY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38113C67B;
	Fri,  7 Jun 2024 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762343; cv=none; b=eVpa7iACy/jdfBWC4FvGqfM4wuc7z0W6KXswzVHs7aSdaHAsXxH4RHQnrA+T2SB/gVmxKADCYCi5Uuxk7kq0YRTuYzq+jEfFwc6d+o6MNQploDmGgNLF152dkcFj5aYtCxoRmW6DznglD+Kuf55SlwV7ZZ0oqOs2AFEqycli5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762343; c=relaxed/simple;
	bh=Isge6V258XwD9EF6btjCGSr5yWwlPbgSwWmwYb2m9WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcEpdwN0o3x2rNhx6Qt3DLWRcMMv6y0wfEjq0cjxFqsmGrKVdytXf0PYoYTmRFEBSppHvnk+4qhFBiEi6ttLDixoqPrBwMAevXcqprzIyOWOJ7PDOGakBgSZI2DpcV6pDZE9dj94wbbj9a5XkCjlmkopavSpGLsb1195oEqtDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=wXtWNkOY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717762339;
	bh=Isge6V258XwD9EF6btjCGSr5yWwlPbgSwWmwYb2m9WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wXtWNkOY1BZxiAsxX4Y0ZP2WX+kUA0XHgMI2Z8wPXRIDRVlWmn5SlVKpfA055Q6Wf
	 1etGHm8S4TU9lFowTTTfHOwSF4bB6eGUfStZ55wmdRQLG2P7V/9AAkhwGWk7XuR6jP
	 dfgtB3u+crSQebBMcRdkO19lio/+IUxiZzuhYJ5+DPfdp/bJRmFXXoBKAu6Hcn3CfY
	 V5povZvcmbnizgSpNUKqrIkztwWcBaQDul5PJL2i4ZBZR2nEl5+6kjBVIhBNl6CquH
	 5XiH26EbsBe5hZPnoBTQQsrxn3WcTgtwn3UY0ileYBz0ksH8Cw89l32epsZvc2LmVP
	 hP7th7SKrwjOQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5BC923782158;
	Fri,  7 Jun 2024 12:12:19 +0000 (UTC)
Date: Fri, 7 Jun 2024 14:12:18 +0200
From: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: Re: [RESEND PATCH v4 0/4] Add features to an existing driver
Message-ID: <20240607121218.47rvzrgkxftkv7ws@basti-XPS-13-9310>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB13031A560625CE8C7614D5F6EDE92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <20240606124339.i5l25wwo6fca2ne2@basti-XPS-13-9310>
 <SE1P216MB130381665976C2B194FEB553EDFB2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <SE1P216MB130381665976C2B194FEB553EDFB2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>

Hey Jackson,

On 07.06.2024 11:01, jackson.lee wrote:
>Hi Sebastian
>
>Should we send the v5 patch after fixing the warning messages?

Yes please that would be great :).

>
>Thanks
>Jackson

Regards,
Sebastian

>
>
>> -----Original Message-----
>> From: sebastian.fricke@collabora.com <sebastian.fricke@collabora.com>
>> Sent: Thursday, June 6, 2024 9:44 PM
>> To: jackson.lee <jackson.lee@chipsnmedia.com>
>> Cc: mchehab@kernel.org; nicolas@ndufresne.ca; linux-media@vger.kernel.org;
>> linux-kernel@vger.kernel.org; hverkuil@xs4all.nl; Nas Chung
>> <nas.chung@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>; b-
>> brnich@ti.com
>> Subject: Re: [RESEND PATCH v4 0/4] Add features to an existing driver
>>
>> Hey Jackson,
>>
>> On 20.05.2024 01:45, jackson.lee wrote:
>> >Hi sebastian and Nicolas
>> >
>> >I sent the v4 patch. Can you please review them ?
>>
>> so overall this looks good now, but there are still a few warnings:
>> https://linux-media.pages.freedesktop.org/-/users/sebastianfricke/-
>> /jobs/59559963/artifacts/report.htm
>>
>> Could you please look into those? (Please tell me if you can't access the
>> link)
>>
>> >
>> >https://lore.kernel.org/linux-media/20240510112252.800-1-jackson.lee@ch
>> >ipsnmedia.com/
>> >
>> >
>> >thanks
>> >Jackson
>>
>> Regards,
>> Sebastian
>>
>> >
>> >> -----Original Message-----
>> >> From: jackson.lee <jackson.lee@chipsnmedia.com>
>> >> Sent: Friday, May 10, 2024 8:23 PM
>> >> To: mchehab@kernel.org; nicolas@ndufresne.ca;
>> >> sebastian.fricke@collabora.com
>> >> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>> >> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
>> >> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee
>> >> <jackson.lee@chipsnmedia.com>
>> >> Subject: [RESEND PATCH v4 0/4] Add features to an existing driver
>> >>
>> >> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
>> >>
>> >> The wave5 codec driver is a stateful encoder/decoder.
>> >> The following patches is for supporting yuv422 inpuy format,
>> >> supporting runtime suspend/resume feature and extra things.
>> >>
>> >> v4l2-compliance results:
>> >> ========================
>> >>
>> >> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>> >>
>> >> Buffer ioctls:
>> >>             warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
>> supported
>> >>             warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
>> supported
>> >>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> >>     test VIDIOC_EXPBUF: OK
>> >>     test Requests: OK (Not Supported)
>> >>
>> >> Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0,
>> >> Warnings: 2 Total for wave5-enc device /dev/video1: 45, Succeeded: 45,
>> Failed:
>> >> 0, Warnings: 0
>> >>
>> >> Fluster test results:
>> >> =====================
>> >>
>> >> Running test suite JCT-VC-HEVC_V1 with decoder
>> >> GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
>> >> Ran 132/147 tests successfully               in 97.421 secs
>> >>
>> >> (1 test fails because of not supporting to parse multi frames, 1 test
>> >> fails because of a missing frame and slight corruption,
>> >>  2 tests fail because of sizes which are incompatible with the IP, 11
>> >> tests fail because of unsupported 10 bit format)
>> >>
>> >> Running test suite JVT-AVC_V1 with decoder
>> >> GStreamer-H.264-V4L2-Gst1.0 Using
>> >> 1 parallel job(s)
>> >> Ran 77/135 tests successfully               in 37.233 secs
>> >>
>> >> (58 fail because the hardware is unable to decode  MBAFF / FMO /
>> >> Field / Extended profile streams.)
>> >>
>> >> Change since v3:
>> >> =================
>> >>
>> >> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS
>> >> generation for each IDR
>> >>  - add Reviewed-By tag
>> >>
>> >> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
>> >> suspend/resume
>> >>  - add Reviewed-By tag
>> >>
>> >> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to
>> >> calculate bytesperline and sizeimage.
>> >>  - modify the commit message
>> >>  - define three framesize structures for decoder
>> >>
>> >> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw
>> >> pixel- formats on the encoder
>> >>  - modify the commit message
>> >>  - use the v4l2_format_info to calculate luma, chroma size
>> >>
>> >> Change since v2:
>> >> =================
>> >>
>> >> * For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS
>> >> generation for each IDR
>> >>  - add the suggested _SHIFT suffix
>> >>
>> >> * For [PATCH v3 1/4] media: chips-media: wave5: Support runtime
>> >> suspend/resume
>> >>  - change a commit message
>> >>
>> >> * For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to
>> >> calculate bytesperline and sizeimage
>> >>  - add pix_fmt_type parameter into wave5_update_pix_fmt function
>> >>  - add min/max width/height values into dec_fmt_list
>> >>
>> >> Change since v1:
>> >> =================
>> >>
>> >> * For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS
>> >> generation for each IDR
>> >>  - define a macro for register addresses
>> >>
>> >> * For [PATCH v2 1/4] media: chips-media: wave5: Support runtime
>> >> suspend/resume
>> >>  - add auto suspend/resume
>> >>
>> >> * For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to
>> >> calculate bytesperline and sizeimage
>> >>  - use helper functions to calculate bytesperline and sizeimage
>> >>
>> >> * For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw
>> >> pixel- formats on the encoder
>> >>  - remove unnecessary codes
>> >>
>> >> Change since v0:
>> >> =================
>> >> The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make
>> >> a simple define, tab and multiple lines has been removed, The macro
>> >> is defined using one line.
>> >>
>> >> Jackson.lee (4):
>> >>   media: chips-media: wave5: Support SPS/PPS generation for each IDR
>> >>   media: chips-media: wave5: Support runtime suspend/resume
>> >>   media: chips-media: wave5: Use helpers to calculate bytesperline and
>> >>     sizeimage.
>> >>   media: chips-media: wave5: Support YUV422 raw pixel-formats on the
>> >>     encoder.
>> >>
>> >>  .../platform/chips-media/wave5/wave5-helper.c |  24 ++
>> >>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>> >>  .../platform/chips-media/wave5/wave5-hw.c     |  23 +-
>> >>  .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++-----------
>> >>  .../chips-media/wave5/wave5-vpu-enc.c         | 300 +++++++++--------
>> >>  .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
>> >>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>> >>  .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
>> >>  .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
>> >>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>> >>  .../media/platform/chips-media/wave5/wave5.h  |   3 +
>> >>  11 files changed, 414 insertions(+), 343 deletions(-)
>> >>
>> >> --
>> >> 2.43.0
>> >

