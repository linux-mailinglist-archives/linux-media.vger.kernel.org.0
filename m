Return-Path: <linux-media+bounces-61415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCQKHY9qBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:11:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A9532D5D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 647B0303E114
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4F2402426;
	Wed, 13 May 2026 12:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vto7eSLp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EFC3FBEB8
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674308; cv=none; b=TGaOvivUBl2cS/kN0/MVUhhqvG28AwuZwDJP7PjQk/QYDDdEXlDyoJU9FS6CD7i7PJzNwKcn/ebaQyTk+r1/2El0TScjOiLzxoibFGqTNFYpaLvOemdfoHsA/D9yuM3ok7ibuvTb9dUWZpZD4j3Z4ZemnL68LCF+S9VFVim1FQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674308; c=relaxed/simple;
	bh=TVoCG8yq8icgBfmUr2K74cG1NgErgdgECAtMA5THZKM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ULj60VYTu0B7Kg8WWTTnDnRshPAgveuyR+ZkuIR/qikuTKMBOLndxwICooewte+rzxVBj9h159X5KXdvz7GNwpHKg4qPkXprMBOJZKhAdUMxY8crFMz7yh2sZgBuFONh/tbR0eu1wKy9pkg18qkK0gWwZx67kSiCQu7utXxWPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vto7eSLp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so112453645e9.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778674304; x=1779279104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jaj/AmiB8GBX786UN4+AO6xd8OGqWzRrIWN6rkL5EHA=;
        b=Vto7eSLpG0sJilPwdXF8QZGjX+uMBRR1DCM/lk3MlMAWMDY4E3/2iQoE/ZnA67vd7u
         J7UTB115lSEHmHmeZZZbSQONDhT5MFP2Yx/pTpCw55iELDjJvVYAyKiYIkQlbOjtV0bl
         FwQ4Skp37xMGYECeXKnl0u42Vfuqkdb5JswEwG+GwavBXtUihqSaPBf8sy4jidEarrRd
         NGFbYdQpnzMY/Q3eRwSkg2XqDqpKpOtenNBxkt2RF+5YkAYyLnfXO7m+yixu/spR3IzD
         FA/hLN/4m/4YSzhWwmdigPa4pSZSw0zUkVfUDN4uzx+FaYMsxIki6TLOxdnaM1jeCRG0
         3OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674304; x=1779279104;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jaj/AmiB8GBX786UN4+AO6xd8OGqWzRrIWN6rkL5EHA=;
        b=bfgsIkM3cwqsgCNo/xCXD65BVFyDCkCMxAqSKJ6RDS/yjdTqWLKMr5eYDECz5aedzo
         0fVKGF5nuCDzCEEQ6cg2I/nMVwJgNdS4oqwJkhn6gk/TsFcaaXXUmowOfhM9ElYWtb03
         fof83a6SnzAuP8bCgMKFGQgQ5HJLTffnj2PJRQb/h8Fs8dlVPBT2sMXHp0EKyy3OOl83
         AsH6zsXxuGHsPTrN4zznmrsLXzGJ0vGe95Sls4rxr/EPDb5vOuQvdpPu5olOiLsd3Ppn
         KfaeQKhXD/J2lpRWsW+OfbCDZRkzSFzUVxtiseNsCkeEBDsuhrNuOjRmbj9nJTF9oCYF
         8/Iw==
X-Gm-Message-State: AOJu0YxerOUCKO+VmNBHcD013D27OGRMhch2yVl2pyd86gZsd6m0JjuQ
	GYHQZoYZ3p/C2vG0jARgTmw5tj7B9zOY9x+6bwfrn5yrpEaJvE6HhUz18LifQKZIL6c=
