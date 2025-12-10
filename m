Return-Path: <linux-media+bounces-48540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEEBCB25D4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42EBB302DB98
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA58F301716;
	Wed, 10 Dec 2025 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g7io0Wfb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21AD3019B1;
	Wed, 10 Dec 2025 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354226; cv=none; b=kVe1KLU9+a3ePlWQyT4KvXEcrlMhuZ4Y4+umdyNeqOqQKvPFaEPbUUAQkFnl3ls8kO3wbNK5Y6uDXEXotLAuNDYMhxVUHirEs2P4gKBAVS44qumAYrTcujYlDzK/ayV1gVdbDj2yhU2MM2nvocauy8Y6LwTlObbqjg2bgsYzsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354226; c=relaxed/simple;
	bh=hAQnAi/fXsMW1KyzUEUN13mP8zTSDNw3Zz+EQGCHeQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNL10H+EgfeAhgGxnropvuF7/ZmqSPUThwcVGvGiib0bXPb/3Vtf4gTE1kUKywmwtO5opfLZZj0WXkrspw2aCM9AH2XR0Qk6JYGB41axG7zQ1LpPJ9BKArbAGPybKGXny70kX7m551Mb7qIZAlo5PFLQX+TFV9+dTZkbnY8+l40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g7io0Wfb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765354222;
	bh=hAQnAi/fXsMW1KyzUEUN13mP8zTSDNw3Zz+EQGCHeQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g7io0WfbYA7eXtAQztLl/y1SkRerM9o+T15i4KdR9PMoPoxwUH+vKqTVTWhWN96so
	 P6Wwb9Doam0XT6o3ft8aFw4syl0vsQrFF5QXUg0PEoizysDsYHawC/B7J3qy39J+kC
	 3gi/B3gifC/+cF1zZz6Ouzgv1+c1jEupzMtDazFt87sZTQ7+aOxSl768943G6SJmWP
	 n9gKrT18/rpqa4r5TtEtmU5elBpQr/wGqjmPfVTIqd4FwaFzlfPBUmHAjH2YYlE1De
	 RaN9RSXCQt6Xa339IroW/u91wnoQLqYUvjtKRWuyLbzcFpgqQATieAujFlfc+2DRU5
	 iJKVJctxVPyPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 823E917E1122;
	Wed, 10 Dec 2025 09:10:21 +0100 (CET)
Message-ID: <17d99a64-8648-4fbc-9b7c-581f882d02a1@collabora.com>
Date: Wed, 10 Dec 2025 09:10:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251107141303.223254-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/11/25 15:13, Marco Crivellari ha scritto:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 6559d72d5d42..9083367ae2e4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -255,14 +255,16 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_free_mutex;
>   	}
>   
> -	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME,
> +				      WQ_FREEZABLE | WQ_PERCPU, 0);
>   	if (!mdp->job_wq) {
>   		dev_err(dev, "Unable to create job workqueue\n");
>   		ret = -ENOMEM;
>   		goto err_deinit_comp;
>   	}
>   
> -	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
> +	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock",
> +					WQ_FREEZABLE | WQ_PERCPU,
>   					0);
>   	if (!mdp->clock_wq) {
>   		dev_err(dev, "Unable to create clock workqueue\n");



