Return-Path: <linux-media+bounces-42962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6CCB92A05
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0460D2A6EDA
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6367B31A545;
	Mon, 22 Sep 2025 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ebwaCkxH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F92EAB64;
	Mon, 22 Sep 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758566646; cv=none; b=bx8HLSZEokhdD+8K1Ijry70ogecwg+5N8FRybl88hVSRVVDQL4qxQ/mwGP6GTDHXqnKD8FGjaswe8oTLpAbSnTvSb/e/t4CKAE7GyBQ4ZJ7WzcyEFpu2lmikfoJ4FMUieqqdj/RKFxf5F5NBzhs33nHy+F7PDrDC0buElHpxfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758566646; c=relaxed/simple;
	bh=qJ+biJM2TwoXnGA56XQYa05itNz8yBOcvDagz+NFrGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D/46b346d3wCrvDYdNycR4NZgaJ5yVCEFWSaIVJYmyb/FmB58ujFXam+EVmkW6j2c9feSexafBb1y5zcJrSSlUmdVh4TCDoygRBUQa7VpD4/GbmrelOE/VVn9KbOY9GEcTBsc3cskIjGdF3DxX9hw0jPOAm03oEs0gMNHvA7tp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ebwaCkxH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758566642;
	bh=qJ+biJM2TwoXnGA56XQYa05itNz8yBOcvDagz+NFrGU=;
	h=From:Subject:Date:To:Cc:From;
	b=ebwaCkxHDAGHYS4qE8QPgOdYsJO6p5SHToqt6R/xmZUc2nyC5YmOn1TmNIH/TLIjX
	 WqaAwY4noR5s0Roa9ac1OaDa08wQIQDT6xtmUmg25QzyM8HdIb/icMWquGIN7i50Cz
	 elcNukL3U+BSecVNtDaJ1/FrVAKZ98CZ5meoEr5Ka+9DcoeRlPY51n4WpjBQXiUsMe
	 vO8OkI5Nx7asWoNczggXDG3Uf9wjsfjoAZdZrarvAxelWxxsVVmCeEQSEPNHFOyA1b
	 iebbRxnZKeQtOGMZluTaAKXwTQpVc64UzS9xBlkkGxOz3a9JBfwITtxRt2q7RpTsuw
	 mPVBEYdQmhrXw==
Received: from [192.168.13.179] (unknown [IPv6:2606:6d00:10:aee0::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CAF7517E124A;
	Mon, 22 Sep 2025 20:44:00 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 0/2] media: verisilicon: Fix Hantro G2 handling of invalid
 DPB index
Date: Mon, 22 Sep 2025 14:43:37 -0400
Message-Id: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmY0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NL3czcCovcQl2gXElRvm66EYiVrpucZGCSkpxiYJ5oYaIE1FtQlJq
 WWQE2Nzq2thYAdneXa2cAAAA=
X-Change-ID: 20250919-imx8mq-hantro-g2-hang-cb04dcd07a84
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Stable@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=nicolas.dufresne@collabora.com; h=from:subject:message-id;
 bh=qJ+biJM2TwoXnGA56XQYa05itNz8yBOcvDagz+NFrGU=;
 b=owGbwMvMwCV203FKoGZC0RfG02pJDBkXZ3yovtPKc/bayuTVDL5Te89tm/FbdErJsc2fd4XbV
 7fkbXyo1FHKwiDGxSArpsjynjeoUfTI4UNSLPlCMHNYmUCGMHBxCsBEihkZ/odfUsnYEhFo8fR7
 rNdNKW3pL4opq9dsnJ82w0Q2ereLgSDDf/8GueoZh8xYDdZ+yG/fINd6z3b93u8P9u5lXcdVuL+
 8nBsA
X-Developer-Key: i=nicolas.dufresne@collabora.com; a=openpgp;
 fpr=EF0D528115C4C3C21A046F12D9419451296072F4

First patch hardens the IRQ handler so the driver can resume after
hitting bus errors (presumably AXI errors). This will reduce the
risk of having to reboot the system in order to recover.

The second patch actually fix the issue, ensuring the decoder won't be
instructed to use address 0x0 as a reference anymore.

The issues was discovered using GStreamer. A bug in the userspace lead
to skippable (RASL) frames not being skipped if its past reference are
missing. This will happen when seeking inside a video that makes use of
this GOP configuration. The probably could also have been hit in lossy
streaming use cases, such as WebRTC. The JCT-VC-HEVC_V1 ITU tests still
results in 141/147 with two concurrent decoders.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Nicolas Dufresne (2):
      media: verisilicon: Fix CPU stalls on G2 bus error
      media: verisilicon: Protect G2 HEVC decoder against invalid DPB index

 drivers/media/platform/verisilicon/hantro_g2.c     | 88 +++++++++++++++++-----
 .../platform/verisilicon/hantro_g2_hevc_dec.c      | 17 ++++-
 .../media/platform/verisilicon/hantro_g2_regs.h    | 13 ++++
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |  2 -
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |  2 +
 6 files changed, 98 insertions(+), 25 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250919-imx8mq-hantro-g2-hang-cb04dcd07a84

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


