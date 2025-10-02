Return-Path: <linux-media+bounces-43659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1CBB445B
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 561E23A227A
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A191891A9;
	Thu,  2 Oct 2025 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGLhqHlj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09113A3ED;
	Thu,  2 Oct 2025 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417810; cv=none; b=T9Gb3Os+s7Rs9K+8VBbaJVFghrTtQFdi5HwNe5wj4vPte6dyTwHJH7JHBJkQbBtssu3UTLkPM/hTNPa2felibKghYbGpZTY8NqE38SuraunZ9BTb0bg/Sw+5g6chdlvKIks7xFgDNXO8OaEel8QqF4zKFOjo98x3/V3fluRIc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417810; c=relaxed/simple;
	bh=1aZuQfi+pZDD1ofS4Cuo2jicwE7//IUzb1S7RW+8ahk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QY7W5GiZAtlSVKUPEbcJeZLadT0MVniUm+Q4vFdCNFs1mkJHyBwZoACeWM0dye0DiAGz+07/YqckjuyOCRXhzWUcerey0JCLSiIp5Q5lITIPMd1sC157c8d2uTI9OLH7Eu/HRAsB8nM23HIYde78S0xmgPm8Ais/tHa3LyRyzy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGLhqHlj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019C4C4CEF4;
	Thu,  2 Oct 2025 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759417810;
	bh=1aZuQfi+pZDD1ofS4Cuo2jicwE7//IUzb1S7RW+8ahk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HGLhqHljOP+Hwrn5PI/mvp+KeGmQedh2CoeUeUF/CFVQDw45CcicBe4KgCZfVL5tw
	 rDTcUpCTji8nA3mcfY6pO10lcsAQbYYtAgUJ7rgdLJUyRBBUdQYi0RVPTcSnATjm9c
	 NdjqyHdpBhVkzLYbu64xrIbUmaVK6Niu8Vkn1R35VfLIcdMSTel31j1bdCm6k05LN4
	 JF8b0f/FyXMMG4l3NZct3oVbUMpRalerdxwIZclnmomUs1l+P0SnlO8+XoqBBhVXpq
	 2AFUl+UG45FNwXb13zF4JJxImW+lBfQwhOeYUyoxfsJA4U1up2/DX59fnkXjxdcuQl
	 5U5tJ+RHQxYqA==
Message-ID: <9b648a53-2847-4358-b1f0-46cf92918838@kernel.org>
Date: Thu, 2 Oct 2025 16:10:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <6coQBLcMhtSC05UJ1LeFI-ENB0OMl-7isRS0XM7D-NIAcFVw-PtV8TrY8xd6GM9-xI9zab6t5zOzKPzi355DgA==@protonmail.internalid>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:14, Vikash Garodia wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8650_data;
>   extern struct iris_platform_data sm8750_data;
> +extern struct iris_platform_data kaanapali_data;

I've just noticed, this breaks alphanumeric ordering.

---
bod

