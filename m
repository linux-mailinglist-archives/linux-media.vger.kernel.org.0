Return-Path: <linux-media+bounces-19647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E499E015
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB750281592
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 08:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8398E18BC21;
	Tue, 15 Oct 2024 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlysxAZz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83CF9FE
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979237; cv=none; b=S0Gyod2b1VfnTWiNsDi1yp0WxHLH/Bxb9f37G+gJKrOyiVlQ+8fFGy9MqiastwRomWQfpU12BA3kIcpUMFa1EyneZKaRStDXgubXVvD4VCBqgrt07AHuAtjX6SE21+p/WNQmxuY8mUqNI1EtT77WTyoW4/Q4s7GnIAzhjMopOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979237; c=relaxed/simple;
	bh=5fQzqZVDWKM50Z58T75Tbyscnqw3UBoTMxYDo9kRTBc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HEzyddb3J+mRJYPrCU1RM+k2XXoNy3JeDjdV/Ha4Sd6SoK+BTb0KxWtb4Cr8+SvIKrEqGmBXIibhTL9fuXJbPBhRpr9Js+2nF+PE4QF2EILvMoBWerFBMLeNdqPa2Yw+cnO7pegR/e5VvgiQl4OLXTx7ZvSZChhggazH7hgXzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlysxAZz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d5038c653so3131671f8f.2
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728979233; x=1729584033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYiRvYKu246G9ujsFMWvz+U1B3rbqqeExJHjCPrbWvw=;
        b=wlysxAZz2fUHZYv0Tb12O58Irx/9lM6Tv0dSVYfFTzOlFLceKIBOkwaBEcB9jtO91c
         wok4PbXyDoNVpfzTZ6C1peuNZah9RUuylS7y2VtLsky0diHmPIpNVNzkCcu9Bmu2djOf
         Mz4GYhpInldd147v3AxrycN61LRCcum6c+D98Y19bRmTlBGnPOCywhoq5+PZYIo0H8tj
         y6ZP+rfADMobxRHHAASk6onHFzGuxd7FOMdP5kP1t2iHCweUOqdPPIHeXMASJrSzFk3y
         kLmyA0Yfg7FdMUYUIRighUqSCtrwIKaqVq3tdtA+i7ElcD/jauC6vKpbqZBceUTNofc0
         L20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979233; x=1729584033;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eYiRvYKu246G9ujsFMWvz+U1B3rbqqeExJHjCPrbWvw=;
        b=sY/hs2Y9a+pwrK4D80rd2p+CK8FGiFXuMt7zJ50vuSsbwsVP0HXu35oaiIByChol6b
         oDpXnV8/HsiFlJrcQsQP6V+mzu6Qvl9sIDLxZWBaGGxdxc/xcuFkg1nPWPzsQ68hddwR
         gQKqu7ldLZs2Q9/xPizeRocDOuOyZl9OTCf24O+TWLO2PMjydzkLWfgQ+1Kse9ws9Uo7
         o2NLLwMXx4WnTs99TbWjCuVaPo0aMtYKdbYcWAs2L320nTuwCP1eOMJcSe5L6dR7OKXi
         0coTA1g2cGf3prDBEsOpDflazWl9/hTE9oGgp8wWDKLGafhr1oktvmfeODh0h9GOuxWV
         aiFg==
X-Gm-Message-State: AOJu0YyFhT2emc/HT6ibQchsGQNvw/lIAhQPc9Hl9JTDnS9VFwqgombi
	L9ULd9TyvVDRg2Rsd92Psqqmg5U0KeYXq6q02xqjmyJU9L+A7oVAfqqzeBoPHro=
X-Google-Smtp-Source: AGHT+IHOOxfJKqhpnvBoCS4y9r37L9ZgcJ2sRqayTaryxTNxiiWLnJ7xSL1RxdxVDQYnCJQSnv2Ywg==
X-Received: by 2002:a5d:5683:0:b0:37d:4517:acdb with SMTP id ffacd0b85a97d-37d551d5689mr10172237f8f.20.1728979233009;
        Tue, 15 Oct 2024 01:00:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e686:73e1:36a8:3467? ([2a01:e0a:982:cbb0:e686:73e1:36a8:3467])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa96357sm895720f8f.64.2024.10.15.01.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 01:00:32 -0700 (PDT)
