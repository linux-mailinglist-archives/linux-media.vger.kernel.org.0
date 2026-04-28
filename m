Return-Path: <linux-media+bounces-59787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG6AHKF38GlgTwEAu9opvQ
	(envelope-from <linux-media+bounces-59787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:02:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF3480D16
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D004E30471C1
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B5F3D7D97;
	Tue, 28 Apr 2026 09:00:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FD3D7D6C
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366857; cv=none; b=g5hqaxzejnFFKNe4kLSxcr1rwhGBbdvKf7CFYEHBySn6gH1q7uzbMvG+L8WUvG8GNQnJy0SMPBHHKr9nxKAVj5hEegQUJpltKJrnHw0pHw1QrQsPnddF75API1cB+SdDN8X4r3Wv/sD9teLo8Um1zR6UVKiVvvWo3YltHESCy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366857; c=relaxed/simple;
	bh=ljhyyAVAsaT41Rpt30YyAO53+U3vqFIqV/OgI67rHP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUzGashYIzGAlTWLB9HMJQ/kD2tyIAcUn+0eJ4I0dEAxlsQQYBGwqA5JKQRj/u3WiHlKOAP0VTjAqyKhwvEBBa7d13rqt0p7uOtu2ZpIHOWSWY2ePxiZG49S6OxZe+ZRQgvUjq5qRyX7Z0qh36eR8GSXGQxtlj3UbU1Yqvhi+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJ7-0004Lz-SE; Tue, 28 Apr 2026 11:00:41 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:36 +0200
Subject: [PATCH v5 01/29] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-1-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 59EF3480D16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[iotwrt.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59787-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
peripheral found on the RK3588 SoC. Also specify an iommu property,
as the RGA3 contains the generic rockchip iommu. While other versions
also have an iommu, it's usually specific to them.

The RK3588 contains one RGA2-Enhance core (also contained on the RK3399)
and two RGA3 cores. Both feature a similar functionality of scaling,
cropping and rotating of up to two input images into one output image.
Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8 (RGA2 allows up to 16)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changed in v3/v4:
- Dropped Acked-by: Krzysztof Kozlowski due to the added iommus property
  and description adjustments.
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index ac17cda65191b..7bd92f7336664 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -9,7 +9,11 @@ title: Rockchip 2D raster graphic acceleration controller (RGA)
 description:
   RGA is a standalone 2D raster graphic acceleration unit. It accelerates 2D
   graphics operations, such as point/line drawing, image scaling, rotation,
-  BitBLT, alpha blending and image blur/sharpness.
+  BitBLT, alpha blending and image blur/sharpness. There exist many versions
+  of this unit that differ in the supported inputs/output formats,
+  the attached IOMMU and the supported operations on the input. As some SoCs
+  include multiple RGA units with different versions, a more specific
+  compatible name to differentiate the concrete unit is used for them.
 
 maintainers:
   - Jacob Chen <jacob-chen@iotwrt.com>
@@ -20,6 +24,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-rga
       - const: rockchip,rk3399-rga
+      - const: rockchip,rk3588-rga3
       - items:
           - enum:
               - rockchip,rk3228-rga
@@ -45,6 +50,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   resets:
     maxItems: 3
 

-- 
2.54.0


