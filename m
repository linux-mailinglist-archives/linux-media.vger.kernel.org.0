Return-Path: <linux-media+bounces-39407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C274EB2019F
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04069189920E
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505DB2DAFCF;
	Mon, 11 Aug 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g5/dbrMB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C91A01C6;
	Mon, 11 Aug 2025 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900456; cv=none; b=gWoMkrT//Lk/2z7C3FjI8HkBScDdsUxTFYG80KpqvlI1r2du+KMa+1MsiTymDmSZ/BVxAGvtxVfjjsqzlW3Wxu5dXq4YwKYiIdqChQk94ETy+QLwDHUzSzGFCFXM45yBZt7FdmvEQpOqL17z9Zc7cpSnVqpd1kinnEziNQosudc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900456; c=relaxed/simple;
	bh=yjIL0XRdWEBdT7zWvMkd8W6hHWo3xHZSaLlZ6GM5+tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kD/8lIGrcEoM/oXA4D61M3My0xbtnIq/CvZ4F2v3IQu/AKqgZjGYrlXRJ2cHwykjwOrjQnJWG8aPLJvLEbzQ8GRkb2QzL5cDdqs3t0eY7FemxFcqRDbNFlMi5q6udXDN2JC+BVuTgX/WZnmKL1izl0kbcGHr8OUTpHmqcdwngw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g5/dbrMB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBB7582A;
	Mon, 11 Aug 2025 10:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900401;
	bh=yjIL0XRdWEBdT7zWvMkd8W6hHWo3xHZSaLlZ6GM5+tw=;
	h=From:Subject:Date:To:Cc:From;
	b=g5/dbrMBdC65ALjy1I1mt+x077wrDJArhZEdKL3mIY7RODtLcXh+QzcTI6prKGmIG
	 /Qc6gczyRAI9wzVfcK7oIfUxKPTLwRKlDD2cdBejptl/GXX5Xg0PxJN3oUqxuoECo0
	 BTsDeyTYgp7IDbUr0sPjwoYenqcIecrdXnEFIFPc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 0/6] media: ti, cdns: Multiple pixel support and misc
 fixes
Date: Mon, 11 Aug 2025 13:50:12 +0530
Message-Id: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2nmWgC/3XM3QqCMBjG8VuRHbfYh87qqPuIiG0+5g5yssUox
 HtvSiBCHT7vy/83kojgEMmpGElActH5Po9yVxDb6f4O6pq8iWCiYpKXdAje4Na6FyKtwWCltHU
 LkFwMAcsjB5dr3p2LTx/eC574fP06YuskThmtbFOZI7httT27Bjr63ngdmr31DzJzSaxEydmWE
 Jk4MG6sAkyu/xByJZRQW0LOhEQtK41SKfwgpmn6APRVJnczAQAA
X-Change-ID: 20250314-probe_fixes-7e0ec33c7fee
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=yjIL0XRdWEBdT7zWvMkd8W6hHWo3xHZSaLlZ6GM5+tw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafL4RCGT9MliMs1MG4pxfr3fU6UD829vj6Hk
 kruIiKJhYuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmnywAKCRBD3pH5JJpx
 RX/BEADLogY9Vz2QaXA0uH6x9USJmaRj3QSVwY3GFW7/qjDSFtOBU2pCeXrQEiiT7jR8UPqWrvN
 U66EHOMRis58Sw72VOi+KJBCf6lNue6Bv5iwJkRbHbIy7gQG4vB0G0KKAHdri+G/3hhtGIeE+qU
 gfWCtpEfctvs3za21tI0uDapCLcKHcqVPrkIJeF2nzHWQIezbmP69sLD1mWf+8FIXAc28DuUmeO
 7y5pyQHDxigwxFXpfIrRUbiOO1jk4apMeLX6NxwsV/IS9rRr9o+2ATbhKsYxHzCBXTrmCRJmMxF
 vKlKYth+lwnHTADCAsSgls0zWOAJj91qpXlBE7bNdxv0tOfGh/axzSKDM3fEh0ydz+A8a8GmPt2
 Aahs4cIElsnX7WWVQjhbrjv1C/3FJCgovl5HkwswPM7ZaFR+yLudjXNd2k9Qh5+SAAS1XXf3f8L
 vJKojdq0734HUjmNp09fNBug006zJD/xpqdAvnfQguzfR/5PHvEGRQWxChrILNCRZ3uoBw9sZUC
 LrPF+6bg7BadUH9fgO5QKkMT65MkuZrwSNR8+n+bVHFn0xHfOjPzpbSJnjrJzpT1MwJ/qJYgP2G
 9tDx8T8unO3RJFhPmcdDQ+QHTZeM5N+IUpg2G/u1ML0JoypP2z5zHY6SX60fAYU9A5YDw6oHFB9
 guXHiSkuQgwHM9g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

The first four patches in this series are miscellaneous fixes and
improvements in the Cadence and TI CSI-RX drivers around probing, fwnode
and link creation.

The last two patches add support for transmitting multiple pixels per
clock on the internal bus between Cadence CSI-RX bridge and TI CSI-RX
wrapper. As this internal bus is 32-bit wide, the maximum number of
pixels that can be transmitted per cycle depend upon the format's bit
width. Secondly, the downstream element must support unpacking of
multiple pixels.

Thus we export a module function that can be used by the downstream
driver to negotiate the pixels per cycle on the output pixel stream of
the Cadence bridge.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Rebase on top of v6.17-rc1
- Add missing include for linux/export.h in cdns-csi2rx.c
- Link to v3: https://lore.kernel.org/r/20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com

Changes in v3:
- Move cdns-csi2rx header to include/media
- Export symbol from cdns-csi2rx.c to be used only through
  the j721e-csi2rx.c module namespace
- Other minor fixes suggested by Sakari
- Add Abhilash's T-by tags
- Link to v2: https://lore.kernel.org/r/20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com

Changes in v2:
- Rebase on v6.15-rc1
- Fix lkp warnings in PATCH 5/6 missing header for FIELD_PREP
- Add R-By tags from Devarsh and Changhuang
- Link to v1: https://lore.kernel.org/r/20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com

---
Jai Luthra (6):
      media: ti: j721e-csi2rx: Use devm_of_platform_populate
      media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
      media: ti: j721e-csi2rx: Fix source subdev link creation
      media: cadence: csi2rx: Implement get_fwnode_pad op
      media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
      media: ti: j721e-csi2rx: Support multiple pixels per clock

 MAINTAINERS                                        |  1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       | 75 ++++++++++++++++------
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 65 ++++++++++++++-----
 include/media/cadence/cdns-csi2rx.h                | 19 ++++++
 5 files changed, 128 insertions(+), 35 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250314-probe_fixes-7e0ec33c7fee

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


