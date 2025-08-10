Return-Path: <linux-media+bounces-39299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2DB1F7B5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B71D7A2270
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CAA1DED47;
	Sun, 10 Aug 2025 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZKkrvZRN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F371D63F0;
	Sun, 10 Aug 2025 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789528; cv=none; b=GeTPKCV65LvGHYIYPOrdw7ojRpj1bI0/Vp5IPFruhd2SSIzU/JRbYzYh/hbFpV12sJXWAgJ1afGK0Uhkr04hrMSG80VGryVi9zqWv8a7r9FxjZreaO4s5F9lU01D5eSZv7SU3XIJCnse7EOq3A0ZDrpbh/Er5BTSc3DLbb0/4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789528; c=relaxed/simple;
	bh=rikZVi4fHMb+eJ4TVdrNA0A2v3pkSGb0EttE6AD7WHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AR6zxIwyBQLca/ZyRHsumPsVJIZq3zfVRVzqzpxLOdDMOp/CKChpaKqHRqciy8n7nFbYEpq0zfocxlUS3AfiwFu/lXOu294xWVNZ2kcfT7ZCspMgoY5W7b7i0TypQ3sqej138bvcH+39c17Uvs6EvsiBXOcSVXqY2Vy9gLsdPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZKkrvZRN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6941B7E6;
	Sun, 10 Aug 2025 03:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789473;
	bh=rikZVi4fHMb+eJ4TVdrNA0A2v3pkSGb0EttE6AD7WHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZKkrvZRNPGiVejtOWa45Z4QAKOvYmei59ttlus4ALy6dbBfvk1VUujf6tJrsMpI3W
	 EMhvl3n/uAxQb+CJzvPmKLKSVwE8WVK8MHVKn9fHjaE+bB7v5ptamZkJ/t80te3tLM
	 zBi/vxlvIltw6I0xnyPNHkNJqiU1UBNMgCcSTS/g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Benoit Parrot <bparrot@ti.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mike Isely <isely@pobox.com>,
	Hans de Goede <hansg@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Abhishek Tamboli <abhishektamboli9@gmail.com>,
	Akash Kumar <quic_akakum@quicinc.com>,
	linux-doc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 26/76] media: Set file->private_data in v4l2_fh_add()
