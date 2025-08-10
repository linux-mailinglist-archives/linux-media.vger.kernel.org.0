Return-Path: <linux-media+bounces-39281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 067BFB1F790
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14C5D174F45
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC35C188734;
	Sun, 10 Aug 2025 01:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eTXknf4/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813A86347;
	Sun, 10 Aug 2025 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789497; cv=none; b=Ven4UZ9csRR+HoX7jNicOmFDr1uNSMjO8JmQQ4j9hwMTmwt3B5YegAVQQyXhW7d6JDpC5pxpLaLlQodtaBXms3M5bfJrUcMZANNT+V0OqRhi4wV0Q9MEs6RuHY/2Dg+mosj5buv3Mw7AkTFLVlVlVvtUHJI+NOPqEXVSeol11jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789497; c=relaxed/simple;
	bh=Nv2zob0qghrgTnc3/aMp2+DhyNJh6yVpYyfx00c1cbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cst81aagMHZvIpEXlbarxePq1ovkSOOF+rwXewDs0aOWrSqFE9C0zCQBqQy0a2sBTFZKpUe7c5xAu2p5wEp8kNQtskqRDN/7OmaMzDmqTljBSxNt+jEuNEuhDLQ8EH9dMZzVdX8IQKYK5+UgE91yt3mNLcx+dSporMkvAprGakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eTXknf4/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 041BE19C8;
	Sun, 10 Aug 2025 03:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789441;
	bh=Nv2zob0qghrgTnc3/aMp2+DhyNJh6yVpYyfx00c1cbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTXknf4/NAboh+INN5xx12jc3RUC9DDUm0tSPbhsyQQxRVOQidkupWCRnY2pCAUCP
	 oRgIV2O/6ttwru390cCR/a9+jhejWTMeCWqOhHGg7dfpHkUtuWZJtmHfvbs6G+Qs/b
	 NihvW1C+Dw1I3kpvsfaXQTW8WcNxwTEUPzu4oX4U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 08/76] media: Wrap file->private_data access with a helper function
Date: Sun, 10 Aug 2025 04:29:50 +0300
Message-ID: <20250810013100.29776-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily convert
implicitly to any pointer type. To avoid direct access to
file->private_data, introduce a new inline function that retrieves the
v4l2_fh pointer, and use it to replace common access patterns through
the kernel.

Changes to drivers have been generated with the following coccinelle
semantic patch:

@@
struct file *filp;
identifier fh;
@@

-       struct v4l2_fh *fh = filp->private_data;
+       struct v4l2_fh *fh = file_to_v4l2_fh(filp);

Manual changes have been applied to Documentation/ to update the usage
patterns, and to include/media/v4l2-fh.h to add the new function.

While at it, fix a typo in the title of v4l2-fh.rst: the file describes
the "file handles" API, not "file handlers".

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-fh.rst    | 16 +++++----
 .../zh_CN/video4linux/v4l2-framework.txt      |  2 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |  2 +-
 drivers/media/pci/cx18/cx18-fileops.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-fileops.c         |  2 +-
 .../media/platform/allegro-dvt/allegro-core.c |  2 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  2 +-
 .../media/platform/nvidia/tegra-vde/v4l2.c    |  2 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  4 +--
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  6 ++--
 .../media/platform/renesas/vsp1/vsp1_video.c  | 12 +++----
 drivers/media/platform/ti/omap3isp/ispvideo.c |  2 +-
 drivers/media/platform/xilinx/xilinx-dma.c    | 10 +++---
 drivers/media/usb/uvc/uvc_metadata.c          | 10 +++---
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  4 +--
 drivers/media/v4l2-core/v4l2-fh.c             |  2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 34 +++++++++----------
 drivers/media/v4l2-core/v4l2-subdev.c         |  8 ++---
 include/media/v4l2-fh.h                       | 14 ++++++++
 19 files changed, 77 insertions(+), 59 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index 3eeaa8da0c9e..2c87b74578d9 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-V4L2 File handlers
-------------------
+V4L2 File handles
+-----------------
 
 struct v4l2_fh provides a way to easily keep file handle specific
 data that is used by the V4L2 framework.
@@ -18,7 +18,9 @@ This bit is set whenever :c:func:`v4l2_fh_init` is called.
 
 struct v4l2_fh is allocated as a part of the driver's own file handle
 structure and ``file->private_data`` is set to it in the driver's ``open()``
-function by the driver.
+function by the driver. The :c:type:`v4l2_fh` file handle can be retrieved
+from the :c:type:`file` using :c:func:`file_to_v4l2_fh`. Drivers must not
+access ``file->private_data`` directly.
 
 In many cases the struct v4l2_fh will be embedded in a larger
 structure. In that case you should call:
