Return-Path: <linux-media+bounces-17373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F070D968B14
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68D841F22DE6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F109019F116;
	Mon,  2 Sep 2024 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQOf2V/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB81CB514;
	Mon,  2 Sep 2024 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725291091; cv=none; b=VUV9a+lw6IKSXxYIN1ICoZ+tqwtssc3nlTfvHIedFDAkH3WDQxDdQgw+c9/K5uRqWTFqDGXCeiR5kQHOelhF/mzefVY1wxLpWqBTh9w4jgbIStZglBZZwYyiLQHZ5snBGysI64D/OBsLiJkvtZpUjW2xIjjsVY3Zi5vT2ptB+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725291091; c=relaxed/simple;
	bh=fHYCrATv0YNMW+dvVDb2XEurW2FCe0swC9jmdEUKmLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dIKeB2WlmVFbK5hHnvetl95t/10qnkZeRTJ3R7T7iL2d8x+7GBnhiIO3s/Nasy3ijCMRCrGWuXK41GBKSyzMLA2ni1eUYFmK4VetV4GS2C9th6I0mz+GoSu+FSo0Cd7ooL1whRqGevM19iWdbOR9xlf3VaLZVbdekMqpSsiMNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQOf2V/b; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3f163e379so70766901fa.3;
        Mon, 02 Sep 2024 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725291088; x=1725895888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zgWcvugTcq0n4IcB8sHG/SbLm3GxVM4wHTGq3cvMrNM=;
        b=EQOf2V/bugoUBzNcQBturkm6PTN/Fo0PSiTNhxRTrcILWjQTKyy+eDBU+og+T8Jxqj
         7Ixm7uJZTfzVK+oDhzNiy8lxq7YKqlHnHxbmx44DJIFQVA9huZK1tbDP+/WfWZVdcSQL
         tqLjAdj7snIVl17jPcr7HPCgHzWoL+2js6s3HDlZ4nkvX0uSV2syxEZYcmiX3sK+7+5u
         CShpMiXWc5bYZp+owZKvAX09LT91Gw/S5kUePXUue/y/6hA7iRi8rbTWoMZsL2f2+1JC
         7U49dM66jSzK6km/RyDFrAyoyLb5jEGa/f+TaMZ7vymUN9PV4XAQiLUMjH3qvXQTDLZ8
         Sltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291088; x=1725895888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgWcvugTcq0n4IcB8sHG/SbLm3GxVM4wHTGq3cvMrNM=;
        b=pnwKiQNUxlhFSVCzx7kgM8oo5TuopKk0ZsnAPQxJgsHSGMMJfNbTV/IhaWdqJb+SOw
         Uvf7mBvJOOhiPSun4RR4+DBuXxmim5t+Ns5gtI0Xs4iLCwPE6xb5ov909LN4lwiK7xB5
         4yhzJv1fkkajH3qUZrUqN6orXqGpH4SC07WUqGa7VlqA1qnEhKlkIODoE28ObiJs6fwM
         lLvhCGT8U9NCt98e5Kjo6RflMjP1IILwnfhASrbhf+vqWdh+BwmUckLSkuqSlN7l9wvw
         67WwrZe/JA+La20LpmzbLsCjJtah9vZVUoR81xmlZravvZm5mdyQOYFjnhR05Yd+f3Oc
         8n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCULpyqwzP2eX5043gwVC3fLNkxcCNCec8EW9VFrLqAUpO8G0HlL70bvvrF7LbzNh1wnOAc00ChXQA+671I=@vger.kernel.org, AJvYcCVfLM7mKYmkjo4nqFIDFz1WS2GBtfOD/W+YCs+u9wRIUuKQTxIy9nPxTryoXEEPghQSs3PjhYsvZnPdb78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcNoLhge+iVmoaDQGztK0NTPuXfTncydMhTC7RkRDN0+Iy6PO
	uFMXGnPBweRquTd7szUs26pRLDemLBzt9/b2i9azxdPoQ6yQQxRm
X-Google-Smtp-Source: AGHT+IHxV1Ic5u6QxGdGvSwxSn91NdIhv16sGfo2ufqHeeF2dqvYS7NMoiTVZIKB1TAarfANOvwn5g==
X-Received: by 2002:a05:651c:19a3:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f6105c49a9mr126039951fa.7.1725291087133;
        Mon, 02 Sep 2024 08:31:27 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900e95dsm573187066b.54.2024.09.02.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:31:25 -0700 (PDT)
Message-ID: <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
Date: Mon, 2 Sep 2024 17:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2024 16:32, Chun-Kuang Hu wrote:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 46 ++-----------------
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
>   2 files changed, 6 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index ef5dade35fd3..740a484c8eb4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -471,43 +471,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
>   	return 0;
>   }
>   
> -static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
> -			       size_t size)
> -{
> -	struct device *dev;
> -	dma_addr_t dma_addr;
> -
> -	pkt->va_base = kzalloc(size, GFP_KERNEL);
> -	if (!pkt->va_base)
> -		return -ENOMEM;
> -
> -	pkt->buf_size = size;
> -	pkt->cl = (void *)client;

cmdq_pkt_create does not set the callback. Why doesn't that break things?
Same holds for the crtc driver that is already in linux-next.

Regards,
Matthias

> -
> -	dev = client->chan->mbox->dev;
> -	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
> -				  DMA_TO_DEVICE);
> -	if (dma_mapping_error(dev, dma_addr)) {
> -		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
> -		kfree(pkt->va_base);
> -		return -ENOMEM;
> -	}
> -
> -	pkt->pa_base = dma_addr;
> -
> -	return 0;
> -}
> -
> -static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> -{
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> -			 DMA_TO_DEVICE);
> -	kfree(pkt->va_base);
> -	pkt->va_base = NULL;
> -}
> -
>   static void mdp_auto_release_work(struct work_struct *work)
>   {
>   	struct mdp_cmdq_cmd *cmd;
> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>   		wake_up(&mdp->callback_wq);
>   	}
>   
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>   	kfree(cmd->comps);
>   	cmd->comps = NULL;
>   	kfree(cmd);
> @@ -578,7 +541,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
>   		if (refcount_dec_and_test(&mdp->job_count))
>   			wake_up(&mdp->callback_wq);
>   
> -		mdp_cmdq_pkt_destroy(&cmd->pkt);
> +		cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>   		kfree(cmd->comps);
>   		cmd->comps = NULL;
>   		kfree(cmd);
> @@ -620,7 +583,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   		goto err_uninit;
>   	}
>   
> -	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
> +	ret = cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>   	if (ret)
>   		goto err_free_cmd;
>   
> @@ -700,6 +663,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   	cmd->comps = comps;
>   	cmd->num_comps = num_comp;
>   	cmd->mdp_ctx = param->mdp_ctx;
> +	cmd->pp_idx = pp_idx;
>   
>   	kfree(path);
>   	return cmd;
> @@ -711,7 +675,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   err_free_comps:
>   	kfree(comps);
>   err_destroy_pkt:
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt[pp_idx], &cmd->pkt);
>   err_free_cmd:
>   	kfree(cmd);
>   err_uninit:
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> index 53a30ad7e0b0..935ae9825728 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> @@ -35,6 +35,7 @@ struct mdp_cmdq_cmd {
>   	struct mdp_comp *comps;
>   	void *mdp_ctx;
>   	u8 num_comps;
> +	u8 pp_idx;
>   };
>   
>   struct mdp_dev;

