Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBFBD3C72
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfJKJdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:33:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJKJdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:33:53 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1D17290D71;
        Fri, 11 Oct 2019 10:33:47 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RESEND PATCH v2 3/4] media: rockchip: Add the rkvdec driver
Date:   Fri, 11 Oct 2019 11:33:41 +0200
Message-Id: <20191011093342.3471-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011093342.3471-1-boris.brezillon@collabora.com>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rockchip vdec block is a stateless decoder that's able to decode
H264, HEVC and VP9 content. This patch only adds H264 support and is
making use of the m2m codec helpers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rockchip/Kconfig        |   16 +
 drivers/staging/media/rockchip/Makefile       |    2 +
 drivers/staging/media/rockchip/vdec/Kconfig   |   14 +
 drivers/staging/media/rockchip/vdec/Makefile  |    3 +
 .../staging/media/rockchip/vdec/rkvdec-h264.c |  960 +++++++++++++++
 .../staging/media/rockchip/vdec/rkvdec-regs.h |  306 +++++
 drivers/staging/media/rockchip/vdec/rkvdec.c  | 1089 +++++++++++++++++
 drivers/staging/media/rockchip/vdec/rkvdec.h  |  131 ++
 10 files changed, 2524 insertions(+)
 create mode 100644 drivers/staging/media/rockchip/Kconfig
 create mode 100644 drivers/staging/media/rockchip/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/Kconfig
 create mode 100644 drivers/staging/media/rockchip/vdec/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 642adc4c24d2..c6ec3dcdf9a1 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -30,6 +30,8 @@ source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/omap4iss/Kconfig"
 
+source "drivers/staging/media/rockchip/Kconfig"
+
 source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-vde/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 2f1711a8aeed..79165e1613fb 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_VIDEO_ALLEGRO_DVT)	+= allegro-dvt/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
