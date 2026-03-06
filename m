Return-Path: <linux-media+bounces-54794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNV4DnvgqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:11:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA82225F3
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EC24306D8B4
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3EE3AA1AD;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8pTyzrf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF9385506;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806191; cv=none; b=QKGnX4eVB7fUHep74FuwHOiXX5MszYr0ag4j3FR8ZOah5XRGA2g77WrFEw08pCZVlwrNIjHSAo79wcj3qJh2UmTmS97pOW9vqfAlG7mdLH8dSCh1x3+62Lgr43kgmulXEVnbffeoOrUpu5mu2CGMB3WwJmW5ZsJMx2A1ddkQHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806191; c=relaxed/simple;
	bh=8vKS5mFYyWcY9/W3P0k78T4RRlw0YqQ4wHmLM/YPgGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgVl/RYqavWYT7QFIgXMXy+N2shHn1yn1KYfqEGJdXBsqo6VY+0XC9afuXx03VW5pJ5h/Lh/yn/pXUHmqIjz/k8lbGuN5XtleyCVVNhrdZcLWQ0caTerLSQ51Su2qDyVQOaO74gmNHUlPvYE4l6XYAvQ7nciWYqQFFnAHZeL0t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8pTyzrf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E654BC2BC86;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806191;
	bh=8vKS5mFYyWcY9/W3P0k78T4RRlw0YqQ4wHmLM/YPgGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h8pTyzrfwiqqLWeDUNcbFXThoeM6iW5p8z/+i59hEScGXJDzUxB/kzLmYsFI+c+Ac
	 Mzt+xakfXGEqZTM05b3FFh+wxQY6/ct9vEXBoC6zcFG+4wXnR43XWYNqVUDHS9xkfY
	 DQQ5xWL4sQRygMJBan9VYIqdtW9BcvRsK8FzwN+0xnp8UzOoa2uUBaU3nLx0mcRUUp
	 xqbC+w9irU+XqkIwtxfRIpgGW5owrd2RSVDeGt4rPvIpsOMNHy1o9JlqHMAqz8tF1G
	 cU9yJqTUaa1RLvm77vMu/0Kl0Ivvglpk4ANvtN2jdC3a5xLz1SyJxgiKz1bpZHeZrF
	 DKtLAlsVvGu9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4701F0183E;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 06 Mar 2026 15:09:48 +0100
Subject: [PATCH 1/4] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806189; l=1008;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=Kp0wbOf5Lw+4im6z0zt2pWlcTxwzhXGm5bLIr9vHDBY=;
 b=IvoVSaSZKCGd8I9mLe+BRckb11QJtJQh6mZXr6kHlUp8MEvFfh4xyoK374HZ+mkPT79AEqMCa
 d+lZZZ5BvGMDSrlHctrNuihSjnNsk78FmUBvcCUY+QVh0SLMikvgcOh
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: AECA82225F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54794-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:replyto,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Michael Riesch <michael.riesch@collabora.com>

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568. However, their integration in the respective SoC may be
different when it comes to the (currently not implemented) split
DPHY feature. Therefore, add the RK3588 compatible to allow for
future differentiation.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb..5f8014da31ca 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-mipi-csi2
+      - rockchip,rk3588-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



