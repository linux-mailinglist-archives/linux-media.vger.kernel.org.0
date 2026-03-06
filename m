Return-Path: <linux-media+bounces-54796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CAENe7iqmkTYAEAu9opvQ
	(envelope-from <linux-media+bounces-54796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:21:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEC22286F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35353318F547
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CEF3AA1B0;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0gS4DGa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126A38E5E7;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806191; cv=none; b=oATL3kuJfy792yv5fNwdFXxA2JxVhMi9AD5IYBMZaWkIbm37qFXOAZLIAkuPflcFrDTxkTlCkQGKaFtHq3iypBdMDfrxzCdUjIHC3pPSQ3YTAklIMSwDUDaaP+GPof0L8F0ZPNU3NHQpI7wSFQfE9QFq0wf6elyN0ARDX4JtYWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806191; c=relaxed/simple;
	bh=tG2smnBCklE3FOUfpQJ/IMAKQJuAT2Ta4UzZBTyOfNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYqTzSx9LCC83QF/wWDMdL4v/4CBxxtmQbfo52H+oI2TqQCGq2XkQDteim5CIP7E1ssyM5EYPl1c6WtfJMw1em1p0C8ZreYAVfbGn2TctSubELMEhuHqJGDxrHYYX/ffAuo4RULZEO8OKNsIBiw39hVSUIPbsTF7aJJmMXrFTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0gS4DGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03194C2BCAF;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806191;
	bh=tG2smnBCklE3FOUfpQJ/IMAKQJuAT2Ta4UzZBTyOfNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c0gS4DGaswuLjSlwg/QidikJxhbNtANNJYPn8y4yxovJPZVP29F4lTW29tLXcASPe
	 HnopBUfaqif76yUFT6OvgVYrpz9X0QyMbZiQuc+3FJ4THUKKNkKIw334+HIq6fNVpx
	 TIkEfnKja+XhI7SiKbT0j8ZoqK1DM9Tcho7loARUGjQo2Ayom05z8rjRySRkCojaak
	 7x1SR2GXdnui3MKL0x/7fNeFPDkM3cLTaupLiXIIY8Sk1eB5M43iU9VYZrYVDsGGGy
	 jq3IF3hxeALRRsXLBBTLa9Ps1MV9W+D1Vqk5J1Hk4TLoZkVlVoCQoPc0uet8vLKuOw
	 XgURfYu2PjZug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8576F0183A;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 06 Mar 2026 15:09:49 +0100
Subject: [PATCH 2/4] media: synopsys: csi2rx: add support for rk3588
 variant
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806189; l=783;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=tRMPz5B8516LiO+2W1dom5lnoXdr+CUnoFVXU/MBd8w=;
 b=XPKFRpNbfZ4vmwf2A0jxs6sl9zUddsR5xnMxxcUCSdSSfpJ0RFqyECdk4FHCUlcHhN6+5dwlv
 07dYfxD3aggAIHLbuxX/d4ksvjqJmbdq+Q9GH8aIuco8fIxMEw+KfGY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: 47AEC22286F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54796-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:replyto,collabora.com:email,collabora.com:mid]
X-Rspamd-Action: no action

From: Michael Riesch <michael.riesch@collabora.com>

Add support for the RK3588 variant of the Synopsys MIPI CSI-2
Receiver.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a59..45ec815b0fba 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -609,6 +609,9 @@ static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 	},
+	{
+		.compatible = "rockchip,rk3588-mipi-csi2",
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);

-- 
2.39.5



