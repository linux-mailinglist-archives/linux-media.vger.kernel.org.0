Return-Path: <linux-media+bounces-51048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209ED3A7B0
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E11931011D5
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A603431D750;
	Mon, 19 Jan 2026 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EfhulzcF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080431BC95;
	Mon, 19 Jan 2026 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823890; cv=none; b=M0KIaiwBXZOZ/9ql3xaYY1QYrMpxB5JFT+Qw1dzYDab54PoHgJHdYctgCxqZzdmF+hLjVK4dK5WhiksHzFvV8bttWhhaSwXLx2osVWkvh+UJrQp8Kp1r0AaBI3RetP4mS2HlhviLNEd2/zzccyatjZP9V+e369YghPjvNmPj93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823890; c=relaxed/simple;
	bh=jTsRQd9AGY63xLGQjAR5MzI8ActOiX3EAiNvmnftFQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HplE49T33rRV+5fY4v0S8R2PIX824MZz7ld5oIGwnyCmEX9X3SoUnRx9K+a7nQQxkdu60686qDizHsWNd0oUXxgYq+b8PSb8LVDej00tLPz80ny2HD5VcTVZUttfxq3ff5TUbz19WgZNKiCSLfNtav1EWN6r5DIqk4v+ZwHmFWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EfhulzcF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768823886;
	bh=jTsRQd9AGY63xLGQjAR5MzI8ActOiX3EAiNvmnftFQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EfhulzcFLtZYOZ0m0LmHUskUL8m/ch1z3bxJdaM9p/rUkGha6yndCy/wyVjOiWsDW
	 E1NZHLLiWKtISCmc+9pm4BxoSiI6xjsy6yCuFmNEHr7AwH1DIL5X1XmflDM9TS68sD
	 OOxN6zPEyolfCKTFiJzKCq4WCzgoKSMVzAQVfalmjp8oIOyXBTZZW9zPAWCWkd8Saj
	 BFCW7QgWJWMsLYurQhwFb8jBrMPKV11p+Mi3oFhcSG5Ml24EPqdv1BCmQZpwI/Vh5q
	 0HV4GwLUv6A35IMt8EoNIp0cAoNDPheLy0eTNoj6mYYt8Vw0AGoZhb0ZzET7B04qAR
	 qP8Oys6/HXtNA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBF7817E0117;
	Mon, 19 Jan 2026 12:58:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
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
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Message-Id: <176882388570.29723.2273368189503773750.b4-ty@collabora.com>
Date: Mon, 19 Jan 2026 12:58:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Fri, 31 Oct 2025 23:56:28 +0800, Jason-JH Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>   1. [Fixes] Refine DMA address handling for the command buffer
>   - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>   2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>   3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>   4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>   5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v6.19-next/soc, thanks!

[2/9] mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
      commit: 266f35701b6f7ddd9521310eb5add01001d4a614
[3/9] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      commit: 7005b7cb2fff9081a6b1738b84a8ea12a6781fb3
[4/9] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      commit: 1c1874843bc43d9f333d441af00f61ece2373e5d
[5/9] mailbox: mtk-cmdq: Add driver data to support for MT8196
      commit: 5ea617e818333a2078dadc11e5734886e39901d0
[6/9] soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
      commit: c775b23b1f78626daca804bd26f1460368f20406
[7/9] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
      commit: 4bf783d8415cc397334b375a05f0b2321fc6c319
[8/9] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without subsys ID
      commit: 40dc5bbad63b5f60dd2e69a32def1a2673cba09e
[9/9] soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses
      commit: 22ce09ce1af574747fce072c3f62c29c440538d7

Cheers,
Angelo



