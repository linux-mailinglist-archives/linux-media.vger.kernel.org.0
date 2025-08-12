Return-Path: <linux-media+bounces-39640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1CB23AF9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804896280D0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C392D7396;
	Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LiqLCdAn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E931F29BDAE;
	Tue, 12 Aug 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035210; cv=none; b=N5Zc203YdNa6Gb35Vhbqk9LmBvojO1nNfz/cStqEN0Vz0Zbx5ycpaLtSrbhpzbZn1MSNuIT7l5YpwnXwhRBNZWSC/EfsrLR6NDMJzbVnzlK+hlFAx3V0hTFQARxktjGDNjrF56pme3irj46ah3K6UTA7Fjz7YzeDrixMtpzF9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035210; c=relaxed/simple;
	bh=iRI91GWS5JtfRL35xOx18YmlhcvwLYh070awFZg1njw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0mekOJoJ4sjpSwuhX/CW5eG7ZdBm6nTri4ATKX2zthdftOEZ2pGaQvFIbKTe79ZtcEX9Dg4m+cZlueMcWcwglea1XP9imDACi+o96ww2dreJDCZQ6OQBanccgLqKf0xW7eRk9d3xqHiGCCcpadr2DRQxoL9CFbSERpqr9mAPuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LiqLCdAn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 51C1715BF;
	Tue, 12 Aug 2025 23:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035152;
	bh=iRI91GWS5JtfRL35xOx18YmlhcvwLYh070awFZg1njw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LiqLCdAnan0lyah+6ttO1vkrg04P8X/QrHezpsxxil3+Iu0Mr6u6D7Y7iv5visv2g
	 eXeg6+bIMULFRB84Dx3Xi0/kH7w7rTJJLkAHr2oQoU9Mat3MZOw5GEv5OvqQrhtV3O
	 RmCr2Da2b/bPQJPe5MXvalaC+g0w+kkJHocVmMhY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 04/72] dt-bindings: media: imx274: Make clocks property required
Date: Wed, 13 Aug 2025 00:45:12 +0300
Message-ID: <20250812214620.30425-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Adapt examples in bindings that reference sensors
---
 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml  | 4 ++++
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 3 +++
 2 files changed, 7 insertions(+)

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
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 4dcbd2b039a5..0539d52de422 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -361,6 +361,9 @@ examples:
                   compatible = "sony,imx274";
                   reg = <0x1a>;
 
+                  clocks = <&serializer>;
+                  clock-names = "inck";
+
                   reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
 
                   port {
-- 
Regards,

Laurent Pinchart


