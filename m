Return-Path: <linux-media+bounces-18925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F698BD88
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AEEC1C2321A
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F012B1C3F38;
	Tue,  1 Oct 2024 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rn/dCXYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B542637
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789347; cv=none; b=UvdlNn8dnCtCjAQsuorTdKQ2f0//SyScPM7/z7e32OX7VvTnE6SJNpWb0ENR9tvzY2ZbQ2Q38iSDA4LEdD7YnD3NPRAUk8mBVggJPgN56ctl7kPfO/+Wv3pJlgPaRjBk2vwCAMxs+XZAUT2hiN7NbdqTBYy74GKrZTZLN6USeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789347; c=relaxed/simple;
	bh=1wgO1vb94jR/BMR8h+2hGGTmciNicTroI6cDIHPIzJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUt8p51IJu8NOVCX9mCgnNm5QbDq/QqmsU/W7blGIoECOjkU13EZ8Bji3pVtFujmwXk1QDNogHtugfB6/0l5oyM8z1VQ5OXfQzSTzHGWFdkHtPEh07PHT9E6c7//Y4Iwzf9Gx4cNYmzXVAHl3IdlxM0JhZXTqGn2E5Pifia1UqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rn/dCXYk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso39079405e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727789341; x=1728394141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBlYI8WyH/aoVCtsK01RuNEb/G/xLV8RUdANn4838zU=;
        b=rn/dCXYkAPGcU0cCPxmEBQZqpsli7Py94rZPIb/I270f0fCIHBkicKizTV1ImgsHUW
         tcLvYJL+R5gCwwkZOHxF7tR0c/cjAhoTgPbG64pnkvUxDY03Q4FRbU4eYDoFkk4GaQfM
         uPpGWbUvWna2qH1EformjRBS0ErdSGK11v8CHTehlGKf0K2kDTcpki3ERa508nleyGbB
         INwbWsA+bqCrFzxcCvD7Ssl5Eqy4Hubkfm9cSTtICoX38S6PY2H6c+GG8tPHekz0pT6j
         k5X2IdVupi/2CnEejlD9Q+9vte1P2D80+tJNJGSit+DfQl6hS0edmsiPloU3cNQ/SLwg
         qKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789341; x=1728394141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBlYI8WyH/aoVCtsK01RuNEb/G/xLV8RUdANn4838zU=;
        b=wvzlTySxYg0q03oXDKCNnMq7xM3/SZclnERCHoJii3Rv1XRUMXeLCCaO/1F+SpLsDa
         T21zkMYNmQEoPGupY98t0hSqiFHRFdtWsSKypjZMVmgjlbCLXlALILZXJjveizT2c7Ci
         p9KRrOrcE676aK1FJJKflJtYt070ErtCp/76PtqSGAL2p3who2JpbM8xDVQkUPMPmJ6p
         347OPMMFbMhud88CGhsedjD6otjNm6KFi1rUj3iIZQP1kRSFMLPxW4PD/NQ3f7iJ2Y87
         74PeObvDXuv9akM56bAgKnFdup1pC9cNHZNpEqIUwd7max1UvDmnAPniOj19tjM2vG11
         NWeA==
X-Gm-Message-State: AOJu0YzH0JXVs2TLC208F/yUocY47b8JptM9U8p4XrCaEX+WiOHrfxk6
	6/SWpeoHi/FzR18YR3rm7nMF5mBasBLwaoc12zhQLRrdgpNnGeR2E/0jStNrc/Q=
