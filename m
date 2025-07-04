Return-Path: <linux-media+bounces-36826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CEAF9162
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE2961BC637B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62662C3258;
	Fri,  4 Jul 2025 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pYuy8hE1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF7258CC0;
	Fri,  4 Jul 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628045; cv=none; b=HAVEEFVI5FzXcZ2C2DUo01d/X7nMkjjXHECZqL3CUsO79TeQHL253p0oO0TQhaHffM1sYCfJTZEdR3ZD8nzOsLkQ71mrnLaceejG07zML0x1m92izmfD9+Bd09kmTP0AQCs0h8Akw2G0SB8jgOzeKwkp/ULze87Y01byGTZfjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628045; c=relaxed/simple;
	bh=N4dlHWBi2Yw9Z2ZRxUydBN+ggzvwZfk/YrAhBy+usOg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLQk9BjSOfTyTnJKi2WZChWAzAQAsV4Bw94yLM7eyf/S1jrgTZ4AppwunFG1EQQ8YE9izdFxdQJ5hDBecc8iiZi3ZkoonpVxOKrR9hLevQbKPdg1JIUoI46GZseSnZT9xzqyppkocrFLG6QIUMwhKvxAlwr1OPjDUpbAZAHHa5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pYuy8hE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53C15669;
	Fri,  4 Jul 2025 13:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751628016;
	bh=N4dlHWBi2Yw9Z2ZRxUydBN+ggzvwZfk/YrAhBy+usOg=;
	h=From:Subject:Date:To:Cc:From;
	b=pYuy8hE1iM8gnZo5SclQElv201Kg90dEgmOu1tdyXMPEJUbYuHlWiEFminIuAjVth
	 /IwB0lwenzLoNV5FDkUVqFrrMQEUh4kLwBDWuGWDWvOfQG8Jrzt244Vt9l1wy+s+QA
	 xnwjnY0vy9RAeMc8K3/uat8bybl3QTh33ylvfm5w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 0/5] Add Input Video Control Block driver for RZ/V2H
Date: Fri, 04 Jul 2025 12:20:17 +0100
Message-Id: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPG4Z2gC/2WSzW7bQAyEX8XQuTKWP/vnU9+jyIFLcmsBiZ1Kr
 tEgyLt34xYo7N5EaOebITjv0+br4tt02L1Pq1+XbTmfxkBfdpMe5fTd58XGPGHAGBLyvFx1LkS
 GTDlBytN4+bp6X37dKN+extzX88t8Oa4u/7QRKnDMkfccOYQ4w2xy2m8qz89vXxdz2c6ndpbV9
 np++Utd/cfPEenyBz012Xwef1+Wy2EHFTM2yiLcC6lEbNarQrJoBZoZUGSufEPJRY9jk8NOHHo
 MHCnXHiuzdYgWekIXlVoCpcjiRPeqPsDdAuZcyAeTOmABy5VMpTPnmlgzPnoV80gJqWZNwg2sd
 CbRBkjemilDwLHGvcp65tIAikbsxpga5gAhV5PSNYQAkqGE/OCFHgtLbFBqq7lmEmnpU0fDuwf
 PKahAuVdhTCWxazBrXUmSZ29RXCGKkTZHa875wctVIxcad+wjI5aqoZJnAIs8NgM1K02p3atAX
 BJBEhSW3OLn96D3cboUiM3TsE0Zp88GHZftcl7fbrW84u34dw284hxmH8ltJA9S0/8Nevr4+Pg
 NLwEAXd8CAAA=
