Return-Path: <linux-media+bounces-34841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B60ADA569
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9497D16D324
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF30519E968;
	Mon, 16 Jun 2025 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sQwVF5oh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94752E11C1;
	Mon, 16 Jun 2025 01:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036302; cv=none; b=kLkbVPB38E/IeP9SScGZjuDRoz+tNFyD+87i1QgrboMaO8tiIV5qhvf1dLyWtFeAbi0NFT+gcyF+Gntkc6YA2cOXzeRyGvtK4d7lF9Qccn721TCeoJDA/isOXPZGBBEOlyEec3DVRR5u5Xv2tGOKGSqtWa7CYCrgVQVJX80IN4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036302; c=relaxed/simple;
	bh=P09aMyKdTPlWnwN5aFYzMc/EPJuEBzt1akqpVrYPsd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ho1xkL/Gu4fQ3rt80HfONFtnDB5tEjRQuOHJlhNGd31hWuDPOsQziByZNHU3ZXiMoK9FfbPqoIqbTUEbIAff80kqXSisgmZsAWhiPLIxK3f8WdUSZWTU7gtgBJ9CiJsdFgRU2JZmxl9pm9mhgnvEOJMcBRVyGk+zOcsXxsgDb4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sQwVF5oh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13365E91;
	Mon, 16 Jun 2025 03:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036282;
	bh=P09aMyKdTPlWnwN5aFYzMc/EPJuEBzt1akqpVrYPsd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sQwVF5ohvszyF0THx+nNLSSzzdsZGxE+jROnMDOUw+kWQkLCUCLuDmUzraqZZnsEq
	 ayogE35CvD3HKaZ5uqVh2ALBfnO6s8IDbPhmC6XNT7ajGS/SEfYukAfpgOUQBeHjgp
	 hsoneuUf7VkHQf3ApCH1XERJjpZrlvVgHxI3JxcM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/6] dt-bindings: media: rkisp1: Add second power domain on i.MX8MP
Date: Mon, 16 Jun 2025 04:11:11 +0300
Message-ID: <20250616011115.19515-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NXP i.MX8MP, the pclk clock required by the ISP is gated by the
MIPI CSI-2 power domain. Add it to the power-domains property, and
require specifying power-domain-names accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/rockchip-isp1.yaml         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 6b360cbb42e0..477c21417e75 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -71,7 +71,16 @@ properties:
     const: dphy
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: ISP power domain
+      - description: MIPI CSI-2 power domain
+
+  power-domain-names:
+    minItems: 1
+    items:
+      - const: isp
+      - const: csi2
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -162,11 +171,19 @@ allOf:
         iommus: false
         phys: false
         phy-names: false
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          minItems: 2
       required:
         - fsl,blk-ctrl
+        - power-domain-names
     else:
       properties:
         fsl,blk-ctrl: false
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
       required:
         - iommus
         - phys
-- 
Regards,

Laurent Pinchart