@@ -63,7 +65,7 @@ Example:
 
 	int my_release(struct file *file)
 	{
-		struct v4l2_fh *fh = file->private_data;
+		struct v4l2_fh *fh = file_to_v4l2_fh(file);
 		struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
 
 		...
@@ -78,11 +80,9 @@ Below is a short description of the :c:type:`v4l2_fh` functions used:
 :c:func:`v4l2_fh_init <v4l2_fh_init>`
 (:c:type:`fh <v4l2_fh>`, :c:type:`vdev <video_device>`)
 
-
 - Initialise the file handle. This **MUST** be performed in the driver's
   :c:type:`v4l2_file_operations`->open() handler.
 
-
 :c:func:`v4l2_fh_add <v4l2_fh_add>`
 (:c:type:`fh <v4l2_fh>`)
 
@@ -101,6 +101,10 @@ Below is a short description of the :c:type:`v4l2_fh` functions used:
 - Uninitialise the file handle. After uninitialisation the :c:type:`v4l2_fh`
   memory can be freed.
 
+:c:func:`file_to_v4l2_fh <file_to_v4l2_fh>`
+(struct file \*filp)
+
+- Retrieve the :c:type:`v4l2_fh` instance associated with a :c:type:`file`.
 
 If struct v4l2_fh is not embedded, then you can use these helper functions:
 
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index 9cc97ec75d7a..a9eb62fa1531 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -819,7 +819,7 @@ int my_open(struct file *file)
 
 int my_release(struct file *file)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
 
 	...
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 1cd26faee503..f29307e59be5 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -979,7 +979,7 @@ __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
 	res = vb2_core_poll(q, file, wait);
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
-		struct v4l2_fh *fh = file->private_data;
+		struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 		poll_wait(file, &fh->wait, wait);
 		if (v4l2_event_pending(fh))
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index cefa91b37f89..af25628b11ba 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -678,7 +678,7 @@ void cx18_stop_capture(struct cx18_stream *s, int gop_end)
 
 int cx18_v4l2_close(struct file *filp)
 {
-	struct v4l2_fh *fh = filp->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
 	struct cx18_open_id *id = fh2id(fh);
 	struct cx18 *cx = id->cx;
 	struct cx18_stream *s = &cx->streams[id->type];
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index cfa28d035586..230d498108b5 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -877,7 +877,7 @@ static void ivtv_stop_decoding(struct ivtv_open_id *id, int flags, u64 pts)
 
 int ivtv_v4l2_close(struct file *filp)
 {
-	struct v4l2_fh *fh = filp->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
 	struct ivtv_open_id *id = fh2id(fh);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eb03df0d8652..1f134e08923a 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3483,7 +3483,7 @@ static int allegro_enum_framesizes(struct file *file, void *fh,
 static int allegro_ioctl_streamon(struct file *file, void *priv,
 				  enum v4l2_buf_type type)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct allegro_channel *channel = fh_to_channel(fh);
 	int err;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7eb12449b63a..329e5787c2c2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -588,7 +588,7 @@ static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 
 static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct vb2_queue *vq;
 	struct vb2_buffer *vb;
diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index e3726cab0c82..531a85e3fe49 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -853,7 +853,7 @@ static int tegra_open(struct file *file)
 
 static int tegra_release(struct file *file)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct tegra_ctx *ctx = fh_to_tegra_ctx(fh);
 	struct tegra_vde *vde = ctx->vde;
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 8681dd193033..1b2148578cb6 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1604,7 +1604,7 @@ static void mxc_jpeg_device_run(void *priv)
 static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
 	unsigned long flags;
 	int ret;
@@ -1637,7 +1637,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 				struct v4l2_encoder_cmd *cmd)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
 	unsigned long flags;
 	int ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index c762202877ba..390ea50f1595 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -392,7 +392,7 @@ static const struct v4l2_subdev_ops histo_ops = {
 static int histo_v4l2_querycap(struct file *file, void *fh,
 			       struct v4l2_capability *cap)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_histogram *histo = vdev_to_histo(vfh->vdev);
 
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
@@ -409,7 +409,7 @@ static int histo_v4l2_querycap(struct file *file, void *fh,
 static int histo_v4l2_enum_format(struct file *file, void *fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_histogram *histo = vdev_to_histo(vfh->vdev);
 
 	if (f->index > 0 || f->type != histo->queue.type)
@@ -423,7 +423,7 @@ static int histo_v4l2_enum_format(struct file *file, void *fh,
 static int histo_v4l2_get_format(struct file *file, void *fh,
 				 struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_histogram *histo = vdev_to_histo(vfh->vdev);
 	struct v4l2_meta_format *meta = &format->fmt.meta;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index bc66fbdde3cc..656fb5e6cb30 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -896,7 +896,7 @@ static const struct vb2_ops vsp1_video_queue_qops = {
 static int
 vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
@@ -912,7 +912,7 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 static int vsp1_video_enum_format(struct file *file, void *fh,
 				  struct v4l2_fmtdesc *f)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 	const struct vsp1_format_info *info;
 
@@ -933,7 +933,7 @@ static int vsp1_video_enum_format(struct file *file, void *fh,
 static int
 vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 
 	if (format->type != video->queue.type)
@@ -949,7 +949,7 @@ vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 vsp1_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 
 	if (format->type != video->queue.type)
@@ -961,7 +961,7 @@ vsp1_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 	const struct vsp1_format_info *info;
 	int ret;
@@ -991,7 +991,7 @@ vsp1_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 	struct media_device *mdev = &video->vsp1->media_dev;
 	struct vsp1_pipeline *pipe;
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 78e30298c7ad..a777135c6a6c 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1348,7 +1348,7 @@ static int isp_video_open(struct file *file)
 static int isp_video_release(struct file *file)
 {
 	struct isp_video *video = video_drvdata(file);
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct isp_video_fh *handle = to_isp_video_fh(vfh);
 
 	/* Disable streaming and free the buffers queue resources. */
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 18bfa6001909..fcfe0883aba5 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -469,7 +469,7 @@ static const struct vb2_ops xvip_dma_queue_qops = {
 static int
 xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 
 	cap->capabilities = dma->xdev->v4l2_caps | V4L2_CAP_STREAMING |
@@ -491,7 +491,7 @@ xvip_dma_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 static int
 xvip_dma_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 
 	if (f->index > 0)
@@ -505,7 +505,7 @@ xvip_dma_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 static int
 xvip_dma_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 
 	format->fmt.pix = dma->format;
@@ -565,7 +565,7 @@ __xvip_dma_try_format(struct xvip_dma *dma, struct v4l2_pix_format *pix,
 static int
 xvip_dma_try_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 
 	__xvip_dma_try_format(dma, &format->fmt.pix, NULL);
@@ -575,7 +575,7 @@ xvip_dma_try_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 xvip_dma_set_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct xvip_dma *dma = to_xvip_dma(vfh->vdev);
 	const struct xvip_video_format *info;
 
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 229e08ff323e..4cbf6ce314fd 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -26,7 +26,7 @@
 static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
 				  struct v4l2_capability *cap)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_video_chain *chain = stream->chain;
 
@@ -42,7 +42,7 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
 static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
 				    struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 
@@ -60,7 +60,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
 static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 				    struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
@@ -86,7 +86,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 				    struct v4l2_format *format)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct v4l2_meta_format *fmt = &format->fmt.meta;
 	int ret;
@@ -115,7 +115,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
 				      struct v4l2_fmtdesc *fdesc)
 {
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
 	struct uvc_device *dev = stream->dev;
 	u32 i = fdesc->index;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d49a68b36c28..d46b2c8f3d23 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1253,7 +1253,7 @@ EXPORT_SYMBOL(v4l2_querymenu);
 int v4l2_ctrl_log_status(struct file *file, void *fh)
 {
 	struct video_device *vfd = video_devdata(file);
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev)
 		v4l2_ctrl_handler_log_status(vfh->ctrl_handler,
@@ -1348,7 +1348,7 @@ EXPORT_SYMBOL(v4l2_ctrl_subdev_subscribe_event);
  */
 __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	poll_wait(file, &fh->wait, wait);
 	if (v4l2_event_pending(fh))
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index 90eec79ee995..7a5f7aa5e253 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -90,7 +90,7 @@ EXPORT_SYMBOL_GPL(v4l2_fh_exit);
 
 int v4l2_fh_release(struct file *filp)
 {
-	struct v4l2_fh *fh = filp->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
 
 	if (fh) {
 		v4l2_fh_del(fh);
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index eb22d6172462..e67e67f76f72 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -971,7 +971,7 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
-		struct v4l2_fh *fh = file->private_data;
+		struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 		poll_wait(file, &fh->wait, wait);
 		if (v4l2_event_pending(fh))
@@ -1004,7 +1004,7 @@ unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
 					 unsigned long len, unsigned long pgoff,
 					 unsigned long flags)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	unsigned long offset = pgoff << PAGE_SHIFT;
 	struct vb2_queue *vq;
 
@@ -1371,7 +1371,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_request_queue);
 int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
 				struct v4l2_requestbuffers *rb)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_reqbufs(file, fh->m2m_ctx, rb);
 }
@@ -1380,7 +1380,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_reqbufs);
 int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
 				struct v4l2_create_buffers *create)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_create_bufs(file, fh->m2m_ctx, create);
 }
@@ -1389,7 +1389,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_create_bufs);
 int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
 			       struct v4l2_remove_buffers *remove)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct vb2_queue *q = v4l2_m2m_get_vq(fh->m2m_ctx, remove->type);
 
 	if (!q)
@@ -1404,7 +1404,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_remove_bufs);
 int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
 				struct v4l2_buffer *buf)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_querybuf(file, fh->m2m_ctx, buf);
 }
@@ -1413,7 +1413,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_querybuf);
 int v4l2_m2m_ioctl_qbuf(struct file *file, void *priv,
 				struct v4l2_buffer *buf)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
 }
