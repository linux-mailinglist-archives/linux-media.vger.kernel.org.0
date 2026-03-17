Return-Path: <linux-media+bounces-56011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPihMwMguWkrrwEAu9opvQ
	(envelope-from <linux-media+bounces-56011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:33:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B42A6DBE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90F6D303D107
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A0037754C;
	Tue, 17 Mar 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4PQ+H7R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BCB36C599;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739944; cv=none; b=eRiOJlyXQBIgIsA7sgMWl1Omv5gLflKMTLFxPiucnxOrEclVrI9cB1FL0R/TzBflDbOO+cKKRx/WEHMA5TVCX+JWU3tk3kPrB9Co8IK/c/8iCPem/8ktcsoVXdkCq+AroIYhsHbcQBYOl5tMQmP91quOSj3acv2jp9YLtOjd6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739944; c=relaxed/simple;
	bh=160P6WISh+Fsx9Mux8forF424XDx9Hb/XbWBrIa5OIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twgu101FYARzVBy0vJ0qkGRn/YuvcY4JEZg5RbVdm5imAF3Iq79YPElGuQ0Y/r9xJIEnBqbXfvC71WH/s3WQmmnKnbe3ijgrqvswNi2Zui0Sq3B56zwuahX3+Im/pnkA4idqL1Wv8xaGuOwJqTPMgTux9tdu5HIIZXdfqrZbN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4PQ+H7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25985C2BCB3;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=160P6WISh+Fsx9Mux8forF424XDx9Hb/XbWBrIa5OIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B4PQ+H7RBOcob9yxAyPnwHd6j6+AB3cTHOoRYsHxu7BS8RMNZoJParmGmQSBLVH3C
	 wV2vMRlrwuee7lR92CoqA10tQXDlCIbbNLylXp12aih7dNVP/WlzqY+1/vAmmJzHsp
	 idWkof9RsPNqmYTiROl+Se7MYl6dFj5g2J6ZaqYE5afx8zTV2TS+rKfEP9UDtNnNqd
	 W3wRQHPhWP0RB6vZoE+NDvxdxL59pHbmNlrmIfVBaIqtKtLG7kUWJbPvCzukjmq7M2
	 HH7ktyb+1erdE1PjO24wAiqGxZXPOPfL9+/M5ReedIw0hR3DPqUgw4v/KiDDO4kJvZ
	 u2v4IwMgzE+SQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7B1F33825;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:22 +0100
Subject: [PATCH DONOTMERGE v2 4/9] media: dt-bindings:
 rockchip,rk3568-mipi-csi2: add rk3588 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-4-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=1219;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=/GzYE6Y65z4sqAFCGq0r5VgZhg70cR93RCV+j70gjCI=;
 b=EsCexHaXRnuve5IWe2UkP6w6t8XbFF7d9ELL0LCXKwkUsDCDUJI2xIvqYl2wO4SL3lEI9lYbh
 LVUzW+l58xtBk8vwrBfiDN0iez4A1eFjEbAlqJv9xK1uT4qnLTV5AGZ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56011-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:replyto,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A58B42A6DBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

This patch is discussed over at
https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com
included here for testing purposes only.

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568.
Introduce a list of compatible variants and add the RK3588 variant to
it.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb..5e864e92f8a8 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - const: rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



