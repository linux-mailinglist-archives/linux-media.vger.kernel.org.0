Return-Path: <linux-media+bounces-29383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C592A7B9A4
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 11:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E3D1778F0
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED761A3149;
	Fri,  4 Apr 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="E44qa2+1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3711C68F;
	Fri,  4 Apr 2025 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757858; cv=pass; b=WIvawIYmtFbJCdLfaJ+CaG+ZfUjW6Ln/7gs5Qut3mQnvAuRfRt1MhnuDPDrV2h9XYzGBcDpSpYMzLDcOXOJnPTuR5XMmjTmDQuDJ50YZdaBdlA3eXhrTaxOY5Xx94kHBwOZsyvs5ZK9QSKvTMy8KXwdsPslrUSGNkFoauMI5kkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757858; c=relaxed/simple;
	bh=CeoWnqKLX7CR9OiKGTeTIa5UuDAMEp9+9zthQZ3BQ2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D48GH6rBK6/xiai+/VVUFnCYmw+LJDE3UiCjepw7uKK6U8UJyZYZA3t4OWvhIWOOvzasLY5fca2z2JylyXIZlpAHpOk0wgGIvjNr1T02tMLx3VjV741WIPZd9NGHTbQWxAB7qxMBO5R7H/Usp8TdEfoYMlVF/+uET8fQUlx3KHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=E44qa2+1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743757830; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUShNtcKP1QxHgS4zTd/vp7ntLnSv7ce/K//cMKvdkE+oeS+qBHF7vuMBBWk8Uw4iK1EqD7l/fOn+KFpR9s4HREZ9mrFHyaq/TIjq9Aj24C1zjQunajzXJ3piXyyLNDAmfVjXd+paiG6lDNsIuoA6Anp73qbGEe8oqjA8yKvyPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743757830; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V7vYC1DmOY7g/IbhaQA2XCL8pgap2RluhVGOxgHTG9M=; 
	b=laSlUDswAfoz779JiV1FURK9iKl0vfezQNSgAe3e5nTU+9mZW19jKnIPeU5NOsjljlV3e3u3uHj+W7MyrJR7HaY0MKwQ43/GanaCdVQM0t+OuzRiUim42ZSZ1NQAc9zZcIe3XoCpIMEzgaoOPc7SoulFJb+l5ZbJR3aCqBgiW38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743757830;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V7vYC1DmOY7g/IbhaQA2XCL8pgap2RluhVGOxgHTG9M=;
	b=E44qa2+1o1cOfxADZeHmQ/I6MSeEi+WlMmoO+Hbbt8vFwQdzCKSQatPq4tBP/hjx
	IrtF49UKs5kx/TU5k7GStPdlySyhxwxMOJoztqymr/CK3mVKRLQsCVWP5DeLojEdCoU
	TkYJhh6rYuPjnhxp1AcBHyg5g2q6GX47CiqA+qQk=
Received: by mx.zohomail.com with SMTPS id 1743757829476256.0475616658215;
	Fri, 4 Apr 2025 02:10:29 -0700 (PDT)
Message-ID: <133924c6-57ca-47ed-9e32-87b75b975f1c@collabora.com>
Date: Fri, 4 Apr 2025 11:10:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: Enable wide 4K in AV1 decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250403-hantro-av1-wuhd-v1-1-334629cb7f63@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250403-hantro-av1-wuhd-v1-1-334629cb7f63@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 03/04/2025 à 21:07, Nicolas Dufresne a écrit :
> Tested on RK3588, this decoder is capable of handling WUHD, so bump the
> maximum width and height accordingly.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks for the patch.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..b64f0658f7f1e77b3efd960b35cd54dec4edf4ef 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -85,10 +85,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   		.postprocessed = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -99,10 +99,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   		.postprocessed = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -318,10 +318,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.match_depth = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -331,10 +331,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.match_depth = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -344,10 +344,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.max_depth = 2,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
>
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250403-hantro-av1-wuhd-11e2cf5be1a4
>
> Best regards,