Message-ID: <6ab72cbe-abf2-4c2d-acdb-a11c61df11b5@linaro.org>
Date: Tue, 15 Oct 2024 10:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 09/10] staging: media: drop vb2_ops_wait_prepare/finish
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <20241014-vb2-wait-v1-9-8c3ee25c618c@xs4all.nl>
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
In-Reply-To: <20241014-vb2-wait-v1-9-8c3ee25c618c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 17:06, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>   drivers/staging/media/atomisp/pci/atomisp_fops.c          | 2 --
>   drivers/staging/media/deprecated/atmel/atmel-isc-base.c   | 2 --
>   drivers/staging/media/imx/imx-media-capture.c             | 2 --
>   drivers/staging/media/imx/imx-media-csc-scaler.c          | 2 --
>   drivers/staging/media/ipu3/ipu3-v4l2.c                    | 2 --
>   drivers/staging/media/meson/vdec/vdec.c                   | 2 --
>   drivers/staging/media/rkvdec/rkvdec.c                     | 2 --
>   drivers/staging/media/starfive/camss/stf-video.c          | 2 --
>   drivers/staging/media/sunxi/cedrus/cedrus_video.c         | 2 --
>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 2 --
>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 2 --
>   drivers/staging/media/tegra-video/vi.c                    | 2 --
>   12 files changed, 24 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index b180fcbea9b1e6909cf3b6c2cf165684c6cf8667..50c4123ba006648db38c1e310bed4697d49615e0 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -441,8 +441,6 @@ const struct vb2_ops atomisp_vb2_ops = {
>   	.buf_queue		= atomisp_buf_queue,
>   	.start_streaming	= atomisp_start_streaming,
>   	.stop_streaming		= atomisp_stop_streaming,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   };
>   
>   static void atomisp_dev_init_struct(struct atomisp_device *isp)
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> index 305b103153d7edbf0cdae70fcbb0b6c14432a975..fb9ee8547392b4ee768b39ce08f52488323bb6f9 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> @@ -477,8 +477,6 @@ static struct isc_format *find_format_by_fourcc(struct isc_device *isc,
>   
>   static const struct vb2_ops isc_vb2_ops = {
>   	.queue_setup		= isc_queue_setup,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   	.buf_prepare		= isc_buffer_prepare,
>   	.start_streaming	= isc_start_streaming,
>   	.stop_streaming		= isc_stop_streaming,
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index efa7623b5cee1bbfa77654ad2604758d929a2045..e9cef7af000a91674aa2cfe750a399cae40ff9d6 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -768,8 +768,6 @@ static const struct vb2_ops capture_qops = {
>   	.buf_init        = capture_buf_init,
>   	.buf_prepare	 = capture_buf_prepare,
>   	.buf_queue	 = capture_buf_queue,
> -	.wait_prepare	 = vb2_ops_wait_prepare,
> -	.wait_finish	 = vb2_ops_wait_finish,
>   	.start_streaming = capture_start_streaming,
>   	.stop_streaming  = capture_stop_streaming,
>   };
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index 95cca281e8a378c6244bd25d5b81c392712361aa..e5e08c6f79f222a86fbe528d84d5e9644fbbb63a 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -572,8 +572,6 @@ static const struct vb2_ops ipu_csc_scaler_qops = {
>   	.queue_setup		= ipu_csc_scaler_queue_setup,
>   	.buf_prepare		= ipu_csc_scaler_buf_prepare,
>   	.buf_queue		= ipu_csc_scaler_buf_queue,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   	.start_streaming	= ipu_csc_scaler_start_streaming,
>   	.stop_streaming		= ipu_csc_scaler_stop_streaming,
>   };
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index e7aee7e3db5bbdb8c0cb555e5d2a5c2e4ae0c161..ad6095bf717db6d3fc1cd19112884248a6b04fce 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -937,8 +937,6 @@ static const struct vb2_ops imgu_vb2_ops = {
>   	.queue_setup = imgu_vb2_queue_setup,
>   	.start_streaming = imgu_vb2_start_streaming,
>   	.stop_streaming = imgu_vb2_stop_streaming,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>   };
>   
>   /****************** v4l2_file_operations *****************/
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 5e5b296f93bab4faf01f1e4238057e072e540680..52185090129ba5a5c5f3d7747f7d00268375aa33 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -450,8 +450,6 @@ static const struct vb2_ops vdec_vb2_ops = {
>   	.stop_streaming = vdec_stop_streaming,
>   	.buf_queue = vdec_vb2_buf_queue,
>   	.buf_prepare = vdec_vb2_buf_prepare,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>   };
>   
>   static int
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index ac398b5a97360446672a8a5c40ea05bcf222f557..f468af64bbef1c7e9019352508f95f5e2d2a083a 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -617,8 +617,6 @@ static const struct vb2_ops rkvdec_queue_ops = {
>   	.buf_request_complete = rkvdec_buf_request_complete,
>   	.start_streaming = rkvdec_start_streaming,
>   	.stop_streaming = rkvdec_stop_streaming,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>   };
>   
>   static int rkvdec_request_validate(struct media_request *req)
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> index 989b5e82bae98fdbcec7b2b28f4a93bc7a8334f3..a0420eb6a0aa034fb0b1468951d84c8fe7bb1b56 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -321,8 +321,6 @@ static void video_stop_streaming(struct vb2_queue *q)
>   
>   static const struct vb2_ops stf_video_vb2_q_ops = {
>   	.queue_setup     = video_queue_setup,
> -	.wait_prepare    = vb2_ops_wait_prepare,
> -	.wait_finish     = vb2_ops_wait_finish,
>   	.buf_init        = video_buf_init,
>   	.buf_prepare     = video_buf_prepare,
>   	.buf_queue       = video_buf_queue,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index b00feaf4072c995b4e54ffa6c67bffe039be1f49..77f78266f406288cfd5aa666dd5e3409b5a770cf 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -570,8 +570,6 @@ static const struct vb2_ops cedrus_qops = {
>   	.buf_request_complete	= cedrus_buf_request_complete,
>   	.start_streaming	= cedrus_start_streaming,
>   	.stop_streaming		= cedrus_stop_streaming,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   };
>   
>   int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 0eea4c2c3627188cbe0de74839e37835fdfdbc35..24899f41dc1c12dbbe43b01d176b4ec9ce287f06 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -368,8 +368,6 @@ static const struct vb2_ops sun6i_isp_capture_queue_ops = {
>   	.buf_queue		= sun6i_isp_capture_buffer_queue,
>   	.start_streaming	= sun6i_isp_capture_start_streaming,
>   	.stop_streaming		= sun6i_isp_capture_stop_streaming,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   };
>   
>   /* Video Device */
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 53d05e8a364bb7ed060a957034ef28ef91209fd1..3d95ed0b023e314ae189d20747868b962278b14e 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -379,8 +379,6 @@ static const struct vb2_ops sun6i_isp_params_queue_ops = {
>   	.buf_queue		= sun6i_isp_params_buffer_queue,
>   	.start_streaming	= sun6i_isp_params_start_streaming,
>   	.stop_streaming		= sun6i_isp_params_stop_streaming,
> -	.wait_prepare		= vb2_ops_wait_prepare,
> -	.wait_finish		= vb2_ops_wait_finish,
>   };
>   
>   /* Video Device */
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 57a856a21e9013e5b179e45e42a4512ff466de0a..ad481b35e618a0b0e85af7276d84342440b82e64 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -287,8 +287,6 @@ static const struct vb2_ops tegra_channel_queue_qops = {
>   	.queue_setup = tegra_channel_queue_setup,
>   	.buf_prepare = tegra_channel_buffer_prepare,
>   	.buf_queue = tegra_channel_buffer_queue,
> -	.wait_prepare = vb2_ops_wait_prepare,
> -	.wait_finish = vb2_ops_wait_finish,
>   	.start_streaming = tegra_channel_start_streaming,
>   	.stop_streaming = tegra_channel_stop_streaming,
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for meson/vdec

