Return-Path: <linux-media+bounces-38765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CDB18C6A
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C183189703D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830B326E71C;
	Sat,  2 Aug 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tb0X9eBI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AE23BCEF;
	Sat,  2 Aug 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126877; cv=none; b=toYUd4kB/0rcXKRJrGJB9r9Jp41qNGdqZ3zEdu8uFJy52WnPbgxHdI9tEetCU9nEtZ9xYTHdHTLujgKyRaGGgKJPthOIq4Dk0aui7xBs8Iku2iAgxL8wFCLhV4Vuh7WoEHNbHmQYVnDM8v4Od3qTSDv6b8RgpM15Th9ZuF2s05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126877; c=relaxed/simple;
	bh=Yobm/1MGg7bPFLQtQWEvVqLgOCfJr7HoqcnOsRBfzUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOsH5k4wY3OciaXDWPDifMJuRw/emMwRJ55et1wJ7T+9zBMCRHZ/079L69Bkw8ghNP0Z1WNX758cq3TlQA9e0+D/VFxoKj8LTeFsYqm0o0k9PtS5S0hpDFlosBBIV4Uo0IMXMsL+tmYgfGhZ2X0eiezx30eCXD2rLD2xmIE+djM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tb0X9eBI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3FB23B05;
	Sat,  2 Aug 2025 11:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126827;
	bh=Yobm/1MGg7bPFLQtQWEvVqLgOCfJr7HoqcnOsRBfzUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tb0X9eBIOaImES639/omP3+bgTrW7SC2+A3C4hbXWza6N9MZX4V1hAY9CmkS/1Y0Y
	 grEbDaabanOy+dRjK8cWvnSqPGGq52yv4RPUTWCubgtks/3ccnM9HJxoLrgX5EylfZ
	 2QJtUQkALJrbXmmQtnj//lbFfnb0ZVJcW6mp53aE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:48 +0200
Subject: [PATCH 26/65] media: Set file->private_data in v4l2_fh_add()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250802-media-private-data-v1-26-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, 
 Zhou Peng <eagle.zhou@nxp.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=49506;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=AjjOw1FEkl+flV1iD9X3J3U+zDgZ+uBJPuJ8D/AKRho=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj60moBa2sYWifVD3BYJyFsFLUsO8YipbF7Q
 mObETTgb6aJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+gAKCRByNAaPFqFW
 PNh0EACisCJhsBqYBnUT08VIyZS01ltJOUhjGNP1Q5VtcSV4zCPWF17wgA1TxN2Vpu3+4qrnMhs
 WK9B0bE7SSSeEXux7YTqyULe2Z1FjPXhx+m2031K6HROtTGpLj4AHf1yJvUwlsif7SheIKi0Rqu
 hOcoUkNRGSyrgcUVMMC62m4E9nq4ficNkp6ku/bcuFjscF/EWcoCSNAGOy1PHYIjdMnddT/VviX
 634F7yAfxHPz7YhZKQfDyncRkrZ5j0tml3nFz9CF0LPNqwSvmf+hIjkekcUr9Y8T8g+xhiv4v/2
 6JhLMLMZa3D12gj4RtcoJcpfBTl7d/y8FILCw5lvmuasUdqUVPyZa7gF6fAkFDpINullW5pYZoh
 boqLyuoXsQ+1W39xA7Q1STAAzf2tsSCx29o8pfJggjgmB9sVZPKJ2uhAW4Kv7eBLFmDHU7oFXEy
 K5vDz1CPD7fxV+ivNLgUKCqF1wEVvvTMGdPmmrVyuy4Frh+g00TiqlZV4U78PnzQpvGUNn6vTYL
 MYzyvP/OqBvyIMuhnAeeq8dFm6gSMVTVNSwvQ5MvM2nNuEjA3hdNmo5IoRceRNeHWYuDtGgjKU3
 KibUlxWu7pO7j1Exjb5PgLWw4zhhlux+8YKKdiB+rfYmeBGbhfqjHrFbfYx0LN+2p3ttuwQ1ZUB
 REQPI37HstKsoug==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

All the drivers that use v4l2_fh and call v4l2_fh_add() manually store a
pointer to the v4l2_fh instance in file->private_data in their video
device .open() file operation handler. Move the code to the
v4l2_fh_add() function to avoid direct access to file->private_data in
drivers. This requires adding a file pointer argument to the function.

Changes to drivers have been generated with the following coccinelle
semantic patch:

@@
expression fh;
identifier filp;
identifier open;
type ret;
@@
ret open(..., struct file *filp, ...)
{
	<...
-	filp->private_data = fh;
	...
-	v4l2_fh_add(fh);
+	v4l2_fh_add(fh, filp);
	...>
}

@@
expression fh;
identifier filp;
identifier open;
type ret;
@@
ret open(..., struct file *filp, ...)
{
	<...
-	v4l2_fh_add(fh);
+	v4l2_fh_add(fh, filp);
	...
-	filp->private_data = fh;
	...>
}

