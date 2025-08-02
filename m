Return-Path: <linux-media+bounces-38750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F88B18BF2
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95F3F7A42B9
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C434246BCD;
	Sat,  2 Aug 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rFG4CQtr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3354F2222B4;
	Sat,  2 Aug 2025 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126720; cv=none; b=TfwFtjYQXx8DCJn2xR31sP64Gb4TfGU50mMEQa2tqN/GLfA0dty4qJaL5sRHMpbOdU5/x8vjm8iZEj/NhDhPyd+k0raeky/v7YdK4CQ7pKI77g3r/yD713bSaI4CHgR+vx74DZUCqHecNjUAnbpa5OTBGG3wLMjasmmo/JRYEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126720; c=relaxed/simple;
	bh=JH4pyiH1IYy7ONTnie74fJF2p0cwDMovrqBAsP6oUlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETzt4NsZ0/v+SXs52ZR5fbSoBzgWw0D55dcNAIs+I5MJTOiw7gq7OJI/On7vCrhv/DelQ34lkYLdEPNZYLDnlha/a1FaVTyn9RKlivMifgBKSBbKQj2iNsSISJueqaMsBGsvDgoWA80PmXjnEQ/QdiB3JdANfsLIPmbIw/0ZtKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rFG4CQtr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED15B32CA;
	Sat,  2 Aug 2025 11:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126669;
	bh=JH4pyiH1IYy7ONTnie74fJF2p0cwDMovrqBAsP6oUlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rFG4CQtrfqkzxmcS/aCmywjrbk563f+RrC/3SE6H05ZA7rG5Mm3t20dAC5ZUHw8LB
	 jlShiIzAZPs0DutWvAZFE847i20BUl4usB/2a1bVTO+tg/n4TdvwXF74NZ1cZxPN42
	 BONj/HLbA1H7s1D81pnqWrNh1WLkDBUtH4tsu/7A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:33 +0200
Subject: [PATCH 11/65] media: Replace file->private_data access with custom
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=61718;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=tykG4RFPosriRJxJbDj8GzFXMR1j9aCB/cWW38tiygA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj4cDiFdpyp/184uWzE42I1uMfp0U83coNSz
 TAaHXOey1yJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+AAKCRByNAaPFqFW
 PBTjEADFLzlXRpytji5w2QArq6lVsiKr8D1H0xkdlPAx2Chyp6+DNfK+/WWclxCoqPc/qBHewbw
 mE+0Cmp5jtwVX/cj/75RZLzqzodVRC4z02kMuEP4xQhqu7o169nUhMZDtnp6Lo7wDPceKvgspGp
 hxkfxRtD0nvCRpZDxxwuzTptqz5MW8AqUkRECnxQxZ6NfFYlTp+7PerNXO7H//qyed33zcEW4+A
 qRt/1U1502+01kjt0xE2W28EA0cLqECn0+LVPRt8OaF+FK9RVS/1d8ByNIHWyrgeqnNcD82Df2d
 8VIYVMtIIkDx77RtVVPM0apuNYfCeMGuGYagW9qzr/kOEyNoSjPfyKih+3NjcaNKrnZrYNnzW5t
 1CNhECh4K6HmfyeL3AvAc5WeDxAYGwYAwa/484EfvLuC1jaC8oLh2xsmqkUmt3+JEa+VPOWLopc
 lrr2RsTJ4t//bZN9fr8Jgnq3UqeB6HV+l+fn55U1J1jBwguql2QM8EqB+f6KYYCGB5y1DakQzez
 LC5Atex2cN2VY0UcZNJhkXvjrVrP11Cr+JuLOt4Dq/Zw5yEfe1Bw5mK8/G+h/+9eA5j1V/0E/7a
 LxaQDG227I2VnFTqDw5Pto31bHQFWyEHsnxbj5MlAntUIXVP392X60aqDguwOqU/da2uon2/x50
 FB7bMSDZbcHK5EA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

Replace all remaining locations that read the v4l2_fh pointer directly
from file->private_data and cast it to driver-specific file handle
structures with driver-specific functions that use file_to_v4l2_fh() and
perform the same cast.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/ivtv/ivtv-driver.h               |  5 ++++
 drivers/media/pci/ivtv/ivtv-fileops.c              | 10 +++----
 drivers/media/pci/ivtv/ivtv-ioctl.c                |  8 +++---
 drivers/media/platform/allegro-dvt/allegro-core.c  |  7 ++++-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  8 ++++--
 .../media/platform/chips-media/coda/coda-common.c  |  7 ++++-
 .../platform/chips-media/wave5/wave5-helper.c      |  2 +-
 .../media/platform/chips-media/wave5/wave5-vpu.h   |  5 ++++
 drivers/media/platform/m2m-deinterlace.c           |  7 ++++-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 ++++-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  7 ++++-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  7 ++++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |  2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  5 ++++
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |  2 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |  5 ++++
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  7 ++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  7 ++++-
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 ++++-
 drivers/media/platform/renesas/rcar_fdp1.c         |  7 ++++-
 drivers/media/platform/renesas/rcar_jpu.c          |  7 ++++-
 drivers/media/platform/rockchip/rga/rga.c          |  3 +--
 drivers/media/platform/rockchip/rga/rga.h          |  5 ++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  2 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  5 ++++
 .../media/platform/samsung/exynos-gsc/gsc-core.h   |  6 +++++
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  6 ++---
 .../media/platform/samsung/exynos4-is/fimc-core.h  |  5 ++++
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  2 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  7 +++--
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  9 +++++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  6 ++---
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  6 +++++
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  7 ++++-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   | 26 +++++++++++-------
 drivers/media/platform/st/sti/hva/hva-v4l2.c       | 31 ++++++++++++----------
 drivers/media/platform/st/sti/hva/hva.h            |  2 --
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  7 +++--
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  3 +--
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  3 +--
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  4 +--
 drivers/media/platform/ti/omap3isp/ispvideo.h      |  6 +++++
 drivers/media/platform/verisilicon/hantro.h        |  5 ++++
 drivers/media/platform/verisilicon/hantro_drv.c    |  3 +--
 drivers/staging/media/imx/imx-media-csc-scaler.c   |  7 ++++-
 drivers/staging/media/meson/vdec/vdec.c            | 24 ++++++-----------
 drivers/staging/media/meson/vdec/vdec.h            |  5 ++++
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  3 +--
 drivers/staging/media/sunxi/cedrus/cedrus.h        |  5 ++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  5 ----
 50 files changed, 237 insertions(+), 100 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc64a5b7d3e48c1ab32b49a7989242..cad548b28e360ecfe2bcb9fcb5d12cd8823c3727 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -388,6 +388,11 @@ static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
 	return container_of(fh, struct ivtv_open_id, fh);
 }
 
