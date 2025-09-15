Return-Path: <linux-media+bounces-42549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24611B576C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658641A2391E
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80472FD7D7;
	Mon, 15 Sep 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YzdGMv13"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60E2FE589;
	Mon, 15 Sep 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932811; cv=none; b=gLkohZz+xqIKWGk+jCPO4P8tJNzNMzUw5OXRcuLOkQP2gtejfeMO5NndQfjv+5WiHecg8zZ7S5IzAE41hqRI58B5h2AKO4mYDxUJ1bEhcWSMiXxZmbeBWQSAkZtuj9UrO2iuzREs1gF9pz/7HfWhdYCENOPPhYBa2PA0lpbjJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932811; c=relaxed/simple;
	bh=YfkNuWF0UuUzo2fQZWy8bT5EoNrUHLsiRs9VwUk1PVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLf946bfF0lpFG5fMhWs7zPDWzYt2f0Io+eoF7UovI1oLg6aWz/uWx65MD0MNFKAEA4H2SnSSi9aVEXANQw75hkaBfrR/ZdgUOvKYlia8gTV2ipYcu4GDwE1mgl8WNhIzCvyqoUPo3d+fZj4Fsq3YMuXQWX0/2IEmBh8VmQ8Wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YzdGMv13; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932807;
	bh=YfkNuWF0UuUzo2fQZWy8bT5EoNrUHLsiRs9VwUk1PVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YzdGMv13sKiTswHck44V3ric1FZYkJiJTvgve65QXha4jYGt9hur1sohBLvRw0Q6d
	 E7cPUW2OgwYuNcBeu07dxzDV2GaAOyfn/VRwFehODtrjSA+LV0NsPkkUS9DwbjEh/v
	 E1S2on0kSEQoKTsfXC+wSE3Hi8YMX3vu6d0TgLtGQ2qy4v0HAE7ggUtCJNj0pn4plC
	 H9wDqYtuYxodOe475HwPK5i9n/s8J8vCLufyWZ3G6agnp27ToTtojhhO9Cohwo/HI4
	 mdBXhLWLU5Ehpskiw/GsyB7n9ZxMlWSAWh98uFSKhFl+StoPtK1K2YAZhVdjGBx0Hz
	 27qVpPuLEgLhg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFB5517E124A;
	Mon, 15 Sep 2025 12:40:06 +0200 (CEST)
Message-ID: <dc4a1cc1-da1c-40d5-a873-ba041038de2a@collabora.com>
Date: Mon, 15 Sep 2025 12:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: mediatek: vcodec: add decoder compatible to
 support MT8189
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
 <20250915091958.31509-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> MT8189 is pure single core architecture. Support its compatible and
> use `mtk_vdec_single_core_pdata` to initialize platform data.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



