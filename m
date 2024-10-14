Return-Path: <linux-media+bounces-19615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4599D0E3
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CF171F2361A
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3289A1ABEA7;
	Mon, 14 Oct 2024 15:08:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76A1AB6DC
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918489; cv=none; b=kYcFpHDqiIMrafntPysYNZM456kVA4DFDpZfJJJKuvwG+w2Y0o65UBCR7ygTyRVU7FwzRUK6s8YPr5JCxiqRYO/9UBlXMhzQYNvQ4nNy4xI+ZpMwhlNG3XKqiKiwTpYG0nDtMH7MR38m1tYioE97Pkitj/+vNRc3oxDy+vCfduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918489; c=relaxed/simple;
	bh=/S0AhbSyTbN9mCpyj1fiokh1Ak8ZFAg62ihmgRE8MwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcNemsfqiTa5hinUrl4R8cbgduc2Q1hUeVIl11r0V2WKtOqUH7qtqrAyyXgwHUXUxXb26Tcge/4oWAvpwmLjAVfq8wUe29SWsWsdhJLzzts/u6KbtZ55f9czCezbbAWQPlerP5Bz3HEhH9qCCHkiyY77G7SaOBCr6c+PxThO2EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BD9C4CED4;
	Mon, 14 Oct 2024 15:07:52 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:31 +0200
Subject: [PATCH 04/10] media: usb: drop vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-4-8c3ee25c618c@xs4all.nl>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
In-Reply-To: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Corentin Labbe <clabbe@baylibre.com>, Michael Krufky <mkrufky@linuxtv.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matt Ranostay <matt@ranostay.sg>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugen Hristev <eugen.hristev@collabora.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
 Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
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
 Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>, 
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
are NULL") it is no longer needed to set the wait_prepare/finish
vb2_ops callbacks as long as the lock field in vb2_queue is set.

Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
we can safely drop these callbacks.

