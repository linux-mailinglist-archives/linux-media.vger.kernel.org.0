Return-Path: <linux-media+bounces-4220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5ED83DAD6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 14:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 821781C21FE5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFAA1B81E;
	Fri, 26 Jan 2024 13:31:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD45E1B80A;
	Fri, 26 Jan 2024 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275889; cv=none; b=JKiyWOxVabGy8FzGAXgAXfvT6PTQdLCfRdzWHoV1q8x+0sB3o2Qie5jLbA++iVfCx8NAV5DiFQ1f8uh+QLjVFoBweCmgzMU59llWIHk5ZlHSQkdYAHWSAAhr1tZAaqh5b/hnlS8wFZCq7uSebexbh6Bq2RKI+qH76TBAsLNnfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275889; c=relaxed/simple;
	bh=yq7gXz6EMMDvPq+xqJcZsYjDsjo7f4BdUx8TEsQuwGU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RRBvE7YYRslHKXNQ8gK2xWjhk/p4Eb43oyfNB6QQteI9oJ/QYX9P4oOeYqtKstFuGcVQ2LMOTCG74kwofOoMIroRrv7tUCUZYj6fRz2muzTO2VJ7o0ijcg+i7PbAVf4LQIvzIXBmdFBFvC1vPHYyMNi4B3gcuzwrl0vRqJN486s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191845957"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jan 2024 22:31:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 18452422D9A9;
	Fri, 26 Jan 2024 22:31:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/5] Add RZ/G2UL CRU and CSI support
Date: Fri, 26 Jan 2024 13:31:11 +0000
Message-Id: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable CSI/CRU interface found on RZ/G2UL SMARC
EVK using DT overlay.

v1->v2:
 * Added Ack from Conor Dooley for patch#1.
 * Dropped driver reference from commit description for the binding
   patches.

Biju Das (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU
    block
  arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes
  arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
  arm64: dts: renesas: r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C
    frequency

 .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++--
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  1 +
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   | 69 +++++++++++++++++++
 .../r9a07g043u11-smarc-cru-csi-ov5645.dtso    | 25 +++++++
 5 files changed, 128 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso

-- 
2.25.1