@@ -1422,7 +1422,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_qbuf);
 int v4l2_m2m_ioctl_dqbuf(struct file *file, void *priv,
 				struct v4l2_buffer *buf)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_dqbuf(file, fh->m2m_ctx, buf);
 }
@@ -1431,7 +1431,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_dqbuf);
 int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *priv,
 			       struct v4l2_buffer *buf)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_prepare_buf(file, fh->m2m_ctx, buf);
 }
@@ -1440,7 +1440,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_prepare_buf);
 int v4l2_m2m_ioctl_expbuf(struct file *file, void *priv,
 				struct v4l2_exportbuffer *eb)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_expbuf(file, fh->m2m_ctx, eb);
 }
@@ -1449,7 +1449,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_expbuf);
 int v4l2_m2m_ioctl_streamon(struct file *file, void *priv,
 				enum v4l2_buf_type type)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);
 }
@@ -1458,7 +1458,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamon);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
 				enum v4l2_buf_type type)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_streamoff(file, fh->m2m_ctx, type);
 }
@@ -1542,7 +1542,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
 int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
 			       struct v4l2_encoder_cmd *ec)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_encoder_cmd(file, fh->m2m_ctx, ec);
 }
@@ -1551,7 +1551,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_encoder_cmd);
 int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
 			       struct v4l2_decoder_cmd *dc)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
 }
