Return-Path: <linux-media+bounces-12642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0928FE61A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 14:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC91286479
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CA319597F;
	Thu,  6 Jun 2024 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ex+NapCY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E661953A4;
	Thu,  6 Jun 2024 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675780; cv=none; b=u3pnJ0eLQemVKDOIfDygTW4nQmU3CQO4wE6L7NrNi7Mwqzn4sacLS4NmY0cZ/1joK+65CLg06N+7ub//oNwQXlqcqttE2DfsMCSnlHRvpoNMuHa8dyMGrcdgwgDPZy/q+0lG1mxMTDMnOFH/1tn/GJwGJeLqxHyhBjzyLJmJ598=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675780; c=relaxed/simple;
	bh=d/jCCF0NCqOhRllSWhbYbAQCzOnOV4aDMEeLQSfza+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O879sNiuzhRksO/ucuLH77jPytbgrBxcWWlobhxlKXOfp5Q45u7Z+GYc3IGp+en+3FiGn0Vl4y3wu+woPdyThVHs15sjz20Vi2ZeJr7P2kN/k6X/83W/nrQJH+GHN232o96GkBVJkVpl2texU47TqwR0mY1NWoow0JdbilVXtyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ex+NapCY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717675777;
	bh=d/jCCF0NCqOhRllSWhbYbAQCzOnOV4aDMEeLQSfza+0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ex+NapCYaV6uQigRxoz9OgZuuxLinAt+ffhPwDJQBgGlx2SPufS1v3P+AztsrF40y
	 dRz3GUhZMHA2YYKyeXhuBGMbG9HldE7vrKp5Z0aMkk7TJDryuZgGDfB6vIuUmaN5Jh
	 ZtaoW+WFg76wAWKZsxuc9ptVjZ6wJAFaEFmmrrdiBvJ/OcdNeb1n1sjacYJ08NifXs
	 gJXda7TmOb3v0I06XyPOME2H9GCfAv25M4/IRnJcZmn5FRz6dl9OI7Bt36nIC2i+vy
	 6ozyecsSOFutlgR3Bx0/B/YDrWkIdTEhWye8VrqdgyMs7MzMaplLnHAA1p7tZ0ul1V
	 Dy86HOeJ8iz6A==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8ACD83781022;
	Thu,  6 Jun 2024 12:09:36 +0000 (UTC)
Message-ID: <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
Date: Thu, 6 Jun 2024 14:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-11-chunkuang.hu@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20240222154120.16959-11-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 22/02/2024 à 16:41, Chun-Kuang Hu a écrit :
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 6adac857a477..b720e69b341d 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
>   		dev_err(dev, "mdp_path_config error\n");
>   		goto err_free_path;
>   	}
> -	cmdq_pkt_finalize(&cmd->pkt);
> +	cmdq_pkt_eoc(&cmd->pkt);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa);
>   
>   	for (i = 0; i < num_comp; i++)
>   		memcpy(&comps[i], path->comps[i].comp,
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 94f4ed78523b..2214744c937c 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_put_scp;
>   	}
>   
> +	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
> +
>   	init_waitqueue_head(&mdp->callback_wq);
>   	ida_init(&mdp->mdp_ida);
>   	platform_set_drvdata(pdev, mdp);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 7e21d226ceb8..ed61e0bb69ee 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -83,6 +83,7 @@ struct mdp_dev {
>   	u32					id_count;
>   	struct ida				mdp_ida;
>   	struct cmdq_client			*cmdq_clt;
> +	u8					cmdq_shift_pa;

Can send a new version of this series because this patch can't
be applied on media_tree/master branch.
The code look correct for me but we need to be able to applied it
to perform more checks.

Regards,
Benjamin

>   	wait_queue_head_t			callback_wq;
>   
>   	struct v4l2_device			v4l2_dev;

