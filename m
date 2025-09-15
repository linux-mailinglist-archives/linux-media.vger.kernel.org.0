Return-Path: <linux-media+bounces-42569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4CB582F7
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4980A17EDC8
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4328A29D277;
	Mon, 15 Sep 2025 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qgubt4uD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HM7X/dyU"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B828314A;
	Mon, 15 Sep 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956236; cv=none; b=lJFJNpGmVxcXCKLa9D8sMhs5x6QTEkaZ4c+MIF/6Ri2t2w7Iiv4NBHP9BTzL/QgoamZ/faU7CDkqhwItus6JPWw1szsYbEyYBy4TUSiuHWDMncjC9Rn2Lm760O1QgT4I+3swG2KmYlMFbrzuMkEiPW20yv9xFkc9DKgAjag4bIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956236; c=relaxed/simple;
	bh=BpYx3VfijGsukxCibG55P5zh1uNRvjTOiHS9qVEZHbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YX35/q/0L44CFASOp876d1G0FrDcqL5QVU3nf85nxEZTceoofSCERXFTvEdsXGW5Dgptk0HTLyJUUWjX+fmTKlL95gNDITZl0oxKtDnPOOCh//bdxWDlVQlVRyPGnSiYN0dUv28/ml9YjNT+p9b/BRIyM6B0a/Qrsfp6QGr4uKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qgubt4uD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HM7X/dyU; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6EB6B7A016C;
	Mon, 15 Sep 2025 13:10:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 15 Sep 2025 13:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956230;
	 x=1758042630; bh=tfP2yRgWUYI6u47/XNr3sNYz9H6t9Fypa6/OKiHOPMU=; b=
	Qgubt4uDxvxPNjdPpVZM0FnnNQQ9yYExNNF7xEWGgKIdz09ay2kiUWqUlv2ykV9x
	xm3F4qyFke1EvIYqQly6wtrkYAWGeFkn8ZMCf5D/1MRJ6MwoeBp4nWDR7dT+YvZb
	iK7P+qX6u7IPT3m2k7IjCdfO4QNISvUT4tuTxpVNMlwKyN/e2ld55RLwCdHnLXlh
	LaNjCMaiz0yi39LmfUAPnau329WgHStAiylqE1fIRJXV69gm7ZNFoW6BiSbRMyAd
	OYWEmXkSEYA/kAOZh5G3erEEMzUg6TEyH2wett1J6RTKQLE8qAm5MYmDAeeyucdj
	iWgfRUeqA5okR93K/8qugg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956230; x=
	1758042630; bh=tfP2yRgWUYI6u47/XNr3sNYz9H6t9Fypa6/OKiHOPMU=; b=H
	M7X/dyUESKgkeNIWyZKH33gm0glL02UI0p9NsGzH8X9npfSVaZ9Wk85o/uLX5JU0
	xFGjD9fGOJfuKd8cx4OrbUbRz8qmcHk8tbzNYej79z9hcbVj5QoZFC6rFlJt9sKd
	MXsG56I4h3bQtDo+DZZPRG8UJQkF/wcX2Xesl9JOCRni0AbbnCNirnU33sSXBf5F
	GiXE9DKDP0STyZQ8PEpguUQerEUH72HqD1ucew8bJq0C7bNAFKxFFYe/Kz4xWtAV
	5UDGQEtdiGCmA2+ynbeQzLjuyVEqxU7BTPLMUhnr08j6TY2UUMyTwGA60WhuTYDN
	5Jsp5Llx5dkQl3+2y8GAg==
X-ME-Sender: <xms:hkjIaArJ2q8Xs8E04-xy1N8BvtIyJMNF0xtu_ZqLF3Q13XL2O5J_gw>
    <xme:hkjIaOTw2OU5BDrMpTr0jt08WBUQUG0l5-h6h2tlwZ-IHP06W2Z7GpkjpkrW4UFxK
    CnwB4x_jVswrD1WIYg>
X-ME-Received: <xmr:hkjIaC1kZB6xKfdtAv_iOpzDECnmO2dIHES3kAuovWCONzRYHhgApLX8Ast5o-ulznKUv5F76JbYgu8ssYimUY6Szg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:hkjIaCDTxxWFHizyhW88f2I2OlneiBhv9l7FqSrqx71iw80cz_jtCw>
    <xmx:hkjIaGjCLKRscBJTLlQIrmJwc0rrqyEbKjwg3sO-6t3186oJ3y4fwg>
    <xmx:hkjIaMPE1q3WUdLzHSuQT2qTI0W3bYhh7zuoMOEjaPbpP_aOcohXTg>
    <xmx:hkjIaO_2tFfr4kbtzwgbiruepquymGTijIeQxHD-D9UL_PbId97t1A>
    <xmx:hkjIaAOe8DSn--EHQjdgRZYpT3TNTxnqTCfMxQ9kR6YpAU7wv9QLKqwZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 02/12] media: rcar-isp: Add support for ISPCORE
Date: Mon, 15 Sep 2025 19:07:33 +0200
Message-ID: <20250915170743.106249-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Renesas R-Car ISP block consists of two different IP blocks, one
CSI-2 Channel Selector (CSISP) and one traditional ISP for image
operation (ISPCORE). The R-Car ISP driver currently supports the CSISP
functionality as part of the video capture pipeline, this change adds
support for the ISPCORE functionality.

The ISPCORE functionality is further split in two parts, a Renesas
specific part and a Dream Chip Real-time Pixel Processor IP part
(RPPX1). The Renesas part deals with I/O to/from the block while the
RPPX1 part deals with the actual ISP functions.

The RPPX1 functionality is implemented in a support framework (DCT
RPPX1) as this block can be used by different vendors or setups.  This
change deals with the Renesas part of exposing the V4L2 elements needed
for a user-space interface to the RPPX1 and deals with the DMA to/from
the RPP block. It also facilitates the user-space V4L2 API to allow
configuring the RPPX1 using the DCT RPPX1 support framework.

The functionality exposed are one input video device where RAW bayer
frames can be queued for processing, one output video device where the
debayerd image can be read as either ABGR32 or NV16M format. Further
more a video device to queue the image processing parameters to
configure the RPPX1 IPS as well as a video device to read statistics
about the processed image is available.

The parameters and statistics puffer formats piggy back on the Rockchip
RkISP1 format's as the capabilities of the two devices are similar and
this is what the DCT RPPX1 support framework expects.

There is no change in the operation of the CSISP functionality.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/platform/renesas/rcar-isp/Kconfig   |    1 +
 .../media/platform/renesas/rcar-isp/Makefile  |    2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 1053 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    |  790 +++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |   48 +-
 .../platform/renesas/rcar-isp/risp-core.h     |  163 +++
 6 files changed, 2049 insertions(+), 8 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core-io.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/risp-core.h

diff --git a/drivers/media/platform/renesas/rcar-isp/Kconfig b/drivers/media/platform/renesas/rcar-isp/Kconfig
index 242f6a23851f..1621971547e6 100644
--- a/drivers/media/platform/renesas/rcar-isp/Kconfig
+++ b/drivers/media/platform/renesas/rcar-isp/Kconfig
@@ -9,6 +9,7 @@ config VIDEO_RCAR_ISP
 	select VIDEO_V4L2_SUBDEV_API
 	select RESET_CONTROLLER
 	select V4L2_FWNODE
+	select VIDEO_DCT_RPPX1
 	help
 	  Support for Renesas R-Car Image Signal Processor (ISP).
 	  Enable this to support the Renesas R-Car Image Signal
diff --git a/drivers/media/platform/renesas/rcar-isp/Makefile b/drivers/media/platform/renesas/rcar-isp/Makefile
index b542118c831e..c0c80303682c 100644
--- a/drivers/media/platform/renesas/rcar-isp/Makefile
+++ b/drivers/media/platform/renesas/rcar-isp/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-rcar-isp-objs = csisp.o
+rcar-isp-objs = csisp.o core.o core-io.o
 
 obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
