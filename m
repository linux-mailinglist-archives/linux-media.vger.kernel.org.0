Return-Path: <linux-media+bounces-44073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468EBC8CC8
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75A219E8470
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D5C2E264C;
	Thu,  9 Oct 2025 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UOulTCCa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2D2DFF19;
	Thu,  9 Oct 2025 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009239; cv=none; b=GzUh7WvIxNbCPi4Y8LJMzocqmgn6zyb8Duiz6URrfAOSJMgILye9dBkXxBOI+co4kYZayaHrYWVUrUN48XzhpfCHdC/KgHEd8nEY4oVUCyvMoCw3TmRM5h8yFTztjc0hvZqzqcwmii1sQoXKIawDTFWIgLmehvhBVPYWy2Ob5B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009239; c=relaxed/simple;
	bh=LqNf9G4TezAI4eWSqZ+IBL1wUm/GBm38nClar9fLGMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTQA18Xi35DDD+3ByvE2tHTew29I3MqCINpW2FvY57NxJ0dHxfGNgcer+xqYG3U827mHinHq1dv5O8MO6sljirvbdEUgRQeNBlwmoHEULgn0Tzz/Rs6ZksHZe6fLlKBjhYXlcy80z6n9Xvi5ivLIwFiTqG88+nqDytnDDrWlPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UOulTCCa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009235;
	bh=LqNf9G4TezAI4eWSqZ+IBL1wUm/GBm38nClar9fLGMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UOulTCCa5xTOoJe4nnEF2b4RBs7Nf/b4svaVgS2s59ae/s7XULTyVOK3ZMmVpvgWp
	 xUR+8qPeVCvVwY5F+r1dT052JN5qc5HSUb8MQ4gRcEVUdzo+1sUytnqro7r/BRPw4O
	 X3uS8fbv1hVtrCNu/+f6dgxxupnO1v6kv/9h39UERnzkxvRYkTNWlmBI32cP75Pk6Z
	 4AiLa/Xpba/mS41qaqaKJh/HiTCd3CimZZgJEFvmWRsVwnaqY+JUXFc2V824B28W6C
	 CAQKWpv4+8Zi2xUYeai/KTptkDqLWF8roFUdSlaHYfiRGo3zquwWW1obdomK+nV0Qp
	 ULung9zzWHvGg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A503317E0A30;
	Thu,  9 Oct 2025 13:27:14 +0200 (CEST)
Message-ID: <bac4b2f1-3049-41ce-9ba8-3ac8f9ba4996@collabora.com>
Date: Thu, 9 Oct 2025 13:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
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
 <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> The GCE in MT8196 is placed in MMINFRA and requires all addresses
> in GCE instructions for DRAM transactions to be IOVA.
> 
> Due to MMIO, if the GCE needs to access a hardware register at
> 0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
> the MMINFRA will not know whether to write to the hardware register or
> the DRAM.
> To solve this, MMINFRA treats addresses greater than 2G as data paths
> and those less than 2G as config paths because the DRAM start address
> is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
> DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
> less than 2G.
> For example, if the DRAM start address 0x8000_0000 is mapped to
> IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
> the address in the GCE instruction. MMINFRA will then see it as a
> data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.
> 
> Since the MMINFRA remap subtracting 2G is done in hardware and cannot
> be configured by software, the address of DRAM in GCE instruction must
> always add 2G to ensure proper access. After that, the shift functions
> do more than just shift addresses, so the APIs were renamed to
> cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
> 
> This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
> CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
> cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
> instructions.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 22 ++++++++++++----------
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index a9e8895d14df..373effbcfa40 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -94,20 +94,21 @@ struct cmdq {
>   struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
> +	dma_addr_t mminfra_offset;
>   	bool control_by_sw;
>   	bool sw_ddr_en;
>   	bool gce_vm;
>   	u32 gce_num;
>   };
>   
> -static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
> +static inline u32 cmdq_convert_gce_addr(dma_addr_t addr, const struct gce_plat *pdata)

You are adding those functions in a previous commit - please, just give them a good
and right name from the beginning and don't change it anymore in any later commit.

The code, anyway, looks okay.

Cheers,
Angelo

>   {
> -	return (addr >> pdata->shift);
> +	return ((addr + pdata->mminfra_offset) >> pdata->shift);
>   }
>   
> -static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
> +static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *pdata)
>   {
> -	return ((dma_addr_t)addr << pdata->shift);
> +	return (((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset);
>   }
>   
>   void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
> @@ -115,6 +116,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
>   	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
>   
>   	priv->shift_pa = cmdq->pdata->shift;
> +	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
>   }
>   EXPORT_SYMBOL(cmdq_get_mbox_priv);
>   
> @@ -254,7 +256,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>   	struct cmdq_task *prev_task = list_last_entry(
>   			&thread->task_busy_list, typeof(*task), list_entry);
>   	u64 *prev_task_base = prev_task->pkt->va_base;
> -	u32 shift_addr = cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
> +	u32 shift_addr = cmdq_convert_gce_addr(task->pa_base, task->cmdq->pdata);
>   
>   	/* let previous task jump to this task */
>   	dma_sync_single_for_cpu(dev, prev_task->pa_base,
> @@ -326,7 +328,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   		return;
>   
>   	shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> -	curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +	curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   
>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>   				 list_entry) {
> @@ -477,9 +479,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   		 */
>   		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>   
> -		shift_addr = cmdq_reg_shift_addr(task->pa_base, cmdq->pdata);
> +		shift_addr = cmdq_convert_gce_addr(task->pa_base, cmdq->pdata);
>   		writel(shift_addr, thread->base + CMDQ_THR_CURR_ADDR);
> -		shift_addr = cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
> +		shift_addr = cmdq_convert_gce_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
>   		writel(shift_addr, thread->base + CMDQ_THR_END_ADDR);
>   
>   		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
> @@ -488,9 +490,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   	} else {
>   		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
>   		shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> -		curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +		curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   		shift_addr = readl(thread->base + CMDQ_THR_END_ADDR);
> -		end_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +		end_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   		/* check boundary */
>   		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
>   		    curr_pa == end_pa) {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 73b70be4a8a7..07c1bfbdb8c4 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -72,6 +72,7 @@ struct cmdq_cb_data {
>   
>   struct cmdq_mbox_priv {
>   	u8 shift_pa;
> +	dma_addr_t mminfra_offset;
>   };
>   
>   struct cmdq_pkt {



