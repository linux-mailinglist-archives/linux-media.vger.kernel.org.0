Return-Path: <linux-media+bounces-38754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AAB18C12
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBFDA1893477
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CD1227E82;
	Sat,  2 Aug 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kMU4Dgdm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D4229B2E;
	Sat,  2 Aug 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126759; cv=none; b=XbkKuRNEnY6Fl3VItci97bSgnqaMK69TfibJ/japcO5Eic8VZx/xwd+rrdVnLyZVP9w55Wzy0Ox5tAPucB05rX1gtPYeTqbmJuKkqaA71n/uWt9NaooXa0CuX1w/mi8/ZUBNUxgbzPQTBIJC3vNsrR8X9hGrsd2ry+LApZ/jtBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126759; c=relaxed/simple;
	bh=dO9x6/VIVj6bTEsPK3lsquc2JUWgPxCjD+OB8gyY8EI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOV35DHXi4Ly8nb3BGcG9/Q2W4qrmbDT9kFE6x7PquQ3rLmgmK510MmKK4phwbfAAE7Y2/txWEwXFidVTsU78w/+qM2U3NdM/e8jQA/mrroXO7GXRNEWzXFzymW8gwfN5etfUt9CTUyT242211yl6ICsdMzNUnf52Dmt9vbqsCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kMU4Dgdm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39A70330B;
	Sat,  2 Aug 2025 11:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126710;
	bh=dO9x6/VIVj6bTEsPK3lsquc2JUWgPxCjD+OB8gyY8EI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kMU4DgdmjQKEw5APBDTpC7/xsmKu4JDUI/gfBamVSR4hVRyM6IzMlC5+RXI5DwMu9
	 dIgl0Xdc1+ZeL7bWgDQKKc3vqcqeRucizw8huGBTW6ZcjIv7CRc3vnPV6hFo5V1DhW
	 oUk0q7by7K/kLWQOfaXN01E8fmJjaym0xSbTUjhg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:37 +0200
Subject: [PATCH 15/65] media: visl: Drop visl_v4l2fh_to_ctx() function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-15-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=0VP/r2vlVhnFVYKofY26Y91mhgecgJPyrhx9vTNdS8M=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj52mJZbEKi2xzPTCbRBAU/vdaACQYQlG+Xy
 SMzPz1qhe2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+QAKCRByNAaPFqFW
 PB2GEADA7hMCuMVfeDlEpQ62CtlmzW48xyXjOFzVROOd3wLvASETZNeK3+0Q6FLDTI6TGFb/zco
 lm6i6s+vWnrcZXkABPvZ8X3GyoNhSEZt8omQCyWjX+JN0x3DtRaHfIbluyIrSUL3MlIX17uG86e
 8VoqzaLuLF9026rG4XoVdFawhCO+LTD2NjKYSvnLJ+7pTYmPAvHYGyrG/jWZqOSAYHQStI5IRSr
 RJnkUgRuvf55ehCgVhwg5t4Py74KWzCXU9qzjCszWEgyx5nyRb+/DSRVtx/vvwNjf9k7A9q8aTU
 6oR2TIlPV6Xo6VEzJJLlhvpjpbyzOhbDx8lcWtHNH/dm98xNWPB96alwum/oP1n+8bwObfjDq/Q
 g1fhdUfYPTsRj3HftB0ACQ1GUc6M1IB49/f54llbyQB/DL4Aljr79EG5+LjJfhmv+vj4P0Zz0SQ
 FftkiNVi7VY6Z0ZOx4rC2oyyCSb+8DF9AnUVqZb/ArUZZGesBqVEy0U3OazFNeAOhTryUCDEGV9
 BoMDZ3I5B3vBt6UGMDhq6T7lpEPz5WV3HdjiU+uJev+S8HUL7Yn3OAblvyv7ItfIgMdw5SFmRld
 aqHQOX5LVKQbyRI2QukK/0Imm58hWZQFye8fdAG39IMFR8AacdA3nP+YmKSqOFc6DHUwR89p72O
 gxMmoyNTVU3+8LA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The visl_v4l2fh_to_ctx() function is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/test-drivers/visl/visl.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/test-drivers/visl/visl.h
index ad3d0ab791d6aec4fb120dcfe86000e498f6713d..2971e8b37ff6660f68b5f4bbf199e0f8657f6686 100644
--- a/drivers/media/test-drivers/visl/visl.h
+++ b/drivers/media/test-drivers/visl/visl.h
@@ -166,11 +166,6 @@ static inline struct visl_ctx *visl_file_to_ctx(struct file *file)
 	return container_of(file_to_v4l2_fh(file), struct visl_ctx, fh);
 }
 
-static inline struct visl_ctx *visl_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
-{
-	return container_of(v4l2_fh, struct visl_ctx, fh);
-}
-
 void *visl_find_control_data(struct visl_ctx *ctx, u32 id);
 struct v4l2_ctrl *visl_find_control(struct visl_ctx *ctx, u32 id);
 u32 visl_control_num_elems(struct visl_ctx *ctx, u32 id);

-- 
2.49.0


