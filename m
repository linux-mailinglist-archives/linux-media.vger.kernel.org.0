Return-Path: <linux-media+bounces-13662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA32E90E6DD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8FE91C212BE
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5F80035;
	Wed, 19 Jun 2024 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qmKoFaXh"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0E7FBC5;
	Wed, 19 Jun 2024 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788989; cv=none; b=s5+NAPeHS4xqKWccJHyI209wawjz+4QgSI2cIHgc0d5kLovL+nB7Wn/+cPo4eAdmxWGH99FeRzS0g4657P4WFM9lZdMKhdbW+fL/81xOsZhsFhijHPG/y6BnQdSmCcG5pUgLnK17qdnmALQDjUQHp5TzT1JHY+6xCwbp324o2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788989; c=relaxed/simple;
	bh=u5hdWnd9lzdDV9BWthAA8txrbh1qaZGtYlyLfYODBbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRr3ImAy92xOtcLhZE8sMR71c60J12d3p7EeXOdR+NeIWSHGhjUeBw+APV17iRTZcZj/1vk0UFF0sciqbFF4WhwSx7VRShY0ugs6TBL59ZtIZ8PynvFF/wZZbSjHqmoM7jM+sQa23ZdnnIdusVYZJNMXCHAdLvhSPQpUpSWS9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qmKoFaXh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718788986;
	bh=u5hdWnd9lzdDV9BWthAA8txrbh1qaZGtYlyLfYODBbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmKoFaXh+BX23XZ7425uwnJ5P2KXjjA4P9OJBQXCzSWOfUYmWY+vJAjmkwnu8vXIQ
	 JoZro56VB8rMSmbMkB4CBCV9x+H6MCFPjPO+6mXyi2VFBcvPa5XLlgaDrC+BoioptF
	 ucCFQ7ScdVDSFK5r00KgndiwgLccjR6jdju+Pc5fb579QaUEpzGbgjfjEQA0i9Ir1X
	 1JuUHvxZ8R3WZaaqa+EhlL6m5aLXl9u8NincvKnYml5p+GDeJwueT3FfOQ70KiCPWL
	 rObUYkN38MwydiK2V5CKiNCtTCrVe+qf3ikxAAq8q4wRGO7paa4ULxrcHAhs0cll0+
	 az3YATr9qXWBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6C273782163;
	Wed, 19 Jun 2024 09:23:04 +0000 (UTC)
Message-ID: <4e1a8383-fdcb-45b9-b3d8-7019ed8c07bb@collabora.com>
Date: Wed, 19 Jun 2024 11:23:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Support MediaTek MT8188 Media Data Path 3 (MDP3)
To: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 sebastian.fricke@collabora.com
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, amergnat@baylibre.com,
 moudy.ho@mediatek.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/03/24 10:28, AngeloGioacchino Del Regno ha scritto:
> This series adds code to support for the MDP3 block found in the
> MediaTek MT8188 SoC, including the necessary bits for mtk-mutex
> and platform data for the MDP3 driver.
> 
> This is mostly compatible with MT8195, with a few differences
> "here and there", with the former having less instances of some
> of the MDP3 IPs compared to the latter.
> 

Gentle ping for this series getting stale.

The soc bindings and commits are already upstream (v6.10).

The commits that would go through the media tree [3/4], [4/4] still apply
cleanly as they are.

Should I resend this, or ... ?

Cheers,
Angelo

> 
> AngeloGioacchino Del Regno (4):
>    dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
>    soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS
>    dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
>    media: platform: mtk-mdp3: Add support for MT8188 MDP3 components
> 
>   .../bindings/media/mediatek,mdp3-rdma.yaml    |   1 +
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 ++++++++++++++++++
>   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
>   drivers/soc/mediatek/mtk-mutex.c              |  41 +++
>   7 files changed, 328 insertions(+)


