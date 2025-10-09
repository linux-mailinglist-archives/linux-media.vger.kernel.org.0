Return-Path: <linux-media+bounces-44081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B15BC8EC1
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE15E1A6261F
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685E22E266A;
	Thu,  9 Oct 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CmhDm10o"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3242DE200;
	Thu,  9 Oct 2025 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011005; cv=none; b=CXNJSTwkpnIaownwYVbk8y1P90RxKfVpB00vyn1PVG3utzNzWSV4Xs2XJRBgbliXmkohoraHDmF5zczQ0GSd/N+BRY0pPnkrjhHLGZL9ZhJNj9AB6O77dLmZazGhlLjCjtj28YDYAcRSC54jFh86oHp1rLelegS8wqaqiuCnAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011005; c=relaxed/simple;
	bh=GCdo2WRMgThuwdhdaxtmNPngX0ETlYCYQ7iuLMzkZt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOTG/xTEjbV/jsC2aPYHDxFgag3wVk6ByNpbGYdI6vp3SmFbPRBX/cWfosyX8LQSB8A2K4uz+nQzj3U/To50kZBODMGm8B21W6dmjbNUWq1tdPiPRH3pXY2NpyhHZgYnLY5YDVCQBFv0yk2x1yUV8vX1qGXLfMoZg9uJZ3lDoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CmhDm10o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760011002;
	bh=GCdo2WRMgThuwdhdaxtmNPngX0ETlYCYQ7iuLMzkZt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmhDm10oocxKkaF5tmsjNvE52BrCVUfY7m30lN8iDm/aVW6yLyk8S1fhLyy9JJ//o
	 lG0OcN2d0Z2SWsBUAI3OhbZXzKXhfR1yZcmyvHpZzUL6pTFpJfFuIh4XnSaab5jd8B
	 o0N9PVKK0WHJAcGZ/8dxQ3XfceDixM5FEzlZW05IATAEtz1pQT5b1UI9+OdKH3d35n
	 PnWEquwvVQmvNo7qyjKcaJ/9B+VTxIAVwzLTtq7/Qsbl4/WQnklBP9buv+0imB3nYw
	 JI9zcHMU6Gzh7EVV/ISC+9s/fRIs50+wXg36F+NQ3IxHGdjohcrHAP+Gsb4lt7x8Lb
	 Ejw8718SW052g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6940117E0125;
	Thu,  9 Oct 2025 13:56:41 +0200 (CEST)
Message-ID: <dc04ae37-7707-4d32-8b01-f4804cd0cd90@collabora.com>
Date: Thu, 9 Oct 2025 13:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] soc: mediatek: mtk-cmdq: Add mminfra_offset
 adjustment for DRAM addresses
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
 <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since GCE has been moved to MMINFRA in MT8196, all transactions from
> MMINFRA to DRAM will have their addresses adjusted by subtracting a
> mminfra_offset.
> 
> Therefore, the CMDQ helper driver needs to get the mminfra_offset value
> of the SoC from cmdq_mbox_priv of cmdq_pkt and then add it to the DRAM
> address when generating instructions to ensure GCE accesses the correct
> DRAM address. CMDQ users can then call CMDQ helper APIs as usual.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