X-Gm-Gg: Acq92OGdl9jt1EmxZHsEQ422AnWXQd4yQ50Zx2tnSW/a3zkbWTClJ0qHxNx+OONFN57
	QMjA1iyLlQPcg1TtM0QFKvC79AgL1D1ksPdkzKp9CWEGdhBTM9eg9a1mJ9hO7RFv8ebZjQIe6iB
	tEg3+2/+qP2PsJ89n5jrYIH7WWCNierf+6vKIWQ+5RazDl1/iUeLngnQLfaXzLAAosj3AM2vxZN
	FHJHIuMXdnL3U9V/26S8+B0BxYo4AeFmeLonnGZMG1j8B86jBh6JZQpWxJSPUO55iMl3yv9fBgp
	WsGzQhav/E2mIyiuj2iExVJ9/0vJbJLAeUgbr4fpTX+1hiT6UikzPk9gh26ikMUxq3yOBDv0FhB
	zq0hQw2Au2i6+4mfz4fI5hPj04yRcBeKTia4pXZ/EwaTd1VHR6M5GHShGPwOJHFIay/Ar1fbGaN
	/S2HljGtC7JTuKtpi3vdVd0pEGcENpCZZGR/0zotVFhMNnTLQO/gxprBgxqJWgl4rjjJa098hC7
	EChxhdhbfJdoi4=
X-Received: by 2002:a05:600c:5246:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48fce9cf9a5mr39515005e9.11.1778674304086;
        Wed, 13 May 2026 05:11:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45c7f27762csm4902635f8f.31.2026.05.13.05.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 05:11:43 -0700 (PDT)
Message-ID: <35e1cba8-a850-4b6f-ab1d-754504545748@linaro.org>
Date: Wed, 13 May 2026 14:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <fb377b11-c54c-4bd9-bf12-cf19d6484c66@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <fb377b11-c54c-4bd9-bf12-cf19d6484c66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 309A9532D5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61415-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Hi,

On 5/13/26 10:50, Wangao Wang wrote:
> I did testing on Purwa and found that the decoded raw data only has one frame, and there is also an alignment issue. Screenshots are in the attachment.
> I used the command you provided to generate the HDR H.265 stream, and tested with the same v4l2-ctrl command. Is there anything in the testing details that I might have missed?

Thanks for testing.

The screenshot you sent would imply the UV plane offset has an aligment
and is not directly after the Y plane as expected.

Let me check on my side, because I was able to successfully import
and display via GL, Vulkan and DRM on SM8550 and SM8650.

Neil

