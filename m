Return-Path: <linux-media+bounces-50283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E2D0AA20
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 15:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F9E730A1328
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDAE35E53E;
	Fri,  9 Jan 2026 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/HtqhN5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3F35CBB2
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968893; cv=none; b=gUu1NfuaHIGO8uQJ1rUCJq4aJxtC8V22/UbJiO7OZGugihjRRdZvY8oUmQOQu2S91MitR9eTwSXGAKcVqNOPzplStvgUkTwBMfkw5F8Af6oegbuIBOc2YSDRcvt6i997Tf7s1UeFYSDhTIA8+xNenVSoISGussN/jF/BwFCutc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968893; c=relaxed/simple;
	bh=S5B+MOqj3mLyfw/bbj5xl3MnpYdDnVSxhT2i18E5YzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/gdhMhXdkebDHxkqbzZ+6O2b2/s3WrMbfcro1GJ7EkSPqVhUVeF1MvtP9mJKJ8OsuE7onsmjKyTXUZlWglPJbxzOPP2zFgQDQVfIQyRUl2lTVDwU/TBG0VzdR73NIPJ9Z+iHL4Lnwbtx2erOlQEqFn1lXhetLA/RFCVaGFRNzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/HtqhN5; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so44359575e9.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767968889; x=1768573689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EsDBKmazHaAmoGYy8C1E7Q+pWMU6xFON74pWh7EEAg=;
        b=p/HtqhN5SrG+rg7GaDf26ZRBahUettqnNE53qkwjzbUzRwqcSj/bVXvZv3s0CVdcS8
         oHG48EpbPAeLLJXEXBWR05Wfu7lgPxmH4EE1JKplU2ApMGq32wBPyWNz38NXyIjPoTwF
         6HUYTtbyqAbpTDHJB7OfbB5pTnSZGAg0iOqeXfzXGFe5/dpggF6RK4dNIJiQ2Gr2MDWK
         cNrVVznKBTNhL9hHcgxshOZ2ihFK+blRXWrOGbOAOE8HGto1rv6MafNxtnVI8pz0k/Zl
         pFWG6UkQBMiZic7MXqJFwjIICjxi8zN6jx8d2glH1jRLeGAePiq3xiejQBLfPAkLWJtR
         eLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968889; x=1768573689;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsDBKmazHaAmoGYy8C1E7Q+pWMU6xFON74pWh7EEAg=;
        b=US2Uq1u34Otpm8tNkBEFVqgUrbvgZIncAY7FUoCryeYIfgTHezAaAFnTKEh0JEMcZa
         EHMerMYr4azQIyVkc8uuMASDgxNbywDAqEdKErOxljwlwUvIfX/S38tz3jGPs7evhOjx
         iYxMGxqVWKnYbxJ/LFUFzNEo19zC2DCGKY7pq+ajc/I6pafupc5wQ8zd2tsitgjAZTyb
         TuChAEc/IC3Cxm2OA2frH+S4fT3gFFbX5Hq04DK/R9/Pb8nwd0sCvL+inVEfCF5jer4A
         y1ZS6sLRAaWDkIOne2k+7Bi/rvNr8Tye1NJwgxjRgRxEgi88yyt/1N+SsjyAkxy5dxjB
         TeTw==
X-Gm-Message-State: AOJu0Yx7ZZMvjvOW7DpqZP27m+yEE/1EnIGsefTOBukr8Vk2NDS8Go8X
	MJCoe0Oq4bH9AQ67ncsUFTZJUbU2J/xwK9ZyhshmIbL35x0iiOmbvDqA8hlJPX5vlWw=
X-Gm-Gg: AY/fxX51f3q44Z2R+YSxxulrSe5uc2r1MwVUnUi1vMv9BCSEZ+crXeA9hF72KFlKGf/
	N4jWNANn9DVi3QOjbzP10S7axzaPKBQM+mSsxcaukFV5kfCDjsEKFiERE1WNifi9GGgSUmbQRsw
	wi2zIGjpCriBX/lGhrP+9JeoS+GpLDfehsLSQLfnRnCozb8kidhYLfg6w11PjvpZG6h3iReBu70
	g57M9G1KmjMGI3H1CDK0SqBFT3uWmWJesCtyiwAMsM6QmXp+tH2ZILdMGyGJwOMJjRIFbPT4vxg
	3d4gEc2C5aM6F14s9GvkHrF/97/Vxql1IyPknsZ/Sq8WUdSipRJheWqbQSkLz56F5Pu9WbJOdhc
	5MS4Ea844Y4S6l5OjuKdMOVjsc8EnccLfJ3pdQLxFvlvv5FA12BgNxSUtj6+P4I2T1TYdHD0zDb
	Mn4Da8ysC3uMtAnPl5tSTThIc06RdRYS75d7OxwBIVg7BcyM57onFTP0KA5n3IhfQ=
