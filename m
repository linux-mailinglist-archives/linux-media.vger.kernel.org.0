Return-Path: <linux-media+bounces-23462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D449F2DC5
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 11:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14E6C7A0299
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 10:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5164A2036F3;
	Mon, 16 Dec 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U8C2QkU6"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BBD202C43;
	Mon, 16 Dec 2024 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343556; cv=none; b=LLhWiXpeBkYmTFa2jAgG0OfHK2z5LToP/c2FnbDsaXLF00qoMFGP0FuHuL1CBfe1Kse43QmYUXJfjt9dYj2X7a8dlehWIPcaulkhli4aOvkmw/68pDunDCpIvwFuXsKzR4n5UrCSrAt8LWO8/xMp11VSjO9WYt/9Hg5I8r+vfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343556; c=relaxed/simple;
	bh=tcvcrEXa4z8aAmbxJaCBSKqscDZgaCP4yn9hBrRWWvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SdYxZUWt/iMfij1S53Pr7IhxT+kd5gL8fSQjoxzMZTG+lI1HRlWaRHThldHmSknyiXJgzUOp4zKO0SNyxQ9mVC2XM/jMwHAQOtdcCin0qCS2YbNgcfP8TJNn71Hq0Sh3f1cIbj420g6uHWclrWcXO1OH6shYoB+/TyTx+XSbb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U8C2QkU6; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=aJZhM
	nQQFM1POYULiipN3Rj2mbeFt5B/wTFTnYMR9LI=; b=U8C2QkU6EpnR9A+MCs2LL
	U8BtscA1UMCT26xi1nRWUB++fvf7wnGg2x8tL2D/S+WRgb4RdGogaPadTC2FKarm
	oWkJXaP3gGxC6qIQiZ6xvjKpTdSJqKotIcND17C0dxNb80hSpR526FPtPoN89+Xe
	yOFM7c53V/xwCZt5iRcihI=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3T3c9+19n8_S6Aw--.40279S2;
	Mon, 16 Dec 2024 18:04:49 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	ezequiel@vanguardiasur.com.ar
Cc: heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kever.yang@rock-chips.com,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] media: rockchip: rga: Fix Copyright description
Date: Mon, 16 Dec 2024 18:04:43 +0800
Message-ID: <20241216100444.3726048-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3T3c9+19n8_S6Aw--.40279S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWkAry5uF43AFWxXr1UJrb_yoW5uF1kpa
	1Du3s7ArW7GrWjgw1kJ3ZxCFZ8t3ZavayUGFWS9ws3ZFn29rWUK34DXas5Ar9rXr17Cay3
	tw4Yq347JF4avr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMBTOUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQW3Xmdf+hMiTgAAs4

From: Andy Yan <andy.yan@rock-chips.com>

The company name has update to Rockchip Electronics Co., Ltd.
since 2021.
And change Co.Ltd to Co., Ltd. to fix mail server warning:
DBL_SPAM(6.50)[co.ltd:url];

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>

---

Changes in v2:
-  Use uppercase (c) part for consistency.

 drivers/media/platform/rockchip/rga/rga-buf.c | 2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  | 2 +-
 drivers/media/platform/rockchip/rga/rga-hw.h  | 2 +-
 drivers/media/platform/rockchip/rga/rga.c     | 2 +-
 drivers/media/platform/rockchip/rga/rga.h     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 8a48e9d91f96..4396348811c8 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 11c3d7234757..bf55beec0fac 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (C) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index e8917e5630a4..cc6bd7f5b030 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (C) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 #ifndef __RGA_HW_H__
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 1739ac0c8e92..3dccab5fa4a1 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (C) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 8105bb2efe57..530e12de73c4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (C) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 #ifndef __RGA_H__
-- 
2.34.1


