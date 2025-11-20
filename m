Return-Path: <linux-media+bounces-47504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AEC7492A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 15:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5311F4F0B1D
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5FE34A3DF;
	Thu, 20 Nov 2025 14:23:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05F345CB1
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648609; cv=none; b=XwixKvJctCsVZ+78/hQmvKx6KrWeyndGDWpOhnsu7+IqXWwRDXmGZdhACbESFWeoo3Am4PTOEYCxQvVCC7vfmdtQERqjjkuS1NpDjEGl6q4TCIi0D7XSa/fd9Ye4eg6J6bxYGL+xu9Gcv/VeDM6gR0mpsCFmiOWbZ6MVXKTf3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648609; c=relaxed/simple;
	bh=WZe5/cA6zqNeTygzkTLdr1KPjI/va8xNKx8u+FYczho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fxstDXb5uo0Y/yP+xjHj8jfMxkMHDFcQie0Rg4lGmKA8iAqBi97PMYlPnRfJt/zAyKa4HI8XqEN8f9CgPzg+Xwhc9+5JzPQzg5vyi5u6JnrGFb209kn2diSoRb2qwyZn3fKWCTJCYEKjoN/wKdF5v5KRawX6jvcoQ14/Ufw1Pno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vM5Z9-0004us-9J; Thu, 20 Nov 2025 15:23:19 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 0/4] media: adv7180: make VPP handling more flexible
Date: Thu, 20 Nov 2025 15:22:52 +0100
Message-Id: <20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwkH2kC/43NTQ6DIBAF4KsY1p0G8AfpqvdougAZlQ0SUGJjv
 HvRVZMmTWf3XvK+2UjEYDGSW7GRgMlGO7kcyktBulG5AcGanAmnvGb5QFegTBKspZC8h7hoMHn
 XIejOlLVQQlWSkbz3AXu7nvbjmfNo4zyF1/kqsaP9R00MKMhWiB5lL6jUd49uWOYwObteDZKDT
 vyTk784nrm2UUJIqptSfXP7vr8BysGdsBYBAAA=
X-Change-ID: 20251111-b4-adv7180-vpp-sub-device-bcd357a7a491
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>, 
 Thorsten Schmelzer <tschmelzer@topcon.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The adv7280 and adv7280-m have a Video Post Processor (VPP) unit that is
able to de-interlace the video signal.

This series makes the handling of the VPP more flexible. Furthermore, it
fixes the reported frame interval if the VPP is enabled.

Patches 1 and 2 add the device tree bindings and driver handling to
specify the (programmable) I2C address of the VPP (and CSI) slave device
via device tree.

Patch 3 exposes the registers of the adv via CONFIG_VIDEO_ADV_DEBUG to
user space for improved debugging capabilities.

Patch 4 fixes the frame interval that is reported by the driver if the
de-interlacing is active.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v3:
- fix device tree bindings
- Link to v2: https://patch.msgid.link/20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de

Changes in v2:
- fix and rewrite device tree bindings definition
- simplify calculation of frame interval in progressive mode
- Link to v1: https://patch.msgid.link/20251111-b4-adv7180-vpp-sub-device-v1-0-9877fe9f709b@pengutronix.de

---
Michael Tretter (1):
      media: dt-bindings: adi,adv7180: add VPP and CSI register maps

Thorsten Schmelzer (3):
      media: adv7180: add support for ancillary devices
      media: adv7180: implement g_register and s_register
      media: adv7180: fix frame interval in progressive mode

 .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 99 +++++++++++++++++++++-
 drivers/media/i2c/adv7180.c                        | 55 ++++++++++--
 2 files changed, 145 insertions(+), 9 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251111-b4-adv7180-vpp-sub-device-bcd357a7a491

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


