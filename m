Return-Path: <linux-media+bounces-39284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB5B1F799
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0FC01899CF3
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC219C540;
	Sun, 10 Aug 2025 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LIq1Alai"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15827456;
	Sun, 10 Aug 2025 01:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789503; cv=none; b=SGucnWFbVgfJyHSdVDxzn1KGp/LFiNZA+1XjO69G91b7lroxF1RGyxvcEv3jdl/+nRjzm6IHFooKazClgPFA2rPw3c6sfLp6BRp5Q4iya3sZ4R8y6NaHGJLyJBTurVl4U3SEdoxUgv3Sf1O5rbh77J3E5M5Atjspk7U5p2nv1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789503; c=relaxed/simple;
	bh=YtAUJawe0y/DMZ80oxUluIOy5Zjy3G3sH2vM+gnTssw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5Qwq0ihMG4WUE4lWINxatnFKn8yWhd9QVlSBQMAeWg6Cs414f3AfuqJs0CtPMp9A/EpdVfpEgVQhK3S2zfsnwMzaaO8GgTQAWNKjtupdU+vk6O2Z3iXkfT8hajx/vo6ESPuPpMPkXnRdxZtrauEIUPHickzg+Pum5TSwH+L3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LIq1Alai; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 795F21121;
	Sun, 10 Aug 2025 03:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789446;
	bh=YtAUJawe0y/DMZ80oxUluIOy5Zjy3G3sH2vM+gnTssw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LIq1Alai1LP7sg17ENGU8FUiovdjjS6zFmyV4Vsnulxvaura4VVCPdj4BKDv78VPa
	 1e7XmyPBFTebexahMalMX6wHvCJ+GxxqzG4fhOGq5y/5euUoEFdJU3DZPV+STFCtUE
	 5tWYwN0d88xbdve4Nh9o68gcKhnGulj1eIIi5uAs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
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
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 11/76] media: Replace file->private_data access with custom functions
Date: Sun, 10 Aug 2025 04:29:53 +0300
Message-ID: <20250810013100.29776-12-laurent.pinchart+renesas@ideasonboard.com>
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
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

Replace all remaining locations that read the v4l2_fh pointer directly
from file->private_data and cast it to driver-specific file handle
structures with driver-specific functions that use file_to_v4l2_fh() and
perform the same cast.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Do not duplicate container_of(), use fh_to_*() in file_to_fh*()
- Fix coding style in file2ctx() parameter
---
 drivers/media/pci/ivtv/ivtv-driver.h          |  5 +++
 drivers/media/pci/ivtv/ivtv-fileops.c         | 10 +++---
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  8 ++---
 .../media/platform/allegro-dvt/allegro-core.c |  7 ++++-
 .../media/platform/amlogic/meson-ge2d/ge2d.c  |  8 +++--
 .../platform/chips-media/coda/coda-common.c   |  7 ++++-
 .../platform/chips-media/wave5/wave5-helper.c |  2 +-
 .../platform/chips-media/wave5/wave5-vpu.h    |  5 +++
 drivers/media/platform/m2m-deinterlace.c      |  7 ++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  7 ++++-
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c |  7 ++++-
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  7 ++++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  2 +-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  5 +++
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  2 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  5 +++
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  7 ++++-
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  7 ++++-
 drivers/media/platform/nxp/mx2_emmaprp.c      |  7 ++++-
 drivers/media/platform/renesas/rcar_fdp1.c    |  7 ++++-
 drivers/media/platform/renesas/rcar_jpu.c     |  7 ++++-
 drivers/media/platform/rockchip/rga/rga.c     |  3 +-
 drivers/media/platform/rockchip/rga/rga.h     |  5 +++
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  2 +-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  5 +++
 .../platform/samsung/exynos-gsc/gsc-core.h    |  6 ++++
 .../platform/samsung/exynos-gsc/gsc-m2m.c     |  6 ++--
 .../platform/samsung/exynos4-is/fimc-core.h   |  5 +++
 .../platform/samsung/exynos4-is/fimc-m2m.c    |  2 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c  |  7 +++--
 .../platform/samsung/s5p-jpeg/jpeg-core.c     |  9 ++++--
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  6 ++--
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h |  6 ++++
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  |  7 ++++-
 .../media/platform/st/sti/delta/delta-v4l2.c  | 26 ++++++++++------
 drivers/media/platform/st/sti/hva/hva-v4l2.c  | 31 ++++++++++---------
 drivers/media/platform/st/sti/hva/hva.h       |  2 --
 drivers/media/platform/st/stm32/dma2d/dma2d.c |  7 +++--
 .../media/platform/sunxi/sun8i-di/sun8i-di.c  |  3 +-
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  3 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  4 +--
 drivers/media/platform/ti/omap3isp/ispvideo.h |  6 ++++
 drivers/media/platform/verisilicon/hantro.h   |  5 +++
 .../media/platform/verisilicon/hantro_drv.c   |  3 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |  7 ++++-
 drivers/staging/media/meson/vdec/vdec.c       | 24 +++++---------
 drivers/staging/media/meson/vdec/vdec.h       |  5 +++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 50 files changed, 237 insertions(+), 100 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc..e4033c2bee5c 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -388,6 +388,11 @@ static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
 	return container_of(fh, struct ivtv_open_id, fh);
 }
 
