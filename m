Return-Path: <linux-media+bounces-44076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24CBC8D4C
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7B5A4F98B2
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817572E093A;
	Thu,  9 Oct 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N329Svei"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A072E041A;
	Thu,  9 Oct 2025 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009429; cv=none; b=erVVBdLBL+fHyiKXu6xF2xLH3WkZzMOIX4FhBwyp9iK1AQyvs6q3uyDZFO2cO/9RMEAZL8dMdfHPcRH0Qyg1sCVd8UaqqbXDLpeKWASdMnd/Um70k7AMLx89KMCGwamHFiyTMYda7kFHPhhUDHKJm8XDbLIioFE7rr0yCZAqess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009429; c=relaxed/simple;
	bh=wkr+BbTt8ZNajYUzJRj7OVCp+ZUk0tcmtntRu+lp7sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3I1YZ64eO5HvCOpVqvnWz9j0kHazml0GuKKO1acZCw0IV+m6/EXLBzjd3MzLshVjJVqdfDfDMf+CZPLRPP/LVHhVcS3pltHZU3KgpJ3WdI7Xi/jV9JmZ0fvtH8Sbl1GpxVMi/DE8Fz/vwQ4hbjmUJOO48zUc4znOuS1142nHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N329Svei; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009425;
	bh=wkr+BbTt8ZNajYUzJRj7OVCp+ZUk0tcmtntRu+lp7sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N329Svei5Ag7vKH4/YNBrb5lKtrWlj26RCd3ev9qO+Her1rs7PA0RdOd0s2+OtvCV
	 oXH7HkOBckPuvY5/o0pMEM7PoZAbI18Mo0WNeIEp/vTpc2DwUOk7O4+j0JbEB3d7Fw
	 +WAru50p6h2Vbx/QyDBZbofEx41SNy8OKW9Uk0rioDYu8Gcn0bkI3RIEky9DBo5uAS
	 IGr+e0cD3xZZpqsPzsLJWTaFaJWrRA2sXYhzNyHCQwfB6upYVR3t6NX7wF7M8kcffb
	 nWH/FZj4nTwDspa6pChC4CCzhmv8Fb2lje3QPvbSt4BLZS3Htrmp9Z6Fc91F9WjF5K
	 mBaQ7du3GhzKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DE5717E12DA;
	Thu,  9 Oct 2025 13:30:24 +0200 (CEST)
Message-ID: <12fea2f5-997a-477c-bdd6-f40ff2baa17b@collabora.com>
Date: Thu, 9 Oct 2025 13:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
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
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> To support generating GCE write instructions using both pa_base and
> subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask() have
> been expanded into four new APIs:
> - Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
>    cmdq_pkt_write_subsys().
> - Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
>    cmdq_pkt_write_mask_subsys().
> 
> The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be removed
> after all CMDQ users have migrated to the new APIs.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



