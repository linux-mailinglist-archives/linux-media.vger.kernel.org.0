Return-Path: <linux-media+bounces-23427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5E9F22FA
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 10:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D84D1612AE
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFBD1494AB;
	Sun, 15 Dec 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LGw/QALI"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876191119A;
	Sun, 15 Dec 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734255091; cv=none; b=CVRAVA/2ljRC+gClOg5J6s8kDQyMd9MK1fz9R01cElMk3VrJKr8puP6wnHgkySuijoE2nNb/19vBhfXgMMG5haVq2eCpa6BSNhIy6ds+Tq+CRm0HGo/xMIVcBrdtWWLnQRT4/O0GfiZSYBXhMIfqhSfimkuBYFnQJ/1Gg5PetU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734255091; c=relaxed/simple;
	bh=1LevaLjZviJY0khhtqx6ZGlQdsuigcmOTlHhKWahoO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGdIENR/BFxMY4jjcuCOOtlzzSyQi5hIBZTVyWetIs9qXQZFgxgfvD+deq1COxm5p274+e03P2t1q3lpJslzxMS57YZn1bSqm0ZMDytnkGKFa+pvZ0bl4y4NQw/iSJajTrL3SJu0KAgWMVGFRFM+DO4gMyFIBQ92VZq8XxseBi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LGw/QALI; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=9MGcY
	rjNQIU1R6HMIXEA17Gskoif7/Q3UlS9ndbrDxo=; b=LGw/QALI5Q0oJ/KRVhJqC
	0gtSU85dXJgYnWHO3xvHqQOjZL2KApLO9AlrSMFpLkt0RpeGINehasFjJIYE0Y0M
	YIhD0tbakqxYy+OEWyF+YLgNh4E2nb2czriCna3gU5yTDhyOTb0/InF0tPDf3pBf
	XdGhUlYtnhj2K7BsjGHyeY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3N83MoV5nWznGAg--.58485S2;
	Sun, 15 Dec 2024 17:30:55 +0800 (CST)
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
Subject: [PATCH] media: rockchip: rga: Fix Copyright description
Date: Sun, 15 Dec 2024 17:30:50 +0800
Message-ID: <20241215093051.3447711-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N83MoV5nWznGAg--.58485S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWkAry5uFy5AryrXF1fWFg_yoW5Zr48pa
	1Dur97ArW7GrW2qw1kJ3ZxCFZ8t3ZavayUGFyS9ws3ZF1I9rWDKw1DXas5Ar9rXr17Aay3
	Kr4Yq347JF4avr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBuWJUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxO2XmdelrWs4wAAsd

From: Andy Yan <andy.yan@rock-chips.com>

The company name has update to Rockchip Electronics Co., Ltd.
since 2021.
And change Co.Ltd to Co., Ltd. to fix mail server warning:
DBL_SPAM(6.50)[co.ltd:url];

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/media/platform/rockchip/rga/rga-buf.c | 2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  | 2 +-
 drivers/media/platform/rockchip/rga/rga-hw.h  | 2 +-
 drivers/media/platform/rockchip/rga/rga.c     | 2 +-
 drivers/media/platform/rockchip/rga/rga.h     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 8a48e9d91f96..0a7cb1af9b1a 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 11c3d7234757..26c6645797fe 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index e8917e5630a4..5ccc081a88b2 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 #ifndef __RGA_HW_H__
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 1739ac0c8e92..c671d289ceed 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 8105bb2efe57..69841f2a352e 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Copyright (c) Rockchip Electronics Co., Ltd.
  * Author: Jacob Chen <jacob-chen@iotwrt.com>
  */
 #ifndef __RGA_H__
-- 
2.34.1


