Return-Path: <linux-media+bounces-47709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B033C856DB
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 15:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 07B1A3502FA
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216A63254B8;
	Tue, 25 Nov 2025 14:30:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41145325739
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081029; cv=none; b=hw8U4Yd9JvIEZszYX+1InqnDWvWo6V15TEl8bjhxfEF/uIgpkMMAXfWl4gsqk4+t/yu96lFMZnxZnnPUI8Dgg2aqonRdn+8QQzrN4L0T0f5dOcO6OdARRyfGY2skJDLAufm9qit38pMYcX3e2I5qM3+krkI918CH1FhgY0qKLrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081029; c=relaxed/simple;
	bh=Cacia+1fZGbcW0dDm8cZcJPEp9Gva8dwTBJI8qXW+Zk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=doPKaQd0H4w8Kpky/v6cRcRIdswBubnVd6cDQnwCbQ75c9f7+Laj+9OSaIDMfWIbl+VYgZjfM6AeM5qCX3aVKz8xoXNwGn9tLTwvEsQmZ1c9E/g3bqFc6kgN3MRVMqV05uF4FamJS3yqziq9YZhuE7XEKcsjipZJ1vhLnGJubIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vNu3d-0003eq-Kb; Tue, 25 Nov 2025 15:30:17 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v4 0/4] media: adv7180: make VPP handling more flexible
Date: Tue, 25 Nov 2025 15:29:53 +0100
Message-Id: <20251125-b4-adv7180-vpp-sub-device-v4-0-c772b9a80916@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGG9JWkC/43NTQ6CMBAF4KuYrh3TFmSoK+9hXPRngG6AtNBgD
 He3siLRGGf3XvK+ebJIwVNkl8OTBUo++qHPoTwemO103xJ4lzOTXJ5FPjAlaJdQ1BzSOEKcDbi
 8swTGuuKMGnWpBMv7MVDjl82+3XPufJyG8NheJfFu/1GTAA6qRmxINciVuY7Ut/MUht4vJ0fsT
 Se559QvTmaurjSi4qYq9Heu2HGS/+KKzFnlal5VgtCpD25d1xffZWv2ZQEAAA==
X-Change-ID: 20251111-b4-adv7180-vpp-sub-device-bcd357a7a491
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
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
Changes in v4:
- fix device tree bindings
- Link to v3: https://patch.msgid.link/20251120-b4-adv7180-vpp-sub-device-v3-0-c9d80661e7d9@pengutronix.de

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

 .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 97 +++++++++++++++++++++-
 drivers/media/i2c/adv7180.c                        | 55 ++++++++++--
 2 files changed, 143 insertions(+), 9 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251111-b4-adv7180-vpp-sub-device-bcd357a7a491

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


