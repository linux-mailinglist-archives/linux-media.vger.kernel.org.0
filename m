Return-Path: <linux-media+bounces-63277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDsVOimhHWqncgkAu9opvQ
	(envelope-from <linux-media+bounces-63277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:11:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103962167C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA6AD30C89C3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608BC3D8137;
	Mon,  1 Jun 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOarpfYt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D93BED5C;
	Mon,  1 Jun 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326213; cv=none; b=INgCe82L7iURKbD3bzVJL4nKXpni4UDlPBZGLv21c/MsKj5Eyz6bLvT7IcyoHxSQ2qNntiOVOR73vmlsR6jMM2jvz0AF+CHriBLKnFhw53bVLX0yKvcQAL14YMyeB+kQi/XQPukHWtFiLM07uZHYY1MEclmeNx+4CqhMQuqjgEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326213; c=relaxed/simple;
	bh=nJO4vOcXb1PMyMD3uuvwW7Eu4iwEqxP2+Czmf4VdgcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJvOkFunP6j+/wo1IHbjRLh2i8ubZhzb6/DNvzQxhiSQoMhAbkF88xp0jU+5DjL9mXcMILmR1TYv5TC9W/yEJi9nKtBWL2MK82VDIDayMZJaSZoDk2l/8OQYuP3jlH12sFT+hMBMCqWUOZn2Vf6OO6GM7PWXFpL+J03MYIIYOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOarpfYt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358FC1F00898;
	Mon,  1 Jun 2026 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780326212;
	bh=+GdZNh9nypazEACywDjergp6kU0pITs/92TrBD2Yydw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BOarpfYt3NLRErRwvrz+DT6cEkQiE4gLhK5NtdACkatGrc9SMYyAFDoKVqEG7jLTM
	 AKqmPeWXeArjxnf8ACMoOR/J3sOJMPHrQ8mQaRjRQLdRE3tXrAEHNvKPh+aAiQuawA
	 3Y5GHTNIS5DW6qqcPhyQplOuJwSHzTru1oaymyN85KQnB0lOYpFKp2Ax3jvQurVPQ/
	 qLvwYTM9L+3RP3sQvwr/y5QuqTdTddFQ8LUHdE1XZOhZocM6pSYktQNMhKhIWdGNz5
	 Gwxd9ws81cMkZ8DNn7ZIJQH53HjHa2PU9KL3j+Y6jH3RjM31pzhgKzGgUQdaWNRuNj
	 tAzYel7/U+y5Q==
Message-ID: <2b61a13d-a117-4357-896b-1231990ef5ba@kernel.org>
Date: Mon, 1 Jun 2026 16:03:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <VPcNqxZEz2n3TKSiFdgaAEw4dFMQ2ES9_aCYCrKg97eRr6zflHIpe2JTGQ3S-sBGtyzOnDIODCcvKQMfYQ0GHQ==@protonmail.internalid>
 <ff2e9b4f-57c2-4fcb-b5f5-66f8f07b7b02@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <ff2e9b4f-57c2-4fcb-b5f5-66f8f07b7b02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63277-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,msgid.link:url,gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6103962167C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 10:01, Wangao Wang wrote:
> 
> 
> On 2026/5/21 17:24, Neil Armstrong wrote:
>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>> streams into 10bit pixel formats, linear and compressed.
>>
>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>> buffer calculations and HFI messages.
>>
>> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
>> but NV12 and P010 works out of the box with mainline Gstreamer.
>>
>> Fluster HEVC results on SM8650 using Gstreamer:
>>
>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
>> The failing test case:
>> - Pixel Format mismatch
>>    - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>> - Unsupported resolution
>>    - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>    - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>    - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>    - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>> - CRC mismatch
>>    - RAP_A_docomo_6
>>
>> v4l2-compliance results on SM8550 & SM8650:
>>
>> $ v4l2-compliance -d /dev/video1 -s
>> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
>>
>> Compliance test for iris_driver device /dev/video1:
>>
>> Driver Info:
>> 	Driver name      : iris_driver
>> 	Card type        : Iris Encoder
>> 	Bus info         : platform:aa00000.video-codec
>> 	Driver version   : 7.0.0
>> 	Capabilities     : 0x84204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 		Device Capabilities
>> 	Device Caps      : 0x04204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 	Detected Stateful Encoder
>>
>> Required ioctls:
>> 	test VIDIOC_QUERYCAP: OK
>> 	test invalid ioctls: OK
>>
>> Allow for multiple opens:
>> 	test second /dev/video1 open: OK
>> 	test VIDIOC_QUERYCAP: OK
>> 	test VIDIOC_G/S_PRIORITY: OK
>> 	test for unlimited opens: OK
>>
>> Debug ioctls:
>> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> 	test VIDIOC_QUERYCTRL: OK
>> 	test VIDIOC_G/S_CTRL: OK
>> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> 	Standard Controls: 43 Private Controls: 0
>>
>> Format ioctls:
>> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> 	test VIDIOC_G/S_PARM: OK
>> 	test VIDIOC_G_FBUF: OK (Not Supported)
>> 	test VIDIOC_G_FMT: OK
>> 	test VIDIOC_TRY_FMT: OK
>> 	test VIDIOC_S_FMT: OK
>> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> 	test Cropping: OK
>> 	test Composing: OK (Not Supported)
>> 	test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
>> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> 	test CREATE_BUFS maximum buffers: OK
>> 	test VIDIOC_REMOVE_BUFS: OK
>> 	test VIDIOC_EXPBUF: OK
>> 	test Requests: OK (Not Supported)
>> 	test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>> 	test read/write: OK (Not Supported)
>> 	Video Capture Multiplanar: Captured 61 buffers
>> 	test MMAP (select, REQBUFS): OK
>> 	Video Capture Multiplanar: Captured 61 buffers
>> 	test MMAP (epoll, REQBUFS): OK
>> 	Video Capture Multiplanar: Captured 61 buffers
>> 	test MMAP (select, CREATE_BUFS): OK
>> 	Video Capture Multiplanar: Captured 61 buffers
>> 	test MMAP (epoll, CREATE_BUFS): OK
>> 	test USERPTR (select): OK (Not Supported)
>> 	test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>
>> $ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
>> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
>>
>> Compliance test for iris_driver device /dev/video0:
>>
>> Driver Info:
>> 	Driver name      : iris_driver
>> 	Card type        : Iris Decoder
>> 	Bus info         : platform:aa00000.video-codec
>> 	Driver version   : 7.0.0
>> 	Capabilities     : 0x84204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 		Device Capabilities
>> 	Device Caps      : 0x04204000
>> 		Video Memory-to-Memory Multiplanar
>> 		Streaming
>> 		Extended Pix Format
>> 	Detected Stateful Decoder
>>
>> Required ioctls:
>> 	test VIDIOC_QUERYCAP: OK
>> 	test invalid ioctls: OK
>>
>> Allow for multiple opens:
>> 	test second /dev/video0 open: OK
>> 	test VIDIOC_QUERYCAP: OK
>> 	test VIDIOC_G/S_PRIORITY: OK
>> 	test for unlimited opens: OK
>>
>> Debug ioctls:
>> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
>> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>> 	test VIDIOC_QUERYCTRL: OK
>> 	test VIDIOC_G/S_CTRL: OK
>> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>> 	Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>> 	test VIDIOC_G/S_PARM: OK (Not Supported)
>> 	test VIDIOC_G_FBUF: OK (Not Supported)
>> 	test VIDIOC_G_FMT: OK
>> 	test VIDIOC_TRY_FMT: OK
>> 	test VIDIOC_S_FMT: OK
>> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>> 	test Cropping: OK
>> 	test Composing: OK
>> 	test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>> 	test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>> 	test CREATE_BUFS maximum buffers: OK
>> 	test VIDIOC_REMOVE_BUFS: OK
>> 	test VIDIOC_EXPBUF: OK
>> 	test Requests: OK (Not Supported)
>> 	test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>> 	test read/write: OK (Not Supported)
>> the input file is smaller than 7077888 bytes
>> 	Video Capture Multiplanar: Captured 601 buffers
>> 	test MMAP (select, REQBUFS): OK
>> the input file is smaller than 7077888 bytes
>> 	Video Capture Multiplanar: Captured 601 buffers
>> 	test MMAP (epoll, REQBUFS): OK
>> the input file is smaller than 7077888 bytes
>> 	Video Capture Multiplanar: Captured 601 buffers
>> 	test MMAP (select, CREATE_BUFS): OK
>> the input file is smaller than 7077888 bytes
>> 	Video Capture Multiplanar: Captured 601 buffers
>> 	test MMAP (epoll, CREATE_BUFS): OK
>> 	test USERPTR (select): OK (Not Supported)
>> 	test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>
>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Picked review tags
>> - Use u32 instead of __u32
>> - Explicit DPB
>> - Drop NULL and use >>1 in q10c buffer calc
>> - Drop selicolon after switch statementr
>> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
>> - Rebase on media next tree after the file split
>> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
>>
>> Changes in v3:
>> - Added review tag on patch 1
>> - Limited stride command to AV1 decoding only
>> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
>>
>> Changes in v2:
>> - Fixed bug breaking 8bit decoding
>> - Dropped filtering on G_FMT while waiting for soure change
>> - Dropped format filtering on ENUMFMT
>> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
>> - Cleaned and refactors the width/height/stride calculations
>> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
>> - Passed fluster and v4l2-compliance to check for non regression
>> - Tested on SM8550
>> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
>> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
>>
>> ---
>> Neil Armstrong (6):
>>         media: qcom: iris: add helpers for 8bit and 10bit formats
>>         media: qcom: iris: add QC10C & P010 buffer size calculations
>>         media: qcom: iris: gen2: add support for 10bit decoding
>>         media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>         media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>         media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>
>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>>    drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>    drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>    .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>    drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>    drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>    drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>    10 files changed, 364 insertions(+), 15 deletions(-)
>> ---
>> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>
>> Best regards,
>> --
>> Neil Armstrong <neil.armstrong@linaro.org>
>>
>>
> 
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> 
> --
> Best Regards,
> Wangao
> 

Neil can you rebase this - I can pick it up once you are happy.

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next-smoketest?ref_type=heads

---
bod