Manual changes have been applied to Documentation/ to update the usage
patterns, to drivers/media/v4l2-core/v4l2-fh.c to update the
v4l2_fh_add() prototype set file->private_data, and to
include/media/v4l2-fh.h to update the v4l2_fh_add() function prototype
and its documentation.

Additionally, white space issues have been fixed manually in
drivers/media/platform/nvidia/tegra-vde/v4l2.c,
drivers/media/platform/rockchip/rkvdec/rkvdec.c,
drivers/media/v4l2-core/v4l2-fh.c and
drivers/staging/most/video/video.c.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-fh.rst         | 46 +++++++++++-----------
 .../zh_CN/video4linux/v4l2-framework.txt           |  5 +--
 drivers/media/pci/cx18/cx18-fileops.c              |  3 +-
 drivers/media/pci/ivtv/ivtv-fileops.c              |  4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c        |  3 +-
 drivers/media/pci/saa7164/saa7164-vbi.c            |  3 +-
 drivers/media/platform/allegro-dvt/allegro-core.c  |  3 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  3 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |  3 +-
 .../media/platform/chips-media/coda/coda-common.c  |  3 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  3 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |  3 +-
 .../media/platform/imagination/e5010-jpeg-enc.c    |  3 +-
 drivers/media/platform/m2m-deinterlace.c           |  3 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  3 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  3 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  3 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |  3 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |  3 +-
 drivers/media/platform/nvidia/tegra-vde/v4l2.c     |  3 +-
 drivers/media/platform/nxp/dw100/dw100.c           |  3 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  3 +-
 drivers/media/platform/nxp/imx-pxp.c               |  3 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  3 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |  3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +-
 drivers/media/platform/qcom/venus/vdec.c           |  3 +-
 drivers/media/platform/qcom/venus/venc.c           |  3 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |  3 +-
 drivers/media/platform/renesas/rcar_jpu.c          |  3 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  4 +-
 drivers/media/platform/rockchip/rga/rga.c          |  3 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  3 +-
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  3 +-
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  3 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  3 +-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  3 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  3 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  3 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   |  3 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |  3 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  3 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  3 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  3 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  3 +-
 drivers/media/platform/ti/vpe/vpe.c                |  3 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |  3 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  3 +-
 drivers/media/test-drivers/vim2m.c                 |  3 +-
 drivers/media/test-drivers/visl/visl-core.c        |  3 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |  3 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |  3 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  3 +-
 drivers/media/v4l2-core/v4l2-fh.c                  |  7 ++--
 drivers/media/v4l2-core/v4l2-subdev.c              |  3 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |  3 +-
 drivers/staging/media/meson/vdec/vdec.c            |  3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  3 +-
 drivers/staging/most/video/video.c                 |  4 +-
 drivers/usb/gadget/function/uvc_v4l2.c             |  3 +-
 include/media/v4l2-fh.h                            |  5 ++-
 61 files changed, 91 insertions(+), 146 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index 2c87b74578d97a171ad06d3eb60a02cd58b557b1..a7393067f5db2183aa677e15ece512296455e23b 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -11,25 +11,22 @@ data that is used by the V4L2 framework.
 	since it is also used to implement priority handling
 	(:ref:`VIDIOC_G_PRIORITY`).
 
-The users of :c:type:`v4l2_fh` (in the V4L2 framework, not the driver) know
-whether a driver uses :c:type:`v4l2_fh` as its ``file->private_data`` pointer
-by testing the ``V4L2_FL_USES_V4L2_FH`` bit in :c:type:`video_device`->flags.
-This bit is set whenever :c:func:`v4l2_fh_init` is called.
-
-struct v4l2_fh is allocated as a part of the driver's own file handle
-structure and ``file->private_data`` is set to it in the driver's ``open()``
-function by the driver. The :c:type:`v4l2_fh` file handle can be retrieved
-from the :c:type:`file` using :c:func:`file_to_v4l2_fh`. Drivers must not
-access ``file->private_data`` directly.
-
-In many cases the struct v4l2_fh will be embedded in a larger
-structure. In that case you should call:
-
-#) :c:func:`v4l2_fh_init` and :c:func:`v4l2_fh_add` in ``open()``
-#) :c:func:`v4l2_fh_del` and :c:func:`v4l2_fh_exit` in ``release()``
-
-Drivers can extract their own file handle structure by using the container_of
-macro.
+struct v4l2_fh is allocated in the driver's ``open()`` file operation handler.
+It is typically embedded in a larger driver-specific structure. The
+:c:type:`v4l2_fh` must be initialized with a call to :c:func:`v4l2_fh_init`,
+and added to the video device with :c:func:`v4l2_fh_add`. This associates the
+:c:type:`v4l2_fh` with the :c:type:`file` by setting ``file->private_data`` to
+point to the :c:type:`v4l2_fh`.
+
+Similarly, the struct v4l2_fh is freed in the driver's ``release()`` file
+operation handler. It must be removed from the video device with
+:c:func:`v4l2_fh_del` and cleaned up with :c:func:`v4l2_fh_exit` before being
+freed.
+
+Drivers must not access ``file->private_data`` directly. They can retrieve the
+:c:type:`v4l2_fh` associated with a :c:type:`file` by calling
+:c:func:`file_to_v4l2_fh`. Drivers can extract their own file handle structure
+by using the container_of macro.
 
 Example:
 
