Return-Path: <linux-media+bounces-38799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114EB18D88
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB5FD3AC327
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D86284B2E;
	Sat,  2 Aug 2025 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SkX6QI0f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB4269D06;
	Sat,  2 Aug 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127230; cv=none; b=aMzoEETlSnXWPGNQCkpE6rA7Y3ea0w2g83ShL1I9XNJqgMSPLfSyEsYP89b8rLDc5gsue3xd+w+YEY2K0YxAIfU4H0RjLFpUn2WrqLau4Zwg5a5EJAglG/vd7K9pUOHkeJ0ArMDUUt6MigKtej5KGTU5syloO+FdR48GjloZvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127230; c=relaxed/simple;
	bh=plUDcgbQkGw4JyRbthC79SLTx+gbob3U9axm5vZyPtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6mOrCdyvu3Meyc/mivnNVKSd+u+OumwlodhDjLpot7CzuNn50TQHxAup1Rb3b8wtomjGuvSKv9LnA63m9kBiSUyM6qL+L8gLClv6uAhGAeS+2mqq/Kx6X+WpyVz5sT+spOrQWdsiJUKzJEnp3TaBTg+qreJcJCBb0hIyRA6u8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SkX6QI0f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1A939D0;
	Sat,  2 Aug 2025 11:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127181;
	bh=plUDcgbQkGw4JyRbthC79SLTx+gbob3U9axm5vZyPtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SkX6QI0fVpdZyZWipUKoRAh6k0e+KWR2tAAJnBI4jQ23/Jqyuwg3nvBEqmr2hdkvu
	 f3kK5CxdreRfQcAG/s/J8ryTY8EWe3hohBJEYgb614t2SVt/j3dRn/xosIhuT7TpD9
	 IIMKMGph9jDhippZQMTJbMZkOzAa9CJnWTL5yD2w=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:22 +0200
Subject: [PATCH 60/65] media: usb: uvc: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-60-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7314;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=plUDcgbQkGw4JyRbthC79SLTx+gbob3U9axm5vZyPtk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+Gv25IxJxmaQk2kge3awblRwS1LI4XdRw4
 Rr8AM7v8PyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PKg0D/40XOP1ymiqV3UZQ3VXGNXxWoOIIzNeadTf1tfqQ0EWWeJ1hUxsU5M5ACuvX6TBofNvS50
 kh+QpYAgXd6q4dudHmxvocEcg8NOyRQ5uW2Cyrs/GqSqaN7SMh6q76tjdsA8tbXXh0o3oyDe36B
 qjtT/cC2i5fIerKN3xco2Cpff20JshnqvaKgBVIcK8Ze+iVAqqAiO2cWAFUOts/lJk+5kN9yRDN
 qfGrm8F90EMGjayFJq6JiDsE+d3pCUIY9ZQb+zaqdNUGPGc1FzzQbYmd744+C9o8qo3OBLOgGT+
 EFCV4vdHx7xoSCsRkBSiPnKCx/ztAthTj1AsUTGJyzsAGNRiTAJRIItVGRO8dXkgSv2+ZryniHl
 9Bf1/2lj18fmhHdihFTmpREVk0r5kVu3+GmZMdRqaZN8iG4yB6UzGURtlj6ejN+rF6yOolxUf+N
 k/p3Lk+q7ULyckIqziFqIJ4v0pihZUwPacSTI2LXjwAoqSK1EQngHats7fi1V1PVOVMHNqeHr+e
 +trroR5QY+A8Oa/hYZbYaDpK1CvEhT1pzcwWvkToNgcrwafRJc5WCAU2lDs9CF4KnQCrpvcLqMy
 SXVP98AjcOz2xZDPMONZFIfxUuwv4TEh+ccR0/QCEUpUVsLzM28z9M5iF1oaU3d6+ktbS7+13FQ
 O+Ls+rwA+ykB7OA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 09677ed639ae9252a57ce09cdbcfd567ad7aabc2..10196d62f287502b0dd472ac68ec6914ca4eb06b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -391,7 +391,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
@@ -427,7 +427,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	const struct uvc_format *format;
@@ -460,7 +460,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (parm->type != stream->type)
@@ -496,7 +496,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 static int uvc_ioctl_s_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	struct v4l2_fract timeperframe;
@@ -641,7 +641,7 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
 static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 			      struct v4l2_fmtdesc *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	enum v4l2_buf_type type = fmt->type;
 	const struct uvc_format *format;
@@ -665,7 +665,7 @@ static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 			     struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 
@@ -675,7 +675,7 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
@@ -717,7 +717,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 
 static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
 	int ret;
@@ -745,7 +745,7 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
@@ -780,7 +780,7 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_ctrl(chain, qec);
@@ -808,7 +808,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
@@ -892,7 +892,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
@@ -900,7 +900,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 				   struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
@@ -908,7 +908,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_querymenu(struct file *file, void *fh,
 			       struct v4l2_querymenu *qm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_menu(chain, qm);
@@ -917,7 +917,7 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
 static int uvc_ioctl_g_selection(struct file *file, void *fh,
 				 struct v4l2_selection *sel)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (sel->type != stream->type)
@@ -951,7 +951,7 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -991,7 +991,7 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 					 struct v4l2_frmivalenum *fival)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -1063,7 +1063,7 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 static long uvc_ioctl_default(struct file *file, void *fh, bool valid_prio,
 			      unsigned int cmd, void *arg)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	switch (cmd) {

-- 
2.49.0


