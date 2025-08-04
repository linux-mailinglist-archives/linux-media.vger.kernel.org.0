Return-Path: <linux-media+bounces-38820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9905CB19E29
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0380189A6B9
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E310244694;
	Mon,  4 Aug 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JLhO9L5B"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C89241679;
	Mon,  4 Aug 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298174; cv=none; b=TrXHogezkPFzWLkRsB2czqdKZqjokmw9/CawRMpyxRYkhDuakmgmJqJs3VeUhuKJPACaHw5T9Q/0kMLByIGs3+ccI6osNjKKCBsSGSjUwoYWogU6MBbzniuXi2QzAEqghpPmACn5CzorPQeRrO85AxesLut1NgFLZNubm65WqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298174; c=relaxed/simple;
	bh=8C3vrohJCMkNz48Npe0D4JIHwbn6kl862AvU60VY+nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMVehV/L/Q9xRZUvcDzKhhStFUAuiqtQPDPVRrllI3giknIVxzA1pRiL9XKAg9l0nSWCN98EpB1Q/dxFO1bDl8prODD7j1uupPPxuXj4nYjWPNnTj1xN40lZXUutIBXvdWUMnCWtqE7m1OVyTbUDcbahT+i0PZsc3+uGsVWVP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JLhO9L5B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298166;
	bh=8C3vrohJCMkNz48Npe0D4JIHwbn6kl862AvU60VY+nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JLhO9L5BrmEQq9pumRV6CfhrlnygeF7jd5jsfvnwprETB0viNvn+WVgy4x+oprZNy
	 NZMHKJ5FUGdpXtd/Z91veR88ZNZxnRiWy8gzUpM4VD3Bp1+ZMGJqkHlVDnltCmoX77
	 pEC0B9HdhIbwF0CXCerXL5yvMdtg6lc/MykiJ5GtAdNMH6gFfi+lYx/xupQv3RbuJ0
	 NJv4suYr1gAPIRqj1dlB/qP3+0QaKx3IJNkcXs/mM23ZuHvaqBDEZUS58CU+kpHguY
	 UFnQcc/YiVj/hwrJ2+LpHeezdF7hUj7DmtnENhEATscLQJ5rLRzsOuY/8U3nY2X7ZL
	 NL5nQ/VDDluIg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AF9917E04DA;
	Mon,  4 Aug 2025 11:02:44 +0200 (CEST)
Message-ID: <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Date: Mon, 4 Aug 2025 11:02:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow
 range number in node address
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
 <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/07/25 11:14, Krzysztof Kozlowski ha scritto:
> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>> The dual and triple core jpeg encoder and decoder (respectively)
>> on MT8195 are far apart: the only way to have this to make sense
>> is to split those in multiple address ranges in device trees as
>> one big range would overlap with other IP in at least the MT8195
>> SoC.
>>
>> Change both the jpegdec and jpegenc bindings to allow specifying
>> children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
>> encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.
> 
> 
> This should not be needed for standard MMIO/simple-bus nodes. I think
> DTS is wrong here.
> 
> Which cases really need the ','?
> 

All of the multi-core JPEG enc/decoders on MT8195 (and newer).

The DT changes are included in the same series as this commit; check:

20250724083914.61351-35-angelogioacchino.delregno@collabora.com

Cheers,
Angelo


