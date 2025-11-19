Return-Path: <linux-media+bounces-47396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF3C70247
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 17:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 12AD83A7C1D
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 16:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6795136C0D5;
	Wed, 19 Nov 2025 16:26:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7A34E75A
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569571; cv=none; b=lcaSX4ACWl/zvu2wSO8U9XLIvC9PYoMPKRCrwuf9jxM2lr1y6Rv+7VFU6uga9VKIHZGyua1F5JC40EdwkNkih2ZsdapJ5MPKssi3EVMFV73H/bhbW8PzABuUEF1Oe1zrJI+Xowq2YtXYWrKnV9zZFpRjZp0cMb1vg23/2Sd08qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569571; c=relaxed/simple;
	bh=b9qktNJ9iJQGlZT7ZQunwDLMCxQROqNWIzuG+9SbK70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M47IMaNBDybl+FHCx0ArfXBWjRIG5NKDgggnO/V7fV2ostcxuUaxDcTppttQjaotzYfUhicAzeSTWGrcwgssLkHswVGcVHOnaP754GBSlpdb0HIK3oJIES5oXDCcyUajW9l93cM4mP4u9h78BV4XC/GSiy/r+jbTPvcOi92oth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vLl0L-0000aE-4S; Wed, 19 Nov 2025 17:26:01 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/4] media: adv7180: make VPP handling more flexible
Date: Wed, 19 Nov 2025 17:25:50 +0100
Message-Id: <20251119-b4-adv7180-vpp-sub-device-v2-0-86a7790b63ab@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/vHWkC/42NQQ6DIBBFr2Jm3WnAapCueo/GBcios0ECSmyMd
 y/1BP2795P3/wGJIlOCZ3VApMyJF1+gvlUwzMZPhOwKQy3qVpagbdC4rGQnMIeAabPoijcQ2sE
 9WmWUabSE4odII+/X9rsvPHNal/i5rrL8tf+sZokCdafUSHpUQttXID9ta1w873dH0J/n+QUPt
 Ts/xwAAAA==
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

 .../devicetree/bindings/media/i2c/adi,adv7180.yaml | 93 +++++++++++++++++++++-
 drivers/media/i2c/adv7180.c                        | 55 +++++++++++--
 2 files changed, 139 insertions(+), 9 deletions(-)
---
base-commit: d363bdfa0ec6b19a4f40b572cec70430d5b13ad6
change-id: 20251111-b4-adv7180-vpp-sub-device-bcd357a7a491

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


