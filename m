Return-Path: <linux-media+bounces-37347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD64B00A61
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A46566EDE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EC52EFDBF;
	Thu, 10 Jul 2025 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iTkJ5paq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464C199BC;
	Thu, 10 Jul 2025 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169730; cv=none; b=M9dlFGTIu0yo0Ma44JCeF3OjR1yFSekOTFrxKIayH1xDuxIQrzgFTtnSRSPgA+E6jifwXn1ntpFtMBr8j2pIpHFJxRTvMsFAGFc+fzfCPFd8nrKW3rnQyFjn+xidw19FDMTPDA29H9rmO9l+yVq9Lmcyfi7RKZOkYKVLq79Fx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169730; c=relaxed/simple;
	bh=QVm53DXJ+wN2MZYHEgiDDR1jQ2u1N+QmeV7gC+mwL48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2PG2R1NTjUHkemtY2anlKte4nyOFswj58LYYcavIfbPjKkw7EWUopJV+ffReWKL9RmDzWkEol8y67z95NyJvQYVDBM3TzBFkQTCqI6vpfUUEDeqykzlb3yAkllIMN3OJ1byi2uo+MtGS7PTITXcY/obJLhTfBlc7ylEwr7NUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iTkJ5paq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 369BF1A9A;
	Thu, 10 Jul 2025 19:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169696;
	bh=QVm53DXJ+wN2MZYHEgiDDR1jQ2u1N+QmeV7gC+mwL48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iTkJ5paqllG5+FEOawWCh8gJfg6kGfJy06GXCJmXzbjV93mTnL+7w7ZXYFa0IytpY
	 PLxu7i3M0BxKS1Su19XuIyOHHUz/lMbWvoseYplL7WK5Z9AhiUAIy5OJZwBKs58Oyh
	 GqkFR0KRcI1VqrJ2KFOd/y99wDcihD1rAWP1P79Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 04/72] dt-bindings: media: imx274: Make clocks property required
Date: Thu, 10 Jul 2025 20:47:00 +0300
Message-ID: <20250710174808.5361-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor requires an external clock, and drivers need to access the
clock to retrieve its frequency in order to configure the sensor. This
makes usage of the clocks property mandatory for a system to work
properly. Mark the clocks and clock-names properties as required, and
update the example accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
index b397a730ee94..b06a6e75ba97 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
@@ -46,6 +46,8 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - port
 
 additionalProperties: false
@@ -59,6 +61,8 @@ examples:
         imx274: camera-sensor@1a {
             compatible = "sony,imx274";
             reg = <0x1a>;
+            clocks = <&imx274_clk>;
+            clock-names = "inck";
             reset-gpios = <&gpio_sensor 0 0>;
 
             port {
-- 
Regards,

Laurent Pinchart


