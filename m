Return-Path: <linux-media+bounces-23478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BC9F3384
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 15:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F501639CC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CDC81ACA;
	Mon, 16 Dec 2024 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iKAJ97uy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17457288DB
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360523; cv=none; b=IaJfl6+UuXx1/A9KWrolb1OwQDbNFiiMZVCsVfC2OnvywKzGaTessM40YzJSbeYzLlpDDfm8v0G9eOP1rmS1xmmxkNyxQypBDf3pdD+I1MhBjOJL6/egUFuE2iB9o2OrSPYbs8woINCNUkZ9tCwb3q47auGzQqcq8Aqnf2BH0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360523; c=relaxed/simple;
	bh=jJPWKcinOTqiTaO0ZazNuTFXvXepVgqlWN89kK0v0yc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X7D6ypOyVe1ZEtV0OOag+G8aNAicz+JRVGIi1v4gPQrtbBDna4EWK+y/YhP6jds3sKcN/NT8LQ65uK0ubLYQzXcE9ES7Xx7dUYUfVntBDmmgEe3/0Gbt5LrbyvtvC9haQB96EFlecpe6zW+s9m8KatmsQRsTDu4HvkMCGjaGFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iKAJ97uy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43626213fffso24183845e9.1
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 06:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734360517; x=1734965317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ySfcvKLVq3CVCXat3DopRYf/IBif8xF5p6/MTl2ZBo=;
        b=iKAJ97uyryByRCaUzDGNvdtErbTyIBlZW1dIrd3jsIiwP60vPjI5iJBKoBrU3JqRul
         D9VMqfTy5OyfVD5OImnGLGoWSwFSzgT90XxDu3W9Xr6qIdblLTeg7xqNVoIouQJQv8YI
         8+szGm6sJIKGbcEfGGzD1tjDhz4CWOZnC/gQ+cuHBJUp8i0s296CwG2E5rhPqaQZFVtC
         JRqdwdWXl8+7HJGxW91UFBYDEhZ6qTNli1545rVqRxgTSQGPbW8T+0jHDEUnMTirPT2F
         p2oWZquzjrI1lNtaGS/FBbHLD+OXpBqvPR1oO32tEDVz4pmStByv0ztBxg+EmIfHN00m
         zAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360517; x=1734965317;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ySfcvKLVq3CVCXat3DopRYf/IBif8xF5p6/MTl2ZBo=;
        b=VpGETySmsqd8jyLRP2fO1JoI3OeP/SYzDOhubG8JmKrNi5xXFKOad0fs8IF5UM93PB
         UtZDpMXenaWrUj9CcNoJ7lms2J0HxUFvraTroOhwqDrtT6beZ6js3U+sn32as000eh5r
         PdRVOC463qKnGjf9U9EdZVoi+apVOzHb+sU8sPYAD5ze5di4rOZGd3RQWCoVLuvZRZ4T
         GO9YA400L0BJ2pCU/bEguPxg+0PpHwiB80e1/xRKZG3nUC6ng8IqgLA/s0t80iGKemTZ
         bLabOHP1WR8iwmwZhFeDuTTLkIUdIIXWKVqEo47SUhRRKMUhY4m5manDuRdPMJ+SayuW
         lIAA==
X-Forwarded-Encrypted: i=1; AJvYcCUz2CvaHXSEm2WvbyrRq5ik3e71DFNZjAyy+zVd6c/Rx/pVz6kCuwIaJQS19QidOk0VUb9woAcdCpB05A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEEyfo6iHE88jmyZUkg79o+4n8c83BKY1Z8qg7ACILqq7/mYZ
	kQmIFMPGG1Ge0LobalAahGKmdVzYBflsdZ3K6cY1kkWttVw5Z7DEMJnlaESMhV4=
