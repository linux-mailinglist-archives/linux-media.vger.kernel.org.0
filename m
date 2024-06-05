Return-Path: <linux-media+bounces-12586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07D8FD1E1
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 17:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1AA21C21C52
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 15:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E235614B97F;
	Wed,  5 Jun 2024 15:41:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E6554907;
	Wed,  5 Jun 2024 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602091; cv=none; b=JOmyQc+ZjbpEi0X7lfQyznsldfKckDIddH+jkfscDufvCXl7igIqXc2hMiHJuc/Jd769vNQ66wjgj+VPvOGql2dfGuqHvyBRtu7ob7gmiTTKn8nGGxZlzn0KOS5bYJj7BJFZcf89oQxU3FRrujcDNGVBkJ+ahY6+9iRqYhI3vQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602091; c=relaxed/simple;
	bh=gm9xpFOMr3udWm98e8ijptyKD4ZlMCxFWFpdoo5qfaI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gi+SRK5d+E26co8Bt4I66TUMGGIfz4tmjH73jVS+rpbnbprMaxZyNtsRCZ4VILfQXfa3hONF2U5JHOHNRQLpqXShvknwNwl0RXH2vHy6w1Pkkm9YJLIyV4dTQO5Eve8uVKd8HbjOb7G06WUQVHVxlVtw1Mz1GnrHyyifc5fxCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,217,1712588400"; 
   d="scan'208";a="206832356"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jun 2024 00:41:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.154])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 82466400EF88;
	Thu,  6 Jun 2024 00:41:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 RESEND 0/2] Document RZ/G2UL CRU and CSI support
Date: Wed,  5 Jun 2024 16:41:13 +0100
Message-Id: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to Document CSI/CRU interface found on RZ/G2UL SoC.
Resending the series to avoid any conflicts.

v3->v3 resend:
 * No change. Just Rebase.
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


