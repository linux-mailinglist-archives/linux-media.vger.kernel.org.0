Return-Path: <linux-media+bounces-26870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2AA42D8B
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09C23B1BC5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBAD243956;
	Mon, 24 Feb 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VXGaLugT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D01FF5FF;
	Mon, 24 Feb 2025 20:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428402; cv=none; b=gOuuuthHyLScvzkd7b0nmJ+GGgWM7aDIVx1UoLUB057A3mcg4FdtdnjCSyV50UE3Ic0Qgkc3oi9C8kZmUettxS6A69ch2wC2GVs3rX3DLEQm4iJiOFElcuu96X8TbieFEFRgKzZUavZHfzAf1SWxF71muomYzhfJXMSOqtu51qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428402; c=relaxed/simple;
	bh=/RxtWwoYoXIrodnSIYgLATNnVHkI2ng+An1Ak86l110=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzycbfuIeqK+gVg6ftf1bRPFOgDkSKgIBxSLiCW/nkBc6XssZCqlixYuOO7aAgGfBY2QFqxUQcaR2yFK6sz4zHhkeRm/9CFks32S0GialHmgFlZ02/HR+EI5KhQA42HSLWVUUEx45l3lgr7cBlZJaz4u8lSurxNknFl/Tepjad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VXGaLugT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40BCA55A;
	Mon, 24 Feb 2025 21:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428311;
	bh=/RxtWwoYoXIrodnSIYgLATNnVHkI2ng+An1Ak86l110=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VXGaLugTDVVStZ7ZDWywpz3AuQ2d7iUBnDMlhlrT0rEw/vNDO94VT9g1bPTqy5Jfx
	 vyQQaW+HGrqs/6QIDiIRpMx4WAPvnJ8drlV6vD8kuwIocgmLNRUEgJZkqS4SYNDatl
	 oHs00BuZzCvlUpiKWnWO1jyzOIem0qOcsJKbtzmY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:41 +0100
Subject: [PATCH v2 1/6] media: vsp1: Add support IIF ISP Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-v4h-iif-v2-1-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=13642;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=/RxtWwoYoXIrodnSIYgLATNnVHkI2ng+An1Ak86l110=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRr0ASOo8G++gLBQbxwuY51XTFb33kDdFaW6
 P7n52Vasf+JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUawAKCRByNAaPFqFW
 PPpUD/9XpKEwSjj76EpU2lg7I3KYrg9olikJgHRRl24vzr+R23nls6elVOPMpb9mr2VxMj8G76b
 gmbQl0co+JLq02hzIetjOyq6E7dn1WDnqceR1AoAIuCmDOW0gZhQaym36O8VYLlXNNZw4GCk1lA
 C3AymOoikEHlAdzLabNlaB6rw30SmBEgOJvFLHxfw/Z7vCSiFvul4OuyyLKMrU9W5QI6nb3thxL
 BB5UOjDvOANpBC7bgamFSetgKThfPL9mqIKMZjlKQ7dJIuaTj+Zuf9MxYXykq1Ht7a++EaXovBp
 CnuLJ0EoyxiY2NKWaS2E1k3mWBoyg8uJQ8Xw26Muu2Z3apmWyohuN5ZuOD+//9TYmIa9LSD7rsz
 LfOdWwabjVZrisgeLL7arEyJYWb/UTt4JYlEWvwt62r0gaBbaxFvHN+mGWJkXu0VbRkJnS1GMpj
 kcS4B5nFpZHV6K+LB1RNyEsI8CEUm5PpIecoHyWG21CaKtGcwRAin0AMUByEaDm7MDR8NoKsnbT
 wjm18R6LmMKt6miTvopVMOGJYoIfL0FJ5geGpR80IFGeIbHdAkJev5kHaO9P46stTz2+Y9mkt9k
 XbZXzTSQaJS5wzB+e3cfssxWAj8zi/8v5L69lUltjT6qbqAu374ut8dp9r7XOVPWcx8jUyxj0Y7
 fB9dWORrvFK+rOQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The IIF (ISP InterFace) is a VSP2 function that transfers data
to the ISP by reading from external memory through two RPF
instances.

