Return-Path: <linux-media+bounces-57186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN48EsC9xWkeBAUAu9opvQ
	(envelope-from <linux-media+bounces-57186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 00:14:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC433CF32
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 00:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CDB33055E70
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 23:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E8352F9D;
	Thu, 26 Mar 2026 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIne2Rvd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2334DB54;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566602; cv=none; b=HbD12B86oflBfK58ysrt6HdcYQJSuSioV/MP6/2yWq3E3pnr9RX2BBilWwXiHgwaNbnYk0svTGWQXDtdltuKEJF+GOwyCgC77/ZdEZ+eKj6J2x4hr6dDGIY4tSc3g5t1/UCts6UElt9tUQEbpfJcwFGx7X0BLmVuTA08E2G9qPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566602; c=relaxed/simple;
	bh=F+kzzca6Z4BmvXweVJwbOgdkmwl7lP2kz+U6gv7BBLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LRNQaDq4JN+o1CZUcKmO2a//v+ujEREY4SXZSRV3upKcA5Ymxa+QF2vX5Fzwq3ibAFDQDk1KN9uchFRIC4dxY/GdcEDo7v8NFW6fM/Aa1D66qbsGp4LsE3Rf8EdUZD/Ug32Kft/7YIjGXVpGjeRn6oKabVe3WEX/pCP/HR1kGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIne2Rvd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADA2C116C6;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774566601;
	bh=F+kzzca6Z4BmvXweVJwbOgdkmwl7lP2kz+U6gv7BBLA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oIne2RvdPcoDbq+Kwfa5qWAA3ZZzYjM/bhYHjOnZ9XoQ7QB21ZumiDlPbGBIELqlC
	 vxFTU6B0B3w5zIQN4KsQEnt4PU+gVbW4UUfXXtxYKNDYjxWDEwrH8iIo26k3YQnbS+
	 iHR9hJp2bSx4DOnp9VaMymDi/Wr7of90PSOiCPF1/wkxajh6VVqRHw1ZXhOuzTiC/S
	 LIfcTbXHKaF7+0DmlL1umZhK3gleQCHUs8MeK83Ro9nr1d8YzcVojbKr2a4Uuz6rWV
	 45ojr/+MPXlamah3r45qvfMxT0KdjPxtsAn1qWuO2pK3cXgphi+v7earYif+KsYZRH
	 /qaBtNyXS66eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A41510AB82F;
	Thu, 26 Mar 2026 23:10:01 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v4 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Fri, 27 Mar 2026 00:09:59 +0100
Message-Id: <20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMe8xWkC/33NSw7CIAAE0KsY1mL4ttSV9zAu+FpiBQNKapreX
 dql0S5nknkzgWyTtxkcdxNItvjsY6iB7XdA9zJcLfSmZkAQaRBFHKYb5UJAnT1JI5QYu1ZjLhm
 SoG6UzBaqJIPu6yq8hqGWj2SdH9eT86Xm3udnTO/1s+Cl/ccXDBFE2ghDlCNCo5OOwyBVTPKg4
 x0sWiGbAqlC2xmEVYM5E80vgW4KdBE4Yy3tBHa0+xbmef4AvALURkcBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774566600; l=2509;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=F+kzzca6Z4BmvXweVJwbOgdkmwl7lP2kz+U6gv7BBLA=;
 b=Q31Ushq3MPm7/rk/deCaFnjvfmVxk9/KY9/ptu4vESyDcHaREKfCWa+676qoOfzvkuVYr5Aae
 cbQSVm2trRLBMNUxDD+5gf6NZwQhNeHbeOBdu4LveLZPK3i8dL1Rq8M
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57186-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:replyto,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0BC433CF32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v4:
- rebased onto media-commiters/next again (as Frank's patches
  are now there)
- changed "oneOf entries to enum in dt binding (Rob)
- Link to v3: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com

Changes in v3:
- rebased onto Sakari's cleanup branch (as Frank's patches were
  merged) (Sakari)
- added Rob's Acked-by
- Link to v2: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com

Changes in v2:
- use fallback compatible instead of separate compatible (Krzysztof)
- dropped patch 2 and 4 (as a consequence thereof)
- Link to v1: https://lore.kernel.org/r/20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com

---
Michael Riesch (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 +++--
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



