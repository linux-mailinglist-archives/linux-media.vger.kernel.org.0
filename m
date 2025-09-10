Return-Path: <linux-media+bounces-42241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF45B524AA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 01:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5426CA82929
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 23:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFFF2DC32A;
	Wed, 10 Sep 2025 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beBUoZZj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563926CE28
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757546826; cv=none; b=rRYd4rIkd9CrtOPOlEdD/mjYrGOrDEJ0Q1SR3K5or4f61PriMyqpkob3Fgs9fb286Olfv452/pHHg/GxlfuKXL2/pNu+P7qcemnn8rGOC00tR1CWPzGXGcmBKTRgpNHTTEba9HSricV3Z/Cy4/uwKbH0PBLVpqKw8TtxqjS0wZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757546826; c=relaxed/simple;
	bh=XEPM5ZejpLxBoLwQVNQwRclTGAjPYsDoYPi/Wb66ikY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjhgAssVoblk1N7OpRzOT2zctUIJ72rFFKs9dQnDjQkfEPaoRcAdGd188V11qlC3MLLSMIQhZvs9ojE9SfsnIc+lV33WTSAywAA9U3mnfetoJZuaghM7E1g2hoAJ2Amym+DfELofghtGVhlr0iF8hVf8+/oLDaRVg7kglK3pkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beBUoZZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ65nf024136
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 23:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLY8ZURxy2xkC7oE8O31O0vsF6pAuilOa2HpU5oeIWs=; b=beBUoZZjqJtimIvT
	prIyqo05k5Z1x0MiuLm9fGa0BuchtbG+UPrdejZ8bvd4kHU7Sgkl4P3O2mnh73Ow
	kcT6fVRnt6cB+FWP122qHarW73KKqDZZG5jV/CipU6FH8Gg57UDxRZRHW6WGCxNy
	teT7IWXVJgCJCK1FPPBwPSKMCI5VDwvUzL/hiqOC+LfQ0GjOI3h8pnYG2cM3fLvV
	PeLYADoSeksgJ5aVOn/4CQoeGXwU6RZkxa5bVNyjeBy1fMxBJFmkdufFwl7f6A+R
	+cpbQe0+hEHS/b0ajVJ/c0Mc20m7rhBZqh8QEJ2bQTyvJmMAl+Y0ynf+BmKARIkt
	VMixug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h0jtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 23:27:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3253ba05aa7so20892a91.2
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 16:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757546821; x=1758151621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLY8ZURxy2xkC7oE8O31O0vsF6pAuilOa2HpU5oeIWs=;
        b=ONJ/n1daloxmE/SFcLjZsPd6YCnwGLnll/dP9DS5B8vjhmJ1X48f7RJuwD5lglUSQ6
         AaZytzLnXDfjVyGxUB8dSU46Hz0AwawXggHIvXK00VAcGgCltHeJuTSlHeGd2jTVRgn8
         xv9WjOzzS4SCZ3hNbMBJ+bfZdBXpgH8xfBnF0MDrhyBqQPDo3ZH7csSkhrbhl8UJA9Tr
         QxFhsCZlUs+86CrfgB9+WPo3i8lC8jKGspWN9von2LOa3F5KnmblLQBfRyLkqyolGIw+
         JIpCUoxyTDHFMcROmPvzkotb6jL4z/zEbGT7W+OIxYzzhYQTLDDKmUtkaAa7ahi6VqbW
         LjaQ==
X-Gm-Message-State: AOJu0YxbLQGcXoFU4AYRRjrXFV4t4grMIlv66y2QWHS/t/lQ59hTg61r
	+6Ih2UsiUOCZmeAN4zrm8Zp76xW6kv3mZv70R4xVkEh4e9KR92ojfAITkGmL4LDNKanVdq1BF/c
	vmv5E/Dn7YhcDrvNQaZwQpq5HRkgr+XArqP1ejF8P90p4uZLvYEaQ+lXrZdeGaWdQK4ELunNWew
	==
X-Gm-Gg: ASbGncujUoYrCEEm8AUlzNVRxZ5jg6MDdXhd8bNk+mFVyVI9BvA/8MryZYD0crjZs4T
	C9OI4LsjoPdKSjrDUj4dpYsbcpGQJuiEoQKl79rHmltSNnsY+WbJxi9i0AS7ME+2fRCaHLTUSIt
	+QO8BkM1punDK/NyLM5KtuVJ2dT+CqNZQJBx+926+WI7C4cu434niQHlFOSk0KQcgEzWeS1pJiO
	zMUi+OyAK7R8tampKa83RIu0D4ahRPemeAwSi3MStDMqJh1iqPM3zpZ9pFjVRM9aBrgoJun5+0g
	6kt1rOoiGsrqHrSbUb2VlImNGarN+QFdiYHV01RgIkU/h6TOxuy9Fv2qdKEy8Q7BGrzZu/tWP/k
	BHj57+l006wAOwolvNHT5P+Rgf9Y=
