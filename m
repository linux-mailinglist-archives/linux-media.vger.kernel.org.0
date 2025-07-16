Return-Path: <linux-media+bounces-37863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E283B07482
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 538C7565CED
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0602E2F3655;
	Wed, 16 Jul 2025 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="exTFlg0x"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65732F2375;
	Wed, 16 Jul 2025 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752664827; cv=none; b=TJZ6lUOGogmp7OUAP82djZPSqI7Js/g9X6U0Wn766ZhkEvt9jvPAF2vMobWY0y1v4IRM48YWF3QGUfNnxVIFDeWKS4ziVxHlX9HYYCQ9mAVL0fHPTVWgx8IVNCfLhrsvmIBF62NcwzRBzO0xDKfFgqLOYRv4H++RZvPjMNpylFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752664827; c=relaxed/simple;
	bh=jHMCP7bTXZ3MXBAzip3AE+MywjHMj3JI7rUw87lQY4A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QB543ZB066CVJzyhxLhbdwBpd8F5xI8XQ0wxl4T7BmfL9PsfrRR3PWqO1hwS+iGKC8NeIIh5pZBEPResBfZt+PxoMGDm4hLX65biZxlyjrHjqYrooryWH4FxcdEwHNqm1MT1NoTePFolZpFC1LsUIpRXomJhaxaSkkYuXFtw2PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=exTFlg0x; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBJn9E235380;
	Wed, 16 Jul 2025 06:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664789;
	bh=0u+F4uSXWp4fu1jXml3y1tvKJ+rRK+QNJHYGF1V9ge4=;
	h=From:To:CC:Subject:Date;
	b=exTFlg0xv8WWt9fJGv9s9HwmPZX8tmq86TxceyH/7hcnbaTqfzFl7UI9Ek3URsTgU
	 LFUqiQqqsAUpPKbAcD3atZVSg3ETos43IhH3/unU9ok2nk5HLzacugjJ4vjWE2++mJ
	 Ag3SJBwL/NSWvGUdsRMCDvWj1VLdPdsomnuIk2ic=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBJnle1343225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:19:49 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:19:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:19:48 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep0344714;
	Wed, 16 Jul 2025 06:19:41 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 0/4] Add support for VIP
Date: Wed, 16 Jul 2025 16:49:08 +0530
Message-ID: <20250716111912.235157-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series add support for the TI VIP video capture engine.
VIP stands for Video Input Port, it can be found on devices such as
DRA7xx and provides a parallel interface to a video source such as
a sensor or TV decoder. 

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

The first patch in this series updates the outdated MAINTAINERS entry
for the TI VPE and CAL drivers. The subsequent three patches introduce
support for the TI VIP (Video Input Port) driver.

Link for v1: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/
The v1 patch series was posted in the year 2020. This v2 series resumes the
effort to upstream VIP support by addressing all previous review comments

Changelog:
Changes in v2:
- Remove array and just use hsync: true in bindings (Patch 3/5)
- Remove array and use enum for bus width in bindings (Patch 3/5)
- Use pattern properties since properties across ports are same (Patch 3/5)
- Remove vip_dbg, vip_info, vip_err aliases and just use v4l2_dbg, v4l2_info
  and v4l2_err instead (Patch 4/5)
- Remove color space information from vip_formats struct (Patch 4/5)
- Use g_std instead of g_std_output (Patch 4/5)
- Do not touch pix.priv (Patch 4/5)
- Remove all comments with just register values (Patch 4/5)
- Remove support for vidioc_default ioctl (Patch 4/5)
- In case of any error while streaming, push all pending buffers to vb2 (Patch 4/5)
- Address some minor comments made by Hans throughout the driver (Patch 4/5)
- Update copyright year at various places

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/b0791cb465fadc11d4c995197cb22f29

v4l2-compliance cropping and composing tests are failing likely
due to OV10635 sensor supporting several discrete frame sizes,
fail: v4l2-test-formats.cpp(1560): node->frmsizes_count[pixfmt] > 1

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/98504ab56416aef38b851036aef5eeb1

Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add bindings for Video Input Port
  media: ti-vpe: Add the VIP driver

Yemike Abhilash Chandra (2):
  MAINTAINERS: Update maintainers of TI VPE and CAL
  Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"

 .../devicetree/bindings/media/ti,vip.yaml     |  211 +
 MAINTAINERS                                   |    3 +-
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3824 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  719 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   32 +
 drivers/media/platform/ti/vpe/vpdma.h         |    3 +
 8 files changed, 4806 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


