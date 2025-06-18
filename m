Return-Path: <linux-media+bounces-35184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFEADF1A0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E978188BF86
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A2F2F0037;
	Wed, 18 Jun 2025 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PEnjB6we"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDCE2EF650;
	Wed, 18 Jun 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261379; cv=none; b=C1fhVw37XfuE/ddltBlwDGGS77AV1m6aTRpCQeotbGs8aCLKR57Vg4YbMVzPdPjZKM22t882N36Zlj3aztxTPUxrtNIO7soYchI2RmEtAWBaidw+ETMcvgZMz0W7J7ATKmMGfeVMLce0YyCu36syOPCWTvr2hYTZhqxHAoyJdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261379; c=relaxed/simple;
	bh=53DlZlEjAMjLFC6m7EwUfHPP/jGL50LGvoZPwQn5Jmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H+21ODh0+IDXw4Xe5F0b41ESeUWeYEl0UGhy/60MhthJlHpthUsHq0L4M7RScEWNZNiKRnX/5QsEmXm9d9ZoluTqcfk+XcbuUSo3HnoqdwGefjMA4gvN4bHGqaZGnAVJYY22Ju6SSK7wX9ybCfalx9RkBwVTXO2vKc0iAdfA6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PEnjB6we; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9C33107;
	Wed, 18 Jun 2025 17:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750261361;
	bh=53DlZlEjAMjLFC6m7EwUfHPP/jGL50LGvoZPwQn5Jmg=;
	h=From:Date:Subject:To:Cc:From;
	b=PEnjB6weIuk2ewlOWkpzF1h20tN+4Gz7HEOGa4Sf1u9Wf/aNxf4jBUxcMicpzFESb
	 ALmwAztczcilweqSSagSFZMyYmI9IRRNsYH2TZcqPkDoF+x/VZiBnJon1rW7lU5oJF
	 +In621Zaq5pdlZUosxUFH3VaZYWxJ9AtaLGFSWKk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 18 Jun 2025 17:42:47 +0200
Subject: [PATCH] media: vsp1: Add missing export.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-vspx-include-export-v1-1-95a2da4ec465@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAHbeUmgC/x3MTQqAIBBA4avErBuwf+0q0aJsrIEw0QohunvS8
 lu890AgzxSgzx7wdHPgwyYUeQZ6m+xKyEsylKJsRFtIvIOLyFbv10JI0R3+RFlXnZqUmk2jIJX
 Ok+H4X4fxfT92ICOGZQAAAA==
X-Change-ID: 20250618-vspx-include-export-84379a99bf59
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=53DlZlEjAMjLFC6m7EwUfHPP/jGL50LGvoZPwQn5Jmg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUt59rYSi0GmeoF/IP1xDfvABUUqhhVe00ZPZn
 LG/7+NCg7GJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFLefQAKCRByNAaPFqFW
 PJ3MEACdHDouY541qUZ5c1bFmlogf771gv1sdxLYuv6M/rHvh9x60Kz0M9tfxaWhSLs1qyxy+Mx
 f0ogu7RI7hERHu0aXUEOyC4x7Oc615P2YIqeiTuRi4CC28LwuvZBqRz3ix+57NvH275yADF0sR8
 iiStTDTEdXoTaFs38aB5DGhGi6/8ByJ1IRaWWk590juJoGpi5D9jsYDUB8BwnyipJ7jG3RkYy2D
 0rAKjqcDc6Zzm2LLUSGCDlSiqb7KRjRtqTcgGHaZWCnFHTiC3NEXhz+BL3k84KXlSKoYa0RvRUN
 2pXv8sZECQvZA99bVhgvNujV79I30d2sniUg1W8j4mIFHpzLI0AlOnNf2dM4ncO/IbSTW51lFGB
 gnn2puaItaQGwXjvjsIK9gIx92q2Y00PrloWT+UheYkdPO15IBoWc0/+1mQpwlxq2E2s5+lO2Na
 sVMY8IzuIPyGd53tc/NDc5nA/3IOCdsfUEMhwsQswXka4QgFKfskr17SacxRXes4tAlhJ0aGbii
 +Sp8mBv/h9A+4jj25fyycTya1FICAowUg0L7xL9Uqew2mAVFu69sVQslMWKFjj0OgAdPq/3MZHL
 d4KscB+TDZ18cmVUkz3mwm+owtZkDMSmce+7DBGIXiiEwnZVB3rqLVeYruRZf5BGoJObAOAA5rE
 2mvVtJxsMueHR+A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

As reported by the Kernel Test Robot, the newly merged vspx driver
exports a few symbols but doesn't include the export.h header.

While at it, include the header file in vsp1_drm.c which exports
symbols as well.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com/
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Add missing export.h header as reported by kernel test robot <lkp@intel.com>

Can this patch be fast-tracked to ensure it lands with the one that
introduces the vspx driver ?
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index fe55e8747b05aa351c1547469f9cbbe2b6d25408..15d266439564e2317dbc380ef04d2b15ae899852 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 
 #include <media/media-entity.h>
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
index 6551d63ba387a05c932d2e557bd0ae5f8810acc7..a754b92232bd57f1b4cd3f9e7903f0b5da5c5c57 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>

---
base-commit: 642b70d526ab8daa8f256dfc1eb6bf27c3290cc6
change-id: 20250618-vspx-include-export-84379a99bf59

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


