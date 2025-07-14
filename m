Return-Path: <linux-media+bounces-37678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43592B0439C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 937064A26A5
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0868E262FF6;
	Mon, 14 Jul 2025 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ah2ujZ2z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129525DB0C;
	Mon, 14 Jul 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506376; cv=none; b=V0dTKTQXjEBPWDX9LWKJhcZVnOIUd/Q4US5hv7r3kZ4AkJR8z2pJU/5XuoGDXjOaQbD3oCjW1Z3iz0rcu2q00rgaApaKrcvvsMZNazLdAJ92mEN3Mqnx3A6A0PtzEUyMF7ZFP0IbOZeYb+CfizOmHkSD73tx1fA+ytaGGSxTayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506376; c=relaxed/simple;
	bh=D+T4lho+lJiTKUNWKMqrI9yWQIYujo4mbK4yZgJVQj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9GJ58jfGR0lshzfSKe8tvDBuotdx4Se3zol7MDCYk0Aml13bNkhWSOTk+38nksUQCEA+8ahl50aSfEmAnnbelDsD45agi9qVwxLZ7Mj0E1zD/ucQoTdDVpzKB2nCYDlHAL139SRS00fOHRgcBPe5fnqz2aCqckFpY6X+uZtkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ah2ujZ2z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66313546F;
	Mon, 14 Jul 2025 17:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752506338;
	bh=D+T4lho+lJiTKUNWKMqrI9yWQIYujo4mbK4yZgJVQj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ah2ujZ2z2mXfD+nsBT+OpNpsVU6x7HEwkKXsrzDc93t5Gmgv7pNA52FUvBacGRCji
	 Q71IKNLf987//QZPkgUSUgkpdf/AVgqxPjRImf5I+hh96h2rMlBUPgyruHkoFf3whV
	 3nszRn0TS0JvLBF98cneArJua+06Bxk2bkBprKQk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:19:19 +0100
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-ivc-v4-3-534ea488c738@ideasonboard.com>
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
In-Reply-To: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=D+T4lho+lJiTKUNWKMqrI9yWQIYujo4mbK4yZgJVQj4=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR//GXU3TD6pwS/x3adNCC0jJm2RtiqFeUKYF
 7fDSinU1XqJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUf/wAKCRDISVd6bEV1
 MlRoD/4jnL75OJwSZaCk7/qFiLjBwCF4UyWJkuCqPoJsxlx4hOV3T7eNQLiJqgqaj37jyCU8sZD
 IRZhnK4BXfr6JhoIymm3ZDbiqF5uwvhLgc3nrNZLNFk+hW89OfsPRzShsckwSHQ2v1wN90V5syf
 bHpXtbO+VSJ48Vdis97Z1bEJoICXbNSvc+qYlJd1F3/ce8HzDwwHgyHJkfDcTgnNjQlzOWjb9wA
 xy58mffE5VkzhABUrrjNRt4gDfCfntAKfNCa06Hb2/4PGGxs0MjWOkYl2D1yGrQxQylNC/XBMR4
 zxt+YZYsT7ys9FsPMntjSU6FP/5/1cwI3If0jfyU+815/K52cMmwTAV/BJiN96BZsI/RMlTLJ/6
 pcRlyWzRKBBECQm/0MmZqwfQWTHCcn+ShHJxt/zTqe6aq6La8ZCYqnSU+5ZrOLI3B9H8z74ogzR
 89WrJ+tNmsYUYG+kbL/3uZQuVtedE1TfE4Pdhld17+jJGhTgdsVaIP/mmWxCs3VsP1gcmGe/Z3s
 CZ+BYAuhPH/erRBe6qzdDy/5lIFc3G578ar47B3W3uK323XcpqEZHXbeFBuzzzjgtAnVSJnwby7
 uFkzRoCC/W22SymgEVY87aWMLxStzTyXvHQkyWctqUQ6jYeK85UBDI1DNMhn4d3MGCXBtEhOxdN
 TI4sgQwtxQtMcTQ==
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
index 3a53565aa34897e5df13f0420908598add5b28fb..4f5bf6d0db54976360b2019119fc55f78cae6a96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21190,6 +21190,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
+RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

-- 
2.34.1


