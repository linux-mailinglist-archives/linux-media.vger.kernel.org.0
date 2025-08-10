Return-Path: <linux-media+bounces-39349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBAB1F7F3
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1240175F51
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8477C218AB9;
	Sun, 10 Aug 2025 01:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Te12BFOj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC5216E26
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789610; cv=none; b=FL9tHzVIhZgu9c075W95Udz29cW6QT+XV4s4KCbMd4RQo3HfZOyJIsW/FavgPHWz29ynp7gy7jHynnS85Yd449CmISDLoWWgXvV0tER1R4yeaRonJTktM+9nXb40H/Kgyr6mFjnvj9cskfpPQ59axhNokD8rHuYeO/cMRNe4elY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789610; c=relaxed/simple;
	bh=qH4QMLWeJjmGWftGyXA584VGWiP3B49nRsLNGc+ThmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrVAjs37LBNVBLp++IxHdEQryOrgLJm04gpA3BHkTc356ep19myQHHydXBwH22Bjc/fFvNTov2Atmllp2Sx9JRUzmiowmxyCu5R6/edyYF9W3rfOqJiry+j1kLAfSSm6qhvuHG6/cOh8k4liKgwjzmCnNdyA4oBBZuPqPctb2HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Te12BFOj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1669D1121;
	Sun, 10 Aug 2025 03:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789554;
	bh=qH4QMLWeJjmGWftGyXA584VGWiP3B49nRsLNGc+ThmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Te12BFOj9J7FClFYAnIyzGCMJnAaASZNbiRJmgtHQe0Qb6hgFtctjQgPodDc7GMSv
	 AT8geiQPHZvBA6vpKC9gkqXDKoyONVALlb5tNcW2iOrNs2ONrCCUHWhvkuR9qKNL0+
	 aoiAjRqsSVnRnPKRDGh4E4RwY7vNYgdP6e+fPfNs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jai Luthra <jai.luthra@linux.dev>,
	Eduardo Valentin <edubezval@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v3 75/76] media: v4l2: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:57 +0300
Message-ID: <20250810013100.29776-76-laurent.pinchart+renesas@ideasonboard.com>
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

The second argument to the ioctl handlers is not a file handle any more.
The standard practice is to name it 'void *priv' in drivers. Many
drivers still name it 'void *fh', and a few use more exotic names.
Replace those more exotic names with 'void *priv' in all media drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../extron-da-hd-4k-plus.c                    |  4 +-
 drivers/media/pci/bt8xx/bttv-driver.c         | 14 ++---
 drivers/media/pci/bt8xx/bttv-vbi.c            |  6 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c        | 60 +++++++++----------
 drivers/media/pci/saa7134/saa7134-video.c     |  4 +-
 drivers/media/platform/rockchip/rga/rga.c     | 14 ++---
 drivers/media/platform/samsung/s5p-g2d/g2d.c  | 18 +++---
 .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    |  2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    |  2 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 10 ++--
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 16 ++---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    |  8 +--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  2 +-
 drivers/media/platform/ti/omap/omap_vout.c    |  6 +-
 .../radio/si4713/radio-platform-si4713.c      | 10 ++--
 drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
 drivers/media/usb/gspca/gspca.c               | 18 +++---
 drivers/media/usb/hdpvr/hdpvr-video.c         | 30 +++++-----
 18 files changed, 113 insertions(+), 113 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 41d019b01ec0..c476e8d1279e 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1252,7 +1252,7 @@ static int extron_s_output(struct file *file, void *priv, unsigned int o)
 	return o ? -EINVAL : 0;
 }
 