@@ -58,8 +55,7 @@ Example:
 
 		...
 
-		file->private_data = &my_fh->fh;
-		v4l2_fh_add(&my_fh->fh);
+		v4l2_fh_add(&my_fh->fh, file);
 		return 0;
 	}
 
@@ -84,7 +80,7 @@ Below is a short description of the :c:type:`v4l2_fh` functions used:
   :c:type:`v4l2_file_operations`->open() handler.
 
 :c:func:`v4l2_fh_add <v4l2_fh_add>`
-(:c:type:`fh <v4l2_fh>`)
+(:c:type:`fh <v4l2_fh>`, struct file \*filp)
 
 - Add a :c:type:`v4l2_fh` to :c:type:`video_device` file handle list.
   Must be called once the file handle is completely initialized.
@@ -138,6 +134,12 @@ associated device node:
 
 - Same, but it calls v4l2_fh_is_singular with filp->private_data.
 
+.. note::
+        The V4L2 framework knows whether a driver uses :c:type:`v4l2_fh` as its
+        ``file->private_data`` pointer by testing the ``V4L2_FL_USES_V4L2_FH``
+        bit in :c:type:`video_device`->flags. This bit is set whenever
+        :c:func:`v4l2_fh_init` is called.
+
 
 V4L2 fh functions and data structures
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index a9eb62fa1531c69110ff17945fa2fcfa596f4df8..2d38ae17d9404d9d40c63bc8329f3cc6999b7a11 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -812,8 +812,7 @@ int my_open(struct file *file)
 
 	...
 
-	file->private_data = &my_fh->fh;
-	v4l2_fh_add(&my_fh->fh);
+	v4l2_fh_add(&my_fh->fh, file);
 	return 0;
 }
 
@@ -836,7 +835,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
   初始化文件句柄。这*必须*在驱动的 v4l2_file_operations->open()
   函数中执行。
 
-void v4l2_fh_add(struct v4l2_fh *fh)
+void v4l2_fh_add(struct v4l2_fh *fh, struct file *filp)
 
   添加一个 v4l2_fh 到 video_device 文件句柄列表。一旦文件句柄
   初始化完成就必须调用。
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index 89e38b3036309af0747362bafad5024413c2c5bd..f90b547f5d676308ed5c7956a8da02e208b9446e 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -743,8 +743,7 @@ static int cx18_serialized_open(struct cx18_stream *s, struct file *filp)
 	item->type = s->type;
 
 	item->open_id = cx->open_id++;
-	filp->private_data = &item->fh;
-	v4l2_fh_add(&item->fh);
+	v4l2_fh_add(&item->fh, filp);
 
 	if (item->type == CX18_ENC_STREAM_TYPE_RAD &&
 			v4l2_fh_is_singular_file(filp)) {
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 67964a3c382c6627a7b3ce6380a2da97dcc47c3d..aa5f5f16427c48123cd314932a7d8bc48f07c031 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -998,9 +998,7 @@ static int ivtv_open(struct file *filp)
 	v4l2_fh_init(&item->fh, &s->vdev);
 	item->itv = itv;
 	item->type = s->type;
-
-	filp->private_data = &item->fh;
-	v4l2_fh_add(&item->fh);
+	v4l2_fh_add(&item->fh, filp);
 
 	if (item->type == IVTV_ENC_STREAM_TYPE_RAD &&
 			v4l2_fh_is_singular_file(filp)) {
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 296f50b6b8d38e0ab617f0990d8f697ba96b0016..e6e353a251cf548525c44e87695f7d45bde302a6 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -725,8 +725,7 @@ static int fops_open(struct file *file)
 
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
-	v4l2_fh_add(&fh->fh);
-	file->private_data = &fh->fh;
+	v4l2_fh_add(&fh->fh, file);
 
 	return 0;
 }
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index a7e398f304725c7fa5aa4cf1edf0deb0df059641..181442fcb43b08cd96f29c2357bcfadd3ddcedb4 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -428,8 +428,7 @@ static int fops_open(struct file *file)
 
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
-	v4l2_fh_add(&fh->fh);
-	file->private_data = &fh->fh;
+	v4l2_fh_add(&fh->fh, file);
 
 	return 0;
 }
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 74977f3ae4844022c04de877f31b4fc6aaac0749..8c30f3cd4fc545133f697973b0f002ea888a3a4a 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3219,8 +3219,7 @@ static int allegro_open(struct file *file)
 	}
 
 	list_add(&channel->list, &dev->channels);
-	file->private_data = &channel->fh;
-	v4l2_fh_add(&channel->fh);
+	v4l2_fh_add(&channel->fh, file);
 
 	allegro_channel_adjust(channel);
 
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index c7df29a2d82012b7fc290edf3f629a0c3ed7bcc8..d36891b546bca417e8b98c5e0458ebb15e24c213 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -860,8 +860,7 @@ static int ge2d_open(struct file *file)
 		return ret;
 	}
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ge2d_setup_ctrls(ctx);
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 57ca6262bb04b356a85e217ef51cfb13cb9a0a36..e13bfe09af1bf0926bf6005b83a8aae7e34a2122 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -760,7 +760,7 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 	inst->min_buffer_cap = 2;
 	inst->min_buffer_out = 2;
 	v4l2_fh_init(&inst->fh, func->vfd);
