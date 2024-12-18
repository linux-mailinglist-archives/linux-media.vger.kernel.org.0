Return-Path: <linux-media+bounces-23695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C079F63EA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5901896D68
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3F19E7D1;
	Wed, 18 Dec 2024 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YeRR4CJb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379419CD01;
	Wed, 18 Dec 2024 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519214; cv=none; b=nt3EtzQqihm9uymKBL02zteLeQSV2qA41ZZnNfInCr3D0MPltdgQy6ZhqLbWKgDtkQ9LgNzjsl5uUwh9iKHVUTR3LWz3Qh7CR9PVh8mpO0OxWoOvJ+eKsw5Xv+A1DW21LxTFXXPw0b1z+AWOLTYdkM/tHXPmkHYdYEqt6eTeH6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519214; c=relaxed/simple;
	bh=EzGXzrdmDmG67qz3B2zS16R/SVMfvEfnxeN+QoREF1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yl7Sv6dKVgO8wLw/QUcfR6g1qPJPmhMdH1sZNXeP1k1VgKVnXLTim8cU9FtxyptYVnG7H9tjcKlmI/77dTNFy4CyBdteUTMXOM2VwASATi1Asiy2v/WRVzov3aTYm9eT+66GutW+/4Ze+RnzbqsAHebjL6L2pENNvcyLRR5APxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YeRR4CJb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519211;
	bh=EzGXzrdmDmG67qz3B2zS16R/SVMfvEfnxeN+QoREF1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=YeRR4CJbxmqjOkjfozvf80dO+A/rwi1qILbZQfVMY8wTFsgh2k7Hcrtot6Bzqi1Ue
	 8oB5QytCMIHNofLQjKExy1MXduovXTmjlBcyb2fZyjvg0mJwCTTM+IiZsVcaLlm2ql
	 07O/snuC3nJg5BcO8Xn/lq8aUEWJgDHOlNH/8KczLO6qoSzwxoKMslKa0U5kY/yrkV
	 lLBRUfnzzV4Z4Go032UD1BWh3XZF7C1dc1zCzhcl4e8gMIVtKXGrqhGeu9ogivJVav
	 +QrLyzcTLX9qf5xUavQPnXxZqsbIdeGOgmyGxEDyQqbdIspNMNQLiU/2bgbaZCOhtt
	 /5zdJdZYI/Zyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA2A317E3610;
	Wed, 18 Dec 2024 11:53:29 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Date: Wed, 18 Dec 2024 11:53:17 +0100
Message-ID: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the necessary bindings and devicetree nodes to enable
the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
MT8188 SoC.

This was tested on a MediaTek Genio 700 EVK board.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
  dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
  arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes

 .../display/mediatek/mediatek,aal.yaml        |   4 +
 .../display/mediatek/mediatek,color.yaml      |   4 +
 .../display/mediatek/mediatek,merge.yaml      |   4 +
 .../display/mediatek/mediatek,padding.yaml    |  10 +-
 .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
 12 files changed, 364 insertions(+), 13 deletions(-)

-- 
2.46.1


