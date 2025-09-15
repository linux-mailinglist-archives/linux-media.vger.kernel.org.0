Return-Path: <linux-media+bounces-42545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFFFB576BB
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F218C3A1B29
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DA02FDC21;
	Mon, 15 Sep 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dYbuRPRF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D82D2488;
	Mon, 15 Sep 2025 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932804; cv=none; b=L2xtOIlToxSqFmwu4pD8vOfzus049vHSrqkHSsyqU/EKf2os20RAl2exX6+16ww0/PpATL1zi8Ii/QdXPv7cQvb2NRkfKuXVD0Z1nI2jkeGOBzte0rM+kDH1yk6Tg4xCHXUAr8Bq2ctiEqTfmZbKUp9k+wOaFODuPRt44lfzaGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932804; c=relaxed/simple;
	bh=Fy7uV+xkKUqBG1sU/IFfs8aiKJMJZwNs+dD346+mO5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+dgSodixb8E34jmv/SFM3ewiDJniZIoC0NByC04xRtNYBPoGwi1XYSj2RFasKKOxmmnpNjv6eowVLBifafv5S9zX4pjOl4NJxOgZhFI/wTD2oKSR/GXTMz839DQhOaw2F33M+/S7AOUANc3Ek1qQkEkfx2/OyzetvSMN2dNSgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dYbuRPRF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932800;
	bh=Fy7uV+xkKUqBG1sU/IFfs8aiKJMJZwNs+dD346+mO5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYbuRPRFty00+ZkInmrSFyikBi9+lWNWRUO6hIzykWy4TKhnA06qzfvj0RVmttS8t
	 MlwK2KMSkTTqxN+avBqSltBR56NI5BHE4UCfplyNQCy9QMAPhF+6mpeLcIWumRyRkg
	 wOYkfj+m44m9QRFY1IAiNggkN3oKCzpk9aPdxdxX4iASJe7Qo9ydMuN/6/gO7yKgFn
	 i7AqTEs5Zi0T7l8VLs06Z1lxSWxWNDTbj/s05TI6DaBH8RU9tFNXMf0C1M3CVF3lsK
	 4YmugPoPbpAra88iuqbWD4NhInwxpwrsVJWJrJwQvJ5C/I48mQFI1hubyhDNvd5o8A
	 92Iw/50xpR7SQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0B4917E107A;
	Mon, 15 Sep 2025 12:39:59 +0200 (CEST)
Message-ID: <9d0c1fe8-07eb-444c-8bd5-867f1f366188@collabora.com>
Date: Mon, 15 Sep 2025 12:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: mediatek: encoder: Add MT8189 encoder
 compatible data
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
 <20250915091958.31509-9-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> add compatible data to support MT8189 encoding.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



