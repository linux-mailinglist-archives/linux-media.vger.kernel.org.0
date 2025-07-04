Return-Path: <linux-media+bounces-36830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52CAF916C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF2E5828F8
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515AD2C15B5;
	Fri,  4 Jul 2025 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PbIAcPqt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8272C15B3;
	Fri,  4 Jul 2025 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628052; cv=none; b=UhrIn85Q/zAYKXPzEOpIELbekLRanQHYVmr1HCS2weVj2n6xPuMhYGPt7Qm6NlacS9OHi+lMgUUvgsnOcealHfvjutmjpAWgTC/TVOcMEF4fUMhwu/35x4iEgF0K/Wl2DFs9FDMhSjYPBgPSeViv3DpACVe8Oz11/5y/jznvTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628052; c=relaxed/simple;
	bh=HTdso0RtITYclBAeLKTHPDfeiMK7OKZSCsVsffkY8Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sie/21KGATDClH0N0jt4NHy1ZCjac6U0FWZQu2wUdsfZOfq9CwMZc8Dtn+2uVKGc2IxHfRY9JtEkIcQTWYaCzf6OnVFuXwdLYUrOJA+ZO8S/5RIwV8efRWm7fcrvZ0epXG+rGaxkmV6qOWX/Gym7uZQ0XVkLm0laTgvj5M2ugjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PbIAcPqt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51CCC833;
	Fri,  4 Jul 2025 13:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751628019;
	bh=HTdso0RtITYclBAeLKTHPDfeiMK7OKZSCsVsffkY8Zc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PbIAcPqtK/XoecvivT4H+wgtb8ODg0FrQDwJnBoo3kaq3V4Hfr9dcasIF6HJ0XlxO
	 2Nn/cGOrL/XgfllvSBtkcFBICKtPeKTLWdK/wy79BXZqpdWT0eY5+HFJsKX+XVaWyD
	 Iiv6rlhzGZW4U7yzrCMvGJoX+zPjDJPtems3K658=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 04 Jul 2025 12:20:22 +0100
Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for rzv2h-ivc driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-ivc-v3-5-5c45d936ef2e@ideasonboard.com>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
In-Reply-To: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=HTdso0RtITYclBAeLKTHPDfeiMK7OKZSCsVsffkY8Zc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZ7kIG+7+LoqwHri0/AHXF7/zGSfcrswd0TTDS
 DWc/68JvBKJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGe5CAAKCRDISVd6bEV1
 MpHEEAClEaII8hGDBkmhlZmKCt7l1Vb+1Fk8lGVqk149AcOjcZKwJAJWBBKaR4CWGQbmW/24D8H
 NNSa8nfR4c+FjC7FMw+lkvHcP0xcp3UOS4Pw6i5ctQe+G2vcr7DWP6xc3IjWW3EBA++s8S1A72d
 OWMlzdeAYVGmObxKwWGq/w3KeYI3GcUF7iYOwwXXd/BWmEMAzVJ8csmZj1saRH7oLjhuVPYMig8
 AZs7+1AEE2Tu8+3/4tNnAPJ9T5lNImNiOkh4wpl0oi+F+ptbJNgoMHGLJ+t+wOI1DV9i4o9uRbg
 PaMl3pDcEiVQZrxtL0+4pBIhbLAVFOwLKsl/RmmuxIoKmEY2eMEctGfWKK87TbITuU24NsWh737
 OS64U5OOmBrrDyKAn9DZaa4zghm245FFvXdg6U7zV/9b1pJWhJgLSFcSIafdx9zuRlL0bSuPOLx
 to8juBArom2BMbNtaUtdI+fHO+Dv7rLLHQfXV7ZFNdg7IC45tyHX8nKyzwHXVyevrcF6/71SQLh
 lZJiiN3ZJ/8eRGF0372Z+tG7qDC7RMveGgeRcLOG5TPVyOpef+mmwNJK2oQEBBDnm0sk8yfIJI1
 3YDXSXLkdLiG2amqEc1ad7DT6VQzTXY/ZQc/jl/zLb2YygGt1QbU8UWk9R33swavKxyMO7NYf9w
 2cd2QAd/ewgj8/g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add an entry to the MAINTAINERS file for the rzv2h-ivc driver

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v2:

	- None
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 276c5a0b2dc58589b6bc5cc9ea549156ad088bdf..7dbfc61a4b18d478c67a4d939ddd0ec7e08b96ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21166,6 +21166,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

-- 
2.34.1


