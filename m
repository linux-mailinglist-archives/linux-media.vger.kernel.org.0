Return-Path: <linux-media+bounces-5083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC46853325
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B4B2B24CE4
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC6557897;
	Tue, 13 Feb 2024 14:29:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410B65644D;
	Tue, 13 Feb 2024 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834590; cv=none; b=FEFEUoPtGd1E3sWBPYkSbwXLDxBI1wLQ6qtJbfvrGJW1pTbKkBLhaS8b1CTGr/Uza7RpesFCCyrhsw+kZTYLFiWWmUlzoxaZ8NMfltqcMaa3wW0xqRGp9b7jTxVFlrlxRTCKrKnK7dLsZbaZK1duUnlWLefiJpF5o8L5UqcyYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834590; c=relaxed/simple;
	bh=wNNC28IRSm93x+RfejnT+TwNrJFRSO/390Mrzm6zIXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QkRjhQC7PF+NfR9Kx9XMVrkRrjFKDSj9PuJYcdQkROKsKPxzjNPdrpkU7KXyiZ8QwGJP9DHNPGVFItwdmWqtcXdg/52/Ur9Z+nmBMf35ZAb38JAvCG7diUzN2/6z3MWPrbvLM1bgkc27RVPCetLusYDEGd+3JLPOENYoqnLSaaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197702691"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2024 23:29:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4FA184215B71;
	Tue, 13 Feb 2024 23:29:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
Date: Tue, 13 Feb 2024 14:29:39 +0000
Message-Id: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to Document CSI/CRU interface found on RZ/G2UL SoC.

v2->v3:
 * Added Rb tag from Geert for patch#1 and #2.
 * Added Ack from Conor Dooley for patch#2.
 * Dropped SoC dtsi patches from this series as it accepted and
   also dropped Overlay patch for enabling CSI/CRU on RZ/G2UL SMARC EVK
   as it is sent as separate patch.
 * Updated commit header and description of the cover letter.
v1->v2:
 * Added Ack from Conor Dooley for patch#1.
 * Dropped driver reference from commit description for the binding
   patches.

Biju Das (2):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU
    block

 .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  1 +
 2 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.25.1


