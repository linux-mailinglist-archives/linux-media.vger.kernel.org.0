Return-Path: <linux-media+bounces-45022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C43BF0689
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D3FA24F14D4
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5752FC00F;
	Mon, 20 Oct 2025 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cH2jcxgG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE62FB63D;
	Mon, 20 Oct 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954689; cv=none; b=ZUantBufCsJCeCHhNylvVpgdUIfmwWRTkeUSFqunkexV0cpP49FFe04U7OakPmgxI50vezYUNtHoB/fOJFE6aDpjJ2Y7bItwAGJ6TONVyVTnErwqLqNZKdsKQVRmcBUzU5NcWtHcApJWGvVorLCy3133T4NWdCN5Tk3gWsIJ4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954689; c=relaxed/simple;
	bh=ARtDZwsdCFqaJMeHgUn82RRxg6fZeKD7Hzqi7I3KSJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgQkCO354ejTtWdEu4D4PaiAawLGrWBid8cfnqVWusmkL+H5h7hmycS0M9o6s3fZCXfaEgbdTbRbjG+04FTS+1rdVj9/im3o0k6GqHGMAJshT5+hUohnPdjcQNb3XdAv2cHGI5hkndcSIRSPeJOvG5OeqZuCgQTpJhxSQvtwRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cH2jcxgG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954686;
	bh=ARtDZwsdCFqaJMeHgUn82RRxg6fZeKD7Hzqi7I3KSJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cH2jcxgGTWXbL5Uj9plnlDcSy1rIpK6H0scnSzyf3uB+Y6IVZjH5SpJIZMPQ6J82p
	 AlZFZK26tN47zUgLf/JSIF15au/EParWh5QZ1QqcG+p0xF1xLetq4VtSgqjidZvY8O
	 RUXUtIqGo8f2xt3wrohwYKbmKJY0RtCb7jDlUELVaec2A75/e4777hmbpQ4z2JwZdz
	 Ap1oab188MzOSS48fZvU71C55N4t5SCGnAvArZcvQoI7HfSlrq6ISEAAZ+5P9nlf5c
	 ABovrbf1C68PpMuMneDeIEK8ifEP0dleQanTHIzgAj0WOp5w8518XbmCM46HhhTt6i
	 PMH3MFhCB0cqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 611DC17E0FAD;
	Mon, 20 Oct 2025 12:04:45 +0200 (CEST)
Message-ID: <bd9a2670-008a-4e0a-9ad2-90bdad22778d@collabora.com>
Date: Mon, 20 Oct 2025 12:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
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
 <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> GCE can only fetch the command buffer address from a 32-bit register.
> Some SoCs support a 35-bit command buffer address for GCE, which
> requires a right shift of 3 bits before setting the address into
> the 32-bit register. A comment has been added to the header of
> cmdq_get_shift_pa() to explain this requirement.
> 
> To prevent the GCE command buffer address from being DMA mapped beyond
> its supported bit range, the DMA bit mask for the device is set during
> initialization.
> 
> Additionally, to ensure the correct shift is applied when setting or
> reading the register that stores the GCE command buffer address,
> new APIs, cmdq_convert_gce_addr() and cmdq_revert_gce_addr(), have
> been introduced for consistent operations on this register.
> 
> The variable type for the command buffer address has been standardized
> to dma_addr_t to prevent handling issues caused by type mismatches.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


