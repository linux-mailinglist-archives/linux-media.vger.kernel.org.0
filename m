Return-Path: <linux-media+bounces-45023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE17BF06D1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294313B1C95
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89E22FC870;
	Mon, 20 Oct 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ms6CiYVS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605372F1FE5;
	Mon, 20 Oct 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954694; cv=none; b=GgW+w5ptl3ktKTLw3xSqEKFhc+WtV2SQYSRc2pc/9fsuKA9hFCGQjWbN2EOCqgSVTxYXUkSEOhZlcIaMMN5DzYX625v30akNJxHlEjwdCoHtXC+WGzV1BAaEXjBlJlzycKcGxhHgnakJfOfrJU9gdLQ9UldjsGwtbnCPfYAKh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954694; c=relaxed/simple;
	bh=wvumRtQ3KWxNLuSCqqYpTqD88kqpmy34MP/x6Tf0kEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSSyGw8mzBjeIHEyqlvJBUdd1L7PXcozd4ADeIX974cASz9+qG86qTCOmxcNAL7eK0wYFJ2LtCzCEw9zvha7yT7/XhZgElNXhOiOnElNpcea8dAbfUumVjdldCmqMZ60mw3lEnSZ8Hez1ifdL6ozT2rbP86fpkkEaptAocBk10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ms6CiYVS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954690;
	bh=wvumRtQ3KWxNLuSCqqYpTqD88kqpmy34MP/x6Tf0kEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ms6CiYVST6M90q1cs07+V3lOwJ1cYQQ8Sk+nWwbFl6Gal5W+CbF3WAItwDCo9+v0K
	 SJ2wLYvWHDYLLB1RcKLmLbuDEA8CRrIBA++yJLxn9NXhnr1hEvCBIw9UE3tu4apvlQ
	 jKhC93BuucPPIN4WzrEuv/YOwjDjIIAAkG7VKi5/BhXv44Ak8Mxg1rx0oRswc0Y6Jf
	 QNpQeOBSlsCOp3zw5joRiHZ4jQULcKjOShxWQs98L4oGM1XO2Dz1hIOqqRZnIDDWmz
	 y7G4Hsi9cDZo52cZRL52ZaHWuIv2ba9fdo/N5E1dOW3z7NyJbTdWCJKE2EHEAx/CNY
	 ukiXDPayF6FSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB73617E108C;
	Mon, 20 Oct 2025 12:04:49 +0200 (CEST)
Message-ID: <24b74989-4e31-49e3-8652-c2439f368b26@collabora.com>
Date: Mon, 20 Oct 2025 12:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/20] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write
 API for SoCs without subsys ID
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
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> This patch extends the cmdq_pkt_write API to support SoCs that do not
> have subsys ID mapping by introducing new register write APIs:
> - cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() replace
>    cmdq_pkt_write()
> - cmdq_pkt_write_mask_pa() and cmdq_pkt_write_mask_subsys() replace
>    cmdq_pkt_write_mask()
> 
> To ensure consistent function pointer interfaces, both
> cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() provide subsys and
> pa_base parameters. This unifies how register writes are invoked,
> regardless of whether subsys ID is supported by the device.
> 
> All GCEs support writing registers by PA (with mask) without subsys,
> but this requires extra GCE instructions to convert the PA into a GCE
> readable format, reducing performance compared to using subsys directly.
> Therefore, subsys is preferred for register writes when available.
> 
> API documentation and function pointer declarations in cmdq_client_reg
> have been updated. The original write APIs will be removed after all
> CMDQ users transition to the new interfaces.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 54 +++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 83 ++++++++++++++++++++++++++
>   2 files changed, 137 insertions(+)
> 

> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 154d0511a0ad..f6dc43c036bd 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -57,6 +57,10 @@ struct cmdq_client_reg {
>   	phys_addr_t pa_base;
>   	u16 offset;
>   	u16 size;
> +	int (*reg_write)(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
> +			 u16 offset, u32 value);

(*pkt_write)

> +	int (*reg_write_mask)(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
> +			      u16 offset, u32 value, u32 mask);

(*pkt_write_mask)

those names make a lot more sense.

After applying the requested changes,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   };

