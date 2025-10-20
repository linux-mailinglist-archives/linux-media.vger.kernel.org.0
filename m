Return-Path: <linux-media+bounces-45017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F8BF069D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3FB3A450D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55642F548C;
	Mon, 20 Oct 2025 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dcUcu3EH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B72F7ABB;
	Mon, 20 Oct 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954675; cv=none; b=RiNYL8ZppcEYlhYVGaxb/VMKZNZz4+1s71sr4A7nIK8AM1fKosO0gDF1gywxuoDIKtgiTLjeRgFPBEXkH0a05IyPqiEdVH5Ix9DhefILLrKpdCZhIlfPCyDWdWyEsmfzL47QT5C5K7rnHm774ntsZ3ZGkzFLB5Hj+qOJJ3WY/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954675; c=relaxed/simple;
	bh=LtNMw27Mt4P/xIk8X58zhfmW/Kpfb3u6BFl+S4hGtOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndz/5NFivXffhRbigFtQZRP5yOS9fJQybfmTfSAuIAQP7kc36VrGMfSywTox16yLBz3nqrwEnm0njh7Ks9PJUua4GyqdNjtrz3uI+bqynPfMQHjD/uX5Pc13EP4eKwzdLNkJ9k1r0qW3l6zlABFo5POD/405BFwaph/trHd/JrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dcUcu3EH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954671;
	bh=LtNMw27Mt4P/xIk8X58zhfmW/Kpfb3u6BFl+S4hGtOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcUcu3EHnYluDoVoXcR9F7BHxyUnteEIvpDOxMvihLuRILQvJt1kaOtpbok9FeVnv
	 ydt+vSbxyfDeKJIE5380rO0PKXLIsUl5Il4T5BpncFm9JbqQFaAM5dfiD4Mbqbu7FK
	 fExDvjYCnmsAbqBf4a7URIuSdtiEX7tfC+hMg7X18itkESzk9TovchiewMukgHcevh
	 dJz02idY9Yt0KOgFcJgX/65eRndXReihVKMYaBQRRERf5aFkHfPQCg5byFqovQaVAJ
	 jdjb/VU7J/IXjT5s4Y5aPx/dO18lDsmtndNjhoQPAcRg9IV1XRN11wE143NK1CpX35
	 7u0S/BUa4RRrw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7C7517E0FAD;
	Mon, 20 Oct 2025 12:04:30 +0200 (CEST)
Message-ID: <e28e45ee-db95-4c32-b2e8-16849670eaf8@collabora.com>
Date: Mon, 20 Oct 2025 12:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/20] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
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
 <20251017065028.1676930-16-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-16-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