X-Google-Smtp-Source: AGHT+IG8yBJEtDKSZ/hnZ96VF1WjC1daRkPqvu15O6KDfeYzuefi8pjX8BPBNmb0TiYcvnFtaNFKxg==
X-Received: by 2002:a05:600c:1c9c:b0:426:5b17:8458 with SMTP id 5b1f17b1804b1-42f713560d5mr20350295e9.12.1727789340585;
        Tue, 01 Oct 2024 06:29:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7001:d575:d71f:f3b? ([2a01:e0a:982:cbb0:7001:d575:d71f:f3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dd2d3bsm132887575e9.2.2024.10.01.06.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:29:00 -0700 (PDT)
Message-ID: <be66f346-82e9-4671-bb80-7928d68830f5@linaro.org>
Date: Tue, 1 Oct 2024 15:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <9b116753-9a21-4f9c-b86f-dded20713b53@linaro.org>
 <ac9c2b3d-f035-4ca2-c737-6ed72d54b150@quicinc.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <ac9c2b3d-f035-4ca2-c737-6ed72d54b150@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/09/2024 à 11:13, Dikshita Agarwal a écrit :
> Hi Neil,
> 
> On 8/27/2024 7:11 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>

<snip>

>>>
>>> The result of v4l2-compliance test on SM8550:
>>>
>>> v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
>>>
>>> Compliance test for iris_driver device /dev/video0:
>>>
>>> Driver Info:
>>>           Driver name      : iris_driver
>>>           Card type        : iris_decoder
>>>           Bus info         : platform:iris_icc
>>>           Driver version   : 6.11.0
>>>           Capabilities     : 0x84204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x04204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>           Detected Stateful Decoder
>>>
>>> Required ioctls:
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video0 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>                   fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(763):
>>> !ok
>>>           test for unlimited opens: FAIL
>>
>> You are supossed to fix those 2 failures to be compliant.
>>
> Sure, we will fix this in next version.
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>           test VIDIOC_QUERYCTRL: OK
>>>           test VIDIOC_G/S_CTRL: OK
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 3 Private Controls: 0
>>>
>>> Format ioctls:
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK
>>>           test Composing: OK
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>           test Requests: OK (Not Supported)
>>
>> I've been trying to test the driver on QRD8550, and I tried to
>> decode a stream with v4l2-ctl and v4l2-compliance using --stream-from-hdr
>> and it completely fails:
>>
>> # v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264
>> --set-fmt-video=pixelformat=NV12
>> --stream-from-hdr=/Big_Buck_Bunny_1080_10s_5MB.264.hdr --stream-count=25
>> --stream-mmap --stream-to=out.nv12
>> VIDIOC_QUERYCAP: ok
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Capture Multiplanar:
>>      Width/Height      : 384/256
>>      Pixel Format      : 'NV12' (Y/UV 4:2:0)
>>      Field             : None
>>      Number of planes  : 1
>>      Flags             :
>>      Colorspace        : Default
>>      Transfer Function : Default
>>      YCbCr/HSV Encoding: Default
>>      Quantization      : Default
>>      Plane 0           :
>>         Bytes per Line : 384
>>         Size Image     : 147456
>> VIDIOC_G_FMT: ok
>> VIDIOC_S_FMT: ok
>> Format Video Output Multiplanar:
>>      Width/Height      : 320/240
>>      Pixel Format      : 'H264' (H.264)
>>      Field             : None
>>      Number of planes  : 1
>>      Flags             :
>>      Colorspace        : Default
>>      Transfer Function : Default
>>      YCbCr/HSV Encoding: Default
>>      Quantization      : Default
>>      Plane 0           :
>>         Bytes per Line : 0
>>         Size Image     : 7077888
>>          VIDIOC_REQBUFS returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_QUERYBUF returned 0 (Success)
>>          VIDIOC_G_FMT returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_QBUF returned 0 (Success)
>>          VIDIOC_STREAMON returned 0 (Success)
>>
>> <then nothing>
>>
>> and :
>> # v4l2-compliance --stream-from-hdr /Big_Buck_Bunny_1080_10s_5MB.264.hdr
>> -s250 -d /dev/video0
>> ...
>>
>> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
>>
>> Compliance test for iris_driver device /dev/video0:
>>
>> Driver Info:
>>      Driver name      : iris_driver
>>      Card type        : iris_decoder
>>      Bus info         : platform:iris_icc
>>      Driver version   : 6.11.0
>>      Capabilities     : 0x84204000
>>          Video Memory-to-Memory Multiplanar
>>          Streaming
>>          Extended Pix Format
>>          Device Capabilities
>>      Device Caps      : 0x04204000
>>          Video Memory-to-Memory Multiplanar
>>          Streaming
>>          Extended Pix Format
>>      Detected Stateful Decoder
>> ...
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>      test read/write: OK (Not Supported)
>>          fail: v4l2-test-buffers.cpp(2848): !thread_streamoff.done
>>          fail: v4l2-test-buffers.cpp(2876): testBlockingDQBuf(node, q)
>>      test blocking wait: FAIL
>>          fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
>>          fail: v4l2-test-buffers.cpp(1390): buf.qbuf(node)
>>      test MMAP (select): FAIL
>>          fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
>>          fail: v4l2-test-buffers.cpp(1390): buf.qbuf(node)
>>      test MMAP (epoll): FAIL
>>      test USERPTR (select): OK (Not Supported)
>>      test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video0: 51, Succeeded: 47, Failed: 4,
>> Warnings: 0
>>
>> but using ffmpeg seems to work:
>>
>> # ffmpeg -r 1 -c:v h264_v4l2m2m -i /Big_Buck_Bunny_1080_10s_5MB.264.hdr
>> -pix_fmt nv21 -f rawvideo -y out.nv21
>> ffmpeg version 6.1.1 Copyright (c) 2000-2023 the FFmpeg developers
>> ...
>> Input #0, h264, from '/Big_Buck_Bunny_1080_10s_5MB.264.hdr':
>>    Duration: N/A, bitrate: N/A
>>    Stream #0:0: Video: h264 (High), yuv420p(progressive), 1920x1080 [SAR 1:1
>> DAR 16:9], 25 fps, 60 tbr, 1200k tbn
>> [h264_v4l2m2m @ 0x26b7a540] Using device /dev/video0
>> [h264_v4l2m2m @ 0x26b7a540] driver 'iris_driver' on card 'iris_decoder' in
>> mplane mode
>> [h264_v4l2m2m @ 0x26b7a540] requesting formats: output=H264/none
>> capture=NV12/yuv420p
>> Stream mapping:
>>    Stream #0:0 -> #0:0 (h264 (h264_v4l2m2m) -> rawvideo (native))
>> Press [q] to stop, [?] for help
>> Output #0, rawvideo, to 'out.nv21':
>>    Metadata:
>>      encoder         : Lavf60.16.100
>>    Stream #0:0: Video: rawvideo (NV21 / 0x3132564E), nv21(tv, progressive),
>> 1920x1080 [SAR 1:1 DAR 16:9], q=2-31, 24883 kb/s, 1 fps, 1 tbn
>>      Metadata:
>>        encoder         : Lavc60.31.102 rawvideo
>> [out#0/rawvideo @ 0x26aae650] video:911250kB audio:0kB subtitle:0kB other
>> streams:0kB global headers:0kB muxing overhead: 0.000000%
>> frame=  300 fps= 95 q=-0.0 Lsize=  911250kB time=00:04:59.00
>> bitrate=24966.4kbits/s speed=94.7x
>>
>> I had to set output framerate to 1 otherwise ffmpeg would drop 298 frames:
>> frame=    3 fps=0.9 q=-0.0 Lsize=    9112kB time=00:00:00.06
>> bitrate=1119738.4kbits/s dup=0 drop=298 speed=0.0195x
>>
>> Could you explain how do you test the driver and which wich stream ?
>>
> We actually didn't run the v4l2-compliance with -s option while testing the
> driver.
> we tested without it and with Gstreamer :
> 
> gst-launch-1.0 filesrc
> location=/media/media/fluster/resources/JVT-AVC_V1/CVSE3_Sony_H/CVSE3_Sony_H.jsv
> ! h264parse ! v4l2h264dec capture-io-mode=dmabuf output-io-mode=dmabuf !
> kmssink
> 
> We will run v4l2-compliance with -s option and v4l-ctl, fixed the issues
> and share the report in next version.

Great !

Thanks,
Neil

> 
> Thanks,
> Dikshita
>>>
>>> Total for iris_driver device /dev/video0: 47, Succeeded: 46, Failed: 1,
>>> Warnings: 0
>>>
>>> The result of v4l2-compliance test on SM8250:
>>>
>>> v4l2-compliance 1.29.0-5239, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: a1ebb4dad512 2024-08-08 20:00:17
>>>
>>> Compliance test for iris_driver device /dev/video0:
>>>
>>> Driver Info:
>>>           Driver name      : iris_driver
>>>           Card type        : iris_decoder
>>>           Bus info         : platform:iris_icc
>>>           Driver version   : 6.11.0
>>>           Capabilities     : 0x84204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x04204000
>>>                   Video Memory-to-Memory Multiplanar
>>>                   Streaming
>>>                   Extended Pix Format
>>>           Detected Stateful Decoder
>>>
>>> Required ioctls:
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video0 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>                   fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(763):
>>> !ok
>>>           test for unlimited opens: FAIL
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>           test VIDIOC_QUERYCTRL: OK
>>>           test VIDIOC_G/S_CTRL: OK
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 2 Private Controls: 0
>>>
>>> Format ioctls:
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK (Not Supported)
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK
>>>           test Composing: OK
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK (Not Supported)
>>>           test Requests: OK (Not Supported)
>>>
>>> Total for iris_driver device /dev/video0: 47, Succeeded: 46, Failed: 1,
>>> Warnings: 0
>>>
>>> Fluster score on SM8550:
>>>
>>> 77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
>>> The failing tests are:
>>> - 52 test vectors failed due to interlaced clips: Interlaced decoding is
>>>     not supported in iris driver.
>>>     Test Vectors:
>>>           cabac_mot_fld0_full
>>>           cabac_mot_mbaff0_full
>>>           cabac_mot_picaff0_full
>>>           CABREF3_Sand_D
>>>           CAFI1_SVA_C
>>>           CAMA1_Sony_C
>>>           CAMA1_TOSHIBA_B
>>>           cama1_vtc_c
>>>           cama2_vtc_b
>>>           CAMA3_Sand_E
>>>           cama3_vtc_b
>>>           CAMACI3_Sony_C
>>>           CAMANL1_TOSHIBA_B
>>>           CAMANL2_TOSHIBA_B
>>>           CAMANL3_Sand_E
>>>           CAMASL3_Sony_B
>>>           CAMP_MOT_MBAFF_L30
>>>           CAMP_MOT_MBAFF_L31
>>>           CANLMA2_Sony_C
>>>           CANLMA3_Sony_C
>>>           CAPA1_TOSHIBA_B
>>>           CAPAMA3_Sand_F
>>>           cavlc_mot_fld0_full_B
>>>           cavlc_mot_mbaff0_full_B
>>>           cavlc_mot_picaff0_full_B
>>>           CVCANLMA2_Sony_C
>>>           CVFI1_Sony_D
>>>           CVFI1_SVA_C
>>>           CVFI2_Sony_H
>>>           CVFI2_SVA_C
>>>           CVMA1_Sony_D
>>>           CVMA1_TOSHIBA_B
>>>           CVMANL1_TOSHIBA_B
>>>           CVMANL2_TOSHIBA_B
>>>           CVMAPAQP3_Sony_E
>>>           CVMAQP2_Sony_G
>>>           CVMAQP3_Sony_D
>>>           CVMP_MOT_FLD_L30_B
>>>           CVNLFI1_Sony_C
>>>           CVNLFI2_Sony_H
>>>           CVPA1_TOSHIBA_B
>>>           FI1_Sony_E
>>>           MR6_BT_B
>>>           MR7_BT_B
>>>           MR8_BT_B
>>>           MR9_BT_B
>>>           Sharp_MP_Field_1_B
>>>           Sharp_MP_Field_2_B
>>>           Sharp_MP_Field_3_B
>>>           Sharp_MP_PAFF_1r2
>>>           Sharp_MP_PAFF_2r
>>>           CVMP_MOT_FRM_L31_B
>>> - 3 test vectors failed due to unsupported bitstream.
>>>     num_slice_group_minus1 greater than zero is not supported by the
>>> hardware.
>>>     Test Vectors:
>>>           FM1_BT_B
>>>           FM1_FT_E
>>>           FM2_SVA_C
>>> - 2 test vectors failed because SP_SLICE type is not supported by the
>>> hardware.
>>>     Test Vectors:
>>>           SP1_BT_A
>>>           sp2_bt_b
>>> - 1 test vector failed due to unsupported profile:
>>>     V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED is being deprecated from sm8550
>>>     onwards due to hardware issues.
>>>     Test Vectors:
>>>           BA3_SVA_C
>>>
>>> 23/69 while testing JVT-FR-EXT with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
>>> The failing tests are:
>>> - 21 test vectors failed due to interlaced clips: Interlaced decoding is
>>>     not supported in iris driver.
>>>     Test Vectors:
>>>           brcm_freh4
>>>           brcm_freh5
>>>           brcm_freh6
>>>           brcm_freh10
>>>           brcm_freh11
>>>           freh7_b
>>>           FREXT01_JVC_D
>>>           FREXT02_JVC_C
>>>           FRExt2_Panasonic_C
>>>           FRExt4_Panasonic_B
>>>           HCAFF1_HHI_B
>>>           HCAMFF1_HHI_B
>>>           HCHP3_HHI_A
>>>           HPCAFL_BRCM_C
>>>           HPCAFLNL_BRCM_C
>>>           HVLCFI0_Sony_B
>>>           HVLCMFF0_Sony_B
>>>           HVLCPFF0_Sony_B
>>>           HPCAMAPALQ_BRCM_B
>>>           HPCVFL_BRCM_A
>>>           HPCVFLNL_BRCM_A
>>> - 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
>>>     supported in iris driver
>>>     Test Vectors:
>>>           FREH10-1
>>>           FREH10-2
>>> - 21 test vectors failed due to unsupported profile:
>>>     V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the hardware.
>>>     Test Vectors:
>>>           FREXT1_TANDBERG_A
>>>           FREXT2_TANDBERG_A
>>>           FREXT3_TANDBERG_A
>>>           Hi422FR1_SONY_A
>>>           Hi422FR2_SONY_A
>>>           Hi422FR3_SONY_A
>>>           Hi422FR4_SONY_A
>>>           Hi422FR6_SONY_A
>>>           Hi422FR7_SONY_A
>>>           Hi422FR8_SONY_A
>>>           Hi422FR9_SONY_A
>>>           Hi422FR10_SONY_A
>>>           Hi422FR11_SONY_A
>>>           Hi422FR12_SONY_A
>>>           Hi422FR13_SONY_A
>>>           Hi422FR14_SONY_A
>>>           Hi422FR15_SONY_A
>>>           Hi422FREXT16_SONY_A
>>>           Hi422FREXT17_SONY_A
>>>           Hi422FREXT18_SONY_A
>>>           Hi422FREXT19_SONY_A
>>> - 2 test vectors failed due to unsupported bitstream.
>>>     chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
>>>     supported by the hardware.
>>>     Test Vectors:
>>>           HPCAMOLQ_BRCM_B
>>>           HPCVMOLQ_BRCM_B
>>>
>>> Fluster score on SM8250:
>>>
>>> 78/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
>>> The failing tests are:
>>> - 52 test vectors failed due to interlaced clips: Interlaced decoding is not
>>>     supported in iris driver.
>>>     Test Vectors:
>>>           cabac_mot_fld0_full
>>>           cabac_mot_mbaff0_full
>>>           cabac_mot_picaff0_full
>>>           CABREF3_Sand_D
>>>           CAFI1_SVA_C
>>>           CAMA1_Sony_C
>>>           CAMA1_TOSHIBA_B
>>>           cama1_vtc_c
>>>           cama2_vtc_b
>>>           CAMA3_Sand_E
>>>           cama3_vtc_b
>>>           CAMACI3_Sony_C
>>>           CAMANL1_TOSHIBA_B
>>>           CAMANL2_TOSHIBA_B
>>>           CAMANL3_Sand_E
>>>           CAMASL3_Sony_B
>>>           CAMP_MOT_MBAFF_L30
>>>           CAMP_MOT_MBAFF_L31
>>>           CANLMA2_Sony_C
>>>           CANLMA3_Sony_C
>>>           CAPA1_TOSHIBA_B
>>>           CAPAMA3_Sand_F
>>>           cavlc_mot_fld0_full_B
>>>           cavlc_mot_mbaff0_full_B
>>>           cavlc_mot_picaff0_full_B
>>>           CVCANLMA2_Sony_C
>>>           CVFI1_Sony_D
>>>           CVFI1_SVA_C
>>>           CVFI2_Sony_H
>>>           CVFI2_SVA_C
>>>           CVMA1_Sony_D
>>>           CVMA1_TOSHIBA_B
>>>           CVMANL1_TOSHIBA_B
>>>           CVMANL2_TOSHIBA_B
>>>           CVMAPAQP3_Sony_E
>>>           CVMAQP2_Sony_G
>>>           CVMAQP3_Sony_D
>>>           CVMP_MOT_FLD_L30_B
>>>           CVNLFI1_Sony_C
>>>           CVNLFI2_Sony_H
>>>           CVPA1_TOSHIBA_B
>>>           FI1_Sony_E
>>>           MR6_BT_B
>>>           MR7_BT_B
>>>           MR8_BT_B
>>>           MR9_BT_B
>>>           Sharp_MP_Field_1_B
>>>           Sharp_MP_Field_2_B
>>>           Sharp_MP_Field_3_B
>>>           Sharp_MP_PAFF_1r2
>>>           Sharp_MP_PAFF_2r
>>>           CVMP_MOT_FRM_L31_B
>>> - 3 test vectors failed due to unsupported bitstream.
>>>     num_slice_group_minus1 greater than zero is not supported by the
>>> hardware.
>>>     Test Vectors:
>>>           FM1_BT_B
>>>           FM1_FT_E
>>>           FM2_SVA_C
>>> - 2 test vectors failed because SP_SLICE type is not supported by the
>>> hardware.
>>>     Test Vectors:
>>>           SP1_BT_A
>>>           sp2_bt_b
>>>
>>> 23/69 while testing JVT-FR-EXT with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
>>> The failing tests are:
>>> - 21 test vectors failed due to interlaced clips: Interlaced decoding is
>>>     not supported in iris driver.
>>>     Test Vectors:
>>>           brcm_freh4
>>>           brcm_freh5
>>>           brcm_freh6
>>>           brcm_freh10
>>>           brcm_freh11
>>>           freh7_b
>>>           FREXT01_JVC_D
>>>           FREXT02_JVC_C
>>>           FRExt2_Panasonic_C
>>>           FRExt4_Panasonic_B
>>>           HCAFF1_HHI_B
>>>           HCAMFF1_HHI_B
>>>           HCHP3_HHI_A
>>>           HPCAFL_BRCM_C
>>>           HPCAFLNL_BRCM_C
>>>           HVLCFI0_Sony_B
>>>           HVLCMFF0_Sony_B
>>>           HVLCPFF0_Sony_B
>>>           HPCAMAPALQ_BRCM_B
>>>           HPCVFL_BRCM_A
>>>           HPCVFLNL_BRCM_A
>>> - 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
>>>     supported in iris driver
>>>     Test Vectors:
>>>           FREH10-1
>>>           FREH10-2
>>> - 21 test vectors failed due to unsupported profile:
>>>     V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the hardware.
>>>     Test Vectors:
>>>           FREXT1_TANDBERG_A
>>>           FREXT2_TANDBERG_A
>>>           FREXT3_TANDBERG_A
>>>           Hi422FR1_SONY_A
>>>           Hi422FR2_SONY_A
>>>           Hi422FR3_SONY_A
>>>           Hi422FR4_SONY_A
>>>           Hi422FR6_SONY_A
>>>           Hi422FR7_SONY_A
>>>           Hi422FR8_SONY_A
>>>           Hi422FR9_SONY_A
>>>           Hi422FR10_SONY_A
>>>           Hi422FR11_SONY_A
>>>           Hi422FR12_SONY_A
>>>           Hi422FR13_SONY_A
>>>           Hi422FR14_SONY_A
>>>           Hi422FR15_SONY_A
>>>           Hi422FREXT16_SONY_A
>>>           Hi422FREXT17_SONY_A
>>>           Hi422FREXT18_SONY_A
>>>           Hi422FREXT19_SONY_A
>>> - 2 test vectors failed due to unsupported bitstream.
>>>     chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
>>>     supported by the hardware.
>>>     Test Vectors:
>>>           HPCAMOLQ_BRCM_B
>>>           HPCVMOLQ_BRCM_B
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>> Dikshita Agarwal (17):
>>>         dt-bindings: media: Add sm8550 dt schema
>>>         media: MAINTAINERS: Add Qualcomm Iris video accelerator driver
>>>         media: iris: add platform driver for iris video device
>>>         media: iris: initialize power resources
>>>         media: iris: implement iris v4l2 file ops
>>>         media: iris: introduce iris core state management with shared queues
>>>         media: iris: implement video firmware load/unload
>>>         media: iris: implement boot sequence of the firmware
>>>         media: iris: introduce Host firmware interface with necessary hooks
>>>         media: iris: implement power management
>>>         media: iris: implement reqbuf ioctl with vb2_queue_setup
>>>         media: iris: implement vb2 streaming ops
>>>         media: iris: allocate, initialize and queue internal buffers
>>>         media: iris: implement vb2 ops for buf_queue and firmware response
>>>         media: iris: add support for dynamic resolution change
>>>         media: iris: handle streamoff/on from client in dynamic resolution
>>> change
>>>         media: iris: add support for drain sequence
>>>
>>> Vedang Nagar (12):
>>>         media: iris: implement s_fmt, g_fmt and try_fmt ioctls
>>>         media: iris: implement g_selection ioctl
>>>         media: iris: implement enum_fmt and enum_frameintervals ioctls
>>>         media: iris: implement subscribe_event and unsubscribe_event ioctls
>>>         media: iris: implement iris v4l2_ctrl_ops and prepare capabilities
>>>         media: iris: implement query_cap, query_ctrl and query_menu ioctls
>>>         media: iris: implement set properties to firmware during streamon
>>>         media: iris: subscribe parameters and properties to firmware for
>>> hfi_gen2
>>>         media: iris: add check whether the video session is supported or not
>>>         media: iris: implement power scaling for vpu2 and vpu3
>>>         media: iris: add allow checks for v4l2 ioctls
>>>         media: iris: add check to allow sub states transitions
>>>
>>>    .../bindings/media/qcom,sm8550-iris.yaml           |  162 ++++
>>>    MAINTAINERS                                        |   11 +
>>>    drivers/media/platform/qcom/Kconfig                |    1 +
>>>    drivers/media/platform/qcom/Makefile               |    1 +
>>>    drivers/media/platform/qcom/iris/Kconfig           |   13 +
>>>    drivers/media/platform/qcom/iris/Makefile          |   27 +
>>>    drivers/media/platform/qcom/iris/iris_buffer.c     |  599 ++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_buffer.h     |  117 +++
>>>    drivers/media/platform/qcom/iris/iris_core.c       |   99 ++
>>>    drivers/media/platform/qcom/iris/iris_core.h       |  107 +++
>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      |  296 ++++++
>>>    drivers/media/platform/qcom/iris/iris_ctrls.h      |   22 +
>>>    drivers/media/platform/qcom/iris/iris_firmware.c   |  151 +++
>>>    drivers/media/platform/qcom/iris/iris_firmware.h   |   15 +
>>>    drivers/media/platform/qcom/iris/iris_hfi_common.c |  222 +++++
>>>    drivers/media/platform/qcom/iris/iris_hfi_common.h |  155 +++
>>>    drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   16 +
>>>    .../platform/qcom/iris/iris_hfi_gen1_command.c     |  834 ++++++++++++++++
>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  448 +++++++++
>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    |  658 +++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   41 +
>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 1003
>>> ++++++++++++++++++++
>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  160 ++++
>>>    .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  328 +++++++
>>>    .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  125 +++
>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  954
>>> +++++++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  343 +++++++
>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.h  |  180 ++++
>>>    drivers/media/platform/qcom/iris/iris_instance.h   |   73 ++
>>>    .../platform/qcom/iris/iris_platform_common.h      |  195 ++++
>>>    .../platform/qcom/iris/iris_platform_sm8250.c      |  175 ++++
>>>    .../platform/qcom/iris/iris_platform_sm8550.c      |  310 ++++++
>>>    drivers/media/platform/qcom/iris/iris_power.c      |  182 ++++
>>>    drivers/media/platform/qcom/iris/iris_power.h      |   15 +
>>>    drivers/media/platform/qcom/iris/iris_probe.c      |  257 +++++
>>>    drivers/media/platform/qcom/iris/iris_resources.c  |  338 +++++++
>>>    drivers/media/platform/qcom/iris/iris_resources.h  |   27 +
>>>    drivers/media/platform/qcom/iris/iris_state.c      |  338 +++++++
>>>    drivers/media/platform/qcom/iris/iris_state.h      |  153 +++
>>>    drivers/media/platform/qcom/iris/iris_utils.c      |   96 ++
>>>    drivers/media/platform/qcom/iris/iris_utils.h      |   50 +
>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |  353 +++++++
>>>    drivers/media/platform/qcom/iris/iris_vb2.h        |   17 +
>>>    drivers/media/platform/qcom/iris/iris_vdec.c       |  693 ++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_vdec.h       |   25 +
>>>    drivers/media/platform/qcom/iris/iris_vidc.c       |  706 ++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_vidc.h       |   15 +
>>>    drivers/media/platform/qcom/iris/iris_vpu2.c       |   39 +
>>>    drivers/media/platform/qcom/iris/iris_vpu3.c       |  125 +++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  311 ++++++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   91 ++
>>>    drivers/media/platform/qcom/iris/iris_vpu_common.c |  371 ++++++++
>>>    drivers/media/platform/qcom/iris/iris_vpu_common.h |   28 +
>>>    .../platform/qcom/iris/iris_vpu_register_defines.h |   17 +
>>>    54 files changed, 12088 insertions(+)
>>> ---
>>> base-commit: 31aaa7d95e09892c81df0d7c49ae85640fa4e202
>>> change-id: 20240827-iris_v3-4b30e9610e7f
>>>
>>> Best regards,
>>