+static inline struct ivtv_open_id *file2id(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct ivtv_open_id, fh);
+}
+
 struct yuv_frame_info
 {
 	u32 update;
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 230d498108b5b0d44a238cd87dcea061811af814..cc91695a5b7605dcd964bd2c68bb12f645dc302f 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -502,7 +502,7 @@ int ivtv_start_capture(struct ivtv_open_id *id)
 
 ssize_t ivtv_v4l2_read(struct file * filp, char __user *buf, size_t count, loff_t * pos)
 {
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 	ssize_t rc;
@@ -564,7 +564,7 @@ static int ivtv_schedule_dma(struct ivtv_stream *s)
 
 static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t count, loff_t *pos)
 {
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 	struct yuv_playback_info *yi = &itv->yuv_info;
@@ -719,7 +719,7 @@ static ssize_t ivtv_write(struct file *filp, const char __user *user_buf, size_t
 
 ssize_t ivtv_v4l2_write(struct file *filp, const char __user *user_buf, size_t count, loff_t *pos)
 {
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	ssize_t res;
 
@@ -732,7 +732,7 @@ ssize_t ivtv_v4l2_write(struct file *filp, const char __user *user_buf, size_t c
 
 __poll_t ivtv_v4l2_dec_poll(struct file *filp, poll_table *wait)
 {
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 	__poll_t res = 0;
@@ -767,7 +767,7 @@ __poll_t ivtv_v4l2_dec_poll(struct file *filp, poll_table *wait)
 __poll_t ivtv_v4l2_enc_poll(struct file *filp, poll_table *wait)
 {
 	__poll_t req_events = poll_requested_events(wait);
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 	int eof = test_bit(IVTV_F_S_STREAMOFF, &s->s_flags);
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 7947dcd615e882da5240ed6b10dde8449036d019..d888435b71fb6f6873d9d884248a67364576bf33 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -727,7 +727,7 @@ static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_re
 
 static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vcap)
 {
-	struct ivtv_open_id *id = fh2id(file->private_data);
+	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
 	struct ivtv *itv = id->itv;
 
 	strscpy(vcap->driver, IVTV_DRIVER_NAME, sizeof(vcap->driver));
@@ -1584,7 +1584,7 @@ static int ivtv_log_status(struct file *file, void *fh)
 
 static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file->private_data);
+	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_DECODER_CMD %d\n", dec->cmd);
@@ -1593,7 +1593,7 @@ static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 
 static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file->private_data);
+	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_TRY_DECODER_CMD %d\n", dec->cmd);
@@ -1602,7 +1602,7 @@ static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder
 
 static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 {
-	struct ivtv_open_id *id = fh2id(filp->private_data);
+	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(filp));
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 1f134e08923a528cc676f825da68951c97ac2f25..74977f3ae4844022c04de877f31b4fc6aaac0749 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -302,6 +302,11 @@ struct allegro_channel {
 	unsigned int error;
 };
 
+static inline struct allegro_channel *file_to_channel(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct allegro_channel, fh);
+}
+
 static inline int
 allegro_channel_get_i_frame_qp(struct allegro_channel *channel)
 {
@@ -3229,7 +3234,7 @@ static int allegro_open(struct file *file)
 
 static int allegro_release(struct file *file)
 {
-	struct allegro_channel *channel = fh_to_channel(file->private_data);
+	struct allegro_channel *channel = file_to_channel(file);
 
 	v4l2_m2m_ctx_release(channel->fh.m2m_ctx);
 
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 0c004bb8ba05059245e73a306ed2d20dc18c9197..c7df29a2d82012b7fc290edf3f629a0c3ed7bcc8 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -82,6 +82,11 @@ struct ge2d_ctx {
 	u32 xy_swap;
 };
 
+static inline struct ge2d_ctx *file_to_ge2d_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct ge2d_ctx, fh);
+}
+
 struct meson_ge2d {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_m2m_dev *m2m_dev;
@@ -871,8 +876,7 @@ static int ge2d_open(struct file *file)
 
 static int ge2d_release(struct file *file)
 {
-	struct ge2d_ctx *ctx =
-		container_of(file->private_data, struct ge2d_ctx, fh);
+	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
 	struct meson_ge2d *ge2d = ctx->ge2d;
 
 	mutex_lock(&ge2d->mutex);
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index e6e3f5ec24f691fd5eac1896efc69d8541a49bf3..92fb24cace8ef75e70eb2aae96bc169a7cf97563 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -56,6 +56,11 @@
 
 #define fh_to_ctx(__fh)	container_of(__fh, struct coda_ctx, fh)
 
+static inline struct coda_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct coda_ctx, fh);
+}
+
 int coda_debug;
 module_param(coda_debug, int, 0644);
 MODULE_PARM_DESC(coda_debug, "Debug level (0-2)");
@@ -2733,7 +2738,7 @@ static int coda_open(struct file *file)
 static int coda_release(struct file *file)
 {
 	struct coda_dev *dev = video_drvdata(file);
-	struct coda_ctx *ctx = fh_to_ctx(file->private_data);
+	struct coda_ctx *ctx = file_to_ctx(file);
 
 	coda_dbg(1, ctx, "release instance (%p)\n", ctx);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4b7e688408099a9d73e12eed5435b..031dea0ee61c6c5afddf7ff47d67d85826f16d8d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -59,7 +59,7 @@ int wave5_vpu_release_device(struct file *filp,
 			     int (*close_func)(struct vpu_instance *inst, u32 *fail_res),
 			     char *name)
 {
-	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
+	struct vpu_instance *inst = file_to_vpu_inst(filp);
 	int ret = 0;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 3847332551fc06555b4ba78d12abd2bc653ffea7..1e8fda9a010da3e7df3b37cfd3e39510d9e85bb3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -46,6 +46,11 @@ static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
 	return container_of(vfh, struct vpu_instance, v4l2_fh);
 }
 
+static inline struct vpu_instance *file_to_vpu_inst(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct vpu_instance, v4l2_fh);
+}
+
 static inline struct vpu_instance *wave5_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
 {
 	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 5188f31890966735c6eba990587627f43ff84378..1812c07837ad33e10db9005fd2009b4ea2a799d0 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -142,6 +142,11 @@ struct deinterlace_ctx {
 	struct dma_interleaved_template *xt;
 };
 
+static inline struct deinterlace_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct deinterlace_ctx, fh);
+}
+
 /*
  * mem2mem callbacks
  */
@@ -872,7 +877,7 @@ static int deinterlace_open(struct file *file)
 static int deinterlace_release(struct file *file)
 {
 	struct deinterlace_dev *pcdev = video_drvdata(file);
-	struct deinterlace_ctx *ctx = file->private_data;
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 
 	dprintk(pcdev, "Releasing instance %p\n", ctx);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 329e5787c2c282c43dcee80ceb0f1ba337324b74..bf7cae1993d5e21975bc9dffcbcfb3fe1843d575 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -124,6 +124,11 @@ static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_jpeg_ctx, fh);
 }
 
+static inline struct mtk_jpeg_ctx *mtk_jpeg_file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mtk_jpeg_ctx, fh);
+}
+
 static inline struct mtk_jpeg_src_buf *mtk_jpeg_vb2_to_srcbuf(
 							struct vb2_buffer *vb)
 {
@@ -1208,7 +1213,7 @@ static int mtk_jpeg_open(struct file *file)
 static int mtk_jpeg_release(struct file *file)
 {
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(file->private_data);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d0fd77dcf8e20fcd7a483f1fd0ce234f5ac2bf6b..e3e01a9a0f78cb2fe665132bd1bde66afa63bddb 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -353,6 +353,11 @@ static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_mdp_ctx, fh);
 }
 
