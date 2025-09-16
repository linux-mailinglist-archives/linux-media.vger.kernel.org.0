Return-Path: <linux-media+bounces-42634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7FB59EC6
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 19:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1521916F4CB
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CD52F5A2A;
	Tue, 16 Sep 2025 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="COVHlHgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A232D5DB;
	Tue, 16 Sep 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042346; cv=none; b=Ooud9fl/xRRMMOj+gG7vJz6AOWWP/2auY00bjmZPbK0a8Mt7eM2El9dtDz6OaRYSfSQAvSLN3Blk3+vaTagWED7w/BhOi+EjmWEKEwqfaat5NBPzVwh4fR2w2d0rT1uzpJvlEz2G6oOXS50IwZPs65+Bugx4AQfa9yJgfzaX6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042346; c=relaxed/simple;
	bh=f2S84XCnfyCMujHxvoGwdS9xv/u+KapxI+1bjHR3tJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHZpw7ZOXHDs9Iz7Yv04+dsPtzF/g+OGn94kxNVdyL809aJKg5tDzht2VAX/fdBp6dgekNEQ2KM3YAun3kUEhj1GA7vpSjwtFpYdfy7NUf/kr2TJjHyuvByLrBuAlsLox//geuoNERBxtLN8g/RQcyVBGQyD+/QF1KYFkm1NuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=COVHlHgZ; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id yYyWugYwOPNPdyYyWuxO1w; Tue, 16 Sep 2025 18:56:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1758041780;
	bh=KxXeHLxPfTqm5VMdb4U/d3SjNLsOdUyu/UfmEVmpoBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=COVHlHgZiQJu0vXSGCu8h560SE2GEPKVyuM25traI/yLHGjYZrafnA+mDEYAFiAN0
	 Ql8lCne8c0zz5uCsgQHg0S5p8v56D5eb9mQIbvquYxx9trNJ2sCKjfsmX9iRXq5eTq
	 wUMBCpBoVxlwPzQkBA4h7mTk905D0Zx4RPjefzdTBulkax9UyagZKleI00E/a3Oc24
	 vz3iF0qP+60XJWCqEW1kWcx6IbxgFBiz0cUPyCuVupJEm1NKNwFTUCzAW+mUO5JbTs
	 s06r3M0V8pPrC+StU+evUxWMGIAm6P20X7jSovxvu4qNO5Mc1w0Er0qMQMy5WiMXsD
	 oEKLaKR1SF1hw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 16 Sep 2025 18:56:20 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a9b8f7bb-5704-48b0-9a33-e1470b222688@wanadoo.fr>
Date: Tue, 16 Sep 2025 18:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mtk-mdp: Fix a reference leak in mtk_mdp_probe()
To: Haoxiang Li <haoxiang_li2024@163.com>, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 hverkuil@kernel.org, eballetbo@kernel.org, eizan@chromium.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20250915125248.181608-1-haoxiang_li2024@163.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20250915125248.181608-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/09/2025 à 14:52, Haoxiang Li a écrit :
> vpu_get_plat_device() increases the reference count of the returned
> platform device. Add platform_device_put() to prevent reference leak.

Hi,

I think it is also missing in the remove function.

And while at it, mtk_mdp_unregister_m2m_device(mdp) seems to also be 
missing in the error handling path of the probe.

Just my 2c.

CJ

> 
> Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 80fdc6ff57e0..6aedb6033010 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   				  VPU_RST_MDP);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to register reset handler\n");
> -		goto err_m2m_register;
> +		goto err_vpu_get_dev;
>   	}
>   
>   	platform_set_drvdata(pdev, mdp);
> @@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> -		goto err_m2m_register;
> +		goto err_vpu_get_dev;
>   	}
>   
>   	pm_runtime_enable(dev);
> @@ -214,6 +214,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_vpu_get_dev:
> +	platform_device_put(mdp->vpu_dev);
> +
>   err_m2m_register:
>   	v4l2_device_unregister(&mdp->v4l2_dev);
>   