Add support for it in the vsp1 driver by introducing a new entity
type. The sole required operation is to enable the IIF function
during configure_stream().

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/Makefile      |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h        |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c    |  11 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.c |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_entity.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_iif.c    | 133 ++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h    |  26 +++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h   |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h   |   8 ++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c    |   7 ++
 11 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
index 4bb4dcbef7b55be7a40231a04e14029911da9beb..de8c802e1d1a16aabe1326fc8c27be33ad2b2e10 100644
--- a/drivers/media/platform/renesas/vsp1/Makefile
+++ b/drivers/media/platform/renesas/vsp1/Makefile
@@ -5,6 +5,6 @@ vsp1-y					+= vsp1_rpf.o vsp1_rwpf.o vsp1_wpf.o
 vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
 vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
 vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
-vsp1-y					+= vsp1_lif.o vsp1_uif.o
+vsp1-y					+= vsp1_iif.o vsp1_lif.o vsp1_uif.o
 
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 2f6f0c6ae55514d312e48232a5f8c8673f69ba13..263024639dd2a7564fc70ad52dbe17f9a5279f45 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -32,6 +32,7 @@ struct vsp1_clu;
 struct vsp1_hgo;
 struct vsp1_hgt;
 struct vsp1_hsit;
+struct vsp1_iif;
 struct vsp1_lif;
 struct vsp1_lut;
 struct vsp1_rwpf;
@@ -56,6 +57,7 @@ struct vsp1_uif;
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
 #define VSP1_HAS_NON_ZERO_LBA	BIT(11)
+#define VSP1_HAS_IIF		BIT(12)
 
 struct vsp1_device_info {
 	u32 version;
@@ -91,6 +93,7 @@ struct vsp1_device {
 	struct vsp1_hgt *hgt;
 	struct vsp1_hsit *hsi;
 	struct vsp1_hsit *hst;
+	struct vsp1_iif *iif;
 	struct vsp1_lif *lif[VSP1_MAX_LIF];
 	struct vsp1_lut *lut;
 	struct vsp1_rwpf *rpf[VSP1_MAX_RPF];
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9fc6bf624a520ae38e9c5f30dfa4dfa412eec38e..d13e9b31aa7cff8610ea196ae4de88ab22e44e0f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -29,6 +29,7 @@
 #include "vsp1_hgo.h"
 #include "vsp1_hgt.h"
 #include "vsp1_hsit.h"
+#include "vsp1_iif.h"
 #include "vsp1_lif.h"
 #include "vsp1_lut.h"
 #include "vsp1_pipe.h"
@@ -340,6 +341,16 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 			      &vsp1->entities);
 	}
 
+	if (vsp1_feature(vsp1, VSP1_HAS_IIF)) {
+		vsp1->iif = vsp1_iif_create(vsp1);
+		if (IS_ERR(vsp1->iif)) {
+			ret = PTR_ERR(vsp1->iif);
+			goto done;
+		}
+
+		list_add_tail(&vsp1->iif->entity.list_dev, &vsp1->entities);
+	}
+
 	/*
 	 * The LIFs are only supported when used in conjunction with the DU, in
 	 * which case the userspace API is disabled. If the userspace API is
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 8b8945bd8f108354f1b484530bc496dbac7d3d88..2096a09a12780ce64d9e8690aa4363bdaef3521e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -63,9 +63,14 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
 	/*
 	 * The ILV and BRS share the same data path route. The extra BRSSEL bit
 	 * selects between the ILV and BRS.
+	 *
+	 * The BRU and IIF share the same data path route. The extra IIFSEL bit
+	 * selects between the IIF and BRU.
 	 */
 	if (source->type == VSP1_ENTITY_BRS)
 		route |= VI6_DPR_ROUTE_BRSSEL;
+	else if (source->type == VSP1_ENTITY_IIF)
+		route |= VI6_DPR_ROUTE_IIFSEL;
 	vsp1_dl_body_write(dlb, source->route->reg, route);
 }
 
