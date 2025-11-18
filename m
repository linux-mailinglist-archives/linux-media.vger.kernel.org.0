Return-Path: <linux-media+bounces-47266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC4C69021
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50AAF34B030
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC6234E747;
	Tue, 18 Nov 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5OWcE2n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4534EEE6;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464348; cv=none; b=F1z/j/3UpnjUe6WMiXVpqSBIpgS21wzH89Tdxu93qNUaCWBOUJ5vBsqk+LTHvaEplr+ReL3LcFqSLjbXvd7basTJc3koAZiqf3/kJRu8/R9TLPN1+7McAWHbedpcFhdR+d4BMmgXGnqdmmAohbvPfHNcaaHLhyc1m9lQEXH1rLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464348; c=relaxed/simple;
	bh=vg/rAUSulARoX9rCdjKSaqwDFdJwWNhU9fab7PXcE40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmGFuHTC99J8o0V7/VqNL4WdkshAxInfGQDwzSvs+on2ML4QEDakAkV9YJIK2ZmFIfyY0FaaKOUZu3CYewM3jcNvpZu5vPqQ8SXWWbO2xnGJjrIzy9/VCFw2gJv9/Bk5wQnx69GZFYjmJ025I/up8zJr7/xX0zivm54+DU0cOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5OWcE2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1858AC4CEFB;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763464347;
	bh=vg/rAUSulARoX9rCdjKSaqwDFdJwWNhU9fab7PXcE40=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t5OWcE2nwi4Rmt6g+qorGLI04d+lheTc5Zpi//2kyEX/TIdjlZA4a0MTMRa/YpUjF
	 LlQ9HubJ+1F/640TwZVYvUK+qr5Xr1vWe1EK0DMtNzHLoqYUiLViB5UN0bv8ltU4v8
	 Avcp3ssMyXVmJqummAiZ+Q5FaeLpU1wTal/QEA1wUD1Ibhp9/viMR64vSW3Np/b7IX
	 goxgMHI3mdvvN8MBR5EdFW5fF5jzxB8eLQ9JRQ8l6cIKF0c5ctqoOrROg6dsYBrva0
	 jkRPhzh3LeZcDu9UfCjya8qKyATJ3CH7uNr4HaYAGzHOgNoalNIlosAG9xGbRFYqPb
	 xZrmiX9hvO+uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8939CED609;
	Tue, 18 Nov 2025 11:12:26 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Tue, 18 Nov 2025 12:12:24 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhUHGkC/4WNQQ7CIBAAv9JwFgNYTfXkP0wPsGxlIy3NokTT9
 O9iP+BxJpnMIjIyYRaXZhGMhTKlqYLZNQKCne4oyVcWRpmj1rqVnOABgWY50kySEZAKslTODqZ
 t4Qwdiho7m1E6thOEmk+vGKucGQd6b7dbXzlQfib+bPOif/bvp2ippNcH1Z2w08r7K6QYrUts9
 5BG0a/r+gUsbyWj1QAAAA==
To: Michael Riesch <michael.riesch@collabora.com>, 
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
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763464345; l=2257;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=vg/rAUSulARoX9rCdjKSaqwDFdJwWNhU9fab7PXcE40=;
 b=cjAoIEyEJzBcuSQ30blsRigVfjME6y6fVyfytrVJVdxAX8NqbGz0v4GkzzrQ87JrpJon27Zgg
 9c1PHQrMVyHB4ASS3NMMdvmHX/xCd+KXb9Ew/L5ZT9nr77Bisaoi8Jj
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

These changes have been discussed and reviewed thoroughly in roughly 10
iterations of the rkcif patch series (see [0] and predecessors). Thus,
they should be ready for inclusion in mainline.

However, as has been discussed in [0], it would be beneficial to add
support for the split mode (a feature of the Rockchip CSI-2 DPHY)
before integrating the MIPI CSI-2 Receiver into the respective SoC
device tree includes. We can readily add the DT binding and the driver
as I am positive they will not need to be changed when this feature is
introduced, but there are no patches in the series that introduce the
DT nodes.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: rockchip: add driver for the rockchip mipi csi-2 receiver
      arm64: defconfig: enable rockchip mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 742 +++++++++++++++++++++
 8 files changed, 917 insertions(+)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