X-Gm-Gg: ASbGncvjxETwMZ6AWRcejtCiw0jCHI7Dc0V+UoaG8smreU7BdkbeCfy5wkc5YozwFEc
	la1k08D+tV7GuMVmNvEusbBz3QGXEOcCoJfotmSV8Ztsgg+wmrLV0yCo/6Y8pd2PldhpJDh96S1
	cYrARJRg4khsf1F7vBxivTgoi+evasof3RdAR2oJXM9VpNxwHeZR8/vn71FgEnn57i3D+5c72K9
	mmKgh5xxz9y0DWszi/4fmDWj18egwOYt36xkMC1jvtL6QRh1FVfUb5EguHMEdFqgpBLbF8n4EQg
	NkPU/38HznShYaSbi+lilz1Dgsn81MoOpw==
X-Google-Smtp-Source: AGHT+IEMhKx0QG/4WQ8Z5pL7dWqoz5X0daErWyxLeCXiqQY+2H+EfszLps7mD1DlXpt2QhZXthe7KA==
X-Received: by 2002:a05:6000:1f8b:b0:385:f7e5:de88 with SMTP id ffacd0b85a97d-388c3645e83mr11656605f8f.3.1734360517222;
        Mon, 16 Dec 2024 06:48:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b? ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016083sm8295446f8f.31.2024.12.16.06.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 06:48:36 -0800 (PST)
