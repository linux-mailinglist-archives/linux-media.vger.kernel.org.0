Return-Path: <linux-media+bounces-19614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0399D0DB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B912FB231AB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809D91A4F20;
	Mon, 14 Oct 2024 15:07:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655249659
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918472; cv=none; b=ALYQxr4RSZu3Jw7pgiyrySL1yzI54w4lMxUAFSkh8x8cTu+uYvsKeinZjpXewcg9arDZGDujN3CRambS7OdEJxZm0Cm6pkjq8m7HtZ04ZXnsCSo5/8i49juC/mCmcIwg7k0HIyBsEuj1Kmr4Et4UP6aLtOHTpaohXeYWpKCFVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918472; c=relaxed/simple;
	bh=AaNhr1MYchMG1KocrUsuE6X7Qr86Usot8pXAs+mSYSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBRJ54yh30DhVjTKomFIUogM4oq1PLOrpMtxSo/Eji7k/aiIuVEjaxhlMiVbg6bQyTxxNVAJATcAdW1H+vBUgCSGPBtQ0tzEfT2nNrtEPkIh2BP2/c2QOWItdDsiZKCzXokU7ZZysur4r7n/6fNuMyY9R9XN7g+2U1v9b03+CzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6853C4CED0;
	Mon, 14 Oct 2024 15:07:34 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:30 +0200
Subject: [PATCH 03/10] media: pci: drop vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-3-8c3ee25c618c@xs4all.nl>
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
 drivers/media/pci/bt8xx/bttv-driver.c          | 2 --
 drivers/media/pci/bt8xx/bttv-vbi.c             | 2 --
 drivers/media/pci/cobalt/cobalt-v4l2.c         | 2 --
 drivers/media/pci/cx18/cx18-streams.c          | 2 --
 drivers/media/pci/cx23885/cx23885-417.c        | 2 --
 drivers/media/pci/cx23885/cx23885-dvb.c        | 2 --
 drivers/media/pci/cx23885/cx23885-vbi.c        | 2 --
 drivers/media/pci/cx23885/cx23885-video.c      | 2 --
 drivers/media/pci/cx25821/cx25821-video.c      | 2 --
 drivers/media/pci/cx88/cx88-blackbird.c        | 2 --
 drivers/media/pci/cx88/cx88-dvb.c              | 2 --
 drivers/media/pci/cx88/cx88-vbi.c              | 2 --
 drivers/media/pci/cx88/cx88-video.c            | 2 --
 drivers/media/pci/dt3155/dt3155.c              | 2 --
 drivers/media/pci/intel/ipu3/ipu3-cio2.c       | 2 --
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 --
 drivers/media/pci/mgb4/mgb4_vin.c              | 2 --
 drivers/media/pci/mgb4/mgb4_vout.c             | 2 --
 drivers/media/pci/saa7134/saa7134-empress.c    | 2 --
 drivers/media/pci/saa7134/saa7134-ts.c         | 2 --
 drivers/media/pci/saa7134/saa7134-vbi.c        | 2 --
 drivers/media/pci/saa7134/saa7134-video.c      | 2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 2 --
 drivers/media/pci/solo6x10/solo6x10-v4l2.c     | 2 --
 drivers/media/pci/sta2x11/sta2x11_vip.c        | 2 --
 drivers/media/pci/tw5864/tw5864-video.c        | 2 --
 drivers/media/pci/tw68/tw68-video.c            | 2 --
 drivers/media/pci/tw686x/tw686x-video.c        | 2 --
 drivers/media/pci/zoran/zoran_driver.c         | 2 --
 29 files changed, 58 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 511f013cc33873ecc0a5ee4adfa4eb0727f38022..2782832f5eb8f272cf9acf29d7b4c31620c99227 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1584,8 +1584,6 @@ static const struct vb2_ops bttv_video_qops = {
 	.buf_cleanup    = buf_cleanup,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
-	.wait_prepare   = vb2_ops_wait_prepare,
-	.wait_finish    = vb2_ops_wait_finish,
 };
 
 static void radio_enable(struct bttv *btv)
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index e489a3acb4b98afa17036c3a85514c40031f40e5..a71440611e46eccfc442a7f9100f803d9d875201 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -170,8 +170,6 @@ const struct vb2_ops bttv_vbi_qops = {
 	.buf_cleanup	= buf_cleanup_vbi,
 	.start_streaming = start_streaming_vbi,
 	.stop_streaming = stop_streaming_vbi,
-	.wait_prepare   = vb2_ops_wait_prepare,
-	.wait_finish    = vb2_ops_wait_finish,
 };
 
 /* ----------------------------------------------------------------------- */
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index d4d7b264c965a3a6a7c76e23567b0c18deb742d3..ae82427e3479bb316dc310bb11837aad05ffaf9c 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -424,8 +424,6 @@ static const struct vb2_ops cobalt_qops = {
 	.buf_queue = cobalt_buf_queue,
 	.start_streaming = cobalt_start_streaming,
 	.stop_streaming = cobalt_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 /* V4L2 ioctls */
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index acc6418db4254ab00eb1b70ebdce30799e85e503..42d6f7b90ede3045b9c5612a35ce8dbee2551282 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -229,8 +229,6 @@ static const struct vb2_ops cx18_vb2_qops = {
 	.buf_prepare		= cx18_buf_prepare,
 	.start_streaming	= cx18_start_streaming,
 	.stop_streaming		= cx18_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int cx18_stream_init(struct cx18 *cx, int type)
diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index fdb96f80c03649f9ce1f5acac8f4b9b3e54b9df1..219937a153b3aed206091579fffbd07840ca0c3a 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1210,8 +1210,6 @@ static const struct vb2_ops cx23885_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = cx23885_start_streaming,
 	.stop_streaming = cx23885_stop_streaming,
 };
diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index 3d01cdc4c7f3d7d379a63d9fde4d2ded73d41972..05a7859cbe5795bdb7d54510fe617f48ab486986 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -170,8 +170,6 @@ static const struct vb2_ops dvb_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = cx23885_start_streaming,
 	.stop_streaming = cx23885_stop_streaming,
 };
