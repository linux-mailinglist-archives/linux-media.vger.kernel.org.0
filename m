Return-Path: <linux-media+bounces-38786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED01B18D11
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806053ACE1E
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B07427F007;
	Sat,  2 Aug 2025 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vxlu84YD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79B22A1E1;
	Sat,  2 Aug 2025 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127072; cv=none; b=ExlvhL0YVK0rr6rlK304T4lNG1Fb1C1mj69lFWBOCRBLAMBUEJEIF/HLr+ucqby6DKTUZmzO5M5iBniccZ42h5vsZqbyhcCCdi7ExXF05p3Jqs3giVA/phx4eFPVcKJbCpk0HYpfC1b9Dhh/vdF2R3fak3yAYFssJP7V7fWC3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127072; c=relaxed/simple;
	bh=Eczg8ECb72+TCEnmOt8zTT17kJTYh4uwIayf3SmW1JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2HbMR4PcxVGyN6E4WXIqeR9M2tFxyIUEF+22jHzMcE46HJkZcumK17Q4N0ElGu2cpuN7b7/5g9Vbtq2jofZ79ceBEFuuGFyq2Y5Rcn1kH+iBEx2Y2LZKGkcFY0cGWiHr3kQoBGYgzXbftktUw21OlR4Luh351x7nevaKYI3nvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vxlu84YD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DE8F4176;
	Sat,  2 Aug 2025 11:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127023;
	bh=Eczg8ECb72+TCEnmOt8zTT17kJTYh4uwIayf3SmW1JY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vxlu84YDp7Jd4jfVvLAsxFy34pgccx9f3xa0paw8IVe29SHPH8VpJZNnUMsWiYUHR
	 CVAa+3L3e1L2pJwimqcrq6hgVVAwuh3wbs1CibLsfxSfHpoZiR4VCfYxo3Keoo0n2z
	 jKyrW2ft8hyaVFcJL9t+p6SpGIothGx1EIXMmAGs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:09 +0200
Subject: [PATCH 47/65] media: s3c-camif: Set queue owner using file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-47-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Eczg8ECb72+TCEnmOt8zTT17kJTYh4uwIayf3SmW1JY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj9+KKN9ybzE3g+ZGFi3JToB55y8XEuI2gwH
 zGCFuhA0OaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/QAKCRByNAaPFqFW
 PK7OD/9WLUC3p8SXYZRT43b0K+nuWhWGgtGSBt4/ElOwk1n834rKblsRtgx7mkJ5VuJ4K5EQne2
 BF+d4Tb8DowDc+0OGKbKv5JsSZEhB585l9MaqLEuOf2fk//TGgpX4Nca+xgE0zwVLfF70GO6MwS
 +02OV5Z1/vzKbiRBFF1QYTr/uNe5E+fp6DzAimCXUzHjJgioOH6sB6N/SAh6RenycGWdl9pf/Ed
 iXUQYCbjRdKXpqFHpvrx7g7xwfdtHWu2toSHl6zfBIXn7MScpWqxIPGLsPJwP+8sJsXlTXlBdEw
 cBS7biGwPdh0BKeqXIY6uvCr4s6/yFy43FpmZBa7XPCxVWWfsVSDNkPpXcMyPEMAwg+mTX2/uPb
 uLCmk86pOQVWNfm7auaVF11/tqG3d161P5E1UfnGuqKOxd+h9E4s+2ChkF4PSmBGtOGxna/6vFM
 +KwSnv7523PD5w/Jd3jz/TXYgI1nItgpGbCd3Cn08d1NHBaDy7Gvqd8Hfpv1pkYGUYMwGWPczt8
 WTBgBFLE9pkdsp2SvyM2jnTtf3yWZYu6279qfF4CJ2byI/AT3TglvJv9FnXxp8PHMsIiXTKyzQO
 826gtpZOi9+L67vdX/KwzWvmaFFUJEWqOMK67CHgq9IUcDDgY2PhDr4GsAqzTTaAmmvt0MAXtN7
 C6/29ZoK3kBsz0A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The s3c-camif driver keeps track of which user owns the vb2 queue
by using the 'void *priv' argument passed to ioctl handlers.

As the driver uses v4l2_fh_open() the priv argument points to the
v4l2_fh handle associated with the open file.

Use file_to_v4l2_fh(file) instead of the raw 'priv' argument for better
consistency.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/samsung/s3c-camif/camif-capture.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index cae15a4ce5fd83f00ced8b2dfbb5f5a6f7483ca4..ed1a1d693293b33d8da3190ac8ee6dd212a64b88 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -791,7 +791,7 @@ static int s3c_camif_vidioc_s_fmt(struct file *file, void *priv,
 	out_frame->rect.top = 0;
 
 	if (vp->owner == NULL)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	pr_debug("%ux%u. payload: %u. fmt: 0x%08x. %d %d. sizeimage: %d. bpl: %d\n",
 		 out_frame->f_width, out_frame->f_height, vp->payload,
@@ -841,7 +841,7 @@ static int s3c_camif_streamon(struct file *file, void *priv,
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	if (s3c_vp_active(vp))
@@ -872,7 +872,7 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	ret = vb2_streamoff(&vp->vb_queue, type);
@@ -888,9 +888,9 @@ static int s3c_camif_reqbufs(struct file *file, void *priv,
 	int ret;
 
 	pr_debug("[vp%d] rb count: %d, owner: %p, priv: %p\n",
-		 vp->id, rb->count, vp->owner, priv);
+		 vp->id, rb->count, vp->owner, file_to_v4l2_fh(file));
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	if (rb->count)
@@ -910,7 +910,7 @@ static int s3c_camif_reqbufs(struct file *file, void *priv,
 
 	vp->reqbufs_count = rb->count;
 	if (vp->owner == NULL && rb->count > 0)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	return ret;
 }
@@ -929,7 +929,7 @@ static int s3c_camif_qbuf(struct file *file, void *priv,
 
 	pr_debug("[vp%d]\n", vp->id);
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	return vb2_qbuf(&vp->vb_queue, vp->vdev.v4l2_dev->mdev, buf);
@@ -942,7 +942,7 @@ static int s3c_camif_dqbuf(struct file *file, void *priv,
 
 	pr_debug("[vp%d] sequence: %d\n", vp->id, vp->frame_sequence);
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	return vb2_dqbuf(&vp->vb_queue, buf, file->f_flags & O_NONBLOCK);
@@ -954,14 +954,14 @@ static int s3c_camif_create_bufs(struct file *file, void *priv,
 	struct camif_vp *vp = video_drvdata(file);
 	int ret;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	create->count = max_t(u32, 1, create->count);
 	ret = vb2_create_bufs(&vp->vb_queue, create);
 
 	if (!ret && vp->owner == NULL)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	return ret;
 }

-- 
2.49.0


