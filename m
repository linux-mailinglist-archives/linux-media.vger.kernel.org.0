Return-Path: <linux-media+bounces-46032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 486ACC22CB5
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 01:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C52F4E9132
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 00:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C67253F07;
	Fri, 31 Oct 2025 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/iPZChc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3411E5213
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870672; cv=none; b=ZxaWSY2E23NqgJpQp/0w9SUeeE681faqvYHagOAMCWdz+8ShzhcIqVBJfRdpgXVhLVDpb8WXHpKj5+VNGOWez2GaAMLfsRegPMjCThDNUlzpRTnGGGqu8pg4EvY6ytagcogzENjN+rNNEnn5RPI0A3M2qLQOjFgMUR0JBgxqG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870672; c=relaxed/simple;
	bh=KMzDRKv5vA7T7CtnN1YiylERwCfSkYzsAuzyPy6DuS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+foGtEOwbjghd54o014mHfE2cVqGjHI25wwq0UKop5Bv6rOm6SbOe1tUZrNU71vPLkxqsMDoeJeb7PTBhRKpxHCiZJjj7kqU2h7B2hx0qV/8SVXsOuARmgYe4nHuMlAAnpWYvpdSs3Ak3H2tj+5jOurwyZQxPX7pqYWwFXcqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/iPZChc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4771b03267bso11412295e9.0
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 17:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761870667; x=1762475467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQyM+gpE1/R8XB7auHos6sn8eyFYyrQM/uv08lULwXc=;
        b=A/iPZChchR43f4h7UeGjo2dAGs1KBe9fc6oP9w6W1oJWCBBQXsxSdpyugvLTzY87sk
         O9NLOvtYWWc/DIMaW1tqBhPTT1IlBOTtIa4yN26p0DdX1nNrIv5Rz87en4leoeYGnEBp
         EEr1pD+kpp5zVxE3VEw8WimXA9P6cpC9fZ0o09+ftNbWp6KPgskct2DpcX9KnXag4/9f
         od47Zd2y0CZ1P0LjxruKRAg8M8fIKFxzcDJAItnzZ8K6DytU0LNc31X1pB93HT2RW0Qd
         Sw6MeqLR/qyP/UPR27hl3ngZppBGc6M+iUoGRfFBHVK8P8pCglwIJxk57pYYP4bFsLZ+
         9NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761870667; x=1762475467;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQyM+gpE1/R8XB7auHos6sn8eyFYyrQM/uv08lULwXc=;
        b=KgBs7IpCpSxni77FKHULK4ESBR8omi2VkX17PYYSKztWpwTZjMQdIxN5yfe86xPxkU
         a0Vevs7gxpqNP7qHX0ZZ1Q44V/BR4z3npltT192+8zAtswwRKzlX5baVmAvBbK1/v1qg
         hOw1QMkzQ39EEcNdIzRHeYDXd1i/LB4BvzSPQODqjDQp8UFEv0CshhsGfjjBRNxYpsXs
         EdJHzF1dXFs/sEQJwTjpMhXwD46WuTkRoWhrDpfr29hP8WathKHBOLiIOxExpPwGjv1z
         Ir9fhfFvgHbd+kdrhRK+YymzE3Pv+GGWXUIcdwtx3yuuZpUQo6m+ZjL7+PEIxB4ue5Qy
         mdNw==
X-Gm-Message-State: AOJu0YzoiAJ/NVn+HGSpj7gsJv8Ff7o3hoxpYcvzdiic0cP1/geBUWWQ
	TBC6Qn/4lRalZJz9djTs/TbcpnhT+KFOyXyseUFNLLaEKDO852oGFRI5BDpq3m1PX9I=
X-Gm-Gg: ASbGncvWZUoxFw8Mhz5Js4neqEAN1ibmJ6rD/LFf6Nb4LHEHeb60AMg5y0UfiNQ4CDL
	GPNppM9zgjPkpXQ/LKWWTqkuP2fIaB+FLR4AF5dTIA7O0iv08auC+rQf6aKNBKtaNXJuC8F05wk
	Ras9cICjfRHUrn3+keWA1WAuRTYlcsTXxz3xjwo34HdeKfTYs26ctAugx1jGokjM1RuVsnhaYdj
	gY/NPYKZ4xprxWzBbPBEpG6+shKAYje24E7iFU8O6yM8C+2QEovXNckNH54oNFGypYSbUinsnOa
	WZg5eyZO9FFDQfGrOz2yYq3Ek8K8UZ9SnGOBVi83DrAPuaUWk2Cx5WApxksJafNzCAC9hpIaKcy
	AL2ZbIfQRZIgxCHkj198lebaj8DSoa3jwwCUEtvqMSiYpOiI2FOFKrCYTL6tppyEq5EUzjnzQnd
	qqRix1O8V0+GU9Jxe7GpUWfkE9ubS0ySoLyIe7lxQVofmBOTEhs9Vn
X-Google-Smtp-Source: AGHT+IHXcj8ihCaJ0joDQKKDFiMlVz4FGEpmj/DtV4mCnROhkUQEtdynsk+5jYqiPYBn1KFHIFfjeQ==
X-Received: by 2002:a05:600d:6352:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-4773163825dmr4196955e9.18.1761870667522;
        Thu, 30 Oct 2025 17:31:07 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e1d8bsm286786f8f.25.2025.10.30.17.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 17:31:06 -0700 (PDT)
Message-ID: <85217da4-3ba5-491f-a771-40c95a31f1f3@linaro.org>
Date: Fri, 31 Oct 2025 00:31:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <_CZHQqm9UaYWFVQTen8I6llGxozVDgeSVxCp_HGBttKghQ3or75NV-dfyGOXiKF-bPIDdgsTtNtKJjED0nko8w==@protonmail.internalid>
 <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 07:00, Deepa Guthyappa Madivalara wrote:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> Video4Linux2(V4L2) API. This format is intended for AV1
> bitstreams in stateful decoding/encoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>   include/uapi/linux/videodev2.h                              | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -275,6 +275,14 @@ Compressed Formats
>           of macroblocks to decode a full corresponding frame to the matching
>           capture buffer.
> 
> +    * .. _V4L2-PIX-FMT-AV1:
> +
> +      - ``V4L2_PIX_FMT_AV1``
> +      - 'AV01'
> +      - AV1 compressed video frame. This format is adapted for implementing AV1
> +        pipeline. The decoder implements stateful video decoder and expects one
> +        Temporal Unit per buffer from OBU-stream or AnnexB.
> +        The encoder generates one Temporal Unit per buffer.
>   .. raw:: latex
> 
>       \normalsize
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