Date: Sun, 10 Aug 2025 04:30:08 +0300
Message-ID: <20250810013100.29776-27-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-fh.rst    | 42 ++++++++++---------
 .../zh_CN/video4linux/v4l2-framework.txt      |  5 +--
 drivers/media/pci/cx18/cx18-fileops.c         |  3 +-
 drivers/media/pci/ivtv/ivtv-fileops.c         |  4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c   |  3 +-
 drivers/media/pci/saa7164/saa7164-vbi.c       |  3 +-
 .../media/platform/allegro-dvt/allegro-core.c |  3 +-
 .../media/platform/amlogic/meson-ge2d/ge2d.c  |  3 +-
 drivers/media/platform/amphion/vpu_v4l2.c     |  3 +-
 .../platform/chips-media/coda/coda-common.c   |  3 +-
 .../chips-media/wave5/wave5-vpu-dec.c         |  3 +-
 .../chips-media/wave5/wave5-vpu-enc.c         |  3 +-
 .../platform/imagination/e5010-jpeg-enc.c     |  3 +-
 drivers/media/platform/m2m-deinterlace.c      |  3 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  3 +-
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c |  3 +-
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  3 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  3 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  3 +-
 .../media/platform/nvidia/tegra-vde/v4l2.c    |  3 +-
 drivers/media/platform/nxp/dw100/dw100.c      |  3 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  3 +-
 drivers/media/platform/nxp/imx-pxp.c          |  3 +-
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  3 +-
 drivers/media/platform/nxp/mx2_emmaprp.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c  |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      |  3 +-
 drivers/media/platform/qcom/venus/venc.c      |  3 +-
 drivers/media/platform/renesas/rcar_fdp1.c    |  3 +-
 drivers/media/platform/renesas/rcar_jpu.c     |  3 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  4 +-
 drivers/media/platform/rockchip/rga/rga.c     |  3 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  3 +-
 .../platform/samsung/exynos-gsc/gsc-m2m.c     |  3 +-
 .../platform/samsung/exynos4-is/fimc-m2m.c    |  3 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c  |  3 +-
 .../platform/samsung/s5p-jpeg/jpeg-core.c     |  3 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  3 +-
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  |  3 +-
 .../media/platform/st/sti/delta/delta-v4l2.c  |  3 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c  |  3 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c |  3 +-
 .../media/platform/sunxi/sun8i-di/sun8i-di.c  |  3 +-
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  3 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  3 +-
 drivers/media/platform/ti/vpe/vpe.c           |  3 +-
 .../media/platform/verisilicon/hantro_drv.c   |  3 +-
 .../media/test-drivers/vicodec/vicodec-core.c |  3 +-
 drivers/media/test-drivers/vim2m.c            |  3 +-
 drivers/media/test-drivers/visl/visl-core.c   |  3 +-
 drivers/media/usb/hdpvr/hdpvr-video.c         |  3 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |  3 +-
 drivers/media/usb/uvc/uvc_v4l2.c              |  3 +-
 drivers/media/v4l2-core/v4l2-fh.c             |  7 ++--
 drivers/media/v4l2-core/v4l2-subdev.c         |  3 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |  3 +-
 drivers/staging/media/meson/vdec/vdec.c       |  3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  3 +-
 drivers/staging/most/video/video.c            |  4 +-
 drivers/usb/gadget/function/uvc_v4l2.c        |  3 +-
 include/media/v4l2-fh.h                       |  5 ++-
 61 files changed, 89 insertions(+), 144 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index 2c87b74578d9..a7393067f5db 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -11,25 +11,22 @@ data that is used by the V4L2 framework.
 	since it is also used to implement priority handling
 	(:ref:`VIDIOC_G_PRIORITY`).
 
-The users of :c:type:`v4l2_fh` (in the V4L2 framework, not the driver) know
-whether a driver uses :c:type:`v4l2_fh` as its ``file->private_data`` pointer
-by testing the ``V4L2_FL_USES_V4L2_FH`` bit in :c:type:`video_device`->flags.
-This bit is set whenever :c:func:`v4l2_fh_init` is called.
+struct v4l2_fh is allocated in the driver's ``open()`` file operation handler.
+It is typically embedded in a larger driver-specific structure. The
+:c:type:`v4l2_fh` must be initialized with a call to :c:func:`v4l2_fh_init`,
+and added to the video device with :c:func:`v4l2_fh_add`. This associates the
+:c:type:`v4l2_fh` with the :c:type:`file` by setting ``file->private_data`` to
+point to the :c:type:`v4l2_fh`.
 
-struct v4l2_fh is allocated as a part of the driver's own file handle
-structure and ``file->private_data`` is set to it in the driver's ``open()``
-function by the driver. The :c:type:`v4l2_fh` file handle can be retrieved
-from the :c:type:`file` using :c:func:`file_to_v4l2_fh`. Drivers must not
-access ``file->private_data`` directly.
+Similarly, the struct v4l2_fh is freed in the driver's ``release()`` file
+operation handler. It must be removed from the video device with
+:c:func:`v4l2_fh_del` and cleaned up with :c:func:`v4l2_fh_exit` before being
+freed.
 
