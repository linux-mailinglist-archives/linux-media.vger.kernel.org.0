Return-Path: <linux-media+bounces-45276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2EBFD431
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 910333584F8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CF12C08BA;
	Wed, 22 Oct 2025 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tOujWUAf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C4277CA1
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150118; cv=none; b=DDn0mnqeZoZ/qLxSiZdNMhRBFy4fuQISo649ayKwVRonGZt5p8yfKL716vEbR55iH94vyjZHbbkMH/2ktKkQ9xUvOnygxOVYGMDPlrgXvDxjEkeJvNncBuWOcW42sI75CarNJrzXHH4mJSrDm6oR0OTYi8D70QrOKUfDsCfjQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150118; c=relaxed/simple;
	bh=dSd0eofZC3/Gkt8gKUfgpf0S2itiPDG3Tf4+Ys4dvXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlDIAZofqi8wBnI6OS3T7HLBZ2hdHqL/uLuAaoy0PDfeooDBtYnbDMvBkGizIJ9E1Hh5wfL0K8ok/Qze62i0dzLBK6DaOjwRgRHAH2LrGVp6wA/ts7wb7Gi3ZNNQp43frYnt9+Y4ogu7uT5+nucgNajOJTTpKyRQMX4zowU4NVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tOujWUAf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c3d913b3bso9655412a12.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761150115; x=1761754915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=tOujWUAftPmFCw7qcVsMKHt68AtzSB2LIu1Su+CiaLFq/1hoVGJAwOpU5XZe8Lwe85
         JcskquNycN9Yvu2OY2Xjdv/IUKXGQAZ3OopXqvgLZeVfvypEL7szoCIWYpXwvZwm4g+E
         uMu9VxXW+4ByoTuv8Ibi5eDXRDIVgtDBXqqeqziBVB2KFAvVFMaifhlQ79deSTpyATCg
         arzxJgCIuZzuqHyEflXgq9O4E1sB3qTKlfMO7WUy7b1Y/pWvT5ZGm1p6qtsY3NM2ZVFg
         fwJsh/xnKC374v5uui4aQf+1Jke4z/Y3g7pxDTGHhP+bztNHEWfINEOlFP9J6w23vcr4
         t8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150115; x=1761754915;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=B1SjXD4HvlwEnPeGL7lKzkXv+d0EyZPA20aXDsU7QmDdeQ+E0wNJRx5DqkJBUvuYTR
         Dl93sANSHLfc4XZOCQ6+CJvA5hZV0AFnrfl1WRGC/zlVtH7YPNIyAuYGvzmTYrs3Bs5F
         kPjmQxyMGazK0YfjplyXhtL1Cy92LMwyJLUF1I0SLYu2M4u2GzkOlnheyVSh5O9vPYfo
         Br9gMiynTPyaf2Vw8/alsjhqMJ+cv3ZFDS+GOMuLt3ioWT0owpvCYJdR9jlowB5i2HWf
         o4VKc9phzWrhNQoaIdNE+r6pcgW1h/Fh+bg+emQb0avWLLHp0zYaghKUmKvp86OzSp1Z
         Lwzw==
X-Forwarded-Encrypted: i=1; AJvYcCWvug8X71yqP68lop0rk3fA+03vJiwR7MOgRTakGfXMfU31V+LhZWQEmm8SZVbjIzQVwI2AzD5eNe6yXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfgZAz5yIkR8QidddSkx8MBMcUV7uj2A1Ju3Ki392RQdvnSvE0
	l+dlf5jmgqpUQOMC5miEAsPvZcRc7aTrDPuY9PrnD99xCee2T+Lzgw7VtEza5+Xd7zI=
X-Gm-Gg: ASbGnct2uvl8X10F453TVMBdhYVc6aFkSSwqmd/PpNRfU0wPUslmS1UVFw6BUkc0Kjd
	OGQqQFUsfdSq5X4ZZhN0r7XWeX31WKO73UnNhs54Z8nYJsMeQAoMXJlb6jSNSwswDOBEfr1gre8
	LYOHNpLhB+s0EsEHS38AuK/2Fk9rYcFdJSOVz42qG6XraUMys6xYuJCuzD/6LBBLB+tQB1ebTr5
	pecBXACQbzrFwKeRUTcOBnni5gCuea8kn5uibiffS0emdq4XNw1mh0I/pCqoIDockgEPOLfPO+u
	TaVNVmeCx1CbiAoXhgnIs/TxGeGWD+gyVsdrSk219PQ2kklVtJTnDT+ES13Gm1Ony8Ysq3stCZI
	wdCspMHQdPo5yAP+8O48XM9RihYw5ps8oObHyhTEv6MiMyp+vvPyG1q/dNXSD/fodZq2xUJc+qr
	Bv/WLkbxptOOmmQGqWvvHbG6SGnqZdwsWFBSnq1ioHTg==
X-Google-Smtp-Source: AGHT+IGYChwhuUEGPVHCLuRk88XLXPKT4H0pjkSRx8SDm4X53gF3hPcQE6y1DcQp5mZdYfFKZ8VvaQ==
X-Received: by 2002:a17:906:ef07:b0:b45:33bb:24f3 with SMTP id a640c23a62f3a-b6474f182f1mr2501488866b.44.1761150114810;
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1ba1sm1377700166b.14.2025.10.22.09.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Message-ID: <5ff5bda1-246e-406e-a07f-6ae7e8f468c3@linaro.org>
Date: Wed, 22 Oct 2025 17:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
To: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
 kernel@puri.sm, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <0k5cPW5X5XBAPEI-utRwsf6huR-TBzPWKNIFiDo0w8R8qHEtZDcBbkrDaG-ZSl7Hts8VXGVOY_F21eKS0lIcQA==@protonmail.internalid>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2025 11:22, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
> 
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>   	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>   	csis_fmt = find_csis_format(format->code);
> 
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;

The function you've added can return -EINVAL;

Isn't that a fundamental error at this point ? It would make sense to 
trap -EINVAL and refuse to go further.

> +
>   	ret = mipi_csis_calculate_params(csis, csis_fmt);
>   	if (ret < 0)
>   		goto err_unlock;
> --
> 2.43.0
> 
> 


