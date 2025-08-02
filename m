Return-Path: <linux-media+bounces-38766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB03B18C72
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290363B0EE9
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067F62701AE;
	Sat,  2 Aug 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ONm0yiqE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD09221555;
	Sat,  2 Aug 2025 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126886; cv=none; b=uxriZxLknTBasO42KlQh4rsd/xyxkecHt1Yn2uzOjYmcZXOkjoGy80j1zMLB0QWUGpb3E9buH3W2QbNpgU0YY3QIZ98LxGvDuRuTqxvzQlq9y3Ha51jq4ekdyJZTNqyGhGrbk9Sckv3iITHXMLBLKojhYyBjsqjK81rFHPpn7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126886; c=relaxed/simple;
	bh=UrDaiJtOb2B1pPWmD1UPpVK7+2xNQe8j53wpyciSH7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NibkZh/FkHJHlNoLEl8qJVTppWqcd5b1OUo/ivE4ib9JK90846RhtaPLt/dsFvbs+9bjM01p4f+HJ0BbM34k6XAtNErOWYp+16OmWvF0SBgs5yLDziJjm7MqbFVneiNwpbEa4n/Cr1PkL6j8wzi+NAKqZQWA6TROw4KboOmhE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ONm0yiqE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4909C3C41;
	Sat,  2 Aug 2025 11:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126836;
	bh=UrDaiJtOb2B1pPWmD1UPpVK7+2xNQe8j53wpyciSH7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ONm0yiqElSs3SBccrZIN4UIeyfiUjHalMHuiAVGr6Ca7VglBPElnuUQUKFP+FkC0+
	 X+aZTqmVbEVg4i8+FrSbw0hK8CBZb2B+8Dh9II+8IZ9xtDiNaSaBJy9ppoviEpnLOj
	 0Jw8Vy2hIpiqig8W8F+0B69EOMdnQyDDAST39FeM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:49 +0200
Subject: [PATCH 27/65] media: Reset file->private_data to NULL in
 v4l2_fh_del()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=47312;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=uW01dA19EIG3zy3WR2ZDkpVBMP48NXn8Hl/F2uQgSyk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj6uG1NSaJwha7+UeGPCjsgvmiL4vhFWvuTy
 3pm/iUpvjWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+gAKCRByNAaPFqFW
 PIyVEADGidlVwcbBoYApUrwhMUvWqtJZUc465SevVKV3VuhFxOqlmnLhdyjZ9eGgU+vzJa5E1oP
 Nb5fVLk8jEt4WuCKYWC3fZnySClZU4buKGpCPiLxGaEhhhZcGWURKc4o7jj+e9m1YhG/8Xy5e/B
 Wl0n8fok1FP+4BrRBG7ZK1emVPwsOJv/LwXxZPwrS6ouzJtywCNFi5bhM7F2cwsHQMYgkGX6jy3
 ws3CPt3sLnwM5E4nxMEZvvQB1MLS3ZSh5Yr1Iy+LNivSB3OJeMvCnlSc+YRSuJlUIzm5qg2XJb4
 kDFUBRY3Cyz8VAe8R+KqJM1m0BdOhCqbicNvFdiag1hox2Wft7vCOLEJHm7z9mWiP5Z+ga6oSWQ
 860UfbDKGHPe27YOjo87cxVKVVAF9s9Nbylx+wvnCPh1GL3hIi1IkqyIJIJ68c2D2XMzE7qZFoz
 b3u46104BpoOthyIDtSYI2nuVNEUt0fAZsSfeVclp8oqzosxE+gKnG4q9TQ2uSa9S3veXlJCIRS
 MLros68Tjn2DaoIcROMCorTCUtTgDF7xfJXDvRWQZTqv1c2vpVQH9QNt+M5/GA5E3BJoWVIKsNw
 Smwax50fxz9BP9G2U0NjHX/hAyTWLAENWvqZTNt2UkB9CfEQjKzbQvICwjPPMq/iKMMUDxv2X4l
 BlCqdBHnvCwyN9Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Multiple drivers that use v4l2_fh and call v4l2_fh_del() manually reset
the file->private_data pointer to NULL in their video device .release()
file operation handler. Move the code to the v4l2_fh_del() function to
avoid direct access to file->private_data in drivers. This requires
adding a file pointer argument to the function.

Changes to drivers have been generated with the following coccinelle
semantic patch:

@@
expression fh;
identifier filp;
identifier release;
type ret;
@@
ret release(..., struct file *filp, ...)
{
	<...
-	filp->private_data = NULL;
	...
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, filp);
	...>
}

@@
expression fh;
identifier filp;
identifier release;
type ret;
@@
ret release(..., struct file *filp, ...)
{
	<...
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, filp);
	...
