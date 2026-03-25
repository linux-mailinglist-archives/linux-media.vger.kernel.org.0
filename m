Return-Path: <linux-media+bounces-56969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QoOVItO4w2nUtgQAu9opvQ
	(envelope-from <linux-media+bounces-56969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:28:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB0322F52
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63E74305A480
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B6A3A543D;
	Wed, 25 Mar 2026 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijRD0SWD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F5A39D6DE;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434336; cv=none; b=IJmsyBWqMrDBzG0w+WpFiBhjOfOb1sd8ySoLnFafsQsbROYHVYczzT2QVz1PNvOwG8glV2SSTtDC0h7aKfPS62NTrG3oq8883QP5/f+wALCwR93fnbyk7m4pVVffx/JzjrmHEZaMCMOV05Zc1iSUdko4QNF8mOCRu0D9CAq09qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434336; c=relaxed/simple;
	bh=pdk69hgSxYlxrpI3vu+iS6YkL5ihSIa3ahhwcNkHEv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B2vmuiq7bZedPksoASRSg0B3o3GFIO64PIKgXnmvLsnmi4Sj1YWCHqxxr1Y9wDNV7KXi7hraYtj44BIs1r3V6kGQ+h1qL7OnOYvVX+YshKchDEsy7kL7tdDZrFsZ7hp2jMFGD0eg0x5V5GAa7Ogs9OlRinv+aShLk6TNM+sGma0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijRD0SWD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B4ABC4CEF7;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434335;
	bh=pdk69hgSxYlxrpI3vu+iS6YkL5ihSIa3ahhwcNkHEv8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ijRD0SWDtG7zppuyabc/ov9G2Kds2J6Ylhr/Mv70/f8CC4uOiCCbZScx+c3fjbN71
	 UlEFP4LS7QudKOumBqxcd4jVFd1AsXbWuz92YcR6JBk3M/146ZmNMWrrsU6ifocyjS
	 hTdlrCVdrPAVwks8jXkx1kgOk+B6vxZlKb+2L2YvQai9Whc/82K/Sh/OzVK95zP60i
	 cthq+50u0lQkmceeGIYPnsWNHcet3shy/Eg5rRzrGMwv9jbRcHBUYeLBQYuEeYipII
	 llpM8eJB7597HyNvDCKo1Qdb4AuAVShjCHQ5Ouv73/aHGRUNnyWIrd1blc8WmirYPH
	 oweVsqIPkSaVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B7DFEA83E;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v3 0/2] media: synopsys: csi2rx: add support for rk3588
 variant
Date: Wed, 25 Mar 2026 11:25:33 +0100
Message-Id: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB24w2kC/32NQQ7CIBQFr9KwFvOhpUVX3sO4+FBqiQgGlNQ0v
 bu0SxNdziRv3kySidYkcqxmEk22yQZfoN5VRI/or4bavjDhwFuoQdB4q4WUVCfL40SRsaHTTGA
 DSMpGYTJURfR6LCv/cq7IRzSDnbaT86XwaNMzxPf2mdlqf+Uzo0BB97LnauBSw0kH51CFiHsd7
 mStZf63wEuhO/TAVMtEI9vvwrIsH/WMf14FAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774434334; l=2260;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=pdk69hgSxYlxrpI3vu+iS6YkL5ihSIa3ahhwcNkHEv8=;
 b=I0HG7NrC2CzWSq5p3raWhME1EI5+Q/FWJexuv2OuVi82Sra0oPmeUy9yih67qO3RPrEsuk+3i
 /vW8Be4pNuFDCRmSp2jDuZU9TcqjKgY7ztIqI12zCvEHLx5s1FETiLh
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56969-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88BB0322F52
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

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 10 +++--
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 52 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 3 deletions(-)
---
base-commit: 66bd47face7d5d55e6c3b5dc16fb3c2d6e205360
change-id: 20260305-rk3588-csi2rx-a11f7c15a40a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