+static inline struct ivtv_open_id *file2id(struct file *filp)
+{
+	return fh2id(file_to_v4l2_fh(filp));
+}
+
 struct yuv_frame_info
 {
 	u32 update;
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 230d498108b5..cc91695a5b76 100644
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
index 7947dcd615e8..d888435b71fb 100644
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
index 1f134e08923a..74977f3ae484 100644
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
index 0c004bb8ba05..c7df29a2d820 100644
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
index e6e3f5ec24f6..459b59149390 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -56,6 +56,11 @@
 
 #define fh_to_ctx(__fh)	container_of(__fh, struct coda_ctx, fh)
 
+static inline struct coda_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 2c9d8cbca6e4..031dea0ee61c 100644
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
index 3847332551fc..5943bdaa9c4c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -46,6 +46,11 @@ static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
 	return container_of(vfh, struct vpu_instance, v4l2_fh);
 }
 
+static inline struct vpu_instance *file_to_vpu_inst(struct file *filp)
+{
+	return wave5_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
 static inline struct vpu_instance *wave5_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
 {
 	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 5188f3189096..1812c07837ad 100644
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
index 329e5787c2c2..3a7a6eb53d89 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -124,6 +124,11 @@ static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_jpeg_ctx, fh);
 }
 
+static inline struct mtk_jpeg_ctx *mtk_jpeg_file_to_ctx(struct file *filp)
+{
+	return mtk_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
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
index d0fd77dcf8e2..2d894b5bfaa7 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -353,6 +353,11 @@ static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_mdp_ctx, fh);
 }
 
+static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 59ce5cce0698..886ff25c70eb 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -15,6 +15,11 @@ static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mdp_m2m_ctx, fh);
 }
 
+static inline struct mdp_m2m_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 9247d92d431d..18801883c31a 100644
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
index aececca7ecf8..d047d7c580fb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -314,6 +314,11 @@ static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_vcodec_dec_ctx, fh);
 }
 
+static inline struct mtk_vcodec_dec_ctx *file_to_dec_ctx(struct file *filp)
+{
+	return fh_to_dec_ctx(file_to_v4l2_fh(filp));
+}
+
 static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index a1e4483abcdb..e26a6c3ffa0c 100644
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
index 0bd85d0fb379..a4fe2f453d8f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -222,6 +222,11 @@ static inline struct mtk_vcodec_enc_ctx *fh_to_enc_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mtk_vcodec_enc_ctx, fh);
 }
 
+static inline struct mtk_vcodec_enc_ctx *file_to_enc_ctx(struct file *filp)
+{
+	return fh_to_enc_ctx(file_to_v4l2_fh(filp));
+}
+
 static inline struct mtk_vcodec_enc_ctx *ctrl_to_enc_ctx(struct v4l2_ctrl *ctrl)
 {
 	return container_of(ctrl->handler, struct mtk_vcodec_enc_ctx, ctrl_hdl);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1b2148578cb6..8eef7ebd0428 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -649,6 +649,11 @@ static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mxc_jpeg_ctx, fh);
 }
 
+static inline struct mxc_jpeg_ctx *mxc_jpeg_file_to_ctx(struct file *filp)
+{
+	return mxc_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
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
index 22e49d3a1287..6444392c5e62 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -79,6 +79,11 @@ static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
 }
 
+static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
+{
+	return to_isi_m2m_ctx(file_to_v4l2_fh(filp));
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
index 0c6cc120fd2a..5c8c6285ec1e 100644
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
index 5d453a7a8988..12a5dcc0ca6c 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -635,6 +635,11 @@ static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct fdp1_ctx, fh);
 }
 
+static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 81038df71bb5..7d5e9df53dfb 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -485,6 +485,11 @@ static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct jpu_ctx, fh);
 }
 
