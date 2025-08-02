Return-Path: <linux-media+bounces-38761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF8B18C4A
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F711AA3046
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F4F26A1AC;
	Sat,  2 Aug 2025 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="glpozsiM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA09721D3F8;
	Sat,  2 Aug 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126832; cv=none; b=d9/HnGfJNqeC1WtSG+tPs55liLqN+mhszjhl18lJNakm3EwOH5b9ZZbcryse4H3uCbAgT0kNkh88P7Rk1r/Uqso7f8X5dKe4mGygF0ql94d05yaIslLO+sGeJsw52EOcSoXX1MNHgyt4bm0qnywGaT3wwwFmonumQj8+02u7xM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126832; c=relaxed/simple;
	bh=PZLQVaI1vZKi0WIr3Q878QLqEaTr0uij9E9KhgQTBLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLcTpAQSSdQO/sNRfsKkISjIQeZwrhfwFmqzBfOvSiBdpLbxb3aFEwkOGwZCSWHMT3HruHWx3C4F/knXItPq/PTfPqcy9pQYEQn2+BduatjqX23jf33ZD+xzvlgzEj1Fe0U5Yr7iSVJsyqt3GDEIEwYarpBm7O3bbeXYdAWEo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=glpozsiM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEC0B3AC8;
	Sat,  2 Aug 2025 11:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126784;
	bh=PZLQVaI1vZKi0WIr3Q878QLqEaTr0uij9E9KhgQTBLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=glpozsiMSkAdE8qk8DV+qPeB3taW375MoVrWdOB4cufVoZ/iT2/9a/sHUU6CS0d5I
	 riolvMj1G/tGQ7S2/0rHQQjGwNysQGwANruXqaKpTG39MMXBMknM5lc8YSPrjUgIai
	 9jDndo/hQZm6gNe2reNXZU/1z+kKk7B/biiUSd+U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:44 +0200
Subject: [PATCH 22/65] media: qcom: iris: Pass file pointer to
 iris_v4l2_fh_(de)init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-22-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=T7tnvhAAkedHKQQVRtKCkxG+wcLOyWF1XErsaMtfBYY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj59XaFL/Sd0BVhJH0Xfg7Vmb1RhxbHsvp6x
 5ltEdCDgMOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+QAKCRByNAaPFqFW
 PCwcEACdclKr4oR/Yg45NonSfNvh7MFckOXskhI7d8HCP6X6W2mxvMN2af258eUD0Po2k7UJAdg
 yhzWebC08rW11AJ0yJ3BPh7FKCi1eL6HmLvL6gUYdf/HFCIzVRaXRBIrvgCE9Z7XiMpZOvHml3U
 PH+YUa/VZZd/SLAZtNbWr1356EBCqBLxuvqCV9B0zyLAgNGvv1CoyeO3pbvl2oNL7OJyn7v2mof
 YqY9cFeaIDMIhiDfZ4xNa4r/eQ1DT43YITKFB8bZmFcojlHmuByILVOj+o9uOTJWeMFIl2UC5F/
 YZxhB+yQInGuMlJVYQkGvBp06TE3kgE3NjJyhV52/FwlfnUdSo0d1/HxG4QxVaoAUp9BsuJKAwS
 eJ4eo9xwhHWzs06HcHx1Kt/YmtN/QJJd6Ukjby5WdtpRpmAARIgr5LwfiYuysqD9N3VRbKq+9fZ
 kLJ0e40lPrCJaeDc36gAl0dUgo8OeDcuHcWRiUL3uOHxA9+U0oRdQ15nEgmGY1MxnBeO/hLMLkI
 G3PtZs8kgWlBW8b/bMN28rvvgm9rR7VUuvAk/4f9p+dgDkhu4ZTPyheBI2V4JRgGlleR7vVeSTm
 UZvbPhAiM16/87VqLg31yijDZzm1Zn8du/yPyJN8U7+HyQIBTjVVhYTrY9eD0NO9TTEdkwfHdsx
 5RIsN9qBKPBFCrw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In preparation for a tree-wide rework automated with coccinelle that
will need to access a struct file pointer in the iris_v4l2_fh_init() and
iris_v4l2_fh_deinit() functions, pass it from the callers. There is not
functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 0c3b47b9958aa3388d91ffda9b2acfbb53f09f59..d5f99519def45d1c5859e641eed490ec9ad5784a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -21,14 +21,14 @@
 #define STEP_WIDTH 1
 #define STEP_HEIGHT 1
 
-static void iris_v4l2_fh_init(struct iris_inst *inst)
+static void iris_v4l2_fh_init(struct iris_inst *inst, struct file *filp)
 {
 	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 }
 
-static void iris_v4l2_fh_deinit(struct iris_inst *inst)
+static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 {
 	v4l2_fh_del(&inst->fh);
 	inst->fh.ctrl_handler = NULL;
@@ -164,7 +164,7 @@ int iris_open(struct file *filp)
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
-	iris_v4l2_fh_init(inst);
+	iris_v4l2_fh_init(inst, filp);
 
 	inst->m2m_dev = v4l2_m2m_init(&iris_m2m_ops);
 	if (IS_ERR_OR_NULL(inst->m2m_dev)) {
@@ -194,7 +194,7 @@ int iris_open(struct file *filp)
 fail_m2m_release:
 	v4l2_m2m_release(inst->m2m_dev);
 fail_v4l2_fh_deinit:
-	iris_v4l2_fh_deinit(inst);
+	iris_v4l2_fh_deinit(inst, filp);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
 	kfree(inst);
@@ -259,7 +259,7 @@ int iris_close(struct file *filp)
 	iris_vdec_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
-	iris_v4l2_fh_deinit(inst);
+	iris_v4l2_fh_deinit(inst, filp);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);

-- 
2.49.0


