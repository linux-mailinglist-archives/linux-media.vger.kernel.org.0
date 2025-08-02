Return-Path: <linux-media+bounces-38794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AFB18D66
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 895573BBDA7
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63FB2820A0;
	Sat,  2 Aug 2025 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p5R3K+Ce"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAB23644D;
	Sat,  2 Aug 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127183; cv=none; b=GzecR9z3hFg3ycQ5/MW7n8rnigv1jHAWp/rpcqXnSh6rnWIBoRr7EA+8jWaedDiTOYosvV+0wlo8sBqkSUUczDc/cMNu6KLX8057H+n4OmsQr7ENUWrb3hqdBeoWXpnb2UNG20ZUTo2l2eS2NqSkuBer6T40atkph1TaMaN33HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127183; c=relaxed/simple;
	bh=66BEglrdeD2FnJRtm4kSgXnN6HNo5xlbirCCT8rWe5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0fPav0AHNS+0WBVwEEAT/zWB18TAC8cctwThvoJvSTJs5E8GyL4zpbmEBQEOWd8wsesizfMGTQjPYzKH8aIHnqOeApKR/CORz5ljKZj3obiEpKSIzqpW5S/FoOdSWSJR8xeuY2pYGF/vlfgphTqoYC8cdmbeIbiNpz74KJCbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p5R3K+Ce; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 730FA4334;
	Sat,  2 Aug 2025 11:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127134;
	bh=66BEglrdeD2FnJRtm4kSgXnN6HNo5xlbirCCT8rWe5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p5R3K+CeygVp1bnLJzVyIkEJ5l/7ByRskXoCAOaCf3ToWRKzFMbhQXQYpLw6nhHEa
	 FFMFIGTMmqDaVfCCeQNnIPyfyBVXEpak3bs4wQI1Vj6+oQvfkvg6kSNo1BWYeTIb6x
	 IaNd+uNpROhN3ds5QUTW0OfEJilYLfuyEFzGg+cs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:17 +0200
Subject: [PATCH 55/65] media: omap3isp: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-55-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5850;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=66BEglrdeD2FnJRtm4kSgXnN6HNo5xlbirCCT8rWe5c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+uQ6AVm7vuiTX095tLRMegUIn5F62kjDrQ
 0psRthrsRWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PHIiD/4uYOsKvXm2CPF0UtRBkVwC9+EC4KyRliMfJRXvQmbWJkIh7DYXOESnZ4bBTa8c3UEZDk4
 fjo44DHrjN7BD+1T3lRuHTQVA95aQyol1CygcjtqDw9uInfUeNmKfaHpTBlVtV2/RLdafLyKR09
 g2Yx/R5hn9YMAdNI+jFWGTQf/AYD/xHm2kJnIhlSLvV7FyY/fzKOcuEB5j2t4Om3l2OHeSp4EU6
 Q+KWZGIHhdgucc1721ryoG34r1nIP3BM2fe72cGri7jjkmA0wi3T9lEsLVv6+9LlX44JY56gzkU
 U1paLPSLsLgXpzDIGT9vv9ZaGEFuA0ZtB/2yRm/8CjX3mfN6cKH9FpJjOxwLvSqva/yl1KBCF+r
 +YsqNA0ii2zHxXje8LUuxGiHVglCrpYeX+TeQfsKA0/+gdHQZILwKUx8rPRZ5nTBKi2xz0AZ7Di
 QFeqJ+7yYr9VU4Dff5V4PrmbEE8slWWFfpNdddD+WenrrrP7ol8VG+uOynol37PqJ4SsXoBRx1R
 mo/hAXX2A3Zcll+A0qXPwSskXV7rmPeOWUNTblTB4B1uaCgS0/eCzkBbuCdYLjQtUlnOky0ryWc
 ZWvkhrmk/NaRbd+2VrJI1ccq0/eWhrhe1WN0mQtzSAq1DT5C8vNb4TRENSMHWTjGQvkI8MPRwlJ
 PAyInkkQkAcd1DQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it remove the only left user of to_isp_video_fh() and remove
the macro completely.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 22 +++++++++++-----------
 drivers/media/platform/ti/omap3isp/ispvideo.h |  2 --
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 2c0008444b7e2b532c9af061760e7399cdf3e45d..0e7f0bf2b3463b7ef6678f7bd836a952e0b707a7 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -657,7 +657,7 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 static int
 isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (format->type != video->type)
@@ -673,7 +673,7 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 static int
 isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_mbus_framefmt fmt;
 
@@ -858,7 +858,7 @@ isp_video_set_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 static int
 isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (video->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
@@ -876,7 +876,7 @@ isp_video_get_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 static int
 isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 
 	if (video->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
@@ -894,7 +894,7 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 static int
 isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -908,7 +908,7 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 static int
 isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -922,7 +922,7 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 static int
 isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -936,7 +936,7 @@ isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 static int
 isp_video_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	int ret;
 
@@ -1074,7 +1074,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
 static int
 isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	enum isp_pipeline_state state;
 	struct isp_pipeline *pipe;
@@ -1180,7 +1180,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 static int
 isp_video_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 {
-	struct isp_video_fh *vfh = to_isp_video_fh(fh);
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
 	struct isp_pipeline *pipe = to_isp_pipeline(&video->video.entity);
 	enum isp_pipeline_state state;
@@ -1348,7 +1348,7 @@ static int isp_video_release(struct file *file)
 {
 	struct isp_video *video = video_drvdata(file);
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
-	struct isp_video_fh *handle = to_isp_video_fh(vfh);
+	struct isp_video_fh *handle = file_to_isp_video_fh(file);
 
 	/* Disable streaming and free the buffers queue resources. */
 	isp_video_streamoff(file, vfh, video->type);
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.h b/drivers/media/platform/ti/omap3isp/ispvideo.h
index 355812770e18ef5353ac68e65426a3180a6d91ab..537da59cff6258cb66ff4eac6ad2739c3f9465c4 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.h
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
@@ -194,8 +194,6 @@ struct isp_video_fh {
 	struct v4l2_fract timeperframe;
 };
 
-#define to_isp_video_fh(fh)	container_of(fh, struct isp_video_fh, vfh)
-
 static inline struct isp_video_fh *file_to_isp_video_fh(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct isp_video_fh, vfh);

-- 
2.49.0


