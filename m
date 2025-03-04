Return-Path: <linux-media+bounces-27445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCD8A4D8BB
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D626C178769
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372981FCFF0;
	Tue,  4 Mar 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="owCgTfZu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99601FBCAD;
	Tue,  4 Mar 2025 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080936; cv=none; b=hgIjOHsX9G4a0CW5157/emJwLfKnkSOq/jaZPx7DH7xGFeph0lKNZgp2bRvpHOxFleEois9NhHsrjtdw+9NCPqRG6j3FFYomtBXdGwjgo/1olD4KR70Ix5thTgMLtfTw+4HxxniOGfckhXN3PkdCw60pa60yh+buCh4bUrAgOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080936; c=relaxed/simple;
	bh=5J3RCvW8I/AvYVkLawf1nfGsr7tulDAIHBWxPLYvq1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBHkS1EMe3dImk6NdFO8+5aW+5nBnuPE4h1KG9gZ1qjtrD1h7S7iql1NeWp2oyZ91pMKHTTYOVCNFjlzZ4L5YDid0gZ18XID7TjaAkhqWT1BF8Lns+vE/7h+QOm3rDVX+4oNv49w7swxPMyYih4/RZmSs1Fp5ZfNECU8Fk3iFCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=owCgTfZu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741080933;
	bh=5J3RCvW8I/AvYVkLawf1nfGsr7tulDAIHBWxPLYvq1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=owCgTfZuYvHdiCtMekSe4va90H4jc/rJkzQnWkBlm3uAn8SpeyTuN9tRrZvUR2nU8
	 2smnVSWVBc0Eki9A7tT5rcg78qn85Hn7hb+JBdN2+p/34LEpPkm4R83k14lXPqhAQe
	 I+R4CFLdvVN+owGce33sePsnqHwTaZrZ3Zo9C0JO85T5LGb+ziDCQD7SgDj6eXQAEN
	 i05nACIW9LxJDMR72jUixCt8G27A3/hYnhBz5sBsKNqcRohgDua1l7ZOgYfZLptC5J
	 asqXkAUT7/7Ex0KPX1JMwYcpRLSH2qh4BnJIg5F9BefxtqmsakhzPmrlytPNxDRyft
	 z+DOsT2m25NGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22C2317E0607;
	Tue,  4 Mar 2025 10:35:32 +0100 (CET)
Message-ID: <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
Date: Tue, 4 Mar 2025 10:35:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> When GCE executes instructions, the corresponding hardware register
> can be found through the subsys ID. For hardware that does not support
> subsys ID, its subsys ID will be set to invalid value and its physical
> address needs to be used to generate GCE instructions.
> 
> This commit adds a pa_base parsing flow to the cmdq_client_reg structure
> for these unsupported subsys ID hardware.
> 

Does this work only for the MMINFRA located GCEs, or does this work also for
the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?

In order to actually review and decide, I do need to know :-)

Thanks,
Angelo



