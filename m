Return-Path: <linux-media+bounces-54795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI5eHVfhqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:14:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716122267C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7380304C6A3
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CEF3AA1A7;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQRlj30T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8838E133;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806191; cv=none; b=oBz9/5ZX1fuENVvZyEovGcI2heyr9FQPatNMjFghZMEbPA2nbOJj9pBJDd1VpFaPuB12J/MiUY1x9cOkWwElFS4jwm4QNss9Hi3RxVIjgfzXAzPdS24q7GHlLgK0ZW6//6Hnmcmz8JEN7/lkn58t4K/Acecg0AgeFbXW+tVBKAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806191; c=relaxed/simple;
	bh=QAEkleb6IVGK5L78+HXxLeZCePSBUtX84+LuF5RCLcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cL+UXFJfd1N/TrCkWFeyzh4Tr7VaK+2jRF199mvjLDHZOAabFdUDgEUFhwMznIoPVUDH7+AGylWAmcdTj0FOFBow81TYoKHpYIl89Cu0j7BpWMET+nFvU5WaEGyStEhZmdVCjcT06+RY+vM5VOqlH7kcANKV+9PK+cpp+xfrBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQRlj30T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C063EC4CEF7;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806190;
	bh=QAEkleb6IVGK5L78+HXxLeZCePSBUtX84+LuF5RCLcQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IQRlj30TaF5FwIKhWPfQrnBwYLtspSXKjdkakMyqSka9OqdS+2ziLg8DEAc3Y1Hoy
	 dDLYOQ7AQgI3SAVtzdZeTW/C5e2Z3gLgyJfk1sA+pr55R9TXDcaVR+WWOLGoLp4hp7
	 5Lyy12R6EcxInUYa5TbTI1OQaPjJ19MttN8zCMjlxDhUx5qPOH+S2ysSXlWQCY9j9q
	 QOeWn48T2O2DCKbDpsZCK6XVLG58+p7geej/6cVLM2pVY1/sccY4ciPgCYPtmAuq6r
	 IvkwCpvJv3XTlyR02IsaDxWkfKzp6IMEE1CTRNHroYL3KUEQmBOJ/GQJdZDYdUcN1Z
	 NLTvPdJ0+Hpeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5DFF0181F;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/4] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Fri, 06 Mar 2026 15:09:47 +0100
Message-Id: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvgqmkC/x2NQQqDQAwAvyI5N7C7uir9SukhbmMNlW1JaBHEv
 zd4nIFhdjBWYYNrs4PyT0ze1SFeGigL1SejPJwhhdSHNmTUV5vHEYtJ0g0pxnkoMVMXCLyZyBg
 npVoWr+p3XV1+lGfZzsntfhx/AsxoBXQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806189; l=2252;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QAEkleb6IVGK5L78+HXxLeZCePSBUtX84+LuF5RCLcQ=;
 b=+z1lAM+K34CYNMrpDG4Vre36ujGjSJtdNTMfHFjGBxHcLTuD65Qq7K+Px6e8p2q3OwnGFIp62
 NqLrn7qvsTHBOWIwzloMo39o8x8PtoJjfJAz4fBU1hvQX/HBnS8oizi
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: 7716122267C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54795-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:replyto,collabora.com:email,collabora.com:mid]
X-Rspamd-Action: no action

Habidere,

The Rockchip RK3588 features six MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0
 - MIPI1: connected to MIPI DCPHY1
 - MIPI2: connected to MIPI DPHY0
 - MIPI3: connected to MIPI DPHY0-1 (only with split DPHY0)
 - MIPI4: connected to MIPI DPHY1
 - MIPI5: connected to MIPI DPHY1-1 (only with split DPHY1)

The MIPI DCPHYs (at least the CSI-2 features of them) as well
as the split DPHY mode of the DPHYs are not yet supported by
mainline. However, we can already provide support for the
MIPI2 and MIPI4 units.

When support for the split DPHY mode is introduced, the DPHY
nodes should have the property
    #phy-cells = <1>;
and the MIPI CSI-2 receiver nodes should have the property
    phys = <&csi_dphy{0,1} {0,1}>;
in case the split mode is desired. Since this is a board
specific hardware design, the properties need to be changed
in the board device tree (or any overlays).

As reasonable default, however, we can define, e.g., 
    #phy-cells = <0>;
and
    phys = <&csi_dphy{0,1}>;
in the SoC device tree include.
This series introduces initial support for this default
configuration.

In a related note, the split DPHY allows for different
integrations of the MIPI CSI-2 receiver into the different
SoCs. Therefore, we introduce a separate compatible (and not
only a fallback compatible) in the DT bindings.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Michael Riesch (4):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      media: synopsys: csi2rx: add support for rk3588 variant
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  3 ++
 4 files changed, 57 insertions(+)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