-	v4l2_fh_add(&inst->fh);
+	v4l2_fh_add(&inst->fh, file);
 
 	ret = call_vop(inst, ctrl_init);
 	if (ret)
@@ -774,7 +774,6 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 	}
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
-	file->private_data = &inst->fh;
 	inst->state = VPU_CODEC_STATE_DEINIT;
 	inst->workqueue = alloc_ordered_workqueue("vpu_inst", WQ_MEM_RECLAIM);
 	if (inst->workqueue) {
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 92fb24cace8ef75e70eb2aae96bc169a7cf97563..9d8a1c9bea6e9f4d9fc2c2ae165d587e3b3b9650 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2642,8 +2642,7 @@ static int coda_open(struct file *file)
 	if (ctx->ops->seq_end_work)
 		INIT_WORK(&ctx->seq_end_work, ctx->ops->seq_end_work);
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	ctx->dev = dev;
 	ctx->idx = idx;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index f3188d720ed3e183f3400816a9c939014213711d..88eb933a51448788373775e423ae2ac5042cf8b6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1761,8 +1761,7 @@ static int wave5_vpu_open_dec(struct file *filp)
 		return -ENOMEM;
 
 	v4l2_fh_init(&inst->v4l2_fh, vdev);
-	filp->private_data = &inst->v4l2_fh;
-	v4l2_fh_add(&inst->v4l2_fh);
+	v4l2_fh_add(&inst->v4l2_fh, filp);
 
 	INIT_LIST_HEAD(&inst->list);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index b69a1206fa12c2ff5f3a32d269b8fd3b80a597aa..322c1498758a0a569eb94cab0d6612ce18cd4c7b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1587,8 +1587,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 		return -ENOMEM;
 
 	v4l2_fh_init(&inst->v4l2_fh, vdev);
-	filp->private_data = &inst->v4l2_fh;
-	v4l2_fh_add(&inst->v4l2_fh);
+	v4l2_fh_add(&inst->v4l2_fh, filp);
 
 	INIT_LIST_HEAD(&inst->list);
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 295461325862fb2bcac755cf815955955b37e6f0..1da00ff4b1e36a6486ce54e02139f6489d6acf22 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -742,8 +742,7 @@ static int e5010_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->e5010 = e5010;
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(e5010->m2m_dev, ctx, queue_init);
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 1812c07837ad33e10db9005fd2009b4ea2a799d0..a343dffd19f03c68557415afae2a8db4b3614d2e 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -847,7 +847,6 @@ static int deinterlace_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = pcdev;
 
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(pcdev->m2m_dev, ctx, &queue_init);
@@ -866,7 +865,7 @@ static int deinterlace_open(struct file *file)
 	}
 
 	ctx->colorspace = V4L2_COLORSPACE_REC709;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	dprintk(pcdev, "Created instance %p, m2m_ctx: %p\n",
 		ctx, ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index bf7cae1993d5e21975bc9dffcbcfb3fe1843d575..4bf52e9d960431194c05870743cc628e4e4293e2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1176,8 +1176,7 @@ static int mtk_jpeg_open(struct file *file)
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->jpeg = jpeg;
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e3e01a9a0f78cb2fe665132bd1bde66afa63bddb..25efd76f290e4f29a60d326e92a5bcb05c2bbd1e 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -1070,14 +1070,13 @@ static int mtk_mdp_m2m_open(struct file *file)
 	mutex_init(&ctx->slock);
 	ctx->id = mdp->id_counter++;
 	v4l2_fh_init(&ctx->fh, vfd);
-	file->private_data = &ctx->fh;
 	ret = mtk_mdp_ctrls_create(ctx);
 	if (ret)
 		goto error_ctrls;
 
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	INIT_LIST_HEAD(&ctx->list);
 
 	ctx->mdp_dev = mdp;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 8ebab14c535bfe023d720964965d97f758e5eb63..18e542ad32e4fd0d0d262670b6440fb2e3661f7f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -590,14 +590,13 @@ static int mdp_m2m_open(struct file *file)
 	ctx->mdp_dev = mdp;
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = &ctx->fh;
 	ret = mdp_m2m_ctrls_create(ctx);
 	if (ret)
 		goto err_exit_fh;
 
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	mutex_init(&ctx->ctx_lock);
 	ctx->m2m_ctx = v4l2_m2m_ctx_init(mdp->m2m_dev, ctx, mdp_m2m_queue_init);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 18801883c31a80b2179eb0d9280150eeb4aa3770..952a77c383bdb8dba94c74916674e729ee5aba35 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -206,8 +206,7 @@ static int fops_vcodec_open(struct file *file)
 	mutex_lock(&dev->dev_mutex);
 	ctx->id = dev->id_counter++;
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
 	if (ctx->dev->vdec_pdata->is_subdev_supported) {
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index e26a6c3ffa0cee17385575215b55b575b14e58f4..9cacb6cbcf28357826db2df7e15c3588e7b4d4c8 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -129,8 +129,7 @@ static int fops_vcodec_open(struct file *file)
 	 */
 	ctx->id = dev->id_counter++;
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
 	init_waitqueue_head(&ctx->queue[0]);
diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 393dc3f07d5c78ff5ab0ae7b6368914859564458..688b776b30107df4ec3642a4bc0e896759ccf0fe 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -832,8 +832,7 @@ static int tegra_open(struct file *file)
 		goto free_ctrls;
 	}
 
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	tegra_reset_coded_fmt(ctx);
 	tegra_try_coded_fmt(file, &ctx->fh, &ctx->coded_fmt);
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 2460f09a6813a320f7637bc332e641b7741ced21..2bd30910ddf98401dfc9d8f2e3b19fe8672320e3 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -607,7 +607,6 @@ static int dw100_open(struct file *file)
 
 	mutex_init(&ctx->vq_mutex);
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dw_dev = dw_dev;
 
 	ctx->q_data[DW100_QUEUE_SRC].fmt = &formats[0];
@@ -651,7 +650,7 @@ static int dw100_open(struct file *file)
 		goto err;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	return 0;
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index a17a020ea4c698bfa57253f0f53a17230d52dea3..13e681a0ec0abcb49b14455773da3ab2f5dc372b 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2205,8 +2205,7 @@ static int mxc_jpeg_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, mxc_vfd);
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->mxc_jpeg = mxc_jpeg;
 
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 879b1803a2b38c6748fa4748f25504665f8106bb..9602409f3ecef7e2a77a58f9c3376823a72ec551 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1660,7 +1660,6 @@ static int pxp_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 4);
@@ -1699,7 +1698,7 @@ static int pxp_open(struct file *file)
 		goto open_unlock;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	atomic_inc(&dev->num_inst);
 
 	dprintk(dev, "Created instance: %p, m2m_ctx: %p\n",
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9226e42b95fc91ed5490be1599a539f0fdeeb123..480669a2578ab2f4d6d5104658ba56ea776a6639 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -673,7 +673,6 @@ static int mxc_isi_m2m_open(struct file *file)
 	mutex_init(&ctx->vb2_lock);
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = &ctx->fh;
 
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(m2m->m2m_dev, ctx,
 					    &mxc_isi_m2m_queue_init);
@@ -694,7 +693,7 @@ static int mxc_isi_m2m_open(struct file *file)
 	if (ret)
 		goto err_ctrls;
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	return 0;
 
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 5c8c6285ec1e7b2e8df64132228e71e1b097183e..8c8f834e6250f5effcbb7f098f388a9ccc96302c 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -730,7 +730,6 @@ static int emmaprp_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = pcdev;
 
 	if (mutex_lock_interruptible(&pcdev->dev_mutex)) {
@@ -752,7 +751,7 @@ static int emmaprp_open(struct file *file)
 	clk_prepare_enable(pcdev->clk_emma_ahb);
 	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[1];
 	ctx->q_data[V4L2_M2M_DST].fmt = &formats[0];
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	mutex_unlock(&pcdev->dev_mutex);
 
 	dprintk(pcdev, "Created instance %p, m2m_ctx: %p\n", ctx, ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 64ebec2ca6b3d58118ac1a6f4ddeed2e43de6d5b..cdd34a3b71ff4309829f0f159241c3815658bcb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -25,8 +25,7 @@ static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 {
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
-	v4l2_fh_add(&inst->fh);
-	filp->private_data = &inst->fh;
+	v4l2_fh_add(&inst->fh, filp);
 }
 
 static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d10ca6d89f6d76c052b27b1154c8dd9c49466e23..55c27345b7d89bf400e216ed9aa59a871e501a44 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1732,9 +1732,8 @@ static int vdec_open(struct file *file)
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
-	v4l2_fh_add(&inst->fh);
+	v4l2_fh_add(&inst->fh, file);
 	inst->fh.m2m_ctx = inst->m2m_ctx;
-	file->private_data = &inst->fh;
 
 	return 0;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 0838d64ce8fee5dd8299d5c394e97910f10f7ee3..fba07557a3996a55fcd6a4f65376c418ec0c92a7 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1515,9 +1515,8 @@ static int venc_open(struct file *file)
 	v4l2_fh_init(&inst->fh, core->vdev_enc);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
-	v4l2_fh_add(&inst->fh);
+	v4l2_fh_add(&inst->fh, file);
 	inst->fh.m2m_ctx = inst->m2m_ctx;
-	file->private_data = &inst->fh;
 
 	return 0;
 
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index f11ea9dc5027bdd89262270f4e3979a06650d9bc..e0d12b579d87025e3f309f6593c068ad87f1856b 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2093,7 +2093,6 @@ static int fdp1_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->fdp1 = fdp1;
 
 	/* Initialise Queues */
@@ -2142,7 +2141,7 @@ static int fdp1_open(struct file *file)
 	if (ret < 0)
 		goto error_pm;
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	dprintk(fdp1, "Created instance: %p, m2m_ctx: %p\n",
 		ctx, ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 3ee51f53b0cd1c221cefd0ce93acbcda55faa4a6..26c5c77e4a17b26c453e3ea80b0f7c752e2f8029 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1231,8 +1231,7 @@ static int jpu_open(struct file *file)
 
 	v4l2_fh_init(&ctx->fh, vfd);
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->jpu = jpu;
 	ctx->encoder = vfd == &jpu->vfd_encoder;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 656fb5e6cb303cfcde1d91c839a9aceca79c77f7..b6dc1ee3dc50ac8d0eb79408b06c601cb501e9b8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1079,9 +1079,7 @@ static int vsp1_video_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(vfh, &video->video);
-	v4l2_fh_add(vfh);
-
-	file->private_data = vfh;
+	v4l2_fh_add(vfh, file);
 
 	ret = vsp1_device_get(video->vsp1);
 	if (ret < 0) {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8a6e618d605c216b5113062d90df03dc632dc7c8..d88817023996b29afc79cdd6fbdd42dfc5829b13 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -395,8 +395,7 @@ static int rga_open(struct file *file)
 		return ret;
 	}
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	rga_setup_ctrls(ctx);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 41ab90cbcc0cdbe279f6512decc4301b6cff2dfa..2fbad685e92cee4916420565a28c778b1a5e1a8e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -938,8 +938,7 @@ static int rkvdec_open(struct file *filp)
 	if (ret)
 		goto err_cleanup_m2m_ctx;
 
-	filp->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, filp);
 
 	return 0;
 
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 968bb4327b7a1697641815dfb08dc64251f5e927..39d84ffd1b05990ba4b8af281aba09e3f9cc5340 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -625,8 +625,7 @@ static int gsc_m2m_open(struct file *file)
 
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->gsc_dev = gsc;
 	/* Default color format */
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index feedf60dad09bd413cb8fe65d965fd39b26b8764..b002b02a899efdd95df4ae8a5db59b9f144a61db 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -634,8 +634,7 @@ static int fimc_m2m_open(struct file *file)
 
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrls.handler;
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	/* Setup the device context for memory-to-memory mode */
 	ctx->state = FIMC_CTX_M2M;
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index 44fcedbbc90a9863827aacbcd5f56d850cb552ea..e34cae9c9cf65d3161822b68233d28472171f917 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -257,8 +257,7 @@ static int g2d_open(struct file *file)
 		return ret;
 	}
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	g2d_setup_ctrls(ctx);
 
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index a8d0dddb1fb5b5344ac9c96657fcf17a575d6a26..c4ad0196ed8f1bf579365a0a21dd8c4a78bdaa10 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -970,8 +970,7 @@ static int s5p_jpeg_open(struct file *file)
 	v4l2_fh_init(&ctx->fh, vfd);
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ctx->jpeg = jpeg;
 	if (vfd == jpeg->vfd_encoder) {
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index dd9761df59df5dd7b07b4e9afd2d7939c46cb2de..74629db05121ac9181af9daa471c113876f9d323 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -801,8 +801,7 @@ static int s5p_mfc_open(struct file *file)
 	}
 	init_waitqueue_head(&ctx->queue);
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	ctx->dev = dev;
 	INIT_LIST_HEAD(&ctx->src_queue);
 	INIT_LIST_HEAD(&ctx->dst_queue);
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 26c4e48e5e84bcf315692515448ae615727c454f..57dcc625096b4b684cfde0051d200bf8c18e4ba4 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -608,8 +608,7 @@ static int bdisp_open(struct file *file)
 
 	/* Use separate control handler per file handle */
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	/* Default format */
 	ctx->src = bdisp_dflt_fmt;
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 8282e72af67084ddbb94ed78df87a07e1e8b860f..b2df94dcbe21709f5b31446c85408728e70d5bca 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1639,8 +1639,7 @@ static int delta_open(struct file *file)
 	ctx->dev = delta;
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	INIT_WORK(&ctx->run_work, delta_run_work);
 	mutex_init(&ctx->lock);
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 29142c806cb74a510b2f27e79c9e10ca4088b1e9..2f9413fa7318f42b390f96447dcb1a905836703e 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1174,8 +1174,7 @@ static int hva_open(struct file *file)
 
 	INIT_WORK(&ctx->run_work, hva_run_work);
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ret = hva_ctrls_setup(ctx);
 	if (ret) {
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index f4c5d73447a7c3efb0ad5d9bb8a09432c1a8fa60..b2bced06a1e603f7479620d5db3c12ee89e5149e 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -304,8 +304,7 @@ static int dma2d_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	dma2d_setup_ctrls(ctx);
 
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index e9c7c99fbc559de85c33736a8f459cd216b8cdbf..7823eb97faf7e9bd13286ab14db2b436fc5caf1f 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -730,7 +730,6 @@ static int deinterlace_open(struct file *file)
 	deinterlace_prepare_format(&ctx->dst_fmt);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx,
@@ -740,7 +739,7 @@ static int deinterlace_open(struct file *file)
 		goto err_free;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	mutex_unlock(&dev->dev_mutex);
 
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 9ea65cb7187fee323051b1cb62b342e119f7bb3d..368a858b8c0fdea462b85c8c71e22058d10a6c05 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -659,7 +659,6 @@ static int rotate_open(struct file *file)
 	rotate_set_cap_format(ctx, &ctx->dst_fmt, ctx->rotate);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx,
@@ -669,7 +668,7 @@ static int rotate_open(struct file *file)
 		goto err_free;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	ret = rotate_setup_ctrls(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index b76d40aeca17cf5b8b7619cadf0afe66ff283a9d..d10a2b96c13cf1f5103504a8bd10c65111392a1e 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1297,7 +1297,7 @@ static int isp_video_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(&handle->vfh, &video->video);
-	v4l2_fh_add(&handle->vfh);
+	v4l2_fh_add(&handle->vfh, file);
 
 	/* If this is the first user, initialise the pipeline. */
 	if (omap3isp_get(video->isp) == NULL) {
@@ -1333,7 +1333,6 @@ static int isp_video_open(struct file *file)
 	handle->timeperframe.denominator = 1;
 
 	handle->video = video;
-	file->private_data = &handle->vfh;
 
 done:
 	if (ret < 0) {
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 4b9b2bec7377d724c272ff76fb8116b65227c542..a47c5d31c47550cd9c6c8803b25cda1253f906a9 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2310,7 +2310,6 @@ static int vpe_open(struct file *file)
 	init_adb_hdrs(ctx);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 1);
@@ -2364,7 +2363,7 @@ static int vpe_open(struct file *file)
 		goto exit_fh;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	/*
 	 * for now, just report the creation of the first instance, we can later
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index b20b9c7f41319e1d9586d641200aeeebbd1ee761..aadc3d8fb3d1c1267b370edac6723b99bd00f9bf 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -663,8 +663,7 @@ static int hantro_open(struct file *filp)
 	}
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	filp->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, filp);
 
 	hantro_reset_fmts(ctx);
 
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index e27f6761cba18e78e1833745e77347f7405957e0..f20d9d9643f5e3d39f4807ad337f05c957594e1e 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1848,7 +1848,6 @@ static int vicodec_open(struct file *file)
 		ctx->is_stateless = true;
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 5);
@@ -1932,7 +1931,7 @@ static int vicodec_open(struct file *file)
 		goto open_unlock;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 open_unlock:
 	mutex_unlock(vfd->lock);
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 55d885be5bcc0541e4ea539a2fafeeb2d76680e3..24574025f58fc34a0b98e8048294624607e39e2a 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1389,7 +1389,6 @@ static int vim2m_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 	hdl = &ctx->hdl;
 	v4l2_ctrl_handler_init(hdl, 4);
@@ -1433,7 +1432,7 @@ static int vim2m_open(struct file *file)
 		goto open_unlock;
 	}
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	atomic_inc(&dev->num_inst);
 
 	dprintk(dev, 1, "Created instance: %p, m2m_ctx: %p\n",
diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index 5bf3136b36eb30be5cf6b7f65ca3ab7314d84f98..0f43ec23f40b40362979646b47b09b75b7786fb2 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -341,7 +341,6 @@ static int visl_open(struct file *file)
 	ctx->tpg_str_buf = kzalloc(TPG_STR_BUF_SZ, GFP_KERNEL);
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 
 	rc = visl_init_ctrls(ctx);
@@ -361,7 +360,7 @@ static int visl_open(struct file *file)
 	if (rc)
 		goto free_m2m_ctx;
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	dprintk(dev, "Created instance: %p, m2m_ctx: %p\n",
 		ctx, ctx->fh.m2m_ctx);
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index ea17f1a5f5b0a01d7ae159b7f00d65ce952f4974..6c6e467f85549e86598e73d29352a84de7df2f4d 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -380,8 +380,7 @@ static int hdpvr_open(struct file *file)
 		return -ENOMEM;
 	fh->legacy_mode = true;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
-	v4l2_fh_add(&fh->fh);
-	file->private_data = &fh->fh;
+	v4l2_fh_add(&fh->fh, file);
 	return 0;
 }
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 481b03bbecf8134f75b3988e45fc392f07ae90fd..04c77af0c51ec2174193387253015383d6fac486 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1003,10 +1003,9 @@ static int pvr2_v4l2_open(struct file *file)
 	}
 
 	fhp->file = file;
-	file->private_data = &fhp->fh;
 
 	fhp->fw_mode_flag = pvr2_hdw_cpufw_get_enabled(hdw);
-	v4l2_fh_add(&fhp->fh);
+	v4l2_fh_add(&fhp->fh, file);
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 6dd329a972fda5c2574231b8526105676df3d4a1..09677ed639ae9252a57ce09cdbcfd567ad7aabc2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -600,10 +600,9 @@ static int uvc_v4l2_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
-	v4l2_fh_add(&handle->vfh);
+	v4l2_fh_add(&handle->vfh, file);
 	handle->chain = stream->chain;
 	handle->stream = stream;
-	file->private_data = &handle->vfh;
 
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index 7a5f7aa5e25341df62bb4e3380bf19f46e2df955..b59b1084d8cdf1b62da12879e21dbe56c2109648 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -41,10 +41,12 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
-void v4l2_fh_add(struct v4l2_fh *fh)
+void v4l2_fh_add(struct v4l2_fh *fh, struct file *filp)
 {
 	unsigned long flags;
 
+	filp->private_data = fh;
+
 	v4l2_prio_open(fh->vdev->prio, &fh->prio);
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
 	list_add(&fh->list, &fh->vdev->fh_list);
@@ -57,11 +59,10 @@ int v4l2_fh_open(struct file *filp)
 	struct video_device *vdev = video_devdata(filp);
 	struct v4l2_fh *fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 
-	filp->private_data = fh;
 	if (fh == NULL)
 		return -ENOMEM;
 	v4l2_fh_init(fh, vdev);
-	v4l2_fh_add(fh);
+	v4l2_fh_add(fh, filp);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_open);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 29d3b788b288675c9ec849bb14e1936356d95743..bf35ac436249fdbf218ed08a712abf546a49b4eb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -86,8 +86,7 @@ static int subdev_open(struct file *file)
 	}
 
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
-	v4l2_fh_add(&subdev_fh->vfh);
-	file->private_data = &subdev_fh->vfh;
+	v4l2_fh_add(&subdev_fh->vfh, file);
 
 	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
 		struct module *owner;
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 05a54242356c53d19770086dfcc2ed81e1cda4c1..9dc0954ed9aac7088e42bea03c6aada4ee8f2ae8 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -765,8 +765,7 @@ static int ipu_csc_scaler_open(struct file *file)
 	ctx->rot_mode = IPU_ROTATE_NONE;
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 	ctx->priv = priv;
 
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(priv->m2m_dev, ctx,
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index f1ee53f9f29868ae7cb02ce00764631f821ee74b..b92666ff50a15196de0143f2ba5bf476c6f7729d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -908,9 +908,8 @@ static int vdec_open(struct file *file)
 
 	v4l2_fh_init(&sess->fh, core->vdev_dec);
 	sess->fh.ctrl_handler = &sess->ctrl_handler;
-	v4l2_fh_add(&sess->fh);
+	v4l2_fh_add(&sess->fh, file);
 	sess->fh.m2m_ctx = sess->m2m_ctx;
-	file->private_data = &sess->fh;
 
 	return 0;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 80b43187f6eef827c7212a601aa2056dbc606bd4..ebefd646dbdb4e998bf6a8a0f0be6d7e4bf7d28b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -366,7 +366,6 @@ static int cedrus_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
-	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 	ctx->bit_depth = 8;
 
@@ -383,7 +382,7 @@ static int cedrus_open(struct file *file)
 	if (ret)
 		goto err_m2m_release;
 
-	v4l2_fh_add(&ctx->fh);
+	v4l2_fh_add(&ctx->fh, file);
 
 	mutex_unlock(&dev->dev_mutex);
 
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 116331cead2a6676f2c018b3f8fc10b0716dfc3a..24a68e3e54195cf5f8952a35fe103d93bb0fd3e5 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -96,9 +96,7 @@ static int comp_vdev_open(struct file *filp)
 
 	fh->mdev = mdev;
 	v4l2_fh_init(&fh->fh, vdev);
-	filp->private_data = &fh->fh;
-
-	v4l2_fh_add(&fh->fh);
+	v4l2_fh_add(&fh->fh, filp);
 
 	ret = most_start_channel(mdev->iface, mdev->ch_idx, &comp);
 	if (ret) {
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 886300a29b908a6dda3e2dfcb6b3414f782b172b..680f25d17dc2c7b99529441de8f079abe3b3411f 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -672,10 +672,9 @@ uvc_v4l2_open(struct file *file)
 		return -ENOMEM;
 
 	v4l2_fh_init(&handle->vfh, vdev);
-	v4l2_fh_add(&handle->vfh);
+	v4l2_fh_add(&handle->vfh, file);
 
 	handle->device = &uvc->video;
-	file->private_data = &handle->vfh;
 
 	return 0;
 }
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index 14e7136e693f0a7b8b25959200603028e0db36ac..d8fcf49f10e09452b73499f4a9bd1285bc2835a5 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -87,11 +87,14 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev);
  * v4l2_fh_add - Add the fh to the list of file handles on a video_device.
  *
  * @fh: pointer to &struct v4l2_fh
+ * @filp: pointer to &struct file associated with @fh
+ *
+ * The function sets filp->private_data to point to @fh.
  *
  * .. note::
  *    The @fh file handle must be initialised first.
  */
-void v4l2_fh_add(struct v4l2_fh *fh);
+void v4l2_fh_add(struct v4l2_fh *fh, struct file *filp);
 
 /**
  * v4l2_fh_open - Ancillary routine that can be used as the open\(\) op

-- 
2.49.0


