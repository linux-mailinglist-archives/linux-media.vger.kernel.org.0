Return-Path: <linux-media+bounces-38756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5254B18C23
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3BCB7AE5AF
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E025A623;
	Sat,  2 Aug 2025 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Aq19Q2nr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A92192E1;
	Sat,  2 Aug 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126781; cv=none; b=RL3mW5Jiy33RSyYYhaFcgXURmg/CHhhtUA7U1aesQV1b9VNFKGfQQmBhhFB/jIGdYit5CEigMgH6knN9Y0mIMNI3siuAq8jIU6XVaxca2/e9Np+sWE+4q8UlvtCf5zrwtoP4CX96otGJjB3gTpF1hBzUb5zGgQq/JDk3pOqr/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126781; c=relaxed/simple;
	bh=zpnIwVYIp7ypZ1fcLHzyPvjh8rTKeT+VELtoNeP7zPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eep6FsNyVtvBSrLp/WQQKiSU8PP3adKa4406LVfHSXQhgTlL1R0m6msexY3bUbfu9cXcIHEy3XbYmceAG/pIAeA1b9IPQAlXTJIgM+lkTpLwdH0Izh2eYWltzeoOJd/FeuJPymQM4t/l6jQUdEzHNJtEW9UhY+ZELnmkW3tadKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Aq19Q2nr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7ED6732A6;
	Sat,  2 Aug 2025 11:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126731;
	bh=zpnIwVYIp7ypZ1fcLHzyPvjh8rTKeT+VELtoNeP7zPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Aq19Q2nrPXf6402OKOWFm8otA0CLAkk8S1RrOtGTySgQYBF2fg4rJCODH8bW16FNL
	 pVgq3zitoHUeNFytnfbtbBBgd9E5Q5Bdy/8WtYlDbVA/Jz3CVHIP253xgfEAfa70Za
	 oPRzuCj4TIjDImKku1Uj/Od/PKd2Gg/gU8ccslXQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:39 +0200
Subject: [PATCH 17/65] media: rcar-vin: Do not set file->private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=zpnIwVYIp7ypZ1fcLHzyPvjh8rTKeT+VELtoNeP7zPc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj5qAvM1W11y3eYPTqi4SdtrYyBxO2xYiR+h
 or9E17Q/iGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+QAKCRByNAaPFqFW
 PN2tD/0RGqTPdqW8RlaR9z1IRhg8ScsmdFRh/ZMQE2VtOzJ94v7+xB2dliSExPo9x7ySaLIYI1f
 LwLSeI+X1RMPjTK+lN3mVhG/LbQf0Z8+NsEE6GEe+L4faXhbBL/vfddlGjgMHYGZXvYoISOP6rb
 KC2/r9tsW8n0VY+X7Tv3yWkksNugzetOMqAe/kbdIOpGg/zFwgGM50hjZnL5qaUUN9qF/bPqQ/R
 irtg2ynJVsxkxn9JK7XA3NTPxlTQTrh9LUhuMAwDowSqRZ2S4ij7l2PiLUgxcHIz7kjUm9MFPJY
 8223+FLQRPI0l7exJgDkLe5Te6yvPg/pmGgRlipYufbF8ZOaA2Eu+nGdYbxvQu+4yEqEmVDP34M
 lNTnm+YWFa717LA1btjXhdQeUxzGYlH+/ST3yFGWczrxr4cAAsnJth2pZ1zVZMUyTQUjGpG9VAR
 qmEIBwJudVBfoSmzM71uajLl3fBbysQPX5MARM8q9r2RaS8nUM8+hoTrKOQKERxy/U1Ny2Y/sbu
 FD+m5FALVJT7xpmYCH4/aSpaU/icTmbFUaxMNlUCBPeMj0k8dN7M2uffS4Ce/jJ7ph3AgvX7OQE
 E9KLB86w2mijIE71MOjEY1QhNEFeoF+UNjiiUimmNL4YZXqHmOXLaLQoD5qZixbfvO0xo5FLtPP
 sclGwxTMJHMLRgw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The R-Car VIN driver sets file->private_data to the driver-specific
structure, but the following call to v4l2_fh_open() overwrites it
with a pointer to the just allocated v4l2_fh.

Remove the mis-leading assignment in the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 62eddf3a35fc91434cb2e584a01819380a7a6dd8..079dbaf016c25139e2ac82be63d8fce0d11fd208 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -588,8 +588,6 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_pm;
 
-	file->private_data = vin;
-
 	ret = v4l2_fh_open(file);
 	if (ret)
 		goto err_unlock;

-- 
2.49.0


