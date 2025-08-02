Return-Path: <linux-media+bounces-38740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F43B18B97
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332051AA2465
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB0621ABAD;
	Sat,  2 Aug 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V5iDpcEs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAD214A91;
	Sat,  2 Aug 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126620; cv=none; b=LAyiqt2X8DUFAbsJ5EoaU7Mrms+WWTe96x5MvoG3im1q/aaRDlQG5gYwHfB1e5lqMCoSRi288yn7NAj8jK/w5h0xai08jSr/8zjwScHgzKix/wMPNI2iCOlq4qMhoMIVimgjp1kKlKvuvLU4UrjyqffMqfpdHB6X0pC6xgjcItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126620; c=relaxed/simple;
	bh=uc+e4D121XpcsbBTsetI8Y/3AlX9Hz46SjF1XOt24QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Da0/GQsqDXWdPgIQ5G5DqvTtdb0GI9UoxNASs031PA8of0XG5mhcy1yWETYnQIkDgO6KLaZl7UqfCTSFr1dg+FGVF2oJsZPEZv6u2mYz6DD7sN4iabnHyjc45rndoVbge5NtBeqSadhmY5i1H2Sdn1Nzq32TgeesmizbMr7Zrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V5iDpcEs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11CC83DA;
	Sat,  2 Aug 2025 11:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126570;
	bh=uc+e4D121XpcsbBTsetI8Y/3AlX9Hz46SjF1XOt24QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V5iDpcEspRPnvHfAwmOr99+IOUj9lDyUHdxF6w3FWnwGAO1+33nGVL7N9XM5qQJqa
	 zG/eRFBKfgJFJiJ1JPZ3l47lLiuJfgv5GQ7AvAEbP6KtwH3xGSQXtSsVwcwTytnmGT
	 2HukJ/5pnKY6Jk6oBPJzo8ZfDbDuVBmWfAaONPC8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:23 +0200
Subject: [PATCH 01/65] media: pci: saa7164: Store v4l2_fh pointer in
 file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-1-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10416;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=4KYc+fAfF5XAqGdIeu1Z3mk2YUK/u81xqaNfmxJ3Ufs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj3RHqWTU3HuCd37ITdQdY7tRmUtJ6lQQYz0
 KMrHWu85E+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y9wAKCRByNAaPFqFW
 PEKcD/98jLHB4HokFvLEJrxTaXM/Serb/l7Ex/Uds/UYB8jQLGOeF/4nWiAMeE9ljn9idNeoexQ
 YzY6l5ipNXYKt8SpqjiNJ0WO/2Yu6CvTgBB7URe02gA2bJNnXjlBGXmaquBHBzvqaJLaz4cn8eu
 9624b/9DQMRo0VVg4uAyclXwBLHSlBzZ5jUbAOIB1iqi1oSuzh5AhiboRs+OAb7yk3xRj+F2ew0
 GfBOXE7qHxtzXyt2mHc+evzBcTOScHKEZDy/ZcwqAFCkR0x/up3I3ICsyrfPCZKQ13BrHEtjmGP
 zZnYt/jFmUjMiHVUFG+JBSOGkZAXEEW/I6lvsFLYnWvOBrGQS6TiLo+44PBa9V8XRzp8pddAr/+
 ejretpCpgosNlOQhdUuxxMedmu2B7Duot57BIAfx6kWQEkqwr3/3UY2eenTgITzQwFfBNyJ9QmR
 VTwgKdM0gzy6KGahbRc2ln1oaGCZyGoQNRvwjH2BCKZnuqyzzKhd03K2v43qHXtOJjwKoaSRkvl
 wrtb2LZ6gJ/2U2diVU9sidMTAUioUH0zt7e4AsxR/3MKBafy/+lXdohYJWdFBpW/qXgLjqJVlvh
 tS0iQ5SoNtCBJlRnbw0ak+o40Le5sVvkLGvfdWa0pE8ENPBX2N8vVjRt8dpKg+3XN/7Bxq/cRzj
 wzQUMrJx6Nx3rng==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
saa7164 instead stores the pointer to the driver-specific structure that
embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

This also fixes a bug in the vidioc_g_std() in saa7164-vbi.c that casts
the private_data void pointer to a saa7164_encoder_fh instead of a
saa7164_vbi_fh. The bug has no practical consequence as the two
structures are identical.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 27 +++++++++++++--------------
 drivers/media/pci/saa7164/saa7164-vbi.c     | 22 +++++++++++-----------
 drivers/media/pci/saa7164/saa7164.h         | 10 ++++++++++
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index bf73e9e83f52324ca494816f7d9fa2fae7de6774..296f50b6b8d38e0ab617f0990d8f697ba96b0016 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -219,7 +219,7 @@ int saa7164_s_std(struct saa7164_port *port, v4l2_std_id id)
 
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_std(fh->port, id);
 }
