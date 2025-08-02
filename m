Return-Path: <linux-media+bounces-38796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7CB18D75
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31AB3B6EC6
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8126283C90;
	Sat,  2 Aug 2025 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HbDZkGyP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6666283159;
	Sat,  2 Aug 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127201; cv=none; b=qNA4bfTbcC2EqPL2mxuG0Ctr8++ASs9VMaNiW24NYnHnBsTmgo3D8UxoJjC9LkmTkoVI4srhdxGJKx6up2sMTNpH80K2I2qhefHN1tTHemgjMGmKDhWHYUN+AaRzu3UCXB34rah6FinJTdHXbWQ6LKKty+ffrGLrBtL7ACVFtnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127201; c=relaxed/simple;
	bh=Y80t6mB4iwBQesQdO4LMCe3YSMTXsJXe2CdPx2tZgnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFg/OFH1RzeL7Cc6n/9SSCgO7Q953Lp6qc9L8KoAFVcgLWPQ7PVC/qhasMH8uKeEb3IdhRIbSno/vNeO0tdxze87I5uAuQdu3V8RuJD3YjmgTeh/nvbvZtjF8fVHUyf7Agpo+creSBMsiqiBoFjwBG///buKwg2mVfAeb7sH5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HbDZkGyP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D376EA0;
	Sat,  2 Aug 2025 11:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127152;
	bh=Y80t6mB4iwBQesQdO4LMCe3YSMTXsJXe2CdPx2tZgnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HbDZkGyPReuTqOUXC4XHvtVbecmjFjkvn9QhJ0swKjQNlvhX4OF1EMulXh30ASkzt
	 N9fqCk2OHTyciiwGn7MpBubDw2OX/r2v3IlRdXILvymYskKIxuLeBDm9MbMPNzNusL
	 nwkNIoughd8Iq0CCaXEm6KLMQF2/2xUQeORvtiSM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:19 +0200
Subject: [PATCH 57/65] media: ivtv: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-57-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22060;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Y80t6mB4iwBQesQdO4LMCe3YSMTXsJXe2CdPx2tZgnM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+/vd8qdz5//sT07XduRB8DRKCpHK7o4Fbl
 m7SrCBEp6OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PIvnD/93dcaaiVIv4xP4TjJUecfS+KksaInR7XVJ9lOTjDhNOGP/MA1HqTEI46kfkiDDOTqOwA6
 Y4v43HX2/p9BqmBQ++L/6yhnRUHGpzMLbcYPl/plBKjEGX5Rq5f+WiBf185PrseXD4ZdxWkS7OO
 5fkexLYYfixbUAYAKeSUF8K34JBxU6+xbaozfQqrtF5pPau0v5uJMCorHOY4PNbFiQQSZZKTISS
 3J7f8BAim1cqQOxtXMIZDe72HYeI38zijMOr9GwPVdVVPB4Ha11Ab4Zk0hDiillEvLGcVM6aNDv
 jg2hyzmuzxqiEUrr1hDr2hFtLcD5hhoyAnbbplUggWrpk8axwRa5rFSAzriHn2mu0UORF0tNHUG
 St9yirJPpMVekNHIOsqJTfuzafUlZfwzY4tz72wlE2T6w+EKS1MMAsYte+k+7pzmYDKuNTb6HHV
 rzLa6zgKrW+uNul5J8y+Qg64ur0bR1bjQc27JZrSuk8kzI+/2W6/6nS7vB1SvPbL5WM5/bCRVrx
 aahTr+Rg0JDCSldHLSKOSQ4mbFvJFneyUnsRlEd4WrEGNBzBzLYZ/CuqP3A2UNMoUaAVS4Me1Xd
 NoPs417fSlc9Xu7lCqp7iFx01KI1tQ07uiHbunVdTpf+E7YTsYFTLVyIbBT8ueL0tdRtheyt7oM
 C3CCP/dgA/Ghuxw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it remove the only left user of fh2id() and remove
the macro completely.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/ivtv/ivtv-driver.h  |   5 --
 drivers/media/pci/ivtv/ivtv-fileops.c |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c   | 124 +++++++++++++++++-----------------
 3 files changed, 63 insertions(+), 68 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index 38c4ceb04cf834906ed877b57c20fcbdb390da13..69c37f450c21f91abb4e4f73823097bd61d5abc2 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -384,11 +384,6 @@ struct ivtv_open_id {
 	struct ivtv *itv;
 };
 