-	filp->private_data = NULL;
	...>
}

@@
expression fh;
identifier filp;
identifier release;
type ret;
@@
ret release(..., struct file *filp, ...)
{
	<...
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, filp);
	...>
}

Manual changes have been applied to Documentation/ to update the usage
patterns, to drivers/media/v4l2-core/v4l2-fh.c to update the
v4l2_fh_del() prototype and reset file->private_data, and to
include/media/v4l2-fh.h to update the v4l2_fh_del() function prototype
and its documentation.

Additionally, white space issues have been fixed manually in
drivers/usb/gadget/function/uvc_v4l2.c

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-fh.rst                         | 4 ++--
 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt    | 4 ++--
 drivers/media/pci/cx18/cx18-fileops.c                              | 4 ++--
 drivers/media/pci/ivtv/ivtv-fileops.c                              | 4 ++--
 drivers/media/pci/saa7164/saa7164-encoder.c                        | 2 +-
 drivers/media/pci/saa7164/saa7164-vbi.c                            | 2 +-
 drivers/media/platform/allegro-dvt/allegro-core.c                  | 2 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c                   | 2 +-
 drivers/media/platform/amphion/vpu_v4l2.c                          | 4 ++--
 drivers/media/platform/chips-media/coda/coda-common.c              | 4 ++--
 drivers/media/platform/chips-media/wave5/wave5-helper.c            | 2 +-
 drivers/media/platform/imagination/e5010-jpeg-enc.c                | 4 ++--
 drivers/media/platform/m2m-deinterlace.c                           | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c               | 4 ++--
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c                  | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c                | 4 ++--
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 4 ++--
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c    | 4 ++--
 drivers/media/platform/nvidia/tegra-vde/v4l2.c                     | 2 +-
 drivers/media/platform/nxp/dw100/dw100.c                           | 2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                     | 4 ++--
 drivers/media/platform/nxp/imx-pxp.c                               | 2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c                 | 2 +-
 drivers/media/platform/nxp/mx2_emmaprp.c                           | 2 +-
 drivers/media/platform/qcom/iris/iris_vidc.c                       | 3 +--
 drivers/media/platform/qcom/venus/core.c                           | 2 +-
 drivers/media/platform/renesas/rcar_fdp1.c                         | 2 +-
 drivers/media/platform/renesas/rcar_jpu.c                          | 4 ++--
 drivers/media/platform/renesas/vsp1/vsp1_video.c                   | 2 +-
 drivers/media/platform/rockchip/rga/rga.c                          | 2 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c                    | 2 +-
 drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c                | 4 ++--
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c               | 4 ++--
 drivers/media/platform/samsung/s5p-g2d/g2d.c                       | 2 +-
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c                | 4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c                   | 4 ++--
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                   | 4 ++--
 drivers/media/platform/st/sti/delta/delta-v4l2.c                   | 4 ++--
 drivers/media/platform/st/sti/hva/hva-v4l2.c                       | 4 ++--
 drivers/media/platform/st/stm32/dma2d/dma2d.c                      | 2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                   | 2 +-
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c           | 2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c                      | 5 ++---
 drivers/media/platform/ti/vpe/vpe.c                                | 2 +-
 drivers/media/platform/verisilicon/hantro_drv.c                    | 4 ++--
 drivers/media/test-drivers/vicodec/vicodec-core.c                  | 2 +-
 drivers/media/test-drivers/vim2m.c                                 | 2 +-
 drivers/media/test-drivers/visl/visl-core.c                        | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c                           | 3 +--
 drivers/media/v4l2-core/v4l2-fh.c                                  | 7 ++++---
 drivers/media/v4l2-core/v4l2-subdev.c                              | 5 ++---
 drivers/staging/media/imx/imx-media-csc-scaler.c                   | 4 ++--
 drivers/staging/media/meson/vdec/vdec.c                            | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                        | 2 +-
 drivers/staging/most/video/video.c                                 | 4 ++--
 drivers/usb/gadget/function/uvc_v4l2.c                             | 3 +--
 include/media/v4l2-fh.h                                            | 5 ++++-
 57 files changed, 89 insertions(+), 90 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index a7393067f5db2183aa677e15ece512296455e23b..afcad22ead7c919a07475720058ec1ab3a5d5494 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -65,7 +65,7 @@ Example:
 		struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
 
 		...
-		v4l2_fh_del(&my_fh->fh);
+		v4l2_fh_del(&my_fh->fh, file);
 		v4l2_fh_exit(&my_fh->fh);
 		kfree(my_fh);
 		return 0;
