Return-Path: <linux-media+bounces-44521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67003BDD38A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D51B04F13FD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A721314B72;
	Wed, 15 Oct 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bHz2suxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136D313E3D;
	Wed, 15 Oct 2025 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514848; cv=none; b=pcZ1LOEtg6OliqGLNQNdXXy+zBmEJEvcKF4Mtorg1l7IREi14WLto+T8LyXTjRn+gul39qNr3U4JVRg6bdVsr5OJWSh0LR0Qry8Wb/JauyE5euw1tCiiZ1XKK1xwVumlbzltRB1jUB9KztpNrZ91W9/Vpxvg93r1FSS9IKOAOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514848; c=relaxed/simple;
	bh=HMpyQc1vCbg200Ovi9oVcwwxqMAbktCljqyWnp6/pa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g3GACilGc0+zQlZBiPsnw7b47hzxC0/KrR0Z+KTwC8bjE6bOaU9yBec8wzOV6whittYBP9cjJX6wKGdR9uv/k+Jyzq6PvHEBHtGJ7tuizp+KIK3lu7dRQ0A2a6sxGaKU/YsGm5dNw2yXpeMsfTW+BUZLQ9UOwAO9oVhqBtLRPkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bHz2suxZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7C3E8E92;
	Wed, 15 Oct 2025 09:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514742;
	bh=HMpyQc1vCbg200Ovi9oVcwwxqMAbktCljqyWnp6/pa4=;
	h=From:To:Cc:Subject:Date:From;
	b=bHz2suxZQcf0OwK6sXgHCFZZ6iQ17jH8d09o9a4jKXrYvttYbKQiN193Zi3ckmrEb
	 VOc063B/05xd/wZPm3lhzUiRSoCLduQif6EbnCkdyDb4f7fNTKbIFtfsUB7NowV2j5
	 Xm/CYKIPh8yqEnxujxmRWLzg3Hf6LshKSceZbfRg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ming Qian <ming.qian@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Yunseong Kim <ysk@kzalloc.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH v2 00/25] media: v4l2-mem2mem: Reduce cargo-cult
Date: Wed, 15 Oct 2025 10:53:23 +0300
Message-ID: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The v4l2_m2m_get_vq() function never returns NULL, but many mem2mem
drivers still check its return value and consider NULL as an error. This
may have originated a long time ago from valid checks when
v4l2_m2m_get_vq() could return NULL, with drivers then just copying the
checks. This series attempts to stop the cargo-cult behaviour.

Patch 01/25 starts by explicitly stating in kerneldoc that the
v4l2_m2m_get_vq() function never returns NULL. All the other patches
drop NULL checks from drivers.

I have carefully checked all patched locations in all drivers. They fall
in 3 categories:

- Checks in the VIDIOC_G_FMT, VIDIOC_TRY_FMT and VIDIOC_S_FMT handlers:
  Those may have been added to ensure that the format type has a valid
  value, but that is ensured by the V4L2 ioctl core before calling the
  handlers. The checks can be dropped without a need to replace them
  with proper type checks.

- Checks in the VIDIOC_S_SELECTION handler: The only location where this
  is performed has an explicit type check, so the NULL check can also be
  dropped.

- Checks in other locations where the type parameter to the
  v4l2_m2m_get_vq() function is hardcoded: The hardcoded type is valid,
  so the NULL check can't have been meant to check the type. It can also
  be removed.

There's no dependency between any of those patches so they can be merged
in any order.

Compared to v1, this version drops two more NULL checks, in the Mediatek
vcodec encoder get format handler (09/25) and the Qualcomm iris venc set
format handler (15/25).

Laurent Pinchart (25):
  media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns
    NULL
  media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  5 -----
 drivers/media/platform/amphion/vdec.c              |  2 --
 drivers/media/platform/amphion/venc.c              |  2 --
 .../media/platform/chips-media/coda/coda-common.c  |  4 ----
 .../media/platform/imagination/e5010-jpeg-enc.c    |  4 ----
 drivers/media/platform/m2m-deinterlace.c           |  7 -------
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 -------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 14 --------------
 drivers/media/platform/nxp/dw100/dw100.c           |  7 -------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  4 ----
 drivers/media/platform/nxp/imx-pxp.c               |  7 -------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 --
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 -------
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 --
 drivers/media/platform/qcom/iris/iris_venc.c       |  2 --
 drivers/media/platform/qcom/venus/vdec.c           |  2 --
 drivers/media/platform/qcom/venus/venc.c           |  2 --
 drivers/media/platform/renesas/rcar_fdp1.c         |  3 ---
 drivers/media/platform/renesas/rcar_jpu.c          |  8 --------
 drivers/media/platform/rockchip/rga/rga.c          |  4 ----
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  4 ----
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  7 -------
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  5 -----
 drivers/media/platform/ti/vpe/vpe.c                |  7 -------
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  7 -------
 drivers/media/test-drivers/vim2m.c                 | 12 ------------
 drivers/media/v4l2-core/v4l2-mem2mem.c             | 12 +-----------
 include/media/v4l2-mem2mem.h                       |  3 +++
 32 files changed, 4 insertions(+), 161 deletions(-)


base-commit: 082b86919b7a94de01d849021b4da820a6cb89dc
-- 
Regards,

Laurent Pinchart


