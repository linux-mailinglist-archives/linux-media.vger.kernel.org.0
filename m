Return-Path: <linux-media+bounces-45015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA0BF064B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D01734B254
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D4A2F7455;
	Mon, 20 Oct 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DRhdYVbr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B22F6566;
	Mon, 20 Oct 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954672; cv=none; b=H69AjFgNNnLIMekEvd/XeJHpwfm3Bc51C912nEmbU50uhVN+w35N9SxqT/AmVGbf3CxhpqocqE2fWreRg3KkKA+1RAevzyynXe0mY2p+f4BMzoZMXVZJIhCRLlfwDr4rfwd1PFmziuOPl5PdiDJdkOZMOdCnO77bWNMb/4Jz6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954672; c=relaxed/simple;
	bh=L1rux84uqgx/z11sRLkzA6t6Db5oXXI6MffF6eUjKHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdDcbxcgD2Lb92drDS3+WKudtmoBJZAkYdWYx0s1yhDo1tIWRN36Z33CJI7EAYhqKM+FZ+f2fM1OvveFfUSOqRpJbStIwGYgHB2fg0i20gTioQi6RdftNE++q2amF5H1VxXYNcUih1YxR43VW2XITumwiBDGeRZs1tjL58kTQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DRhdYVbr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954668;
	bh=L1rux84uqgx/z11sRLkzA6t6Db5oXXI6MffF6eUjKHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRhdYVbrEghPgLy5Qcqa1koh1Qni8U62cjyXqlP4zHLE1ILf7rnxPpwQjAUw4juEo
	 nh++ADgODNcbf3NB0UiAU3avqnYn5OTwRZCzNIhSiJLXgehnwMzvZ/Xof2OxLm5w0b
	 0UDf8QiP7Xe+KGG9CLfHwXS/TIdZxl1VQdpRPytPuixPJ9NFaPzMNhYxRy1lvMZzmB
	 4X/3xgZ9WEs9pkPJpE3IPSQrBJz9aVZWwNTWKi5QHMZ2qXNopcdNtzm8V1ul55Xw0l
	 KghISDNQZZHriuQaTI+p+WbSr+HiQz4k6ZBuBb1Wo/NrMlXs1bpR79iLB+TXId978T
	 MvXlpTXrmVBSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B0017E127F;
	Mon, 20 Oct 2025 12:04:27 +0200 (CEST)
Message-ID: <a30a7076-9c27-4e78-b57e-cdf2a14dc5c8@collabora.com>
Date: Mon, 20 Oct 2025 12:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
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
 <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-17-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



