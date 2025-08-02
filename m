Return-Path: <linux-media+bounces-38744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD4B18BB8
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8DCB623D45
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECD32192E1;
	Sat,  2 Aug 2025 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DSQrpcJp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37E218599;
	Sat,  2 Aug 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126657; cv=none; b=VtwK6vXLjzSLXPRQU/MPPH4fGasAsk4/GIIFKMiePmgJdqIgpw24QZlvAhBx0ElHGHFpONHy9bR6YvAezGIVCihVuLs4drlEPqtGPdWKihvOWeQwxQfeKKsufErM4VgjvG5zL5ipape9M+z+vbA3piUD3uCiAER19vVQPDtxGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126657; c=relaxed/simple;
	bh=mNwsrp8nKBFkxt7rY+U2M0OWq3GCR2R2XCAdJROLTOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJOWqJzfc36X4/ZKUfzkoFRleMvCL3MqyIWQUPBc2wv12zryybBQ8UCVhthy63V2rKn0VR7YHTrh7An1VjVriU3q49ZsCUTas/WcRv8cNsj+wC0FTbJ0sjCBmbFqH7GETclj1zJAmG7aXJPAvNlW3FDik/0GSPkDQvgCuXGX5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DSQrpcJp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E59111FB8;
	Sat,  2 Aug 2025 11:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126607;
	bh=mNwsrp8nKBFkxt7rY+U2M0OWq3GCR2R2XCAdJROLTOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DSQrpcJpBnfnT7OmTg8T90ulQGNmcBlh4d8ucTOdKvpLbk0c454FckPhqvx89LmbN
	 vCwsaczWRTvaZ0k9oVxT+kZQiOzwlCqrykBbr80yOciofSaOG5y9ojqzKLOqAsSAeS
	 tXDWIcl38VAzTMKDnlZqvDHs1RcnBOQ+A2SpHYuE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:27 +0200
Subject: [PATCH 05/65] media: usb: pvrusb2: Store v4l2_fh pointer in
 file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-5-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12175;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=DSu4UoxpEI7+C8U0CFqaBAzFa/k6azaXzHEH5+Tqsoc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj3R4AfuAC2TJCoNxPqDBbjsGQjJnpQyMW4D
 KkVjzOho0OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y9wAKCRByNAaPFqFW
 POxeD/9ExwrndtJFz6iR4YDFf0BLDxKErSKTK/afTEs5q0CH65ApkZAHCJY8P+DafxkZC6dhQs/
 FKeKJECblq8zWsiCLBQSlKWrQ4FtBv/k+AYc/ofRZjh3EbLoeIUTJ0cbNrsQ7AGdhfhTPFFU30e
 C4eCLQuc+225WsAE8KYIyB12r9uUmvgJQHhm8a6qGAOe6YRyuds4Joq02dAQEpapyXc3KF6R3Hn
 jQ5QyVq6rH4whyspYj4kzz+mxZbCVCk48KKkp9wsFiFqbodkGD6mocULwH5doghE7QtLwFF3Lg4
 a6yYMvkRM06NBl02+FeuPdvO05U0129VqG1g2sF+sblwWtuDERQrBYIUecqK5MJMGyrC1qv5Txf
 5F66LgYJNKZmDkSdiqxGovRdWFZ2YdCMZefML7l8oRXOS4jVQlNPDdrPIBTu/KYU2+vg4bWo1kn
 6zj2WN7iplFyzBWKl82TbT0J25cvW1JyDnis+1Wc0o48T2F73ZrZ5ZmCLBk6xYnpzKNXPL+Nr5u
 4p/tbDwClXn2GnXj6tgWCp21CkC50GbQo2ESvwSgbAjN5XUsM4YZOi5iBwpziWhN9uIGotVke2W
 fyF4ouplFpyvQX6L5Ue3MnKLlaNVb0HiTUrQrE4uGASpLjucw9ad2cgbPlq+C7lKEFycnTYxzQc
 mZLE0DJcIa1guEQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
pvrusb2 driver instead stores the pointer to the driver-specific
structure that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer
itself to standardize behaviour across drivers. This also prepares for
future refactoring that depends on v4l2_fh being stored in private_data.