diff --git a/drivers/media/pci/cx23885/cx23885-vbi.c b/drivers/media/pci/cx23885/cx23885-vbi.c
index 4bdd2bea3713e1dc0fd630dedf345d87c9a8632f..40817cc52fc1ee256be86319638d0d26116e51c0 100644
--- a/drivers/media/pci/cx23885/cx23885-vbi.c
+++ b/drivers/media/pci/cx23885/cx23885-vbi.c
@@ -249,8 +249,6 @@ const struct vb2_ops cx23885_vbi_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = cx23885_start_streaming,
 	.stop_streaming = cx23885_stop_streaming,
 };
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 7d4a409c433e2a8c909323542e6f917bd27cfb64..35d58328db563992fa1332e3e96427749eaf7ed8 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -519,8 +519,6 @@ static const struct vb2_ops cx23885_video_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = cx23885_start_streaming,
 	.stop_streaming = cx23885_stop_streaming,
 };
diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index 0bee4b728a6014817d74fe243dbf9ef3c2da1524..84aa1209e7171ecc541a764fea064e031ce2bb6e 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -295,8 +295,6 @@ static const struct vb2_ops cx25821_video_qops = {
 	.buf_prepare  = cx25821_buffer_prepare,
 	.buf_finish = cx25821_buffer_finish,
 	.buf_queue    = cx25821_buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = cx25821_start_streaming,
 	.stop_streaming = cx25821_stop_streaming,
 };
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index d55df8fdb3b604400495021033b3e57406f982e1..13b8cc46835b2cb5a84405cdb7fa21d35675f552 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -781,8 +781,6 @@ static const struct vb2_ops blackbird_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 };
diff --git a/drivers/media/pci/cx88/cx88-dvb.c b/drivers/media/pci/cx88/cx88-dvb.c
index b33b3a5e32ec6479d96af4558d200be6122572f9..c9cfceed2f1b42fc5a9c2c97900b7e1d638226c8 100644
--- a/drivers/media/pci/cx88/cx88-dvb.c
+++ b/drivers/media/pci/cx88/cx88-dvb.c
@@ -152,8 +152,6 @@ static const struct vb2_ops dvb_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 };
diff --git a/drivers/media/pci/cx88/cx88-vbi.c b/drivers/media/pci/cx88/cx88-vbi.c
index 469aeaa725ad9259122f407edf71006f5e324b4d..e3e379e6f6207b6ebf08327263d7087f5122d236 100644
--- a/drivers/media/pci/cx88/cx88-vbi.c
+++ b/drivers/media/pci/cx88/cx88-vbi.c
@@ -228,8 +228,6 @@ const struct vb2_ops cx8800_vbi_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 };
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index cefb6b25e92172b188b9f4f699492eaa31cf2b0b..0c87327689d3f669241bfc11ca07f7210f603a36 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -562,8 +562,6 @@ static const struct vb2_ops cx8800_video_qops = {
 	.buf_prepare  = buffer_prepare,
 	.buf_finish = buffer_finish,
 	.buf_queue    = buffer_queue,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 };
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index dff853e73fdc8ef66f18cd7f27e017346850c6d8..7bddcbba4cf1ba2998afbfe1e961ad89a303f1c2 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -222,8 +222,6 @@ static void dt3155_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops q_ops = {
 	.queue_setup = dt3155_queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_prepare = dt3155_buf_prepare,
 	.start_streaming = dt3155_start_streaming,
 	.stop_streaming = dt3155_stop_streaming,
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 81ec8630453b7a1240528f1d36182d0928aded09..4e98f432ed557393c83dbbe404b6d5e6d87fd106 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1045,8 +1045,6 @@ static const struct vb2_ops cio2_vb2_ops = {
 	.queue_setup = cio2_vb2_queue_setup,
 	.start_streaming = cio2_vb2_start_streaming,
 	.stop_streaming = cio2_vb2_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 /**************** V4L2 interface ****************/
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 03dbb0e0ea7957970667cef31f668a807b30455a..4e15dd75cf865559893eea55360e8224f78fbc7c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -767,8 +767,6 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 
 static const struct vb2_ops ipu6_isys_queue_ops = {
 	.queue_setup = queue_setup,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 	.buf_prepare = ipu6_isys_buf_prepare,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 185fb28226b60c3253f64d78e945172c6321ac33..e34d02d1e943db98578765562e99d79776fe52a0 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -304,8 +304,6 @@ static const struct vb2_ops queue_ops = {
 	.buf_queue = buffer_queue,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish
 };
 
 static int fh_open(struct file *file)
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 133110aac68808fa956ae7da8cb2e6bd27cf7447..6b2791e29de15e5124c5a05ed5bf1a9e2668f6d5 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -230,8 +230,6 @@ static const struct vb2_ops queue_ops = {
 	.buf_queue = buffer_queue,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish
 };
 
 static int vidioc_querycap(struct file *file, void *priv,
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index bbf480ab31ca7728934821faf33b734d894b9a8c..8c4f70e4177d1836ad685be851df63b234674c40 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -78,8 +78,6 @@ static const struct vb2_ops saa7134_empress_qops = {
 	.buf_init	= saa7134_ts_buffer_init,
 	.buf_prepare	= saa7134_ts_buffer_prepare,
 	.buf_queue	= saa7134_vb2_buffer_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.start_streaming = start_streaming,
 	.stop_streaming = stop_streaming,
 };
diff --git a/drivers/media/pci/saa7134/saa7134-ts.c b/drivers/media/pci/saa7134/saa7134-ts.c
index 437dbe5e75e2975a370a99f14f9aeb9fb5658b96..ec699ea14799427a8c0d0b6318fa30d94dc061ea 100644
--- a/drivers/media/pci/saa7134/saa7134-ts.c
+++ b/drivers/media/pci/saa7134/saa7134-ts.c
@@ -166,8 +166,6 @@ struct vb2_ops saa7134_ts_qops = {
 	.buf_init	= saa7134_ts_buffer_init,
 	.buf_prepare	= saa7134_ts_buffer_prepare,
 	.buf_queue	= saa7134_vb2_buffer_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.stop_streaming = saa7134_ts_stop_streaming,
 };
 EXPORT_SYMBOL_GPL(saa7134_ts_qops);
diff --git a/drivers/media/pci/saa7134/saa7134-vbi.c b/drivers/media/pci/saa7134/saa7134-vbi.c
index 3e773690468bdb935d0a2ada46ef9a7f9da23e8d..efa6e4fa423aa9cfed5556bb7f19832fa18811e2 100644
--- a/drivers/media/pci/saa7134/saa7134-vbi.c
+++ b/drivers/media/pci/saa7134/saa7134-vbi.c
@@ -161,8 +161,6 @@ const struct vb2_ops saa7134_vbi_qops = {
 	.buf_init	= buffer_init,
 	.buf_prepare	= buffer_prepare,
 	.buf_queue	= saa7134_vb2_buffer_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.start_streaming = saa7134_vb2_start_streaming,
 	.stop_streaming = saa7134_vb2_stop_streaming,
 };
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 56b4481a40e6125fa8534a85e56031186a190e8e..43e7b006eb596740771cf893d8fda39df0e4aff4 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -844,8 +844,6 @@ static const struct vb2_ops vb2_qops = {
 	.buf_init	= buffer_init,
 	.buf_prepare	= buffer_prepare,
 	.buf_queue	= saa7134_vb2_buffer_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 	.start_streaming = saa7134_vb2_start_streaming,
 	.stop_streaming = saa7134_vb2_stop_streaming,
 };
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 0adf3d80f248ed3511509e5a571f1226cac62866..5ee59b3844cc3dc4ae42c255a0ea3e624c605a1d 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -756,8 +756,6 @@ static const struct vb2_ops solo_enc_video_qops = {
 	.buf_finish	= solo_enc_buf_finish,
 	.start_streaming = solo_enc_start_streaming,
 	.stop_streaming = solo_enc_stop_streaming,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 };
 
 static int solo_enc_querycap(struct file *file, void  *priv,
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index e18cc41fca83b2b5293dc4d654c96a5ee86a6993..35715b21dbdffc80de68990b88836700816e7cb6 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -365,8 +365,6 @@ static const struct vb2_ops solo_video_qops = {
 	.buf_queue	= solo_buf_queue,
 	.start_streaming = solo_start_streaming,
 	.stop_streaming = solo_stop_streaming,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 };
 
 static int solo_querycap(struct file *file, void  *priv,
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 364ce9e5701827de4d7b92cac104fa9d0fcb8869..3049bad20f142dbfdf6bbd47699c50f75cb10f72 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -372,8 +372,6 @@ static const struct vb2_ops vip_video_qops = {
 	.buf_queue		= buffer_queue,
 	.start_streaming	= start_streaming,
 	.stop_streaming		= stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 4f35c159efe5a39be8c674a8d21b4e58437849f9..0a08708e52b08283074db66611969312762182a8 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -471,8 +471,6 @@ static const struct vb2_ops tw5864_video_qops = {
 	.buf_queue = tw5864_buf_queue,
 	.start_streaming = tw5864_start_streaming,
 	.stop_streaming = tw5864_stop_streaming,
-	.wait_prepare = vb2_ops_wait_prepare,
-	.wait_finish = vb2_ops_wait_finish,
 };
 
 static int tw5864_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index cdf5d733b863e46186e3a02f9f3e489ba1b62c5f..77773dec48b83ac997fcbbb4dc83e55861a899eb 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -524,8 +524,6 @@ static const struct vb2_ops tw68_video_qops = {
 	.buf_finish	= tw68_buf_finish,
 	.start_streaming = tw68_start_streaming,
 	.stop_streaming = tw68_stop_streaming,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 63be95fce83d132718ed94a20865fc337b701cc7..785dd797d921b515ead7b500edd01a4ac0618e6d 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -579,8 +579,6 @@ static const struct vb2_ops tw686x_video_qops = {
 	.buf_prepare		= tw686x_buf_prepare,
 	.start_streaming	= tw686x_start_streaming,
 	.stop_streaming		= tw686x_stop_streaming,
-	.wait_prepare		= vb2_ops_wait_prepare,
-	.wait_finish		= vb2_ops_wait_finish,
 };
 
 static int tw686x_s_ctrl(struct v4l2_ctrl *ctrl)
diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 5c05e64c71a905a2900b3e7feeea50672394881a..f42f596d3e6295e31e3b33cd83c5f7243911bd30 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -950,8 +950,6 @@ static const struct vb2_ops zr_video_qops = {
 	.buf_prepare            = zr_vb2_prepare,
 	.start_streaming        = zr_vb2_start_streaming,
 	.stop_streaming         = zr_vb2_stop_streaming,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir)

-- 
2.45.2