Message-ID: <8ddca098-574c-40ac-ba28-83e96f7fa7d1@linaro.org>
Date: Mon, 16 Dec 2024 15:48:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
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
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/2024 12:51, Dikshita Agarwal wrote:
> Introduce support for Qualcomm new video acceleration hardware i.e.
> iris, used for video stream decoding.
> 
> Iris is a multi pipe based hardware that offloads video stream decoding
> from the application processor (AP). It supports H.264 decoding. The AP
> communicates with hardware through a well defined protocol, called as
> host firmware interface (HFI), which provides fine-grained and
> asynchronous control over individual hardware features.
> 
> This driver implements upgraded HFI gen2 to communicate with firmware.
> It supports SM8550 which is based out of HFI gen 2. It also supports
> SM8250 which is based out of HFI gen1.
> 
> This driver comes with below capabilities:
> - V4L2 complaint video driver with M2M and STREAMING capability.
> - Supports H264 decoder.
> 
> This driver comes with below features:
> - Centralized resource management.
> - Centralized management of core and instance states.
> - Defines platform specific capabilities and features. As a results, it
>    provides a single point of control to enable/disable a given feature
>    depending on specific platform capabilities.
> - Handles various video recommended sequences, like DRC, Drain, Seek,
>    EOS.
> - Implements asynchronous communication with hardware to achieve better
>    experience in low latency usecases.
> - Output and capture planes are controlled independently. Thereby
>    providing a way to reconfigure individual plane.
> - Native hardware support of LAST flag which is mandatory to align with
>    port reconfiguration and DRAIN sequence as per V4L guidelines.
> 
> Changes since v8:
> - re-order supported profile for h264 (Stefan)
> - move mapping of DEBLOCK cap to patch#14 (Stefan, Dmitry)
> - add a way to read the firmware path from dtsi and fallback to resource
>    data if not available (dikshita)
> - Link to v8: https://lore.kernel.org/r/20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com
>   
> Changes since v7:
> - Added HFI_ERROR_STREAM_UNSUPPORTED define to inform about session
>    error (Stefan)
> - Fixed kernel doc issues
> - Link to v7: https://lore.kernel.org/r/20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com
> 
> Changes since v6:
> - Added vb2_is_busy check in s_fmt (Hans)
> - Removed q->streaming checks in s_fmt (Hans)
> - Removed usage of inst->subscriptions (Hans)
> - Added call to v4l2_m2m_ioctl_decoder_cmd() from iris_dec_cmd() API (Hans)
> - Fixed issues related to kernel docs.
> - Addressed all other review comments.
> - Link to v6: https://lore.kernel.org/r/20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com
>   
> Changes since v5:
> - Fixed the memory leak in firmware load (Bryan)
> - Updated all headers s/_LIKE_SO_/__LIKE_SO__ (Bryan)
> - Updated value of IFACEQ_MAX_BUF_COUNT to 64 (Bryan)
> - Removed actual_count from iris buffer structure and cleaned up
>    vb2_queue_setup (Hans)
> - Used VIDEO_MAX_FRAME to set actual buffer to firmware (Hans)
> - Fixed the typo in commit log and subject of patch#12 (Hans)
> - Updated card field to Iris Decoder (Hans)
> - Removed redundant setting of byteused (Hans)
> - s/iris_driver/is_iris_driver (Jianhua)
> - Addressed all other review comments.
> - Link to v5: https://lore.kernel.org/r/20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com
> 
> Changes since v4:
> - Fixed commit message length for all patches (Krzysztof)
> - Migrated back to remove from remove_new (Uwe Kleine-König)
> - Removed support for g_volatle_ctrl (Hans)
> - Added changes to update minimum buffer count whenever the hardware
>    requirement changes (Hans)
> - Removed state checks from try/g/s_fmt ioctls (Hans)
> - Removed wait_prepare() and wait_finish callbacks (Hans)
> - Added support for remove_bufs (Hans)
> - Added module param based configurability to select between venus and
>    iris drivers for platforms supported by both drivers (Jianhua, Dmitry)
> - Addressed misc other review comments from Hans.
> - Fixed issues reported by kernel bot.
> - Link to v4: https://lore.kernel.org/r/20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com
> 
> Changes since v3:
> - Fixed the style issues with dt binding (Krzysztof)
> - Pushed  the patch to add maintainers to end of the series (Krzysztof,
>    Dmitry)
> - Moved the resource initialization next to probe in iris_probe.c and
>    squashed the patch of probe and resource initialization (Krzysztof)
> - Removed error prints from probe function (Krzysztof)
> - Defined bit fields used for register read/write with macros for better
>    context (Bryan)
> - Converted if/else to switch/case wherever applicable (Bryan)
> - Removed defensive NULL checks wherever not required (Bryan, Krzysztof)
> - Removed core->state checks except for below scenarios (Bryan)
>    - When reverse thread (firmware) can move the state of the core to
>      error state.
>    - When client can force close the driver and there are still pending
>      firmware responses to be read from shared queues (msg and dbg)
>    - For PM operations, since its a delayed autosuspend work and sys
>      error handler from the reverse thread can move the state to core
>      deinit state anytime.
> - Acquiring core->lock only for below scenarios (Bryan)
>    - Writing to registers.
> - Reading/Writing from/to shared queues.
>    - Traversing the instance list of core.
>    - To protect the core->state when it can changed by reverse thread.
> - Acquiring inst->lock only for below scenario which is needed (Bryan)
>    - Serializing the forward and reverse thread
>    - To protect the inst structure where the values can be modified by
>      firmware.
> - Removed usage of core->power_enabled (Krzysztof, Bryan)
> - Removed usage of mutex_is_locked  (Krzysztof, Bryan)
> - Use C structure for instance caps (Dmitry)
> - Split the ctrl ops patch by keeping only the defines, struct and caps
>    needed to intialize the ctrl handler and to implement s/g_ctrl
>    (Dmitry)
> - Removed the instance state checks to allow v4l2-ctl, relying on
>    standard vb2 checks instead. (Hans)
> - Converted APIs to void wherever applicable except for below (Bryan)
>    - iris_hfi_gen2_handle_session_error and
>      iris_hfi_gen2_handle_session_property cannot be converted to void
>      even though they always return 0.
>      Because these are two of the handlers invoked from
>      iris_hfi_gen2_handle_session_response and are of
>      iris_hfi_gen2_inst_hfi_range struct type, where same prototype is
>      followed for all handlers and return type of all handers should be
>      'int'.
>      And we cannot have a switch case/if else to handle these
>      responses from firmware because we need to parse the responses in a
>      particular sequence.
>      That's why we opted for this handler based design instead of
>      introducing multiple for loop with code duplication.
> - Fixed issues reported by kernel bot.
> - Fixed v4l2 compliance issue reported with "-s" options based on the
>    inputs from Hans.
> - Addressed all other review comments and made some code improvements.
> 
> Changes since v2:
> - introduced support for HFI gen1.
> - deprecated Encoder and HEVC, VP9 codecs.
> - removed custom vb2 mem ops and used standard framework instead.
> - added support for mmap streaming mode.
> - migrated all the buffer APIs to mem2mem helper functions.
> - registered iris buffer with vb2 framework.
> - migrated to clk_bulk, reset_bulk and icc_bulk APIs.
> - used pm_domain_attach/detach_list APIs.
> - migrated to read/writel and other available helpers for register
>    access instead of custom wrappers.
> - added documentation for various structures.
> - addressed many other review comments from v2.
> 
> Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> be unstable!" is seen during bootup.  It doesn't impact any video
> usecase and is currently under discussion.
> 
> Static tools like checkpatch, smatch, dt_binding_check, sparse and
> Coccinelle run successfully with this driver.
> 
> This driver is tested with v4l2-ctl[1] and Gstreamer[2].
> 
> [1]: v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264
> --set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap
> --stream-from /media/FVDO_Freeway_720p.264 --stream-to out.NV12
> 
> [2]: gst-launch-1.0 filesrc location=/media/media/4k_decode_clip.264 !
> h264parse ! v4l2h264dec capture-io-mode=dmabuf ! kmssink
> 
> The driver is tested with v4l2-compliance.
> 
> Result on SM8550:
> 
> v4l2-compliance --stream-from /media/FVDO_Freeway_720p.264 -s250
> 
> v4l2-compliance 1.29.0-5273, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 0ed98432fe68 2024-11-13 12:54:45
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : iris_decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.12.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 5 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          test MMAP (select, REQBUFS): OK
>          test MMAP (epoll, REQBUFS): OK
>          test MMAP (select, CREATE_BUFS): OK
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0,
> Warnings: 0
> 
> Result on SM8250:
> 
> v4l2-compliance --stream-from /media/FVDO_Freeway_720p.264 -s250
> 
> v4l2-compliance 1.29.0-5273, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 0ed98432fe68 2024-11-13 12:54:45
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : iris_decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.12.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 5 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
>          test MMAP (select, REQBUFS): OK
>          test MMAP (epoll, REQBUFS): OK
>          test MMAP (select, CREATE_BUFS): OK
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0,
> Warnings: 0
> 
> The result of fluster test on SM8550:
> 
> 77/135 while testing JVT-AVC_V1 with
> GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> The failing tests are:
> - 52 test vectors failed due to interlaced clips: Interlaced decoding is
>    not supported in iris driver.
>    Test Vectors:
>          cabac_mot_fld0_full
>          cabac_mot_mbaff0_full
>          cabac_mot_picaff0_full
>          CABREF3_Sand_D
>          CAFI1_SVA_C
>          CAMA1_Sony_C
>          CAMA1_TOSHIBA_B
>          cama1_vtc_c
>          cama2_vtc_b
>          CAMA3_Sand_E
>          cama3_vtc_b
>          CAMACI3_Sony_C
>          CAMANL1_TOSHIBA_B
>          CAMANL2_TOSHIBA_B
>          CAMANL3_Sand_E
>          CAMASL3_Sony_B
>          CAMP_MOT_MBAFF_L30
>          CAMP_MOT_MBAFF_L31
>          CANLMA2_Sony_C
>          CANLMA3_Sony_C
>          CAPA1_TOSHIBA_B
>          CAPAMA3_Sand_F
>          cavlc_mot_fld0_full_B
>          cavlc_mot_mbaff0_full_B
>          cavlc_mot_picaff0_full_B
>          CVCANLMA2_Sony_C
>          CVFI1_Sony_D
>          CVFI1_SVA_C
>          CVFI2_Sony_H
>          CVFI2_SVA_C
>          CVMA1_Sony_D
>          CVMA1_TOSHIBA_B
>          CVMANL1_TOSHIBA_B
>          CVMANL2_TOSHIBA_B
>          CVMAPAQP3_Sony_E
>          CVMAQP2_Sony_G
>          CVMAQP3_Sony_D
>          CVMP_MOT_FLD_L30_B
>          CVNLFI1_Sony_C
>          CVNLFI2_Sony_H
>          CVPA1_TOSHIBA_B
>          FI1_Sony_E
>          MR6_BT_B
>          MR7_BT_B
>          MR8_BT_B
>          MR9_BT_B
>          Sharp_MP_Field_1_B
>          Sharp_MP_Field_2_B
>          Sharp_MP_Field_3_B
>          Sharp_MP_PAFF_1r2
>          Sharp_MP_PAFF_2r
>          CVMP_MOT_FRM_L31_B
> - 3 test vectors failed due to unsupported bitstream.
>    num_slice_group_minus1 greater than zero is not supported by the
>    hardware.
>    Test Vectors:
>          FM1_BT_B
>          FM1_FT_E
>          FM2_SVA_C
> - 2 test vectors failed because SP_SLICE type is not supported by the
>    hardware.
>    Test Vectors:
>          SP1_BT_A
>          sp2_bt_b
> - 1 test vector failed due to unsupported profile:
>    V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED is being deprecated from sm8550
>    onwards due to hardware issues.
>    Test Vectors:
>          BA3_SVA_C
> 
> 23/69 while testing JVT-FR-EXT with
> GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> The failing tests are:
> - 21 test vectors failed due to interlaced clips: Interlaced decoding is
>    not supported in iris driver.
>    Test Vectors:
>          brcm_freh4
>          brcm_freh5
>          brcm_freh6
>          brcm_freh10
>          brcm_freh11
>          freh7_b
>          FREXT01_JVC_D
>          FREXT02_JVC_C
>          FRExt2_Panasonic_C
>          FRExt4_Panasonic_B
>          HCAFF1_HHI_B
>          HCAMFF1_HHI_B
>          HCHP3_HHI_A
>          HPCAFL_BRCM_C
>          HPCAFLNL_BRCM_C
>          HVLCFI0_Sony_B
>          HVLCMFF0_Sony_B
>          HVLCPFF0_Sony_B
>          HPCAMAPALQ_BRCM_B
>          HPCVFL_BRCM_A
>          HPCVFLNL_BRCM_A
> - 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
>    supported in iris driver
>    Test Vectors:
>          FREH10-1
>          FREH10-2
> - 21 test vectors failed due to unsupported profile:
>    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the
>    hardware.
>    Test Vectors:
>          FREXT1_TANDBERG_A
>          FREXT2_TANDBERG_A
>          FREXT3_TANDBERG_A
>          Hi422FR1_SONY_A
>          Hi422FR2_SONY_A
>          Hi422FR3_SONY_A
>          Hi422FR4_SONY_A
>          Hi422FR6_SONY_A
>          Hi422FR7_SONY_A
>          Hi422FR8_SONY_A
>          Hi422FR9_SONY_A
>          Hi422FR10_SONY_A
>          Hi422FR11_SONY_A
>          Hi422FR12_SONY_A
>          Hi422FR13_SONY_A
>          Hi422FR14_SONY_A
>          Hi422FR15_SONY_A
>          Hi422FREXT16_SONY_A
>          Hi422FREXT17_SONY_A
>          Hi422FREXT18_SONY_A
>          Hi422FREXT19_SONY_A
> - 2 test vectors failed due to unsupported bitstream.
>    chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
>    supported by the hardware.
>    Test Vectors:
>          HPCAMOLQ_BRCM_B
>          HPCVMOLQ_BRCM_B
> 
> The result of fluster test on SM8250:
> 
> 78/135 while testing JVT-AVC_V1 with
> GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> The failing tests are:
> - 52 test vectors failed due to interlaced clips: Interlaced decoding is
>    not supported in iris driver.
>    Test Vectors:
>          cabac_mot_fld0_full
>          cabac_mot_mbaff0_full
>          cabac_mot_picaff0_full
>          CABREF3_Sand_D
>          CAFI1_SVA_C
>          CAMA1_Sony_C
>          CAMA1_TOSHIBA_B
>          cama1_vtc_c
>          cama2_vtc_b
>          CAMA3_Sand_E
>          cama3_vtc_b
>          CAMACI3_Sony_C
>          CAMANL1_TOSHIBA_B
>          CAMANL2_TOSHIBA_B
>          CAMANL3_Sand_E
>          CAMASL3_Sony_B
>          CAMP_MOT_MBAFF_L30
>          CAMP_MOT_MBAFF_L31
>          CANLMA2_Sony_C
>          CANLMA3_Sony_C
>          CAPA1_TOSHIBA_B
>          CAPAMA3_Sand_F
>          cavlc_mot_fld0_full_B
>          cavlc_mot_mbaff0_full_B
>          cavlc_mot_picaff0_full_B
>          CVCANLMA2_Sony_C
>          CVFI1_Sony_D
>          CVFI1_SVA_C
>          CVFI2_Sony_H
>          CVFI2_SVA_C
>          CVMA1_Sony_D
>          CVMA1_TOSHIBA_B
>          CVMANL1_TOSHIBA_B
>          CVMANL2_TOSHIBA_B
>          CVMAPAQP3_Sony_E
>          CVMAQP2_Sony_G
>          CVMAQP3_Sony_D
>          CVMP_MOT_FLD_L30_B
>          CVNLFI1_Sony_C
>          CVNLFI2_Sony_H
>          CVPA1_TOSHIBA_B
>          FI1_Sony_E
>          MR6_BT_B
>          MR7_BT_B
>          MR8_BT_B
>          MR9_BT_B
>          Sharp_MP_Field_1_B
>          Sharp_MP_Field_2_B
>          Sharp_MP_Field_3_B
>          Sharp_MP_PAFF_1r2
>          Sharp_MP_PAFF_2r
>          CVMP_MOT_FRM_L31_B
> - 3 test vectors failed due to unsupported bitstream.
>    num_slice_group_minus1 greater than zero is not supported by the
>    hardware.
>    Test Vectors:
>          FM1_BT_B
>          FM1_FT_E
>          FM2_SVA_C
> - 2 test vectors failed because SP_SLICE type is not supported by the
>    hardware.
>    Test Vectors:
>          SP1_BT_A
>          sp2_bt_b
> 
> 23/69 while testing JVT-FR-EXT with
> GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1.
> The failing tests are:
> - 21 test vectors failed due to interlaced clips: Interlaced decoding is
>    not supported in iris driver.
>    Test Vectors:
>          brcm_freh4
>          brcm_freh5
>          brcm_freh6
>          brcm_freh10
>          brcm_freh11
>          freh7_b
>          FREXT01_JVC_D
>          FREXT02_JVC_C
>          FRExt2_Panasonic_C
>          FRExt4_Panasonic_B
>          HCAFF1_HHI_B
>          HCAMFF1_HHI_B
>          HCHP3_HHI_A
>          HPCAFL_BRCM_C
>          HPCAFLNL_BRCM_C
>          HVLCFI0_Sony_B
>          HVLCMFF0_Sony_B
>          HVLCPFF0_Sony_B
>          HPCAMAPALQ_BRCM_B
>          HPCVFL_BRCM_A
>          HPCVFLNL_BRCM_A
> - 2 test vectors failed due to 10bit bitstream: 10bit decoding is not
>    supported in iris driver
>    Test Vectors:
>          FREH10-1
>          FREH10-2
> - 21 test vectors failed due to unsupported profile:
>    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 is not supported by the
>    hardware.
>    Test Vectors:
>          FREXT1_TANDBERG_A
>          FREXT2_TANDBERG_A
>          FREXT3_TANDBERG_A
>          Hi422FR1_SONY_A
>          Hi422FR2_SONY_A
>          Hi422FR3_SONY_A
>          Hi422FR4_SONY_A
>          Hi422FR6_SONY_A
>          Hi422FR7_SONY_A
>          Hi422FR8_SONY_A
>          Hi422FR9_SONY_A
>          Hi422FR10_SONY_A
>          Hi422FR11_SONY_A
>          Hi422FR12_SONY_A
>          Hi422FR13_SONY_A
>          Hi422FR14_SONY_A
>          Hi422FR15_SONY_A
>          Hi422FREXT16_SONY_A
>          Hi422FREXT17_SONY_A
>          Hi422FREXT18_SONY_A
>          Hi422FREXT19_SONY_A
> - 2 test vectors failed due to unsupported bitstream.
>    chroma_fmt_idc is equal to 0(monochrome) in the bitstream which is not
>    supported by the hardware.
>    Test Vectors:
>          HPCAMOLQ_BRCM_B
>          HPCVMOLQ_BRCM_B
> 
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> Cc: Jianhua Lu <lujianhua000@gmail.com>
> Cc: Stefan Schmidt <stefan.schmidt@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (18):
>        dt-bindings: media: Add video support for QCOM SM8550 SoC
>        media: iris: add platform driver for iris video device
>        media: iris: implement iris v4l2 file ops
>        media: iris: introduce iris core state management with shared queues
>        media: iris: implement video firmware load/unload
>        media: iris: implement boot sequence of the firmware
>        media: iris: introduce host firmware interface with necessary hooks
>        media: iris: implement power management
>        media: iris: implement reqbuf ioctl with vb2_queue_setup
>        media: iris: implement iris v4l2_ctrl_ops
>        media: iris: implement vb2 streaming ops
>        media: iris: allocate, initialize and queue internal buffers
>        media: iris: implement vb2 ops for buf_queue and firmware response
>        media: iris: add support for dynamic resolution change
>        media: iris: handle streamoff/on from client in dynamic resolution change
>        media: iris: add support for drain sequence
>        media: iris: enable video driver probe of SM8250 SoC
>        media: MAINTAINERS: add Qualcomm iris video accelerator driver
> 
> Vedang Nagar (10):
>        media: iris: implement s_fmt, g_fmt and try_fmt ioctls
>        media: iris: implement g_selection ioctl
>        media: iris: implement enum_fmt and enum_framesizes ioctls
>        media: iris: implement subscribe_event and unsubscribe_event ioctls
>        media: iris: implement query_cap ioctl
>        media: iris: implement set properties to firmware during streamon
>        media: iris: subscribe parameters and properties to firmware for hfi_gen2
>        media: iris: add check whether the video session is supported or not
>        media: iris: implement power scaling for vpu2 and vpu3
>        media: iris: add check to allow sub states transitions
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 158 ++++
>   MAINTAINERS                                        |  10 +
>   drivers/media/platform/qcom/Kconfig                |   1 +
>   drivers/media/platform/qcom/Makefile               |   1 +
>   drivers/media/platform/qcom/iris/Kconfig           |  13 +
>   drivers/media/platform/qcom/iris/Makefile          |  27 +
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 623 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_buffer.h     | 117 +++
>   drivers/media/platform/qcom/iris/iris_core.c       |  96 +++
>   drivers/media/platform/qcom/iris/iris_core.h       | 111 +++
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 259 ++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  22 +
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 116 +++
>   drivers/media/platform/qcom/iris/iris_firmware.h   |  15 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 176 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h | 155 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  16 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 826 ++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 448 ++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 666 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  41 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 957 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 161 ++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 292 +++++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.h      | 125 +++
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 934 ++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 314 +++++++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 182 ++++
>   drivers/media/platform/qcom/iris/iris_instance.h   |  77 ++
>   .../platform/qcom/iris/iris_platform_common.h      | 186 ++++
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 148 ++++
>   .../platform/qcom/iris/iris_platform_sm8550.c      | 265 ++++++
>   drivers/media/platform/qcom/iris/iris_power.c      | 140 +++
>   drivers/media/platform/qcom/iris/iris_power.h      |  13 +
>   drivers/media/platform/qcom/iris/iris_probe.c      | 378 ++++++++
>   drivers/media/platform/qcom/iris/iris_resources.c  | 131 +++
>   drivers/media/platform/qcom/iris/iris_resources.h  |  18 +
>   drivers/media/platform/qcom/iris/iris_state.c      | 276 ++++++
>   drivers/media/platform/qcom/iris/iris_state.h      | 144 ++++
>   drivers/media/platform/qcom/iris/iris_utils.c      |  90 ++
>   drivers/media/platform/qcom/iris/iris_utils.h      |  53 ++
>   drivers/media/platform/qcom/iris/iris_vb2.c        | 335 ++++++++
>   drivers/media/platform/qcom/iris/iris_vb2.h        |  19 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 659 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  25 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       | 453 ++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.h       |  15 +
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  38 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 +++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 270 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  91 ++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 369 ++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  28 +
>   .../platform/qcom/iris/iris_vpu_register_defines.h |  17 +
>   54 files changed, 11222 insertions(+)
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241028-qcom-video-iris-94d5a12e6d9e
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

Thanks,
Neil