+static struct jpu_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 3dccab5fa4a1..8a6e618d605c 100644
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
index 530e12de73c4..72a28b120fab 100644
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
index d707088ec0dc..41ab90cbcc0c 100644
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
index f6e8bf38add3..3a6322d42b26 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -129,6 +129,11 @@ static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct rkvdec_ctx, fh);
 }
 
+static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
+{
+	return fh_to_rkvdec_ctx(file_to_v4l2_fh(filp));
+}
+
 struct rkvdec_aux_buf {
 	void *cpu;
 	dma_addr_t dma;
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
index b9777e07fb6d..56856e9f9baf 100644
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
+	return fh_to_ctx(file_to_v4l2_fh(filp));
+}
+
 void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm);
 int gsc_register_m2m_device(struct gsc_dev *gsc);
 void gsc_unregister_m2m_device(struct gsc_dev *gsc);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 4bda1c369c44..968bb4327b7a 100644
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
index 63385152a2ff..2b6c72d9442c 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.h
@@ -498,6 +498,11 @@ struct fimc_ctx {
 
 #define fh_to_ctx(__fh) container_of(__fh, struct fimc_ctx, fh)
 
+static inline struct fimc_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
+}
+
 static inline void set_frame_bounds(struct fimc_frame *f, u32 width, u32 height)
 {
 	f->o_width  = width;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index 951433c8e92a..feedf60dad09 100644
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
index ffed16a34493..44fcedbbc90a 100644
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
index ac4cf269456a..a5ecfe03db09 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -585,6 +585,11 @@ static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct s5p_jpeg_ctx, fh);
 }
 
+static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 73fdcd362265..dd9761df59df 100644
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
index 86c316c1ff8f..a29228b4207f 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -768,6 +768,12 @@ struct mfc_control {
 	((f && f->op) ? f->op(args) : (typeof(f->op(args)))(-ENODEV))
 
 #define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)
+
+static inline struct s5p_mfc_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
+}
+
 #define ctrl_to_ctx(__ctrl) \
 	container_of((__ctrl)->handler, struct s5p_mfc_ctx, ctrl_handler)
 
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 1eb934490c0b..f3844e4e47ca 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -35,6 +35,11 @@
 
 #define fh_to_ctx(__fh) container_of(__fh, struct bdisp_ctx, fh)
 
+static inline struct bdisp_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 196e6a40335d..a12fdbd8abed 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -25,6 +25,12 @@
 #define DELTA_PREFIX "[---:----]"
 
 #define to_ctx(__fh) container_of(__fh, struct delta_ctx, fh)
+
+static inline struct delta_ctx *file_to_ctx(struct file *filp)
+{
+	return to_ctx(file_to_v4l2_fh(filp));
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
index 5366c0f92549..29142c806cb7 100644
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
index ba6b893416ec..1fe561082a74 100644
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
index 48fa781aab06..f4c5d73447a7 100644
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
index 43755043e8af..e9c7c99fbc55 100644
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
index d0608b5d900f..9ea65cb7187f 100644
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
index a777135c6a6c..b76d40aeca17 100644
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
index 1d23df576e6b..4364b4b14fb4 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.h
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
@@ -195,6 +195,12 @@ struct isp_video_fh {
 };
 
 #define to_isp_video_fh(fh)	container_of(fh, struct isp_video_fh, vfh)
+
+static inline struct isp_video_fh *file_to_isp_video_fh(struct file *filp)
+{
+	return to_isp_video_fh(file_to_v4l2_fh(filp));
+}
+
 #define isp_video_queue_to_isp_video_fh(q) \
 				container_of(q, struct isp_video_fh, queue)
 
diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 81328c63b796..5b85c8a44706 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -387,6 +387,11 @@ static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
 	return container_of(fh, struct hantro_ctx, fh);
 }
 
+static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
+}
+
 /* Register accessors. */
 static __always_inline void vepu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8542238e0fb1..b20b9c7f4131 100644
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
index 19fd31cb9bb0..fb67b383436d 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -66,6 +66,11 @@ struct ipu_csc_scaler_ctx {
 	unsigned int			sequence;
 };
 
+static inline struct ipu_csc_scaler_ctx *file_to_ctx(struct file *filp)
+{
+	return fh_to_ctx(file_to_v4l2_fh(filp));
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
index 6d34a482492e..f1ee53f9f298 100644
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
index 258685177700..7a5d8e871d70 100644
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
index 52a9588462ce..80b43187f6ee 100644
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
index 522c184e2afc..c4b1217c14b6 100644
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
index 9fae2c7493d0..ad4ec3490775 100644
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
Regards,

Laurent Pinchart