new file mode 100644
index 000000000000..e5bae626e134
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -0,0 +1,1053 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+
+#include <linux/rkisp1-config.h>
+
+#include "risp-core.h"
+
+#define risp_io_err(d, fmt, arg...)         dev_err((d)->core->dev, fmt, ##arg)
+
+static struct risp_buffer *risp_io_vb2buf(struct vb2_v4l2_buffer *vb)
+{
+	return container_of(vb, struct risp_buffer, vb);
+}
+
+static int risp_io_open(struct file *file)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+	struct rcar_isp_core *core = io->core;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_deassert(core->csrstc);
+	if (ret)
+		goto err_csrstc;
+
+	ret = clk_prepare_enable(core->clk);
+	if (ret)
+		goto err_clk;
+
+	ret = mutex_lock_interruptible(&io->lock);
+	if (ret)
+		goto err_pm;
+
+	file->private_data = io;
+
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto err_unlock;
+
+	ret = v4l2_pipeline_pm_get(&io->vdev.entity);
+	if (ret < 0)
+		goto err_open;
+
+	mutex_unlock(&io->lock);
+
+	return 0;
+err_open:
+	v4l2_fh_release(file);
+err_unlock:
+	mutex_unlock(&io->lock);
+err_pm:
+	pm_runtime_put(core->dev);
+err_clk:
+	clk_disable_unprepare(core->clk);
+err_csrstc:
+	reset_control_assert(core->csrstc);
+
+	return ret;
+}
+
+static int risp_io_release(struct file *file)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+	struct rcar_isp_core *core = io->core;
+	int ret;
+
+	mutex_lock(&io->lock);
+
+	ret = _vb2_fop_release(file, NULL);
+
+	v4l2_pipeline_pm_put(&io->vdev.entity);
+
+	mutex_unlock(&io->lock);
+
+	clk_disable_unprepare(core->clk);
+
+	pm_runtime_put(core->dev);
+
+	reset_control_assert(core->csrstc);
+
+	return ret;
+}
+
+static const struct v4l2_file_operations risp_io_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= video_ioctl2,
+	.open		= risp_io_open,
+	.release	= risp_io_release,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+	.read		= vb2_fop_read,
+};
+
+/* -----------------------------------------------------------------------------
+ * Common queue
+ */
+
+static int risp_io_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			       unsigned int *nplanes, unsigned int sizes[],
+			       struct device *alloc_devs[])
+
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vq);
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(vq->type)) {
+		const struct v4l2_pix_format_mplane *pix = &io->format.fmt.pix_mp;
+
+		if (*nplanes) {
+			if (*nplanes > pix->num_planes)
+				return -EINVAL;
+
+			for (unsigned int i = 0; i < pix->num_planes; i++)
+				if (sizes[i] < pix->plane_fmt[i].sizeimage)
+					return -EINVAL;
+
+			return 0;
+		}
+
+		*nplanes = pix->num_planes;
+		for (unsigned int i = 0; i < pix->num_planes; i++)
+			sizes[i] = pix->plane_fmt[i].sizeimage;
+	} else {
+		if (*nplanes) {
+			if (sizes[0] < io->format.fmt.meta.buffersize)
+				return -EINVAL;
+
+			return 0;
+		}
+
+		*nplanes = 1;
+		sizes[0] = io->format.fmt.meta.buffersize;
+	}
+
+	/* Initialize buffer queue */
+	INIT_LIST_HEAD(&io->buffers);
+
+	return 0;
+};
+
+static int risp_io_buffer_prepare_set(struct rcar_isp_core_io *io,
+				      struct vb2_buffer *vb, unsigned int plane,
+				      unsigned long size)
+{
+	if (vb2_plane_size(vb, plane) < size) {
+		risp_io_err(io, "Buffer too small (%lu < %lu)\n",
+			    vb2_plane_size(vb, plane), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, plane, size);
+
+	return 0;
+}
+
+static int risp_io_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vb->vb2_queue);
+	int ret = 0;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(vb->vb2_queue->type)) {
+		const struct v4l2_pix_format_mplane *pix = &io->format.fmt.pix_mp;
+
+		for (unsigned int i = 0; i < pix->num_planes; i++) {
+			ret = risp_io_buffer_prepare_set(io, vb, i,
+							 pix->plane_fmt[i].sizeimage);
+			if (ret)
+				break;
+		}
+	} else {
+		ret = risp_io_buffer_prepare_set(io, vb, 0,
+						 io->format.fmt.meta.buffersize);
+	}
+
+	return ret;
+}
+
+static void risp_io_buffer_queue(struct vb2_buffer *vb)
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct risp_buffer *buf = risp_io_vb2buf(vbuf);
+
+	guard(mutex)(&io->core->io_lock);
+
+	list_add_tail(&buf->list, &io->buffers);
+
+	if (risp_core_job_prepare(io->core))
+		risp_io_err(io, "Failed to prepare job\n");
+}
+
+static void risp_io_return_buffers(struct rcar_isp_core_io *io,
+				   enum vb2_buffer_state state)
+{
+	struct risp_buffer *buf, *node;
+
+	lockdep_assert_held(&io->core->io_lock);
+
+	list_for_each_entry_safe(buf, node, &io->buffers, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
+	}
+}
+
+static int risp_io_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vq);
+	int ret;
+
+	scoped_guard(mutex, &io->core->io_lock) {
+		if (io->core->io[RISP_CORE_INPUT1].format.fmt.pix_mp.width !=
+		    io->core->io[RISP_CORE_OUTPUT1].format.fmt.pix_mp.width ||
+		    io->core->io[RISP_CORE_INPUT1].format.fmt.pix_mp.height !=
+		    io->core->io[RISP_CORE_OUTPUT1].format.fmt.pix_mp.height) {
+			risp_io_return_buffers(io, VB2_BUF_STATE_QUEUED);
+			return -EPIPE;
+		}
+
+		io->streaming = true;
+	}
+
+	ret = risp_core_start_streaming(io->core);
+	if (ret) {
+		guard(mutex)(&io->core->io_lock);
+
+		risp_io_return_buffers(io, VB2_BUF_STATE_QUEUED);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void risp_io_stop_streaming(struct vb2_queue *vq)
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vq);
+
+	scoped_guard(mutex, &io->core->io_lock) {
+		io->streaming = false;
+		risp_core_stop_streaming(io->core);
+		risp_io_return_buffers(io, VB2_BUF_STATE_ERROR);
+	}
+
+	/*
+	 * Wait for buffers part of the jobs not yet processed. Note that this
+	 * might complete buffers out of order.
+	 */
+	vb2_wait_for_all_buffers(&io->queue);
+}
+
+/* -----------------------------------------------------------------------------
+ * Common V4L2 IOCTLs
+ */
+
+static int risp_io_querycap(struct file *file, void *priv,
+			    struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Input Exposure
+ */
+
+static int risp_io_input_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				     unsigned int *nplanes, unsigned int sizes[],
+				     struct device *alloc_devs[])
+
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vq);
+	struct rcar_isp_core *core = io->core;
+	struct device *bus_master;
+	int ret;
+
+	ret = risp_io_queue_setup(vq, nbuffers, nplanes, sizes, alloc_devs);
+	if (ret)
+		return ret;
+
+	bus_master = vsp1_isp_get_bus_master(core->vspx.dev);
+	if (IS_ERR_OR_NULL(bus_master)) {
+		risp_io_err(io, "Missing reference to bus-master device\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Allocate buffers using the bus_master device associated with the
+	 * VSPX associated to this ISP instance.
+	 */
+	alloc_devs[0] = bus_master;
+
+	return 0;
+};
+
+static const struct vb2_ops risp_io_input_qops = {
+	.queue_setup		= risp_io_input_queue_setup,
+	.buf_prepare		= risp_io_buffer_prepare,
+	.buf_queue		= risp_io_buffer_queue,
+	.start_streaming	= risp_io_start_streaming,
+	.stop_streaming		= risp_io_stop_streaming,
+};
+
+static const struct v4l2_pix_format_mplane risp_io_input_default_format = {
+	.width = 1920,
+	.height = 1080,
+	.field = V4L2_FIELD_NONE,
+	.pixelformat = V4L2_PIX_FMT_SGRBG8,
+	.colorspace = V4L2_COLORSPACE_RAW,
+	.num_planes = 1,
+	.plane_fmt = {
+		[0] = {
+			.sizeimage = 1920 * 1080,
+			.bytesperline = 1920,
+		},
+	},
+};
+
+static const struct risp_io_input_format {
+	unsigned int fourcc;
+	unsigned int bpp;
+} risp_io_input_formats[] = {
+	{ .fourcc = V4L2_PIX_FMT_SBGGR8,	.bpp = 1 },
+	{ .fourcc = V4L2_PIX_FMT_SGBRG8,	.bpp = 1 },
+	{ .fourcc = V4L2_PIX_FMT_SGRBG8,	.bpp = 1 },
+	{ .fourcc = V4L2_PIX_FMT_SRGGB8,	.bpp = 1 },
+	{ .fourcc = V4L2_PIX_FMT_SBGGR10,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SGBRG10,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SGRBG10,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SRGGB10,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SBGGR12,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SGBRG12,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SGRBG12,	.bpp = 2 },
+	{ .fourcc = V4L2_PIX_FMT_SRGGB12,	.bpp = 2 },
+};
+
+static void risp_io_input_try_format(struct rcar_isp_core_io *io,
+				     struct v4l2_pix_format_mplane *pix)
+{
+	unsigned int bpp = 0;
+
+	v4l_bound_align_image(&pix->width, 128, 5120, 2,
+			      &pix->height, 128, 4096, 2, 0);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
+		if (risp_io_input_formats[i].fourcc == pix->pixelformat) {
+			bpp = risp_io_input_formats[i].bpp;
+			break;
+		}
+	}
+
+	if (!bpp) {
+		pix->pixelformat = risp_io_input_formats[0].fourcc;
+		bpp = risp_io_input_formats[0].bpp;
+	}
+
+	pix->field = V4L2_FIELD_NONE;
+	pix->colorspace = V4L2_COLORSPACE_RAW;
+
+	pix->num_planes = 1;
+	pix->plane_fmt[0].bytesperline = pix->width * bpp;
+	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+}
+
+static int risp_io_input_enum_fmt(struct file *file, void *priv,
+				  struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(risp_io_input_formats))
+		return -EINVAL;
+
+	f->pixelformat = risp_io_input_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int risp_io_input_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	f->fmt.pix_mp = io->format.fmt.pix_mp;
+
+	return 0;
+}
+
+static int risp_io_input_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (vb2_is_busy(&io->queue))
+		return -EBUSY;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	risp_io_input_try_format(io, &f->fmt.pix_mp);
+
+	io->format.fmt.pix_mp = f->fmt.pix_mp;
+
+	return 0;
+}
+
+static int risp_io_input_try_fmt(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	risp_io_input_try_format(io, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int risp_io_input_enum_framesizes(struct file *file, void *fh,
+					 struct v4l2_frmsizeenum *fsize)
+{
+	bool found = false;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(risp_io_input_formats); i++) {
+		if (risp_io_input_formats[i].fourcc == fsize->pixel_format) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+
+	fsize->stepwise.min_width = 128;
+	fsize->stepwise.max_width = 5120;
+	fsize->stepwise.step_width = 2;
+
+	fsize->stepwise.min_height = 128;
+	fsize->stepwise.max_height = 4096;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops risp_io_input_ioctl_ops = {
+	.vidioc_querycap		= risp_io_querycap,
+
+	.vidioc_enum_fmt_vid_out	= risp_io_input_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane	= risp_io_input_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane	= risp_io_input_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane	= risp_io_input_try_fmt,
+	.vidioc_enum_framesizes		= risp_io_input_enum_framesizes,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+/* -----------------------------------------------------------------------------
+ * Parameters
+ *
+ */
+
+/* Max 2048 address + value pairs in one VSPX buffer, increase if needed. */
+#define RISP_IO_PARAMS_BUF_SIZE	16384
+
+static int risp_io_params_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct risp_buffer *buf = risp_io_vb2buf(vbuf);
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vb->vb2_queue);
+	struct rcar_isp_core *core = io->core;
+	size_t size;
+	int ret;
+
+	memset(&buf->vsp_buffer, 0, sizeof(buf->vsp_buffer));
+
+	size = RISP_IO_PARAMS_BUF_SIZE;
+	ret = vsp1_isp_alloc_buffer(core->vspx.dev, size, &buf->vsp_buffer);
+	if (ret)
+		return -EINVAL;
+
+	memset(buf->vsp_buffer.cpu_addr, 0, RISP_IO_PARAMS_BUF_SIZE);
+
+	return 0;
+}
+
+static void risp_io_params_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct risp_buffer *buf = risp_io_vb2buf(vbuf);
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vb->vb2_queue);
+	struct rcar_isp_core *core = io->core;
+
+	vsp1_isp_free_buffer(core->vspx.dev, &buf->vsp_buffer);
+}
+
+struct risp_conf_dma_write_desc {
+	u32 *buf;
+	u32 base;
+	unsigned int count;
+};
+
+static int risp_conf_dma_prepare(void *priv, u32 offset, u32 value)
+{
+	struct risp_conf_dma_write_desc *desc = priv;
+
+	/* Bounds check, 8 bytes = address (4)+ value (4). */
+	if ((desc->count + 1) * 8 > RISP_IO_PARAMS_BUF_SIZE)
+		return -ENOMEM;
+
+	(*desc->buf++) = desc->base | offset;
+	(*desc->buf++) = value;
+
+	desc->count++;
+
+	return 0;
+}
+
+static int risp_io_params_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct rcar_isp_core_io *io = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct risp_buffer *buf = risp_io_vb2buf(vbuf);
+	struct risp_conf_dma_write_desc desc;
+	struct rkisp1_ext_params_cfg *cfg;
+	size_t header_size, payload_size;
+	size_t cfg_size;
+	u32 *cpu_addr;
+	int ret;
+
+	payload_size = vb2_get_plane_payload(vb, 0);
+	header_size = offsetof(struct rkisp1_ext_params_cfg, data);
+
+	/* Validate the buffer payload sizes. */
+	if (payload_size > io->format.fmt.meta.buffersize) {
+		risp_io_err(io, "Too large buffer payload size %zu\n",
+			    payload_size);
+		return -EINVAL;
+	}
+
+	if (payload_size < header_size) {
+		risp_io_err(io,
+			    "Buffer payload %zu smaller than header size %zu\n",
+			    payload_size, header_size);
+		return -EINVAL;
+	}
+
+	/* Validate params header. */
+	cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+
+	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
+		risp_io_err(io,
+			    "Unsupported extensible format version: %u\n",
+			    cfg->version);
+		return -EINVAL;
+	}
+
+	cfg_size = header_size + cfg->data_size;
+	if (cfg_size != payload_size) {
+		risp_io_err(io,
+			    "Data size %zu different than buffer payload size %zu\n",
+			    cfg_size, payload_size);
+		return -EINVAL;
+	}
+
+	/* Prepare params. */
+	cpu_addr = (u32 *)buf->vsp_buffer.cpu_addr;
+
+	desc.buf = cpu_addr + 2;
+	desc.base = io->core->rppaddr;
+	desc.count = 0;
+
+	/* Fill params body. */
+	ret = rppx1_params_rkisp1(io->core->rpp, cfg, risp_conf_dma_prepare, &desc);
+	if (ret)
+		return ret;
+
+	/* Fill params header. */
+	cpu_addr[0] = desc.count;
+	cpu_addr[1] = 0x0;
+
+	return 0;
+}
+
+static const struct vb2_ops risp_io_params_qops = {
+	.queue_setup		= risp_io_queue_setup,
+	.buf_init		= risp_io_params_buf_init,
+	.buf_cleanup		= risp_io_params_buf_cleanup,
+	.buf_prepare		= risp_io_params_buffer_prepare,
+	.buf_queue		= risp_io_buffer_queue,
+	.start_streaming	= risp_io_start_streaming,
+	.stop_streaming		= risp_io_stop_streaming,
+};
+
+static const struct v4l2_meta_format risp_io_params_default_format = {
+	.dataformat = V4L2_META_FMT_RK_ISP1_EXT_PARAMS,
+	.buffersize = sizeof(struct rkisp1_ext_params_cfg),
+};
+
+static int risp_io_params_enum_fmt(struct file *file, void *priv,
+				   struct v4l2_fmtdesc *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_META_OUTPUT || f->index)
+		return -EINVAL;
+
+	f->pixelformat = io->format.fmt.meta.dataformat;
+
+	return 0;
+}
+
+static int risp_io_params_g_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != V4L2_BUF_TYPE_META_OUTPUT)
+		return -EINVAL;
+
+	*meta = io->format.fmt.meta;
+
+	return 0;
+}
+
+static int risp_io_params_s_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (vb2_is_busy(&io->queue))
+		return -EBUSY;
+
+	return risp_io_params_g_fmt(file, priv, f);
+}
+
+static const struct v4l2_ioctl_ops risp_io_params_ioctl_ops = {
+	.vidioc_querycap		= risp_io_querycap,
+
+	.vidioc_enum_fmt_meta_out	= risp_io_params_enum_fmt,
+	.vidioc_g_fmt_meta_out		= risp_io_params_g_fmt,
+	.vidioc_s_fmt_meta_out		= risp_io_params_s_fmt,
+	.vidioc_try_fmt_meta_out	= risp_io_params_g_fmt,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+/* -----------------------------------------------------------------------------
+ * Statistics
+ */
+
+static const struct vb2_ops risp_io_stats_qops = {
+	.queue_setup		= risp_io_queue_setup,
+	.buf_prepare		= risp_io_buffer_prepare,
+	.buf_queue		= risp_io_buffer_queue,
+	.start_streaming	= risp_io_start_streaming,
+	.stop_streaming		= risp_io_stop_streaming,
+};
+
+static const struct v4l2_meta_format risp_io_stats_default_format = {
+	.dataformat = V4L2_META_FMT_RK_ISP1_STAT_3A,
+	.buffersize = sizeof(struct rkisp1_stat_buffer),
+};
+
+static int risp_io_stats_enum_fmt(struct file *file, void *priv,
+				  struct v4l2_fmtdesc *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_META_CAPTURE || f->index)
+		return -EINVAL;
+
+	f->pixelformat = io->format.fmt.meta.dataformat;
+
+	return 0;
+}
+
+static int risp_io_stats_g_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+	struct v4l2_meta_format *meta = &f->fmt.meta;
+
+	if (f->type != V4L2_BUF_TYPE_META_CAPTURE)
+		return -EINVAL;
+
+	*meta = io->format.fmt.meta;
+
+	return 0;
+}
+
+static int risp_io_stats_s_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (vb2_is_busy(&io->queue))
+		return -EBUSY;
+
+	return risp_io_stats_g_fmt(file, priv, f);
+}
+
+static const struct v4l2_ioctl_ops risp_io_stats_ioctl_ops = {
+	.vidioc_querycap		= risp_io_querycap,
+
+	.vidioc_enum_fmt_meta_cap	= risp_io_stats_enum_fmt,
+	.vidioc_g_fmt_meta_cap		= risp_io_stats_g_fmt,
+	.vidioc_s_fmt_meta_cap		= risp_io_stats_s_fmt,
+	.vidioc_try_fmt_meta_cap	= risp_io_stats_g_fmt,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video capture
+ */
+
+static const struct vb2_ops risp_io_capture_qops = {
+	.queue_setup		= risp_io_queue_setup,
+	.buf_prepare		= risp_io_buffer_prepare,
+	.buf_queue		= risp_io_buffer_queue,
+	.start_streaming	= risp_io_start_streaming,
+	.stop_streaming		= risp_io_stop_streaming,
+};
+
+static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
+	.width = 1920,
+	.height = 1080,
+	.pixelformat = V4L2_PIX_FMT_XBGR32,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.num_planes = 1,
+	.plane_fmt = {
+		[0] = {
+			.bytesperline = ALIGN(1920 * 4, 256),
+			.sizeimage = ALIGN(1920 * 4, 256) * 1080,
+		},
+	},
+};
+
+static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
+				       struct v4l2_pix_format_mplane *pix)
+{
+	v4l_bound_align_image(&pix->width, 128, 5120, 2,
+			      &pix->height, 128, 4096, 2, 0);
+
+	pix->field = V4L2_FIELD_NONE;
+	pix->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV16M:
+		pix->num_planes = 2;
+		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
+		break;
+	default:
+		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
+		pix->num_planes = 1;
+		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
+		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+		break;
+	}
+}
+
+static int risp_io_capture_enum_fmt(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	switch (f->index) {
+	case 0:
+		f->pixelformat = V4L2_PIX_FMT_NV16M;
+		break;
+	case 1:
+		f->pixelformat = V4L2_PIX_FMT_XBGR32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int risp_io_capture_g_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	f->fmt.pix_mp = io->format.fmt.pix_mp;
+
+	return 0;
+}
+
+static int risp_io_capture_s_fmt(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	if (vb2_is_busy(&io->queue))
+		return -EBUSY;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	risp_io_capture_try_format(io, &f->fmt.pix_mp);
+
+	io->format.fmt.pix_mp = f->fmt.pix_mp;
+
+	return 0;
+}
+
+static int risp_io_capture_try_fmt(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct rcar_isp_core_io *io = video_drvdata(file);
+
+	risp_io_capture_try_format(io, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
+					   struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	switch (fsize->pixel_format) {
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_XBGR32:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+
+	fsize->stepwise.min_width = 128;
+	fsize->stepwise.max_width = 5120;
+	fsize->stepwise.step_width = 2;
+
+	fsize->stepwise.min_height = 128;
+	fsize->stepwise.max_height = 4096;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops risp_io_capture_ioctl_ops = {
+	.vidioc_querycap		= risp_io_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= risp_io_capture_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane	= risp_io_capture_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= risp_io_capture_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane	= risp_io_capture_try_fmt,
+	.vidioc_enum_framesizes		= risp_io_capture_enum_framesizes,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+/* -----------------------------------------------------------------------------
+ * Create and remove IO video devices
+ */
+
+int risp_core_io_create(struct device *dev, struct rcar_isp_core *core,
+			struct rcar_isp_core_io *io, unsigned int pad)
+{
+	struct video_device *vdev = &io->vdev;
+	struct vb2_queue *q = &io->queue;
+	int ret;
+
+	switch (pad) {
+	case RISP_CORE_INPUT1:
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s input1",
+			 KBUILD_MODNAME, dev_name(dev));
+		vdev->vfl_dir = VFL_DIR_TX;
+		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
+		vdev->ioctl_ops = &risp_io_input_ioctl_ops;
+
+		q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+		q->ops = &risp_io_input_qops;
+
+		io->pad.flags = MEDIA_PAD_FL_SOURCE;
+		io->format.fmt.pix_mp = risp_io_input_default_format;
+		break;
+
+	case RISP_CORE_PARAMS:
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s params",
+			 KBUILD_MODNAME, dev_name(dev));
+		vdev->vfl_dir = VFL_DIR_TX;
+		vdev->device_caps = V4L2_CAP_META_OUTPUT;
+		vdev->ioctl_ops = &risp_io_params_ioctl_ops;
+
+		q->type = V4L2_BUF_TYPE_META_OUTPUT;
+		q->ops = &risp_io_params_qops;
+
+		io->pad.flags = MEDIA_PAD_FL_SOURCE;
+		io->format.fmt.meta = risp_io_params_default_format;
+		break;
+
+	case RISP_CORE_STATS:
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s stats",
+			 KBUILD_MODNAME, dev_name(dev));
+		vdev->vfl_dir = VFL_DIR_RX;
+		vdev->device_caps = V4L2_CAP_META_CAPTURE;
+		vdev->ioctl_ops = &risp_io_stats_ioctl_ops;
+
+		q->type = V4L2_BUF_TYPE_META_CAPTURE;
+		q->ops = &risp_io_stats_qops;
+
+		io->pad.flags = MEDIA_PAD_FL_SINK;
+		io->format.fmt.meta = risp_io_stats_default_format;
+		break;
+
+	case RISP_CORE_OUTPUT1:
+		snprintf(vdev->name, sizeof(vdev->name), "%s %s output1",
+			 KBUILD_MODNAME, dev_name(dev));
+		vdev->vfl_dir = VFL_DIR_RX;
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+		vdev->ioctl_ops = &risp_io_capture_ioctl_ops;
+
+		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		q->ops = &risp_io_capture_qops;
+
+		io->pad.flags = MEDIA_PAD_FL_SINK;
+		io->format.fmt.pix_mp = risp_io_capture_default_format;
+		break;
+	}
+
+	io->core = core;
+
+	mutex_init(&io->lock);
+	INIT_LIST_HEAD(&io->buffers);
+
+	/* Create media graph pad. */
+	ret = media_entity_pads_init(&io->vdev.entity, 1, &io->pad);
+	if (ret)
+		return ret;
+
+	/* Create queue */
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->lock = &io->lock;
+	q->drv_priv = io;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct risp_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = dev;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		risp_io_err(io, "Failed to initialize VB2 queue\n");
+		return ret;
+	}
+
+	/* Create video device */
+	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->queue = &io->queue;
+
+	vdev->release = video_device_release_empty;
+	vdev->lock = &io->lock;
+	vdev->fops = &risp_io_fops;
+
+	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		risp_io_err(io, "Failed to register video device\n");
+		return ret;
+	}
+
+	video_set_drvdata(&io->vdev, io);
+
+	v4l2_info(&core->v4l2_dev, "Device registered as %s\n",
+		  video_device_node_name(vdev));
+
+	switch (pad) {
+	case RISP_CORE_INPUT1:
+	case RISP_CORE_PARAMS:
+		ret = media_create_pad_link(&io->vdev.entity, 0,
+					    &core->subdev.entity, pad,
+					    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+		break;
+	case RISP_CORE_STATS:
+	case RISP_CORE_OUTPUT1:
+		ret = media_create_pad_link(&core->subdev.entity, pad,
+					    &io->vdev.entity, 0,
+					    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+		break;
+	}
+
+	return ret;
+}
+
+void risp_core_io_destory(struct rcar_isp_core_io *io)
+{
+	if (!video_is_registered(&io->vdev))
+		return;
+
+	video_unregister_device(&io->vdev);
+}
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
new file mode 100644
index 000000000000..b63a3234c37b
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -0,0 +1,790 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/of_platform.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/vsp1.h>
+
+#include "risp-core.h"
+
+#define ISP_CS_STREAMER_MODE_REG				0x7000
+#define ISP_CS_STREAMER_MODE_STREAMER_EN			0xf
+
+#define ISP_CS_STREAMER_VBLANK_REG				0x7004
+#define ISP_CS_STREAMER_HBLANK_REG				0x7008
+
+#define ISP_CS_STREAMER_CONFIG_DMA_CONTROL_REG			0x7100
+#define ISP_CS_STREAMER_CONFIG_DMA_REG_ADDRESS_UPPER_8BIT_MASK	GENMASK(31, 24)
+#define ISP_CS_STREAMER_CONFIG_DMA_ENABLE0			BIT(0)
+
+#define ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_REG			0x2100
+#define ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_ENABLE1		BIT(31)
+#define ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_CONFIG_DATA_START_REG_ADDRESS_MASK	GENMASK(15, 0)
+
+#define ISP_CS_STREAMER_CONFIG_DMA_CONTROL2_REG			0x2104
+
+#define ISP_CORE_ISPCORE_INT_STATUS			    0x80000
+#define ISP_CORE_ISPCORE_INT_ENABLE			    0x80004
+#define ISPCORE_DMA_IMAGE_FRAME_MODE(i, f)		    (0x84000 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(i, f)	    (0x84004 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(i, f) (0x84008 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(i, f)		    (0x8400c + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP0(i, f)    (0x84010 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP1(i, f)    (0x84014 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP2(i, f)    (0x84018 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP3(i, f)    (0x8401c + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(i, f)	    (0x84020 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP1(i, f)	    (0x84024 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP2(i, f)	    (0x84028 + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP3(i, f)	    (0x8402c + 0x1000 * (i) + 0x100 * (f))
+#define ISPCORE_DMA_IMAGE_FRAME_AXI_ID(i, f)		    (0x84030 + 0x1000 * (i) + 0x100 * (f))
+
+#define ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(i)			(0x84400 + 0x1000 * (i))
+#define ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_MASK	GENMASK(31, 16)
+#define ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT	16
+
+#define ISPCORE_DMA_IMAGE_AXI_CONFIG_REG(i)			(0x84800 + 0x1000 * (i))
+
+static void risp_cs_write(struct rcar_isp_core *core, u32 offset, u32 value)
+{
+	iowrite32(value, core->csbase + offset);
+}
+
+static u32 risp_cs_read(struct rcar_isp_core *core, u32 offset)
+{
+	return ioread32(core->csbase + offset);
+}
+
+static void risp_core_write(struct rcar_isp_core *core, u32 offset, u32 value)
+{
+	iowrite32(value, core->base + offset);
+}
+
+static u32 risp_core_read(struct rcar_isp_core *core, u32 offset)
+{
+	return ioread32(core->base + offset);
+}
+
+static void risp_core_job_run_params(struct rcar_isp_core *core,
+				     struct vsp1_isp_job_desc *vspx_job,
+				     struct risp_buffer *buf)
+{
+	u32 *params_buf = (u32 *)buf->vsp_buffer.cpu_addr;
+	bool have_config = !!params_buf[0];
+	u32 ctrl0, ctrl1, ctrl2;
+
+	/*
+	 * If we have a configuration but not asked the VSPX to programme it,
+	 * use MMIO to write the configuration. This might be needed to work
+	 * around limitations of the VSPX ConfigDMA.
+	 */
+	if (have_config && !vspx_job->config.pairs) {
+		for (unsigned int i = 0; i < params_buf[0]; i++)
+			risp_core_write(core, params_buf[2 + i * 2] & 0xffff,
+					params_buf[3 + i * 2]);
+
+		/* Disable ConfigDMA. */
+		have_config = false;
+	}
+
+	ctrl0 = risp_cs_read(core, ISP_CS_STREAMER_CONFIG_DMA_CONTROL_REG) &
+		~ISP_CS_STREAMER_CONFIG_DMA_ENABLE0;
+	ctrl1 = risp_cs_read(core, ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_REG) &
+		~(ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_ENABLE1 | 0xffff);
+	ctrl2 = 0;
+
+	if (have_config) {
+		ctrl0 |= ISP_CS_STREAMER_CONFIG_DMA_ENABLE0;
+		ctrl1 |= ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_ENABLE1 |
+			(params_buf[2] & 0xffff);
+		ctrl2 = params_buf[3];
+	}
+
+	risp_cs_write(core, ISP_CS_STREAMER_CONFIG_DMA_CONTROL_REG, ctrl0);
+	risp_cs_write(core, ISP_CS_STREAMER_CONFIG_DMA_CONTROL1_REG, ctrl1);
+	risp_cs_write(core, ISP_CS_STREAMER_CONFIG_DMA_CONTROL2_REG, ctrl2);
+}
+
+static void risp_core_job_run_output(struct rcar_isp_core *core,
+				     struct risp_buffer *buf)
+{
+	const struct v4l2_format *fmt = &core->io[RISP_CORE_OUTPUT1].format;
+	dma_addr_t mem;
+	u32 reg;
+
+	for (unsigned int frame = 0; frame < 4; frame++) {
+		reg = ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP0(0, frame);
+		mem = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		risp_core_write(core, reg, mem);
+
+		/* Only NV16 uses 2 planes. */
+		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV16M)
+			continue;
+
+		reg = ISPCORE_DMA_IMAGE_FRAME_BASE_ADDRESS_COMP1(0, frame);
+		mem = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 1);
+		risp_core_write(core, reg, mem);
+	}
+}
+
+static void risp_core_job_run(struct rcar_isp_core *core)
+{
+	struct rcar_isp_job *job;
+
+	lockdep_assert_held(&core->lock);
+
+	/* ISP not yet started, nothing to do. */
+	if (!core->streaming)
+		return;
+
+	/* If we have active buffers in the ISP core, nothing to do. */
+	if (core->vspx.job)
+		return;
+
+	job = list_first_entry_or_null(&core->risp_jobs,
+				       struct rcar_isp_job,
+				       job_queue);
+	if (!job)
+		return;
+
+	list_del(&job->job_queue);
+
+	core->vspx.job = job;
+
+	/* Program the ISP register before kicking the VSPX. */
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		struct risp_buffer *buf = job->buffers[i];
+
+		switch (i) {
+		case RISP_CORE_PARAMS:
+			risp_core_job_run_params(core, &job->vspx_job, buf);
+			break;
+		case RISP_CORE_OUTPUT1:
+			risp_core_job_run_output(core, buf);
+			break;
+		}
+	}
+
+	if (vsp1_isp_job_run(core->vspx.dev, &job->vspx_job)) {
+		/*
+		 * Release all buffers in this job if running on the VSPX
+		 * failed. Userspace should recover from this, no new jobs are
+		 * scheduled.
+		 */
+		for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+			struct risp_buffer *buf = job->buffers[i];
+
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		vsp1_isp_job_release(core->vspx.dev, &job->vspx_job);
+		core->vspx.job = NULL;
+		kfree(job);
+
+		dev_err(core->dev, "Failed to run job");
+	}
+}
+
+static int risp_core_pixfmt_to_vspx(u32 pixfmt)
+{
+	switch (pixfmt) {
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+		return V4L2_PIX_FMT_GREY;
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		return V4L2_PIX_FMT_Y10;
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SRGGB12:
+		return V4L2_PIX_FMT_Y12;
+	default:
+		return -EINVAL;
+	}
+}
+
+int risp_core_job_prepare(struct rcar_isp_core *core)
+{
+	struct vsp1_isp_job_desc *vspx_job;
+	int vspx_pixfmt = -EINVAL;
+	struct rcar_isp_job *job;
+	int ret;
+
+	lockdep_assert_held(&core->io_lock);
+
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		if (list_empty(&core->io[i].buffers))
+			return 0;
+	}
+
+	/* Memory is released when the job is consumed. */
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	vspx_job = &job->vspx_job;
+
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		struct risp_buffer *buf;
+
+		/*
+		 * Extract buffer from the IO queue and save a reference in
+		 * the job description. Buffers will be completed when the
+		 * corresponding frame will be completed by the ISP.
+		 */
+		buf = list_first_entry_or_null(&core->io[i].buffers,
+					       struct risp_buffer, list);
+		if (!buf) {
+			ret = -EINVAL;
+			goto error_return_buffers;
+		}
+
+		switch (i) {
+		case RISP_CORE_INPUT1: {
+			u32 isp_pixfmt = core->io[i].format.fmt.pix_mp.pixelformat;
+
+			vspx_pixfmt = risp_core_pixfmt_to_vspx(isp_pixfmt);
+
+			vspx_job->img.fmt = core->io[i].format.fmt.pix_mp;
+			vspx_job->img.fmt.pixelformat = vspx_pixfmt;
+			vspx_job->img.mem =
+				vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf,
+							      0);
+			break;
+		}
+		case RISP_CORE_PARAMS: {
+			/*
+			 * Work around undocumented behavior of the ConfigDMA
+			 * interface by using MMIO if 16 or less pairs are to
+			 * be programmed.
+			 *
+			 * Programing 15 or less pairs corrupts the image data
+			 * following the config buffer, programing exactly 16
+			 * pairs freeze the whole VSPX.
+			 */
+			u32 *params_buf = (u32 *)buf->vsp_buffer.cpu_addr;
+
+			if (params_buf[0] <= 16) {
+				vspx_job->config.pairs = 0;
+			} else {
+				vspx_job->config.pairs = params_buf[0];
+				vspx_job->config.mem = buf->vsp_buffer.dma_addr;
+			}
+			break;
+		}
+		}
+
+		list_del(&buf->list);
+		job->buffers[i] = buf;
+	}
+
+	if (vspx_pixfmt < 0) {
+		ret = -EINVAL;
+		goto error_return_buffers;
+	}
+
+	ret = vsp1_isp_job_prepare(core->vspx.dev, &job->vspx_job);
+	if (ret)
+		goto error_return_buffers;
+
+	scoped_guard(spinlock_irqsave, &core->lock) {
+		list_add_tail(&job->job_queue, &core->risp_jobs);
+		risp_core_job_run(core);
+	}
+
+	return 0;
+
+error_return_buffers:
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		if (!job->buffers[i])
+			continue;
+
+		vb2_buffer_done(&job->buffers[i]->vb.vb2_buf,
+				VB2_BUF_STATE_ERROR);
+	}
+	kfree(job);
+	return ret;
+}
+
+static int risp_core_config_output(struct rcar_isp_core *core,
+				   unsigned int index,
+				   const struct v4l2_pix_format_mplane *pix)
+{
+	/* For all frame capture slots. */
+	for (unsigned int frame = 0; frame < 4; frame++) {
+		switch (pix->pixelformat) {
+		case V4L2_PIX_FMT_NV16M:
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
+					1);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(index, frame),
+					0 << 24 | 0 << 16 | 4 << 8 | 16 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(index, frame),
+					0 << 24 | 0 << 16 | 7 << 8 | 7 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(index, frame),
+					0 << 28 | 0 << 24 |
+					0 << 20 | 0 << 16 |
+					3 << 12 | 0 << 8 |
+					3 << 4  | 0 << 0);
+
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(index, frame),
+					pix->plane_fmt[0].bytesperline);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP1(index, frame),
+					pix->plane_fmt[0].bytesperline);
+			break;
+		case V4L2_PIX_FMT_XBGR32:
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
+					0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(index, frame),
+					0 << 24 | 0 << 16 | 0 << 8 | 0 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(index, frame),
+					0 << 24 | 0 << 16 | 0 << 8 | 23 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(index, frame),
+					0 << 28 | 0 << 24 |
+					0 << 20 | 0 << 16 |
+					0 << 12 | 0 << 8 |
+					3 << 4  | 2 << 0);
+
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(index, frame),
+					pix->plane_fmt[0].bytesperline);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		risp_core_write(core,
+				ISPCORE_DMA_IMAGE_FRAME_AXI_ID(index, frame),
+				0);
+	}
+
+	/* Set image out flush EOF. */
+	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
+			pix->plane_fmt[0].bytesperline <<
+			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
+
+	/* Enable DMA and set burst length. */
+	risp_core_write(core, ISPCORE_DMA_IMAGE_AXI_CONFIG_REG(index),
+			BIT(31) | 7);
+
+	return 0;
+}
+
+static u32 risp_core_pix2bus(const struct rcar_isp_core_io *io)
+{
+	switch (io->format.fmt.pix_mp.pixelformat) {
+	case V4L2_PIX_FMT_SBGGR8:
+		return MEDIA_BUS_FMT_SBGGR8_1X8;
+	case V4L2_PIX_FMT_SGBRG8:
+		return MEDIA_BUS_FMT_SGBRG8_1X8;
+	case V4L2_PIX_FMT_SGRBG8:
+		return MEDIA_BUS_FMT_SGRBG8_1X8;
+	case V4L2_PIX_FMT_SRGGB8:
+		return MEDIA_BUS_FMT_SRGGB8_1X8;
+	case V4L2_PIX_FMT_SBGGR10:
+		return MEDIA_BUS_FMT_SBGGR10_1X10;
+	case V4L2_PIX_FMT_SGBRG10:
+		return MEDIA_BUS_FMT_SGBRG10_1X10;
+	case V4L2_PIX_FMT_SGRBG10:
+		return MEDIA_BUS_FMT_SGRBG10_1X10;
+	case V4L2_PIX_FMT_SRGGB10:
+		return MEDIA_BUS_FMT_SRGGB10_1X10;
+	case V4L2_PIX_FMT_SBGGR12:
+		return MEDIA_BUS_FMT_SBGGR12_1X12;
+	case V4L2_PIX_FMT_SGBRG12:
+		return MEDIA_BUS_FMT_SGBRG12_1X12;
+	case V4L2_PIX_FMT_SGRBG12:
+		return MEDIA_BUS_FMT_SGRBG12_1X12;
+	case V4L2_PIX_FMT_SRGGB12:
+		return MEDIA_BUS_FMT_SRGGB12_1X12;
+	case V4L2_PIX_FMT_XBGR32:
+		return MEDIA_BUS_FMT_RGB888_1X24;
+	case V4L2_PIX_FMT_NV16M:
+		return MEDIA_BUS_FMT_YUYV12_1X24;
+	default:
+		return 0;
+	}
+}
+
+int risp_core_start_streaming(struct rcar_isp_core *core)
+{
+	struct vsp1_vspx_frame_end vspx_fe = {};
+	unsigned long flags;
+	int ret;
+
+	struct v4l2_mbus_framefmt inputfmt = {
+		.width = core->io[RISP_CORE_INPUT1].format.fmt.pix_mp.width,
+		.height = core->io[RISP_CORE_INPUT1].format.fmt.pix_mp.height,
+		.code = risp_core_pix2bus(&core->io[RISP_CORE_INPUT1]),
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization = V4L2_QUANTIZATION_DEFAULT,
+		.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+	};
+
+	struct v4l2_mbus_framefmt hvout = {
+		.width = core->io[RISP_CORE_OUTPUT1].format.fmt.pix_mp.width,
+		.height = core->io[RISP_CORE_OUTPUT1].format.fmt.pix_mp.height,
+		.code = risp_core_pix2bus(&core->io[RISP_CORE_OUTPUT1]),
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization = V4L2_QUANTIZATION_DEFAULT,
+		.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+	};
+
+	scoped_guard(mutex, &core->io_lock) {
+		for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+			if (!core->io[i].streaming)
+				return false;
+		}
+	}
+
+	spin_lock_irqsave(&core->lock, flags);
+
+	if (core->streaming) {
+		spin_unlock_irqrestore(&core->lock, flags);
+		return 0;
+	}
+
+	/* Reset and wait for ISP core to initialize itself. */
+	reset_control_reset(core->rstc);
+	udelay(2000); /* Busy sleep when reset as we hold the spinlock. */
+
+	risp_core_write(core, ISP_CORE_ISPCORE_INT_ENABLE, 1);
+
+	/* Configure output DMA */
+	risp_core_config_output(core, 0,
+				&core->io[RISP_CORE_OUTPUT1].format.fmt.pix_mp);
+
+	risp_cs_write(core, ISP_CS_STREAMER_VBLANK_REG, inputfmt.width * 25);
+	risp_cs_write(core, ISP_CS_STREAMER_HBLANK_REG, 64);
+
+	/* Enable ISP Streaming bridge. */
+	risp_cs_write(core, ISP_CS_STREAMER_MODE_REG,
+		      ISP_CS_STREAMER_MODE_STREAMER_EN);
+
+	/* Start RPP ISP */
+	ret = rppx1_start(core->rpp, &inputfmt, &hvout, NULL);
+	if (ret) {
+		spin_unlock_irqrestore(&core->lock, flags);
+		return ret;
+	}
+
+	core->vspx.job = NULL;
+	core->sequence = 0;
+	core->streaming = true;
+	spin_unlock_irqrestore(&core->lock, flags);
+
+	/* Start VSPX */
+	vsp1_isp_start_streaming(core->vspx.dev, &vspx_fe);
+
+	scoped_guard(spinlock_irqsave, &core->lock) {
+		risp_core_job_run(core);
+	}
+
+	return 0;
+}
+
+static void risp_core_jobs_release(struct rcar_isp_core *core)
+{
+	struct rcar_isp_job *job, *tmp;
+
+	job = core->vspx.job;
+	if (job) {
+		/*
+		 * No need to release the VSPX job has it has been scheduled
+		 * already and it will complete.
+		 *
+		 * Only return buffer and free the job descriptor.
+		 */
+
+		for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+			struct risp_buffer *buf = job->buffers[i];
+
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		kfree(job);
+		core->vspx.job = NULL;
+	}
+
+	list_for_each_entry_safe(job, tmp, &core->risp_jobs, job_queue) {
+		vsp1_isp_job_release(core->vspx.dev, &job->vspx_job);
+
+		for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+			struct risp_buffer *buf = job->buffers[i];
+
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		list_del(&job->job_queue);
+		kfree(job);
+	}
+}
+
+void risp_core_stop_streaming(struct rcar_isp_core *core)
+{
+	/*
+	 * This function releases buffers and jobs: make sure the queues mutex
+	 * is held.
+	 */
+	lockdep_assert_held(&core->io_lock);
+
+	scoped_guard(spinlock_irqsave, &core->lock) {
+		/*
+		 * New jobs might be posted before the ISP is stopped: make sure
+		 * we clear all pending jobs in every call of stop_streaming.
+		 */
+		risp_core_jobs_release(core);
+
+		if (!core->streaming)
+			return;
+
+		rppx1_stop(core->rpp);
+		risp_cs_write(core, ISP_CS_STREAMER_MODE_REG, 0);
+		risp_core_write(core, ISP_CORE_ISPCORE_INT_ENABLE, 0);
+
+		core->streaming = false;
+	}
+
+	vsp1_isp_stop_streaming(core->vspx.dev);
+}
+
+static irqreturn_t risp_core_irq(int irq, void *data)
+{
+	struct rcar_isp_core *core = data;
+	struct rcar_isp_job *job;
+	u32 status;
+
+	status = risp_core_read(core, ISP_CORE_ISPCORE_INT_STATUS);
+	if (!(status & BIT(0)))
+		return IRQ_NONE;
+
+	if (!rppx1_interrupt(core->rpp, &status))
+		return IRQ_HANDLED;
+
+	guard(spinlock_irqsave)(&core->lock);
+
+	job = core->vspx.job;
+	if (!job)
+		return IRQ_HANDLED;
+
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		struct risp_buffer *buf;
+
+		buf = job->buffers[i];
+
+		switch (i) {
+		case RISP_CORE_STATS:
+			rppx1_stats_fill_isr(core->rpp, status,
+					     vb2_plane_vaddr(&buf->vb.vb2_buf, 0));
+			fallthrough;
+		case RISP_CORE_OUTPUT1:
+		case RISP_CORE_INPUT1:
+			buf->vb.sequence = core->sequence;
+			buf->vb.vb2_buf.timestamp = ktime_get_ns();
+			fallthrough;
+		case RISP_CORE_PARAMS:
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+			break;
+		}
+	}
+
+	core->vspx.job = NULL;
+	kfree(job);
+
+	core->sequence++;
+
+	/* Kickoff processing of next frame (if any). */
+	risp_core_job_run(core);
+
+	return IRQ_HANDLED;
+}
+
+static const struct v4l2_subdev_ops risp_core_subdev_ops = {
+};
+
+static int risp_core_create_subdev(struct rcar_isp_core *core)
+{
+	struct v4l2_subdev *subdev = &core->subdev;
+	int ret;
+
+	subdev->owner = THIS_MODULE;
+	subdev->dev = core->dev;
+	v4l2_subdev_init(subdev, &risp_core_subdev_ops);
+	v4l2_set_subdevdata(subdev, core->dev);
+	snprintf(subdev->name, sizeof(subdev->name), "%s %s core",
+		 KBUILD_MODNAME, dev_name(core->dev));
+	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	subdev->entity.function = MEDIA_ENT_F_VID_MUX;
+
+	core->pads[RISP_CORE_INPUT1].flags = MEDIA_PAD_FL_SINK;
+	core->pads[RISP_CORE_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	core->pads[RISP_CORE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	core->pads[RISP_CORE_OUTPUT1].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&subdev->entity, RISP_CORE_NUM_PADS,
+				     core->pads);
+	if (ret)
+		return ret;
+
+	dev_info(core->dev, "Registered ISP core\n");
+
+	return 0;
+}
+
+int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd)
+{
+	int ret;
+
+	core->v4l2_dev.mdev = sd->v4l2_dev->mdev;
+
+	/* Register ISP Core subdevice. */
+	ret = v4l2_device_register_subdev(&core->v4l2_dev, &core->subdev);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++) {
+		ret = risp_core_io_create(core->dev, core, &core->io[i], i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int risp_core_probe_resources(struct rcar_isp_core *core,
+				     struct platform_device *pdev)
+{
+	struct platform_device *vspx;
+	struct device_node *of_vspx;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
+	if (!res)
+		return -ENODEV;
+
+	core->rppaddr = res->start;
+	core->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(core->base))
+		return PTR_ERR(core->base);
+
+	ret = platform_get_irq_byname(pdev, "core");
+	if (ret < 0)
+		return -ENODEV;
+
+	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		return ret;
+
+	core->clk = devm_clk_get(&pdev->dev, "core");
+	if (IS_ERR(core->clk))
+		return -ENODEV;
+
+	core->rstc = devm_reset_control_get(&pdev->dev, "core");
+	if (IS_ERR(core->rstc))
+		return -ENODEV;
+
+	of_vspx = of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
+	if (!of_vspx)
+		return -ENODEV;
+
+	vspx = of_find_device_by_node(of_vspx);
+	if (!vspx)
+		return -ENODEV;
+
+	/* Attach to VSP-X */
+	core->vspx.dev = &vspx->dev;
+
+	ret = vsp1_isp_init(&vspx->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Attach ro the RPP library
+	 *
+	 * 1. Start and wait for the ISP to startup.
+	 * 2. Attach the RPP library and talk with the RPP ISP.
+	 * 3. Turn off ISP.
+	 * 4. Fail if the RPP is unhappy with the hardware.
+	 */
+	ret = clk_prepare_enable(core->clk);
+	if (ret)
+		return ret;
+
+	usleep_range(2000, 4000);
+
+	core->rpp = rppx1_create(core->base);
+
+	clk_disable_unprepare(core->clk);
+
+	if (!core->rpp)
+		return -ENODEV;
+
+	return 0;
+}
+
+int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
+		    void __iomem *csbase, struct reset_control *csrstc)
+{
+	int ret;
+
+	core->dev = &pdev->dev;
+	core->csrstc = csrstc;
+	core->csbase = csbase;
+
+	ret = risp_core_probe_resources(core, pdev);
+	if (ret) {
+		core->base = 0;
+		return ret;
+	}
+
+	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = risp_core_create_subdev(core);
+	if (ret)
+		return ret;
+
+	mutex_init(&core->io_lock);
+	spin_lock_init(&core->lock);
+	INIT_LIST_HEAD(&core->risp_jobs);
+
+	return 0;
+}
+
+void risp_core_remove(struct rcar_isp_core *core)
+{
+	/* If we did not probe the ISP core, nothing to do. */
+	if (!core->base)
+		return;
+
+	dev_info(core->dev, "Remove ISP Core\n");
+
+	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
+		risp_core_io_destory(&core->io[i]);
+
+	mutex_destroy(&core->io_lock);
+	rppx1_destroy(core->rpp);
+}
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 1eb29a0b774a..9d8571916c96 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -11,14 +11,13 @@
  */
 
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/reset.h>
 
 #include <media/mipi-csi2.h>
-#include <media/v4l2-subdev.h>
+#include <media/v4l2-async.h>
+
+#include "risp-core.h"
 
 #define ISPINPUTSEL0_REG				0x0008
 #define ISPINPUTSEL0_SEL_CSI0				BIT(31)
@@ -161,6 +160,7 @@ struct rcar_isp {
 	struct device *dev;
 	void __iomem *csbase;
 	struct reset_control *rstc;
+	struct rcar_isp_core core;
 
 	enum rcar_isp_input csi_input;
 
@@ -454,6 +454,21 @@ static int risp_parse_dt(struct rcar_isp *isp)
 	return ret;
 }
 
+/* -----------------------------------------------------------------------------
+ * ISP Core connection
+ */
+
+static int risp_cs_registered(struct v4l2_subdev *sd)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+
+	return risp_core_registered(&isp->core, sd);
+}
+
+static const struct v4l2_subdev_internal_ops risp_cs_internal_ops = {
+	.registered = risp_cs_registered,
+};
+
 /* -----------------------------------------------------------------------------
  * Platform Device Driver
  */
