Return-Path: <linux-media+bounces-63316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHfZKs3WHWpsfQkAu9opvQ
	(envelope-from <linux-media+bounces-63316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:00:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E926245D6
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 21:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73CD130433C5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 18:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB5237C907;
	Mon,  1 Jun 2026 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKAqSHlp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF0937C110
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340373; cv=none; b=c0aXeCzyOwKbxtK8vGknlskFGMwZeVxSsAJHcDkn2+ojcali4FcPJ6gCzYfltEv8zsrFtd+z8A2NqrKlri8VKTSmq60sKDmCYz9sMUl7kBNm5PFkdMaCJfco5u7nsss1Bb+j25BpU/NqtnPjXaQkW+hYKqoQ9uy9yOPsXWDR9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340373; c=relaxed/simple;
	bh=TyabobfNRhnyJ6xxWpMwFBP1epxGLyEIxmEXT4I0fEs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bs65Xuh4oDshnMoDclOUCpp1DGog0E+Jr/uO+dy4CY1Uk8fPF1dF5nGHCYtdzae+/6+3KCGO1A0bsy8NZgLRz4kPtmsAdk78DDfU+D5wcZZd9AQ2J13VI1X5PCUBiGwvY5kI5QwQ38bJEbkJBWQSNrKaJdH5FwpZDpEEDzabdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKAqSHlp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490a7678b2dso15490155e9.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780340367; x=1780945167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS0eP7KdIsn9cMtx/UfR6vHloCXnrWPAEJuuh7bMkCI=;
        b=wKAqSHlpkLwvr6YNnb5WumUs8IUZ3wrsb82PTlWKrRuErC9OqbO7k49PeIW7GYg5hy
         abRsL+eN/cQSoU3x9JnyMLmDv8RTB6cPfCOrVmzBeuY+TolC6n6XhJ9CiUsFOZWxPytH
         dUSNloXXYFqlV7JbSHDJI6hn26/EexZb1LPR2/TtQgdVMreUOuNQvjZMAGBcytNO37PH
         gL0UzFay8BGsPNr/zFfxg02PEN7TMPvNxAMQb/d0Tqsj/ktNUE9WemslOGVIO7bUeR6A
         sKB0ngTh6eDc+EjKdwBS3xH2u89GvLrUStU36Dj72xanwKvC9ID9btt5+947rJirHow8
         Z+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780340367; x=1780945167;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS0eP7KdIsn9cMtx/UfR6vHloCXnrWPAEJuuh7bMkCI=;
        b=IqM2+PCr8mxusUWOFGJ9kiob6d3k08ZLfv7mE5Fx+/f1qjP41uVqhJ6o3dQ3aVQ5y7
         pKYUgZqjwVilUbTgB2uAX3LcdaPuHF7m4yjPGQg1J2F12dBA8FCdETcgxU7Dq5PiPfYh
         v3QfTaMtN/nOHOFt6DCl5TsU2qkTi1tWccfP196F8li3miTWI0k5ZfEsy7mw/olxeq9H
         WSDUAA2rMgYD38jE+QFv4nLNAGCBc1tEop3DIgZJK1dg+clViC62C7o0dzsTbANnmn//
         VlIXPcDcfrszQ11NhslwYdGMIY71dR/m9wtQwMMmpKZgz1yEJ5/s90IpvHn6v9X36Tx/
         7CCw==
X-Gm-Message-State: AOJu0Ywyjfky98wg4ATL8ppI+KWZJVfGdhYPCix87b1S2Y5MUbcbrxsH
	mEC+OEmAS6kiCkhxVW59I+G9nlA1VUQhdx4Q9L4wl4VWdQbNN12aq7dXUFCU9hYZzHY=
X-Gm-Gg: Acq92OFBHMk/gv10mvK/eU6OtaetIFZFe6Q1Px1CYt4euTi1Ar+mGq7ytD/d5U9Tx+0
	Kpvkmxl0kKC6M4If8+VBsBgQTHStkmKpPGQXmgifN1OaGgU2WE88ygQmK+lMfHjdKvOh6Du7SiX
	UpY/X/HIAJFEiZTrcBQ+UkcVrr/PzLlWs3EdDOWkBSL0M7T4UoMnCR3Gn4iLFl91OxQ14spOkD3
	ewvLXnptFWRglEhyAqn6sLd/hD0rvcx76iZyjZi8ECj+5kLROtrA4TwBYgjj+3/yqPgEDxlIzMB
	3anpjlt5c/U+UVyPdFocLZtbNVtqSurzSo6ku7rScBzEs5gSDRIil4rVDHU/fuBi+sbt7B2K6+n
	3psn/OG4jB6ZgYSQOWAtB8ChG7IzqjhP7J6w0S7zU77FGQkFpPuB652jBnHSAubQXQg8FPl5ZAB
	LPmlfO137GsQhGsOSSrkCRSri323GCqXBsqudh0e+09Azw9RB9Vle5aUFF6UhZ4iGPHARZ+iKwI
	ZlhmGgV3aVVTZ1/zg==
X-Received: by 2002:a05:600c:828c:b0:490:ade0:6129 with SMTP id 5b1f17b1804b1-490ade061c8mr61922095e9.33.1780340366536;
        Mon, 01 Jun 2026 11:59:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:16ad:add5:5f53:d8d4? ([2a01:e0a:106d:1080:16ad:add5:5f53:d8d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354c682sm25909144f8f.23.2026.06.01.11.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 11:59:26 -0700 (PDT)
Message-ID: <6896f76a-a778-44f9-97f3-8a19a1b0f41a@linaro.org>
Date: Mon, 1 Jun 2026 20:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Bryan O'Donoghue <bod@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
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
 <2b61a13d-a117-4357-896b-1231990ef5ba@kernel.org>
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
In-Reply-To: <2b61a13d-a117-4357-896b-1231990ef5ba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63316-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 20E926245D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/1/26 17:03, Bryan O'Donoghue wrote:
> On 01/06/2026 10:01, Wangao Wang wrote:
>>
>>
>> On 2026/5/21 17:24, Neil Armstrong wrote:
>>> This adds the plumbing to support decoding HEVC, VP9 and AV1
>>> streams into 10bit pixel formats, linear and compressed.
>>>
>>> This has only been tested on SM8550 & SM8650 with HEVC, and was
>>> inspired by Venus, DRM MSM and the downstream vidc driver for the
>>> buffer calculations and HFI messages.
>>>
>>> Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
>>> but NV12 and P010 works out of the box with mainline Gstreamer.
>>>
>>> Fluster HEVC results on SM8650 using Gstreamer:
>>>
>>> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
>>> The failing test case:
>>> - Pixel Format mismatch
>>>    - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
>>> - Unsupported resolution
>>>    - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>>>    - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>>>    - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>>>    - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
>>> - CRC mismatch
>>>    - RAP_A_docomo_6
>>>
>>> v4l2-compliance results on SM8550 & SM8650:
>>>
>>> $ v4l2-compliance -d /dev/video1 -s
>>> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
>>>
>>> Compliance test for iris_driver device /dev/video1:
>>>
>>> Driver Info:
>>>     Driver name      : iris_driver
>>>     Card type        : Iris Encoder
>>>     Bus info         : platform:aa00000.video-codec
>>>     Driver version   : 7.0.0
>>>     Capabilities     : 0x84204000
>>>         Video Memory-to-Memory Multiplanar
>>>         Streaming
>>>         Extended Pix Format
>>>         Device Capabilities
>>>     Device Caps      : 0x04204000
>>>         Video Memory-to-Memory Multiplanar
>>>         Streaming
>>>         Extended Pix Format
>>>     Detected Stateful Encoder
>>>
>>> Required ioctls:
>>>     test VIDIOC_QUERYCAP: OK
>>>     test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>     test second /dev/video1 open: OK
>>>     test VIDIOC_QUERYCAP: OK
>>>     test VIDIOC_G/S_PRIORITY: OK
>>>     test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>     Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>     test VIDIOC_QUERYCTRL: OK
>>>     test VIDIOC_G/S_CTRL: OK
>>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>     Standard Controls: 43 Private Controls: 0
>>>
>>> Format ioctls:
>>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>     test VIDIOC_G/S_PARM: OK
>>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>>     test VIDIOC_G_FMT: OK
>>>     test VIDIOC_TRY_FMT: OK
>>>     test VIDIOC_S_FMT: OK
>>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>     test Cropping: OK
>>>     test Composing: OK (Not Supported)
>>>     test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>     test VIDIOC_(TRY_)ENCODER_CMD: OK
>>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls:
>>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>     test CREATE_BUFS maximum buffers: OK
>>>     test VIDIOC_REMOVE_BUFS: OK
>>>     test VIDIOC_EXPBUF: OK
>>>     test Requests: OK (Not Supported)
>>>     test blocking wait: OK
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>>     test read/write: OK (Not Supported)
>>>     Video Capture Multiplanar: Captured 61 buffers
>>>     test MMAP (select, REQBUFS): OK
>>>     Video Capture Multiplanar: Captured 61 buffers
>>>     test MMAP (epoll, REQBUFS): OK
>>>     Video Capture Multiplanar: Captured 61 buffers
>>>     test MMAP (select, CREATE_BUFS): OK
>>>     Video Capture Multiplanar: Captured 61 buffers
>>>     test MMAP (epoll, CREATE_BUFS): OK
>>>     test USERPTR (select): OK (Not Supported)
>>>     test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>>
>>> $ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
>>> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
>>>
>>> Compliance test for iris_driver device /dev/video0:
>>>
>>> Driver Info:
>>>     Driver name      : iris_driver
>>>     Card type        : Iris Decoder
>>>     Bus info         : platform:aa00000.video-codec
>>>     Driver version   : 7.0.0
>>>     Capabilities     : 0x84204000
>>>         Video Memory-to-Memory Multiplanar
>>>         Streaming
>>>         Extended Pix Format
>>>         Device Capabilities
>>>     Device Caps      : 0x04204000
>>>         Video Memory-to-Memory Multiplanar
>>>         Streaming
>>>         Extended Pix Format
>>>     Detected Stateful Decoder
>>>
>>> Required ioctls:
>>>     test VIDIOC_QUERYCAP: OK
>>>     test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>     test second /dev/video0 open: OK
>>>     test VIDIOC_QUERYCAP: OK
>>>     test VIDIOC_G/S_PRIORITY: OK
>>>     test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>     test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>     Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>     Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>     test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls:
>>>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>     test VIDIOC_QUERYCTRL: OK
>>>     test VIDIOC_G/S_CTRL: OK
>>>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>     Standard Controls: 12 Private Controls: 0
>>>
>>> Format ioctls:
>>>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>     test VIDIOC_G/S_PARM: OK (Not Supported)
>>>     test VIDIOC_G_FBUF: OK (Not Supported)
>>>     test VIDIOC_G_FMT: OK
>>>     test VIDIOC_TRY_FMT: OK
>>>     test VIDIOC_S_FMT: OK
>>>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>     test Cropping: OK
>>>     test Composing: OK
>>>     test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls:
>>>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>     test VIDIOC_(TRY_)DECODER_CMD: OK
>>>
>>> Buffer ioctls:
>>>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>     test CREATE_BUFS maximum buffers: OK
>>>     test VIDIOC_REMOVE_BUFS: OK
>>>     test VIDIOC_EXPBUF: OK
>>>     test Requests: OK (Not Supported)
>>>     test blocking wait: OK
>>>
>>> Test input 0:
>>>
>>> Streaming ioctls:
>>>     test read/write: OK (Not Supported)
>>> the input file is smaller than 7077888 bytes
>>>     Video Capture Multiplanar: Captured 601 buffers
>>>     test MMAP (select, REQBUFS): OK
>>> the input file is smaller than 7077888 bytes
>>>     Video Capture Multiplanar: Captured 601 buffers
>>>     test MMAP (epoll, REQBUFS): OK
>>> the input file is smaller than 7077888 bytes
>>>     Video Capture Multiplanar: Captured 601 buffers
>>>     test MMAP (select, CREATE_BUFS): OK
>>> the input file is smaller than 7077888 bytes
>>>     Video Capture Multiplanar: Captured 601 buffers
>>>     test MMAP (epoll, CREATE_BUFS): OK
>>>     test USERPTR (select): OK (Not Supported)
>>>     test DMABUF: Cannot test, specify --expbuf-device
>>>
>>> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
>>>
>>> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Changes in v4:
>>> - Picked review tags
>>> - Use u32 instead of __u32
>>> - Explicit DPB
>>> - Drop NULL and use >>1 in q10c buffer calc
>>> - Drop selicolon after switch statementr
>>> - Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
>>> - Rebase on media next tree after the file split
>>> - Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
>>>
>>> Changes in v3:
>>> - Added review tag on patch 1
>>> - Limited stride command to AV1 decoding only
>>> - Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org
>>>
>>> Changes in v2:
>>> - Fixed bug breaking 8bit decoding
>>> - Dropped filtering on G_FMT while waiting for soure change
>>> - Dropped format filtering on ENUMFMT
>>> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
>>> - Cleaned and refactors the width/height/stride calculations
>>> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
>>> - Passed fluster and v4l2-compliance to check for non regression
>>> - Tested on SM8550
>>> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
>>> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
>>>
>>> ---
>>> Neil Armstrong (6):
>>>         media: qcom: iris: add helpers for 8bit and 10bit formats
>>>         media: qcom: iris: add QC10C & P010 buffer size calculations
>>>         media: qcom: iris: gen2: add support for 10bit decoding
>>>         media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>>>         media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>>>         media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>>>
>>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>>>    drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>>>    drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>>>    .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>>    drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>>>    drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>>    drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>>>    10 files changed, 364 insertions(+), 15 deletions(-)
>>> ---
>>> base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
>>> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
>>>
>>> Best regards,
>>> -- 
>>> Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>>
>>
>> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
>>
>> -- 
>> Best Regards,
>> Wangao
>>
> 
> Neil can you rebase this - I can pick it up once you are happy.
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next-smoketest?ref_type=heads

Ok will rebase asap

Thanks,
Neil

> 
> ---
> bod