> 
> On 2026/5/11 17:20, Neil Armstrong wrote:
>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>> streams into 10bit pixel formats, linear and compressed.
>>
>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>> buffer calculations and HFI messages.
>>
>> I was unable to get 10bit decoding working with ffmpeg since P010
>> support for v4l2 decoding is missing, but v4l2-ctl works with:
>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
>> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
>>
>> The non-10bit decoding still works as before.
>>
>> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
>> and tranformed in v4l2 header format with [1]:
>> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
>> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
>>
>> Fluster HEVC results on SM8650:
>>
>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
>> The failing test case:
>> - Pixel Format mismatch
>>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>> - Unsupported resolution
>>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>> - CRC mismatch
>>   - RAP_A_docomo_6
>> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>>   - VPSSPSPPS_A_MainConcept_1
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
>>     Driver name      : iris_driver
>>     Card type        : Iris Encoder
>>     Bus info         : platform:aa00000.video-codec
>>     Driver version   : 7.0.0
>>     Capabilities     : 0x84204000
>>         Video Memory-to-Memory Multiplanar
>>         Streaming
>>         Extended Pix Format
>>         Device Capabilities
>>     Device Caps      : 0x04204000
>>         Video Memory-to-Memory Multiplanar
>>         Streaming
>>         Extended Pix Format
>>     Detected Stateful Encoder
>>
>> Required ioctls:
>>     test VIDIOC_QUERYCAP: OK
>>     test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>     test second /dev/video1 open: OK
>>     test VIDIOC_QUERYCAP: OK
>>     test VIDIOC_G/S_PRIORITY: OK
>>     test for unlimited opens: OK
>>
>> Debug ioctls:
>>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>     Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>     test VIDIOC_QUERYCTRL: OK
>>     test VIDIOC_G/S_CTRL: OK
>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>     Standard Controls: 43 Private Controls: 0
>>
>> Format ioctls:
>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>     test VIDIOC_G/S_PARM: OK
>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>     test VIDIOC_G_FMT: OK
>>     test VIDIOC_TRY_FMT: OK
>>     test VIDIOC_S_FMT: OK
>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>     test Cropping: OK
>>     test Composing: OK (Not Supported)
>>     test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>     test VIDIOC_(TRY_)ENCODER_CMD: OK
>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>     test CREATE_BUFS maximum buffers: OK
>>     test VIDIOC_REMOVE_BUFS: OK
>>     test VIDIOC_EXPBUF: OK
>>     test Requests: OK (Not Supported)
>>     test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>     test read/write: OK (Not Supported)
>>     Video Capture Multiplanar: Captured 61 buffers
>>     test MMAP (select, REQBUFS): OK
>>     Video Capture Multiplanar: Captured 61 buffers
>>     test MMAP (epoll, REQBUFS): OK
>>     Video Capture Multiplanar: Captured 61 buffers
>>     test MMAP (select, CREATE_BUFS): OK
>>     Video Capture Multiplanar: Captured 61 buffers
>>     test MMAP (epoll, CREATE_BUFS): OK
>>     test USERPTR (select): OK (Not Supported)
>>     test DMABUF: Cannot test, specify --expbuf-device
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
>>     Driver name      : iris_driver
>>     Card type        : Iris Decoder
>>     Bus info         : platform:aa00000.video-codec
>>     Driver version   : 7.0.0
>>     Capabilities     : 0x84204000
>>         Video Memory-to-Memory Multiplanar
>>         Streaming
>>         Extended Pix Format
>>         Device Capabilities
>>     Device Caps      : 0x04204000
>>         Video Memory-to-Memory Multiplanar
>>         Streaming
>>         Extended Pix Format
>>     Detected Stateful Decoder
>>
>> Required ioctls:
>>     test VIDIOC_QUERYCAP: OK
>>     test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>     test second /dev/video0 open: OK
>>     test VIDIOC_QUERYCAP: OK
>>     test VIDIOC_G/S_PRIORITY: OK
>>     test for unlimited opens: OK
>>
>> Debug ioctls:
>>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>     Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>     test VIDIOC_QUERYCTRL: OK
>>     test VIDIOC_G/S_CTRL: OK
>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>     Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>     test VIDIOC_G/S_PARM: OK (Not Supported)
>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>     test VIDIOC_G_FMT: OK
>>     test VIDIOC_TRY_FMT: OK
>>     test VIDIOC_S_FMT: OK
>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>     test Cropping: OK
>>     test Composing: OK
>>     test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>     test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>     test CREATE_BUFS maximum buffers: OK
>>     test VIDIOC_REMOVE_BUFS: OK
>>     test VIDIOC_EXPBUF: OK
>>     test Requests: OK (Not Supported)
>>     test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>     test read/write: OK (Not Supported)
>> the input file is smaller than 7077888 bytes
>>     Video Capture Multiplanar: Captured 601 buffers
>>     test MMAP (select, REQBUFS): OK
>> the input file is smaller than 7077888 bytes
>>     Video Capture Multiplanar: Captured 601 buffers
>>     test MMAP (epoll, REQBUFS): OK
>> the input file is smaller than 7077888 bytes
>>     Video Capture Multiplanar: Captured 601 buffers
>>     test MMAP (select, CREATE_BUFS): OK
>> the input file is smaller than 7077888 bytes
>>     Video Capture Multiplanar: Captured 601 buffers
>>     test MMAP (epoll, CREATE_BUFS): OK
>>     test USERPTR (select): OK (Not Supported)
>>     test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>
>> [1] https://github.com/superna9999/pyv4l2compliance
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
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
>>        media: qcom: iris: add helpers for 8bit and 10bit formats
>>        media: qcom: iris: add QC10C & P010 buffer size calculations
>>        media: qcom: iris: gen2: add support for 10bit decoding
>>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |   8 +-
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>   10 files changed, 364 insertions(+), 15 deletions(-)
>> ---
>> base-commit: 76671814f2843482d97feca12e95c06f0b05bc8a
>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>
>>
> 


