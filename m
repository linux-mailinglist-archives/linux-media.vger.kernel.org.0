Return-Path: <linux-media+bounces-12762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D59009DE
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 18:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A28286583
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 16:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF54119A28C;
	Fri,  7 Jun 2024 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDOUUGK9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59819149E
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776298; cv=none; b=aE7+qr2DNJbBbc7E6IYfl2Bc7wnUv7av6mVLI467FCSOOybnGR/1UdYbSMj3JlLWGKCkEuFUeO6JA2VuEMEQEeiYarooPnS1y2rMyQIyv9UMbkQO9rHpskFzc6hfdtwsZJbMGKEbj4PJDibKxF7oFdLCl6asuz3l0FFK1RKl8yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776298; c=relaxed/simple;
	bh=XF3f6iDBLjVh6WynPeig0UvGb0DigkwMdfgbk338+B4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ZVKWRbyHchZ9fouPhs+9Iyb7yP/5KmCYsulDybTnj5P29RS/LQN/Px2Ra4MCe4WiylMv4yW43ybEkP9gbQZIoRf34M98+GN9HliTFLCOfp/kE47+ICiK2lQ+xdkKaUZhy//rkhLuDZbuaawfXMp0vEXxX/dF9ZRkadAyU3GPxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDOUUGK9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dce610207so2602643f8f.2
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717776294; x=1718381094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=tDOUUGK9tq/s8sYsF70IoMxp6R+mc+gFfiEnYCisO/IIXHQkVDAol+NWt4SDv3KeGn
         cFIWDyMlBbbY5UNLh0lGodttXCC+ILpsDFTVf0vIG89OTNkseSgXskkGt22rYqXKJdwF
         ZuytdG5rHUZ7luYRPgwbauaV92un0H4vlDQp1UW5izvmCRdZf3j6XwywIYi+d5fdz0Oo
         QQFmD53YrWTNdRMSeFAfr0KuH8x2BMdEJi8+DjKvUX+x57B/a4HM75o6RDGmTkoFq1w7
         K0VFHefdMGsMJCVRNz9B4ot+jUlnH7m6qksDn7ofz7UDLr7IYCny1z6sEJ6Hj1AhByew
         fBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717776294; x=1718381094;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=lPSHhFGkaFZmRoKsuSBL7/F7v1c6sqKuJNRMk5Rh/K3IYNVULYnm0fEYUY/GqbOfve
         P0mC1q1UV14yzv4xmdl2r/mS6KIcDDg2a0qzCLH8eg+uKjmSdmGj4QAFr8sIjsZLImxa
         9VzZPGxSMwTxS35eqOgkoVYEdf5MChrdF7DCjpNXG7HIc3LBMR4bL3Hi4ty1lhJRqQlT
         gUY8BcS9yamBRRsFTKqOo4iQ1R1IM7zxnKKPCEFYbhYVauSKV1ulmFnk4nbfquVFgz3b
         PviD7m/MAA+MRUlqGtDGIWLBMP6chTK/0E03dM4NiO3r0O2HxzLIT3ZjOgpuiDDDYHoG
         enDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtL2hTJa0OToZjo5msltE/kVzsNfUUQTAZnfU6NTuhUfGTR9xTx5xg/Nv4pDeDpuIQyyTgpfKkGT1bCTZYeCpZeT7MyXbUUlA8KU4=
X-Gm-Message-State: AOJu0YxlGR1ZWcTiWfEybG6cePAfofA138oL8gquRHTsQgBz9HTYCpwa
	hovPZqlDYObfi3Z4n12Ivrwcqdw3BN7l0+So94tTcytDukgo7aItK048hR0larg=
X-Google-Smtp-Source: AGHT+IEU8HYa3hCTxSSYayUA1arnljkwYr7GSlFCw5TxepPqNeXLrtFb+yavJ0gq5yYhVjrRMVV3Lg==
X-Received: by 2002:a05:6000:50:b0:35f:d60:f183 with SMTP id ffacd0b85a97d-35f0d60f2c0mr1006174f8f.24.1717776293576;
        Fri, 07 Jun 2024 09:04:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f094fbf3esm1392894f8f.77.2024.06.07.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 09:04:52 -0700 (PDT)
Message-ID: <94773a91-a845-4821-a6ee-a0be93ea49d9@linaro.org>
Date: Fri, 7 Jun 2024 18:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
 <20240604051533.3312944-2-christianshewitt@gmail.com>
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
In-Reply-To: <20240604051533.3312944-2-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2024 07:15, Christian Hewitt wrote:
> Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/vdec.c       |  2 +
>   .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
>   .../staging/media/meson/vdec/vdec_platform.h  |  2 +
>   3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index de3e0345ab7c..5e5b296f93ba 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
>   	  .data = &vdec_platform_gxm },
>   	{ .compatible = "amlogic,gxl-vdec",
>   	  .data = &vdec_platform_gxl },
> +	{ .compatible = "amlogic,gxlx-vdec",
> +	  .data = &vdec_platform_gxlx },
>   	{ .compatible = "amlogic,g12a-vdec",
>   	  .data = &vdec_platform_g12a },
>   	{ .compatible = "amlogic,sm1-vdec",
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 70c9fd7c8bc5..66bb307db85a 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>   	},
>   };
>   
> +static const struct amvdec_format vdec_formats_gxlx[] = {
> +	{
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.min_buffers = 2,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_h264_ops,
> +		.firmware_path = "meson/vdec/gxl_h264.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG1,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG2,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	},
> +};
> +
>   static const struct amvdec_format vdec_formats_gxm[] = {
>   	{
>   		.pixfmt = V4L2_PIX_FMT_VP9,
> @@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
>   	.revision = VDEC_REVISION_GXL,
>   };
>   
> +const struct vdec_platform vdec_platform_gxlx = {
> +	.formats = vdec_formats_gxlx,
> +	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
> +	.revision = VDEC_REVISION_GXLX,
> +};
> +
>   const struct vdec_platform vdec_platform_gxm = {
>   	.formats = vdec_formats_gxm,
>   	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
> index 731877a771f4..88ca4a9db8a8 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.h
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.h
> @@ -14,6 +14,7 @@ struct amvdec_format;
>   enum vdec_revision {
>   	VDEC_REVISION_GXBB,
>   	VDEC_REVISION_GXL,
> +	VDEC_REVISION_GXLX,
>   	VDEC_REVISION_GXM,
>   	VDEC_REVISION_G12A,
>   	VDEC_REVISION_SM1,
> @@ -28,6 +29,7 @@ struct vdec_platform {
>   extern const struct vdec_platform vdec_platform_gxbb;
>   extern const struct vdec_platform vdec_platform_gxm;
>   extern const struct vdec_platform vdec_platform_gxl;
> +extern const struct vdec_platform vdec_platform_gxlx;
>   extern const struct vdec_platform vdec_platform_g12a;
>   extern const struct vdec_platform vdec_platform_sm1;
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

