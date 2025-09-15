Return-Path: <linux-media+bounces-42547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0DB576C2
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BE213B5111
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B75C2FE07E;
	Mon, 15 Sep 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n2Q/efzH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BAE2FDC36;
	Mon, 15 Sep 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932807; cv=none; b=f+tCdXu8VfBPKdEV1Trpsz74Jxti8Mu0fgYQXh8G+fC+B/gmPSOOVHCeJO1hSvenXLDpayJH8Hc8aHsywEW1vaV9PASYmS9uOwZEf/Yyy9149o9wkNPdzd3Pu0TeM2/xomiCxUKU2EQUa7bHzPAAjDs6YDNne0dcjVTPgAwnv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932807; c=relaxed/simple;
	bh=OrTJg7ML8WF3jd++p1PbmIME638sKP8/rrTaWRexXFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q99O7U1uKLZHtZtuqXp9yEWbwCZERVsIeD15H6onyjSuKsPFbkso2nt/YoXk9g77kpPEV1C/10E5IPmBLWWxRBmgXt5LZW1TpFWhbPVOTaRu2nQS/WzUiktGyRr/Gp3aoyN7tLu3dEUPxihA73M8cc0rH5GTErGq07RGa9bSdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n2Q/efzH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932804;
	bh=OrTJg7ML8WF3jd++p1PbmIME638sKP8/rrTaWRexXFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n2Q/efzHkJGRLxmW/UaOdSLrbTUPUWThFLvuPvZGEzJ2eGVZt5GQGG46KcJwMXAP0
	 KAVfdokKQSDwa0lC09Vrz93yG2kwUCpQZKR374PI9Bj8+N9Fo4ZMpCwIYwxV39txEv
	 Nk1zm1K3b+apyMTdH7rEFbn9/zj+SnULkn1tFn9vHwVK1gDvXBM+5FAYubQzZIGKE/
	 yV7hzHEmt5P2eLzoKiYZXoyE7pO+CW6VO1hlmVvHFQB07SqqdHXk2kv6vxnkhpJrik
	 tvpSPnG8oaT4IUFNgbdtqu2q2yJZOQV/pQIXsPbqdfKNzijMBLQaEaGFXW8TuiPU2c
	 ol5ppgNncVG0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DD1E17E132A;
	Mon, 15 Sep 2025 12:40:03 +0200 (CEST)
Message-ID: <008072e1-2daa-4b88-a6c4-a7ff95532e89@collabora.com>
Date: Mon, 15 Sep 2025 12:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> The dram addr of vp9 decoder tile number, which use dram mode
> to set tile information, may reach to 36bits for 4096x2176.
> It needs to get the highest 4bit of tile buffer address to
> set tile buffer address.
> 
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



