Return-Path: <linux-media+bounces-29922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3CA8438F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BBFB3B153A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AAE2853F3;
	Thu, 10 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="Tf/s1+X8"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE873A8C1;
	Thu, 10 Apr 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288973; cv=pass; b=MTYp/d0iftcmGtLa0goRMhTzyXu2iHMp9FSzQ1xqQTTXxMIKh/rkSydmowzSiZOYQDDRw9PLIR1X9pqOlKmwHFJLy5Eds+1KCUu0qeaPH3mSTyVNk/hyjouBUbqxyDrQFpHoI1zvXvg5UrPD1AEkbcOVQDA9ggapMPOriSQAzdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288973; c=relaxed/simple;
	bh=sU//kxtjEYkB64O4MOhyUdqB3Mlw7wY6kPsELShGyvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p04TmiPYnksivGruAZrskLY9zZuqRxUPMNhEdKuTYSUxwCw3Ss3DeNRAQ8FGmWr7KcuYMW8lrk5S4V1DANisLdtCFxuDrh9trkSK8ihJvbfzMgt6R/lfmnNqL/hIq12BeM7jXG1gjfk0yG7Eal630iyh61+ujadhrNRhFHwauvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=Tf/s1+X8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744288948; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfhjdATU8F1Etf7PJl7wcbRgZisHzpzsl1zZUGvehI7rbOLqvqZtYtB8iNfpq6bYY3UXPB9I8QU2JPdcM8578gM/Q7Q0VqctSSePnMHjd5nl/k7DhqBVpLKbbDMKDIJR+s6HSjyd1pOoxkxrfC0hqoQsqLHJxt1Tg/15CT+J8Xk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744288948; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qZZP4FNK+HyNHl3VBHbY4FLuHj2CdEKhTPJZ5V5EDJI=; 
	b=RGa+omEExAXwm3HTIRr3CGaUv94lNhWmha+bTKQPBLQZdDt9nDL58F+85vdtZxg+ZqMiNzSOo4m58cZVWf+k9XQ35IrQtCL/jq3ufgNPOFnrcZYAHC09Qs4/RRZzNt8RqLdpyvT4fRpXqWKTRqhw3VsKXjq6+ofnC5H4qrxY89g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744288947;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qZZP4FNK+HyNHl3VBHbY4FLuHj2CdEKhTPJZ5V5EDJI=;
	b=Tf/s1+X82HlQOSpdb3XknS+1ycW8/ZXBTdpG1AcXIa62D43egli5r/bOXuYYGx3q
	o/wDu9gwN0+JFsMXh3YuM98zUuNCmtiMCumsL4zsMJkbjCjHGgKyIEhnewFjb26ehiM
	3XnA6YhxbTm2YvJa1ayGawiOL7i0UzKOf7E0+224=
Received: by mx.zohomail.com with SMTPS id 174428894677713.690566553537792;
	Thu, 10 Apr 2025 05:42:26 -0700 (PDT)
Message-ID: <c4dc7564-f985-40cd-9d37-4df4ee6e126d@collabora.com>
Date: Thu, 10 Apr 2025 14:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 09/04/2025 à 21:30, Nicolas Dufresne a écrit :
> This is a "customer" format, though on Rockchip RK3588 it has been
> verified to be NV15 format, which matches what the GPU and display
> handles has 10bit pixel formats.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_v4l2.c           |  1 +
>   .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  4 ++++
>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c       | 14 ++++++++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2bce940a58227c2bfef2bc3343992e4588ab36a4..7c3515cf7d64a090adfb8d8aff368f9a617f8c8a 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -77,6 +77,7 @@ int hantro_get_format_depth(u32 fourcc)
>   	switch (fourcc) {
>   	case V4L2_PIX_FMT_P010:
>   	case V4L2_PIX_FMT_P010_4L4:
> +	case V4L2_PIX_FMT_NV15:
>   	case V4L2_PIX_FMT_NV15_4L4:
>   		return 10;
>   	default:
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 69b5d9e12926fb408c08f8ba2139d05ba44389b7..e4703bb6be7c175a89c0b8868cf2eafb84a872ed 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2202,6 +2202,10 @@ static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
>   	case V4L2_PIX_FMT_NV12:
>   		hantro_reg_write(vpu, &av1_pp_out_format, 3);
>   		break;
> +	case V4L2_PIX_FMT_NV15:
> +		/* this mapping is RK specific */
> +		hantro_reg_write(vpu, &av1_pp_out_format, 10);
> +		break;
>   	default:
>   		hantro_reg_write(vpu, &av1_pp_out_format, 0);
>   	}
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..f7c4a176167b40fe79ec5a6759dff8a77e849ae3 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -92,6 +92,20 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   			.step_height = MB_DIM,
>   		},
>   	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV15,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_4K_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_4K_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_P010,
>   		.codec_mode = HANTRO_MODE_NONE,
>
> ---
> base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
> change-id: 20250403-b4-hantro-nv15-support-07def4e7a537
>
> Best regards,

