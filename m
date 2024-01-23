Return-Path: <linux-media+bounces-4084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA2838E4E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 13:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABEEC287DF9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8AD5DF13;
	Tue, 23 Jan 2024 12:17:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B6C5DF01;
	Tue, 23 Jan 2024 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012249; cv=none; b=KtYkSZu55mUuS8+LxGds2BbECP7pnAv2fhHkY5dJAG7MGS9rKBIZ/V6r5ZgoPjRU1cxAKfK2PJMhe1Qz29fWn5VC4Mx5rIWku7lvtJac4kf42Yjvup6x0KteET7exV3xjxm+Iv7u/givmPzDcnazS76ce1SMYAxu6qF4/7hm5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012249; c=relaxed/simple;
	bh=0LAj+ZWC8laBwbgax9DyXQp2HipmvneHGDfsSje1EKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fbubiP8W2jUBoEfSerDOcTvbONyYj0aSH5cA/o4+f4y+hHsT4AwJQmzYDpW/QxpCWKmThJALGoEf01r6Uzr3/EYOOCuwVCSUUB9oEzBPpFmEu1jm59tSoTcz951I/AfUzeAVPdI4w6DIm3sG1zliEs6sF4CQ04zp7vBMxTZJ0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195343452"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 21:17:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A462B420E34F;
	Tue, 23 Jan 2024 21:17:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/5] Add RZ/G2UL CRU and CSI support
Date: Tue, 23 Jan 2024 12:17:15 +0000
Message-Id: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to enable CSI/CRU interface found on RZ/G2UL
SMARC EVK using DT overlay.

Biju Das (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU
    block
  arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes
  arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
  arm64: dts: renesas: r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C
    frequency

 .../bindings/media/renesas,rzg2l-cru.yaml     | 43 ++++++++++--
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  1 +
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   | 69 +++++++++++++++++++
 .../r9a07g043u11-smarc-cru-csi-ov5645.dtso    | 25 +++++++
 5 files changed, 136 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso

-- 
2.25.1


