Return-Path: <linux-media+bounces-19796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DF9A241B
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 15:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B82E1C213D7
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 13:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD891DE3BB;
	Thu, 17 Oct 2024 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SPQutJ3l"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E91DE3AE;
	Thu, 17 Oct 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729172355; cv=none; b=jdN9oAAemom/c6HYESwjjH7f9Imnc+Ubssk6ONp3xmZlukaupFpUbQt8sTc2DE37XEPFiC3KLKXSAwjPiq0FK9FwwDh7bvNFVmC5GSZMWC7c5BnUVwm7ZQJJr1cEVxxPZbe4zmqjhCHifkaJ39xv/Cb0dtE8XW2daTcWEVZ0QSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729172355; c=relaxed/simple;
	bh=RaKhN2VDuQLWNQ2Oq2Tvf0ihMcrAd4aJ/LDWckcjBOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSdgxluqF2BDZjmnRC6DM7151f3OU3GH274NNWUtDZ8BLcV8PW30gbw5EDYJnnHNR3oMd5izQ3N0BrsBRQP8TaPdl72BtrRy+FAaLFhNtnZZhhos5MRVKPdLzu2vW0mEtW+ChaBK31F5v5u6WQe+k04VBBEjr6RKr0ip36eGnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SPQutJ3l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729172351;
	bh=RaKhN2VDuQLWNQ2Oq2Tvf0ihMcrAd4aJ/LDWckcjBOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPQutJ3lknDz4wr024BhyOyWthJhP0eYzroDjQrWaiGu9ZW6dWqBiVXCkGFrmoaoq
	 CIupIouccGH2bHQNJ788l4L/IlVlnhS/RoGNWqzo7+SV+yrW32/ZHWWYmam13g7poL
	 cDRHA5axOTFR4TrgiYg1Jk3MDbBBN40VSRlzMF0/mL1wRvSomSEiAnVHukOoDJ89BC
	 aM7jHiU5mZkp66CMHfjwx/SdcO7GKPX1vI+ZtUf6xhYgJXIi5Wb0qHER2SxTfTC4by
	 edSp3fHgV6gvW7NGWf65+643d9uVofCg9ZHdE4Ju4YLdmgET3ZtnN5f3EA7qj3ZfcF
	 6+SPMIiuXUZLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3E2517E360A;
	Thu, 17 Oct 2024 15:39:10 +0200 (CEST)
Message-ID: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
Date: Thu, 17 Oct 2024 15:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in
 mdp-cmdp-prepare()
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ricardo Ribalda <ribalda@chromium.org>
References: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/10/24 13:38, Mohammed Anees ha scritto:
> Since platform compatibility is already verified, the
> additional else branch is unnecessary and will never
> be executed. To fix, remove this else condition.

Well, actually, even the one before the allocation of cmd can be removed,
because compatibility is already checked by __get_config_offset().

Besides, __get_config_offset() has another occurrence of an unneeded
else branch, as it's checking platform twice.... so you can clean up
that one as well.

P.S.: "media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks"

Cheers,
Angelo

> 
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index ea2ea119dd2a..168beed4155a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -624,14 +624,11 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   	if (ret)
>   		goto err_free_cmd;
>   
> -	if (CFG_CHECK(MT8183, p_id)) {
> +	if (CFG_CHECK(MT8183, p_id))
>   		num_comp = CFG_GET(MT8183, param->config, num_components);
> -	} else if (CFG_CHECK(MT8195, p_id)) {
> +	else if (CFG_CHECK(MT8195, p_id))
>   		num_comp = CFG_GET(MT8195, param->config, num_components);
> -	} else {
> -		ret = -EINVAL;
> -		goto err_destroy_pkt;
> -	}
> +
>   	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
>   	if (!comps) {
>   		ret = -ENOMEM;