@@ -1572,7 +1572,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
 int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
 					 struct v4l2_decoder_cmd *dc)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct vb2_v4l2_buffer *out_vb, *cap_vb;
 	struct v4l2_m2m_dev *m2m_dev = fh->m2m_ctx->m2m_dev;
 	unsigned long flags;
@@ -1617,7 +1617,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
 
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	return v4l2_m2m_mmap(file, fh->m2m_ctx, vma);
 }
@@ -1625,7 +1625,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_fop_mmap);
 
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait)
 {
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct v4l2_m2m_ctx *m2m_ctx = fh->m2m_ctx;
 	__poll_t ret;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fd25fea3b58..29d3b788b288 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -122,7 +122,7 @@ static int subdev_close(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 
 	if (sd->internal_ops && sd->internal_ops->close)
@@ -612,7 +612,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
-	struct v4l2_fh *vfh = file->private_data;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
 	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
@@ -1135,7 +1135,7 @@ static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
 
 	if (video_is_registered(vdev)) {
 		struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
-		struct v4l2_fh *vfh = file->private_data;
+		struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 		struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 		struct v4l2_subdev_state *state;
 
@@ -1192,7 +1192,7 @@ static __poll_t subdev_poll(struct file *file, poll_table *wait)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
-	struct v4l2_fh *fh = file->private_data;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 
 	if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
 		return EPOLLERR;
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index b5b3e00c8e6a..823fa8ebeb8f 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -56,6 +56,20 @@ struct v4l2_fh {
 	struct v4l2_m2m_ctx	*m2m_ctx;
 };
 
+/**
+ * file_to_v4l2_fh - Return the v4l2_fh associated with a struct file
+ *
+ * @filp: pointer to &struct file
+ *
+ * This function should be used by drivers to retrieve the &struct v4l2_fh
+ * instance pointer stored in the file private_data instead of accessing the
+ * private_data field directly.
+ */
+static inline struct v4l2_fh *file_to_v4l2_fh(struct file *filp)
+{
+	return filp->private_data;
+}
+
 /**
  * v4l2_fh_init - Initialise the file handle.
  *
-- 
Regards,

Laurent Pinchart