+obj-$(CONFIG_VIDEO_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
diff --git a/drivers/staging/media/rockchip/Kconfig b/drivers/staging/media/rockchip/Kconfig
new file mode 100644
index 000000000000..8c617ae2c84f
--- /dev/null
+++ b/drivers/staging/media/rockchip/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_ROCKCHIP
+	bool "Rockchip Video Devices"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	help
+	  If you have a Rockchip SoC based embedding a video codec.
+
+	  Note that this option doesn't include new drivers in the
+	  kernel: saying N will just cause Kconfig to skip all the
+	  questions about Allwinner media devices.
+
+if VIDEO_ROCKCHIP
+
+source "drivers/staging/media/rockchip/vdec/Kconfig"
+
+endif
diff --git a/drivers/staging/media/rockchip/Makefile b/drivers/staging/media/rockchip/Makefile
new file mode 100644
index 000000000000..b3705b51f1b9
--- /dev/null
+++ b/drivers/staging/media/rockchip/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += vdec/
diff --git a/drivers/staging/media/rockchip/vdec/Kconfig b/drivers/staging/media/rockchip/vdec/Kconfig
new file mode 100644
index 000000000000..329b4a813c47
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_ROCKCHIP_VDEC
+	tristate "Rockchip Video Decoder driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on MEDIA_CONTROLLER_REQUEST_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_MEM2MEM_DEV
+	help
+	  Support for the Rockchip Video Decoder IP present on Rockchip SoC,
+	  which accelerates video decoding.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hantro-vpu.
diff --git a/drivers/staging/media/rockchip/vdec/Makefile b/drivers/staging/media/rockchip/vdec/Makefile
new file mode 100644
index 000000000000..c08fed0a39f9
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
+
+rockchip-vdec-y += rkvdec.o rkvdec-h264.o
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec-h264.c b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
new file mode 100644
index 000000000000..d241afe12edd
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Video Decoder H264 backend
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/sort.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-regs.h"
+
+/* Size with u32 units. */
+#define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
+#define RKV_RPS_SIZE			((128 + 128) / 4)
+#define RKV_SCALING_LIST_SIZE		(6 * 16 + 6 * 64 + 128)
+#define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
+
+struct rkvdec_sps_pps_packet {
+	u32 info[8];
+};
+
+/* Data structure describing auxiliary buffer format. */
+struct rkvdec_h264_priv_tbl {
+	u8 cabac_table[RKV_CABAC_INIT_BUFFER_SIZE];
+	u8 scaling_list[RKV_SCALING_LIST_SIZE];
+	u32 rps[RKV_RPS_SIZE];
+	struct rkvdec_sps_pps_packet param_set[256];
+	u8 err_info[RKV_ERROR_INFO_SIZE];
+};
+
+#define RKVDEC_H264_DPB_SIZE 16
+
+struct rkvdec_h264_reflists {
+	u8 p[RKVDEC_H264_DPB_SIZE];
+	u8 b0[RKVDEC_H264_DPB_SIZE];
+	u8 b1[RKVDEC_H264_DPB_SIZE];
+	u8 num_valid;
+};
+
+struct rkvdec_h264_run {
+	struct rkvdec_run base;
+	const struct v4l2_ctrl_h264_decode_params *decode_params;
+	const struct v4l2_ctrl_h264_slice_params *slices_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
+};
+
+struct rkvdec_h264_ctx {
+	struct rkvdec_aux_buf priv_tbl;
+	struct rkvdec_h264_reflists reflists;
+};
+
+/* Constant CABAC table. */
+static const u32 rkvdec_h264_cabac_table[] = {
+	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x21173307,
+	0x00150217, 0x31000901, 0x390576db, 0x41f54ef3, 0x310c3e01, 0x321149fc,
+	0x2b094012, 0x431a001d, 0x68095a10, 0x68ec7fd2, 0x4ef34301, 0x3e0141f5,
+	0x5fef56fa, 0x2d093dfa, 0x51fa45fd, 0x370660f5, 0x56fb4307, 0x3a005802,
+	0x5ef64cfd, 0x45043605, 0x580051fd, 0x4afb43f9, 0x50fb4afc, 0x3a0148f9,
+	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x4efc2d00,
+	0x7ee560fd, 0x65e762e4, 0x52e443e9, 0x53f05eec, 0x5beb6eea, 0x5df366ee,
+	0x5cf97fe3, 0x60f959fb, 0x2efd6cf3, 0x39ff41ff, 0x4afd5df7, 0x57f85cf7,
+	0x36057ee9, 0x3b063c06, 0x30ff4506, 0x45fc4400, 0x55fe58f8, 0x4bff4efa,
+	0x36024df9, 0x44fd3205, 0x2a063201, 0x3f0151fc, 0x430046fc, 0x4cfe3902,
+	0x4004230b, 0x230b3d01, 0x180c1912, 0x240d1d0d, 0x49f95df6, 0x2e0d49fe,
+	0x64f93109, 0x35023509, 0x3dfe3505, 0x38003800, 0x3cfb3ff3, 0x39043eff,
+	0x390445fa, 0x3304270e, 0x4003440d, 0x3f093d01, 0x27103207, 0x34042c05,
+	0x3cfb300b, 0x3b003bff, 0x2c052116, 0x4eff2b0e, 0x45093c00, 0x28021c0b,
+	0x31002c03, 0x2c022e00, 0x2f003302, 0x3e022704, 0x36002e06, 0x3a023603,
+	0x33063f04, 0x35073906, 0x37063406, 0x240e2d0b, 0x52ff3508, 0x4efd3707,
+	0x1f162e0f, 0x071954ff, 0x031cf91e, 0x0020041c, 0x061eff22, 0x0920061e,
+	0x1b1a131f, 0x14251e1a, 0x4611221c, 0x3b054301, 0x1e104309, 0x23122012,
+	0x1f181d16, 0x2b122617, 0x3f0b2914, 0x40093b09, 0x59fe5eff, 0x4cfa6cf7,
+	0x2d002cfe, 0x40fd3400, 0x46fc3bfe, 0x52f84bfc, 0x4df766ef, 0x2a001803,
+	0x37003000, 0x47f93bfa, 0x57f553f4, 0x3a0177e2, 0x24ff1dfd, 0x2b022601,
+	0x3a0037fa, 0x4afd4000, 0x46005af6, 0x1f051dfc, 0x3b012a07, 0x48fd3afe,
+	0x61f551fd, 0x05083a00, 0x120e0e0a, 0x28021b0d, 0x46fd3a00, 0x55f84ffa,
+	0x6af30000, 0x57f66af0, 0x6eee72eb, 0x6eea62f2, 0x67ee6aeb, 0x6ce96beb,
+	0x60f670e6, 0x5bfb5ff4, 0x5eea5df7, 0x430956fb, 0x55f650fc, 0x3c0746ff,
+	0x3d053a09, 0x320f320c, 0x36113112, 0x2e07290a, 0x310733ff, 0x29093408,
+	0x37022f06, 0x2c0a290d, 0x35053206, 0x3f04310d, 0x45fe4006, 0x46063bfe,
+	0x1f092c0a, 0x35032b0c, 0x260a220e, 0x280d34fd, 0x2c072011, 0x320d2607,
+	0x2b1a390a, 0x0e0b0b0e, 0x0b120b09, 0xfe170915, 0xf120f120, 0xe927eb22,
+	0xe129df2a, 0xf426e42e, 0xe82d1d15, 0xe630d335, 0xed2bd541, 0x091ef627,
+	0x1b141a12, 0x52f23900, 0x61ed4bfb, 0x001b7ddd, 0xfc1f001c, 0x0822061b,
+	0x16180a1e, 0x20161321, 0x29151f1a, 0x2f172c1a, 0x470e4110, 0x3f063c08,
+	0x18154111, 0x171a1417, 0x171c201b, 0x2817181c, 0x1d1c2018, 0x39132a17,
+	0x3d163516, 0x280c560b, 0x3b0e330b, 0x47f94ffc, 0x46f745fb, 0x44f642f8,
+	0x45f449ed, 0x43f146f0, 0x46ed3eec, 0x41ea42f0, 0xfe093fec, 0xf721f71a,
+	0xfe29f927, 0x0931032d, 0x3b241b2d, 0x23f942fa, 0x2df82af9, 0x38f430fb,
+	0x3efb3cfa, 0x4cf842f8, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64afc,
+	0x43f747f7, 0x42f83dff, 0x3b0042f2, 0xf3153b02, 0xf927f221, 0x0233fe2e,
+	0x113d063c, 0x3e2a2237, 0x00000000, 0x00000000, 0x3602f114, 0xf1144a03,
+	0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x19163307, 0x00100022, 0x290409fe,
+	0x410276e3, 0x4ff347fa, 0x32093405, 0x360a46fd, 0x1613221a, 0x02390028,
+	0x451a2429, 0x65f17fd3, 0x47fa4cfc, 0x34054ff3, 0x5af34506, 0x2b083400,
+	0x52fb45fe, 0x3b0260f6, 0x57fd4b02, 0x380164fd, 0x55fa4afd, 0x51fd3b00,
+	0x5ffb56f9, 0x4dff42ff, 0x56fe4601, 0x3d0048fb, 0x3f002900, 0x3f003f00,
+	0x560453f7, 0x48f96100, 0x3e03290d, 0x33070f0d, 0x7fd95002, 0x60ef5bee,
+	0x62dd51e6, 0x61e966e8, 0x63e877e5, 0x66ee6eeb, 0x50007fdc, 0x5ef959fb,
+	0x27005cfc, 0x54f14100, 0x49fe7fdd, 0x5bf768f4, 0x37037fe1, 0x37073807,
+	0x35fd3d08, 0x4af94400, 0x67f358f7, 0x59f75bf3, 0x4cf85cf2, 0x6ee957f4,
+	0x4ef669e8, 0x63ef70ec, 0x7fba7fb2, 0x7fd27fce, 0x4efb42fc, 0x48f847fc,
+	0x37ff3b02, 0x4bfa46f9, 0x77de59f8, 0x14204bfd, 0x7fd4161e, 0x3dfb3600,
+	0x3cff3a00, 0x43f83dfd, 0x4af254e7, 0x340541fb, 0x3d003902, 0x46f545f7,
+	0x47fc3712, 0x3d073a00, 0x19122909, 0x2b052009, 0x2c002f09, 0x2e023300,
+	0x42fc2613, 0x2a0c260f, 0x59002209, 0x1c0a2d04, 0xf5211f0a, 0x0f12d534,
+	0xea23001c, 0x0022e726, 0xf420ee27, 0x0000a266, 0xfc21f138, 0xfb250a1d,
+	0xf727e333, 0xc645de34, 0xfb2cc143, 0xe3370720, 0x00000120, 0xe721241b,
+	0xe424e222, 0xe526e426, 0xf023ee22, 0xf820f222, 0x0023fa25, 0x121c0a1e,
+	0x291d191a, 0x48024b00, 0x230e4d08, 0x23111f12, 0x2d111e15, 0x2d122a14,
+	0x36101a1b, 0x38104207, 0x430a490b, 0x70e974f6, 0x3df947f1, 0x42fb3500,
+	0x50f74df5, 0x57f654f7, 0x65eb7fde, 0x35fb27fd, 0x4bf53df9, 0x5bef4df1,
+	0x6fe76be7, 0x4cf57ae4, 0x34f62cf6, 0x3af739f6, 0x45f948f0, 0x4afb45fc,
+	0x420256f7, 0x200122f7, 0x34051f0b, 0x43fe37fe, 0x59f84900, 0x04073403,
+	0x0811080a, 0x25031310, 0x49fb3dff, 0x4efc46ff, 0x7eeb0000, 0x6eec7ce9,
+	0x7ce77ee6, 0x79e569ef, 0x66ef75e5, 0x74e575e6, 0x5ff67adf, 0x5ff864f2,
+	0x72e46fef, 0x50fe59fa, 0x55f752fc, 0x48ff51f8, 0x43014005, 0x45003809,
+	0x45074501, 0x43fa45f9, 0x40fe4df0, 0x43fa3d02, 0x390240fd, 0x42fd41fd,
+	0x33093e00, 0x47fe42ff, 0x46ff4bfe, 0x3c0e48f7, 0x2f002510, 0x250b2312,
+	0x290a290c, 0x290c3002, 0x3b00290d, 0x28133203, 0x32124203, 0xfa12fa13,
+	0xf41a000e, 0xe721f01f, 0xe425ea21, 0xe22ae227, 0xdc2dd62f, 0xef29de31,
+	0xb9450920, 0xc042c13f, 0xd936b64d, 0xf629dd34, 0xff280024, 0x1a1c0e1e,
+	0x370c2517, 0xdf25410b, 0xdb28dc27, 0xdf2ee226, 0xe828e22a, 0xf426e331,
+	0xfd26f628, 0x141ffb2e, 0x2c191e1d, 0x310b300c, 0x16162d1a, 0x151b1617,
+	0x1c1a1421, 0x221b181e, 0x27192a12, 0x460c3212, 0x470e3615, 0x2019530b,
+	0x36153115, 0x51fa55fb, 0x51f94df6, 0x49ee50ef, 0x53f64afc, 0x43f747f7,
+	0x42f83dff, 0x3b0042f2, 0xf6113b02, 0xf72af320, 0x0035fb31, 0x0a440340,
+	0x392f1b42, 0x180047fb, 0x2afe24ff, 0x39f734fe, 0x41fc3ffa, 0x52f943fc,
+	0x4cfd51fd, 0x4efa48f9, 0x44f248f4, 0x4cfa46fd, 0x3efb42fb, 0x3dfc3900,
+	0x36013cf7, 0xf6113a02, 0xf72af320, 0x0035fb31, 0x0a440340, 0x392f1b42,
+	0x00000000, 0x00000000, 0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4,
+	0x36ff35fa, 0x101d3307, 0x000e0019, 0x3efd33f6, 0x101a63e5, 0x66e855fc,
+	0x39063905, 0x390e49ef, 0x0a142814, 0x0036001d, 0x610c2a25, 0x75ea7fe0,
+	0x55fc4afe, 0x390566e8, 0x58f25dfa, 0x37042cfa, 0x67f159f5, 0x391374eb,
+	0x54043a14, 0x3f016006, 0x6af355fb, 0x4b063f05, 0x65ff5afd, 0x4ffc3703,
+	0x61f44bfe, 0x3c0132f9, 0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100,
+	0x3e03290d, 0x58f72207, 0x7fdc7fec, 0x5ff25bef, 0x56e754e7, 0x5bef59f4,
+	0x4cf27fe1, 0x5af367ee, 0x500b7fdb, 0x54024c05, 0x37fa4e05, 0x53f23d04,
+	0x4ffb7fdb, 0x5bf568f5, 0x41007fe2, 0x48004ffe, 0x38fa5cfc, 0x47f84403,
+	0x56fc62f3, 0x52fb58f4, 0x43fc48fd, 0x59f048f8, 0x3bff45f7, 0x39044205,
+	0x47fe47fc, 0x4aff3a02, 0x45ff2cfc, 0x33f93e00, 0x2afa2ffc, 0x35fa29fd,
+	0x4ef74c08, 0x340953f5, 0x5afb4300, 0x48f14301, 0x50f84bfb, 0x40eb53eb,
+	0x40e71ff3, 0x4b095ee3, 0x4af83f11, 0x1bfe23fb, 0x41035b0d, 0x4d0845f9,
+	0x3e0342f6, 0x51ec44fd, 0x07011e00, 0x4aeb17fd, 0x7ce94210, 0xee2c2511,
+	0x7feade32, 0x2a002704, 0x1d0b2207, 0x25061f08, 0x28032a07, 0x2b0d2108,
+	0x2f04240d, 0x3a023703, 0x2c083c06, 0x2a0e2c0b, 0x38043007, 0x250d3404,
+	0x3a133109, 0x2d0c300a, 0x21144500, 0xee233f08, 0xfd1ce721, 0x001b0a18,
+	0xd434f222, 0x1113e827, 0x1d24191f, 0x0f222118, 0x4916141e, 0x1f132214,
+	0x10132c1b, 0x240f240f, 0x15191c15, 0x0c1f141e, 0x2a18101b, 0x380e5d00,
+	0x261a390f, 0x73e87fe8, 0x3ef752ea, 0x3b003500, 0x59f355f2, 0x5cf55ef3,
+	0x64eb7fe3, 0x43f439f2, 0x4df647f5, 0x58f055eb, 0x62f168e9, 0x52f67fdb,
+	0x3df830f8, 0x46f942f8, 0x4ff64bf2, 0x5cf453f7, 0x4ffc6cee, 0x4bf045ea,
+	0x3a013afe, 0x53f74ef3, 0x63f351fc, 0x26fa51f3, 0x3afa3ef3, 0x49f03bfe,
+	0x56f34cf6, 0x57f653f7, 0x7fea0000, 0x78e77fe7, 0x72ed7fe5, 0x76e775e9,
+	0x71e875e6, 0x78e176e4, 0x5ef67cdb, 0x63f666f1, 0x7fce6af3, 0x39115cfb,
+	0x5ef356fb, 0x4dfe5bf4, 0x49ff4700, 0x51f94004, 0x390f4005, 0x44004301,
+	0x440143f6, 0x40024d00, 0x4efb4400, 0x3b053707, 0x360e4102, 0x3c052c0f,
+	0x4cfe4602, 0x460c56ee, 0x46f44005, 0x3805370b, 0x41024500, 0x36054afa,
+	0x4cfa3607, 0x4dfe52f5, 0x2a194dfe, 0xf710f311, 0xeb1bf411, 0xd829e225,
+	0xd130d72a, 0xd82ee027, 0xd72ecd34, 0xed2bd934, 0xc93d0b20, 0xce3ed238,
+	0xec2dbd51, 0x0f1cfe23, 0x01270122, 0x2614111e, 0x360f2d12, 0xf0244f00,
+	0xef25f225, 0x0f220120, 0x19180f1d, 0x101f1622, 0x1c1f1223, 0x1c242921,
+	0x3e152f1b, 0x1a131f12, 0x17181824, 0x1e18101b, 0x29161d1f, 0x3c102a16,
+	0x3c0e340f, 0x7bf04e03, 0x38163515, 0x21153d19, 0x3d113213, 0x4af84efd,
+	0x48f648f7, 0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf2,
+	0xfe0944f5, 0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x25f947f7,
+	0x31f52cf8, 0x3bf438f6, 0x43f73ff8, 0x4ff644fa, 0x4af84efd, 0x48f648f7,
+	0x47f44bee, 0x46fb3ff5, 0x48f24bef, 0x35f843f0, 0x34f73bf2, 0xfe0944f5,
+	0xfc1ff61e, 0x0721ff21, 0x17250c1f, 0x4014261f, 0x00000000, 0x00000000,
+	0x3602f114, 0xf1144a03, 0x4a033602, 0x68e97fe4, 0x36ff35fa, 0x00003307,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x3f002900, 0x3f003f00, 0x560453f7, 0x48f96100, 0x3e03290d, 0x37010b00,
+	0x7fef4500, 0x520066f3, 0x6beb4af9, 0x7fe17fe5, 0x5fee7fe8, 0x72eb7fe5,
+	0x7bef7fe2, 0x7af073f4, 0x3ff473f5, 0x54f144fe, 0x46fd68f3, 0x5af65df8,
+	0x4aff7fe2, 0x5bf961fa, 0x38fc7fec, 0x4cf952fb, 0x5df97dea, 0x4dfd57f5,
+	0x3ffc47fb, 0x54f444fc, 0x41f93ef9, 0x38053d08, 0x400142fe, 0x4efe3d00,
+	0x34073201, 0x2c00230a, 0x2d01260b, 0x2c052e00, 0x3301111f, 0x131c3207,
+	0x3e0e2110, 0x64f16cf3, 0x5bf365f3, 0x58f65ef4, 0x56f654f0, 0x57f353f9,
+	0x46015eed, 0x4afb4800, 0x66f83b12, 0x5f0064f1, 0x48024bfc, 0x47fd4bf5,
+	0x45f32e0f, 0x41003e00, 0x48f12515, 0x36103909, 0x480c3e00, 0x090f0018,
+	0x120d1908, 0x130d090f, 0x120c250a, 0x21141d06, 0x2d041e0f, 0x3e003a01,
+	0x260c3d07, 0x270f2d0b, 0x2c0d2a0b, 0x290c2d10, 0x221e310a, 0x370a2a12,
+	0x2e113311, 0xed1a5900, 0xef1aef16, 0xec1ce71e, 0xe525e921, 0xe428e921,
+	0xf521ef26, 0xfa29f128, 0x11290126, 0x031bfa1e, 0xf025161a, 0xf826fc23,
+	0x0325fd26, 0x002a0526, 0x16271023, 0x251b300e, 0x440c3c15, 0x47fd6102,
+	0x32fb2afa, 0x3efe36fd, 0x3f013a00, 0x4aff48fe, 0x43fb5bf7, 0x27fd1bfb,
+	0x2e002cfe, 0x44f840f0, 0x4dfa4ef6, 0x5cf456f6, 0x3cf637f1, 0x41fc3efa,
+	0x4cf849f4, 0x58f750f9, 0x61f56eef, 0x4ff554ec, 0x4afc49fa, 0x60f356f3,
+	0x75ed61f5, 0x21fb4ef8, 0x35fe30fc, 0x47f33efd, 0x56f44ff6, 0x61f25af3,
+	0x5dfa0000, 0x4ff854fa, 0x47ff4200, 0x3cfe3e00, 0x4bfb3bfe, 0x3afc3efd,
+	0x4fff42f7, 0x44034700, 0x3ef92c0a, 0x280e240f, 0x1d0c1b10, 0x24142c01,
+	0x2a052012, 0x3e0a3001, 0x40092e11, 0x61f568f4, 0x58f960f0, 0x55f955f8,
+	0x58f355f7, 0x4dfd4204, 0x4cfa4cfd, 0x4cff3a0a, 0x63f953ff, 0x5f025ff2,
+	0x4afb4c00, 0x4bf54600, 0x41004401, 0x3e0349f2, 0x44ff3e04, 0x370b4bf3,
+	0x460c4005, 0x1306060f, 0x0e0c1007, 0x0b0d0d12, 0x100f0f0d, 0x170d170c,
+	0x1a0e140f, 0x28112c0e, 0x11182f11, 0x16191515, 0x1d161b1f, 0x320e2313,
+	0x3f07390a, 0x52fc4dfe, 0x45095efd, 0xdd246df4, 0xe620de24, 0xe02ce225,
+	0xf122ee22, 0xf921f128, 0x0021fb23, 0x0d210226, 0x3a0d2317, 0x001afd1d,
+	0xf91f1e16, 0xfd22f123, 0xff240322, 0x0b200522, 0x0c220523, 0x1d1e0b27,
+	0x271d1a22, 0x151f4213, 0x32191f1f, 0x70ec78ef, 0x55f572ee, 0x59f25cf1,
+	0x51f147e6, 0x440050f2, 0x38e846f2, 0x32e844e9, 0xf3174af5, 0xf128f31a,
+	0x032cf231, 0x222c062d, 0x52133621, 0x17ff4bfd, 0x2b012201, 0x37fe3600,
+	0x40013d00, 0x5cf74400, 0x61f36af2, 0x5af45af1, 0x49f658ee, 0x56f24ff7,
+	0x46f649f6, 0x42fb45f6, 0x3afb40f7, 0xf6153b02, 0xf81cf518, 0x031dff1c,
+	0x1423091d, 0x430e241d
+};
+
+struct rkvdec_h264_reflist_builder {
+	const struct v4l2_h264_dpb_entry *dpb;
+	s32 pocs[RKVDEC_H264_DPB_SIZE];
+	u8 unordered_reflist[RKVDEC_H264_DPB_SIZE];
+	int frame_nums[RKVDEC_H264_DPB_SIZE];
+	s32 curpoc;
+	u8 num_valid;
+};
+
+static s32 get_poc(enum v4l2_field field, s32 top_field_order_cnt,
+		   s32 bottom_field_order_cnt)
+{
+	switch (field) {
+	case V4L2_FIELD_TOP:
+		return top_field_order_cnt;
+
+	case V4L2_FIELD_BOTTOM:
+		return bottom_field_order_cnt;
+
+	default:
+		break;
+	}
+
+	return min(top_field_order_cnt, bottom_field_order_cnt);
+}
+
+static void
+init_reflist_builder(struct rkvdec_ctx *ctx,
+		     struct rkvdec_h264_reflist_builder *b,
+		     struct rkvdec_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_slice_params *slice_params;
+	const struct v4l2_ctrl_h264_decode_params *dec_params;
+	struct vb2_v4l2_buffer *buf = run->base.bufs.dst;
+	const struct v4l2_h264_dpb_entry *dpb;
+	const struct v4l2_ctrl_h264_sps *sps;
+	int cur_frame_num, max_frame_num;
+	struct v4l2_m2m_ctx *m2m_ctx;
+	struct vb2_queue *cap_q;
+	unsigned int i;
+
+	m2m_ctx = ctx->fh.m2m_ctx;
+	cap_q = &m2m_ctx->cap_q_ctx.q;
+	dec_params = run->decode_params;
+	slice_params = &run->slices_params[0];
+	sps = run->sps;
+	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
+	cur_frame_num = slice_params->frame_num;
+	dpb = dec_params->dpb;
+
+	memset(b, 0, sizeof(*b));
+	b->dpb = dpb;
+	b->curpoc = get_poc(buf->field, dec_params->top_field_order_cnt,
+			    dec_params->bottom_field_order_cnt);
+
+	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		int buf_idx;
+
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		buf_idx = vb2_find_timestamp(cap_q, dpb[i].reference_ts, 0);
+		if (buf_idx < 0)
+			continue;
+
+		/*
+		 * Handle frame_num wraparound as described in section
+		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
+		 * TODO: This logic will have to be adjusted when we start
+		 * supporting interlaced content.
+		 */
+		if (dpb[i].frame_num > cur_frame_num)
+			b->frame_nums[i] = (int)dpb[i].frame_num - max_frame_num;
+		else
+			b->frame_nums[i] = dpb[i].frame_num;
+
+		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
+		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
+				     dpb[i].bottom_field_order_cnt);
+		b->unordered_reflist[b->num_valid] = i;
+		b->num_valid++;
+	}
+
+	for (i = b->num_valid; i < ARRAY_SIZE(dec_params->dpb); i++)
+		b->unordered_reflist[i] = i;
+}
+
+static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct rkvdec_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/*
+	 * Short term pics in descending pic num order, long term ones in
+	 * ascending order.
+	 */
+	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		int frame_num_a, frame_num_b;
+
+		frame_num_a = builder->frame_nums[idxa];
+		frame_num_b = builder->frame_nums[idxb];
+		return frame_num_b > frame_num_a ? 1 : -1;
+	}
+
+	return a->pic_num > b->pic_num ? 1 : -1;
+}
+
+static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct rkvdec_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return a->pic_num > b->pic_num ? 1 : -1;
+
+	poca = builder->pocs[idxa];
+	pocb = builder->pocs[idxb];
+
+	/*
+	 * Short term pics with POC < cur POC first in POC descending order
+	 * followed by short term pics with POC > cur POC in POC ascending
+	 * order.
+	 */
+	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
+		return poca > pocb ? 1 : -1;
+	else if (poca < builder->curpoc)
+		return pocb > poca ? 1 : -1;
+
+	return poca > pocb ? 1 : -1;
+}
+
+static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct rkvdec_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return a->pic_num > b->pic_num ? 1 : -1;
+
+	poca = builder->pocs[idxa];
+	pocb = builder->pocs[idxb];
+
+	/*
+	 * Short term pics with POC > cur POC first in POC ascending order
+	 * followed by short term pics with POC < cur POC in POC descending
+	 * order.
+	 */
+	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
+		return pocb > poca ? 1 : -1;
+	else if (poca < builder->curpoc)
+		return pocb > poca ? 1 : -1;
+
+	return poca > pocb ? 1 : -1;
+}
+
+static void
+build_p_ref_list(const struct rkvdec_h264_reflist_builder *builder,
+		 u8 *reflist)
+{
+	memcpy(reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(reflist, builder->num_valid, sizeof(*reflist),
+	       p_ref_list_cmp, NULL, builder);
+}
+
+static void
+build_b_ref_lists(const struct rkvdec_h264_reflist_builder *builder,
+		  u8 *b0_reflist, u8 *b1_reflist)
+{
+	memcpy(b0_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(b0_reflist, builder->num_valid, sizeof(*b0_reflist),
+	       b0_ref_list_cmp, NULL, builder);
+
+	memcpy(b1_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(b1_reflist, builder->num_valid, sizeof(*b1_reflist),
+	       b1_ref_list_cmp, NULL, builder);
+}
+
+static void assemble_hw_pps(struct rkvdec_ctx *ctx,
+			    struct rkvdec_h264_run *run)
+{
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+	const struct v4l2_ctrl_h264_sps *sps = run->sps;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+	const struct v4l2_h264_dpb_entry *dpb =	run->decode_params->dpb;
+	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
+	struct rkvdec_sps_pps_packet *hw_ps;
+	dma_addr_t scaling_list_address;
+	u32 scaling_distance;
+	u32 i;
+
+	/*
+	 * HW read the SPS/PPS informantion from PPS packet index by PPS id.
+	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
+	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
+	 * packet unit for HW accessing.
+	 */
+	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
+	memset(hw_ps, 0, sizeof(*hw_ps));
+
+#define WRITE_PPS(value, field) RKVDEC_SET_FIELD(hw_ps->info, field, value)
+	/* write sps */
+	WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(0xff, PROFILE_IDC);
+	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
+	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
+	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
+	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
+	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
+	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
+	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
+	WRITE_PPS(sps->pic_order_cnt_type, PIC_ORDER_CNT_TYPE);
+	WRITE_PPS(sps->log2_max_pic_order_cnt_lsb_minus4,
+		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
+		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
+	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
+	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
+		  FRAME_MBS_ONLY_FLAG);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
+		  MB_ADAPTIVE_FRAME_FIELD_FLAG);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE),
+		  DIRECT_8X8_INFERENCE_FLAG);
+
+	/* write pps */
+	WRITE_PPS(0xff, PIC_PARAMETER_SET_ID);
+	WRITE_PPS(0x1f, PPS_SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE),
+		  ENTROPY_CODING_MODE_FLAG);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT),
+		  BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG);
+	WRITE_PPS(pps->num_ref_idx_l0_default_active_minus1,
+		  NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1);
+	WRITE_PPS(pps->num_ref_idx_l1_default_active_minus1,
+		  NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED),
+		  WEIGHTED_PRED_FLAG);
+	WRITE_PPS(pps->weighted_bipred_idc, WEIGHTED_BIPRED_IDC);
+	WRITE_PPS(pps->pic_init_qp_minus26, PIC_INIT_QP_MINUS26);
+	WRITE_PPS(pps->pic_init_qs_minus26, PIC_INIT_QS_MINUS26);
+	WRITE_PPS(pps->chroma_qp_index_offset, CHROMA_QP_INDEX_OFFSET);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT),
+		  DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED),
+		  CONSTRAINED_INTRA_PRED_FLAG);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT),
+		  REDUNDANT_PIC_CNT_PRESENT);
+	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE),
+		  TRANSFORM_8X8_MODE_FLAG);
+	WRITE_PPS(pps->second_chroma_qp_index_offset,
+		  SECOND_CHROMA_QP_INDEX_OFFSET);
+
+	/* always use the matrix sent from userspace */
+	WRITE_PPS(1, SCALING_LIST_ENABLE_FLAG);
+
+	scaling_distance = offsetof(struct rkvdec_h264_priv_tbl, scaling_list);
+	scaling_list_address = h264_ctx->priv_tbl.dma + scaling_distance;
+	WRITE_PPS(scaling_list_address, SCALING_LIST_ADDRESS);
+
+	for (i = 0; i < 16; i++) {
+		u32 is_longterm = 0;
+
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+			is_longterm = 1;
+
+		rkvdec_set_field(hw_ps->info, IS_LONG_TERM_OFF(i),
+				 IS_LONG_TERM_LEN, is_longterm);
+	}
+}
+
+static void assemble_hw_rps(struct rkvdec_ctx *ctx,
+			    struct rkvdec_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
+	const struct v4l2_ctrl_h264_slice_params *sl_params = &run->slices_params[0];
+	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+	const struct v4l2_ctrl_h264_sps *sps = run->sps;
+	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
+	u32 max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
+
+	u32 *hw_rps = priv_tbl->rps;
+	u32 i, j;
+	u16 *p = (u16 *)hw_rps;
+
+	memset(hw_rps, 0, sizeof(priv_tbl->rps));
+
+	/*
+	 * Assign an invalid pic_num if DPB entry at that position is inactive.
+	 * If we assign 0 in that position hardware will treat that as a real
+	 * reference picture with pic_num 0, triggering output picture
+	 * corruption.
+	 */
+	for (i = 0; i < 16; i++) {
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
+		    dpb[i].frame_num < sl_params->frame_num) {
+			p[i] = dpb[i].frame_num;
+			continue;
+		}
+
+		p[i] = dpb[i].frame_num - max_frame_num;
+	}
+
+	for (j = 0; j < 3; j++) {
+		for (i = 0; i < h264_ctx->reflists.num_valid; i++) {
+			u8 dpb_valid = 0;
+			u8 idx = 0;
+
+			switch (j) {
+			case 0:
+				idx = h264_ctx->reflists.p[i];
+				break;
+			case 1:
+				idx = h264_ctx->reflists.b0[i];
+				break;
+			case 2:
+				idx = h264_ctx->reflists.b1[i];
+				break;
+			}
+
+			if (idx >= ARRAY_SIZE(dec_params->dpb))
+				continue;
+			dpb_valid = !!(dpb[idx].flags &
+				       V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
+
+			rkvdec_set_field(hw_rps, DPB_INFO_OFF(i, j),
+					 DPB_INFO_LEN, idx | dpb_valid << 4);
+		}
+	}
+}
+
+/*
+ * NOTE: The values in a scaling list are in zig-zag order, apply inverse
+ * scanning process to get the values in matrix order.
+ */
+static const u32 zig_zag_4x4[16] = {
+	0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15
+};
+
+static const u32 zig_zag_8x8[64] = {
+	0,  1,  8, 16,  9,  2,  3, 10, 17, 24, 32, 25, 18, 11,  4,  5,
+	12, 19, 26, 33, 40, 48, 41, 34, 27, 20, 13,  6,  7, 14, 21, 28,
+	35, 42, 49, 56, 57, 50, 43, 36, 29, 22, 15, 23, 30, 37, 44, 51,
+	58, 59, 52, 45, 38, 31, 39, 46, 53, 60, 61, 54, 47, 55, 62, 63
+};
+
+static void reorder_scaling_list(struct rkvdec_ctx *ctx,
+				 struct rkvdec_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
+	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
+	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
+	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
+	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
+	u8 *dst = tbl->scaling_list;
+	const u8 *src;
+	int i, j;
+
+	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
+	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
+	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) <
+		     num_list_4x4 * list_len_4x4 +
+		     num_list_8x8 * list_len_8x8);
+
+	src = &scaling->scaling_list_4x4[0][0];
+	for (i = 0; i < num_list_4x4; ++i) {
+		for (j = 0; j < list_len_4x4; ++j)
+			dst[zig_zag_4x4[j]] = src[j];
+		src += list_len_4x4;
+		dst += list_len_4x4;
+	}
+
+	src = &scaling->scaling_list_8x8[0][0];
+	for (i = 0; i < num_list_8x8; ++i) {
+		for (j = 0; j < list_len_8x8; ++j)
+			dst[zig_zag_8x8[j]] = src[j];
+		src += list_len_8x8;
+		dst += list_len_8x8;
+	}
+}
+
+/*
+ * dpb poc related registers table
+ */
+static u32 poc_reg_tbl_top_field[16] = {
+	RKVDEC_REG_H264_POC_REFER0(0),
+	RKVDEC_REG_H264_POC_REFER0(2),
+	RKVDEC_REG_H264_POC_REFER0(4),
+	RKVDEC_REG_H264_POC_REFER0(6),
+	RKVDEC_REG_H264_POC_REFER0(8),
+	RKVDEC_REG_H264_POC_REFER0(10),
+	RKVDEC_REG_H264_POC_REFER0(12),
+	RKVDEC_REG_H264_POC_REFER0(14),
+	RKVDEC_REG_H264_POC_REFER1(1),
+	RKVDEC_REG_H264_POC_REFER1(3),
+	RKVDEC_REG_H264_POC_REFER1(5),
+	RKVDEC_REG_H264_POC_REFER1(7),
+	RKVDEC_REG_H264_POC_REFER1(9),
+	RKVDEC_REG_H264_POC_REFER1(11),
+	RKVDEC_REG_H264_POC_REFER1(13),
+	RKVDEC_REG_H264_POC_REFER2(0)
+};
+
+static u32 poc_reg_tbl_bottom_field[16] = {
+	RKVDEC_REG_H264_POC_REFER0(1),
+	RKVDEC_REG_H264_POC_REFER0(3),
+	RKVDEC_REG_H264_POC_REFER0(5),
+	RKVDEC_REG_H264_POC_REFER0(7),
+	RKVDEC_REG_H264_POC_REFER0(9),
+	RKVDEC_REG_H264_POC_REFER0(11),
+	RKVDEC_REG_H264_POC_REFER0(13),
+	RKVDEC_REG_H264_POC_REFER1(0),
+	RKVDEC_REG_H264_POC_REFER1(2),
+	RKVDEC_REG_H264_POC_REFER1(4),
+	RKVDEC_REG_H264_POC_REFER1(6),
+	RKVDEC_REG_H264_POC_REFER1(8),
+	RKVDEC_REG_H264_POC_REFER1(10),
+	RKVDEC_REG_H264_POC_REFER1(12),
+	RKVDEC_REG_H264_POC_REFER1(14),
+	RKVDEC_REG_H264_POC_REFER2(1)
+};
+
+struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+			       struct rkvdec_h264_run *run,
+			       unsigned int dpb_idx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
+	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+	int buf_idx = -1;
+
+	if (dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+		buf_idx = vb2_find_timestamp(cap_q,
+					     dpb[dpb_idx].reference_ts, 0);
+
+	/*
+	 * If a DPB entry is unused or invalid, address of current destination
+	 * buffer is returned.
+	 */
+	if (buf_idx < 0)
+		return &run->base.bufs.dst->vb2_buf;
+
+	return vb2_get_buffer(cap_q, buf_idx);
+}
+
+static void config_registers(struct rkvdec_ctx *ctx,
+			     struct rkvdec_h264_run *run)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
+	const struct v4l2_ctrl_h264_sps *sps = run->sps;
+	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+	dma_addr_t priv_start_addr = h264_ctx->priv_tbl.dma;
+	const struct v4l2_pix_format_mplane *dst_fmt;
+	struct vb2_v4l2_buffer *src_buf = run->base.bufs.src;
+	struct vb2_v4l2_buffer *dst_buf = run->base.bufs.dst;
+	const struct v4l2_format *f;
+	dma_addr_t rlc_addr;
+	dma_addr_t refer_addr;
+	u32 rlc_len;
+	u32 hor_virstride = 0;
+	u32 ver_virstride = 0;
+	u32 y_virstride = 0;
+	u32 yuv_virstride = 0;
+	u32 offset;
+	dma_addr_t dst_addr;
+	u32 reg, i;
+
+	reg = RKVDEC_MODE(RKVDEC_MODE_H264);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_SYSCTRL);
+
+	f = &ctx->decoded_fmt;
+	dst_fmt = &f->fmt.pix_mp;
+	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
+	ver_virstride = round_up(dst_fmt->height, 16);
+	y_virstride = hor_virstride * ver_virstride;
+
+	if (sps->chroma_format_idc == 0)
+		yuv_virstride = y_virstride;
+	else if (sps->chroma_format_idc == 1)
+		yuv_virstride += y_virstride + y_virstride / 2;
+	else if (sps->chroma_format_idc == 2)
+		yuv_virstride += 2 * y_virstride;
+
+	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
+	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
+	      RKVDEC_SLICE_NUM_HIGHBIT |
+	      RKVDEC_SLICE_NUM_LOWBITS(0x7ff);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_PICPAR);
+
+	/* config rlc base address */
+	rlc_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_STRM_RLC_BASE);
+	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_RLCWRITE_BASE);
+
+	rlc_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	reg = RKVDEC_STRM_LEN(rlc_len);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_STRM_LEN);
+
+	/* config cabac table */
+	offset = offsetof(struct rkvdec_h264_priv_tbl, cabac_table);
+	writel_relaxed(priv_start_addr + offset,
+		       rkvdec->regs + RKVDEC_REG_CABACTBL_PROB_BASE);
+
+	/* config output base address */
+	dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	writel_relaxed(dst_addr, rkvdec->regs + RKVDEC_REG_DECOUT_BASE);
+
+	reg = RKVDEC_Y_VIRSTRIDE(y_virstride / 16);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_Y_VIRSTRIDE);
+
+	reg = RKVDEC_YUV_VIRSTRIDE(yuv_virstride / 16);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_YUV_VIRSTRIDE);
+
+	/* config ref pic address & poc */
+	for (i = 0; i < 16; i++) {
+		struct vb2_buffer *vb_buf = get_ref_buf(ctx, run, i);
+
+		refer_addr = vb2_dma_contig_plane_dma_addr(vb_buf, 0) |
+			     RKVDEC_COLMV_USED_FLAG_REF |
+			     RKVDEC_TOPFIELD_USED_REF |
+			     RKVDEC_BOTFIELD_USED_REF;
+		writel_relaxed(dpb[i].top_field_order_cnt,
+			       rkvdec->regs +  poc_reg_tbl_top_field[i]);
+		writel_relaxed(dpb[i].bottom_field_order_cnt,
+			       rkvdec->regs + poc_reg_tbl_bottom_field[i]);
+
+		if (i < 15)
+			writel_relaxed(refer_addr,
+				       rkvdec->regs + RKVDEC_REG_H264_BASE_REFER(i));
+		else
+			writel_relaxed(refer_addr,
+				       rkvdec->regs + RKVDEC_REG_H264_BASE_REFER15);
+	}
+
+	/*
+	 * Since support frame mode only
+	 * top_field_order_cnt is the same as bottom_field_order_cnt
+	 */
+	reg = RKVDEC_CUR_POC(dec_params->top_field_order_cnt);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC0);
+
+	reg = RKVDEC_CUR_POC(dec_params->bottom_field_order_cnt);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC1);
+
+	/* config hw pps address */
+	offset = offsetof(struct rkvdec_h264_priv_tbl, param_set);
+	writel_relaxed(priv_start_addr + offset,
+		       rkvdec->regs + RKVDEC_REG_PPS_BASE);
+
+	/* config hw rps address */
+	offset = offsetof(struct rkvdec_h264_priv_tbl, rps);
+	writel_relaxed(priv_start_addr + offset,
+		       rkvdec->regs + RKVDEC_REG_RPS_BASE);
+
+	reg = RKVDEC_AXI_DDR_RDATA(0);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_RDATA);
+
+	reg = RKVDEC_AXI_DDR_WDATA(0);
+	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_WDATA);
+
+	offset = offsetof(struct rkvdec_h264_priv_tbl, err_info);
+	writel_relaxed(priv_start_addr + offset,
+		       rkvdec->regs + RKVDEC_REG_H264_ERRINFO_BASE);
+}
+
+#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
+
+static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
+				  struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+	fmt->num_planes = 1;
+	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
+	return 0;
+}
+
+static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_h264_priv_tbl *priv_tbl;
+	struct rkvdec_h264_ctx *h264_ctx;
+	int ret;
+
+	h264_ctx = kzalloc(sizeof(*h264_ctx), GFP_KERNEL);
+	if (!h264_ctx)
+		return -ENOMEM;
+
+	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
+				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	if (!priv_tbl) {
+		ret = -ENOMEM;
+		goto err_free_ctx;
+	}
+
+	h264_ctx->priv_tbl.size = sizeof(*priv_tbl);
+	h264_ctx->priv_tbl.cpu = priv_tbl;
+	memcpy(priv_tbl->cabac_table, rkvdec_h264_cabac_table,
+	       sizeof(rkvdec_h264_cabac_table));
+
+	ctx->priv = h264_ctx;
+	return 0;
+
+err_free_ctx:
+	kfree(ctx);
+	return ret;
+}
+
+static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+
+	kfree(h264_ctx);
+}
+
+static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
+				     struct rkvdec_h264_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
+	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	rkvdec_run_preamble(ctx, &run->base);
+}
+
+static void rkvdec_h264_run(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_h264_reflist_builder reflist_builder;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
+	struct rkvdec_h264_run run;
+
+	rkvdec_h264_run_preamble(ctx, &run);
+
+	/* Build the P/B{0,1} ref lists. */
+	init_reflist_builder(ctx, &reflist_builder, &run);
+	h264_ctx->reflists.num_valid = reflist_builder.num_valid;
+	build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
+	build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
+			  h264_ctx->reflists.b1);
+
+	reorder_scaling_list(ctx, &run);
+	assemble_hw_pps(ctx, &run);
+	assemble_hw_rps(ctx, &run);
+	config_registers(ctx, &run);
+
+	rkvdec_run_postamble(ctx, &run.base);
+
+	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
+
+	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+	writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
+	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
+	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
+
+	/* Start decoding! */
+	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
+	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
+	       rkvdec->regs + RKVDEC_REG_INTERRUPT);
+}
+
+const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
+	.adjust_fmt = rkvdec_h264_adjust_fmt,
+	.start = rkvdec_h264_start,
+	.stop = rkvdec_h264_stop,
+	.run = rkvdec_h264_run,
+};
+
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec-regs.h b/drivers/staging/media/rockchip/vdec/rkvdec-regs.h
new file mode 100644
index 000000000000..30fb71b9300a
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/rkvdec-regs.h
@@ -0,0 +1,306 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip VPU codec driver
+ *
+ * Copyright (C) 2015 Rockchip Electronics Co., Ltd.
+ *	Jung Zhao <jung.zhao@rock-chips.com>
+ *	Alpha Lin <alpha.lin@rock-chips.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef RKVDEC_REGS_H_
+#define RKVDEC_REGS_H_
+
+/* rkvcodec registers */
+#define RKVDEC_REG_INTERRUPT			0x004
+#define     RKVDEC_INTERRUPT_DEC_E			BIT(0)
+#define     RKVDEC_CONFIG_DEC_CLK_GATE_E		BIT(1)
+#define     RKVDEC_E_STRMD_CLKGATE_DIS			BIT(2)
+#define     RKVDEC_TIMEOUT_MODE				BIT(3)
+#define     RKVDEC_IRQ_DIS				BIT(4)
+#define     RKVDEC_TIMEOUT_E				BIT(5)
+#define     RKVDEC_BUF_EMPTY_E				BIT(6)
+#define     RKVDEC_STRM_E_WAITDECFIFO_EMPTY		BIT(7)
+#define     RKVDEC_IRQ					BIT(8)
+#define     RKVDEC_IRQ_RAW				BIT(9)
+#define     RKVDEC_E_REWRITE_VALID			BIT(10)
+#define     RKVDEC_COMMONIRQ_MODE			BIT(11)
+#define     RKVDEC_RDY_STA				BIT(12)
+#define     RKVDEC_BUS_STA				BIT(13)
+#define     RKVDEC_ERR_STA				BIT(14)
+#define     RKVDEC_TIMEOUT_STA				BIT(15)
+#define     RKVDEC_BUF_EMPTY_STA			BIT(16)
+#define     RKVDEC_COLMV_REF_ERR_STA			BIT(17)
+#define     RKVDEC_CABU_END_STA				BIT(18)
+#define     RKVDEC_H264ORVP9_ERR_MODE			BIT(19)
+#define     RKVDEC_SOFTRST_EN_P				BIT(20)
+#define     RKVDEC_FORCE_SOFTRESET_VALID		BIT(21)
+#define     RKVDEC_SOFTRESET_RDY			BIT(22)
+#define RKVDEC_REG_SYSCTRL			0x008
+#define     RKVDEC_IN_ENDIAN				BIT(0)
+#define     RKVDEC_IN_SWAP32_E				BIT(1)
+#define     RKVDEC_IN_SWAP64_E				BIT(2)
+#define     RKVDEC_STR_ENDIAN				BIT(3)
+#define     RKVDEC_STR_SWAP32_E				BIT(4)
+#define     RKVDEC_STR_SWAP64_E				BIT(5)
+#define     RKVDEC_OUT_ENDIAN				BIT(6)
+#define     RKVDEC_OUT_SWAP32_E				BIT(7)
+#define     RKVDEC_OUT_CBCR_SWAP			BIT(8)
+#define     RKVDEC_RLC_MODE_DIRECT_WRITE		BIT(10)
+#define     RKVDEC_RLC_MODE				BIT(11)
+#define     RKVDEC_STRM_START_BIT(x)			(((x) & 0x7f) << 12)
+#define     RKVDEC_MODE(x)				(((x) & 0x03) << 20)
+#define     RKVDEC_MODE_H264				1
+#define     RKVDEC_MODE_VP9				2
+#define     RKVDEC_RPS_MODE				BIT(24)
+#define     RKVDEC_STRM_MODE				BIT(25)
+#define     RKVDEC_H264_STRM_LASTPKT			BIT(26)
+#define     RKVDEC_H264_FIRSTSLICE_FLAG			BIT(27)
+#define     RKVDEC_H264_FRAME_ORSLICE			BIT(28)
+#define     RKVDEC_BUSPR_SLOT_DIS			BIT(29)
+#define RKVDEC_REG_PICPAR			0x00C
+#define     RKVDEC_Y_HOR_VIRSTRIDE(x)			((x) & 0x1ff)
+#define     RKVDEC_SLICE_NUM_HIGHBIT			BIT(11)
+#define     RKVDEC_UV_HOR_VIRSTRIDE(x)			(((x) & 0x1ff) << 12)
+#define     RKVDEC_SLICE_NUM_LOWBITS(x)			(((x) & 0x7ff) << 21)
+#define RKVDEC_REG_STRM_RLC_BASE		0x010
+#define RKVDEC_REG_STRM_LEN			0x014
+#define     RKVDEC_STRM_LEN(x)				((x) & 0x7ffffff)
+#define RKVDEC_REG_CABACTBL_PROB_BASE		0x018
+#define RKVDEC_REG_DECOUT_BASE			0x01C
+#define RKVDEC_REG_Y_VIRSTRIDE			0x020
+#define     RKVDEC_Y_VIRSTRIDE(x)			((x) & 0xfffff)
+#define RKVDEC_REG_YUV_VIRSTRIDE		0x024
+#define     RKVDEC_YUV_VIRSTRIDE(x)			((x) & 0x1fffff)
+#define RKVDEC_REG_H264_BASE_REFER(i)		(((i) * 0x04) + 0x028)
+#define RKVDEC_REG_H264_BASE_REFER15		0x0C0
+#define     RKVDEC_FIELD_REF				BIT(0)
+#define     RKVDEC_TOPFIELD_USED_REF			BIT(1)
+#define     RKVDEC_BOTFIELD_USED_REF			BIT(2)
+#define     RKVDEC_COLMV_USED_FLAG_REF			BIT(3)
+#define RKVDEC_REG_VP9_LAST_FRAME_BASE		0x02c
+#define RKVDEC_REG_VP9_GOLDEN_FRAME_BASE	0x030
+#define RKVDEC_REG_VP9_ALTREF_FRAME_BASE	0x034
+#define RKVDEC_REG_VP9_CPRHEADER_OFFSET		0x028
+#define     RKVDEC_VP9_CPRHEADER_OFFSET(x)		((x) & 0xffff)
+#define RKVDEC_REG_VP9_REFERLAST_BASE		0x02C
+#define RKVDEC_REG_VP9_REFERGOLDEN_BASE		0x030
+#define RKVDEC_REG_VP9_REFERALFTER_BASE		0x034
+#define RKVDEC_REG_VP9COUNT_BASE		0x038
+#define     RKVDEC_VP9COUNT_UPDATE_EN			BIT(0)
+#define RKVDEC_REG_VP9_SEGIDLAST_BASE		0x03C
+#define RKVDEC_REG_VP9_SEGIDCUR_BASE		0x040
+#define RKVDEC_REG_VP9_FRAME_SIZE(i)		((i) * 0x04 + 0x044)
+#define     RKVDEC_VP9_FRAMEWIDTH(x)			(((x) & 0xffff) << 0)
+#define     RKVDEC_VP9_FRAMEHEIGHT(x)			(((x) & 0xffff) << 16)
+#define RKVDEC_VP9_SEGID_GRP(i)			((i) * 0x04 + 0x050)
+#define     RKVDEC_SEGID_ABS_DELTA(x)			((x) & 0x1)
+#define     RKVDEC_SEGID_FRAME_QP_DELTA_EN(x)		(((x) & 0x1) << 1)
+#define     RKVDEC_SEGID_FRAME_QP_DELTA(x)		(((x) & 0x1ff) << 2)
+#define     RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE_EN(x)	(((x) & 0x1) << 11)
+#define     RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE(x)	(((x) & 0x7f) << 12)
+#define     RKVDEC_SEGID_REFERINFO_EN(x)		(((x) & 0x1) << 19)
+#define     RKVDEC_SEGID_REFERINFO(x)			(((x) & 0x03) << 20)
+#define     RKVDEC_SEGID_FRAME_SKIP_EN(x)		(((x) & 0x1) << 22)
+#define RKVDEC_VP9_CPRHEADER_CONFIG		0x070
+#define     RKVDEC_VP9_TX_MODE(x)			((x) & 0x07)
+#define     RKVDEC_VP9_FRAME_REF_MODE(x)		(((x) & 0x03) << 3)
+#define RKVDEC_VP9_REF_SCALE(i)			((i) * 0x04 + 0x074)
+#define     RKVDEC_VP9_REF_HOR_SCALE(x)			((x) & 0xffff)
+#define     RKVDEC_VP9_REF_VER_SCALE(x)			(((x) & 0xffff) << 16)
+#define RKVDEC_VP9_REF_DELTAS_LASTFRAME		0x080
+#define     RKVDEC_REF_DELTAS0_LASTFRAME(x)		((x) & 0x7f)
+#define     RKVDEC_REF_DELTAS1_LASTFRAME(x)		(((x) & 0x7f) << 7)
+#define     RKVDEC_REF_DELTAS2_LASTFRAME(x)		(((x) & 0x7f) << 14)
+#define     RKVDEC_REF_DELTAS3_LASTFRAME(x)		(((x) & 0x7f) << 21)
+#define RKVDEC_VP9_INFO_LASTFRAME		0x084
+#define     RKVDEC_MODE_DELTAS0_LASTFRAME(x)		((x) & 0x7f)
+#define     RKVDEC_MODE_DELTAS1_LASTFRAME(x)		(((x) & 0x7f) << 7)
+#define     RKVDEC_SEG_EN_LASTFRAME			BIT(16)
+#define     RKVDEC_LAST_SHOW_FRAME			BIT(17)
+#define     RKVDEC_LAST_INTRA_ONLY			BIT(18)
+#define     RKVDEC_LAST_WIDHHEIGHT_EQCUR		BIT(19)
+#define     RKVDEC_COLOR_SPACE_LASTKEYFRAME(x)		(((x) & 0x07) << 20)
+#define RKVDEC_VP9_INTERCMD_BASE		0x088
+#define RKVDEC_VP9_INTERCMD_NUM			0x08C
+#define     RKVDEC_INTERCMD_NUM(x)			((x) & 0xffffff)
+#define RKVDEC_VP9_LASTTILE_SIZE		0x090
+#define     RKVDEC_LASTTILE_SIZE(x)			((x) & 0xffffff)
+#define RKVDEC_VP9_HOR_VIRSTRIDE(i)		((i) * 0x04 + 0x094)
+#define     RKVDEC_HOR_Y_VIRSTRIDE(x)			((x) & 0x1ff)
+#define     RKVDEC_HOR_UV_VIRSTRIDE(x)			(((x) & 0x1ff) << 16)
+#define RKVDEC_REG_H264_POC_REFER0(i)		(((i) * 0x04) + 0x064)
+#define RKVDEC_REG_H264_POC_REFER1(i)		(((i) * 0x04) + 0x0C4)
+#define RKVDEC_REG_H264_POC_REFER2(i)		(((i) * 0x04) + 0x120)
+#define     RKVDEC_POC_REFER(x)				((x) & 0xffffffff)
+#define RKVDEC_REG_CUR_POC0			0x0A0
+#define RKVDEC_REG_CUR_POC1			0x128
+#define     RKVDEC_CUR_POC(x)				((x) & 0xffffffff)
+#define RKVDEC_REG_RLCWRITE_BASE		0x0A4
+#define RKVDEC_REG_PPS_BASE			0x0A8
+#define RKVDEC_REG_RPS_BASE			0x0AC
+#define RKVDEC_REG_STRMD_ERR_EN			0x0B0
+#define     RKVDEC_STRMD_ERR_EN(x)			((x) & 0xffffffff)
+#define RKVDEC_REG_STRMD_ERR_STA		0x0B4
+#define     RKVDEC_STRMD_ERR_STA(x)			((x) & 0xfffffff)
+#define     RKVDEC_COLMV_ERR_REF_PICIDX(x)		(((x) & 0x0f) << 28)
+#define RKVDEC_REG_STRMD_ERR_CTU		0x0B8
+#define     RKVDEC_STRMD_ERR_CTU(x)			((x) & 0xff)
+#define     RKVDEC_STRMD_ERR_CTU_YOFFSET(x)		(((x) & 0xff) << 8)
+#define     RKVDEC_STRMFIFO_SPACE2FULL(x)		(((x) & 0x7f) << 16)
+#define     RKVDEC_VP9_ERR_EN_CTU0			BIT(24)
+#define RKVDEC_REG_SAO_CTU_POS			0x0BC
+#define     RKVDEC_SAOWR_XOFFSET(x)			((x) & 0x1ff)
+#define     RKVDEC_SAOWR_YOFFSET(x)			(((x) & 0x3ff) << 16)
+#define RKVDEC_VP9_LAST_FRAME_YSTRIDE		0x0C0
+#define RKVDEC_VP9_GOLDEN_FRAME_YSTRIDE		0x0C4
+#define RKVDEC_VP9_ALTREF_FRAME_YSTRIDE		0x0C8
+#define     RKVDEC_VP9_REF_YSTRIDE(x)			(((x) & 0xfffff) << 0)
+#define RKVDEC_VP9_LAST_FRAME_YUVSTRIDE		0x0CC
+#define     RKVDEC_VP9_REF_YUVSTRIDE(x)			(((x) & 0x1fffff) << 0)
+#define RKVDEC_VP9_REF_COLMV_BASE		0x0D0
+#define RKVDEC_REG_PERFORMANCE_CYCLE		0x100
+#define     RKVDEC_PERFORMANCE_CYCLE(x)			((x) & 0xffffffff)
+#define RKVDEC_REG_AXI_DDR_RDATA		0x104
+#define     RKVDEC_AXI_DDR_RDATA(x)			((x) & 0xffffffff)
+#define RKVDEC_REG_AXI_DDR_WDATA		0x108
+#define     RKVDEC_AXI_DDR_WDATA(x)			((x) & 0xffffffff)
+#define RKVDEC_REG_FPGADEBUG_RESET		0x10C
+#define     RKVDEC_BUSIFD_RESETN			BIT(0)
+#define     RKVDEC_CABAC_RESETN				BIT(1)
+#define     RKVDEC_DEC_CTRL_RESETN			BIT(2)
+#define     RKVDEC_TRANSD_RESETN			BIT(3)
+#define     RKVDEC_INTRA_RESETN				BIT(4)
+#define     RKVDEC_INTER_RESETN				BIT(5)
+#define     RKVDEC_RECON_RESETN				BIT(6)
+#define     RKVDEC_FILER_RESETN				BIT(7)
+#define RKVDEC_REG_PERFORMANCE_SEL		0x110
+#define     RKVDEC_PERF_SEL_CNT0(x)			((x) & 0x3f)
+#define     RKVDEC_PERF_SEL_CNT1(x)			(((x) & 0x3f) << 8)
+#define     RKVDEC_PERF_SEL_CNT2(x)			(((x) & 0x3f) << 16)
+#define RKVDEC_REG_PERFORMANCE_CNT(i)		((i) * 0x04 + 0x114)
+#define     RKVDEC_PERF_CNT(x)				((x) & 0xffffffff)
+#define RKVDEC_REG_H264_ERRINFO_BASE		0x12C
+#define RKVDEC_REG_H264_ERRINFO_NUM		0x130
+#define     RKVDEC_SLICEDEC_NUM(x)			((x) & 0x3fff)
+#define     RKVDEC_STRMD_DECT_ERR_FLAG			BIT(15)
+#define     RKVDEC_ERR_PKT_NUM(x)			(((x) & 0x3fff) << 16)
+#define RKVDEC_REG_H264_ERR_E			0x134
+#define     RKVDEC_H264_ERR_EN_HIGHBITS(x)		((x) & 0x3fffffff)
+#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND	0x410
+#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND	0x450
+
+#define	SEQ_PARAMETER_SET_ID_OFF				RKVDEC_FIELD(0, 0)
+#define SEQ_PARAMETER_SET_ID_LEN				4
+#define PROFILE_IDC_OFF						RKVDEC_FIELD(0, 4)
+#define PROFILE_IDC_LEN						8
+#define CONSTRAINT_SET3_FLAG_OFF				RKVDEC_FIELD(0, 12)
+#define CONSTRAINT_SET3_FLAG_LEN				1
+#define CHROMA_FORMAT_IDC_OFF					RKVDEC_FIELD(0, 13)
+#define CHROMA_FORMAT_IDC_LEN					2
+#define BIT_DEPTH_LUMA_OFF					RKVDEC_FIELD(0, 15)
+#define BIT_DEPTH_LUMA_LEN					3
+#define BIT_DEPTH_CHROMA_OFF					RKVDEC_FIELD(0, 18)
+#define BIT_DEPTH_CHROMA_LEN					3
+#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_OFF		RKVDEC_FIELD(0, 21)
+#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_LEN		1
+#define LOG2_MAX_FRAME_NUM_MINUS4_OFF				RKVDEC_FIELD(0, 22)
+#define LOG2_MAX_FRAME_NUM_MINUS4_LEN				4
+#define MAX_NUM_REF_FRAMES_OFF					RKVDEC_FIELD(0, 26)
+#define MAX_NUM_REF_FRAMES_LEN					5
+#define PIC_ORDER_CNT_TYPE_OFF					RKVDEC_FIELD(0, 31)
+#define PIC_ORDER_CNT_TYPE_LEN					2
+#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4_OFF			RKVDEC_FIELD(1, 1)
+#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4_LEN			4
+#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG_OFF			RKVDEC_FIELD(1, 5)
+#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG_LEN			1
+#define PIC_WIDTH_IN_MBS_OFF					RKVDEC_FIELD(1, 6)
+#define PIC_WIDTH_IN_MBS_LEN					9
+#define PIC_HEIGHT_IN_MBS_OFF					RKVDEC_FIELD(1, 15)
+#define PIC_HEIGHT_IN_MBS_LEN					9
+#define FRAME_MBS_ONLY_FLAG_OFF					RKVDEC_FIELD(1, 24)
+#define FRAME_MBS_ONLY_FLAG_LEN					1
+#define MB_ADAPTIVE_FRAME_FIELD_FLAG_OFF			RKVDEC_FIELD(1, 25)
+#define MB_ADAPTIVE_FRAME_FIELD_FLAG_LEN			1
+#define DIRECT_8X8_INFERENCE_FLAG_OFF				RKVDEC_FIELD(1, 26)
+#define DIRECT_8X8_INFERENCE_FLAG_LEN				1
+#define MVC_EXTENSION_ENABLE_OFF				RKVDEC_FIELD(1, 27)
+#define MVC_EXTENSION_ENABLE_LEN				1
+#define NUM_VIEWS_OFF						RKVDEC_FIELD(1, 28)
+#define NUM_VIEWS_LEN						2
+#define VIEW_ID_0_OFF						RKVDEC_FIELD(1, 30)
+#define VIEW_ID_0_LEN						10
+#define VIEW_ID_1_OFF						RKVDEC_FIELD(2, 8)
+#define VIEW_ID_1_LEN						10
+#define NUM_ANCHOR_REFS_L0_OFF					RKVDEC_FIELD(2, 18)
+#define NUM_ANCHOR_REFS_L0_LEN					1
+#define ANCHOR_REF_L0_OFF					RKVDEC_FIELD(2, 19)
+#define ANCHOR_REF_L0_LEN					10
+#define NUM_ANCHOR_REFS_L1_OFF					RKVDEC_FIELD(2, 29)
+#define NUM_ANCHOR_REFS_L1_LEN					1
+#define ANCHOR_REF_L1_OFF					RKVDEC_FIELD(2, 30)
+#define ANCHOR_REF_L1_LEN					10
+#define NUM_NON_ANCHOR_REFS_L0_OFF				RKVDEC_FIELD(3, 8)
+#define NUM_NON_ANCHOR_REFS_L0_LEN				1
+#define NON_ANCHOR_REFS_L0_OFF					RKVDEC_FIELD(3, 9)
+#define NON_ANCHOR_REFS_L0_LEN					10
+#define NUM_NON_ANCHOR_REFS_L1_OFF				RKVDEC_FIELD(3, 19)
+#define NUM_NON_ANCHOR_REFS_L1_LEN				1
+#define NON_ANCHOR_REFS_L1_OFF					RKVDEC_FIELD(3, 20)
+#define NON_ANCHOR_REFS_L1_LEN					10
+
+#define PIC_PARAMETER_SET_ID_OFF				RKVDEC_FIELD(4, 0)
+#define PIC_PARAMETER_SET_ID_LEN				8
+#define PPS_SEQ_PARAMETER_SET_ID_OFF				RKVDEC_FIELD(4, 8)
+#define PPS_SEQ_PARAMETER_SET_ID_LEN				5
+#define ENTROPY_CODING_MODE_FLAG_OFF				RKVDEC_FIELD(4, 13)
+#define ENTROPY_CODING_MODE_FLAG_LEN				1
+#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG_OFF	RKVDEC_FIELD(4, 14)
+#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG_LEN	1
+#define NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_OFF		RKVDEC_FIELD(4, 15)
+#define NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_LEN		5
+#define NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_OFF		RKVDEC_FIELD(4, 20)
+#define NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_LEN		5
+#define WEIGHTED_PRED_FLAG_OFF					RKVDEC_FIELD(4, 25)
+#define WEIGHTED_PRED_FLAG_LEN					1
+#define WEIGHTED_BIPRED_IDC_OFF					RKVDEC_FIELD(4, 26)
+#define WEIGHTED_BIPRED_IDC_LEN					2
+#define PIC_INIT_QP_MINUS26_OFF					RKVDEC_FIELD(4, 28)
+#define PIC_INIT_QP_MINUS26_LEN					7
+#define PIC_INIT_QS_MINUS26_OFF					RKVDEC_FIELD(5, 3)
+#define PIC_INIT_QS_MINUS26_LEN					6
+#define CHROMA_QP_INDEX_OFFSET_OFF				RKVDEC_FIELD(5, 9)
+#define CHROMA_QP_INDEX_OFFSET_LEN				5
+#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG_OFF		RKVDEC_FIELD(5, 14)
+#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG_LEN		1
+#define CONSTRAINED_INTRA_PRED_FLAG_OFF				RKVDEC_FIELD(5, 15)
+#define CONSTRAINED_INTRA_PRED_FLAG_LEN				1
+#define REDUNDANT_PIC_CNT_PRESENT_OFF				RKVDEC_FIELD(5, 16)
+#define REDUNDANT_PIC_CNT_PRESENT_LEN				1
+#define TRANSFORM_8X8_MODE_FLAG_OFF				RKVDEC_FIELD(5, 17)
+#define TRANSFORM_8X8_MODE_FLAG_LEN				1
+#define SECOND_CHROMA_QP_INDEX_OFFSET_OFF			RKVDEC_FIELD(5, 18)
+#define SECOND_CHROMA_QP_INDEX_OFFSET_LEN			5
+#define SCALING_LIST_ENABLE_FLAG_OFF				RKVDEC_FIELD(5, 23)
+#define SCALING_LIST_ENABLE_FLAG_LEN				1
+#define SCALING_LIST_ADDRESS_OFF				RKVDEC_FIELD(5, 24)
+#define SCALING_LIST_ADDRESS_LEN				32
+#define IS_LONG_TERM_OFF(i)				((6 * 32) + 24 + (i))
+#define IS_LONG_TERM_LEN				1
+
+#define DPB_INFO_OFF(i, j)	(9 * 32 + ((j) * 32 * 7) + ((i) * 7))
+#define DPB_INFO_LEN		5
+#define BOTTOM_FLAG_OFF(i, j)	(9 * 32 + ((j) * 32 * 7) + ((i) * 7) + 5)
+#define BOTTOM_FLAG_LEN		1
+#define VIEW_INDEX_OFF(i, j)	(9 * 32 + ((j) * 32 * 7) + ((i) * 7) + 6)
+#define VIEW_INDEX_LEN		1
+
+#endif /* RKVDEC_REGS_H_ */
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec.c b/drivers/staging/media/rockchip/vdec/rkvdec.c
new file mode 100644
index 000000000000..3531ce0dd3e7
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/rkvdec.c
@@ -0,0 +1,1089 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Video Decoder driver
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
+ * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+#include <linux/workqueue.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "rkvdec.h"
+#include "rkvdec-regs.h"
+
+static const struct rkvdec_decoded_fmt_desc rkvdec_decoded_fmts[] = {
+	{ .fourcc = V4L2_PIX_FMT_NV12 },
+};
+
+static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
+	{
+		.per_request = true,
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+	},
+	{
+		.per_request = true,
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+	},
+	{
+		.per_request = true,
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+	},
+	{
+		.per_request = true,
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
+	},
+	{
+		.per_request = true,
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+	},
+	{
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+	},
+	{
+		.mandatory = true,
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+	},
+};
+
+static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
+	.ctrls = rkvdec_h264_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
+};
+
+static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 3840,
+			.step_width = 16,
+			.min_height = 48,
+			.max_height = 2160,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_h264_ctrls,
+		.ops = &rkvdec_h264_fmt_ops,
+	}
+};
+
+static const struct rkvdec_coded_fmt_desc *
+rkvdec_find_coded_fmt_desc(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
+		if (rkvdec_coded_fmts[i].fourcc == fourcc)
+			return &rkvdec_coded_fmts[i];
+	}
+
+	return NULL;
+}
+
+static int rkvdec_enum_framesizes(struct file *file, void *priv,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	const struct rkvdec_coded_fmt_desc *fmt;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
+	if (!fmt)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = fmt->frmsize;
+	return 0;
+}
+
+static int rkvdec_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	struct rkvdec_dev *rkvdec = video_drvdata(file);
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, rkvdec->dev->driver->name,
+		sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 rkvdec->dev->driver->name);
+	return 0;
+}
+
+static int rkvdec_try_capture_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	const struct rkvdec_coded_fmt_desc *coded_desc;
+	unsigned int i;
+	u32 fourcc;
+
+	/*
+	 * The codec context should point to a coded format desc, if the format
+	 * on the coded end has not been set yet, it should point to the
+	 * default value.
+	 */
+	coded_desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!coded_desc))
+		return -EINVAL;
+
+	fourcc = f->fmt.pix_mp.pixelformat;
+	for (i = 0; i < ARRAY_SIZE(rkvdec_decoded_fmts); i++) {
+		if (rkvdec_decoded_fmts[i].fourcc == fourcc)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(rkvdec_decoded_fmts))
+		return -EINVAL;
+
+	/* Always apply the frmsize constraint of the coded end. */
+	v4l2_apply_frmsize_constraints(&f->fmt.pix_mp.width,
+				       &f->fmt.pix_mp.height,
+				       &coded_desc->frmsize);
+
+	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, fourcc, f->fmt.pix_mp.width,
+			    f->fmt.pix_mp.height);
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int rkvdec_try_output_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	const struct rkvdec_coded_fmt_desc *desc;
+	u32 fourcc;
+	int ret;
+
+	fourcc = f->fmt.pix_mp.pixelformat;
+	desc = rkvdec_find_coded_fmt_desc(fourcc);
+	if (!desc)
+		return -EINVAL;
+
+	v4l2_apply_frmsize_constraints(&f->fmt.pix_mp.width,
+				       &f->fmt.pix_mp.height,
+				       &desc->frmsize);
+
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	/* All coded formats are considered single planar for now. */
+	f->fmt.pix_mp.num_planes = 1;
+
+	if (desc->ops->adjust_fmt) {
+		ret = desc->ops->adjust_fmt(ctx, f);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rkvdec_s_fmt(struct file *file, void *priv,
+			struct v4l2_format *f,
+			int (*try_fmt)(struct file *, void *,
+				       struct v4l2_format *))
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct vb2_queue *vq;
+	int ret;
+
+	if (!try_fmt)
+		return -EINVAL;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ret = try_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		const struct rkvdec_coded_fmt_desc *desc;
+		u32 fourcc;
+
+		fourcc = f->fmt.pix_mp.pixelformat;
+		desc = rkvdec_find_coded_fmt_desc(fourcc);
+		if (!desc)
+			return -EINVAL;
+
+		ctx->coded_fmt_desc = desc;
+	}
+
+	return 0;
+}
+
+static int rkvdec_s_output_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct v4l2_format *cap_fmt;
+	struct vb2_queue *peer_vq;
+	int ret;
+
+	/*
+	 * Since format change on the OUTPUT queue will reset the CAPTURE
+	 * queue, we can't allow doing so when the CAPTURE queue has buffers
+	 * allocated.
+	 */
+	peer_vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (vb2_is_busy(peer_vq))
+		return -EBUSY;
+
+	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
+	if (ret)
+		return ret;
+
+	ctx->coded_fmt = *f;
+	cap_fmt = &ctx->decoded_fmt;
+
+	/* Propagate colorspace information to capture. */
+	cap_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	cap_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+	return 0;
+}
+
+static int rkvdec_s_capture_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	int ret;
+
+	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_capture_fmt);
+	if (ret)
+		return ret;
+
+	ctx->decoded_fmt = *f;
+	return 0;
+}
+
+static int rkvdec_g_output_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+
+	*f = ctx->coded_fmt;
+	return 0;
+}
+
+static int rkvdec_g_capture_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+
+	*f = ctx->decoded_fmt;
+	return 0;
+}
+
+static int rkvdec_enum_output_fmt(struct file *file, void *priv,
+				  struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
+		return -EINVAL;
+
+	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
+	return 0;
+}
+
+static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(rkvdec_decoded_fmts))
+		return -EINVAL;
+
+	f->pixelformat = rkvdec_decoded_fmts[f->index].fourcc;
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops rkvdec_ioctl_ops = {
+	.vidioc_querycap = rkvdec_querycap,
+	.vidioc_enum_framesizes = rkvdec_enum_framesizes,
+
+	.vidioc_try_fmt_vid_cap_mplane = rkvdec_try_capture_fmt,
+	.vidioc_try_fmt_vid_out_mplane = rkvdec_try_output_fmt,
+	.vidioc_s_fmt_vid_out_mplane = rkvdec_s_output_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = rkvdec_s_capture_fmt,
+	.vidioc_g_fmt_vid_out_mplane = rkvdec_g_output_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = rkvdec_g_capture_fmt,
+	.vidioc_enum_fmt_vid_out = rkvdec_enum_output_fmt,
+	.vidioc_enum_fmt_vid_cap = rkvdec_enum_capture_fmt,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+};
+
+static int rkvdec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+			      unsigned int *num_planes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format_mplane *pixfmt;
+	struct v4l2_format *f;
+	unsigned int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	if (*num_planes) {
+		if (*num_planes != f->fmt.pix_mp.num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
+			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = f->fmt.pix_mp.num_planes;
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
+			sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		return 0;
+
+	pixfmt = &ctx->decoded_fmt.fmt.pix_mp;
+	sizes[0] += 128 * DIV_ROUND_UP(pixfmt->width, 16) *
+		    DIV_ROUND_UP(pixfmt->height, 16);
+	return 0;
+}
+
+static int rkvdec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_format *f;
+	unsigned int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	for (i = 0; i < f->fmt.pix_mp.num_planes; ++i) {
+		if (vb2_plane_size(vb, i) < f->fmt.pix_mp.plane_fmt[i].sizeimage)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void rkvdec_buf_queue(struct vb2_buffer *vb)
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int rkvdec_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
+static void rkvdec_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+}
+
+static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
+	const struct rkvdec_coded_fmt_desc *desc;
+	int ret;
+
+	if (!V4L2_TYPE_IS_OUTPUT(q->type))
+		return 0;
+
+	desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!desc))
+		return -EINVAL;
+
+	if (desc->ops->start) {
+		ret = desc->ops->start(ctx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void rkvdec_queue_cleanup(struct vb2_queue *vq, u32 state)
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(vq);
+
+	while (true) {
+		struct vb2_v4l2_buffer *vbuf;
+
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+		if (!vbuf)
+			break;
+
+		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done(vbuf, state);
+	}
+}
+
+static void rkvdec_stop_streaming(struct vb2_queue *q)
+{
+	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+		if (WARN_ON(!desc))
+			return;
+
+		if (desc->ops->stop)
+			desc->ops->stop(ctx);
+	}
+
+	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
+}
+
+const struct vb2_ops rkvdec_queue_ops = {
+	.queue_setup = rkvdec_queue_setup,
+	.buf_prepare = rkvdec_buf_prepare,
+	.buf_queue = rkvdec_buf_queue,
+	.buf_out_validate = rkvdec_buf_out_validate,
+	.buf_request_complete = rkvdec_buf_request_complete,
+	.start_streaming = rkvdec_start_streaming,
+	.stop_streaming = rkvdec_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int rkvdec_request_validate(struct media_request *req)
+{
+	const struct rkvdec_ctrls *ctrls;
+	struct v4l2_ctrl_handler *hdl;
+	struct rkvdec_ctx *ctx;
+	struct vb2_buffer *vb;
+	unsigned int count, i;
+
+	vb = vb2_request_get_buf(req, 0);
+	if (!vb)
+		return -ENOENT;
+
+	ctx = vb2_get_drv_priv(vb->vb2_queue);
+	if (!ctx)
+		return -EINVAL;
+
+	count = vb2_request_buffer_cnt(req);
+	if (!count)
+		return -ENOENT;
+	else if (count > 1)
+		return -EINVAL;
+
+	hdl = v4l2_ctrl_request_hdl_find(req, &ctx->ctrl_hdl);
+	if (!hdl)
+		return -ENOENT;
+
+	ctrls = ctx->coded_fmt_desc->ctrls;
+	for (i = 0; ctrls && i < ctrls->num_ctrls; i++) {
+		u32 id = ctrls->ctrls[i].cfg.id;
+		struct v4l2_ctrl *ctrl;
+
+		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
+			continue;
+
+		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
+		if (!ctrl)
+			return -ENOENT;
+	}
+
+	v4l2_ctrl_request_hdl_put(hdl);
+
+	return vb2_request_validate(req);
+}
+
+static const struct media_device_ops rkvdec_media_ops = {
+	.req_validate = rkvdec_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+
+static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
+				    enum vb2_buffer_state result)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+	struct vb2_v4l2_buffer *dst_buf = v4l2_m2m_dst_buf_remove(m2m_ctx);
+	const struct v4l2_format *f;
+
+	if (WARN_ON(!src_buf || !dst_buf))
+		return;
+
+	f = &ctx->decoded_fmt;
+	if (result != VB2_BUF_STATE_ERROR)
+		dst_buf->planes[0].bytesused =
+			f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	else
+		dst_buf->planes[0].bytesused = 0;
+
+	v4l2_m2m_buf_done(src_buf, result);
+	v4l2_m2m_buf_done(dst_buf, result);
+	v4l2_m2m_job_finish(ctx->dev->m2m_dev, m2m_ctx);
+}
+
+static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
+			      enum vb2_buffer_state result)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	pm_runtime_mark_last_busy(rkvdec->dev);
+	pm_runtime_put_autosuspend(rkvdec->dev);
+	rkvdec_job_finish_no_pm(ctx, result);
+}
+
+void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
+{
+	struct media_request *src_req;
+
+	memset(run, 0, sizeof(*run));
+
+	run->bufs.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	run->bufs.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	/* Apply request(s) controls if needed. */
+	src_req = run->bufs.src->vb2_buf.req_obj.req;
+	if (src_req)
+		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
+
+	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst, true);
+}
+
+void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
+{
+	struct media_request *src_req = run->bufs.src->vb2_buf.req_obj.req;
+
+	if (src_req)
+		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
+}
+
+static void rkvdec_device_run(void *priv)
+{
+	struct rkvdec_ctx *ctx = priv;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	int ret;
+
+	if (WARN_ON(!desc))
+		return;
+
+	ret = pm_runtime_get_sync(rkvdec->dev);
+	if (ret < 0) {
+		rkvdec_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	desc->ops->run(ctx);
+}
+
+static struct v4l2_m2m_ops rkvdec_m2m_ops = {
+	.device_run = rkvdec_device_run,
+};
+
+static int rkvdec_queue_init(void *priv,
+			     struct vb2_queue *src_vq,
+			     struct vb2_queue *dst_vq)
+{
+	struct rkvdec_ctx *ctx = priv;
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->ops = &rkvdec_queue_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+
+	/*
+	 * Driver does mostly sequential access, so sacrifice TLB efficiency
+	 * for faster allocation. Also, no CPU access on the source queue,
+	 * so no kernel mapping needed.
+	 */
+	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
+			    DMA_ATTR_NO_KERNEL_MAPPING;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &rkvdec->vdev_lock;
+	src_vq->dev = rkvdec->v4l2_dev.dev;
+	src_vq->supports_requests = true;
+	src_vq->requires_requests = true;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->bidirectional = true;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
+			    DMA_ATTR_NO_KERNEL_MAPPING;
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->ops = &rkvdec_queue_ops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &rkvdec->vdev_lock;
+	dst_vq->dev = rkvdec->v4l2_dev.dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
+			    const struct rkvdec_ctrls *ctrls)
+{
+	unsigned int i;
+
+	for (i = 0; i < ctrls->num_ctrls; i++) {
+		const struct v4l2_ctrl_config *cfg = &ctrls->ctrls[i].cfg;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
+		if (ctx->ctrl_hdl.error)
+			return ctx->ctrl_hdl.error;
+	}
+
+	return 0;
+}
+
+static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
+{
+	unsigned int i, nctrls = 0;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
+		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
+		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+		if (ret)
+			goto err_free_handler;
+	}
+
+	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+	if (ret)
+		goto err_free_handler;
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	return ret;
+}
+
+static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
+			     u32 fourcc)
+{
+	memset(f, 0, sizeof(*f));
+	f->fmt.pix_mp.pixelformat = fourcc;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->coded_fmt;
+
+	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
+	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
+
+	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f->fmt.pix_mp.width = ctx->coded_fmt_desc->frmsize.min_width;
+	f->fmt.pix_mp.height = ctx->coded_fmt_desc->frmsize.min_height;
+
+	if (ctx->coded_fmt_desc->ops->adjust_fmt)
+		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
+}
+
+static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->decoded_fmt;
+
+	if (!ctx->coded_fmt_desc)
+		rkvdec_reset_coded_fmt(ctx);
+
+	ctx->decoded_fmt_desc = &rkvdec_decoded_fmts[0];
+	rkvdec_reset_fmt(ctx, f, ctx->decoded_fmt_desc->fourcc);
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, ctx->decoded_fmt_desc->fourcc,
+			    ctx->coded_fmt_desc->frmsize.min_width,
+			    ctx->coded_fmt_desc->frmsize.min_height);
+}
+
+static int rkvdec_open(struct file *filp)
+{
+	struct rkvdec_dev *rkvdec = video_drvdata(filp);
+	struct rkvdec_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = rkvdec;
+	v4l2_fh_init(&ctx->fh, video_devdata(filp));
+
+	ret = rkvdec_init_ctrls(ctx);
+	if (ret)
+		goto err_free_ctx;
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
+					    rkvdec_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_cleanup_ctrls;
+	}
+
+	filp->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	rkvdec_reset_coded_fmt(ctx);
+	rkvdec_reset_decoded_fmt(ctx);
+	return 0;
+
+err_cleanup_ctrls:
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+
+err_free_ctx:
+	kfree(ctx);
+	return ret;
+}
+
+static int rkvdec_release(struct file *filp)
+{
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(filp->private_data);
+
+	v4l2_fh_del(&ctx->fh);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations rkvdec_fops = {
+	.owner = THIS_MODULE,
+	.open = rkvdec_open,
+	.release = rkvdec_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static int rkvdec_v4l2_init(struct rkvdec_dev *rkvdec)
+{
+	int ret;
+
+	ret = v4l2_device_register(rkvdec->dev, &rkvdec->v4l2_dev);
+	if (ret) {
+		dev_err(rkvdec->dev, "Failed to register V4L2 device\n");
+		return ret;
+	}
+
+	rkvdec->m2m_dev = v4l2_m2m_init(&rkvdec_m2m_ops);
+	if (IS_ERR(rkvdec->m2m_dev)) {
+		v4l2_err(&rkvdec->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(rkvdec->m2m_dev);
+		goto err_unregister_v4l2;
+	}
+
+	rkvdec->mdev.dev = rkvdec->dev;
+	strscpy(rkvdec->mdev.model, "rkvdec", sizeof(rkvdec->mdev.model));
+	strscpy(rkvdec->mdev.bus_info, "platform:rkvdec",
+		sizeof(rkvdec->mdev.bus_info));
+	media_device_init(&rkvdec->mdev);
+	rkvdec->mdev.ops = &rkvdec_media_ops;
+	rkvdec->v4l2_dev.mdev = &rkvdec->mdev;
+
+	rkvdec->vdev.lock = &rkvdec->vdev_lock;
+	rkvdec->vdev.v4l2_dev = &rkvdec->v4l2_dev;
+	rkvdec->vdev.fops = &rkvdec_fops;
+	rkvdec->vdev.release = video_device_release_empty;
+	rkvdec->vdev.vfl_dir = VFL_DIR_M2M;
+	rkvdec->vdev.device_caps = V4L2_CAP_STREAMING |
+				   V4L2_CAP_VIDEO_M2M_MPLANE;
+	rkvdec->vdev.ioctl_ops = &rkvdec_ioctl_ops;
+	video_set_drvdata(&rkvdec->vdev, rkvdec);
+	strscpy(rkvdec->vdev.name, "rkvdec", sizeof(rkvdec->vdev.name));
+
+	ret = video_register_device(&rkvdec->vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		v4l2_err(&rkvdec->v4l2_dev, "Failed to register video device\n");
+		goto err_cleanup_mc;
+	}
+
+	ret = v4l2_m2m_register_media_controller(rkvdec->m2m_dev, &rkvdec->vdev,
+						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
+	if (ret) {
+		v4l2_err(&rkvdec->v4l2_dev,
+			 "Failed to initialize V4L2 M2M media controller\n");
+		goto err_unregister_vdev;
+	}
+
+	ret = media_device_register(&rkvdec->mdev);
+	if (ret) {
+		v4l2_err(&rkvdec->v4l2_dev, "Failed to register media device\n");
+		goto err_unregister_mc;
+	}
+
+	return 0;
+
+err_unregister_mc:
+	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
+
+err_unregister_vdev:
+	video_unregister_device(&rkvdec->vdev);
+
+err_cleanup_mc:
+	media_device_cleanup(&rkvdec->mdev);
+	v4l2_m2m_release(rkvdec->m2m_dev);
+
+err_unregister_v4l2:
+	v4l2_device_unregister(&rkvdec->v4l2_dev);
+	return ret;
+}
+
+static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
+{
+	media_device_unregister(&rkvdec->mdev);
+	v4l2_m2m_unregister_media_controller(rkvdec->m2m_dev);
+	video_unregister_device(&rkvdec->vdev);
+	media_device_cleanup(&rkvdec->mdev);
+	v4l2_m2m_release(rkvdec->m2m_dev);
+	v4l2_device_unregister(&rkvdec->v4l2_dev);
+}
+
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	u32 status = readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
+
+	dev_dbg(rkvdec->dev, "dec status %x\n", status);
+
+	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
+
+	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
+		struct rkvdec_ctx *ctx;
+
+		ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+		rkvdec_job_finish(ctx, VB2_BUF_STATE_DONE);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void rkvdec_watchdog_func(struct work_struct *work)
+{
+	struct rkvdec_dev *rkvdec;
+	struct rkvdec_ctx *ctx;
+
+	rkvdec = container_of(to_delayed_work(work), struct rkvdec_dev,
+			      watchdog_work);
+	ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	if (ctx) {
+		dev_err(rkvdec->dev, "Frame processing timed out!\n");
+		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
+		writel(0, rkvdec->regs + RKVDEC_REG_SYSCTRL);
+		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct of_device_id of_rkvdec_match[] = {
+	{ .compatible = "rockchip,rk3399-vdec" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_rkvdec_match);
+
+static const char * const rkvdec_clk_names[] = {
+	"aclk", "iface", "cabac", "core"
+};
+
+static int rkvdec_probe(struct platform_device *pdev)
+{
+	struct rkvdec_dev *rkvdec;
+	struct resource *res;
+	unsigned int i;
+	int ret, irq;
+
+	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
+	if (!rkvdec)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rkvdec);
+	rkvdec->dev = &pdev->dev;
+	mutex_init(&rkvdec->vdev_lock);
+	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
+
+	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
+				      sizeof(*rkvdec->clocks), GFP_KERNEL);
+	if (!rkvdec->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
+		rkvdec->clocks[i].id = rkvdec_clk_names[i];
+
+	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
+				rkvdec->clocks);
+	if (ret)
+		return ret;
+
+	/*
+	 * Bump ACLK to max. possible freq. (500 MHz) to improve performance
+	 * When 4k video playback.
+	 */
+	clk_set_rate(rkvdec->clocks[0].clk, 500 * 1000 * 1000);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rkvdec->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(rkvdec->regs))
+		return PTR_ERR(rkvdec->regs);
+
+	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "Could not set DMA coherent mask.\n");
+		return ret;
+	}
+
+	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0) {
+		dev_err(&pdev->dev, "Could not get vdec IRQ\n");
+		return -ENXIO;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					rkvdec_irq_handler, IRQF_ONESHOT,
+					dev_name(&pdev->dev), rkvdec);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
+		return ret;
+	}
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = rkvdec_v4l2_init(rkvdec);
+	if (ret)
+		goto err_disable_runtime_pm;
+
+	return 0;
+
+err_disable_runtime_pm:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int rkvdec_remove(struct platform_device *pdev)
+{
+	struct rkvdec_dev *rkvdec = platform_get_drvdata(pdev);
+
+	rkvdec_v4l2_cleanup(rkvdec);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int rkvdec_runtime_resume(struct device *dev)
+{
+	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
+				       rkvdec->clocks);
+}
+
+static int rkvdec_runtime_suspend(struct device *dev)
+{
+	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
+				   rkvdec->clocks);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops rkvdec_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
+};
+
+static struct platform_driver rkvdec_driver = {
+	.probe = rkvdec_probe,
+	.remove = rkvdec_remove,
+	.driver = {
+		   .name = "rkvdec",
+		   .of_match_table = of_match_ptr(of_rkvdec_match),
+		   .pm = &rkvdec_pm_ops,
+	},
+};
+module_platform_driver(rkvdec_driver);
+
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@collabora.com>");
+MODULE_DESCRIPTION("Rockchip Video Decoder driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec.h b/drivers/staging/media/rockchip/vdec/rkvdec.h
new file mode 100644
index 000000000000..69cdfb07d343
--- /dev/null
+++ b/drivers/staging/media/rockchip/vdec/rkvdec.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright 2018 Google LLC.
+ *	Tomasz Figa <tfiga@chromium.org>
+ *
+ * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ */
+
+#ifndef RKVDEC_H_
+#define RKVDEC_H_
+
+#include <linux/platform_device.h>
+#include <linux/videodev2.h>
+#include <linux/wait.h>
+#include <linux/clk.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+struct rkvdec_ctrl_desc {
+	u32 per_request : 1;
+	u32 mandatory : 1;
+	struct v4l2_ctrl_config cfg;
+};
+
+struct rkvdec_ctrls {
+	const struct rkvdec_ctrl_desc *ctrls;
+	unsigned int num_ctrls;
+};
+
+struct rkvdec_run {
+	struct {
+		struct vb2_v4l2_buffer *src;
+		struct vb2_v4l2_buffer *dst;
+	} bufs;
+};
+
+struct rkvdec_decoded_fmt_desc {
+	u32 fourcc;
+};
+
+struct rkvdec_ctx;
+
+struct rkvdec_coded_fmt_ops {
+	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
+			  struct v4l2_format *f);
+	int (*start)(struct rkvdec_ctx *ctx);
+	void (*stop)(struct rkvdec_ctx *ctx);
+	void (*run)(struct rkvdec_ctx *ctx);
+};
+
+struct rkvdec_coded_fmt_desc {
+	u32 fourcc;
+	struct v4l2_frmsize_stepwise frmsize;
+	const struct rkvdec_ctrls *ctrls;
+	const struct rkvdec_coded_fmt_ops *ops;
+};
+
+struct rkvdec_dev {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct device *dev;
+	struct clk_bulk_data *clocks;
+	void __iomem *regs;
+	struct mutex vdev_lock;
+	struct delayed_work watchdog_work;
+};
+
+struct rkvdec_ctx {
+	struct v4l2_fh fh;
+	struct v4l2_format coded_fmt;
+	struct v4l2_format decoded_fmt;
+	const struct rkvdec_coded_fmt_desc *coded_fmt_desc;
+	const struct rkvdec_decoded_fmt_desc *decoded_fmt_desc;
+	struct v4l2_ctrl_handler ctrl_hdl;
+	struct rkvdec_dev *dev;
+	void *priv;
+};
+
+static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct rkvdec_ctx, fh);
+}
+
+struct rkvdec_aux_buf {
+	void *cpu;
+	dma_addr_t dma;
+	size_t size;
+};
+
+void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
+void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
+
+static inline void rkvdec_set_field(u32 *buf, u32 bit_offset, u8 len_in_bits,
+				    u32 val)
+{
+	u32 word = bit_offset / 32;
+	u32 bit = bit_offset % 32;
+
+	if (len_in_bits + bit > 32) {
+		u32 len1 = 32 - bit;
+		u32 len2 = len_in_bits + bit - 32;
+
+		buf[word] &= ~(((1 << len1) - 1) << bit);
+		buf[word] |= val << bit;
+
+		val >>= (32 - bit);
+		buf[word + 1] &= ~((1 << len2) - 1);
+		buf[word + 1] |= val;
+	} else {
+		buf[word] &= ~(((1 << len_in_bits) - 1) << bit);
+		buf[word] |= val << bit;
+	}
+}
+
+#define RKVDEC_FIELD(_word, _bit)		((32 * (_word)) + (_bit))
+
+#define RKVDEC_SET_FIELD(_buf, _field, _val)				\
+	rkvdec_set_field(_buf, _field##_OFF, _field##_LEN, _val)
+
+extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
+
+#endif /* RKVDEC_H_ */
-- 
2.21.0

