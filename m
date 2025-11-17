Return-Path: <linux-media+bounces-47201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418AC6363E
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 11:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB0FB3A188C
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 10:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED62826E711;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgUVulQS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356D26F2A7;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373687; cv=none; b=PQTDP44fEjDjaH76zA7zzvLPmbmf8OI8CD0+sJWeb/dNv9wpyAtVtGgyW1Xj4+wyCwYiRhRN32q+FSdwHexz3huPm3c0CR93rLpmGruyqL+u/yP8E9XbjRhQF0+uvWozs1FnK4x+RkUh1+qPUMNmRWREBPKRU6ylR+YGfMRggPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373687; c=relaxed/simple;
	bh=U7vRmfMxxu2hnBi8KL4uNoUJ2y6rwaX3sY9jqWizYHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BdKL5kak+S27NAUEKIqTSEsjMZsg7DcazdaQZ9JOgeRKzhBK9xra7Su1ZQfjavBBHAr854ZEA0jaQ6qDk+DYRGNj1Z6lcLo+lkCPyWrGMryE42S6TtQFrXVKI5MqH1CTsK769FGbnFWKi1CtTowfDJmitw3sm7PHVjPHj3g3Z40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgUVulQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C4A3C19422;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763373687;
	bh=U7vRmfMxxu2hnBi8KL4uNoUJ2y6rwaX3sY9jqWizYHI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EgUVulQSk6IrjR49E250Z5eogUcv3NROnQ7dvGB4iEL+L79B5G2nXvNcmwlEZohY6
	 rwfdAbtDo6+QFJL5/xmd0rPC3ap3ebl3rhE7AY2+MpafC+6yUIjNjp3NJHLi5LxRFP
	 dP15sdMdHuhCI4EAfm7mK+BY27xcYtVyGUrZR2unuEbyzq+gBP6Pp5qiKdJHVGwLyV
	 12l+yNFJVV/Or6G09EnaMR1cC0nkGYcLbJpdtGrpFsnSTQftLatiZmDTV5IgAoyBj1
	 GpSMIOwc7OoSgknlBQIYHtmT5Jg9V5N20Pw8VgfsYU1rVM7i5lV34Sc74+S54l0Ydl
	 O/0HUUdDF58rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED66CEBF61;
	Mon, 17 Nov 2025 10:01:26 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Mon, 17 Nov 2025 11:01:08 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTyGmkC/x2NwQrCMBAFf6Xs2YUmRFB/RTwk66tZrGnY0CKU/
 rvB4wwMs1ODKRrdhp0MmzZdSgd3GkhyLC+wPjuTH/3ZORfYFnlL1sofrcoGgW4wHlOcfAhylQu
 oxyk2cLJYJPe8rPPcZTVM+v3f7o/j+AFfc3NQfQAAAA==
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763373685; l=1863;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=U7vRmfMxxu2hnBi8KL4uNoUJ2y6rwaX3sY9jqWizYHI=;
 b=V2eiFY6j5uhsHH4Fimug2DOFegD7zyJEBXg52CjTfy6OV7afZRNtTi0htq66yNivE1qw1k2Cy
 VQwX9b1QOYrCH9yKNBffKHvefIt+KQX5yb7MHPqcjq8VRZeUAQyHwHs
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

These changes have been discussed and reviewed thoroughly (see [0] and
predecessors). As has been discussed in [0], it would be beneficial to
add support for the split mode (a feature of the Rockchip CSI-2 DPHY)
before integrating the MIPI CSI-2 Receiver into the respective SoC
device tree includes. However, we can readily add the DT binding and
the driver as I am positive they will not need to be changed when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

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



