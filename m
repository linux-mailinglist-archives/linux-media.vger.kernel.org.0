Return-Path: <linux-media+bounces-38748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1369B18BE1
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CAE13ABE16
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4A4242D9C;
	Sat,  2 Aug 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I8rstv18"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE43241139;
	Sat,  2 Aug 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126700; cv=none; b=aWyXUEYrC3Vb2cgtopiLwRcZQqyr/P01kQxOODoGIsFPz6YgFn22oJ6ykeJPKduIzmf+/57/extg2hLLMcX13jRz2ZTbu9sYX/bzxQ1pXykkxyLF/9UIwEA3qvqq3jYqvL7hOCesyNAjP33oY6Dr4uOkr53HWQAthQlsoUF1xQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126700; c=relaxed/simple;
	bh=WfjffTcJOWLdlrWem3MdhRU1zwqLoI09JZOwJPl5TRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hol3flN3pp43XViNAunYvboFkh0pJxTmZasqTdfYP9P3At6I9rK0u+afBcozPxLo+q2MTRIlzMpJ+BNemcXlX7dYmkt14lJ3PRD0UtCs63nakyZZFmcbPuhqogXdvHNKShT93c9tRwZAR+8kpMebkr1fcv0naTXXLVCWhBw/ydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I8rstv18; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E00113064;
	Sat,  2 Aug 2025 11:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126649;
	bh=WfjffTcJOWLdlrWem3MdhRU1zwqLoI09JZOwJPl5TRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8rstv182vkAT+hoN092Wv7YgIQiaVZUDqwiVun2l1uM++SsJ5QZLlq/TMNmB8l7N
	 bH6IBaNCbqY0+btaxUYnxqE/cbaeo3x6Qnv187Q6UJpuAdmHYfJ3e7NambctPnz0SP
	 /QXeLo1hfji8PwcA+xJxWqtW7oDL3YgaJ9CMawMw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:31 +0200
Subject: [PATCH 09/65] media: Replace file->private_data access with
 file_to_v4l2_fh()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-9-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22494;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ur2C2n1/7W+w6783Glcj1/4RDB0dymp7bMnetCHDy7E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj4imTS1pDgK8oU5ve+gl5xQgi3IQ/KaOtt2
 fSo2rqwdIeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+AAKCRByNAaPFqFW
 PHFcD/9X0QwsKS4VK/6vSKze8KcKUeit96e5fzfUYuUC/ubuDAGAnw5eZwrsjfogi8Rmr6Qxvl3
 TyG9nwG0YxPBxKP9WEqMhVcm2YbrBsOYyAdS9ONUHNR0FU31aWWejkLcIJZUAxTDJvo+Wj/TEgO
 YvomhPB38PXWRTyKKDMlCpjDHwS7WhkFHPLFdKE/PI4b3+i1lr1Y8oBNVkx06Su9I4Qwf1KpIId
 xwvwaSw5/kyqdgkOkqsPGxbMTfePi6B2SuQNpsbpzNDEV5H4b6Bx3cGmf98ktT416At9mlZb2gD
 cKpFiGuie2F/zn+8yghiVJyHTcvPKh9UUGSxi+Cd3rqeBPeaK26rJsmc4Ekhn7GQGFNhcim8G3t
 +Ql7Kn6nwfinlYZPDnUOvD2wTxQD3/tmi20kUWAQW7WuEVkwl6cX5o3lcwRkQikeZkEi3KXArO1
 DC7rF9/pGbN+y8dWLijq4bJdw16x+UfXlzm1NqTNji0HUlL829+ZQyP6t+Kp3SdMRL4B/3hal0c
 1otoUL5XwxwRtj8e3V463Dtu/+LWASnF/i0odD+q77SR3bXS9t2bAvx0cRYlkb0I3Qa+ob3jxl7
 84z9dwnKpRmbRyDjRWGt+vMrY9awjydfuPPfMk6OcL7+E5ZDrGu3HFCW5de98IsiURjdTe9c0Np
 LxJk4C8WJ3AWlgQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