+static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mtk_mdp_ctx, fh);
+}
+
 static inline struct mtk_mdp_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mtk_mdp_ctx, ctrl_handler);
@@ -1137,7 +1142,7 @@ static int mtk_mdp_m2m_open(struct file *file)
 
 static int mtk_mdp_m2m_release(struct file *file)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(file->private_data);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 
 	flush_workqueue(mdp->job_wq);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 59ce5cce069836a6902df686f4dd91b13fa729f2..8ebab14c535bfe023d720964965d97f758e5eb63 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -15,6 +15,11 @@ static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mdp_m2m_ctx, fh);
 }
 
+static inline struct mdp_m2m_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mdp_m2m_ctx, fh);
+}
+
 static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mdp_m2m_ctx, ctrl_handler);
@@ -643,7 +648,7 @@ static int mdp_m2m_open(struct file *file)
 
 static int mdp_m2m_release(struct file *file)
 {
-	struct mdp_m2m_ctx *ctx = fh_to_ctx(file->private_data);
+	struct mdp_m2m_ctx *ctx = file_to_ctx(file);
 	struct mdp_dev *mdp = video_drvdata(file);
 	struct device *dev = &mdp->pdev->dev;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 9247d92d431d8570609423156b989878f7901f1c..18801883c31a80b2179eb0d9280150eeb4aa3770 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -294,7 +294,7 @@ static int fops_vcodec_open(struct file *file)
 static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_dec_dev *dev = video_drvdata(file);
-	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(file->private_data);
+	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 
 	mtk_v4l2_vdec_dbg(0, ctx, "[%d] decoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index aececca7ecf8936bb2b3b55c99354af983746b30..75156c77405e59e148ed820dba70d90aa7e1fae8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -314,6 +314,11 @@ static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_vcodec_dec_ctx, fh);
 }
 
+static inline struct mtk_vcodec_dec_ctx *file_to_dec_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mtk_vcodec_dec_ctx, fh);
+}
+
 static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index a1e4483abcdbdec22afc4747f439ea56c7181b75..e26a6c3ffa0cee17385575215b55b575b14e58f4 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -203,7 +203,7 @@ static int fops_vcodec_open(struct file *file)
 static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_enc_dev *dev = video_drvdata(file);
-	struct mtk_vcodec_enc_ctx *ctx = fh_to_enc_ctx(file->private_data);
+	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
 
 	mtk_v4l2_venc_dbg(1, ctx, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0bd85d0fb379acbba3ac07c01e780cf57bef0305..402e7d31d03d1985ad5ff2831faffc5c31b63467 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -222,6 +222,11 @@ static inline struct mtk_vcodec_enc_ctx *fh_to_enc_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_vcodec_enc_ctx, fh);
 }
 
