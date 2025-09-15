Return-Path: <linux-media+bounces-42546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F02ADB576BC
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4DE20171D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA37D2FDC4B;
	Mon, 15 Sep 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k/zjAc72"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B772FDC28;
	Mon, 15 Sep 2025 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932807; cv=none; b=MLCSSqAplgJ50QI70TyHC+dLqBA353//EJTP47FMVeWdyX+b977fIfN23gKTbW5B4v8UkVV4kjicuuZGYODmtynyQxBR6OsY6nHdh9ZUZreVMqcamiGb80ciZb275/S2cYp5Onse795rY863ngI7AZAqu+/4h5J/SAS9HFpK0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932807; c=relaxed/simple;
	bh=G6EVvvNEzreTlsg/p16Kyhu0f2y/0NPsX+/zSolT7uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9XpeLfay6XU6iNHo6GLTMxxvOgHYnbjI4ROBh8hQ+MMHTa9sG8BFeVSO8DwFwy+nptvHGoHuAIQacWhsf+jRehbQ+uXA6JuWEJTvihDUqpB3a+zsxntyqTRmov0gob6HpWYAlWsRk6p6yyaa8lqbMwRQ0P1oYaJPjGBFJ48TcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k/zjAc72; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932802;
	bh=G6EVvvNEzreTlsg/p16Kyhu0f2y/0NPsX+/zSolT7uY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/zjAc72mAxKepfc3Mr5oy2O21Hmv9B0aglKIwhA+tcvE4b0cC75+N6BzHCIYA3XS
	 dN5d0fVaE19xF2Mm+spmoE7zHtg0fLt1mh3dQ0uMk5478v6MsPV8zu3bCz8tqPm6mg
	 pkwn6pqplc7CosKkjqAe9xeIIDa024Dh8PzC+cmf6UAQDgUcFx10w669UZ2VM4GNmi
	 8XTJeECxzrNmNmHb10PEjPmC3zrYstGlqoj0jFW4vvHdlu26K3vnV1pCWlJfQu9uXb
	 xmdeiBmAvtvfmmsPUJb5FlWcyp7Xto9tIPZPagE4DgtJopyvFnmNm0gLuecT/Ld8o6
	 Rzss4TO5hOWrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB6DB17E1091;
	Mon, 15 Sep 2025 12:40:01 +0200 (CEST)
Message-ID: <29861f71-82ab-4fe9-947c-45d9b6e4b1d8@collabora.com>
Date: Mon, 15 Sep 2025 12:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
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
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-8-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> Add MT8189 encoder compatible string to distinguish former ICs
> MTK's. Compared with MT8196, the maximum resolution of MT8189
> encoder is only 4K, and the fps is only 30, which cannot reach
> the highest parameter of MT8196: level6.2, 8K@60fps.
> Compared with MT8188, the level can only support 5.1, which is less
> than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
> that of MT8188. And MT8189 could support NBM mode.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



