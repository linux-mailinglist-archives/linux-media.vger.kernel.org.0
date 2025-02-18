Return-Path: <linux-media+bounces-26266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE9A39779
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5250B7A4D0F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4216241111;
	Tue, 18 Feb 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="g1utORNB"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862723ED66;
	Tue, 18 Feb 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872000; cv=pass; b=Nn1Hf/ASDBMCSZRr/97VYw1zcqeFvSQkLs3RKLJ0rTpak0HaJFRig+EdOvZSUcwFVPjocAaSvRPHZaJ+tJwlFOBvO5tm216B4ypTPxUZ26an1L0uxk0NzTXfAhSdmLuDbRch5wAWBFoLr1eVbt7Djf9tEU0pT1GW8NASf4f4F60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872000; c=relaxed/simple;
	bh=oluM229+QkjMcH16tdElVipTqwxo4aGfq7njvhdh9y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoGaBmJTAb0P/pQ7RSQSz17dFerW92q5OGPPkDzuwtUW5EHpetPtmM0wb3d3pPdJ5Hd8k3diF+zryYDmQ5sY9/FDv0f1gAZGizGOl/iz87fX9DR3dqjEz/7LFjBIoh2yrzHusSBGSDxKQ1Er2geCInrJICvlkpgCp66GiaVcoaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=g1utORNB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739871969; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kEMoEGYx4odDVnsn3kMR/Xa8T58NL5/WmIxhiC1QmDbOw2kMQt/nIPfyAIekGWktvDCzSQAYuYhc5Abj436AfzGo5ngAIi5OCQ1jE670om64Fg/MjBH3P0wn0nzYUt5/m5cRmfADwsUCvAChuIJ8LczNcfwphDaeU3ImME8VvG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739871969; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q1RdT5eL57c25wsLGjqwv0tswd3r+m/iGHKhWU5vNkU=; 
	b=hLzq0fvMYDz4a5xxxexNYBS03rTRyJMvfImGjFHcBZXArSaI4gII1ayNbBOTGf9CaecoStJL/xfhCv2E69KTZGQtfvXuzjrABQJ5DT0E0ywS30UNAKqgSC9priy2c0ORkMYZGg0hpVISv8ZnwJ8TMHDFGsYFWAKuCRsFR/cih4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739871969;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Q1RdT5eL57c25wsLGjqwv0tswd3r+m/iGHKhWU5vNkU=;
	b=g1utORNBtkSzGH4AGRNSLNihyapmNrQnpoMzHP+cBeRE9eEU2ZqtKp7oQcMfGo+Z
	TrnTvx/ncakBtybvu8lPzOEs+C+Shxev/I0KWei9noHHV1ypPzapSK4ZLfPqC4uFpGI
	+MAtfsBQlcrdwxeylDkOd7Jtj9TnrOERFBINv/+E=
Received: by mx.zohomail.com with SMTPS id 1739871967704282.7054777678519;
	Tue, 18 Feb 2025 01:46:07 -0800 (PST)
Message-ID: <4a04b12c-8765-47bb-af61-c6b47133f2af@collabora.com>
Date: Tue, 18 Feb 2025 10:46:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: verisilicon: Fix AV1 decoder clock frequency
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com, stable@vger.kernel.org
References: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/02/2025 à 22:46, Nicolas Dufresne a écrit :
> The desired clock frequency was correctly set to 400MHz in the device tree
> but was lowered by the driver to 300MHz breaking 4K 60Hz content playback.
> Fix the issue by removing the driver call to clk_set_rate(), which reduce
> the amount of board specific code.
>
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
> This patch fixes user report of AV1 4K60 decoder not being fast enough
> on RK3588 based SoC. This is a break from Hantro original authors
> habbit of coding the frequencies in the driver instead of specifying this
> frequency in the device tree. The other calls to clk_set_rate() are left
> since this would require modifying many dtsi files, which would then be
> unsuitable for backport.
> ---
> Changes in v2:
> - Completely remove the unused init function, the driver is null-safe
> - Link to v1: https://lore.kernel.org/r/20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com
> ---
>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..842040f713c15e6ff295771bc9fa5a7b66e584b2 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -17,7 +17,6 @@
>   
>   #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>   #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> -#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
>   
>   #define ROCKCHIP_VPU981_MIN_SIZE 64
>   
> @@ -440,13 +439,6 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>   	return 0;
>   }
>   
> -static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)
> -{
> -	/* Bump ACLKs to max. possible freq. to improve performance. */
> -	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
> -	return 0;
> -}
> -
>   static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
>   {
>   	/* Bump ACLK to max. possible freq. to improve performance. */
> @@ -807,7 +799,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
>   	.codec_ops = rk3588_vpu981_codec_ops,
>   	.irqs = rk3588_vpu981_irqs,
>   	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
> -	.init = rk3588_vpu981_hw_init,
>   	.clk_names = rk3588_vpu981_vpu_clk_names,
>   	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
>   };
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
>
> Best regards,