This simplifies the code and this is a step towards the goal of deleting
these callbacks.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/usb/airspy/airspy.c         | 2 --
 drivers/media/usb/au0828/au0828-vbi.c     | 2 --
 drivers/media/usb/au0828/au0828-video.c   | 2 --
 drivers/media/usb/cx231xx/cx231xx-417.c   | 2 --
 drivers/media/usb/cx231xx/cx231xx-vbi.c   | 2 --
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 --
 drivers/media/usb/dvb-usb/cxusb-analog.c  | 2 --
 drivers/media/usb/em28xx/em28xx-vbi.c     | 2 --
 drivers/media/usb/em28xx/em28xx-video.c   | 2 --
 drivers/media/usb/go7007/go7007-v4l2.c    | 2 --
 drivers/media/usb/gspca/gspca.c           | 2 --
 drivers/media/usb/hackrf/hackrf.c         | 2 --
 drivers/media/usb/msi2500/msi2500.c       | 2 --
 drivers/media/usb/pwc/pwc-if.c            | 2 --
 drivers/media/usb/s2255/s2255drv.c        | 2 --
 drivers/media/usb/stk1160/stk1160-v4l.c   | 2 --
 drivers/media/usb/usbtv/usbtv-video.c     | 2 --
 drivers/media/usb/uvc/uvc_queue.c         | 4 ----
 18 files changed, 38 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 3e2a3099a8fe379bb9a92e07cdbc770fa6cb3661..08f0920cf6ca2f2f0fcc8e9a7b1632488d9af5f5 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -603,8 +603,6 @@ static const struct vb2_ops airspy_vb2_ops = {
 	.buf_queue              = airspy_buf_queue,
 	.start_streaming        = airspy_start_streaming,
 	.stop_streaming         = airspy_stop_streaming,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 static int airspy_querycap(struct file *file, void *fh,
diff --git a/drivers/media/usb/au0828/au0828-vbi.c b/drivers/media/usb/au0828/au0828-vbi.c
index b0333637b747d7777ed6f87f7d556e80c6cad377..11203adf47ea04e6fdf2704a11448e0d69e225b2 100644
--- a/drivers/media/usb/au0828/au0828-vbi.c
+++ b/drivers/media/usb/au0828/au0828-vbi.c
@@ -74,6 +74,4 @@ const struct vb2_ops au0828_vbi_qops = {
 	.prepare_streaming = v4l_vb2q_enable_media_source,
 	.start_streaming = au0828_start_analog_streaming,
 	.stop_streaming  = au0828_stop_vbi_streaming,
-	.wait_prepare    = vb2_ops_wait_prepare,
-	.wait_finish     = vb2_ops_wait_finish,
 };
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 2ec49ea479d56ec986b52fa4f4979c83c8f46c36..e9cd2a335f7faf27b029a3a79112d48d6a13188c 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -915,8 +915,6 @@ static const struct vb2_ops au0828_video_qops = {
 	.prepare_streaming = v4l_vb2q_enable_media_source,
 	.start_streaming = au0828_start_analog_streaming,
 	.stop_streaming  = au0828_stop_streaming,
-	.wait_prepare    = vb2_ops_wait_prepare,
-	.wait_finish     = vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index abb967c8bd352cf2fee9bfd25638262560137ed4..a4a9781328c50a47a3bda1894a4c71ed2cca3dea 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1458,8 +1458,6 @@ static const struct vb2_ops cx231xx_video_qops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index 33431d9f54c2cf49363d0c528257a69055f08571..338e101484653afce991912a9fdfb02811a977a9 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -243,8 +243,6 @@ struct vb2_ops cx231xx_vbi_qops = {
 	.buf_queue = vbi_buf_queue,
 	.start_streaming = vbi_start_streaming,
 	.stop_streaming = vbi_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 435eb0b32cb15c5104a5fc4d8ab82bb68ccfeb8c..2cd4e333bc4b012f97df98f8771f2508d81c3b3c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -800,8 +800,6 @@ static const struct vb2_ops cx231xx_video_qops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /*********************  v4l2 interface  **************************************/
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index b5d8c6b75ae133be47b179530d687cfbe0215ef5..8253046cd6e60195264387000789d4739fdffe51 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -956,8 +956,6 @@ static const struct vb2_ops cxdev_video_qops = {
 	.start_streaming = cxusb_medion_v_start_streaming,
 	.stop_streaming = cxusb_medion_v_stop_streaming,
 	.buf_queue = cxusub_medion_v_buf_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish
 };
 
 static const __u32 videocaps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
diff --git a/drivers/media/usb/em28xx/em28xx-vbi.c b/drivers/media/usb/em28xx/em28xx-vbi.c
index b253c44c9724ff37c7e4e4926603d25713b9c657..8c5d9518122330b50636defff324ca2412554800 100644
--- a/drivers/media/usb/em28xx/em28xx-vbi.c
+++ b/drivers/media/usb/em28xx/em28xx-vbi.c
@@ -84,6 +84,4 @@ const struct vb2_ops em28xx_vbi_qops = {
 	.buf_queue      = vbi_buffer_queue,
 	.start_streaming = em28xx_start_analog_streaming,
 	.stop_streaming = em28xx_stop_vbi_streaming,
-	.wait_prepare   = vb2_ops_wait_prepare,
-	.wait_finish    = vb2_ops_wait_finish,
 };
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4aef584e21da5d772d2609641157562ce723f777..66c09bc6d59ed29328c081c03e0084877ea8d7d0 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1229,8 +1229,6 @@ static const struct vb2_ops em28xx_video_qops = {
 	.buf_queue      = buffer_queue,
 	.start_streaming = em28xx_start_analog_streaming,
 	.stop_streaming = em28xx_stop_streaming,
-	.wait_prepare   = vb2_ops_wait_prepare,
-	.wait_finish    = vb2_ops_wait_finish,
 };
 
 static int em28xx_vb2_setup(struct em28xx *dev)
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index 13256565b034308bc6366f1824cbb9f2d145c607..2087ffcb85a5a6d1f89b66a81d65f01772758c9f 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -452,8 +452,6 @@ static const struct vb2_ops go7007_video_qops = {
 	.buf_finish     = go7007_buf_finish,
 	.start_streaming = go7007_start_streaming,
 	.stop_streaming = go7007_stop_streaming,
-	.wait_prepare   = vb2_ops_wait_prepare,
-	.wait_finish    = vb2_ops_wait_finish,
 };
 
 static int vidioc_g_parm(struct file *filp, void *priv,
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index e8c8bdb9c40baaaa59f7e9d98c15c8429aaaad69..25edd21896540291a48a857abb35b2137bdd7604 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1380,8 +1380,6 @@ static const struct vb2_ops gspca_qops = {
 	.buf_queue		= gspca_buffer_queue,
 	.start_streaming	= gspca_start_streaming,
 	.stop_streaming		= gspca_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static const struct v4l2_file_operations dev_fops = {
diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index a1a7690a344a5bc8add88f7d0c5cda6cfc52509b..0b50de8775a38deb11c50da799c98b1a1ef14d0a 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -888,8 +888,6 @@ static const struct vb2_ops hackrf_vb2_ops = {
 	.buf_queue              = hackrf_buf_queue,
 	.start_streaming        = hackrf_start_streaming,
 	.stop_streaming         = hackrf_stop_streaming,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 static int hackrf_querycap(struct file *file, void *fh,
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index c42fad1e3204137d0b97d7e6a77809af14940788..32fb59208ef2811a6548fa1ee76abc6cc579794f 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -883,8 +883,6 @@ static const struct vb2_ops msi2500_vb2_ops = {
 	.buf_queue              = msi2500_buf_queue,
 	.start_streaming        = msi2500_start_streaming,
 	.stop_streaming         = msi2500_stop_streaming,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 static int msi2500_enum_fmt_sdr_cap(struct file *file, void *priv,
diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 4a8485ea0c81436e8a9f3ad0b083d811b50f5b42..3ec9eb5956edd0d6c7d4b4b62ba5a5cc64a2483d 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -760,8 +760,6 @@ static const struct vb2_ops pwc_vb_queue_ops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 /***************************************************************************/
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index a6e450181fd014616a2f4e6bcb72f2ba8b5087ac..899a7a67e2baf16012719006c7cbbf0504462608 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -704,8 +704,6 @@ static const struct vb2_ops s2255_video_qops = {
 	.buf_queue = buffer_queue,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int vidioc_querycap(struct file *file, void *priv,
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index a1f785a5ffd8923b71fd5ac3093ea8f5a5533e20..5ba3d9c4b3fb033106d47a367d4b36d6b47a93ca 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -734,8 +734,6 @@ static const struct vb2_ops stk1160_video_qops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static const struct video_device v4l_template = {
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 702f1c8bd2ab3d8cff01bff379dbfc9a11497dc2..be22a9697197c6078981a84b882ec85cd591506c 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -780,8 +780,6 @@ static const struct vb2_ops usbtv_vb2_ops = {
 	.buf_queue = usbtv_buf_queue,
 	.start_streaming = usbtv_start_streaming,
 	.stop_streaming = usbtv_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int usbtv_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 16fa17bbd15eaaa60bd160fd687a1b282eebec56..26ee85657fc89da97655cc8ff6e63a5bb99384ef 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -197,8 +197,6 @@ static const struct vb2_ops uvc_queue_qops = {
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
 	.buf_finish = uvc_buffer_finish,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = uvc_start_streaming,
 	.stop_streaming = uvc_stop_streaming,
 };
@@ -207,8 +205,6 @@ static const struct vb2_ops uvc_meta_queue_qops = {
 	.queue_setup = uvc_queue_setup,
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.stop_streaming = uvc_stop_streaming,
 };
 

-- 
2.45.2