-static int extron_g_edid(struct file *file, void *_fh,
+static int extron_g_edid(struct file *file, void *priv,
 			 struct v4l2_edid *edid)
 {
 	struct extron_port *port = video_drvdata(file);
@@ -1280,7 +1280,7 @@ static int extron_g_edid(struct file *file, void *_fh,
 	return 0;
 }
 
-static int extron_s_edid(struct file *file, void *_fh, struct v4l2_edid *edid)
+static int extron_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
 {
 	struct extron_port *port = video_drvdata(file);
 
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 9ce67f515843..17e4529e537a 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1620,7 +1620,7 @@ static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-static int bttv_querystd(struct file *file, void *f, v4l2_std_id *id)
+static int bttv_querystd(struct file *file, void *priv, v4l2_std_id *id)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -1750,7 +1750,7 @@ static int bttv_s_frequency(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_log_status(struct file *file, void *f)
+static int bttv_log_status(struct file *file, void *priv)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct bttv *btv = video_drvdata(file);
@@ -1761,7 +1761,7 @@ static int bttv_log_status(struct file *file, void *f)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int bttv_g_register(struct file *file, void *f,
+static int bttv_g_register(struct file *file, void *priv,
 					struct v4l2_dbg_register *reg)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -1774,7 +1774,7 @@ static int bttv_g_register(struct file *file, void *f,
 	return 0;
 }
 
-static int bttv_s_register(struct file *file, void *f,
+static int bttv_s_register(struct file *file, void *priv,
 					const struct v4l2_dbg_register *reg)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2159,7 +2159,7 @@ static int bttv_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int bttv_g_parm(struct file *file, void *f,
+static int bttv_g_parm(struct file *file, void *priv,
 				struct v4l2_streamparm *parm)
 {
 	struct bttv *btv = video_drvdata(file);
@@ -2208,7 +2208,7 @@ static int bttv_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *sel)
+static int bttv_g_selection(struct file *file, void *priv, struct v4l2_selection *sel)
 {
 	struct bttv *btv = video_drvdata(file);
 
@@ -2232,7 +2232,7 @@ static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *s
 	return 0;
 }
 
-static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *sel)
+static int bttv_s_selection(struct file *file, void *priv, struct v4l2_selection *sel)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct v4l2_rect *b;
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index a71440611e46..0ca88a2400ee 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -241,7 +241,7 @@ static int try_fmt(struct v4l2_vbi_format *f, const struct bttv_tvnorm *tvnorm,
 	return 0;
 }
 
-int bttv_try_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
+int bttv_try_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
@@ -258,7 +258,7 @@ int bttv_try_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 }
 
 
-int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
+int bttv_s_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
 {
 	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
@@ -301,7 +301,7 @@ int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 }
 
 
-int bttv_g_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
+int bttv_g_fmt_vbi_cap(struct file *file, void *priv, struct v4l2_format *frt)
 {
 	const struct bttv_tvnorm *tvnorm;
 	struct bttv *btv = video_drvdata(file);
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index ae82427e3479..51fd9576c6c2 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -447,7 +447,7 @@ static int cobalt_cobaltc(struct cobalt *cobalt, unsigned int cmd, void *arg)
 	return 0;
 }
 
-static int cobalt_g_register(struct file *file, void *priv_fh,
+static int cobalt_g_register(struct file *file, void *priv,
 		struct v4l2_dbg_register *reg)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -456,7 +456,7 @@ static int cobalt_g_register(struct file *file, void *priv_fh,
 	return cobalt_cobaltc(cobalt, VIDIOC_DBG_G_REGISTER, reg);
 }
 
-static int cobalt_s_register(struct file *file, void *priv_fh,
+static int cobalt_s_register(struct file *file, void *priv,
 		const struct v4l2_dbg_register *reg)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -467,7 +467,7 @@ static int cobalt_s_register(struct file *file, void *priv_fh,
 }
 #endif
 
-static int cobalt_querycap(struct file *file, void *priv_fh,
+static int cobalt_querycap(struct file *file, void *priv,
 				struct v4l2_capability *vcap)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -562,7 +562,7 @@ static void cobalt_video_input_status_show(struct cobalt_stream *s)
 	cobalt_info("rx%d: Packer: %x\n", rx, ioread32(&packer->control));
 }
 
-static int cobalt_log_status(struct file *file, void *priv_fh)
+static int cobalt_log_status(struct file *file, void *priv)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct cobalt *cobalt = s->cobalt;
@@ -596,7 +596,7 @@ static int cobalt_log_status(struct file *file, void *priv_fh)
 	return 0;
 }
 
-static int cobalt_enum_dv_timings(struct file *file, void *priv_fh,
+static int cobalt_enum_dv_timings(struct file *file, void *priv,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -613,7 +613,7 @@ static int cobalt_enum_dv_timings(struct file *file, void *priv_fh,
 			pad, enum_dv_timings, timings);
 }
 
-static int cobalt_s_dv_timings(struct file *file, void *priv_fh,
+static int cobalt_s_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -641,7 +641,7 @@ static int cobalt_s_dv_timings(struct file *file, void *priv_fh,
 	return err;
 }
 
-static int cobalt_g_dv_timings(struct file *file, void *priv_fh,
+static int cobalt_g_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -654,7 +654,7 @@ static int cobalt_g_dv_timings(struct file *file, void *priv_fh,
 			pad, g_dv_timings, 0, timings);
 }
 
-static int cobalt_query_dv_timings(struct file *file, void *priv_fh,
+static int cobalt_query_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -667,7 +667,7 @@ static int cobalt_query_dv_timings(struct file *file, void *priv_fh,
 			pad, query_dv_timings, 0, timings);
 }
 
-static int cobalt_dv_timings_cap(struct file *file, void *priv_fh,
+static int cobalt_dv_timings_cap(struct file *file, void *priv,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -677,7 +677,7 @@ static int cobalt_dv_timings_cap(struct file *file, void *priv_fh,
 			pad, dv_timings_cap, cap);
 }
 
-static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv_fh,
+static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv,
 		struct v4l2_fmtdesc *f)
 {
 	switch (f->index) {
@@ -697,7 +697,7 @@ static int cobalt_enum_fmt_vid_cap(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_g_fmt_vid_cap(struct file *file, void *priv_fh,
+static int cobalt_g_fmt_vid_cap(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -726,7 +726,7 @@ static int cobalt_g_fmt_vid_cap(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_try_fmt_vid_cap(struct file *file, void *priv_fh,
+static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -787,7 +787,7 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_s_fmt_vid_cap(struct file *file, void *priv_fh,
+static int cobalt_s_fmt_vid_cap(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -796,7 +796,7 @@ static int cobalt_s_fmt_vid_cap(struct file *file, void *priv_fh,
 	if (vb2_is_busy(&s->q))
 		return -EBUSY;
 
-	if (cobalt_try_fmt_vid_cap(file, priv_fh, f))
+	if (cobalt_try_fmt_vid_cap(file, priv, f))
 		return -EINVAL;
 
 	s->width = pix->width;
@@ -821,7 +821,7 @@ static int cobalt_s_fmt_vid_cap(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_try_fmt_vid_out(struct file *file, void *priv_fh,
+static int cobalt_try_fmt_vid_out(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pix = &f->fmt.pix;
@@ -862,7 +862,7 @@ static int cobalt_try_fmt_vid_out(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_g_fmt_vid_out(struct file *file, void *priv_fh,
+static int cobalt_g_fmt_vid_out(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -882,7 +882,7 @@ static int cobalt_g_fmt_vid_out(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_enum_fmt_vid_out(struct file *file, void *priv_fh,
+static int cobalt_enum_fmt_vid_out(struct file *file, void *priv,
 		struct v4l2_fmtdesc *f)
 {
 	switch (f->index) {
@@ -899,7 +899,7 @@ static int cobalt_enum_fmt_vid_out(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_s_fmt_vid_out(struct file *file, void *priv_fh,
+static int cobalt_s_fmt_vid_out(struct file *file, void *priv,
 		struct v4l2_format *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -909,7 +909,7 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv_fh,
 	};
 	u32 code;
 
-	if (cobalt_try_fmt_vid_out(file, priv_fh, f))
+	if (cobalt_try_fmt_vid_out(file, priv, f))
 		return -EINVAL;
 
 	if (vb2_is_busy(&s->q) && (pix->pixelformat != s->pixfmt ||
@@ -942,7 +942,7 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_enum_input(struct file *file, void *priv_fh,
+static int cobalt_enum_input(struct file *file, void *priv,
 				 struct v4l2_input *inp)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -963,7 +963,7 @@ static int cobalt_enum_input(struct file *file, void *priv_fh,
 			video, g_input_status, &inp->status);
 }
 
-static int cobalt_g_input(struct file *file, void *priv_fh, unsigned int *i)
+static int cobalt_g_input(struct file *file, void *priv, unsigned int *i)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 
@@ -971,7 +971,7 @@ static int cobalt_g_input(struct file *file, void *priv_fh, unsigned int *i)
 	return 0;
 }
 
-static int cobalt_s_input(struct file *file, void *priv_fh, unsigned int i)
+static int cobalt_s_input(struct file *file, void *priv, unsigned int i)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 
@@ -990,7 +990,7 @@ static int cobalt_s_input(struct file *file, void *priv_fh, unsigned int i)
 			ADV76XX_PAD_HDMI_PORT_A, 0, 0);
 }
 
-static int cobalt_enum_output(struct file *file, void *priv_fh,
+static int cobalt_enum_output(struct file *file, void *priv,
 				 struct v4l2_output *out)
 {
 	if (out->index)
@@ -1001,18 +1001,18 @@ static int cobalt_enum_output(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int cobalt_g_output(struct file *file, void *priv_fh, unsigned int *i)
+static int cobalt_g_output(struct file *file, void *priv, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int cobalt_s_output(struct file *file, void *priv_fh, unsigned int i)
+static int cobalt_s_output(struct file *file, void *priv, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
 
-static int cobalt_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+static int cobalt_g_edid(struct file *file, void *priv, struct v4l2_edid *edid)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	u32 pad = edid->pad;
@@ -1026,7 +1026,7 @@ static int cobalt_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	return ret;
 }
 
-static int cobalt_s_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+static int cobalt_s_edid(struct file *file, void *priv, struct v4l2_edid *edid)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	u32 pad = edid->pad;
@@ -1050,7 +1050,7 @@ static int cobalt_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int cobalt_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+static int cobalt_g_parm(struct file *file, void *priv, struct v4l2_streamparm *a)
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_fract fps;
@@ -1065,7 +1065,7 @@ static int cobalt_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	return 0;
 }
 
-static int cobalt_g_pixelaspect(struct file *file, void *fh,
+static int cobalt_g_pixelaspect(struct file *file, void *priv,
 				int type, struct v4l2_fract *f)
 {
 	struct cobalt_stream *s = video_drvdata(file);
@@ -1084,7 +1084,7 @@ static int cobalt_g_pixelaspect(struct file *file, void *fh,
 	return err;
 }
 
-static int cobalt_g_selection(struct file *file, void *fh,
+static int cobalt_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
 	struct cobalt_stream *s = video_drvdata(file);
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index c88939bce56b..4a51b873e47a 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1302,7 +1302,7 @@ static int saa7134_g_pixelaspect(struct file *file, void *priv,
 	return 0;
 }
 
-static int saa7134_g_selection(struct file *file, void *f, struct v4l2_selection *sel)
+static int saa7134_g_selection(struct file *file, void *priv, struct v4l2_selection *sel)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 
@@ -1325,7 +1325,7 @@ static int saa7134_g_selection(struct file *file, void *f, struct v4l2_selection
 	return 0;
 }
 
-static int saa7134_s_selection(struct file *file, void *f, struct v4l2_selection *sel)
+static int saa7134_s_selection(struct file *file, void *priv, struct v4l2_selection *sel)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
 	struct v4l2_rect *b = &dev->crop_bounds;
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 7c657df623f2..776046de979a 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -446,7 +446,7 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	struct rga_fmt *fmt;
 
@@ -459,7 +459,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -481,7 +481,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_fmt *fmt;
@@ -501,7 +501,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -514,7 +514,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt(file, prv, f);
+	ret = vidioc_try_fmt(file, priv, f);
 	if (ret)
 		return ret;
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
@@ -558,7 +558,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *prv,
+static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
@@ -606,7 +606,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *prv,
+static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index 55f5130156b7..ffb9bee6cb9d 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -297,7 +297,7 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
@@ -305,7 +305,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -327,7 +327,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct g2d_fmt *fmt;
 	enum v4l2_field *field;
@@ -357,7 +357,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_dev *dev = ctx->dev;
@@ -368,7 +368,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format. */
-	ret = vidioc_try_fmt(file, prv, f);
+	ret = vidioc_try_fmt(file, priv, f);
 	if (ret)
 		return ret;
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
@@ -397,7 +397,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_g_selection(struct file *file, void *prv,
+static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
@@ -447,7 +447,7 @@ static int vidioc_g_selection(struct file *file, void *prv,
 	return 0;
 }
 
-static int vidioc_try_selection(struct file *file, void *prv,
+static int vidioc_try_selection(struct file *file, void *priv,
 				const struct v4l2_selection *s)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
@@ -475,14 +475,14 @@ static int vidioc_try_selection(struct file *file, void *prv,
 	return 0;
 }
 
-static int vidioc_s_selection(struct file *file, void *prv,
+static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
 	struct g2d_ctx *ctx = file2ctx(file);
 	struct g2d_frame *f;
 	int ret;
 
-	ret = vidioc_try_selection(file, prv, s);
+	ret = vidioc_try_selection(file, priv, s);
 	if (ret)
 		return ret;
 	f = get_frame(ctx, s->type);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index 606e1a7121b5..afd28beabfde 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -330,7 +330,7 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return 0;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *pirv,
+static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, false);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 694b68788a95..3f8701e5614f 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1375,7 +1375,7 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *pirv,
+static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
 	return vidioc_enum_fmt(file, f, false);
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index a22f587a5f83..468c247ba328 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -343,7 +343,7 @@ static int vidioc_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
+static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
@@ -352,7 +352,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -377,7 +377,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct dma2d_fmt *fmt;
@@ -420,7 +420,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	return 0;
 }
 
-static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
+static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
@@ -431,7 +431,7 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	/* Adjust all values accordingly to the hardware capabilities
 	 * and chosen format.
 	 */
-	ret = vidioc_try_fmt(file, prv, f);
+	ret = vidioc_try_fmt(file, priv, f);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 76356bc7f10e..65879f4802c0 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -711,7 +711,7 @@ static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
 	pix_format->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 }
 
-static int sun6i_csi_capture_querycap(struct file *file, void *private,
+static int sun6i_csi_capture_querycap(struct file *file, void *priv,
 				      struct v4l2_capability *capability)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -725,7 +725,7 @@ static int sun6i_csi_capture_querycap(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
+static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
@@ -738,7 +738,7 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
+static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -748,7 +748,7 @@ static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_s_fmt(struct file *file, void *private,
+static int sun6i_csi_capture_s_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
@@ -764,7 +764,7 @@ static int sun6i_csi_capture_s_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
+static int sun6i_csi_capture_try_fmt(struct file *file, void *priv,
 				     struct v4l2_format *format)
 {
 	sun6i_csi_capture_format_prepare(format);
@@ -772,7 +772,7 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_enum_input(struct file *file, void *private,
+static int sun6i_csi_capture_enum_input(struct file *file, void *priv,
 					struct v4l2_input *input)
 {
 	if (input->index != 0)
@@ -784,7 +784,7 @@ static int sun6i_csi_capture_enum_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_g_input(struct file *file, void *private,
+static int sun6i_csi_capture_g_input(struct file *file, void *priv,
 				     unsigned int *index)
 {
 	*index = 0;
@@ -792,7 +792,7 @@ static int sun6i_csi_capture_g_input(struct file *file, void *private,
 	return 0;
 }
 
-static int sun6i_csi_capture_s_input(struct file *file, void *private,
+static int sun6i_csi_capture_s_input(struct file *file, void *priv,
 				     unsigned int index)
 {
 	if (index != 0)
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 7af6765532e3..b7d278b3889f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -459,7 +459,7 @@ static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)
 	return !tx_5v_power_present(hdmirx_dev);
 }
 
-static int hdmirx_query_dv_timings(struct file *file, void *_fh,
+static int hdmirx_query_dv_timings(struct file *file, void *priv,
 				   struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -751,7 +751,7 @@ static int hdmirx_dv_timings_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int hdmirx_enum_dv_timings(struct file *file, void *_fh,
+static int hdmirx_enum_dv_timings(struct file *file, void *priv,
 				  struct v4l2_enum_dv_timings *timings)
 {
 	return v4l2_enum_dv_timings_cap(timings, &hdmirx_timings_cap, NULL, NULL);
@@ -1323,7 +1323,7 @@ static int hdmirx_g_fmt_vid_cap_mplane(struct file *file, void *fh,
 	return 0;
 }
 
-static int hdmirx_g_dv_timings(struct file *file, void *_fh,
+static int hdmirx_g_dv_timings(struct file *file, void *priv,
 			       struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
@@ -1339,7 +1339,7 @@ static int hdmirx_g_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int hdmirx_s_dv_timings(struct file *file, void *_fh,
+static int hdmirx_s_dv_timings(struct file *file, void *priv,
 			       struct v4l2_dv_timings *timings)
 {
 	struct hdmirx_stream *stream = video_drvdata(file);
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b628d6e081db..7fb565ebbe62 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -299,7 +299,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *prov,
+static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
 	struct ti_csi2rx_dev *csi = video_drvdata(file);
diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index a87d5030ac35..22782e9f1f4e 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1236,7 +1236,7 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_enum_output(struct file *file, void *priv_fh,
+static int vidioc_enum_output(struct file *file, void *priv,
 			      struct v4l2_output *out)
 {
 	if (out->index)
@@ -1246,13 +1246,13 @@ static int vidioc_enum_output(struct file *file, void *priv_fh,
 	return 0;
 }
 
-static int vidioc_g_output(struct file *file, void *priv_fh, unsigned int *i)
+static int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
 {
 	*i = 0;
 	return 0;
 }
 
-static int vidioc_s_output(struct file *file, void *priv_fh, unsigned int i)
+static int vidioc_s_output(struct file *file, void *priv, unsigned int i)
 {
 	return i ? -EINVAL : 0;
 }
diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index 67b4afadc95a..4132968110e3 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -75,35 +75,35 @@ static inline struct v4l2_device *get_v4l2_dev(struct file *file)
 	return &((struct radio_si4713_device *)video_drvdata(file))->v4l2_dev;
 }
 
-static int radio_si4713_g_modulator(struct file *file, void *p,
+static int radio_si4713_g_modulator(struct file *file, void *priv,
 				    struct v4l2_modulator *vm)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  g_modulator, vm);
 }
 
-static int radio_si4713_s_modulator(struct file *file, void *p,
+static int radio_si4713_s_modulator(struct file *file, void *priv,
 				    const struct v4l2_modulator *vm)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  s_modulator, vm);
 }
 
-static int radio_si4713_g_frequency(struct file *file, void *p,
+static int radio_si4713_g_frequency(struct file *file, void *priv,
 				    struct v4l2_frequency *vf)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  g_frequency, vf);
 }
 
-static int radio_si4713_s_frequency(struct file *file, void *p,
+static int radio_si4713_s_frequency(struct file *file, void *priv,
 				    const struct v4l2_frequency *vf)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, tuner,
 					  s_frequency, vf);
 }
 
-static long radio_si4713_default(struct file *file, void *p,
+static long radio_si4713_default(struct file *file, void *priv,
 				 bool valid_prio, unsigned int cmd, void *arg)
 {
 	return v4l2_device_call_until_err(get_v4l2_dev(file), 0, core,
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index e585c8f6e4c5..c695a97e202b 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1499,7 +1499,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_g_std(struct file *file, void *fh0, v4l2_std_id *norm)
+static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *norm)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 25edd2189654..3fc15d16df8e 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1029,15 +1029,15 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *_priv,
+static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
-	u32 priv = fmt->fmt.pix.priv;
+	u32 fmt_priv = fmt->fmt.pix.priv;
 
 	fmt->fmt.pix = gspca_dev->pixfmt;
 	/* some drivers use priv internally, so keep the original value */
-	fmt->fmt.pix.priv = priv;
+	fmt->fmt.pix.priv = fmt_priv;
 	return 0;
 }
 
@@ -1075,24 +1075,24 @@ static int try_fmt_vid_cap(struct gspca_dev *gspca_dev,
 	return mode;			/* used when s_fmt */
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *_priv,
+static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
-	u32 priv = fmt->fmt.pix.priv;
+	u32 fmt_priv = fmt->fmt.pix.priv;
 
 	if (try_fmt_vid_cap(gspca_dev, fmt) < 0)
 		return -EINVAL;
 	/* some drivers use priv internally, so keep the original value */
-	fmt->fmt.pix.priv = priv;
+	fmt->fmt.pix.priv = fmt_priv;
 	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *_priv,
+static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *fmt)
 {
 	struct gspca_dev *gspca_dev = video_drvdata(file);
-	u32 priv = fmt->fmt.pix.priv;
+	u32 fmt_priv = fmt->fmt.pix.priv;
 	int mode;
 
 	if (vb2_is_busy(&gspca_dev->queue))
@@ -1109,7 +1109,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *_priv,
 	else
 		gspca_dev->pixfmt = gspca_dev->cam.cam_mode[mode];
 	/* some drivers use priv internally, so keep the original value */
-	fmt->fmt.pix.priv = priv;
+	fmt->fmt.pix.priv = fmt_priv;
 	return 0;
 }
 
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 8a5c2c5227eb..8c7ae362d992 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -590,7 +590,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_s_std(struct file *file, void *_fh,
+static int vidioc_s_std(struct file *file, void *priv,
 			v4l2_std_id std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -610,7 +610,7 @@ static int vidioc_s_std(struct file *file, void *_fh,
 	return hdpvr_config_call(dev, CTRL_VIDEO_STD_TYPE, std_type);
 }
 
-static int vidioc_g_std(struct file *file, void *_fh,
+static int vidioc_g_std(struct file *file, void *priv,
 			v4l2_std_id *std)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -623,7 +623,7 @@ static int vidioc_g_std(struct file *file, void *_fh,
 	return 0;
 }
 
-static int vidioc_querystd(struct file *file, void *_fh, v4l2_std_id *a)
+static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *a)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
 	struct hdpvr_fh *fh = file_to_hdpvr_fh(file);
@@ -642,7 +642,7 @@ static int vidioc_querystd(struct file *file, void *_fh, v4l2_std_id *a)
 	return ret;
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *_fh,
+static int vidioc_s_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -665,7 +665,7 @@ static int vidioc_s_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int vidioc_g_dv_timings(struct file *file, void *_fh,
+static int vidioc_g_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -678,7 +678,7 @@ static int vidioc_g_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int vidioc_query_dv_timings(struct file *file, void *_fh,
+static int vidioc_query_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -720,7 +720,7 @@ static int vidioc_query_dv_timings(struct file *file, void *_fh,
 	return ret;
 }
 
-static int vidioc_enum_dv_timings(struct file *file, void *_fh,
+static int vidioc_enum_dv_timings(struct file *file, void *priv,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -736,7 +736,7 @@ static int vidioc_enum_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int vidioc_dv_timings_cap(struct file *file, void *_fh,
+static int vidioc_dv_timings_cap(struct file *file, void *priv,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -763,7 +763,7 @@ static const char *iname[] = {
 	[HDPVR_COMPOSITE] = "Composite",
 };
 
-static int vidioc_enum_input(struct file *file, void *_fh, struct v4l2_input *i)
+static int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i)
 {
 	unsigned int n;
 
@@ -783,7 +783,7 @@ static int vidioc_enum_input(struct file *file, void *_fh, struct v4l2_input *i)
 	return 0;
 }
 
-static int vidioc_s_input(struct file *file, void *_fh,
+static int vidioc_s_input(struct file *file, void *priv,
 			  unsigned int index)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -817,7 +817,7 @@ static int vidioc_s_input(struct file *file, void *_fh,
 	return retval;
 }
 
-static int vidioc_g_input(struct file *file, void *private_data,
+static int vidioc_g_input(struct file *file, void *priv,
 			  unsigned int *index)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -849,7 +849,7 @@ static int vidioc_enumaudio(struct file *file, void *priv,
 	return 0;
 }
 
-static int vidioc_s_audio(struct file *file, void *private_data,
+static int vidioc_s_audio(struct file *file, void *priv,
 			  const struct v4l2_audio *audio)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -868,7 +868,7 @@ static int vidioc_s_audio(struct file *file, void *private_data,
 	return retval;
 }
 
-static int vidioc_g_audio(struct file *file, void *private_data,
+static int vidioc_g_audio(struct file *file, void *priv,
 			  struct v4l2_audio *audio)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
@@ -985,7 +985,7 @@ static int hdpvr_s_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static int vidioc_enum_fmt_vid_cap(struct file *file, void *private_data,
+static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_fmtdesc *f)
 {
 	if (f->index != 0)
@@ -996,7 +996,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *private_data,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *_fh,
+static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct hdpvr_device *dev = video_drvdata(file);
-- 
Regards,

Laurent Pinchart