@@ -528,6 +533,9 @@ struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad)
 	  { VI6_DPR_NODE_WPF(idx) }, VI6_DPR_NODE_WPF(idx) }
 
 static const struct vsp1_route vsp1_routes[] = {
+	{ VSP1_ENTITY_IIF, 0, VI6_DPR_BRU_ROUTE,
+	  { VI6_DPR_NODE_BRU_IN(0), VI6_DPR_NODE_BRU_IN(1),
+	    VI6_DPR_NODE_BRU_IN(3) }, VI6_DPR_NODE_WPF(0) },
 	{ VSP1_ENTITY_BRS, 0, VI6_DPR_ILV_BRS_ROUTE,
 	  { VI6_DPR_NODE_BRS_IN(0), VI6_DPR_NODE_BRS_IN(1) }, 0 },
 	{ VSP1_ENTITY_BRU, 0, VI6_DPR_BRU_ROUTE,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 1bcc9e27dfdc7385e91987c84c46fc3725f3b90e..bdcb780a79dafccda3843bd65d337b64d6e12eb3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -28,6 +28,7 @@ enum vsp1_entity_type {
 	VSP1_ENTITY_HGT,
 	VSP1_ENTITY_HSI,
 	VSP1_ENTITY_HST,
+	VSP1_ENTITY_IIF,
 	VSP1_ENTITY_LIF,
 	VSP1_ENTITY_LUT,
 	VSP1_ENTITY_RPF,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.c b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
new file mode 100644
index 0000000000000000000000000000000000000000..12889885b14f8d61ee5e416b4111d2eced7a0715
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vsp1_iif.c  --  R-Car VSP1 IIF (ISP Interface)
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Corporation
+ */
+
+#include "vsp1.h"
+#include "vsp1_dl.h"
+#include "vsp1_iif.h"
+
+#define IIF_MIN_WIDTH				128U
+#define IIF_MIN_HEIGHT				32U
+#define IIF_MAX_WIDTH				5120U
+#define IIF_MAX_HEIGHT				4096U
+
+/* -----------------------------------------------------------------------------
+ * Device Access
+ */
+
+static inline void vsp1_iif_write(struct vsp1_dl_body *dlb, u32 reg, u32 data)
+{
+	vsp1_dl_body_write(dlb, reg, data);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdevice Operations
+ */
+
+static const unsigned int iif_codes[] = {
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SBGGR16_1X16,
+	MEDIA_BUS_FMT_SGBRG16_1X16,
+	MEDIA_BUS_FMT_SGRBG16_1X16,
+	MEDIA_BUS_FMT_SRGGB16_1X16,
+	MEDIA_BUS_FMT_METADATA_FIXED
+};
+
+static int iif_enum_mbus_code(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, iif_codes,
+					  ARRAY_SIZE(iif_codes));
+}
+
+static int iif_enum_frame_size(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
+					   IIF_MIN_WIDTH, IIF_MIN_HEIGHT,
+					   IIF_MAX_WIDTH, IIF_MAX_HEIGHT);
+}
+
+static int iif_set_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, iif_codes,
+					  ARRAY_SIZE(iif_codes),
+					  IIF_MIN_WIDTH, IIF_MIN_HEIGHT,
+					  IIF_MAX_WIDTH, IIF_MAX_HEIGHT);
+}
+
+static const struct v4l2_subdev_pad_ops iif_pad_ops = {
+	.enum_mbus_code = iif_enum_mbus_code,
+	.enum_frame_size = iif_enum_frame_size,
+	.get_fmt = vsp1_subdev_get_pad_format,
+	.set_fmt = iif_set_format,
+};
+
+static const struct v4l2_subdev_ops iif_ops = {
+	.pad    = &iif_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * VSP1 Entity Operations
+ */
+
+static void iif_configure_stream(struct vsp1_entity *entity,
+				 struct v4l2_subdev_state *state,
+				 struct vsp1_pipeline *pipe,
+				 struct vsp1_dl_list *dl,
+				 struct vsp1_dl_body *dlb)
+{
+	vsp1_iif_write(dlb, VI6_IIF_CTRL, VI6_IIF_CTRL_CTRL);
+}
+
+static const struct vsp1_entity_operations iif_entity_ops = {
+	.configure_stream = iif_configure_stream,
+};
+
+/* -----------------------------------------------------------------------------
+ * Initialization and Cleanup
+ */
+
+struct vsp1_iif *vsp1_iif_create(struct vsp1_device *vsp1)
+{
+	struct vsp1_iif *iif;
+	int ret;
+
+	iif = devm_kzalloc(vsp1->dev, sizeof(*iif), GFP_KERNEL);
+	if (iif == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	iif->entity.ops = &iif_entity_ops;
+	iif->entity.type = VSP1_ENTITY_IIF;
+
+	/*
+	 * The IIF is never exposed to userspace, but media entity registration
+	 * requires a function to be set. Use PROC_VIDEO_PIXEL_FORMATTER just to
+	 * avoid triggering a WARN_ON(), the value won't be seen anywhere.
+	 */
+	ret = vsp1_entity_init(vsp1, &iif->entity, "iif", 3, &iif_ops,
+			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return iif;
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.h b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
new file mode 100644
index 0000000000000000000000000000000000000000..165996a822c1baab1fc40636884c9e7a67e4db07
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * vsp1_iif.h  --  R-Car VSP1 IIF (ISP Interface)
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Corporation
+ */
+#ifndef __VSP1_IIF_H__
+#define __VSP1_IIF_H__
+
+#include <media/v4l2-subdev.h>
+
+#include "vsp1_entity.h"
+
+struct vsp1_iif {
+	struct vsp1_entity entity;
+};
+
+static inline struct vsp1_iif *to_iif(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct vsp1_iif, entity.subdev);
+}
+
+struct vsp1_iif *vsp1_iif_create(struct vsp1_device *vsp1);
+
+#endif /* __VSP1_IIF_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index bb0739f684f39e23326a4d8fdb9f43e020bc23c8..8e9be3ec1b4dbdad1cbe35ae3a88952f46e41343 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -286,6 +286,7 @@ void vsp1_pipeline_reset(struct vsp1_pipeline *pipe)
 	pipe->brx = NULL;
 	pipe->hgo = NULL;
 	pipe->hgt = NULL;
+	pipe->iif = NULL;
 	pipe->lif = NULL;
 	pipe->uds = NULL;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 1ba7bdbad5a845da0a4d71888e193e46d62bed90..1655a820da102003d3d7da82a7cdd64e01c29ac6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -119,6 +119,7 @@ struct vsp1_pipeline {
 	struct vsp1_entity *brx;
 	struct vsp1_entity *hgo;
 	struct vsp1_entity *hgt;
+	struct vsp1_entity *iif;
 	struct vsp1_entity *lif;
 	struct vsp1_entity *uds;
 	struct vsp1_entity *uds_input;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 7eca82e0ba7ec5e02a5f3b9a30ccdcb48db39ed2..86e47c2d991fb4e0719b63c4ccb29340610ac24f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -252,6 +252,13 @@
 #define VI6_RPF_BRDITH_CTRL_ODE		BIT(8)
 #define VI6_RPF_BRDITH_CTRL_CBRM	BIT(0)
 
+/* -----------------------------------------------------------------------------
+ * IIF Control Registers
+ */
+
+#define VI6_IIF_CTRL			0x0608
+#define VI6_IIF_CTRL_CTRL		0x13
+
 /* -----------------------------------------------------------------------------
  * WPF Control Registers
  */
@@ -388,6 +395,7 @@
 #define VI6_DPR_HST_ROUTE		0x2044
 #define VI6_DPR_HSI_ROUTE		0x2048
 #define VI6_DPR_BRU_ROUTE		0x204c
+#define VI6_DPR_ROUTE_IIFSEL		BIT(28)
 #define VI6_DPR_ILV_BRS_ROUTE		0x2050
 #define VI6_DPR_ROUTE_BRSSEL		BIT(28)
 #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c2c7b9289f05c9c2578e9717c23ff..e10ed836153633c4fe27224d0df39c77d4c8ab89 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -163,6 +163,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	if (pipe->interlaced)
 		top /= 2;
 
+	/* No further configuration for VSPX. */
+	if (pipe->iif) {
+		/* VSPX wants alpha_sel to be set to 0. */
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
+		return;
+	}
+
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
 		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
 		       (top << VI6_RPF_LOC_VCOORD_SHIFT));

-- 
2.48.1