-In many cases the struct v4l2_fh will be embedded in a larger
-structure. In that case you should call:
-
-#) :c:func:`v4l2_fh_init` and :c:func:`v4l2_fh_add` in ``open()``
-#) :c:func:`v4l2_fh_del` and :c:func:`v4l2_fh_exit` in ``release()``
-
-Drivers can extract their own file handle structure by using the container_of
-macro.
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
index a9eb62fa1531..2d38ae17d940 100644
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
index 89e38b303630..f90b547f5d67 100644
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
index 67964a3c382c..aa5f5f16427c 100644
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
index 296f50b6b8d3..e6e353a251cf 100644
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
index a7e398f30472..181442fcb43b 100644
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
index 74977f3ae484..8c30f3cd4fc5 100644
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
index c7df29a2d820..d36891b546bc 100644
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
index 57ca6262bb04..e13bfe09af1b 100644
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
index 459b59149390..7d874fd502b8 100644
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
index f3188d720ed3..88eb933a5144 100644
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
index b69a1206fa12..322c1498758a 100644
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
index 295461325862..1da00ff4b1e3 100644
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
index 1812c07837ad..a343dffd19f0 100644
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
index 3a7a6eb53d89..5178a1b170fe 100644
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
index 2d894b5bfaa7..7a1a8e51dbca 100644
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
index 886ff25c70eb..847d6b310e74 100644
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
index 18801883c31a..952a77c383bd 100644
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
index e26a6c3ffa0c..9cacb6cbcf28 100644
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
index 393dc3f07d5c..688b776b3010 100644
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
index 2460f09a6813..2bd30910ddf9 100644
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
index 8eef7ebd0428..d7cecc56a9eb 100644
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
index 879b1803a2b3..9602409f3ece 100644
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
index 6444392c5e62..d6df6e2725f5 100644
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
index 5c8c6285ec1e..8c8f834e6250 100644
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
index 64ebec2ca6b3..cdd34a3b71ff 100644
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
index d10ca6d89f6d..55c27345b7d8 100644
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
index 0838d64ce8fe..fba07557a399 100644
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
index 12a5dcc0ca6c..f1ea303ac038 100644
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
index 7d5e9df53dfb..d0d4ee3f8bdc 100644
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
index 656fb5e6cb30..b6dc1ee3dc50 100644
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
index 8a6e618d605c..d88817023996 100644
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
index 41ab90cbcc0c..2fbad685e92c 100644
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
index 968bb4327b7a..39d84ffd1b05 100644
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
index feedf60dad09..b002b02a899e 100644
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
index 44fcedbbc90a..e34cae9c9cf6 100644
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
index a5ecfe03db09..9e35dd939ad7 100644
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
index dd9761df59df..74629db05121 100644
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
index f3844e4e47ca..5e983799e298 100644
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
index a12fdbd8abed..3063a98ed25b 100644
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
index 29142c806cb7..2f9413fa7318 100644
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
index f4c5d73447a7..b2bced06a1e6 100644
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
index e9c7c99fbc55..7823eb97faf7 100644
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
index 9ea65cb7187f..368a858b8c0f 100644
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
index b76d40aeca17..d10a2b96c13c 100644
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
index 4b9b2bec7377..a47c5d31c475 100644
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
index b20b9c7f4131..aadc3d8fb3d1 100644
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
index e27f6761cba1..f20d9d9643f5 100644
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
index 55d885be5bcc..24574025f58f 100644
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
index 5bf3136b36eb..0f43ec23f40b 100644
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
index ea17f1a5f5b0..6c6e467f8554 100644
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
index 481b03bbecf8..04c77af0c51e 100644
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
index 6dd329a972fd..09677ed639ae 100644
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
index 7a5f7aa5e253..b59b1084d8cd 100644
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
index 29d3b788b288..bf35ac436249 100644
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
index fb67b383436d..7fedb33dda34 100644
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
index f1ee53f9f298..b92666ff50a1 100644
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
index 80b43187f6ee..ebefd646dbdb 100644
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
index 116331cead2a..24a68e3e5419 100644
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
index 886300a29b90..680f25d17dc2 100644
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
index 14e7136e693f..d8fcf49f10e0 100644
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
Regards,

Laurent Pinchart


