Return-Path: <linux-media+bounces-63779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tGSxNZhMIWoyCwEAu9opvQ
	(envelope-from <linux-media+bounces-63779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:59:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D182D63EC03
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 11:59:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63779-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63779-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=radxa.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D382B300383A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 09:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0EA3FC5A1;
	Thu,  4 Jun 2026 09:46:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831A3F1654;
	Thu,  4 Jun 2026 09:46:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566391; cv=none; b=ny5tXNpthG/FJgf7IlCG3Yyn0PomjErkChhIyM4Ryot2JzrLIu4WWV91xStFOqg9yfp8ElvwoJ64GF/T23AXzURIxcpXDoMDXqJ9k1vj4yQiTQaJl3iO0I/R2faIMp5bCDJ4EII6IvZqFzEYaufVw+iOM0GrtZMCuVDmKxwSVjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566391; c=relaxed/simple;
	bh=IWQmpkiTF6OJHnlmQb4VtjWzSM5IryDeY0fSBTE4MYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRA776q31hMB5d6V1u4dZyPcdIHVE/jondsUOKeDM1NRgpEgZURJzpQlXbGAkWgAs/0oYGES58rwnvu07w2FzrKcJaP0FLTR8F16LXt5kf+6rJvlXVw0k57IjW1z4/2jXHw2X1Nm2hl09W8X0sAVYeOAmxcKlOQtIASL/vXFzMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
X-QQ-mid: zesmtpgz8t1780566338ta207db5d
X-QQ-Originating-IP: v2AcioYk297SfufuVz80y2lAD4eBNJ3YEgMmMTAS92I=
Received: from [127.0.0.1] ( [116.234.26.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jun 2026 17:45:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6123577943305999327
Message-ID: <DFFF81C905044BF8+c830d1b4-7f26-45f7-9c4f-17409cf24fb8@radxa.com>
Date: Thu, 4 Jun 2026 17:45:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] media: qcom: iris: Add generic Gen2 firmware
 detection and loading
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NcJjCMiwxJCEGfXu7DZrGPaoAV8Gqa5oRaDheyR1HFvB+tQ56WPjN7B9
	yeEsLVEOi9gHYKJjEh+Mxl61QeC/3pYV9o6g6y4LCNJHil/Nflv3jcvImhh5x6JaVDG1CGd
	MUkcWJxUeSjp7pp2+uJxTYRnL75J2T5C6HfsTae6wif2IbL4PKvgdL1yaRRiNAmMu9uzW7E
	K+uokUm8HGtW0kVF7AdQyEu9Q4s3L5KUW6AhI3CT2og6/QuQ3eJMp18LhhIPLoeaC52oivd
	H6u6yvJZ7GGmdkJ0n4wP5I6obJij/mcPmZJTbeTLymKDq2U0HOHVSaQr2z0gNKr3fjbEneq
	E15NwBQ6GD7gn3jhqJ3ZF1dtBq5O9DjcVUMSw8HQFmJw4RCeoP9fy8PFB4H6yJYe9NrH69N
	TIbe8zr4ZAJyTEXd0CzIdtNGaghOieXJrEEuqyD0MMhKoLB+GrtGjPxw++DO/rD2jQ1IABf
	Exr4UkpztJixBPXIF81z9ObLRqMmOn94UKjkngIqRHRRE9A7LeiafEGKqBC8WezYnIUzpAN
	jFOFjl+IpM/L3NODNckXO8I9ub9LBTj0O43WCpPfcIDbyuM/XRR0/4Te+qRZuSCK3TcFgBB
	QJwCoOstP+4HKljx/N/eI5RDwtEeV7iOcuZ6wnIKuxr1fBJIXXdgwjGogZIf4mv2si23Let
	CHn2wisyLEYQA/ghaNCaNDEQQf9i22nAOFwswfRv5ckJyabDNxJgiKii8LAAtYVFG3Js4/f
	TlmOPWQncwkf+EkRinikcbdhoXKVPXDKBxBaf2dY2NnAZEhtaNzWLsI+YfwAorPKt32D73s
	k6PoUNveJ8ZSbOUeqwIhaXg5yx9GB+4Q1aOpPU5KyjMSOWxYLyg5YAY+01hM+JT5laeS8oN
	zR9KTINFzBVrT4+h0e+8mdz/oyEVfbqFGF/zaA6S/ePJElHZ4/EXOxXDzeWlIxTGQ2EbljP
	zrywBGU6TWMn9azWuphfC+SLycA8t3jOIc8CWBGtoYPeULPLTOOBIS8wZJ24QFYwoqH9WeL
	eV9n6JUhOlo0ZtHxkG
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63779-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:mid,radxa.com:from_mime,radxa.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D182D63EC03

On 5/29/2026 10:36 PM, Dmitry Baryshkov wrote:
> This series enhances the Iris driver to support platforms that provide both
> Gen1 and Gen2 HFI firmware by adding generic runtime firmware generation
> detection and selection logic.
> 
> Some Iris platforms are capable of running either Gen1 or Gen2 HFI‑based
> firmware, but the driver has historically assumed a single firmware
> generation selected at build or platform‑definition time. This series
> updates the firmware loading mechanism to dynamically determine the
> firmware generation at runtime and select the appropriate HFI
> implementation accordingly.
> 
> When no Device Tree firmware override is present, the driver now prefers
> Gen2 firmware when available and falls back to Gen1 if loading Gen2
> fails. When a firmware name is explicitly provided via Device Tree and
> both Gen1 and Gen2 descriptors are available, the loaded firmware image
> is inspected prior to authentication to determine its generation. Based
> on this detection, the driver updates its firmware descriptor and
> platform data so that the correct HFI implementation is used.
> 

[...]

FWIW, I am testing the Gen2 firmware on sc8280xp, although it is 
supposed to be used on sm8350 (lahaina). The original filename is 
vpu20_4v.mbn.

It actually works quite well on sc8280xp with some Device Tree changes 
[1]. So far, I have not observed any crashes or reboots. Could someone 
from Qualcomm clarify whether the Gen2 firmware is expected to work on 
targets such as sm8250, sm8350, and sc8280xp?

[1] 
https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.11-qcom/arch/arm64/boot/dts/qcom

v4l2-compliance results on sc8280xp with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
         Driver name      : iris_driver
         Card type        : Iris Encoder
         Bus info         : platform:aa00000.video-codec
         Driver version   : 7.0.11
         Capabilities     : 0x84204000
                 Video Memory-to-Memory Multiplanar
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x04204000
                 Video Memory-to-Memory Multiplanar
                 Streaming
                 Extended Pix Format
         Detected Stateful Encoder

Required ioctls:
         test VIDIOC_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/video1 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
         test VIDIOC_QUERYCTRL: OK
         test VIDIOC_G/S_CTRL: OK
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 64 Private Controls: 0

Format ioctls:
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls:
         test VIDIOC_(TRY_)ENCODER_CMD: OK
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)
         test blocking wait: OK

Test input 0:

Streaming ioctls:
         test read/write: OK (Not Supported)
         Video Capture Multiplanar: Captured 63 buffers
                 fail: v4l2-test-buffers.cpp(1750): 
node->streamon(q.g_type())
         test MMAP (select, REQBUFS): FAIL
         Video Capture Multiplanar: Captured 63 buffers
                 fail: v4l2-test-buffers.cpp(1750): 
node->streamon(q.g_type())
         test MMAP (epoll, REQBUFS): FAIL
         Video Capture Multiplanar: Captured 63 buffers
                 fail: v4l2-test-buffers.cpp(1750): 
node->streamon(q.g_type())
         test MMAP (select, CREATE_BUFS): FAIL
         Video Capture Multiplanar: Captured 63 buffers
                 fail: v4l2-test-buffers.cpp(1750): 
node->streamon(q.g_type())
         test MMAP (epoll, CREATE_BUFS): FAIL
         test USERPTR (select): OK (Not Supported)
         test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 50, Failed: 4, 
Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=FVDO_Freeway_720p.264
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
         Driver name      : iris_driver
         Card type        : Iris Decoder
         Bus info         : platform:aa00000.video-codec
         Driver version   : 7.0.11
         Capabilities     : 0x84204000
                 Video Memory-to-Memory Multiplanar
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x04204000
                 Video Memory-to-Memory Multiplanar
                 Streaming
                 Extended Pix Format
         Detected Stateful Decoder

Required ioctls:
         test VIDIOC_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/video0 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
         test VIDIOC_QUERYCTRL: OK
         test VIDIOC_G/S_CTRL: OK
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 12 Private Controls: 0

Format ioctls:
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK (Not Supported)
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK
         test Composing: OK
         test Scaling: OK (Not Supported)

Codec ioctls:
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)
         test blocking wait: OK

Test input 0:

Streaming ioctls:
         test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
         Video Capture Multiplanar: Captured 465 buffers
         test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
         Video Capture Multiplanar: Captured 465 buffers
         test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
         Video Capture Multiplanar: Captured 465 buffers
         test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
         Video Capture Multiplanar: Captured 465 buffers
         test MMAP (epoll, CREATE_BUFS): OK
         test USERPTR (select): OK (Not Supported)
         test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

fluster results here:

https://gist.github.com/strongtz/fb755ef3f05dd16a4bf4ac0b00f83c03

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

