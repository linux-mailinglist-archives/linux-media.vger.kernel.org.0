Return-Path: <linux-media+bounces-44078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1369BC8DD0
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019CD1A618E6
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87B2E03EA;
	Thu,  9 Oct 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UhcDCo/V"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2E2750E1;
	Thu,  9 Oct 2025 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010093; cv=none; b=JkXWavYI1nr38OoCW3xE5FgkmMfWr/1IzWyeRtM+mPawIUUV67DCugIhzcAT0jKTe7g4r6vS+75vPUaVAGtakPjzVsSdiS4irYXf7/UHbTig1DMYokzY3RtSuKM8YUDuQEbGjTiHE4TXER8alDcqUwJwbrz8Po8Aa6oIOvx9OdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010093; c=relaxed/simple;
	bh=J6gOtlXNGiadx1WV9Jrsfa9A9Mo7GEanyAvz8BWuZfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMWh1W1XrZ4DT5Ykf82l3rxkhN6Qyu4KzTA1hYXi5vdkQo7paRNKxX/FIjFzYmGmYn/jskhbT+hfuSEyIi0McbF0Qit5yaPgtDPuxXX92dYiFMr4t7fOvpkWnq2DE/y07w2afkjM1Ps+ilyZNN+J+DnwZjmsQ6souNhTA7Jgtrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UhcDCo/V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760010089;
	bh=J6gOtlXNGiadx1WV9Jrsfa9A9Mo7GEanyAvz8BWuZfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UhcDCo/VFw8EUeX1askLaZJwGhGmzayOECoCTQAA+mbSvRoMXXroPrLvNH5qJpgwP
	 kLbBG5Az1XLGWkRh7gGcB/KsOgRB03/Yd70YwobnJPGeqXyifcNWQYfsswsyqjIkg5
	 92e95GjlMMqLWysVaZEsYYKeaoZjw6CH9mmcwAnlpdQ34+i8e+6fl2AgAa5agnNO4M
	 k7PbDB5JqdcRyNjr9HzCvLLahDKAQoz6ryFPZvjGy4+IVhmmIakoRrPY0xR887d07v
	 Xv3DSx/v+FyQdOolGjE4C+ItL6S6GZx44Q6+/EsZeNRynx9hp8cF8+u+5qsGwzn4CR
	 YCth/5VZ/s6Iw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94FBB17E0A30;
	Thu,  9 Oct 2025 13:41:28 +0200 (CEST)
Message-ID: <6f1f74b3-ac2e-4ea6-abce-14ef12ea10dd@collabora.com>
Date: Thu, 9 Oct 2025 13:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/20] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-13-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-13-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> To support hardware without subsys IDs on new SoCs, add a programming
> flow that checks whether the subsys ID is valid.
> 
> If the subsys ID is valid, the flow will call cmdq_pkt_write_subsys()
> and cmdq_pkt_write_mask_subsys() instead of the original
> cmdq_pkt_write() and cmdq_pkt_write_mask().
> 
> If the subsys ID is invalid, the flow will call cmdq_pkt_write_pa() and
> cmdq_pkt_write_mask_pa() to achieve the same functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 12 +++++++++---
>   drivers/soc/mediatek/mtk-mutex.c |  8 ++++++--
>   2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index bb4639ca0b8c..0c324846e334 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -167,9 +167,15 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>   	u32 tmp;
>   
>   	if (mmsys->cmdq_base.size && cmdq_pkt) {
> -		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> -					  mmsys->cmdq_base.offset + offset, val,
> -					  mask);
> +		offset += mmsys->cmdq_base.offset;
> +		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID)
> +			ret = cmdq_pkt_write_mask_subsys(cmdq_pkt, mmsys->cmdq_base.subsys,
> +							 mmsys->cmdq_base.pa_base, offset,
> +							 val, mask);
> +		else /* only MMIO access, no need to check mminfro_offset */

nit: fix typo -> mminfra_offset

and also it would be nice if you could also say in a comment that all GCEs support
write_mask_pa() without subsys, but it is less performant - so for the platforms
that do support it, we prefer using it.

Of course that has to be properly reworded, but that's the idea anyway :-)

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +			ret = cmdq_pkt_write_mask_pa(cmdq_pkt, mmsys->cmdq_base.subsys,
> +						     mmsys->cmdq_base.pa_base, offset, val, mask);
> +
>   		if (ret)
>   			pr_debug("CMDQ unavailable: using CPU write\n");
>   		else
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 38179e8cd98f..9b22d7e09d99 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -990,6 +990,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
>   						 mutex[mutex->id]);
>   	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> +	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
>   
>   	WARN_ON(&mtx->mutex[mutex->id] != mutex);
>   
> @@ -998,8 +999,11 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   		return -ENODEV;
>   	}
>   
> -	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
> -		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
> +	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID)
> +		cmdq_pkt_write_subsys(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
> +	else /* only MMIO access, no need to check mminfro_offset */
> +		cmdq_pkt_write_pa(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);



