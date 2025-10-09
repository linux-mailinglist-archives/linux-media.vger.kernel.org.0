Return-Path: <linux-media+bounces-44071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A633BC8CB9
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2830D19E8304
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3122E0939;
	Thu,  9 Oct 2025 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kszlChMx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4B2D73A7;
	Thu,  9 Oct 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009237; cv=none; b=aQQ2TTCi+d8snkxNkEbrXkd/0eBjnvTUCVgTuP56rrG3jg6DTJQXh/VhTE59vMEaaG1GmMn6oh7CVBHtrz3l4Hkd5rUR5P/iDAPV6EwXaqQLcemOARiK2+FcY43mQfZg4f8F7uD/KHsL7+czx2CfrrA8rjttxBqrQQLPZ/ZhQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009237; c=relaxed/simple;
	bh=IArN+RtuYOyMN6ifHcTZqjTU9T5GXTomdxvkjyTpvog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0N42Hd487pusvnKa4QjIhT5vyC+7nWGVB7VbBguD2tOtxw83rvKro6RTv0lBYEuNkshkOeGmFYmSBUm7QsKhvwEd7kNmA9QwzV/szPA9jsIbn3eHHgok9zI0JX9+KATj2fo/my6PDM/MtnAnE3qFYyNuH/LsMLpow5yF9O1wJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kszlChMx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009233;
	bh=IArN+RtuYOyMN6ifHcTZqjTU9T5GXTomdxvkjyTpvog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kszlChMxGCiSID1BGesFoQO5o1WuBuD0hz3VjE50XvSAyfFhRQA/CGlbeNy5kT/K+
	 RFtHcv4v29QHI5tgz6rZLLlDBlYm0o9gXfXFgIP5rmcjK6iH9iJ2YIZMn+Dz8I1qfG
	 VN1yJ+X/m/FE8MQxNJbhJjzZigYMZ1XKcuiFDo0TYhE1KnIybMG7ucfgiuj66F3g1X
	 m1RrZ0qyxwuB02TWCt60RmfvNckDCiHqVbnhtq3u8u19gIkG2rzV8Qu8qnUFHJodZu
	 62Z5BSDKJgef74B5rK+9oBx2Yo+m+44xk9WUhZqDP0WLploZa+xYYq9gB8hRo5tXZq
	 jFyJoQsjtdklQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E97CA17E01F5;
	Thu,  9 Oct 2025 13:27:11 +0200 (CEST)
Message-ID: <2834b895-d4e5-44f4-b8b3-c892f84ccffe@collabora.com>
Date: Thu, 9 Oct 2025 13:27:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> MT8196 has 2 new hardware configuration compared with the previous SoC,
> which correspond to the 2 new driver data:
> 
> 1. mminfra_offset: For GCE data path control
>     Since GCE has been moved into mminfra, GCE needs to append the
>     mminfra offset to the DRAM address when accessing the DRAM.
> 
> 2. gce_vm: For GCE hardware virtualization control
>     Currently, the first version of the mt8196 mailbox controller only
>     requires setting the VM-related registers to enable the permissions
>     of a host VM.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