X-Change-ID: 20250624-ivc-833d24376167
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3661;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=N4dlHWBi2Yw9Z2ZRxUydBN+ggzvwZfk/YrAhBy+usOg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZ7kBoSwDnlqqAg27ZctLvqRYisRkiMWmujHE9
 NQHwX/isQeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGe5AQAKCRDISVd6bEV1
 Mjh8D/9tMnKxm0EOfSDVveUdybgnldv6fdxifE5Ha5IQR2yHGCw7f/LUULvoSJrE8RA9xoubfhZ
 dSBxfvkSDal9BmmfNq0nuz6BaMSbk8iHmuH51mQ/VlES7gvGkKtf6KBTUiBTZAtXJQxWFaymXjm
 cLOQ2mETLDSLUdr693AQkO/Whsh7Bo1iIKNhuyTtjSixfN4lIQ/sAjBsMOWcD1OfACt0wt9NkAF
 M8TYsAQoHyYLaAUTakAp26LpQWGJqco7CTILF+NLu9klKQXzmTZTNLEfYwtr1tzziPNFt2A4aOo
 LCdnetmAYydOoOdO74daV1xzTnhrO0MkYoWB/Mqnlo9ZrxVrwS2o/yYLPqmc3zXDj+WpWEmyQnp
 nRZR2xINDP4dYiLjUxeN9Fi4hc32o3YUlhvH7sI3f7nMkkYHaIEPYNzWuIdx/srHFnqxo/izkAL
 hxQu1/gGTHOFBtEJUyPgOL5AUH3sWUfhNyQA00Ms/qebLcYqST6DJ6Prs7RM1u84CDb9qXUi8nU
 gSuKKe0fusQvemjpHLt+MJPHDPuTNl854Sk5DORv4y5+6MlojABlTNdh2Qa1D9tpexPUH/19ePt
 90RivLLndlchTWwr6h/UqXFlga6m2Od6oiJR7PrHMuyzStBJk1UJrIMC1Pa0CTXB/tGBszHc4da
 /L4bNQJ4C7tTS8w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This series adds a driver for the Input Video Control Block in the
RZ/V2H SoC. The IVC block transmits input image data from memory to
the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
output video device for userspace to queue image buffers to. One
noteworthy feature is that - because it is not a part of the main ISP
drive - the IVC driver also registers a subdevice, which connects to
the media device created by the ISP driver through the usual v4l2
async framework. This requires delaying the registration of the video
device until the .registered() callback of the subdevice, so that the
struct v4l2_dev pointer the subdevice connected to can be set to the
video device.

This version of the driver drops the reliance on the new media
framework that was posted recently [1], so can be merged without it
and updated later. One patch from that series is retained here though
(since it's used independently of the new framework) and another new
patch added to add a new helper in V4L2. The series is also based on
top of the latest version of the Mali-C55 driver [2] and some updates
to rzg2l-cru [3].

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
[2] https://lore.kernel.org/linux-media/20250624-c55-v10-0-54f3d4196990@ideasonboard.com/T/#t
[3] https://lore.kernel.org/linux-media/20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com/T

---
Changes in v3:
- Added two new patches that create helpers in V4L2 and mc core that
  the driver then consumes.

- Link to v2: https://lore.kernel.org/r/20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com

---
Daniel Scally (5):
      media: mc: entity: Add pipeline_started/stopped ops
      media: v4l2-dev: Add helpers to run media_pipeline_[started|stopped]()
      dt-bindings: media: Add bindings for the RZ/V2H IVC block
      media: platform: Add Renesas Input Video Control block driver
      MAINTAINERS: Add entry for rzv2h-ivc driver

 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 ++++
 MAINTAINERS                                        |   7 +
 drivers/media/mc/mc-entity.c                       |  46 ++
 drivers/media/platform/renesas/Kconfig             |   2 +
 drivers/media/platform/renesas/Makefile            |   1 +
 drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  16 +
 drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 228 +++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 376 ++++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 568 +++++++++++++++++++++
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 131 +++++
 drivers/media/v4l2-core/v4l2-dev.c                 |  57 +++
 include/media/media-entity.h                       |  29 ++
 include/media/v4l2-dev.h                           |  36 ++
 14 files changed, 1605 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250624-ivc-833d24376167
prerequisite-patch-id: ae1f5045379f5944df15d0f62eaca9803654ae33
prerequisite-patch-id: ff9cfd027783e4943f1281d793dcaf447964c724
prerequisite-patch-id: a8de5362397c6a4b1d8f43acb123ebbdc4102192
prerequisite-patch-id: df748b118c52fd426b2701079da8fc0001a71807
prerequisite-patch-id: a2e584a5b189b97973aab601073c6af0e760ca18
prerequisite-patch-id: 256864ec0ddbfc3a6e7eb5aec15ad3cbe2dbe477
prerequisite-patch-id: ecc5483454fc52289c093e711d5423e1cdd8bc3b
prerequisite-patch-id: 1aea6316a2a4a7b56316dbef3ca6034de6ec1672

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


