Return-Path: <linux-media+bounces-45021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D23BF068C
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865481889757
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D642F6565;
	Mon, 20 Oct 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Myqrzj5w"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB079CD;
	Mon, 20 Oct 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954684; cv=none; b=dSFX/ctH5wHnL/U88N7fIw6hi6jLfKYmyWhUMeL/3XnF0jaX2hfl8lK6I8rRHLOXrjgkl81Fk5WzrANneyEcc7B8WYe+KSo76AVhFkhEFDZes0zJ+DrdvLUgoN3Eard6xJL3hEHtXBLvgMybPX1cX9O3B8C3cicwF72fooxgLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954684; c=relaxed/simple;
	bh=Z4HlAqmuEginOGn4nx1Uy2m/t52IZhvWc16fAqzsR9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlrGnZC/QeGWBSdt1bM1GLuPUiOMxNjVzQ/IzoEOGrMaSXu93DjvjOhFAoCDKRiWL2dTLesMyB/tLFoorkrxqvRUbtB0MmVkzF45pBFbDEHhlCpXJKO+YAvjL9FB9Dzn3V2fQh7uSdgfHBVCO8F5K8TlMY85jmolpf+KdVyfBZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Myqrzj5w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954681;
	bh=Z4HlAqmuEginOGn4nx1Uy2m/t52IZhvWc16fAqzsR9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Myqrzj5wOwTgtZKe9MGN5uLeKEMGcny6m9AWkZzMGkIoDoG6jJnZllSTOZ+vHWdPh
	 QKb8iIz4wfiJonnz3wcRzxwCy02tGtZDbjl3KyW2uyc5JvsaRNpQ+Es8seDB0tdaxp
	 WDwJUudnsHiwCi7/a51pNMG+52ZZ3w1ks/c5EeJybo3Rv+ukC81cjBh3KxZ2HMXzZM
	 fhcGB9dZqbXMN2Hqp0TEORMuXATKr+tqMRO9F6YqOzdO4B8uMTFdzN9gC1FxGciAPT
	 owK/uaOi2odutmhOjjICwhswiHvVfGWCjgQdaxtrDR2Y9z1gHx0vxKyIDI/oMONIJX
	 X5y3tCRWRcwLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CB9C17E1278;
	Mon, 20 Oct 2025 12:04:40 +0200 (CEST)
Message-ID: <f3d6bd0e-d682-4798-97a0-8bd60923b006@collabora.com>
Date: Mon, 20 Oct 2025 12:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/20] mailbox: mtk-cmdq: Add cmdq private data to
 cmdq_pkt for generating instruction
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
 <20251017065028.1676930-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Add the cmdq_mbox_priv structure to store the private data of GCE,
> such as the shift bits of the physical address. Then, include the
> cmdq_mbox_priv structure within the cmdq_pkt structure.
> 
> This allows CMDQ users to utilize the private data in cmdq_pkt to
> generate GCE instructions when needed. Additionally, having
> cmdq_mbox_priv makes it easier to expand and reference other GCE
> private data in the future.
> 
> Add cmdq_get_mbox_priv() for CMDQ users to get all the private data
> into the cmdq_mbox_priv of the cmdq_pkt.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


