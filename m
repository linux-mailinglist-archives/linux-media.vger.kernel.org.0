Return-Path: <linux-media+bounces-26242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA9A38DD2
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 22:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D08E188B362
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 21:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302EA23956B;
	Mon, 17 Feb 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aW7ol2iP"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD9226545;
	Mon, 17 Feb 2025 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739826352; cv=none; b=bfEDdtbm6NfKFysW86QvjOkLS5TF07eacQuXju9VOHBsqjpcRdux2lWQSeEnwk5a7dkG2Kpkw8uvMW6yrW9oqfFOVYx5cK0WQayjY08Za71kKFbQ9EePQGCl/nXAVd2ZEAUiauYM50DlWTwLC7wiHhiqNRXLxbNhYA/6f0h8lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739826352; c=relaxed/simple;
	bh=xkZ5C4RRw8ad7q0dz3o/qbGl9MzaFXUgGSXYjVbtOWA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DFgJ7CPklGRl/Y/GXbEsEMqvibN9Sacgze8ajRvGvC2UFOjKD5PkL0VDjp2FbO1iWFbIf6oSbVH4krwtrRZPd2jmZ2m1274SyitE7oIC8oRnPs2TneXkYpDZJ8GlVd9m1TGDoh2yE5UVX8yjoGZJ3jQWOJPAMZJM/zkERXmEP48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aW7ol2iP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739826348;
	bh=xkZ5C4RRw8ad7q0dz3o/qbGl9MzaFXUgGSXYjVbtOWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aW7ol2iPEM7YU4BSPBprp8cFl+Z+UAF9wru33YLobNMb8LuCedfbT7PMVqEmzXoyU
	 Eclj16zUhqKuxwm3uLMCCys4gwKc/0i2pW+c4P90BPtmO+xoTL5XEvIge3ao9kQiNS
	 MgBIMevZaTq1raoHsKuPfBCfwlfg2xoCH1FgnLV+aUcggUynldsC7Eyqz5Yi3aUCxa
	 lo1Ofo/arQLiv05QrnCkiOuosBnspOrefc/NRapd23xkwCy6nhRsc+Qejg9NMBAcI+
	 neyhVGRHgcCMr/bd6B3C5xPxLUcRpA3Sw6TV+EBS6iiEz/6WYUkXc9vO09t5SvcRlT
	 2S0h2HA3zVlyQ==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85CC517E0391;
	Mon, 17 Feb 2025 22:05:47 +0100 (CET)
Message-ID: <83e0afab381fe2580e4c75fccc62cb7bcb546369.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Fix AV1 decoder clock frequency
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: stable@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, kernel@collabora.com
Date: Mon, 17 Feb 2025 16:05:45 -0500
In-Reply-To: <20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
References: 
	<20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I'm sorry for this bad send, please dismiss.

Le lundi 17 février 2025 à 16:00 -0500, Nicolas Dufresne a écrit :
> The desired clock frequency was correctly set to 400MHz in the device tree
> but was lowered by the driver to 300MHz breaking 4K 60Hz content playback.
> Fix the issue by removing the driver call to clk_set_rate(), which reduce
> the amount of board specific code.
> 
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> This patch fixes user report of AV1 4K60 decoder not being fast enough
> on RK3588 based SoC. This is a break from Hantro original authors
> habbit of coding the frequencies in the driver instead of specifying this
> frequency in the device tree. The other calls to clk_set_rate() are left
> since this would require modifying many dtsi files, which would then be
> unsuitable for backport.
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..9d8eab33556d62733ec7ec6b5e685c86ba7086e4 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -17,7 +17,6 @@
>  
>  #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>  #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> -#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
>  
>  #define ROCKCHIP_VPU981_MIN_SIZE 64
>  
> @@ -440,10 +439,9 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>  	return 0;
>  }
>  
> +/* TODO just remove, the CLK are defined correctly in the DTS */
>  static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)

Obviously that function is meant to completely go away, got distracted
and sent the old version.

Nicolas

>  {
> -	/* Bump ACLKs to max. possible freq. to improve performance. */
> -	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
>  	return 0;
>  }
>  
> @@ -807,7 +805,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
>  	.codec_ops = rk3588_vpu981_codec_ops,
>  	.irqs = rk3588_vpu981_irqs,
>  	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
> -	.init = rk3588_vpu981_hw_init,
>  	.clk_names = rk3588_vpu981_vpu_clk_names,
>  	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
>  };
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
> 
> Best regards,