+static inline struct mtk_vcodec_enc_ctx *file_to_enc_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mtk_vcodec_enc_ctx, fh);
+}
+
 static inline struct mtk_vcodec_enc_ctx *ctrl_to_enc_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mtk_vcodec_enc_ctx, ctrl_hdl);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1b2148578cb6751056b4111c6542f01d76c292c8..a17a020ea4c698bfa57253f0f53a17230d52dea3 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -649,6 +649,11 @@ static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mxc_jpeg_ctx, fh);
 }
 
+static inline struct mxc_jpeg_ctx *mxc_jpeg_file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mxc_jpeg_ctx, fh);
+}
+
 static int enum_fmt(const struct mxc_jpeg_fmt *mxc_formats, int n,
 		    struct v4l2_fmtdesc *f, u32 type)
 {
@@ -2735,7 +2740,7 @@ static const struct v4l2_ioctl_ops mxc_jpeg_ioctl_ops = {
 static int mxc_jpeg_release(struct file *file)
 {
 	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(file->private_data);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct device *dev = mxc_jpeg->dev;
 
 	mutex_lock(&mxc_jpeg->lock);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..9226e42b95fc91ed5490be1599a539f0fdeeb123 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -79,6 +79,11 @@ static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
 }
 
+static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mxc_isi_m2m_ctx, fh);
+}
+
 static inline struct mxc_isi_m2m_ctx_queue_data *
 mxc_isi_m2m_ctx_qdata(struct mxc_isi_m2m_ctx *ctx, enum v4l2_buf_type type)
 {
@@ -707,7 +712,7 @@ static int mxc_isi_m2m_open(struct file *file)
 static int mxc_isi_m2m_release(struct file *file)
 {
 	struct mxc_isi_m2m *m2m = video_drvdata(file);
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mxc_isi_m2m_ctx_ctrls_delete(ctx);
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 0c6cc120fd2a443db4dbc583f2cdb1cfd61b6a7e..5c8c6285ec1e7b2e8df64132228e71e1b097183e 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -214,6 +214,11 @@ struct emmaprp_ctx {
 	struct emmaprp_q_data	q_data[2];
 };
 
+static inline struct emmaprp_ctx *file_to_emmaprp_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct emmaprp_ctx, fh);
+}
+
 static struct emmaprp_q_data *get_q_data(struct emmaprp_ctx *ctx,
 					 enum v4l2_buf_type type)
 {
@@ -758,7 +763,7 @@ static int emmaprp_open(struct file *file)
 static int emmaprp_release(struct file *file)
 {
 	struct emmaprp_dev *pcdev = video_drvdata(file);
-	struct emmaprp_ctx *ctx = file->private_data;
+	struct emmaprp_ctx *ctx = file_to_emmaprp_ctx(file);
 
 	dprintk(pcdev, "Releasing instance %p\n", ctx);
 
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 5d453a7a89889fa3fd115da5f87b4bb24554a3c6..f11ea9dc5027bdd89262270f4e3979a06650d9bc 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -635,6 +635,11 @@ static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct fdp1_ctx, fh);
 }
 
+static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct fdp1_ctx, fh);
+}
+
 static struct fdp1_q_data *get_q_data(struct fdp1_ctx *ctx,
 					 enum v4l2_buf_type type)
 {
@@ -2158,7 +2163,7 @@ static int fdp1_open(struct file *file)
 static int fdp1_release(struct file *file)
 {
 	struct fdp1_dev *fdp1 = video_drvdata(file);
-	struct fdp1_ctx *ctx = fh_to_ctx(file->private_data);
+	struct fdp1_ctx *ctx = file_to_ctx(file);
 
 	dprintk(fdp1, "Releasing instance %p\n", ctx);
 
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 81038df71bb5d9b4b7464cedd7ca9bf38744921e..3ee51f53b0cd1c221cefd0ce93acbcda55faa4a6 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -485,6 +485,11 @@ static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct jpu_ctx, fh);
 }
 
+static struct jpu_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct jpu_ctx, fh);
+}
+
 static void jpu_set_tbl(struct jpu *jpu, u32 reg, const unsigned int *tbl,
 			unsigned int len) {
 	unsigned int i;
@@ -1281,7 +1286,7 @@ static int jpu_open(struct file *file)
 static int jpu_release(struct file *file)
 {
 	struct jpu *jpu = video_drvdata(file);
-	struct jpu_ctx *ctx = fh_to_ctx(file->private_data);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3dccab5fa4a131289c18150e6afbf3309cde318b..8a6e618d605c216b5113062d90df03dc632dc7c8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -411,8 +411,7 @@ static int rga_open(struct file *file)
 
 static int rga_release(struct file *file)
 {
-	struct rga_ctx *ctx =
-		container_of(file->private_data, struct rga_ctx, fh);
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 
 	mutex_lock(&rga->mutex);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 530e12de73c4f574f13e60fc2540b425263bd3ef..72a28b120fabfdce39e7773358d0c9528019e882 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -68,6 +68,11 @@ struct rga_ctx {
 	u32 fill_color;
 };
 
+static inline struct rga_ctx *file_to_rga_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct rga_ctx, fh);
+}
+
 struct rockchip_rga {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_m2m_dev *m2m_dev;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc1f6a18b2d168ebdf20b443f2240e..41ab90cbcc0cdbe279f6512decc4301b6cff2dfa 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -953,7 +953,7 @@ static int rkvdec_open(struct file *filp)
 
 static int rkvdec_release(struct file *filp)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(filp->private_data);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(filp);
 
 	v4l2_fh_del(&ctx->fh);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f6e8bf38add3a0bf00a5dedd244931aca4a28e0a..35effe9467845fdfc4ffea432211d1d2e75a08b0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -129,6 +129,11 @@ static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct rkvdec_ctx, fh);
 }
 
