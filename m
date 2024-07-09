Return-Path: <linux-media+bounces-14768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29F92BBE4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 15:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606BC1F22217
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A587B187571;
	Tue,  9 Jul 2024 13:52:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57CD18A920;
	Tue,  9 Jul 2024 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533130; cv=none; b=kXZWuW40XQjX98glUQdlvD7ieqqI+EwOuHqGxCKDvU0xDazLkLIwLm/t2YSDupsRgmW5U7M7Nx3oD0G92fd8F5tHw4jOW9JLstAso4dEcLaSwUvoFPyAQU49W1m68Ss7/9aG6QRKDwMH9N9Z427zkE/AEZvgqvIfUFmuaIFhRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533130; c=relaxed/simple;
	bh=8rewHxcmqYhfVpubhNLA7SsGqC/hBasB9s/0SBJtcSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Km9ahqct8sPhlHmx5I/7R6ir9lzAAFHEv0V/eS/AiVRrToK9bkQXIf06BiK3Xi7959AU+Q3YpfGh3JbH4bx3BIaWImwPBDbXPNX5V6Qzyp06om6aCBtRoH2uYZmCY9A7GlDqfEnSdNkOLt4+GzhNn2AIA8gcNaOHSwefvocMI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; 
   d="scan'208";a="210808011"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 53C2443BC48B;
	Tue,  9 Jul 2024 22:51:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/9] Add support for RZ/G2UL Display Unit
Date: Tue,  9 Jul 2024 14:51:38 +0100
Message-ID: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add support for RZ/G2UL DU.

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

The output of LCDC is connected display parallel interface (DPI) and
supports a maximum resolution of WXGA along with 2 RPFs to support the
blending of two picture layers and raster operations (ROPs)

It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.

v1->v2:
 * Updated cover letter header "DU IP->Display Unit".
 * Updated commit description related to non ABI breakage for patch#3.
 * Added Ack from Conor for binding patches.

Biju Das (9):
  media: dt-bindings: media: renesas,vsp1: Document RZ/G2UL VSPD
    bindings
  media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD
    bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
  clk: renesas: r9a07g043: Add LCDC clock and reset entries
  drm: renesas: rz-du: Add RZ/G2UL DU Support
  arm64: dts: renesas: r9a07g043u: Add vspd node
  arm64: dts: renesas: r9a07g043u: Add fcpvd node
  arm64: dts: renesas: r9a07g043u: Add DU node
  arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

 .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  49 ++++++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 drivers/clk/renesas/r9a07g043-cpg.c           |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   9 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 8 files changed, 223 insertions(+), 4 deletions(-)

-- 
2.43.0