@@ -86,7 +86,7 @@ Below is a short description of the :c:type:`v4l2_fh` functions used:
   Must be called once the file handle is completely initialized.
 
 :c:func:`v4l2_fh_del <v4l2_fh_del>`
-(:c:type:`fh <v4l2_fh>`)
+(:c:type:`fh <v4l2_fh>`, struct file \*filp)
 
 - Unassociate the file handle from :c:type:`video_device`. The file handle
   exit function may now be called.
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index 2d38ae17d9404d9d40c63bc8329f3cc6999b7a11..1653c6e2cb4659c71bdb5001a0a3ba0b1c3c9411 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -822,7 +822,7 @@ int my_release(struct file *file)
 	struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
 
 	...
-	v4l2_fh_del(&my_fh->fh);
+	v4l2_fh_del(&my_fh->fh, file);
 	v4l2_fh_exit(&my_fh->fh);
 	kfree(my_fh);
 	return 0;
@@ -840,7 +840,7 @@ void v4l2_fh_add(struct v4l2_fh *fh, struct file *filp)
   添加一个 v4l2_fh 到 video_device 文件句柄列表。一旦文件句柄
   初始化完成就必须调用。
 
-void v4l2_fh_del(struct v4l2_fh *fh)
+void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp)
 
   从 video_device() 中解除文件句柄的关联。文件句柄的退出函数也
   将被调用。
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index f90b547f5d676308ed5c7956a8da02e208b9446e..d49fa4c4119b6e14843a01a73c9662839ecc6c05 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -713,7 +713,7 @@ int cx18_v4l2_close(struct file *filp)
 		vb2_queue_release(vdev->queue);
 		vdev->queue->owner = NULL;
 	}
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, filp);
 	v4l2_fh_exit(fh);
 
 	/* 'Unclaim' this stream */
@@ -751,7 +751,7 @@ static int cx18_serialized_open(struct cx18_stream *s, struct file *filp)
 			if (atomic_read(&cx->ana_capturing) > 0) {
 				/* switching to radio while capture is
 				   in progress is not polite */
-				v4l2_fh_del(&item->fh);
+				v4l2_fh_del(&item->fh, filp);
 				v4l2_fh_exit(&item->fh);
 				kfree(item);
 				return -EBUSY;
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index aa5f5f16427c48123cd314932a7d8bc48f07c031..0040a5e7f654149eb429400dd1db7197a9a3b54e 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -911,7 +911,7 @@ int ivtv_v4l2_close(struct file *filp)
 		ivtv_unmute(itv);
 	}
 
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, filp);
 	v4l2_fh_exit(fh);
 
 	/* Easy case first: this stream was never claimed by us */
@@ -1006,7 +1006,7 @@ static int ivtv_open(struct file *filp)
 			if (atomic_read(&itv->capturing) > 0) {
 				/* switching to radio while capture is
 				   in progress is not polite */
-				v4l2_fh_del(&item->fh);
+				v4l2_fh_del(&item->fh, filp);
 				v4l2_fh_exit(&item->fh);
 				kfree(item);
 				return -EBUSY;
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index e6e353a251cf548525c44e87695f7d45bde302a6..66d650b5f69af1eac9117b9c65ac7c39883f6f21 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -746,7 +746,7 @@ static int fops_release(struct file *file)
 		}
 	}
 
-	v4l2_fh_del(&fh->fh);
+	v4l2_fh_del(&fh->fh, file);
 	v4l2_fh_exit(&fh->fh);
 	kfree(fh);
 
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index 181442fcb43b08cd96f29c2357bcfadd3ddcedb4..57e4362c0d19d0d3a5f0be1ee58cd141fdf62462 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -449,7 +449,7 @@ static int fops_release(struct file *file)
 		}
 	}
 
-	v4l2_fh_del(&fh->fh);
+	v4l2_fh_del(&fh->fh, file);
 	v4l2_fh_exit(&fh->fh);
 	kfree(fh);
 
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 8c30f3cd4fc545133f697973b0f002ea888a3a4a..5e3b1f5d7206d84b8ccb9ea3b3f3f1fe75becf99 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3241,7 +3241,7 @@ static int allegro_release(struct file *file)
 
 	v4l2_ctrl_handler_free(&channel->ctrl_handler);
 
-	v4l2_fh_del(&channel->fh);
+	v4l2_fh_del(&channel->fh, file);
 	v4l2_fh_exit(&channel->fh);
 
 	kfree(channel);
diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index d36891b546bca417e8b98c5e0458ebb15e24c213..b1b0b6535fb1931c74ae9b2da28bea579cd1bc4c 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -883,7 +883,7 @@ static int ge2d_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index e13bfe09af1bf0926bf6005b83a8aae7e34a2122..fcb2eff813ac456386ef163c53db8ac34a278dd7 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -791,7 +791,7 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 
 	return 0;
 error:
-	v4l2_fh_del(&inst->fh);
+	v4l2_fh_del(&inst->fh, file);
 	v4l2_fh_exit(&inst->fh);
 	vpu_inst_put(inst);
 	return ret;
@@ -812,7 +812,7 @@ int vpu_v4l2_close(struct file *file)
 	call_void_vop(inst, release);
 	vpu_inst_unlock(inst);
 
-	v4l2_fh_del(&inst->fh);
+	v4l2_fh_del(&inst->fh, file);
 	v4l2_fh_exit(&inst->fh);
 
 	vpu_inst_unregister(inst);
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 9d8a1c9bea6e9f4d9fc2c2ae165d587e3b3b9650..a27d5a261a27fb78d4c7ca008146780698386333 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2725,7 +2725,7 @@ static int coda_open(struct file *file)
 err_clk_enable:
 	pm_runtime_put_sync(dev->dev);
 err_pm_get:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:
 	ida_free(&dev->ida, ctx->idx);
@@ -2763,7 +2763,7 @@ static int coda_release(struct file *file)
 	clk_disable_unprepare(dev->clk_ahb);
 	clk_disable_unprepare(dev->clk_per);
 	pm_runtime_put_sync(dev->dev);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	ida_free(&dev->ida, ctx->idx);
 	if (ctx->ops->release)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index ed8ff04a899da0a3c9e0f037dac2c9548c98920f..0bce62f0c03902ae367182ee04774c79accc4712 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -46,7 +46,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
 	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
 	if (inst->v4l2_fh.vdev) {
-		v4l2_fh_del(&inst->v4l2_fh);
+		v4l2_fh_del(&inst->v4l2_fh, filp);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
 	list_del_init(&inst->list);
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 1da00ff4b1e36a6486ce54e02139f6489d6acf22..c4e0097cb8b7fa310c2c5519d7af4e6e3b378915 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -769,7 +769,7 @@ static int e5010_open(struct file *file)
 err_ctrls_setup:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 exit:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&e5010->mutex);
 free:
@@ -786,7 +786,7 @@ static int e5010_release(struct file *file)
 	mutex_lock(&e5010->mutex);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&e5010->mutex);
diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index a343dffd19f03c68557415afae2a8db4b3614d2e..51c2f206cb1f601ec2f3d07fffbf63c86f4cdc01 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -880,7 +880,7 @@ static int deinterlace_release(struct file *file)
 
 	dprintk(pcdev, "Releasing instance %p\n", ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	kfree(ctx->xt);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 4bf52e9d960431194c05870743cc628e4e4293e2..8e1883d034f5c67d418f5607c593c60f5d6ddbee 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1201,7 +1201,7 @@ static int mtk_jpeg_open(struct file *file)
 	return 0;
 
 error:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&jpeg->lock);
 free:
@@ -1217,7 +1217,7 @@ static int mtk_jpeg_release(struct file *file)
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&jpeg->lock);
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 25efd76f290e4f29a60d326e92a5bcb05c2bbd1e..3d836b5efa3807e4dc882956040014e244eeb660 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -1130,7 +1130,7 @@ static int mtk_mdp_m2m_open(struct file *file)
 error_m2m_ctx:
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 error_ctrls:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&mdp->lock);
 err_lock:
@@ -1148,7 +1148,7 @@ static int mtk_mdp_m2m_release(struct file *file)
 	mutex_lock(&mdp->lock);
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mtk_mdp_vpu_deinit(&ctx->vpu);
 	mdp->ctx_num--;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 18e542ad32e4fd0d0d262670b6440fb2e3661f7f..2e0619542d2a9ad73457853e4f5008e6eb130cdd 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -633,7 +633,7 @@ static int mdp_m2m_open(struct file *file)
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 err_release_handler:
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 err_exit_fh:
 	v4l2_fh_exit(&ctx->fh);
 	ida_free(&mdp->mdp_ida, ctx->id);
@@ -657,7 +657,7 @@ static int mdp_m2m_release(struct file *file)
 		mdp_vpu_put_locked(mdp);
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	ida_free(&mdp->mdp_ida, ctx->id);
 	mutex_unlock(&mdp->m2m_lock);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 952a77c383bdb8dba94c74916674e729ee5aba35..46d176e6de63e370693fe20cc04c52cde81f4d73 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -282,7 +282,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