@@ -232,7 +232,7 @@ int saa7164_g_std(struct saa7164_port *port, v4l2_std_id *id)
 
 static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_std(fh->port, id);
 }
@@ -277,7 +277,7 @@ int saa7164_g_input(struct saa7164_port *port, unsigned int *i)
 
 static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_input(fh->port, i);
 }
@@ -301,14 +301,14 @@ int saa7164_s_input(struct saa7164_port *port, unsigned int i)
 
 static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_input(fh->port, i);
 }
 
 int saa7164_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -347,7 +347,7 @@ int saa7164_g_frequency(struct saa7164_port *port, struct v4l2_frequency *f)
 static int vidioc_g_frequency(struct file *file, void *priv,
 	struct v4l2_frequency *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_frequency(fh->port, f);
 }
@@ -400,7 +400,7 @@ int saa7164_s_frequency(struct saa7164_port *port,
 static int vidioc_s_frequency(struct file *file, void *priv,
 			      const struct v4l2_frequency *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_frequency(fh->port, f);
 }
@@ -483,7 +483,7 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 static int vidioc_querycap(struct file *file, void  *priv,
 	struct v4l2_capability *cap)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -510,7 +510,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 static int vidioc_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
@@ -726,14 +726,14 @@ static int fops_open(struct file *file)
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 
 	return 0;
 }
 
 static int fops_release(struct file *file)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -787,7 +787,7 @@ saa7164_user_buffer *saa7164_enc_next_buf(struct saa7164_port *port)
 static ssize_t fops_read(struct file *file, char __user *buffer,
 	size_t count, loff_t *pos)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_user_buffer *ubuf = NULL;
 	struct saa7164_dev *dev = port->dev;
@@ -893,8 +893,7 @@ static ssize_t fops_read(struct file *file, char __user *buffer,
 static __poll_t fops_poll(struct file *file, poll_table *wait)
 {
 	__poll_t req_events = poll_requested_events(wait);
-	struct saa7164_encoder_fh *fh =
-		(struct saa7164_encoder_fh *)file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	__poll_t mask = v4l2_ctrl_poll(file, wait);
 
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index ac958a5fca78e5094d7befd8c125fa4233bb6999..a7e398f304725c7fa5aa4cf1edf0deb0df059641 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -144,28 +144,28 @@ static int saa7164_vbi_initialize(struct saa7164_port *port)
 /* -- V4L2 --------------------------------------------------------- */
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_std(fh->port->enc_port, id);
 }
 
 static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_std(fh->port->enc_port, id);
 }
 
 static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_input(fh->port->enc_port, i);
 }
 
 static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_input(fh->port->enc_port, i);
 }
@@ -173,7 +173,7 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 static int vidioc_g_frequency(struct file *file, void *priv,
 	struct v4l2_frequency *f)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_frequency(fh->port->enc_port, f);
 }
@@ -181,7 +181,7 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 static int vidioc_s_frequency(struct file *file, void *priv,
 	const struct v4l2_frequency *f)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	int ret = saa7164_s_frequency(fh->port->enc_port, f);
 
 	if (ret == 0)
@@ -192,7 +192,7 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 static int vidioc_querycap(struct file *file, void  *priv,
 	struct v4l2_capability *cap)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -429,14 +429,14 @@ static int fops_open(struct file *file)
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 
 	return 0;
 }
 
 static int fops_release(struct file *file)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -489,7 +489,7 @@ saa7164_user_buffer *saa7164_vbi_next_buf(struct saa7164_port *port)
 static ssize_t fops_read(struct file *file, char __user *buffer,
 	size_t count, loff_t *pos)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_user_buffer *ubuf = NULL;
 	struct saa7164_dev *dev = port->dev;
@@ -596,7 +596,7 @@ static ssize_t fops_read(struct file *file, char __user *buffer,
 
 static __poll_t fops_poll(struct file *file, poll_table *wait)
 {
-	struct saa7164_vbi_fh *fh = (struct saa7164_vbi_fh *)file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	__poll_t mask = 0;
 
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index e1bac1fe19d3098792b2051b537857e3f13054d5..7b511f7f1cfc305a9ffe60722b9ebe093163787d 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -180,12 +180,22 @@ struct saa7164_encoder_fh {
 	atomic_t v4l_reading;
 };
 
+static inline struct saa7164_encoder_fh *to_saa7164_encoder_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct saa7164_encoder_fh, fh);
+}
+
 struct saa7164_vbi_fh {
 	struct v4l2_fh fh;
 	struct saa7164_port *port;
 	atomic_t v4l_reading;
 };
 
+static inline struct saa7164_vbi_fh *to_saa7164_vbi_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct saa7164_vbi_fh, fh);
+}
+
 struct saa7164_histogram_bucket {
 	u32 val;
 	u32 count;

-- 
2.49.0


