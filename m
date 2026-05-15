Return-Path: <linux-media+bounces-61732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwrNTg9B2oCuwIAu9opvQ
	(envelope-from <linux-media+bounces-61732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:35:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E8A5523B1
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21596303C4EB
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7D54BCAAB;
	Fri, 15 May 2026 15:32:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44154B8DCF
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859172; cv=none; b=Ecs0/0W9fXoMni327jHb01JFaQJcz7XxXAiF/enElLfIzcoC7UqqC5azzpWHTAoSpWR2SQdZLWDpOyXxY5n/TxTaKca12LtOWDVHwSM3uw/7dICXx1EjLBW/w+QwHqEdTDpxwtcCka6CpjMlNVBVSECfbFuAwvBcaqHuzaZX6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859172; c=relaxed/simple;
	bh=ljhyyAVAsaT41Rpt30YyAO53+U3vqFIqV/OgI67rHP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TP7V2ndVYBZNH3gL4oQJboZwVdd+O/dyD33i5Mhubl/Ja79LH601pwQyNs2xED4paP1QaZRSGWPu2eIZr2drYjnht/Ar8DUyKHcX8dqkAaRv6bRGbVTOmpeFEfSd0ZkzU7COShsAUpz0VE7TJu6MY70yCKDAde7ulGpaVKQ+bQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuWm-0005OF-0T; Fri, 15 May 2026 17:32:40 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:27 +0200
Subject: [PATCH v6 01/28] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-1-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 38E8A5523B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61732-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.947];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iotwrt.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Action: no action

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