@@ -480,7 +495,7 @@ static int risp_probe_resources(struct rcar_isp *isp,
 	if (IS_ERR(isp->csbase))
 		return PTR_ERR(isp->csbase);
 
-	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
+	isp->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
 
 	return PTR_ERR_OR_ZERO(isp->rstc);
 }
@@ -544,14 +559,31 @@ static int risp_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_notifier;
 
-	ret = v4l2_async_register_subdev(&isp->subdev);
-	if (ret < 0)
+	ret = risp_core_probe(&isp->core, pdev, isp->csbase, isp->rstc);
+	switch (ret) {
+	case 0:
+		/* The device have an ISP core. */
+		isp->subdev.internal_ops = &risp_cs_internal_ops;
+		break;
+	case -ENODEV:
+		/* The device don't have an ISP core, that is OK. */
+		ret = 0;
+		break;
+	default:
+		/* Something went wrong registering the ISP core. */
 		goto error_subdev;
+	}
+
+	ret = v4l2_async_register_subdev(&isp->subdev);
+	if (ret < 0)
+		goto error_core;
 
 	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
 
 	return 0;
 
+error_core:
+	risp_core_remove(&isp->core);
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
 error_notifier:
@@ -567,6 +599,8 @@ static void risp_remove(struct platform_device *pdev)
 {
 	struct rcar_isp *isp = platform_get_drvdata(pdev);
 
+	risp_core_remove(&isp->core);
+
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
 
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
new file mode 100644
index 000000000000..2bebaf6fbec9
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __RCAR_ISP__
+#define __RCAR_ISP__
+
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <media/rppx1.h>
+#include <media/vsp1.h>
+
+struct rcar_isp_core;
+
+enum risp_core_pads {
+	RISP_CORE_INPUT1,
+	RISP_CORE_PARAMS,
+	RISP_CORE_STATS,
+	RISP_CORE_OUTPUT1,
+	RISP_CORE_NUM_PADS,
+};
+
+/**
+ * struct risp_buffer - Describe an IO buffer
+ * @vb:		The VB2 buffer
+ * @list:	List of buffers queued to the IO queue
+ * @vsp_buffer:	Buffer mapped from VSP-X, only used for params IO
+ */
+struct risp_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	struct vsp1_isp_buffer_desc vsp_buffer;
+};
+
+/**
+ * struct rcar_isp_core_io - Information for a IO video devices
+ * @core:	Backlink to the common ISP core structure
+ *
+ * @lock:	Protects @vdev, @pad and @queue + open/close fops
+ * @vdev:	V4L2 video device associated with this IO port
+ * @pad:	Media pad for @vdev
+ * @queue:	VB2 buffers queue for $@vdev
+ *
+ * @qlock:	Protects @streaming and @buffers
+ * @streaming:	Flag to indicate if device is streaming, or not
+ * @buffers:	List of buffers queued to the device
+ *
+ * @format:	The active V4L2 format
+ */
+struct rcar_isp_core_io {
+	struct rcar_isp_core *core;
+
+	struct mutex lock;
+	struct video_device vdev;
+	struct media_pad pad;
+	struct vb2_queue queue;
+
+	bool streaming;
+	struct list_head buffers;
+
+	struct v4l2_format format;
+};
+
+/**
+ * struct rcar_isp_job - R-Car ISP job description
+ *
+ * @buffers: IO buffers that form a job
+ * @vspx_job: VSPX job description
+ * @job_queue: list handle
+ */
+struct rcar_isp_job {
+	struct risp_buffer *buffers[RISP_CORE_NUM_PADS];
+	struct vsp1_isp_job_desc vspx_job;
+	struct list_head job_queue;
+};
+
+/**
+ * struct rcar_isp_job - R-Car ISP job description
+ *
+ * @dev: Device reference to VSPX
+ * @job: Job currently being processed by VSPX
+ */
+struct rcar_isp_vspx {
+	struct device *dev;
+	struct rcar_isp_job *job;
+};
+
+/**
+ * struct rcar_isp_core - ISP Core
+ * @dev:	(OF) device
+ * @rppaddr:	Hardware address of the RPP ISP (from OF)
+ * @clk:	The clock for the ISP CORE
+ * @rstc:	The reset for the ISP Core
+ * @csrstc:	The reset for the ISP Channel Selector
+ *
+ * @base:	MMIO base of the ISP CORE
+ * @csbase:	MMIO base of the ISP CS
+ *
+ * @subdev:	V4L2 subdevice to represent the ISP CORE
+ * @pads:	Media pad for @subdev
+ *
+ * @v4l2_dev:	V4L2 device
+ * @rpp:	Handle to the RPP ISP connected to the ISP CORE
+ *
+ * @io_lock:	Protect io[*].streaming and io[*].buffers
+ * @io:		Array of IO ports to the ISP CORE
+ *
+ * @lock:	Protects @vspx, @risp_jobs, @sequence and @streaming
+ * @vspx:	Handle to the resources used by VSPX connected to the ISP CORE
+ * @risp_jobs:	Queue of VSPX transfer jobs
+ * @sequence:	V4L2 buffers sequence number
+ * @streaming:	Tracks if the device is streaming
+ */
+struct rcar_isp_core {
+	struct device *dev;
+
+	u32 rppaddr;
+	struct clk *clk;
+
+	struct reset_control *rstc;
+	struct reset_control *csrstc;
+
+	void __iomem *base;
+	void __iomem *csbase;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[RISP_CORE_NUM_PADS];
+
+	struct v4l2_device v4l2_dev;
+	struct rppx1 *rpp;
+
+	struct mutex io_lock;
+	struct rcar_isp_core_io io[RISP_CORE_NUM_PADS];
+
+	spinlock_t lock;
+	struct rcar_isp_vspx vspx;
+	struct list_head risp_jobs;
+	unsigned int sequence;
+	bool streaming;
+};
+
+int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
+		    void __iomem *csbase, struct reset_control *csrstc);
+void risp_core_remove(struct rcar_isp_core *core);
+int risp_core_registered(struct rcar_isp_core *core, struct v4l2_subdev *sd);
+
+int risp_core_job_prepare(struct rcar_isp_core *core);
+
+int risp_core_start_streaming(struct rcar_isp_core *core);
+void risp_core_stop_streaming(struct rcar_isp_core *core);
+
+int risp_core_io_create(struct device *dev, struct rcar_isp_core *core,
+			struct rcar_isp_core_io *io, unsigned int pad);
+void risp_core_io_destory(struct rcar_isp_core_io *io);
+
+#endif
-- 
2.51.0