+static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
+}
+
 struct rkvdec_aux_buf {
 	void *cpu;
 	dma_addr_t dma;
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
index b9777e07fb6d14f8e9a97ee593a09a412326f157..a5491fe39e0f686c75c888c4632150f32326c36e 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
@@ -86,6 +86,7 @@ enum gsc_yuv_fmt {
 };
 
 #define fh_to_ctx(__fh) container_of(__fh, struct gsc_ctx, fh)
+
 #define is_rgb(x) (!!((x) & 0x1))
 #define is_yuv420(x) (!!((x) & 0x2))
 #define is_yuv422(x) (!!((x) & 0x4))
@@ -381,6 +382,11 @@ struct gsc_ctx {
 	enum v4l2_colorspace out_colorspace;
 };
 
+static inline struct gsc_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct gsc_ctx, fh);
+}
+
 void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm);
 int gsc_register_m2m_device(struct gsc_dev *gsc);
 void gsc_unregister_m2m_device(struct gsc_dev *gsc);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 4bda1c369c44c41265a42f2bab6f70ec532881bd..968bb4327b7a1697641815dfb08dc64251f5e927 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -666,7 +666,7 @@ static int gsc_m2m_open(struct file *file)
 
 static int gsc_m2m_release(struct file *file)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 
 	pr_debug("pid: %d, state: 0x%lx, refcnt= %d",
@@ -690,7 +690,7 @@ static int gsc_m2m_release(struct file *file)
 static __poll_t gsc_m2m_poll(struct file *file,
 					struct poll_table_struct *wait)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 	__poll_t ret;
 
@@ -705,7 +705,7 @@ static __poll_t gsc_m2m_poll(struct file *file,
 
 static int gsc_m2m_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 	int ret;
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.h b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
index 63385152a2ffe82e9871497733971cfc8a1a1238..25711df062e79eb2066f0f6eab1c1733f16c9c2d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -498,6 +498,11 @@ struct fimc_ctx {
 
 #define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
 
+static inline struct fimc_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct fimc_ctx, fh);
+}
+
 static inline void set_frame_bounds(struct fimc_frame *f, u32 width, u32 height)
 {
 	f->o_width  = width;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 951433c8e92a5b75bad59f2e0dbf7d56f6726dee..feedf60dad09bd413cb8fe65d965fd39b26b8764 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -675,7 +675,7 @@ static int fimc_m2m_open(struct file *file)
 
 static int fimc_m2m_release(struct file *file)
 {
-	struct fimc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct fimc_ctx *ctx = file_to_ctx(file);
 	struct fimc_dev *fimc = ctx->fimc_dev;
 
 	dbg("pid: %d, state: 0x%lx, refcnt= %d",
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index ffed16a34493be2edbdaee13619467417487c1e7..44fcedbbc90a9863827aacbcd5f56d850cb552ea 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -25,7 +25,10 @@
 #include "g2d.h"
 #include "g2d-regs.h"
 
-#define fh2ctx(__fh) container_of(__fh, struct g2d_ctx, fh)
+static inline struct g2d_ctx *file2ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct g2d_ctx, fh);
+}
 
 static struct g2d_fmt formats[] = {
 	{
@@ -272,7 +275,7 @@ static int g2d_open(struct file *file)
 static int g2d_release(struct file *file)
 {
 	struct g2d_dev *dev = video_drvdata(file);
-	struct g2d_ctx *ctx = fh2ctx(file->private_data);
+	struct g2d_ctx *ctx = file2ctx(file);
 
 	mutex_lock(&dev->mutex);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index ac4cf269456a93ccb61c4978d81663e18124ca11..a8d0dddb1fb5b5344ac9c96657fcf17a575d6a26 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -585,6 +585,11 @@ static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct s5p_jpeg_ctx, fh);
 }
 
+static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
+}
+
 static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
 {
 	switch (ctx->jpeg->variant->version) {
@@ -1012,7 +1017,7 @@ static int s5p_jpeg_open(struct file *file)
 static int s5p_jpeg_release(struct file *file)
 {
 	struct s5p_jpeg *jpeg = video_drvdata(file);
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(file->private_data);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
@@ -1828,7 +1833,7 @@ static int s5p_jpeg_g_selection(struct file *file, void *priv,
 static int s5p_jpeg_s_selection(struct file *file, void *fh,
 				  struct v4l2_selection *s)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(file->private_data);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct v4l2_rect *rect = &s->r;
 	int ret = -EINVAL;
 
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 73fdcd362265ad123b3633b832e40fd3ca70c227..dd9761df59df5dd7b07b4e9afd2d7939c46cb2de 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -970,7 +970,7 @@ static int s5p_mfc_open(struct file *file)
 /* Release MFC context */
 static int s5p_mfc_release(struct file *file)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	/* if dev is null, do cleanup that doesn't need dev */
@@ -1027,7 +1027,7 @@ static int s5p_mfc_release(struct file *file)
 static __poll_t s5p_mfc_poll(struct file *file,
 				 struct poll_table_struct *wait)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct vb2_queue *src_q, *dst_q;
 	struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
@@ -1078,7 +1078,7 @@ static __poll_t s5p_mfc_poll(struct file *file,
 /* Mmap */
 static int s5p_mfc_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(file->private_data);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	int ret;
 
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index 86c316c1ff8f69cd0f172fa14477331e325ed8f5..bdc25f6982d1eb6e846f1604484ea39968526bc0 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -768,6 +768,12 @@ struct mfc_control {
 	((f && f->op) ? f->op(args) : (typeof(f->op(args)))(-ENODEV))
 
 #define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)
+
+static inline struct s5p_mfc_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct s5p_mfc_ctx, fh);
+}
+
 #define ctrl_to_ctx(__ctrl) \
 	container_of((__ctrl)->handler, struct s5p_mfc_ctx, ctrl_handler)
 
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 1eb934490c0b57d89557afa3cc776cdbe4a529ff..26c4e48e5e84bcf315692515448ae615727c454f 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -35,6 +35,11 @@
 
 #define fh_to_ctx(__fh) container_of(__fh, struct bdisp_ctx, fh)
 
+static inline struct bdisp_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct bdisp_ctx, fh);
+}
+
 enum bdisp_dev_flags {
 	ST_M2M_OPEN,            /* Driver opened */
 	ST_M2M_RUNNING,         /* HW device running */
@@ -644,7 +649,7 @@ static int bdisp_open(struct file *file)
 
 static int bdisp_release(struct file *file)
 {
-	struct bdisp_ctx *ctx = fh_to_ctx(file->private_data);
+	struct bdisp_ctx *ctx = file_to_ctx(file);
 	struct bdisp_dev *bdisp = ctx->bdisp_dev;
 
 	dev_dbg(bdisp->dev, "%s\n", __func__);
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 196e6a40335d14898ff7abbb38d2de2f5bcf6789..8282e72af67084ddbb94ed78df87a07e1e8b860f 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -25,6 +25,12 @@
 #define DELTA_PREFIX "[---:----]"
 
 #define to_ctx(__fh) container_of(__fh, struct delta_ctx, fh)
+
+static inline struct delta_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct delta_ctx, fh);
+}
+
 #define to_au(__vbuf) container_of(__vbuf, struct delta_au, vbuf)
 #define to_frame(__vbuf) container_of(__vbuf, struct delta_frame, vbuf)
 
@@ -382,7 +388,7 @@ static int delta_open_decoder(struct delta_ctx *ctx, u32 streamformat,
 static int delta_querycap(struct file *file, void *priv,
 			  struct v4l2_capability *cap)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 
 	strscpy(cap->driver, DELTA_NAME, sizeof(cap->driver));
@@ -396,7 +402,7 @@ static int delta_querycap(struct file *file, void *priv,
 static int delta_enum_fmt_stream(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 
 	if (unlikely(f->index >= delta->nb_of_streamformats))
@@ -410,7 +416,7 @@ static int delta_enum_fmt_stream(struct file *file, void *priv,
 static int delta_enum_fmt_frame(struct file *file, void *priv,
 				struct v4l2_fmtdesc *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 
 	if (unlikely(f->index >= delta->nb_of_pixelformats))
@@ -424,7 +430,7 @@ static int delta_enum_fmt_frame(struct file *file, void *priv,
 static int delta_g_fmt_stream(struct file *file, void *fh,
 			      struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct delta_streaminfo *streaminfo = &ctx->streaminfo;
@@ -452,7 +458,7 @@ static int delta_g_fmt_stream(struct file *file, void *fh,
 
 static int delta_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct delta_frameinfo *frameinfo = &ctx->frameinfo;
@@ -491,7 +497,7 @@ static int delta_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 static int delta_try_fmt_stream(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	u32 streamformat = pix->pixelformat;
@@ -545,7 +551,7 @@ static int delta_try_fmt_stream(struct file *file, void *priv,
 static int delta_try_fmt_frame(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	u32 pixelformat = pix->pixelformat;
@@ -605,7 +611,7 @@ static int delta_try_fmt_frame(struct file *file, void *priv,
 static int delta_s_fmt_stream(struct file *file, void *fh,
 			      struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	struct vb2_queue *vq;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -641,7 +647,7 @@ static int delta_s_fmt_stream(struct file *file, void *fh,
 
 static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	const struct delta_dec *dec = ctx->dec;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -1690,7 +1696,7 @@ static int delta_open(struct file *file)
 
 static int delta_release(struct file *file)
 {
-	struct delta_ctx *ctx = to_ctx(file->private_data);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_dev *delta = ctx->dev;
 	const struct delta_dec *dec = ctx->dec;
 
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 5366c0f92549bb090967a1337ce55d0b0f1d76ce..29142c806cb74a510b2f27e79c9e10ca4088b1e9 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -36,7 +36,10 @@
 #define to_type_str(type) (type == V4L2_BUF_TYPE_VIDEO_OUTPUT ? \
 			   "frame" : "stream")
 
-#define fh_to_ctx(f)    (container_of(f, struct hva_ctx, fh))
+static inline struct hva_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct hva_ctx, fh);
+}
 
 /* registry of available encoders */
 static const struct hva_enc *hva_encoders[] = {
@@ -254,7 +257,7 @@ static void hva_dbg_summary(struct hva_ctx *ctx)
 static int hva_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_dev *hva = ctx_to_hdev(ctx);
 
 	strscpy(cap->driver, HVA_NAME, sizeof(cap->driver));
@@ -268,7 +271,7 @@ static int hva_querycap(struct file *file, void *priv,
 static int hva_enum_fmt_stream(struct file *file, void *priv,
 			       struct v4l2_fmtdesc *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_dev *hva = ctx_to_hdev(ctx);
 
 	if (unlikely(f->index >= hva->nb_of_streamformats))
@@ -282,7 +285,7 @@ static int hva_enum_fmt_stream(struct file *file, void *priv,
 static int hva_enum_fmt_frame(struct file *file, void *priv,
 			      struct v4l2_fmtdesc *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_dev *hva = ctx_to_hdev(ctx);
 
 	if (unlikely(f->index >= hva->nb_of_pixelformats))
@@ -295,7 +298,7 @@ static int hva_enum_fmt_frame(struct file *file, void *priv,
 
 static int hva_g_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_streaminfo *streaminfo = &ctx->streaminfo;
 
 	f->fmt.pix.width = streaminfo->width;
@@ -314,7 +317,7 @@ static int hva_g_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 
 static int hva_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_frameinfo *frameinfo = &ctx->frameinfo;
 
 	f->fmt.pix.width = frameinfo->width;
@@ -335,7 +338,7 @@ static int hva_g_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 static int hva_try_fmt_stream(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	u32 streamformat = pix->pixelformat;
@@ -399,7 +402,7 @@ static int hva_try_fmt_stream(struct file *file, void *priv,
 static int hva_try_fmt_frame(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	u32 pixelformat = pix->pixelformat;
@@ -449,7 +452,7 @@ static int hva_try_fmt_frame(struct file *file, void *priv,
 
 static int hva_s_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 	struct vb2_queue *vq;
 	int ret;
@@ -479,7 +482,7 @@ static int hva_s_fmt_stream(struct file *file, void *fh, struct v4l2_format *f)
 
 static int hva_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct vb2_queue *vq;
@@ -517,7 +520,7 @@ static int hva_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 
 static int hva_g_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *time_per_frame = &ctx->ctrls.time_per_frame;
 
 	if (sp->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -533,7 +536,7 @@ static int hva_g_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 
 static int hva_s_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct v4l2_fract *time_per_frame = &ctx->ctrls.time_per_frame;
 
 	if (sp->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -553,7 +556,7 @@ static int hva_s_parm(struct file *file, void *fh, struct v4l2_streamparm *sp)
 
 static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct device *dev = ctx_to_dev(ctx);
 
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -1225,7 +1228,7 @@ static int hva_open(struct file *file)
 
 static int hva_release(struct file *file)
 {
-	struct hva_ctx *ctx = fh_to_ctx(file->private_data);
+	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_dev *hva = ctx_to_hdev(ctx);
 	struct device *dev = ctx_to_dev(ctx);
 	const struct hva_enc *enc = ctx->enc;
diff --git a/drivers/media/platform/st/sti/hva/hva.h b/drivers/media/platform/st/sti/hva/hva.h
index ba6b893416ec47ce371ee9ed886a8ac5acc6cecf..1fe561082a7439a05588c6b399ae1afa5fc0f92c 100644
--- a/drivers/media/platform/st/sti/hva/hva.h
+++ b/drivers/media/platform/st/sti/hva/hva.h
@@ -13,8 +13,6 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-mem2mem.h>
 
-#define fh_to_ctx(f)    (container_of(f, struct hva_ctx, fh))
-
 #define hva_to_dev(h)   (h->dev)
 
 #define ctx_to_dev(c)   (c->hva_dev->dev)
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 48fa781aab06c14cd64e9b9eb1a278a2ef8ca7fc..f4c5d73447a7c3efb0ad5d9bb8a09432c1a8fa60 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -45,7 +45,10 @@
  *   whole of a destination image with a pixel format conversion.
  */
 
-#define fh2ctx(__fh) container_of(__fh, struct dma2d_ctx, fh)
+static inline struct dma2d_ctx *file2ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct dma2d_ctx, fh);
+}
 
 static const struct dma2d_fmt formats[] = {
 	{
@@ -318,7 +321,7 @@ static int dma2d_open(struct file *file)
 static int dma2d_release(struct file *file)
 {
 	struct dma2d_dev *dev = video_drvdata(file);
-	struct dma2d_ctx *ctx = fh2ctx(file->private_data);
+	struct dma2d_ctx *ctx = file2ctx(file);
 
 	mutex_lock(&dev->mutex);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 43755043e8af907fe6755cfe6848ceb655444dfc..e9c7c99fbc559de85c33736a8f459cd216b8cdbf 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -756,8 +756,7 @@ static int deinterlace_open(struct file *file)
 static int deinterlace_release(struct file *file)
 {
 	struct deinterlace_dev *dev = video_drvdata(file);
-	struct deinterlace_ctx *ctx = container_of(file->private_data,
-						   struct deinterlace_ctx, fh);
+	struct deinterlace_ctx *ctx = deinterlace_file2ctx(file);
 
 	mutex_lock(&dev->dev_mutex);
 
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index d0608b5d900fc83a6c63979d21ab3b4ce9a67af9..9ea65cb7187fee323051b1cb62b342e119f7bb3d 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -691,8 +691,7 @@ static int rotate_open(struct file *file)
 static int rotate_release(struct file *file)
 {
 	struct rotate_dev *dev = video_drvdata(file);
-	struct rotate_ctx *ctx = container_of(file->private_data,
-						   struct rotate_ctx, fh);
+	struct rotate_ctx *ctx = rotate_file2ctx(file);
 
 	mutex_lock(&dev->dev_mutex);
 
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index a777135c6a6ca51c85c5a75b76cbc4a8421963ec..b76d40aeca17cf5b8b7619cadf0afe66ff283a9d 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1373,7 +1373,7 @@ static int isp_video_release(struct file *file)
 
 static __poll_t isp_video_poll(struct file *file, poll_table *wait)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(file->private_data);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	__poll_t ret;
 
@@ -1386,7 +1386,7 @@ static __poll_t isp_video_poll(struct file *file, poll_table *wait)
 
 static int isp_video_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(file->private_data);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 
 	return vb2_mmap(&vfh->queue, vma);
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.h b/drivers/media/platform/ti/omap3isp/ispvideo.h
index 1d23df576e6b35f01d8b49a96a0acf1772c2e2c2..355812770e18ef5353ac68e65426a3180a6d91ab 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.h
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
@@ -195,6 +195,12 @@ struct isp_video_fh {
 };
 
 #define to_isp_video_fh(fh)	container_of(fh, struct isp_video_fh, vfh)
+
+static inline struct isp_video_fh *file_to_isp_video_fh(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct isp_video_fh, vfh);
+}
+
 #define isp_video_queue_to_isp_video_fh(q) \
 				container_of(q, struct isp_video_fh, queue)
 
diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 81328c63b796f30be4736c8f263ce72548ed3a24..0f10714f1953945472e11d8c8ad87f8ec009b39f 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -387,6 +387,11 @@ static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct hantro_ctx, fh);
 }
 
+static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
+}
+
 /* Register accessors. */
 static __always_inline void vepu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8542238e0fb1d21576f87b8ebb37585a0144c949..b20b9c7f41319e1d9586d641200aeeebbd1ee761 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -687,8 +687,7 @@ static int hantro_open(struct file *filp)
 
 static int hantro_release(struct file *filp)
 {
-	struct hantro_ctx *ctx =
-		container_of(filp->private_data, struct hantro_ctx, fh);
+	struct hantro_ctx *ctx = file_to_ctx(filp);
 
 	/*
 	 * No need for extra locking because this was the last reference
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 19fd31cb9bb0354b310d40da1f116bb96fd9b0c8..05a54242356c53d19770086dfcc2ed81e1cda4c1 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -66,6 +66,11 @@ struct ipu_csc_scaler_ctx {
 	unsigned int			sequence;
 };
 
+static inline struct ipu_csc_scaler_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct ipu_csc_scaler_ctx, fh);
+}
+
 static struct ipu_csc_scaler_q_data *get_q_data(struct ipu_csc_scaler_ctx *ctx,
 						enum v4l2_buf_type type)
 {
@@ -797,7 +802,7 @@ static int ipu_csc_scaler_open(struct file *file)
 static int ipu_csc_scaler_release(struct file *file)
 {
 	struct ipu_csc_scaler_priv *priv = video_drvdata(file);
-	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(file->private_data);
+	struct ipu_csc_scaler_ctx *ctx = file_to_ctx(file);
 
 	dev_dbg(priv->dev, "Releasing instance %p\n", ctx);
 
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 6d34a482492e8838cf9dbb104315b87abf3f3e3b..f1ee53f9f29868ae7cb02ce00764631f821ee74b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -558,8 +558,7 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 
 static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	vdec_try_fmt_common(sess, sess->core->platform->num_formats, f);
 
@@ -568,8 +567,7 @@ static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -596,8 +594,7 @@ static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	u32 num_formats = sess->core->platform->num_formats;
 	const struct amvdec_format *fmt_out;
@@ -658,8 +655,7 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 	const struct vdec_platform *platform = sess->core->platform;
 	const struct amvdec_format *fmt_out;
 
@@ -688,8 +684,7 @@ static int vdec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 static int vdec_enum_framesizes(struct file *file, void *fh,
 				struct v4l2_frmsizeenum *fsize)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 	const struct amvdec_format *formats = sess->core->platform->formats;
 	const struct amvdec_format *fmt;
 	u32 num_formats = sess->core->platform->num_formats;
@@ -713,8 +708,7 @@ static int vdec_enum_framesizes(struct file *file, void *fh,
 static int
 vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 	struct device *dev = sess->core->dev;
 	int ret;
@@ -773,8 +767,7 @@ static int vdec_subscribe_event(struct v4l2_fh *fh,
 static int vdec_g_pixelaspect(struct file *file, void *fh, int type,
 			      struct v4l2_fract *f)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		return -EINVAL;
@@ -930,8 +923,7 @@ static int vdec_open(struct file *file)
 
 static int vdec_close(struct file *file)
 {
-	struct amvdec_session *sess =
-		container_of(file->private_data, struct amvdec_session, fh);
+	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 2586851777000ef4afaf91824ea3f32168a94dd1..7a5d8e871d708db9639563c056ba4b3fe9930eec 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -282,6 +282,11 @@ struct amvdec_session {
 	void *priv;
 };
 
+static inline struct amvdec_session *file_to_amvdec_session(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
+}
+
 u32 amvdec_get_output_size(struct amvdec_session *sess);
 
 #endif
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 52a9588462ce5898705cc351fa461f3c49600ad2..80b43187f6eef827c7212a601aa2056dbc606bd4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -401,8 +401,7 @@ static int cedrus_open(struct file *file)
 static int cedrus_release(struct file *file)
 {
 	struct cedrus_dev *dev = video_drvdata(file);
-	struct cedrus_ctx *ctx = container_of(file->private_data,
-					      struct cedrus_ctx, fh);
+	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 
 	mutex_lock(&dev->dev_mutex);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 522c184e2afc99c195a39889893b3d4dfc2bfad9..c4b1217c14b6464b5b730c2af4083c58c36c0edf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -155,6 +155,11 @@ struct cedrus_ctx {
 	} codec;
 };
 
+static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
+{
+	return container_of(file_to_v4l2_fh(file), struct cedrus_ctx, fh);
+}
+
 struct cedrus_dec_ops {
 	void (*irq_clear)(struct cedrus_ctx *ctx);
 	void (*irq_disable)(struct cedrus_ctx *ctx);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9fae2c7493d090878a9f4f0f3923b1c6fd96dbe3..ad4ec349077547ea3428c7341f152d729d775bb2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -83,11 +83,6 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
-static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
-{
-	return container_of(file->private_data, struct cedrus_ctx, fh);
-}
-
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {

-- 
2.49.0


