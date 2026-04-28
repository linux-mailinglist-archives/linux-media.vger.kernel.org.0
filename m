Return-Path: <linux-media+bounces-59771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBoJNXVk8GkRSwEAu9opvQ
	(envelope-from <linux-media+bounces-59771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:40:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0547F0D8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790AB314CAE3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 07:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793EE3FB7D1;
	Tue, 28 Apr 2026 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxoLDwAv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9053D1711;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361245; cv=none; b=OU0WfLvHGJ+mYam8X7JvQZ+vp13azlBMv7f7lXaT4eMSUzCSwDASjfweTzjkgVHBQ8o+2yYztvvYNZ+qPT9Ndy/f4SO08vxkUrimb4pecC76hQUeCcz1mVgbAXOn1kXqGknbJnBDQdQeQxdxbuVnpIC/ve3sXsolEaFx34iLHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361245; c=relaxed/simple;
	bh=TzpagB1WrVu5fYLHpAyf1y+q9VM2RLONipbjC/t0ve8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS2KBT9mBitlOIdfMFCVtJ6G8xeOIAUC6EWa/1J0sdtm3LeujANSYvSHTsW6EzdCeBFnsrF2OKcz6vTbOyVQKaq0SEM4VpPTPiF8ethAafOkIvohdI7DJL+Yqj8GgJCV1++BSm5+gw0ACh9jJx+1Q3kwbxLm5va8oNuTGsFRFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxoLDwAv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81356C2BCB6;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361245;
	bh=TzpagB1WrVu5fYLHpAyf1y+q9VM2RLONipbjC/t0ve8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxoLDwAv+40sBf8CO5rIugNmwF8UPSAl3EglCx7pOdgUpUl25sdvmQAx1S2ftTZcN
	 S/8obsiIubVvSVq/rCGxPEhPtq5ANY+B/qhvljHkdW7LQGDmtzzvnrp26kmPwywasB
	 XMTL+rcOIr6XZpNwdIph9f5RI2eAyyUPiEpu67oD3N/VhJl5pU5CwKb3sLJIy+pqag
	 iOxMS4SZzjdRTO/GAC1lcXfRhnRA62/n8F1YzcjcorCCjE1OXESMoQsZsLpdOGx92G
	 nuR7tceeDu7pEWlvpe8AmoxaIolwxfA9mAYjHQDg7Th8fup8QAwNaFl0mVioZW5Qri
	 j2lKI+ykRk3pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716F4FF885A;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 28 Apr 2026 09:27:23 +0200
Subject: [PATCH v5 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777361244; l=1181;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=3TFnv9jZJHx3KielBqkTXBZA/OzvBwjOjzm/HycqX7Y=;
 b=LOfsEque3uFY0iPZ7ZEm7rPYYPcYNnE+Vx2+6d9h7128ksPQXRUj+QLjIX7yWCPq3qfLrG0gJ
 9iYL8AInDACCefoS9vFUprB073RWSMpEQq5ravShDKZb3PEhp5VDt3w
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: 39B0547F0D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59771-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:replyto,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Michael Riesch <michael.riesch@collabora.com>

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568. Introduce a list of compatible variants and add the RK3588 variant
to it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..fbcf28e9e1da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,9 +16,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx93-mipi-csi2
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx93-mipi-csi2
+          - rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