Replace all remaining locations that read the v4l2_fh pointer directly
from file->private_data with usage of the file_to_v4l2_fh() function.
The change was generated manually.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-driver.h                     |  2 +-
 drivers/media/pci/cx18/cx18-fileops.c                    |  2 +-
 drivers/media/pci/saa7164/saa7164.h                      |  4 ++--
 drivers/media/platform/amphion/vpu.h                     |  2 +-
 drivers/media/platform/imagination/e5010-jpeg-enc.h      |  2 +-
 drivers/media/platform/nxp/dw100/dw100.c                 |  2 +-
 drivers/media/platform/nxp/imx-pxp.c                     |  2 +-
 drivers/media/platform/qcom/iris/iris_vidc.c             |  2 +-
 drivers/media/platform/qcom/venus/core.h                 |  2 +-
 drivers/media/platform/samsung/s3c-camif/camif-capture.c |  6 +++---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c         |  2 +-
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c |  2 +-
 drivers/media/platform/ti/vpe/vpe.c                      |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c        |  2 +-
 drivers/media/test-drivers/vim2m.c                       |  2 +-
 drivers/media/test-drivers/visl/visl.h                   |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c            |  4 ++--
 drivers/media/test-drivers/vivid/vivid-radio-rx.c        |  4 ++--
 drivers/media/test-drivers/vivid/vivid-radio-tx.c        |  4 ++--
 drivers/media/usb/hdpvr/hdpvr-video.c                    | 12 ++++++------
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                 |  2 +-
 drivers/media/usb/uvc/uvcvideo.h                         |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c            |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                     |  4 ++--
 drivers/staging/most/video/video.c                       |  2 +-
 drivers/usb/gadget/function/uvc.h                        |  5 +++++
 drivers/usb/gadget/function/uvc_v4l2.c                   |  2 +-
 27 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index 485ca9747c4c1c4a78c7bb2cd998927b075d44e9..92acd23a8c4d0d44069accf02c8464bc27a15458 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -414,7 +414,7 @@ static inline struct cx18_open_id *fh2id(struct v4l2_fh *fh)
 
 static inline struct cx18_open_id *file2id(struct file *file)
 {
-	return fh2id(file->private_data);
+	return fh2id(file_to_v4l2_fh(file));
 }
 
 /* forward declaration of struct defined in cx18-cards.h */
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index af25628b11bad9ee983e1921dc89044756986940..89e38b3036309af0747362bafad5024413c2c5bd 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -709,7 +709,7 @@ int cx18_v4l2_close(struct file *filp)
 	}
 
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV &&
-	    filp->private_data == vdev->queue->owner) {
+	    file_to_v4l2_fh(filp) == vdev->queue->owner) {
 		vb2_queue_release(vdev->queue);
 		vdev->queue->owner = NULL;
 	}
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 7b511f7f1cfc305a9ffe60722b9ebe093163787d..94e987e7b5e5d4af8f3cdc7c148eb2b33b1076b9 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -182,7 +182,7 @@ struct saa7164_encoder_fh {
 
 static inline struct saa7164_encoder_fh *to_saa7164_encoder_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct saa7164_encoder_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct saa7164_encoder_fh, fh);
 }
 
 struct saa7164_vbi_fh {
@@ -193,7 +193,7 @@ struct saa7164_vbi_fh {
 
 static inline struct saa7164_vbi_fh *to_saa7164_vbi_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct saa7164_vbi_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct saa7164_vbi_fh, fh);
 }
 
 struct saa7164_histogram_bucket {
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index cac0f1a64feafc41d9f050f58004ae47f2e2ac90..bfd171a3ded40e66d0b601d9eb3e749cb39de58c 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -328,7 +328,7 @@ static inline const char *vpu_core_type_desc(enum vpu_core_type type)
 
 static inline struct vpu_inst *to_inst(struct file *filp)
 {
-	return container_of(filp->private_data, struct vpu_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct vpu_inst, fh);
 }
 
 #define ctrl_to_inst(ctrl)	\
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index eefaf60489d3fba518acd12709f2e4831686620b..da57bc1baa46403c4a91f56e152334fa9dd83369 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -122,7 +122,7 @@ struct e5010_context {
 
 static inline struct e5010_context *to_e5010_context(struct file *filp)
 {
-	return container_of(filp->private_data, struct e5010_context, fh);
+	return container_of(file_to_v4l2_fh(filp), struct e5010_context, fh);
 }
 
 /*
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 3d1db1121bf9cd4da0a8cf22f853bdfb375e74e0..2460f09a6813a320f7637bc332e641b7741ced21 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -266,7 +266,7 @@ static inline int dw100_dump_regs(struct seq_file *m)
 
 static inline struct dw100_ctx *dw100_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct dw100_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct dw100_ctx, fh);
 }
 
 static struct dw100_q_data *dw100_get_q_data(struct dw100_ctx *ctx,
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 7f8ffbac582fcf6a968e5ab000827d7086c18261..879b1803a2b38c6748fa4748f25504665f8106bb 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -248,7 +248,7 @@ struct pxp_ctx {
 
 static inline struct pxp_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct pxp_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct pxp_ctx, fh);
 }
 
 static struct pxp_q_data *get_q_data(struct pxp_ctx *ctx,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index c417e8c31f806e03555cd5e2a662a6efe5d58f3e..0c3b47b9958aa3388d91ffda9b2acfbb53f09f59 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -69,7 +69,7 @@ static void iris_remove_session(struct iris_inst *inst)
 
 static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
 {
-	return container_of(filp->private_data, struct iris_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct iris_inst, fh);
 }
 
 static void iris_m2m_device_run(void *priv)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5b1ba1c69adba14c3560a4bc6d09435529f295a6..3c0c5f9dbe7bd54975e44ae87ee3df442305c0fe 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -535,7 +535,7 @@ struct venus_inst {
 
 static inline struct venus_inst *to_inst(struct file *filp)
 {
-	return container_of(filp->private_data, struct venus_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct venus_inst, fh);
 }
 
 static inline void *to_hfi_priv(struct venus_core *core)
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index 3e566b65f4178a799e9172831dab6b7fa2004887..cae15a4ce5fd83f00ced8b2dfbb5f5a6f7483ca4 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -572,7 +572,7 @@ static int s3c_camif_close(struct file *file)
 
 	mutex_lock(&camif->lock);
 
-	if (vp->owner == file->private_data) {
+	if (vp->owner == file_to_v4l2_fh(file)) {
 		camif_stop_capture(vp);
 		vb2_queue_release(&vp->vb_queue);
 		vp->owner = NULL;
@@ -595,7 +595,7 @@ static __poll_t s3c_camif_poll(struct file *file,
 	__poll_t ret;
 
 	mutex_lock(&camif->lock);
-	if (vp->owner && vp->owner != file->private_data)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		ret = EPOLLERR;
 	else
 		ret = vb2_poll(&vp->vb_queue, file, wait);
@@ -609,7 +609,7 @@ static int s3c_camif_mmap(struct file *file, struct vm_area_struct *vma)
 	struct camif_vp *vp = video_drvdata(file);
 	int ret;
 
-	if (vp->owner && vp->owner != file->private_data)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		ret = -EBUSY;
 	else
 		ret = vb2_mmap(&vp->vb_queue, vma);
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 3e7f2df70408b882f6c9d47b66a8e092f6960927..43755043e8af907fe6755cfe6848ceb655444dfc 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -309,7 +309,7 @@ static void deinterlace_init(struct deinterlace_dev *dev)
 
 static inline struct deinterlace_ctx *deinterlace_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct deinterlace_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct deinterlace_ctx, fh);
 }
 
 static bool deinterlace_check_format(u32 pixelformat)
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index abd10b218aa1dc552004fe7ebcb815b3d6b8a43d..d0608b5d900fc83a6c63979d21ab3b4ce9a67af9 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -170,7 +170,7 @@ static irqreturn_t rotate_irq(int irq, void *data)
 
 static inline struct rotate_ctx *rotate_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct rotate_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct rotate_ctx, fh);
 }
 
 static void rotate_prepare_format(struct v4l2_pix_format *pix_fmt)
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index b76b5d18c963d9a3313d34cfe0e12772738d336f..4b9b2bec7377d724c272ff76fb8116b65227c542 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -424,7 +424,7 @@ struct vpe_ctx {
 
 static inline struct vpe_ctx *to_vpe_ctx(struct file *filp)
 {
-	return container_of(filp->private_data, struct vpe_ctx, fh);
+	return container_of(file_to_v4l2_fh(filp), struct vpe_ctx, fh);
 }
 
 /*
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded3c8b57483b148bf7bbffb8a458c5..e27f6761cba18e78e1833745e77347f7405957e0 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -144,7 +144,7 @@ static const struct v4l2_event vicodec_eos_event = {
 
 static inline struct vicodec_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct vicodec_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct vicodec_ctx, fh);
 }
 
 static struct vicodec_q_data *get_q_data(struct vicodec_ctx *ctx,
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 1d1a9e7685050e53575a3bf09e9ff1df5aea0ee0..55d885be5bcc0541e4ea539a2fafeeb2d76680e3 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -236,7 +236,7 @@ struct vim2m_ctx {
 
 static inline struct vim2m_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct vim2m_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct vim2m_ctx, fh);
 }
 
 static struct vim2m_q_data *get_q_data(struct vim2m_ctx *ctx,
diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/test-drivers/visl/visl.h
index 434e9efbf9b21db4b1b903035d18e2a12f716947..ad3d0ab791d6aec4fb120dcfe86000e498f6713d 100644
--- a/drivers/media/test-drivers/visl/visl.h
+++ b/drivers/media/test-drivers/visl/visl.h
@@ -163,7 +163,7 @@ struct visl_ctrl_desc {
 
 static inline struct visl_ctx *visl_file_to_ctx(struct file *file)
 {
-	return container_of(file->private_data, struct visl_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct visl_ctx, fh);
 }
 
 static inline struct visl_ctx *visl_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 8d56168c72aa09f94ba2f0bdb2415e7247e08c14..9c9a93a3b5402741642253bbd1487f723d58fcf5 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -654,11 +654,11 @@ static int vivid_fop_release(struct file *file)
 		v4l2_info(&dev->v4l2_dev, "reconnect\n");
 		vivid_reconnect(dev);
 	}
-	if (file->private_data == dev->radio_rx_rds_owner) {
+	if (file_to_v4l2_fh(file) == dev->radio_rx_rds_owner) {
 		dev->radio_rx_rds_last_block = 0;
 		dev->radio_rx_rds_owner = NULL;
 	}
-	if (file->private_data == dev->radio_tx_rds_owner) {
+	if (file_to_v4l2_fh(file) == dev->radio_tx_rds_owner) {
 		dev->radio_tx_rds_last_block = 0;
 		dev->radio_tx_rds_owner = NULL;
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index 79c1723bd84cbf18060817a3b03f8d1e83990a38..be711cae2d492f8d259fda2dc0392a84f22565a4 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -42,13 +42,13 @@ ssize_t vivid_radio_rx_read(struct file *file, char __user *buf,
 	if (mutex_lock_interruptible(&dev->mutex))
 		return -ERESTARTSYS;
 	if (dev->radio_rx_rds_owner &&
-	    file->private_data != dev->radio_rx_rds_owner) {
+	    file_to_v4l2_fh(file) != dev->radio_rx_rds_owner) {
 		mutex_unlock(&dev->mutex);
 		return -EBUSY;
 	}
 	if (dev->radio_rx_rds_owner == NULL) {
 		vivid_radio_rds_init(dev);
-		dev->radio_rx_rds_owner = file->private_data;
+		dev->radio_rx_rds_owner = file_to_v4l2_fh(file);
 	}
 
 retry:
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.c b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
index 049d40b948bb25276650d8ac6a83c8adf8221e51..f6e80b8d00a673dea89311e067375a8e460b81aa 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
@@ -39,11 +39,11 @@ ssize_t vivid_radio_tx_write(struct file *file, const char __user *buf,
 	if (mutex_lock_interruptible(&dev->mutex))
 		return -ERESTARTSYS;
 	if (dev->radio_tx_rds_owner &&
-	    file->private_data != dev->radio_tx_rds_owner) {
+	    file_to_v4l2_fh(file) != dev->radio_tx_rds_owner) {
 		mutex_unlock(&dev->mutex);
 		return -EBUSY;
 	}
-	dev->radio_tx_rds_owner = file->private_data;
+	dev->radio_tx_rds_owner = file_to_v4l2_fh(file);
 
 retry:
 	timestamp = ktime_sub(ktime_get(), dev->radio_rds_init_time);
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4c431bd9b50352ed1bd3da3e62625c9cff6c149d..ea17f1a5f5b0a01d7ae159b7f00d65ce952f4974 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -390,7 +390,7 @@ static int hdpvr_release(struct file *file)
 	struct hdpvr_device *dev = video_drvdata(file);
 
 	mutex_lock(&dev->io_mutex);
-	if (file->private_data == dev->owner) {
+	if (file_to_v4l2_fh(file) == dev->owner) {
 		hdpvr_stop_streaming(dev);
 		dev->owner = NULL;
 	}
@@ -426,7 +426,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 			mutex_unlock(&dev->io_mutex);
 			goto err;
 		}
-		dev->owner = file->private_data;
+		dev->owner = file_to_v4l2_fh(file);
 		print_buffer_status();
 	}
 	mutex_unlock(&dev->io_mutex);
@@ -541,7 +541,7 @@ static __poll_t hdpvr_poll(struct file *filp, poll_table *wait)
 				 "start_streaming failed\n");
 			dev->status = STATUS_IDLE;
 		} else {
-			dev->owner = filp->private_data;
+			dev->owner = file_to_v4l2_fh(filp);
 		}
 
 		print_buffer_status();
@@ -1048,7 +1048,7 @@ static int vidioc_encoder_cmd(struct file *filp, void *priv,
 
 	switch (a->cmd) {
 	case V4L2_ENC_CMD_START:
-		if (dev->owner && filp->private_data != dev->owner) {
+		if (dev->owner && file_to_v4l2_fh(filp) != dev->owner) {
 			res = -EBUSY;
 			break;
 		}
@@ -1056,12 +1056,12 @@ static int vidioc_encoder_cmd(struct file *filp, void *priv,
 			break;
 		res = hdpvr_start_streaming(dev);
 		if (!res)
-			dev->owner = filp->private_data;
+			dev->owner = file_to_v4l2_fh(filp);
 		else
 			dev->status = STATUS_IDLE;
 		break;
 	case V4L2_ENC_CMD_STOP:
-		if (dev->owner && filp->private_data != dev->owner) {
+		if (dev->owner && file_to_v4l2_fh(filp) != dev->owner) {
 			res = -EBUSY;
 			break;
 		}
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7dc7c90ebf621c594bf5236276c402462d694a0a..481b03bbecf8134f75b3988e45fc392f07ae90fd 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -48,7 +48,7 @@ struct pvr2_v4l2_fh {
 
 static inline struct pvr2_v4l2_fh *to_pvr2_v4l2_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct pvr2_v4l2_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct pvr2_v4l2_fh, fh);
 }
 
 struct pvr2_v4l2 {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8b56252030480b8a5d2ef6de24902b544357ff02..70dc80e2b213dff333665022b3410b175d072793 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -639,7 +639,7 @@ struct uvc_fh {
 
 static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct uvc_fh, vfh);
+	return container_of(file_to_v4l2_fh(filp), struct uvc_fh, vfh);
 }
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8c07400bd280dea5d2e66e2759658c423bcd3866..8a5559225ff27cde3b1b7322abd16bac8c1617b9 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -678,7 +678,7 @@ static inline bool ctrl_is_pointer(struct file *file, u32 id)
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
-		fh = file->private_data;
+		fh = file_to_v4l2_fh(file);
 
 	if (fh && fh->ctrl_handler)
 		hdl = fh->ctrl_handler;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 46da373066f4ec786b87ef18b8372abee621332f..8c81852c30466865eca36fd41923f6d05dbf9293 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1197,7 +1197,7 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
 	vfd = video_devdata(file);
 	if (!test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
 		return -ENOTTY;
-	vfh = file->private_data;
+	vfh = file_to_v4l2_fh(file);
 	return v4l2_prio_change(vfd->prio, &vfh->prio, *p);
 }
 
@@ -3084,7 +3084,7 @@ static long __video_do_ioctl(struct file *file,
 	}
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
-		vfh = file->private_data;
+		vfh = file_to_v4l2_fh(file);
 
 	/*
 	 * We need to serialize streamon/off with queueing new requests.
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index bce7ffeac8fe50d3442f4993ae49ab5fc96ec3cd..116331cead2a6676f2c018b3f8fc10b0716dfc3a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -54,7 +54,7 @@ struct comp_fh {
 
 static inline struct comp_fh *to_comp_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct comp_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct comp_fh, fh);
 }
 
 static LIST_HEAD(video_devices);
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6f44dd732315074e215f75e5df99c289f9cebe35..9e79cbe50715791a7f7ddd3bc20e9a28d221db61 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -196,6 +196,11 @@ struct uvc_file_handle {
 #define to_uvc_file_handle(handle) \
 	container_of(handle, struct uvc_file_handle, vfh)
 
+static inline struct uvc_file_handle *file_to_uvc_file_handle(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct uvc_file_handle, vfh);
+}
+
 /* ------------------------------------------------------------------------
  * Functions
  */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index fc9a8d31a1e983945838a6ac84f5b9090ac13697..886300a29b908a6dda3e2dfcb6b3414f782b172b 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -685,7 +685,7 @@ uvc_v4l2_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
-	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
+	struct uvc_file_handle *handle = file_to_uvc_file_handle(file);
 	struct uvc_video *video = handle->device;
 
 	mutex_lock(&video->mutex);

-- 
2.49.0