@@ -307,7 +307,7 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_dec_release(ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 9cacb6cbcf28357826db2df7e15c3588e7b4d4c8..fb1c3bdc2daeb4b439d29bb6bbecc1ad786e9eb0 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -191,7 +191,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
@@ -209,7 +209,7 @@ static int fops_vcodec_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_enc_release(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 688b776b30107df4ec3642a4bc0e896759ccf0fe..0c50f4ff82e0a8f4935325d00691c58072182926 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -856,7 +856,7 @@ static int tegra_release(struct file *file)
 	struct tegra_ctx *ctx = fh_to_tegra_ctx(fh);
 	struct tegra_vde *vde = ctx->vde;
 
-	v4l2_fh_del(fh);
+	v4l2_fh_del(fh, file);
 	v4l2_m2m_ctx_release(fh->m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	v4l2_fh_exit(fh);
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 2bd30910ddf98401dfc9d8f2e3b19fe8672320e3..97744c7b7c034cadfdd3f6d76165b4da85fa3d16 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -667,7 +667,7 @@ static int dw100_release(struct file *file)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 13e681a0ec0abcb49b14455773da3ab2f5dc372b..fa7d74d8c1aabd3bf74482e214165d8c1a7e89da 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2238,7 +2238,7 @@ static int mxc_jpeg_open(struct file *file)
 err_ctrls_setup:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 error:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&mxc_jpeg->lock);
 free:
@@ -2751,7 +2751,7 @@ static int mxc_jpeg_release(struct file *file)
 			ctx->slot);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&mxc_jpeg->lock);
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 9602409f3ecef7e2a77a58f9c3376823a72ec551..6cc9b07ea53a002c2eda0fd6062096f5527ad62c 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1716,7 +1716,7 @@ static int pxp_release(struct file *file)
 
 	dprintk(dev, "Releasing instance %p\n", ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	mutex_lock(&dev->dev_mutex);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 480669a2578ab2f4d6d5104658ba56ea776a6639..850dd8ae95841d4470ac6bd7cb1e54a7510d6d5e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -716,7 +716,7 @@ static int mxc_isi_m2m_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mxc_isi_m2m_ctx_ctrls_delete(ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 	mutex_destroy(&ctx->vb2_lock);
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 8c8f834e6250f5effcbb7f098f388a9ccc96302c..d23da93304bd6f55898cfb96319d2fa101036ca1 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -769,7 +769,7 @@ static int emmaprp_release(struct file *file)
 	mutex_lock(&pcdev->dev_mutex);
 	clk_disable_unprepare(pcdev->clk_emma_ahb);
 	clk_disable_unprepare(pcdev->clk_emma_ipg);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(&pcdev->dev_mutex);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index cdd34a3b71ff4309829f0f159241c3815658bcb8..541ae86f7892ab7ca89e9d5856ef10d189b2fb32 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -30,8 +30,7 @@ static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 
 static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 {
-	filp->private_data = NULL;
-	v4l2_fh_del(&inst->fh);
+	v4l2_fh_del(&inst->fh, filp);
 	inst->fh.ctrl_handler = NULL;
 	v4l2_fh_exit(&inst->fh);
 }
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5e1ace16a4903999c7fd7a985317dae8dd2410ba..90de29f166ada7aa5afe611041df308b5dfe8312 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -607,7 +607,7 @@ void venus_close_common(struct venus_inst *inst, struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	hfi_session_destroy(inst);
-	v4l2_fh_del(&inst->fh);
+	v4l2_fh_del(&inst->fh, filp);
 	v4l2_fh_exit(&inst->fh);
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 
diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index e0d12b579d87025e3f309f6593c068ad87f1856b..e78d8fb104e9544d27c8ace38888995ca170483f 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -2166,7 +2166,7 @@ static int fdp1_release(struct file *file)
 
 	dprintk(fdp1, "Releasing instance %p\n", ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	mutex_lock(&fdp1->dev_mutex);
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 26c5c77e4a17b26c453e3ea80b0f7c752e2f8029..058fcfb967bd98440f33272db42f0d973299d572 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1276,7 +1276,7 @@ static int jpu_open(struct file *file)
 device_prepare_rollback:
 	mutex_unlock(&jpu->mutex);
 v4l_prepare_rollback:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	return ret;
@@ -1289,7 +1289,7 @@ static int jpu_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index b6dc1ee3dc50ac8d0eb79408b06c601cb501e9b8..75f9a1a85d558ff0afa2fdaf8c43a22ddbd694a8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1083,7 +1083,7 @@ static int vsp1_video_open(struct file *file)
 
 	ret = vsp1_device_get(video->vsp1);
 	if (ret < 0) {
-		v4l2_fh_del(vfh);
+		v4l2_fh_del(vfh, file);
 		v4l2_fh_exit(vfh);
 		kfree(vfh);
 	}
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index d88817023996b29afc79cdd6fbdd42dfc5829b13..45c42c7ad846fab985e573ef7acf4a5bc1a4cac1 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -418,7 +418,7 @@ static int rga_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 2fbad685e92cee4916420565a28c778b1a5e1a8e..481c2488f9ac64e70869ed21e5053cfbc4ed6e0e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -954,7 +954,7 @@ static int rkvdec_release(struct file *filp)
 {
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(filp);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, filp);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 	v4l2_fh_exit(&ctx->fh);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 39d84ffd1b05990ba4b8af281aba09e3f9cc5340..2999fb2610f0f61b63d0331f94883469ff43d751 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -654,7 +654,7 @@ static int gsc_m2m_open(struct file *file)
 
 error_ctrls:
 	gsc_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 error_fh:
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
@@ -675,7 +675,7 @@ static int gsc_m2m_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	gsc_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 	if (--gsc->m2m.refcnt <= 0)
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index b002b02a899efdd95df4ae8a5db59b9f144a61db..609fd84f89d4ad189d0f367bb37693f15f3a618e 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -663,7 +663,7 @@ static int fimc_m2m_open(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 error_c:
 	fimc_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 error_fh:
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
@@ -684,7 +684,7 @@ static int fimc_m2m_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	fimc_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 	if (--fimc->m2m.refcnt <= 0)
diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index e34cae9c9cf65d3161822b68233d28472171f917..922262f61e7b53baf1b5840d35149bf5b4b2e7ad 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -280,7 +280,7 @@ static int g2d_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(&dev->mutex);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	v4l2_info(&dev->v4l2_dev, "instance closed\n");
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index c4ad0196ed8f1bf579365a0a21dd8c4a78bdaa10..2a57efd181540183e7d2b66d51f9f2f274ddd100 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -1005,7 +1005,7 @@ static int s5p_jpeg_open(struct file *file)
 	return 0;
 
 error:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&jpeg->lock);
 free:
@@ -1021,7 +1021,7 @@ static int s5p_jpeg_release(struct file *file)
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	mutex_unlock(&jpeg->lock);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 74629db05121ac9181af9daa471c113876f9d323..a5e756049620cdf35df4526b9a4cb55985f6476e 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -955,7 +955,7 @@ static int s5p_mfc_open(struct file *file)
 err_bad_node:
 	dev->ctx[ctx->num] = NULL;
 err_no_ctx:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 err_alloc:
@@ -1010,7 +1010,7 @@ static int s5p_mfc_release(struct file *file)
 	if (dev)
 		dev->ctx[ctx->num] = NULL;
 	s5p_mfc_dec_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	/* vdev is gone if dev is null */
 	if (dev)
 		v4l2_fh_exit(&ctx->fh);
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 57dcc625096b4b684cfde0051d200bf8c18e4ba4..fc7945d29bccc2fdf0fc48fc14d6698b321418d9 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -634,7 +634,7 @@ static int bdisp_open(struct file *file)
 
 error_ctrls:
 	bdisp_ctrls_delete(ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 error_fh:
 	v4l2_fh_exit(&ctx->fh);
 	bdisp_hw_free_nodes(ctx);
@@ -659,7 +659,7 @@ static int bdisp_release(struct file *file)
 
 	bdisp_ctrls_delete(ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 	if (--bdisp->m2m.refcnt <= 0)
diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index b2df94dcbe21709f5b31446c85408728e70d5bca..adff43271b2dc059abbbf82d90cd13482f6bca30 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1684,7 +1684,7 @@ static int delta_open(struct file *file)
 	return 0;
 
 err_fh_del:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 err:
@@ -1712,7 +1712,7 @@ static int delta_release(struct file *file)
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 	/* disable ST231 clocks */
diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 2f9413fa7318f42b390f96447dcb1a905836703e..3581b73a99b8ba5702e5d4d8d02cd5c832fa1555 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1218,7 +1218,7 @@ static int hva_open(struct file *file)
 err_ctrls:
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 err_fh:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 out:
@@ -1249,7 +1249,7 @@ static int hva_release(struct file *file)
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 
 #ifdef CONFIG_VIDEO_STI_HVA_DEBUGFS
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index b2bced06a1e603f7479620d5db3c12ee89e5149e..bc0f81e78018b20c38677eaea44358ddad7a9a52 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -326,7 +326,7 @@ static int dma2d_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(&dev->mutex);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 7823eb97faf7e9bd13286ab14db2b436fc5caf1f..eb519afb30ca10c6f4370626d0dce9e7183b28e5 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -759,7 +759,7 @@ static int deinterlace_release(struct file *file)
 
 	mutex_lock(&dev->dev_mutex);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 368a858b8c0fdea462b85c8c71e22058d10a6c05..89992feaab6082b438eec189c0de93568d09f911 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -695,7 +695,7 @@ static int rotate_release(struct file *file)
 	mutex_lock(&dev->dev_mutex);
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index d10a2b96c13cf1f5103504a8bd10c65111392a1e..2c0008444b7e2b532c9af061760e7399cdf3e45d 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1336,7 +1336,7 @@ static int isp_video_open(struct file *file)
 
 done:
 	if (ret < 0) {
-		v4l2_fh_del(&handle->vfh);
+		v4l2_fh_del(&handle->vfh, file);
 		v4l2_fh_exit(&handle->vfh);
 		kfree(handle);
 	}
@@ -1360,10 +1360,9 @@ static int isp_video_release(struct file *file)
 	v4l2_pipeline_pm_put(&video->video.entity);
 
 	/* Release the file handle. */
-	v4l2_fh_del(vfh);
+	v4l2_fh_del(vfh, file);
 	v4l2_fh_exit(vfh);
 	kfree(handle);
-	file->private_data = NULL;
 
 	omap3isp_put(video->isp);
 
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index a47c5d31c47550cd9c6c8803b25cda1253f906a9..6029d4e8e0bd34d60f1addb91a51bf5fd0709341 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2421,7 +2421,7 @@ static int vpe_release(struct file *file)
 	vpdma_free_desc_buf(&ctx->sc_coeff_v);
 	vpdma_free_desc_buf(&ctx->sc_coeff_h);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index aadc3d8fb3d1c1267b370edac6723b99bd00f9bf..4cc9d00fd2936dcfaa4574d8bd9a23b9ae9b5476 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -677,7 +677,7 @@ static int hantro_open(struct file *filp)
 	return 0;
 
 err_fh_free:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, filp);
 	v4l2_fh_exit(&ctx->fh);
 err_ctx_free:
 	kfree(ctx);
@@ -693,7 +693,7 @@ static int hantro_release(struct file *filp)
 	 * to this file.
 	 */
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, filp);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	kfree(ctx);
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index f20d9d9643f5e3d39f4807ad337f05c957594e1e..c340fd2260403e1750d1d094f7b1567c05a8f08d 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1946,7 +1946,7 @@ static int vicodec_release(struct file *file)
 	mutex_lock(vfd->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(vfd->lock);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	kvfree(ctx->state.compressed_frame);
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 24574025f58fc34a0b98e8048294624607e39e2a..d0e760118c822aa7696b1cde2a6be5c9982ad639 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1450,7 +1450,7 @@ static int vim2m_release(struct file *file)
 
 	dprintk(dev, 1, "Releasing instance %p\n", ctx);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	mutex_lock(&dev->dev_mutex);
diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
index 0f43ec23f40b40362979646b47b09b75b7786fb2..26c6c6835f793a6ac273856bc9b3336a06bae1cd 100644
--- a/drivers/media/test-drivers/visl/visl-core.c
+++ b/drivers/media/test-drivers/visl/visl-core.c
@@ -389,7 +389,7 @@ static int visl_release(struct file *file)
 	dprintk(dev, "Releasing instance %p\n", ctx);
 
 	tpg_free(&ctx->tpg);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	mutex_lock(&dev->dev_mutex);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 04c77af0c51ec2174193387253015383d6fac486..f9535a484738a9ef25795daa11a74ccb0b914be9 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -900,9 +900,8 @@ static int pvr2_v4l2_release(struct file *file)
 		fhp->rhp = NULL;
 	}
 
-	v4l2_fh_del(&fhp->fh);
+	v4l2_fh_del(&fhp->fh, file);
 	v4l2_fh_exit(&fhp->fh);
-	file->private_data = NULL;
 
 	pvr2_channel_done(&fhp->channel);
 	pvr2_trace(PVR2_TRACE_STRUCT,
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b59b1084d8cdf1b62da12879e21dbe56c2109648..df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -67,7 +67,7 @@ int v4l2_fh_open(struct file *filp)
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_open);
 
-void v4l2_fh_del(struct v4l2_fh *fh)
+void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp)
 {
 	unsigned long flags;
 
@@ -75,6 +75,8 @@ void v4l2_fh_del(struct v4l2_fh *fh)
 	list_del_init(&fh->list);
 	spin_unlock_irqrestore(&fh->vdev->fh_lock, flags);
 	v4l2_prio_close(fh->vdev->prio, fh->prio);
+
+	filp->private_data = NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_del);
 
@@ -94,10 +96,9 @@ int v4l2_fh_release(struct file *filp)
 	struct v4l2_fh *fh = file_to_v4l2_fh(filp);
 
 	if (fh) {
-		v4l2_fh_del(fh);
+		v4l2_fh_del(fh, filp);
 		v4l2_fh_exit(fh);
 		kfree(fh);
-		filp->private_data = NULL;
 	}
 	return 0;
 }
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bf35ac436249fdbf218ed08a712abf546a49b4eb..41e4aca77b7fe432b1b27b3c1e7ffa8211297e1a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -109,7 +109,7 @@ static int subdev_open(struct file *file)
 
 err:
 	module_put(subdev_fh->owner);
-	v4l2_fh_del(&subdev_fh->vfh);
+	v4l2_fh_del(&subdev_fh->vfh, file);
 	v4l2_fh_exit(&subdev_fh->vfh);
 	subdev_fh_free(subdev_fh);
 	kfree(subdev_fh);
@@ -127,11 +127,10 @@ static int subdev_close(struct file *file)
 	if (sd->internal_ops && sd->internal_ops->close)
 		sd->internal_ops->close(sd, subdev_fh);
 	module_put(subdev_fh->owner);
-	v4l2_fh_del(vfh);
+	v4l2_fh_del(vfh, file);
 	v4l2_fh_exit(vfh);
 	subdev_fh_free(subdev_fh);
 	kfree(subdev_fh);
-	file->private_data = NULL;
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 9dc0954ed9aac7088e42bea03c6aada4ee8f2ae8..c4ee0eebb3730e709c3d4a95935d0047a645e411 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -792,7 +792,7 @@ static int ipu_csc_scaler_open(struct file *file)
 err_ctrls:
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_ctx:
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 	return ret;
@@ -807,7 +807,7 @@ static int ipu_csc_scaler_release(struct file *file)
 
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdlr);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
 
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b92666ff50a15196de0143f2ba5bf476c6f7729d..49e497a32973b8df18c5143e0db68d0f7f42c36c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -926,7 +926,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
-	v4l2_fh_del(&sess->fh);
+	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
 	mutex_destroy(&sess->lock);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index ebefd646dbdb4e998bf6a8a0f0be6d7e4bf7d28b..bff42ea1871f7376bfdb1dfad2ba7f22e862b0ea 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -404,7 +404,7 @@ static int cedrus_release(struct file *file)
 
 	mutex_lock(&dev->dev_mutex);
 
-	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_del(&ctx->fh, file);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
 	v4l2_ctrl_handler_free(&ctx->hdl);
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 24a68e3e54195cf5f8952a35fe103d93bb0fd3e5..32f71d9a9cf78ad74aa8b9a53f40c1d52123df52 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -107,7 +107,7 @@ static int comp_vdev_open(struct file *filp)
 	return 0;
 
 err_rm:
-	v4l2_fh_del(&fh->fh);
+	v4l2_fh_del(&fh->fh, filp);
 	v4l2_fh_exit(&fh->fh);
 
 err_dec:
@@ -143,7 +143,7 @@ static int comp_vdev_close(struct file *filp)
 	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
 	mdev->mute = false;
 
-	v4l2_fh_del(&fh->fh);
+	v4l2_fh_del(&fh->fh, filp);
 	v4l2_fh_exit(&fh->fh);
 
 	atomic_dec(&mdev->access_ref);
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 680f25d17dc2c7b99529441de8f079abe3b3411f..fd4b998ccd16058eb796dd317971c0869f6bdeb8 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -692,8 +692,7 @@ uvc_v4l2_release(struct file *file)
 		uvc_v4l2_disable(uvc);
 	mutex_unlock(&video->mutex);
 
-	file->private_data = NULL;
-	v4l2_fh_del(&handle->vfh);
+	v4l2_fh_del(&handle->vfh, file);
 	v4l2_fh_exit(&handle->vfh);
 	kfree(handle);
 
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index d8fcf49f10e09452b73499f4a9bd1285bc2835a5..5e4c761635120608e0b588e0b0daf63e69588d38 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -114,12 +114,15 @@ int v4l2_fh_open(struct file *filp);
  * v4l2_fh_del - Remove file handle from the list of file handles.
  *
  * @fh: pointer to &struct v4l2_fh
+ * @filp: pointer to &struct file associated with @fh
+ *
+ * The function resets filp->private_data to NULL.
  *
  * .. note::
  *    Must be called in v4l2_file_operations->release\(\) handler if the driver
  *    uses &struct v4l2_fh.
  */
-void v4l2_fh_del(struct v4l2_fh *fh);
+void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp);
 
 /**
  * v4l2_fh_exit - Release resources related to a file handle.

-- 
2.49.0


