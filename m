Return-Path: <linux-media+bounces-40449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FCB2E063
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5334916858E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096E9353347;
	Wed, 20 Aug 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWvoETXu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B08322A1A
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701951; cv=none; b=rwov82kS7m5bsksTFoml70UldJlYaR2Df3sYTcvl/mS8IE06SPta5gkEydhOSHc98t6iARzkskQGvb4jG2iphRpJ5k7WF9STwGz8al6hsH0Jhw8KqctQHE7PDcZiVkX8xtW3i903GdTXo7ULziieFLBH3PCGtV/5BtvJixM3fPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701951; c=relaxed/simple;
	bh=KLSEhRhpn0pJRZiDxTlV/YRhfmDACOa47GcjgY0rTtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmFK8y9EDeCKShaZK/cS2aVmwE10mln3SNOEkvmyTH6gLgRNc0LDLgUgdMnbOw3wqq/2i5t+E7JmCNBLycgR2NVPlXZzZ6fawz+GcTPsLKdwczOf4XDtjA38tcOK+jlP5yeJquJhLRUzuzzCq7VH64Txr8BEX8jQ+3bb2rk5M+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWvoETXu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso48724275e9.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701947; x=1756306747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peA73xOrloEI1tHmedOg9qC8Rwz7Zonq7AQGTifkplE=;
        b=rWvoETXupHGDTHUonkjuW10AfQNoIBgg6nXg8TzX81NJjN4CI2RZ+ZyIEfzxSBiJrJ
         aeiBwDrKio1ls1IDjtNEECWR8Ra1HE02JTx2YTJW9WpXZ0v0qeJp21ykqZf3kxFOyBsj
         +vXj+RrrtmL9Fv7uQgtr0untc4Iioeg78Bq8IyWax++XytxvhZVDT283ZcZMyXtpyQlv
         7LCQ6s9yt4uSCDv2klzYqlzNIyCyhzsJkARLyPv/ZnPq4DBgLgl4+W2ZdtBCSUY7kGaW
         NSZdnhROW3ww+3jbJwtW6XftL/ORVVoOTZBS7WzCjD162tntFaYrr+AhQZ9cxKei1lb6
         B5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701947; x=1756306747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=peA73xOrloEI1tHmedOg9qC8Rwz7Zonq7AQGTifkplE=;
        b=KdatA1B9BSfNQ/QVjQbJC+kYYZgLWPLIdRTgYFbfcINd7p3xqYzYBVG7VfQS3lSoL3
         lI+QaWi9sXryiwD2FT6S3ES8pWL/h89oMlCgO0Xm0P7XIkZCCoSrCmzLKkDCksU77cu7
         eGxa6uNpbVnpMk75ZAPBbFPnoI5n5qiHGHnNggJ8pKrCRPLPWUS0eKhQf0HpYfAN+hnO
         iUDbkPzj/eY88ZaZQCoMoAYUXQgnwZ3U+6ZztKMFZz5T1qN4fnGvI0EZ5d/OQl6OSEGI
         UjeAhHwCiBeV+nay8lvfM2J5WllKqqqRiAAk60iRT88iTevpgfjmSx5mHZg/sHuYC/ki
         lrTg==
X-Gm-Message-State: AOJu0Ywl2iDlZbmpGk65DmGIRYKaGeR6hDpgcT6STj9WCyUpURlUJ6fA
	GsThUoYWRb/HiNVg1Ijg3PQChrnzg2eRDHhAMChOVm9CMjgbNu/zy0ouzlflC1YtC9k=
X-Gm-Gg: ASbGncsam3Ir6mDr/jYPuDry3gGDYPPGWVmgVCSkDl8Z9kpyGsFsEY2K1TjJRI9cLtF
	hy9TWnnhXv6yWtws9kmPirXv2x5fW37x/IJiiE6M0c+WcK52TXQochy8NUWzcj0uAwzfVC0r6wH
	SgpuiV7LaaTQGcPrOlx6wZ1wBO53DmSMEFIHolEol5iwwg1n15w96NAwvLXKIir9+QDb57YXU4m
	he3EpCWU0ivUV7d6EOm3hqS+sVG9Rrmp9UtGwtY9sSrs73DR2FpCHc3ILZgT1ZKM9ixggcSFFyw
	CXLEZSK/6iyG2nNeP286dILJghe5YrSaTCZHeyW3IYfP4+RKI19m+ClW1BChxySx4RrH8qBGLhZ
	UmKrKqwQ8pLev+yR0KRS+qLS3uwJVFWq6SQf0CkEBi40ONLCqGXhmTZBVIVN+oY7HxdUhRwXV54
	8=
