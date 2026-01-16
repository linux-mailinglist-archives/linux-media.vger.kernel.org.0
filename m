Return-Path: <linux-media+bounces-50901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811FD322FD
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11E2F309ADBB
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B23329B217;
	Fri, 16 Jan 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRZ/48FZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6F284B3E;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571705; cv=none; b=S2o/+c8W6AbSI2dDLgSl8L+06X20Alyhw9EyQMi5it72FqgHJMry1tCSS2Al7gg/QZe2LGVTUjJBtaYCRLGVZHE+HoTdrToIN8b8DiVabxMtisZKsizvIqFk/kW2HpPsv2JvVNlKDRt/YkW4mXs38eLT/YLMkG4NZDr753GYbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571705; c=relaxed/simple;
	bh=4Y+h5QElO34DweG2n0tlxVA8F11AVeASPM/o77QjcKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WVOQq4sjRZJs0uQG3BhghEy+y5S/wMaWhw1U1jI34PZ+Zk422Q72Lfx+RFalDct7saapvwonpcSHmb91rxPILwKylVTxUMe2NbEFvFpOhFB6l5xEoPE/vil3IR0EO61pUIaoiQ3nfjq8GLMf/BnBAKLVRYisLSyb+cFlE2W/BOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRZ/48FZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E9F9C116C6;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768571704;
	bh=4Y+h5QElO34DweG2n0tlxVA8F11AVeASPM/o77QjcKs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FRZ/48FZPJ2oAt6GFQZQMhfPpjM2oaVbYTob2sL5NZTWJfCPQvNj1r9dWyfKSb5zG
	 36CZwhIdA+jTALbJBtRN+DNWXMPtEJ8JeRWiPbOqtQ5Z8piCIvuGb/G92revzqR8DH
	 0xpCqVWnpW/tNxsKaGdakSWHbb/ETPjr7iNmrMPzvOtQAXtWgskPLfccbn0YLJoobD
	 CAOf0r1zg9/caB6dwRDMZsYdvvCe9aX/5u4+AFJ6nRLU8yWN/X0FB3JNjvpPZdV+TP
	 2KyGpDRYY9ksPtE1imes1bX/nAMDBlVAeDmja/x1yuKDWXLNGyyM8F0W4cqz+VUml4
	 Ikk0I1eMN97Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8443BC79FBD;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v6 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Fri, 16 Jan 2026 14:54:58 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJDamkC/43QTU7EMAwF4KuMsiYozk87nRX3QCwc16ERnaZKo
 QKNenc8s0SV6PJZ8vcs39TCNfOiLqebqrzmJZdJQvN0UjTg9M4695KVNTYAgNe10AcNedbXPGd
 dmTivXLWJmKz31NGZlSxHXFjHihMNsj59jaMM58opfz/aXt8kD3n5LPXnUb7Cffpvzwra6B6cO
 Td8BtP3L1TGEWOp+Ezlqu7sao9RViiOXfTOtW0iv0e5Y5QTCuQih9gm14U9yh+jvFAob2wSU2+
 C3aPCMSoI5QMiQJugM/iX2rbtFxFwhW0BAgAA
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768571703; l=3309;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4Y+h5QElO34DweG2n0tlxVA8F11AVeASPM/o77QjcKs=;
 b=e4UHG0C5yjSB3qnwNfzrBXDWncP7eivjmpXJ/fqFWEvPugF+cEmSChQlMwz92JgnRMKDlXkKa
 X9XlRbNwQSyDLdp8ngYR97CiHStx3yZ7/jTUtrAQD5+cD9s/4haqb1n
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

According to Rockchip, this core is NOT the Synopsys MIPI CSI-2 Host, but
it features a compatible register layout (thanks Chaoyi for the
clarification).

As pointed out by Frank, we should thus rename the driver and place it
under drivers/media/platform/synopsys to facilitate re-use of this code
for similar IP cores.

As has been discussed in [0], it would be beneficial to add support 
for the split mode (a feature of the Rockchip CSI-2 DPHY) before
integrating the MIPI CSI-2 Receiver into the respective SoC device tree
includes. However, we can readily add the DT binding and the driver
as I am positive they will not need to be changed significantly when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v6:
- renamed driver to dw-mipi-csi2rx (Sakari)
- fixed return value of v4l2_get_link_freq (this time, really) (Sakari)
- Link to v5: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com

Changes in v5:
- fixed indentation in struct platform_driver ... (Sakari)
- fixed return value in case v4l2_get_link_freq returns 0 (Sakari)
- switched from pm_runtime_put_sync() to pm_runtime_put() (Sakari)
- Link to v4: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com

Changes in v4:
- moved driver to drivers/media/platform/synopsys and renamed it (Frank)
- addresse review comments by Sakari
- Link to v3: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com

Changes in v3:
- rebased onto v6.19/recent media-committers/next
- Link to v2: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com

Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/Makefile           |   1 +
 .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
 .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
 .../synopsys/dw-mipi-csi2/dw-mipi-csi2rx.c         | 737 +++++++++++++++++++++
 8 files changed, 907 insertions(+)
---
base-commit: dc6c52205bdaddf1dc259497a958402b35c01fe2
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



