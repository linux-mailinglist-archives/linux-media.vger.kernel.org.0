Return-Path: <linux-media+bounces-43816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28938BC0B7A
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7ED13C7A55
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D992DF707;
	Tue,  7 Oct 2025 08:33:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E642D63FC
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825997; cv=none; b=IzC2JqejmqismnSbNnv+R+i3Qg+edvCDmhOBvHCOfXPUHndGAiHp+FP30OZKI3OoawfIigpCpasnZ1Di/XPJfwuP1YCp6rtJQ0o5cQskPUVDoury/Jw9zo+ZV6GTec/yGsXmItbWOzeO7WC66pKOOW946G/J5K69HPnoobIskeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825997; c=relaxed/simple;
	bh=m8/AYG1WeqfOxv75Mz5AsWV07rJvH181OXXlCgRuSc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNl68wNx3I1XOoQwlYnqKdru3D1Dntp6RwTM+pUcYGQPMgOktXO+pQ01b5RHI9of3gNkAjvkMod3e9LOp1pmiaPogddNZLZTlCWqov39C1eQmZOEBzEgRoABLq0OJcK/1NPlctFZJmZMxEvJfgeeHYLa5Y8G31TnCGPXVju9dFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637w-0002Hb-U9; Tue, 07 Oct 2025 10:32:57 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:04 +0200
Subject: [PATCH 11/16] media: rockchip: rga: add iommu restore function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Add an iommu restore function in preparation for the rga3 addition.
This is necessary for a soft reset, as the rga3 will also reset
it's iommu paging table to 0 and disable paging.

The empty domain attach/detach to restore the iommu is copied
from the rkvdec driver.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 24 ++++++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga.h |  7 +++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index cd4da01645611e5fb51ed94e09b5f1463dad72c5..0a725841b0cfa41bbc5b861b8f5ceac2452fc2b5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -560,6 +561,19 @@ static const struct video_device rga_videodev = {
 	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
 };
 
+void rga_iommu_restore(struct rockchip_rga *rga)
+{
+	if (rga->empty_domain) {
+		/*
+		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
+		 * will program an empty table, then detach it to restore the default domain and
+		 * all cached mappings.
+		 */
+		iommu_attach_device(rga->empty_domain, rga->dev);
+		iommu_detach_device(rga->empty_domain, rga->dev);
+	}
+}
+
 static int rga_parse_dt(struct rockchip_rga *rga)
 {
 	struct reset_control *core_rst, *axi_rst, *ahb_rst;
@@ -657,6 +671,13 @@ static int rga_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	if (iommu_get_domain_for_dev(rga->dev)) {
+		rga->empty_domain = iommu_paging_domain_alloc(rga->dev);
+
+		if (!rga->empty_domain)
+			dev_warn(rga->dev, "cannot alloc new empty domain\n");
+	}
+
 	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
 	if (ret)
 		goto err_put_clk;
@@ -741,6 +762,9 @@ static void rga_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(rga->dev);
+
+	if (rga->empty_domain)
+		iommu_domain_free(rga->empty_domain);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17..e19c4c82aca5ae2056f52d525138093fbbb81af8 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -75,6 +75,7 @@ struct rockchip_rga {
 	void __iomem *regs;
 	struct clk_bulk_data clks[3];
 	struct rockchip_rga_version version;
+	struct iommu_domain *empty_domain;
 
 	/* vfd lock */
 	struct mutex mutex;
@@ -114,6 +115,12 @@ static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)
 
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
 
+/*
+ * This should be called in an interrupt handler to make sure no memory
+ * is mapped through the IOMMU while the empty domain is attached.
+ */
+void rga_iommu_restore(struct rockchip_rga *rga);
+
 /* RGA Buffers Manage */
 extern const struct vb2_ops rga_qops;
 

-- 
2.51.0


