Return-Path: <linux-media+bounces-15784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C18947F2D
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 18:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DEC91F22735
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7776215C134;
	Mon,  5 Aug 2024 16:22:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C106115B155;
	Mon,  5 Aug 2024 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874926; cv=none; b=YEHS5+UgQnaa1I9SePvb+SyigMMbD8QofkHbN5w4ZY0S+r/SMkO71dXdluuyNBEBLsH+HNSvM1pR9flKQa6qN8ewkP0cArwA8ppp2pbQetWWgB2TWlEMF/aNEt4qObHGRW3Y+eg9IzJwdzg3CCUS0Z3dSgMYO/EW6JqXD9Cc5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874926; c=relaxed/simple;
	bh=6a3BS3tV0Qv+SfzqBC0TevIcJzOJzC5EoJ12fFLAMS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qr6LVuNRT2rph8YXb0MoebzbTKYzSmq1ZfHdF2tlcu8+KBRTG6BqiV0lnPi32sh6zBgsISV/DgutFVetxnjECuWX1qTbErp8wMYQPkIOAG/r4MHNYMbN1NWUB2M91M6+o63hnIPkBGNOhtgIfLHuFHW/blmDzGPfs0ESIYCHkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,265,1716217200"; 
   d="scan'208";a="218709707"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Aug 2024 01:22:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 273BC4009400;
	Tue,  6 Aug 2024 00:52:44 +0900 (JST)
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
Subject: [PATCH v3 0/4] Add support for RZ/G2UL Display Unit
Date: Mon,  5 Aug 2024 16:52:34 +0100
Message-ID: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
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

v2->v3:
 * Split patch series based on subsystem from DU patch series [1].
 * Replaced ports->port property for RZ/G2UL as it supports only DPI
   and retained ports property for RZ/{G2L,V2L} as it supports both DSI
   and DPI output interface.
 * Added missing blank line before example.
 * Dropped tags from Conor and Geert as there are new changes in bindings
 * Avoided the line break in rzg2l_du_start_stop() for rstate.
 * Replaced port->du_output in  struct rzg2l_du_output_routing and
   dropped using the port number to indicate the output type in
   rzg2l_du_encoders_init().
 * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.

 [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Updated cover letter header "DU IP->Display Unit".
 * Updated commit description related to non ABI breakage for patch#3.
 * Added Ack from Conor for binding patches.

Biju Das (4):
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
  drm: renesas: rz-du: Add RZ/G2UL DU Support
  arm64: dts: renesas: r9a07g043u: Add DU node
  arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

 .../bindings/display/renesas,rzg2l-du.yaml    |  35 +++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  19 +++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 109 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  18 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   5 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   4 +-
 7 files changed, 188 insertions(+), 10 deletions(-)

-- 
2.43.0