X-Received: by 2002:a17:90b:180b:b0:325:5998:751d with SMTP id 98e67ed59e1d1-32d43f7dfa0mr11370211a91.5.1757546821084;
        Wed, 10 Sep 2025 16:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiqCuUmhQvh5NopuvkQoBPQRa74TnP1Kztb16vWy3+YT2MzR3uTqaOBQxc1uQpcVSAaFB+jA==
X-Received: by 2002:a17:90b:180b:b0:325:5998:751d with SMTP id 98e67ed59e1d1-32d43f7dfa0mr11370194a91.5.1757546820475;
        Wed, 10 Sep 2025 16:27:00 -0700 (PDT)
Received: from [10.71.110.242] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b549c5e0aa3sm728447a12.30.2025.09.10.16.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 16:27:00 -0700 (PDT)
Message-ID: <3b3d36f1-344f-4cf8-a4f2-98a93052141e@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:26:59 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] Enable support for AV1 stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
 <be621717ee62c2ffda40d531dda15e0c9f28a858.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <be621717ee62c2ffda40d531dda15e0c9f28a858.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fKPmJ8Bpb_4GzoBQrl-bDA2o5bV864YH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX84ZJbJQyu1AV
 mjmzgs8NUkRXCOUj+zGjo+S63ryf2uRrCTsxh8klRKsqBXSf6irIrNlyXoCQsOB5eH425AH8tVj
 +L0mNe+bg+xwr8eb/6jzEbmmzx1LktOSGg+5RGiFDOj3CrunsuyamL/6cr5uLKncF7UWemB/nwy
 1absSMZWw71nhbWFkm2aOC+xRLMTwDrsTBGegZ5v2AN9WL+ZnB473FlTnTNystLVYB7AeQY8Ofd
 eDk18Sv2yyNlBjH1b2rTTMqV2oSH98IpocJrouvDPOxkUItBm4den/6opRtXk99eUPfDQKxmt1I
 T/fveO9x6WwEFuM4LrTbZdsAixhKzpTr+XQPeI5kvbHgUQZZYKRxUqmsGM2KFMOEeJIv8JjM83d
 AjfUf23E
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c20946 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=9qgdzZSIxLxRigOpfUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: fKPmJ8Bpb_4GzoBQrl-bDA2o5bV864YH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177


On 9/3/2025 6:07 AM, Nicolas Dufresne wrote:
> Le mardi 02 septembre 2025 à 16:00 -0700, DEEPA GUTHYAPPA MADIVALARA a écrit :
>> Hi all,
>>
>> This patch series adds initial support for the AV1 stateful
>> decoder codecs in iris decoder. Also it adds support for AV1
>> stateful decoder in V4l2. The objective of this work is to
>> extend the Iris decoder's capabilities to handle AV1 format
>> codec streams, including necessary format handling and buffer
>> management. I'm sharing this series as an RFC because conformance
>> testing and gstreamer testing are still in progress. While initial
>> functional tests show positive results, I would appreciate early
>> feedback on the design, implementation, and fixes before moving to
>> a formal submission. I plan to submit a formal patch series after
>> completing all the compliance checks. Meanwhile, any feedback or
>> suggestion to improve this work are very welcome and will be of
>> great help.
>>
>> Gstreamer testing:
>> Gstreamer MR for enabling AV1 stateful decoder:
>> https://gitlab.freedesktop.org/dmadival/gstreamer/-/merge_requests/1

Hi Nicholas,

Thank you so much for a quick response.
Can you please provide feedback for the AV1 stateful decoder plugin - GST MR ?


Thanks to Nicolas Dufresne for proving the MR
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9469

However, Gst testing with parsebin is not resolving to av1parser as
below:
Ex:  With the following command parsebin is unable to resolve to
av1parser.
GST_DEBUG=*:2,parsebin:6 gst-launch-1.0 --no-fault
filesrc
location=/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-ANNEX-B/
argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/streams/test10220.obu
! parsebin ! v4l2av1dec ! video/x-raw ! videoconvert dither=none !
video/x-raw,format=I420
! filesink location=gst_decoder_output.yuv

> Be aware that Argon integration with fluster/GStreamer still needs some work,
> see issue tracker:
>
> https://github.com/fluendo/fluster/issues/222
>
> It is fine to proceed with testing the other (IVF or MKV based) test suites.
> Feel free to report all wrongly identified files onto that issue, this will be
> addressed in GStreamer (and eventually in FFMPEG too if need be).