X-Google-Smtp-Source: AGHT+IGbfNOtxbBJ7PHL/MB1YtCsevnplFhUJmOMIPzmWmpnpIQgxr15qWyWebqRHGWc55JRtYRWBw==
X-Received: by 2002:a05:600c:3152:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d84b18db4mr116413645e9.14.1767968889009;
        Fri, 09 Jan 2026 06:28:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:6f64:6b96:cac5:a35f? ([2a01:e0a:3d9:2080:6f64:6b96:cac5:a35f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm219173345e9.12.2026.01.09.06.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 06:28:08 -0800 (PST)
Message-ID: <899b9ae6-7278-4c16-aad6-ad0f84ca6a49@linaro.org>
Date: Fri, 9 Jan 2026 15:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] media: iris: Add support for QC08C format for
 encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
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
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-3-478ba2d96427@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/8/25 11:52, Dikshita Agarwal wrote:
> Introduce handling for the QC08C format in the encoder. QC08C
> format is NV12 with UBWC compression. Update format checks and
> configuration to enable encoding to QC08C streams.

I'm late to the party but I've been trying the new encoder features patchset
on top of v6.19-rc4 on the SM8650-HDK, but the result was wrong like if something
was wrong in the planes offsets, leading the the UV colors moving in the background.

The encoding was fine on v6.18 final release.

Here's a screenshot:
https://pasteboard.co/t8HmeNaIFMDR.png

The command I use are:

ffmpeg -f lavfi -i testsrc=duration=10:size=1920x1080:rate=30 -pix_fmt nv12 test_video_1080_10s.yuv
v4l2-ctl --verbose --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 --set-selection-output target=crop,top=0,left=0,width=1920,height=1080 --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=test_video_1080_10s.yuv --stream-to=test_video_1080_10s.h264 -d /dev/video1


I did a bisect and it did lead to the very change:
# bad: [9ace4753a5202b02191d54e9fdf7f9e3d02b85eb] Linux 6.19-rc4
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'v6.19-rc4' 'v6.18' 'drivers/media/platform/qcom/iris/'
# bad: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect bad 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# good: [8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88] Merge tag 'net-next-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
# good: [490fd9336650a39c57ce2a652676a8cb9dc6c842] Merge tag 'drm-misc-next-2025-11-14-1' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
git bisect good 490fd9336650a39c57ce2a652676a8cb9dc6c842
# good: [559e608c46553c107dbba19dae0854af7b219400] Merge tag 'ntfs3_for_6.19' of https://github.com/Paragon-Software-Group/linux-ntfs3
git bisect good 559e608c46553c107dbba19dae0854af7b219400
# good: [b3239df349c2c2c94686674489c9629c89ca49a1] Merge tag 'drm-misc-next-2025-12-01-1' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
git bisect good b3239df349c2c2c94686674489c9629c89ca49a1
# good: [6e971cfe62e7a56593b22ab1ad0050ac49551696] media: venus: drop bogus probe deferrals
git bisect good 6e971cfe62e7a56593b22ab1ad0050ac49551696
# bad: [f53fb31a388901cfe11b95a3a2cf1594355321e4] media: rockchip: add driver for the rockchip camera interface
git bisect bad f53fb31a388901cfe11b95a3a2cf1594355321e4
# bad: [e687f5cae591dba4a0a968c24cbe7b6141027d93] media: imx-mipi-csis: Support active data lanes differing from maximum
git bisect bad e687f5cae591dba4a0a968c24cbe7b6141027d93
# bad: [c33f7e61a1c9e9255597102e61add4b4fe91668c] media: qcom: camss: Add CSIPHY 2.2.0 lane configuration for SM8650
git bisect bad c33f7e61a1c9e9255597102e61add4b4fe91668c
# bad: [542e3540ddd75f0a46dd365978476bcc1dda5b5a] media: iris: enable support for SC7280 platform
git bisect bad 542e3540ddd75f0a46dd365978476bcc1dda5b5a
# bad: [e5894eeefdebf5a6d7512cd23efec78071985738] media: iris: turn platform caps into constants
git bisect bad e5894eeefdebf5a6d7512cd23efec78071985738
# good: [7c1f3bd58fa02f427ff4ef611fa49b56bc6f8f76] media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
git bisect good 7c1f3bd58fa02f427ff4ef611fa49b56bc6f8f76
# bad: [456c99da41cb6f39c5c8420710b72fb9fd1450b4] media: iris: Add support for QC08C format for encoder
git bisect bad 456c99da41cb6f39c5c8420710b72fb9fd1450b4
# good: [cfd71b14b0d6f62d97338a524c858c63cf699c3f] media: iris: Add support for QC08C format for decoder
git bisect good cfd71b14b0d6f62d97338a524c858c63cf699c3f
# first bad commit: [456c99da41cb6f39c5c8420710b72fb9fd1450b4] media: iris: Add support for QC08C format for encoder

I don't see what would be causing this.

Thanks,
Neil

> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 12 ++++-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       | 59 ++++++++++++++++++----
>   4 files changed, 63 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 83dcf49e57ec1473bc4edd26c48ab0b247d23818..b89b1ee06cce151e7c04a80956380d154643c116 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -171,9 +171,14 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>   static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>   {
>   	u32 y_plane, uv_plane, y_stride, uv_stride;
> -	struct v4l2_format *f = inst->fmt_dst;
>   	u32 uv_meta_stride, uv_meta_plane;
>   	u32 y_meta_stride, y_meta_plane;
> +	struct v4l2_format *f = NULL;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
>   
>   	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, META_STRIDE_ALIGNED >> 1),
>   			      META_STRIDE_ALIGNED);
> @@ -273,7 +278,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>   	} else {
>   		switch (buffer_type) {
>   		case BUF_INPUT:
> -			return iris_yuv_buffer_size_nv12(inst);
> +			if (inst->fmt_src->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
> +				return iris_yuv_buffer_size_qc08c(inst);
> +			else
> +				return iris_yuv_buffer_size_nv12(inst);
>   		case BUF_OUTPUT:
>   			return iris_enc_bitstream_buffer_size(inst);
>   		default:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e458d3349ce09aadb75d056ae84e3aab95f03078..52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -795,7 +795,8 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
>   	} else {
>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>   		fmt.buffer_type = HFI_BUFFER_INPUT;
> -		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
> +		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> +			HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>   		ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>   	}
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7..6a772db2ec33fb002d8884753a41dc98b3a8439d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -447,7 +447,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>   			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>   	} else {
>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
> +		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> +			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>   	}
>   
>   	return iris_hfi_gen2_session_set_property(inst,
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..95e3ceb22d8c3a46c1bf3eb87e7c1cc5ccf3039f 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -80,7 +80,7 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
>   	kfree(inst->fmt_src);
>   }
>   
> -static const struct iris_fmt iris_venc_formats[] = {
> +static const struct iris_fmt iris_venc_formats_cap[] = {
>   	[IRIS_FMT_H264] = {
>   		.pixfmt = V4L2_PIX_FMT_H264,
>   		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> @@ -91,12 +91,35 @@ static const struct iris_fmt iris_venc_formats[] = {
>   	},
>   };
>   
> +static const struct iris_fmt iris_venc_formats_out[] = {
> +	[IRIS_FMT_NV12] = {
> +		.pixfmt = V4L2_PIX_FMT_NV12,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_QC08C] = {
> +		.pixfmt = V4L2_PIX_FMT_QC08C,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
>   static const struct iris_fmt *
>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   {
> -	const struct iris_fmt *fmt = iris_venc_formats;
> -	unsigned int size = ARRAY_SIZE(iris_venc_formats);
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
>   	unsigned int i;
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_venc_formats_out;
> +		size = ARRAY_SIZE(iris_venc_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_venc_formats_cap;
> +		size = ARRAY_SIZE(iris_venc_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
>   
>   	for (i = 0; i < size; i++) {
>   		if (fmt[i].pixfmt == pixfmt)
> @@ -112,8 +135,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   static const struct iris_fmt *
>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   {
> -	const struct iris_fmt *fmt = iris_venc_formats;
> -	unsigned int size = ARRAY_SIZE(iris_venc_formats);
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
> +
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_venc_formats_out;
> +		size = ARRAY_SIZE(iris_venc_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_venc_formats_cap;
> +		size = ARRAY_SIZE(iris_venc_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
>   
>   	if (index >= size || fmt[index].type != type)
>   		return NULL;
> @@ -127,9 +163,11 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>   
>   	switch (f->type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (f->index)
> +		fmt = find_format_by_index(inst, f->index, f->type);
> +		if (!fmt)
>   			return -EINVAL;
> -		f->pixelformat = V4L2_PIX_FMT_NV12;
> +
> +		f->pixelformat = fmt->pixfmt;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>   		fmt = find_format_by_index(inst, f->index, f->type);
> @@ -156,7 +194,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   	fmt = find_format(inst, pixmp->pixelformat, f->type);
>   	switch (f->type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +		if (!fmt) {
>   			f_inst = inst->fmt_src;
>   			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>   			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> @@ -221,7 +259,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   
>   	iris_venc_try_fmt(inst, f);
>   
> -	if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
> +	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>   		return -EINVAL;
>   
>   	fmt = inst->fmt_src;
> @@ -289,7 +327,8 @@ int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
>   {
>   	const struct iris_fmt *fmt = NULL;
>   
> -	if (pixelformat != V4L2_PIX_FMT_NV12) {
> +	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	if (!fmt) {
>   		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   		if (!fmt)
>   			return -EINVAL;
> 


