Return-Path: <linux-media+bounces-30219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75150A89546
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FAA73AA546
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CF727A124;
	Tue, 15 Apr 2025 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jcmq4Usi"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F4274FE5;
	Tue, 15 Apr 2025 07:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702694; cv=none; b=Lm5amOxbH2uVpnU36LumLHVb3Wc5vMULA8CPGFpOCXfI/rpxsZcMDCGv/IWvGgie8Vfm3/e8vg3/Dr3l5deEfywiTK2ioBCP4zxTxQHhklBYzUW3Ga0Pq/pidQm03n06sUl/rp3bizIW9fkzPDELTf0mNSa7DgHF5+MV8qbPtnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702694; c=relaxed/simple;
	bh=voe72fPOWYDOgKbHC5pT7xXAC4bwfo9UuMDzcL8nkW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QjHSIV0YwMY8wrjrfellsySJXQnoULWACM5OZ6x7qB8RiP0LswUZ/DBZwUJs7R/RSaYig91pPtW3x7n9EB2dXqnb3GschnfP/yjw4fFhAM2XaHhiBM/Q9EgNge1iZKBQ4EEcFTvXw08spoTQAqTSnOt1xtIHR3vyDrDYRYmBnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jcmq4Usi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744702690;
	bh=voe72fPOWYDOgKbHC5pT7xXAC4bwfo9UuMDzcL8nkW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jcmq4UsiCrCdB57TvR1j9uL06+uNAWSu32krqKm+keC4y0zXQLoMjN0x06AZAD5WG
	 pbg9rRGMBM2YLbv+qADCCpO7E+OBB8H/iFh8c5S5Xhgi8XzS8+Sfrm5N+BniqBFuCx
	 DXoOd0zYqfWuSjpZCQPSXJ5K7eJw9Kpf7Z56v1AudCc/jyizzfXtw3eJncl/rcySMJ
	 7MkUPGTFis/mCv+LrGeQBM0S2orCbfLrdw0XDdSz38O3lARniX8hdB6Pw4oMNH5vxj
	 dl9MWULi1K6pHVsYuOpNZRQWVC4Jbp6ZHFWWXyPjo7jcUaVJjgUp3nOpA+4l9UaD/D
	 uOr8Cnz534Lhg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF36017E0CA7;
	Tue, 15 Apr 2025 09:38:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, sebastian.fricke@collabora.com, 
 macpaul.lin@mediatek.com
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Message-Id: <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
Date: Tue, 15 Apr 2025 09:38:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 18 Dec 2024 11:53:17 +0100, AngeloGioacchino Del Regno wrote:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>   dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>   arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      commit: 2971de063fa56c18b2720ab19bdebca23cd96471
[2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      commit: cfb00dfa1b778a8037faf6973cca226e5ad4f45a
[3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      commit: f0935480253ede5405045a4e733f4476343cbb91

Cheers,
Angelo