Thanks for the above information. I will continue to work on ivf and mkv 
based test-suites.
Is it okay to post the AV1 patch series even though Argon test-suite has 
failures?

>> 0:00:00.051674896   400 0xffff8c000b90 DEBUG
>> parsebin gstparsebin.c:2439:type_found:<parsebin0> typefind found caps
>> video/x-h263, variant=(string)itu
>>
>> The same test with the av1parse command parses correctly:
>> GST_DEBUG=*:2,av1parse:6 gst-launch-1.0 --no-fault
>> filesrc
>> location=/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-ANNEX-B/
>> argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/streams/test10220.obu
>> ! av1parse ! v4l2av1dec ! video/x-raw ! videoconvert dither=none !
>> video/x-raw,format=I420
>> ! filesink location=/tmp/gst_decoder_output.yuv
>>
>> Got EOS from element "pipeline0".
>> Execution ended after 0:00:01.599088176
>> Setting pipeline to NULL ...
>> 0:00:03.580831249  1075     0x3354f960 DEBUG
>> av1parse gstav1parse.c:435:gst_av1_parse_stop:<av1parse0> stop
>>
>> Fluster testing:
>> As fluster.py is using parsebin for gstreamer, seeing the same issue as
>> described above for the following testsuites.
>> AV1-ARGON-PROFILE0-CORE-ANNEX-B
>> AV1-ARGON-PROFILE0-NON-ANNEX-B
>> AV1-ARGON-PROFILE0-NON-ANNEX-B
>>
>> Test suite: AV1-TEST-VECTORS
>> The result of fluster test on SM8550:
>> 134/242 testcases passed while testing AV1-TEST-VECTORS with
>> GStreamer-AV1-V4L2-Gst1.0
>> unsupported content, bit depth: a000a (66 tests)
>> Iris hardware decoder supports only 8bit NV12
>> av1-1-b10-00-quantizer-*
> That is interesting, I believe there was no profile without 10bit, which would
> mean this is non-compliant hardware. Not a blocker, just a remark, and me being
> surprised 10bit isn't supported on modern codec in 2025.

Sorry, hardware does support 10bit. As we continue to add more features, 
we plan to
include support for additional color formats as well.

>> Unsupported resolution (36 tests).
>> Iris hardware decoder supports min resolution of 96x96
>> av1-1-b8-01-size-*
>>
>> Unsupported colorformat (1 test)
>> av1-1-b8-24-monochrome
> Fair enough.
>
>> Crc mismatch: debug in progress (5tests)
>> av1-1-b8-03-sizeup
>> av1-1-b8-03-sizedown
> These should be basic dynamic resolution changes cases, let me know what you
> find.

I have a corruption after second sequence change, which propagates further
leading to hardware hang. I am working on fixing this.

>> av1-1-b8-16-intra_only-intrabc-extreme-dv
> No idea about this one.
This is passing actually. It is just an all intra bitstream.
>> av1-1-b8-22-svc-L2T1
>> av1-1-b8-22-svc-L2T2
> These two are spatial SVC. That means that some decode only frames are going to
> be smaller in dimensions. Only the last frame of a TU is displayed. Both do have
> the optional sequence header announcing the maximum resolution though. On
> stateless side, these usually works by simply decoding the hidden frames into
> the much larger buffers. Dealing with firmware can be harder, since firmware may
> silently drop the decode only frames, which leads to wrong timestamp matching,
> which could have side effect in frameworks.
>
> On stateful decoding, SVC have never been done, some documentation will likely
> be needed. Strictly unsupported is the case the sequence header is not there,
> which results in resolution change on non-keyframe. We now have the ability to
> allocate frames of different dimension at run-time, and free old unused frames,
> but in stateful, decoders streamoff the capture queue, which currently results
> in lost of references.
>
> Let us know your progress, inter-frame resolution change is not a strict
> requirement, it is quite rare in real life.
>
> looking forward, there is nothing particularly alarming in this report. Thanks
> for the transparency.
>
> Nicolas

I did not have a chance into debug this yet. But these streams do have a 
resolution change
on non-keyframe.

>> Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
>> 12/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
>> GStreamer-AV1-V4L2-Gst1.0
>> Crc mismatch: debug in progress
>> av1-1-b8-03-sizeup.ivf
Same corruption after second sequence change, which propagates further
leading to hardware hang.
>> Unsupported test suites:
>> Iris Hardware Decoder supports only
>> PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
>> and 8 bit, 420 only
>> AV1-ARGON-PROFILE1-CORE-ANNEX-B
>> AV1-ARGON-PROFILE1-NON-ANNEX-B
>> AV1-ARGON-PROFILE1-STRESS-ANNEX-B
>> AV1-ARGON-PROFILE2-CORE-ANNEX-B
>> AV1-ARGON-PROFILE2-NON-ANNEX-B
>> AV1-ARGON-PROFILE2-STRESS-ANNEX-B
>> CHROMIUM-10bit-AV1-TEST-VECTORS
>>
>> Compliance test for iris_driver device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : iris_driver
>>          Card type        : Iris Decoder
>>          Bus info         : platform:aa00000.video-codec
>>          Driver version   : 6.16.0
>>          Capabilities     : 0x84204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>          Detected Stateful Decoder
>>
>> Required ioctls:
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK
>>          test Composing: OK
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>> [65391.311675] qcom-iris aa00000.video-codec: invalid plane
>> [65395.340586] qcom-iris aa00000.video-codec: invalid plane
>>          test blocking wait: OK
>>
>> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
>> Warnings: 0
>>
>> V4l2-ctl Test verified for 2 streams as well.
>>
>> Thanks,
>> Deepa
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>> DEEPA GUTHYAPPA MADIVALARA (5):
>>        media: uapi: videodev2: Add support for AV1 stateful decoder
>>        media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
>>        media: iris: Add support for AV1 format in iris decoder
>>        media: iris: Add internal buffer calculation for AV1 decoder
>>        media: iris: Define AV1-specific platform capabilities and properties
>>
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 109 ++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
>>   drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  15 ++
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 156 ++++++++++++-
>>   .../platform/qcom/iris/iris_platform_sm8250.c      |  17 ++
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  25 +-
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
>>   include/uapi/linux/videodev2.h                     |   1 +
>>   16 files changed, 703 insertions(+), 28 deletions(-)
>> ---
>> base-commit: 88a6b4187eacb700a678296afb0c610eb3781e2f
>> change-id: 20250821-rfc_split-c3ff834bb2c9
>> prerequisite-change-id: 20250704-iris-video-encoder-b193350b487a:v3
>> prerequisite-patch-id: 8a566690da276da34430c10dbc2fe64c1d623a9c
>> prerequisite-patch-id: 1430a33603b425d0b142aab98befcda771fb885e
>> prerequisite-patch-id: 32024cd49d2445ff396e31f40739b32597be59a4
>> prerequisite-patch-id: 65b569952650647174e8221dc7adde9b000a7ae3
>> prerequisite-patch-id: da128980fab8538bf668f19016c5121fb03759c2
>> prerequisite-patch-id: 079823dffbe8b89990797bf7f7640b754382d8ce
>> prerequisite-patch-id: 6ce10e03d7b3b96b2391e26cda703b650bde7cd0
>> prerequisite-patch-id: b5950670ac5068a0c5b26651ebd433f7d3bbe6ca
>> prerequisite-patch-id: 4de7a934f6bdfe28c84e461f70495925aa98365e
>> prerequisite-patch-id: 07682a6d2530b5796122bf8763f94b5bc92949ec
>> prerequisite-patch-id: 72b7eba20f1a222908d41323f28be3ba84106759
>> prerequisite-patch-id: fd9e2e1b157112c39c69486799493ee99e6033a7
>> prerequisite-patch-id: ae0ad8a04a04dd3434a092d4c2bb3f493417c6e1
>> prerequisite-patch-id: 52631eec348735d1dc5f5804b573e3cf942550a0
>> prerequisite-patch-id: 4109c59edb1b757162db46297914c8f7c14408dc
>> prerequisite-patch-id: fc0b713eb4822047e8172d11fd4cd5a097ef23a5
>> prerequisite-patch-id: 20ac8e7307f1f852b2a43268b2474178fbc0b94c
>> prerequisite-patch-id: e8419d716573beb64ad89968f0074d6bddfa86d3
>> prerequisite-patch-id: bdc72f5876ceb2e981d594c86a45cb21a6264af3
>> prerequisite-patch-id: fc5d26d01cab94d229a00eab819ae80196f3f5d5
>> prerequisite-patch-id: 32a9fe1371fffc9abd9a862b2814050a144d1968
>> prerequisite-patch-id: 25184583b5de886f78ee0444a4a59d5f3c271ce5
>> prerequisite-patch-id: df3376b9de27b23ae81a4c7b7a8fe4b429c32423
>> prerequisite-patch-id: e68fbf7c82567d2e9f3fdd0fdf2e2911329d5ccd
>> prerequisite-patch-id: 580fa40de01a81a8685e56420f562d299bfc60fa
>> prerequisite-patch-id: 89548da6690681854ee1de992a491bed73202b83
>>
>> Best regards,