X-Google-Smtp-Source: AGHT+IH2HKmgctvAGNGlwEhHn2R1Bc04GjCsZyS8t8v5SgQV3ltDKgEyeOP3L7r5LDaBBz/ssSbn0g==
X-Received: by 2002:a05:600c:5253:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45b47a0a9ccmr30096915e9.30.1755701946802;
        Wed, 20 Aug 2025 07:59:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7? ([2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47cac06esm34709895e9.21.2025.08.20.07.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 07:59:06 -0700 (PDT)
Message-ID: <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
Date: Wed, 20 Aug 2025 16:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/08/2025 11:07, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds support for H.264 and H.265 encoder in iris
> driver and includes a few fixes and cleanup in the common code that were
> identified during encoder bring-up process.
> 
> The changes include:
> - Enabling support for H.264 and H.265 encoding.
> - Fixes and improvements in shared componenets used by both encoder and
> decoder paths.
> - Ensuring compatibility and stability with the existing decoder flow.
> 
> Changes in v3:
> - Fixed the log when destroying the interanl buffers (Jorge)
> - Updated commit text with issue details in patch 05/25 (Krzysztof)
> - Added a patch to simplify conditional logic in stop handling for hfi gen1 (Bryan)
> - Reduced duplicate code while registering video devices (Bryan)
> - Added a fix for try fmt handling in decoder (Self)
> - Fixed the value of max core mbps for qcs8300 (Vikash)
> - Simplied the frame rate handling in driver by using non q16 format and
> converted to q16 when setting to firmware (Vikash)
> - Fixed the issue with bitstream resolution setting to firmware (Neil)
> - Addressed other review comments (Vikash, Bryan)
> - Link to v2: https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
> 
> Changes in v2:
> - Fixed sparse/coccinnelle issues.
> - Fixed the kernel doc warning.
> - Removed unsupported PEAK_BITRATE property from SM8250.
> - Dropped patch 04/25 to fix quality issue with encoder.
> - Enhanced command handling for encoder to allow start/stop commands.
> - Expanded rate control condition checks to include additional rate
>    control types for HFI Gen2.
> - Updated default value to MAX_QP for all caps related to max QP settings.
> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
> - Link to v1: https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and
> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
> that the existing decoder functionality remains uneffected.
> 
> Commands used for V4l2-ctl validation:
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=/media/cyclists_1280x720_92frames.yuv
> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1

- I've tested this serie on SM8650, first I failed to get HEVC working with the following command:

v4l2-ctl --verbose --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 --set-selection-output target=crop,top=0,left=0,width=1920,height=1080 --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=Big_Buck_Bunny_1080_10s.yuv --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1

I got:
qcom-iris aa00000.video-codec: session error received 0x1000005: unknown

I checked the diff with v2, and reverting this make HEVC encoding work again:
===========================><=================================================
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -194,9 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
                 inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
                 payload_type = HFI_PAYLOAD_U32;
         } else {
-               codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-               resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
-                       ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
+               resolution = inst->fmt_dst->fmt.pix_mp.width << 16 |
+                       inst->fmt_dst->fmt.pix_mp.height;
                 inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
                 payload_type = HFI_PAYLOAD_32_PACKED;
         }
===========================><=================================================
Did I pass some wrong parameters ? I don't expect the fw to crash.

- On the 1280x720 output bug, I tried the same commands as v2:
v4l2-ctl --verbose --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 --set-selection-output target=crop,top=0,left=0,width=1920,height=1080 --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=Big_Buck_Bunny_1080_10s.yuv --stream-to=Big_Buck_Bunny_1080_10s.h264 -d /dev/video1

And I still get a 1280x720 h264 video, did I miss something ?

- Finally I tested the firmware you sent today (https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/654),
first thanks a lot for that !

But then I was unable to encode with this firmware (v2 or v3 patchset), I got around all the firmwares
I got and here's the results:
| QC_IMAGE_VERSION_STRING                                     | BUILD_DATE  | Release                         | decoding | encoding v2 | encoding v3 |
|-------------------------------------------------------------|-------------|---------------------------------|----------|-------------|-------------|
| video-firmware.3.4-245082a0a3cc5e740f6340c295000ab4bcfc367d | Aug 24 2023 | VIDEO.LA.4.0.r2-02400-lanai.0-1 | OK       | OK          | KO HEVC     |
| video-firmware.3.4-457429862ac40592d143de942b04d80fd9987e56 | Jan 29 2024 | VIDEO.LA.4.0.r2-03800-lanai.0-1 | OK       | OK          | KO HEVC     |
| video-firmware.3.4-0d8a914b010672616a0d0613e22866c0b639a807 | Aug 14 2024 | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
| video-firmware.3.4-75ad4eb9657cf50ee663b05f78c01d6ceccd5632 | Jan 29 2025 | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
| video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693 | Aug 14 2025 | VIDEO.VPU.3.4-0054              | OK       | KO          | KO          |
------------------------------------------------------------------------------------------------------------------------------------------------------

The change occurs around Aug 14 2024, So I checked the downstream driver and I found that fixes the encoding:
===========================><=================================================
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -863,9 +863,18 @@ static inline
  u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
                        u32 frame_width_coded)
  {
-       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
-                     (((((max_t(u32, (frame_width_coded),
-                                (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
+       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0, vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0, size_top = 0;
+
+       vpss_4tap_top = ((((max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
+       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
+       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded) + 3) >> 2) << 4) + 256;
+       vpss_div2_left = ((((max_t(u32, frame_width_coded, frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
+       vpss_top_lb = (frame_width_coded + 1) << 3;
+       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
+       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
+       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
+
+       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
  }

  static inline
===========================><=================================================

And I checked and encoding still works with the "old" firmwares.

With both changes, I can get H264 & HEVC encoding working on any firmware.

Neil


> 
> Commands used for GST validation:
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.h264
> 
> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
> location=/tmp/gst_cyclists_1280x720_92frames.hevc
> 
> The result of v4l2-compliance on SM8550:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
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
>          Standard Controls: 37 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
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
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> The result of v4l2-compliance on SM8250:
> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.16.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
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
>          Standard Controls: 19 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
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
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Looking forward to your review and feedback.
> 
> Thanks,
> Dikshita
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (26):
>        media: iris: Fix buffer count reporting in internal buffer check
>        media: iris: Report unreleased PERSIST buffers on session close
>        media: iris: Fix memory leak by freeing untracked persist buffer
>        media: iris: Fix port streaming handling
>        media: iris: Allow substate transition to load resources during output streaming
>        media: iris: Always destroy internal buffers on firmware release response
>        media: iris: Update vbuf flags before v4l2_m2m_buf_done
>        media: iris: Simplify session stop logic by relying on vb2 checks
>        media: iris: Allow stop on firmware only if start was issued.
>        media: iris: Send dummy buffer address for all codecs during drain
>        media: iris: Fix missing LAST flag handling during drain
>        media: iris: Fix format check for CAPTURE plane in try_fmt
>        media: iris: Add support for video encoder device
>        media: iris: Initialize and deinitialize encoder instance structure
>        media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>        media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
>        media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>        media: iris: Add encoder support for V4L2 event subscription
>        media: iris: Add support for G/S_SELECTION for encoder video device
>        media: iris: Add support for G/S_PARM for encoder video device
>        media: iris: Add platform-specific capabilities for encoder video device
>        media: iris: Add V4L2 streaming support for encoder video device
>        media: iris: Set platform capabilities to firmware for encoder video device
>        media: iris: Allocate and queue internal buffers for encoder video device
>        media: iris: Add support for buffer management ioctls for encoder device
>        media: iris: Add support for drain sequence in encoder video device
> 
>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>   drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>   drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>   .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>   drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>   drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
>   33 files changed, 4964 insertions(+), 712 deletions(-)
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250704-iris-video-encoder-b193350b487a
> 
> Best regards,