While at it, drop unneeded structure forward declarations.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 65 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index ad38e12405419caad056af8866b14ea621f0c2a1..7dc7c90ebf621c594bf5236276c402462d694a0a 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -21,8 +21,6 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 
-struct pvr2_v4l2_dev;
-struct pvr2_v4l2_fh;
 struct pvr2_v4l2;
 
 struct pvr2_v4l2_dev {
@@ -48,6 +46,11 @@ struct pvr2_v4l2_fh {
 	unsigned int input_cnt;
 };
 
+static inline struct pvr2_v4l2_fh *to_pvr2_v4l2_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct pvr2_v4l2_fh, fh);
+}
+
 struct pvr2_v4l2 {
 	struct pvr2_channel channel;
 
@@ -108,7 +111,7 @@ static struct v4l2_format pvr_format [] = {
  */
 static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	strscpy(cap->driver, "pvrusb2", sizeof(cap->driver));
@@ -123,7 +126,7 @@ static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *
 
 static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int ret;
@@ -136,7 +139,7 @@ static int pvr2_g_std(struct file *file, void *priv, v4l2_std_id *std)
 
 static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -148,7 +151,7 @@ static int pvr2_s_std(struct file *file, void *priv, v4l2_std_id std)
 
 static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int ret;
@@ -161,7 +164,7 @@ static int pvr2_querystd(struct file *file, void *priv, v4l2_std_id *std)
 
 static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *cptr;
 	struct v4l2_input tmp;
@@ -209,7 +212,7 @@ static int pvr2_enum_input(struct file *file, void *priv, struct v4l2_input *vi)
 
 static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned int idx;
 	struct pvr2_ctrl *cptr;
@@ -231,7 +234,7 @@ static int pvr2_g_input(struct file *file, void *priv, unsigned int *i)
 
 static int pvr2_s_input(struct file *file, void *priv, unsigned int inp)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -286,7 +289,7 @@ static int pvr2_s_audio(struct file *file, void *priv, const struct v4l2_audio *
 
 static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	if (vt->index != 0)
@@ -298,7 +301,7 @@ static int pvr2_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 
 static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -314,7 +317,7 @@ static int pvr2_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *
 
 static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned long fv;
 	struct v4l2_tuner vt;
@@ -349,7 +352,7 @@ static int pvr2_s_frequency(struct file *file, void *priv, const struct v4l2_fre
 
 static int pvr2_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val = 0;
 	int cur_input;
@@ -391,7 +394,7 @@ static int pvr2_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtd
 
 static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int val;
 
@@ -411,7 +414,7 @@ static int pvr2_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 
 static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int lmin, lmax, ldef;
 	struct pvr2_ctrl *hcp, *vcp;
@@ -449,7 +452,7 @@ static int pvr2_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_forma
 
 static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *vf)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *hcp, *vcp;
 	int ret = pvr2_try_fmt_vid_cap(file, fh, vf);
@@ -466,7 +469,7 @@ static int pvr2_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format
 
 static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_v4l2_dev *pdi = fh->pdi;
 	int ret;
@@ -485,7 +488,7 @@ static int pvr2_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 
 static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	if (!fh->pdi->stream) {
@@ -500,7 +503,7 @@ static int pvr2_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 static int pvr2_query_ext_ctrl(struct file *file, void *priv,
 			       struct v4l2_query_ext_ctrl *vc)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct pvr2_ctrl *cptr;
 	int val;
@@ -561,7 +564,7 @@ static int pvr2_query_ext_ctrl(struct file *file, void *priv,
 
 static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *vm)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	unsigned int cnt = 0;
 	int ret;
@@ -577,7 +580,7 @@ static int pvr2_querymenu(struct file *file, void *priv, struct v4l2_querymenu *
 static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 					struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	struct pvr2_ctrl *cptr;
@@ -612,7 +615,7 @@ static int pvr2_g_ext_ctrls(struct file *file, void *priv,
 static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 		struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	unsigned int idx;
@@ -637,7 +640,7 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 static int pvr2_try_ext_ctrls(struct file *file, void *priv,
 		struct v4l2_ext_controls *ctls)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_ext_control *ctrl;
 	struct pvr2_ctrl *pctl;
@@ -659,7 +662,7 @@ static int pvr2_try_ext_ctrls(struct file *file, void *priv,
 static int pvr2_g_pixelaspect(struct file *file, void *priv,
 			      int type, struct v4l2_fract *f)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_cropcap cap = { .type = type };
 	int ret;
@@ -675,7 +678,7 @@ static int pvr2_g_pixelaspect(struct file *file, void *priv,
 static int pvr2_g_selection(struct file *file, void *priv,
 			    struct v4l2_selection *sel)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	struct v4l2_cropcap cap;
 	int val = 0;
@@ -726,7 +729,7 @@ static int pvr2_g_selection(struct file *file, void *priv,
 static int pvr2_s_selection(struct file *file, void *priv,
 			    struct v4l2_selection *sel)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 	int ret;
 
@@ -758,7 +761,7 @@ static int pvr2_s_selection(struct file *file, void *priv,
 
 static int pvr2_log_status(struct file *file, void *priv)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	struct pvr2_hdw *hdw = fh->channel.mc_head->hdw;
 
 	pvr2_hdw_trigger_module_log(hdw);
@@ -882,7 +885,7 @@ static void pvr2_v4l2_internal_check(struct pvr2_channel *chp)
 
 static int pvr2_v4l2_release(struct file *file)
 {
-	struct pvr2_v4l2_fh *fhp = file->private_data;
+	struct pvr2_v4l2_fh *fhp = to_pvr2_v4l2_fh(file);
 	struct pvr2_v4l2 *vp = fhp->pdi->v4lp;
 	struct pvr2_hdw *hdw = fhp->channel.mc_head->hdw;
 
@@ -1000,7 +1003,7 @@ static int pvr2_v4l2_open(struct file *file)
 	}
 
 	fhp->file = file;
-	file->private_data = fhp;
+	file->private_data = &fhp->fh;
 
 	fhp->fw_mode_flag = pvr2_hdw_cpufw_get_enabled(hdw);
 	v4l2_fh_add(&fhp->fh);
@@ -1055,7 +1058,7 @@ static int pvr2_v4l2_iosetup(struct pvr2_v4l2_fh *fh)
 static ssize_t pvr2_v4l2_read(struct file *file,
 			      char __user *buff, size_t count, loff_t *ppos)
 {
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	int ret;
 
 	if (fh->fw_mode_flag) {
@@ -1117,7 +1120,7 @@ static ssize_t pvr2_v4l2_read(struct file *file,
 static __poll_t pvr2_v4l2_poll(struct file *file, poll_table *wait)
 {
 	__poll_t mask = 0;
-	struct pvr2_v4l2_fh *fh = file->private_data;
+	struct pvr2_v4l2_fh *fh = to_pvr2_v4l2_fh(file);
 	int ret;
 
 	if (fh->fw_mode_flag) {

-- 
2.49.0