-static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct ivtv_open_id, fh);
-}
-
 static inline struct ivtv_open_id *file2id(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct ivtv_open_id, fh);
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index 0040a5e7f654149eb429400dd1db7197a9a3b54e..814fe7989cdc11ed225f03a9168be50c6b9ba595 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -878,7 +878,7 @@ static void ivtv_stop_decoding(struct ivtv_open_id *id, int flags, u64 pts)
 int ivtv_v4l2_close(struct file *filp)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index d888435b71fb6f6873d9d884248a67364576bf33..8077a71d4850ec773caa20c3fca08f92f3117d69 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -308,7 +308,7 @@ static int ivtv_video_command(struct ivtv *itv, struct ivtv_open_id *id,
 
 static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
 
 	vbifmt->reserved[0] = 0;
@@ -330,7 +330,7 @@ static int ivtv_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 
@@ -353,7 +353,7 @@ static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_vbi_format *vbifmt = &fmt->fmt.vbi;
 
 	vbifmt->sampling_rate = 27000000;
@@ -372,7 +372,7 @@ static int ivtv_g_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	vbifmt->reserved[0] = 0;
@@ -394,7 +394,7 @@ static int ivtv_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
 
@@ -434,8 +434,8 @@ static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_g_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	struct v4l2_window *winfmt = &fmt->fmt.win;
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
@@ -461,7 +461,7 @@ static int ivtv_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_
 
 static int ivtv_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	int w = fmt->fmt.pix.width;
 	int h = fmt->fmt.pix.height;
@@ -490,7 +490,7 @@ static int ivtv_try_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format
 static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (id->type == IVTV_DEC_STREAM_TYPE_VBI)
@@ -510,7 +510,7 @@ static int ivtv_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_
 
 static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	s32 w = fmt->fmt.pix.width;
 	s32 h = fmt->fmt.pix.height;
 	int field = fmt->fmt.pix.field;
@@ -544,8 +544,8 @@ static int ivtv_try_fmt_vid_out(struct file *file, void *fh, struct v4l2_format
 
 static int ivtv_try_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	u32 chromakey = fmt->fmt.win.chromakey;
 	u8 global_alpha = fmt->fmt.win.global_alpha;
 
@@ -566,7 +566,7 @@ static int ivtv_s_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -597,7 +597,7 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!ivtv_raw_vbi(itv) && atomic_read(&itv->capturing) > 0)
 		return -EBUSY;
@@ -610,7 +610,7 @@ static int ivtv_s_fmt_vbi_cap(struct file *file, void *fh, struct v4l2_format *f
 static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
 {
 	struct v4l2_sliced_vbi_format *vbifmt = &fmt->fmt.sliced;
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	int ret = ivtv_try_fmt_sliced_vbi_cap(file, fh, fmt);
 
@@ -628,7 +628,7 @@ static int ivtv_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_fo
 
 static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	int ret = ivtv_try_fmt_vid_out(file, fh, fmt);
@@ -673,7 +673,7 @@ static int ivtv_s_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 
 static int ivtv_s_fmt_vid_out_overlay(struct file *file, void *fh, struct v4l2_format *fmt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	int ret = ivtv_try_fmt_vid_out_overlay(file, fh, fmt);
 
 	if (ret == 0) {
@@ -710,7 +710,7 @@ static int ivtv_itvc(struct ivtv *itv, bool get, u64 reg, u64 *val)
 
 static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register *reg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	reg->size = 4;
 	return ivtv_itvc(itv, true, reg->reg, &reg->val);
@@ -718,7 +718,7 @@ static int ivtv_g_register(struct file *file, void *fh, struct v4l2_dbg_register
 
 static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_register *reg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	u64 val = reg->val;
 
 	return ivtv_itvc(itv, false, reg->reg, &val);
@@ -727,7 +727,7 @@ static int ivtv_s_register(struct file *file, void *fh, const struct v4l2_dbg_re
 
 static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vcap)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	strscpy(vcap->driver, IVTV_DRIVER_NAME, sizeof(vcap->driver));
@@ -738,14 +738,14 @@ static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vc
 
 static int ivtv_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_audio_input(itv, vin->index, vin);
 }
 
 static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	vin->index = itv->audio_input;
 	return ivtv_get_audio_input(itv, vin->index, vin);
@@ -753,7 +753,7 @@ static int ivtv_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 
 static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (vout->index >= itv->nof_audio_inputs)
 		return -EINVAL;
@@ -766,7 +766,7 @@ static int ivtv_s_audio(struct file *file, void *fh, const struct v4l2_audio *vo
 
 static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	/* set it to defaults from our table */
 	return ivtv_get_audio_output(itv, vin->index, vin);
@@ -774,7 +774,7 @@ static int ivtv_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vi
 
 static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	vin->index = 0;
 	return ivtv_get_audio_output(itv, vin->index, vin);
@@ -782,7 +782,7 @@ static int ivtv_g_audout(struct file *file, void *fh, struct v4l2_audioout *vin)
 
 static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (itv->card->video_outputs == NULL || vout->index != 0)
 		return -EINVAL;
@@ -791,7 +791,7 @@ static int ivtv_s_audout(struct file *file, void *fh, const struct v4l2_audioout
 
 static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	/* set it to defaults from our table */
 	return ivtv_get_input(itv, vin->index, vin);
@@ -799,7 +799,7 @@ static int ivtv_enum_input(struct file *file, void *fh, struct v4l2_input *vin)
 
 static int ivtv_enum_output(struct file *file, void *fh, struct v4l2_output *vout)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	return ivtv_get_output(itv, vout->index, vout);
 }
@@ -807,7 +807,7 @@ static int ivtv_enum_output(struct file *file, void *fh, struct v4l2_output *vou
 static int ivtv_g_pixelaspect(struct file *file, void *fh,
 			      int type, struct v4l2_fract *f)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -825,7 +825,7 @@ static int ivtv_g_pixelaspect(struct file *file, void *fh,
 static int ivtv_s_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	struct v4l2_rect r = { 0, 0, 720, 0 };
@@ -868,7 +868,7 @@ static int ivtv_s_selection(struct file *file, void *fh,
 static int ivtv_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *sel)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	struct v4l2_rect r = { 0, 0, 720, 0 };
@@ -924,8 +924,8 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 		.description = "MPEG",
 		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (fmt->index)
 		return -EINVAL;
@@ -951,8 +951,8 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 		.description = "MPEG",
 		.pixelformat = V4L2_PIX_FMT_MPEG,
 	};
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (fmt->index)
 		return -EINVAL;
@@ -967,7 +967,7 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 
 static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	*i = itv->active_input;
 
@@ -976,7 +976,7 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 
 int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	v4l2_std_id std;
 	int i;
 
@@ -1019,7 +1019,7 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 
 static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!(itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT))
 		return -EINVAL;
@@ -1031,7 +1031,7 @@ static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 
 static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (outp >= itv->card->nof_outputs)
 		return -EINVAL;
@@ -1053,8 +1053,8 @@ static int ivtv_s_output(struct file *file, void *fh, unsigned int outp)
 
 static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1067,8 +1067,8 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 
 int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1084,7 +1084,7 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 
 static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	*std = itv->std;
 	return 0;
@@ -1157,7 +1157,7 @@ void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std)
 
 static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if ((std & V4L2_STD_ALL) == 0)
 		return -EINVAL;
@@ -1185,7 +1185,7 @@ static int ivtv_s_std(struct file *file, void *fh, v4l2_std_id std)
 
 static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	if (vt->index != 0)
@@ -1198,7 +1198,7 @@ static int ivtv_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 
 static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (vt->index != 0)
 		return -EINVAL;
@@ -1214,7 +1214,7 @@ static int ivtv_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 
 static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_cap *cap)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	int set = itv->is_50hz ? V4L2_SLICED_VBI_625 : V4L2_SLICED_VBI_525;
 	int f, l;
 
@@ -1249,7 +1249,7 @@ static int ivtv_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced
 
 static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *idx)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	struct v4l2_enc_idx_entry *e = idx->entry;
 	int entries;
 	int i;
@@ -1275,7 +1275,7 @@ static int ivtv_g_enc_index(struct file *file, void *fh, struct v4l2_enc_idx *id
 
 static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 
@@ -1327,7 +1327,7 @@ static int ivtv_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd
 
 static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *enc)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	switch (enc->cmd) {
 	case V4L2_ENC_CMD_START:
@@ -1357,8 +1357,8 @@ static int ivtv_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder
 
 static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	u32 data[CX2341X_MBOX_MAX_DATA];
 	struct yuv_playback_info *yi = &itv->yuv_info;
 
@@ -1444,9 +1444,9 @@ static int ivtv_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *fb)
 
 static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *fb)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 	struct yuv_playback_info *yi = &itv->yuv_info;
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
@@ -1465,9 +1465,9 @@ static int ivtv_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffe
 
 static int ivtv_overlay(struct file *file, void *fh, unsigned int on)
 {
-	struct ivtv_open_id *id = fh2id(fh);
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
-	struct ivtv_stream *s = &itv->streams[fh2id(fh)->type];
+	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
 
 	if (!(s->vdev.device_caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY))
 		return -ENOTTY;
@@ -1492,7 +1492,7 @@ static int ivtv_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
 
 static int ivtv_log_status(struct file *file, void *fh)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 	u32 data[CX2341X_MBOX_MAX_DATA];
 
 	int has_output = itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT;
@@ -1584,7 +1584,7 @@ static int ivtv_log_status(struct file *file, void *fh)
 
 static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_DECODER_CMD %d\n", dec->cmd);
@@ -1593,7 +1593,7 @@ static int ivtv_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 
 static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dec)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(file));
+	struct ivtv_open_id *id = file2id(file);
 	struct ivtv *itv = id->itv;
 
 	IVTV_DEBUG_IOCTL("VIDIOC_TRY_DECODER_CMD %d\n", dec->cmd);
@@ -1602,7 +1602,7 @@ static int ivtv_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder
 
 static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 {
-	struct ivtv_open_id *id = fh2id(file_to_v4l2_fh(filp));
+	struct ivtv_open_id *id = file2id(filp);
 	struct ivtv *itv = id->itv;
 	struct ivtv_stream *s = &itv->streams[id->type];
 
@@ -1645,7 +1645,7 @@ static int ivtv_decoder_ioctls(struct file *filp, unsigned int cmd, void *arg)
 static long ivtv_default(struct file *file, void *fh, bool valid_prio,
 			 unsigned int cmd, void *arg)
 {
-	struct ivtv *itv = fh2id(fh)->itv;
+	struct ivtv *itv = file2id(file)->itv;
 
 	if (!valid_prio) {
 		switch (cmd) {

-- 
2.49.0


