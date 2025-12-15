Return-Path: <linux-media+bounces-48753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE4CBCE5D
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F05193014B75
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C4832B991;
	Mon, 15 Dec 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TYBnGNRt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9EB32ABEF;
	Mon, 15 Dec 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783874; cv=none; b=VUIhMevK6ytIXIeHklN3SyTwKy8zvjW7QTbKNMnJn0nlvTmtM81dc8vOq7O7c9NIBbbWeKx0a/M/WUFLsGJaDsyT9IJGO3+BLCsUhdoNZNJUEv2NjK16qDDOjlRLJGCBNwlKzHBnY7pvh0C9qOmPDmpSWZDvQt1MjTZEui3EtCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783874; c=relaxed/simple;
	bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISionGtD6jQNc0wt4sg4eaeNV55YosJgoQcgc8kvgvpL1axet/kiAehRiLVP1wsyYI1Nfm94puTxtir4I2ujGrFFP2tyJgCBxWWZvl0WGQoJvSblHoZ6nv2OeU89HdRozwbtUjafM83ZyPDSJfYny+UYC927EEdIPszCZe54jQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TYBnGNRt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F7DEC6F;
	Mon, 15 Dec 2025 08:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783866;
	bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TYBnGNRt9yRugHyG+Sb50OwS7L8h6DRl8qUq1yUYjNRypt3QJpXnez6mydwaOFiDa
	 cY7JNTEmTrD6jMAjkDgAcOKW5Jwr3SBSylXro0SncmiATiT3YCzLxWwt8r/Qbzh10L
	 6ldX1Q3dVpnoGBNLCyvevSAV+H8zAtE35PwJ5VgE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:01 +0530
Subject: [PATCH v3 05/16] dt-bindings: media: ov5647: Add optional
 regulators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-5-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Pl/hH+BNqw39kKJVWn7FBhDR2ywqsJ/MxZlWpkgdix0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jbM+thdBdueZo7/JHv86ddXbTm4TII+4Hk7
 mELWHBmrQuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+42wAKCRBD3pH5JJpx
 RUoxEAC5wcXMmq6xYriK06NAPFOw9ZMvbfWR0vdgTrV6jez5XKNIcXxtq2nIT/6t1jS3nwkPerY
 I8hZs9dfklsk9MUaWqpRyAO3I/oK2jXLDid0pha9p1x0uZUM8nNaC6DIiTQOfc4+H8eAg6RXNMT
 7YcU+6UGIFyjvO46V7tdoI7bnyIKkjTcuyqJnBwjbfXTQKa0tSs9naP0ybogr+aTe4UUndPdC3d
 wR5zuybYBiEDvBNw6VMsK5oPjRk6CdAUVdGuSHSSjqYeeKqKlNgeKLCenZQ8NqRtXORAK72AV9D
 dMo5qp0/lc842VHvstPtCllmFTDruBPRlG+9I23tf5eWGrjbrBYAZLfcwRSHVeMMRzkTPmCFxH1
 oNi65fJ67OenohupLcJFUwZPntshYmoN+4/Rsbe+hwOyEnOyDaqTlEPrbr9n4OnQv15wgH9Ps+Q
 hTDYY1jgaToGqE3EV9MU7fIkCvHFo13WlxtQGJbx7OdFJAMglyDoMG6NdjLi8Sl2+ji0/WOPTsn
 bFp6eYNqcFGsAuC1eCMHs8QyjS0ZZRE/Bti5iW7sK7V9Ppz/dY0lcHMw2QwPtp41GnhJCIsktpN
 MdkzGZDvYq7NUbTNO40nuZU2mUoF6vBWkwufcNZTj6Rd0MEjZSwMXqtiqOPhIb1p3J/MQk8bRei
 TS4UCWFO0L1tyCQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The OV5647 camera sensor takes 3 voltage supplies. So define those in
the bindings as optional regulators, to not break existing users.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index a2abed06a099b41c7b165c0650e3967ec43a4962..9d3f7f1789cdedb357dae2e18b03c5af3c0e68e3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -30,6 +30,15 @@ properties:
     description: Reference to the GPIO connected to the pwdn pin. Active high.
     maxItems: 1
 
+  avdd-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.5 volts
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.7 - 3.0 volts
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

-- 
2.52.0


