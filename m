Return-Path: <linux-media+bounces-38741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72CB18B9F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D9E1895836
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AB3221568;
	Sat,  2 Aug 2025 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g8cVRCST"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315620B81B;
	Sat,  2 Aug 2025 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126629; cv=none; b=Z8n3LxArR0LKJsvMvc/DLjTlTk02CkOXW0Xf6L8PUxeoxWB34Eo7EUybO/Cq7fQixv9bO6dnn8efdibfLJLFKC0olnJSUqQcFPJLNbio3KIGUDft0igPPrObIQ+IVb6W0j7laFeyDYowLHfIq2NvXp/qj08+SN0Afws1L8mNYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126629; c=relaxed/simple;
	bh=K8dDCPVG1nkY6ic4h3FKwjvVzHTUjGzd1GG1sYDnoFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0SZxS5eTN3INCIkuuiX+MMXSMA7oibf4gdxNjBpPSiXBRICR/HURqVPczaqmVYVYbylTXBV1Yde6yoqPwIbq6UGi+KCbkDb7r/0BlwSp6WfJoZnpkbymsL3ifXa0z0yEPBGoOK/qffG4yHZuQpeG15EbxPzMbsZ/++1AQcggGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g8cVRCST; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50061725;
	Sat,  2 Aug 2025 11:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126580;
	bh=K8dDCPVG1nkY6ic4h3FKwjvVzHTUjGzd1GG1sYDnoFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g8cVRCST89q8XYffSHxu1w8tRa9g2WsNGAItA5r8tH7V/DbNblJ6jc6QvVyhgL8GB
	 eKkqv3HG0YcDlIfWs/kNrYjBUoXt/w9rLBJirlDl0OvkFCg0Gk7qcnY3MaZSyFiphj
	 CNoEtAx/JHqYMJ4o7RcXRdqE15IMUkcyVG52VhQU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:24 +0200
Subject: [PATCH 02/65] media: imagination: Store v4l2_fh pointer in
 file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-2-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4825;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=uq3V2iL6jCR+ekaMlo1+qk6d+aP7IFCv3nHFixV02JI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj30OFbTXcU0cO/acV0mQKqOVtG4JiSgWCWT
 g8NFanNpkOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y9wAKCRByNAaPFqFW
 PHCED/4vrTjKJYdLSEILTxmBH365qg3YmPx3URIJqZdf8km+nCKwi18Ewh7L8dvElXpn+jZJHMK
 iKF6lVmZ0nmIlIRlnH0Se6dmxhUSypRm6TuyQrsNID25XEkTcjN53a2+mk/NPFIGywdmIT7RxA0
 bhfdBlfEJs53trejkMhGwCeigYz4KCwv9Jp+4R6xKuTII7IzCGi4ChSkK84RyAQYIYJrePAGgWY
 DNIXleinVIw/43K55GUapypW1rzzVB57Hf8PJCHKazRfD5Gxqmz51P8817+/bcabIMfp6b+wk0w
 /xgE23R2n45by1ZqRZPJgg3RSjyYhQ+SZEIojBzMxHsjz7ER/Uqp74kbaBK46lUromE5rNJKVIi
 8fkdjLbmGlxHZIVaJG+mc83ADCfH572DS8t0knqjYlieQGK8F2wak6rvN/voGvF7UM3oZpjURwb
 Le9qpnU9LdYcS5WGJ2/ZjuWgjv6j4DwdSmxEHhtqX4Y21ggO8HrL6lWdhdvk943omp9GFgDPGWt
 qv5A5St0/fo6JY1FcZYd/AV2SbfJoaCb6aaaFuo/Ore1XBRkOSzj3IFDFCDa0wlOGaAqVsM1GNr
 /oaORYpASWFGcUWz2IBIjnFDw+QsEUtkzz9n5Hf3Yw+ojHMdNjUAQa2UzZxJhtL9XlP9gjqDZ/Q
 1WxsRYX5yD/TxHA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
e5010-jpeg-enc driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 18 +++++++++---------
 drivers/media/platform/imagination/e5010-jpeg-enc.h |  5 +++++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index ae868d9f73e13fdac747ef603e08ea13cd66d3a6..295461325862fb2bcac755cf815955955b37e6f0 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -253,7 +253,7 @@ static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	int i, index = 0;
 	struct e5010_fmt *fmt = NULL;
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
 		v4l2_err(&ctx->e5010->v4l2_dev, "ENUMFMT with Invalid type: %d\n", f->type);
@@ -279,7 +279,7 @@ static int e5010_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 
 static int e5010_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 	int i;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -380,14 +380,14 @@ static int e5010_jpeg_try_fmt(struct v4l2_format *f, struct e5010_context *ctx)
 
 static int e5010_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	return e5010_jpeg_try_fmt(f, ctx);
 }
 
 static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct vb2_queue *vq;
 	int ret = 0, i = 0;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
@@ -462,7 +462,7 @@ static int e5010_enum_framesizes(struct file *file, void *priv, struct v4l2_frms
 
 static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -490,7 +490,7 @@ static int e5010_g_selection(struct file *file, void *fh, struct v4l2_selection
 
 static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	struct e5010_q_data *queue;
 	struct vb2_queue *vq;
 	struct v4l2_rect base_rect;
@@ -742,7 +742,7 @@ static int e5010_open(struct file *file)
 	}
 
 	v4l2_fh_init(&ctx->fh, vdev);
-	file->private_data = ctx;
+	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
 	ctx->e5010 = e5010;
@@ -781,7 +781,7 @@ static int e5010_open(struct file *file)
 static int e5010_release(struct file *file)
 {
 	struct e5010_dev *e5010 = video_drvdata(file);
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 
 	dprintk(e5010, 1, "Releasing instance: 0x%p, m2m_ctx: 0x%p\n", ctx, ctx->fh.m2m_ctx);
 	mutex_lock(&e5010->mutex);
@@ -1262,7 +1262,7 @@ static void e5010_buf_queue(struct vb2_buffer *vb)
 static int e5010_encoder_cmd(struct file *file, void *priv,
 			     struct v4l2_encoder_cmd *cmd)
 {
-	struct e5010_context *ctx = file->private_data;
+	struct e5010_context *ctx = to_e5010_context(file);
 	int ret;
 	struct vb2_queue *cap_vq;
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index 71f49ead68980c83fd81b19fd63d9abd47abef64..eefaf60489d3fba518acd12709f2e4831686620b 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -120,6 +120,11 @@ struct e5010_context {
 	u8				chroma_qp[QP_TABLE_SIZE];
 };
 
+static inline struct e5010_context *to_e5010_context(struct file *filp)
+{
+	return container_of(filp->private_data, struct e5010_context, fh);
+}
+
 /*
  * Buffer structure
  * Contains info for all buffers

-- 
2.49.0


