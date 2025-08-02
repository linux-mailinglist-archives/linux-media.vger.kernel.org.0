Return-Path: <linux-media+bounces-38801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD11B18D9F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49C3188D19F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA7285412;
	Sat,  2 Aug 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SGcK94cr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042026A1CF;
	Sat,  2 Aug 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127246; cv=none; b=rDNfT6rJKkGup3civp3Y5TaAU1yFhdYV9cYxnHc64E/wL3Y9Yokfh1HJyEJ4CbXGfwCWV3tmjrS6tUhhPBe9ukq3Wts7nVjDUikD3hMa0/7rj4VRQGWHpcW4V7V1hht29XC9c3EBSFqZb2D4/ypQ+EaklF5A7o8H3PyUIky/WTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127246; c=relaxed/simple;
	bh=XdOe0hUHoRepWDL9PXLLZRQsffL0J6Xd5RC8oZQXv/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DN7DYNpm9HMXVRGRo2PGr8ujzWH6NS4Yn6IOyeAOkpfy+SWjNCBRlWaG5MBBmdZHG8gbjvxqeKcBkv9ZeORTO2rVtAmNpjUQqFeRqfte4ttIQX5oIof1b6dPkmVVbRbw7FDt3h+2WPJ1iXy0bK+rvK7hxwBa+RlbArrIaQdeofs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SGcK94cr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F10D443E9;
	Sat,  2 Aug 2025 11:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127197;
	bh=XdOe0hUHoRepWDL9PXLLZRQsffL0J6Xd5RC8oZQXv/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SGcK94cr5R4K6fWMgc6ZO+cWOzWTlglfalvYGrPcJNwLCt+GKIXEGJuoXTrsoaIIU
	 zgvR//X2BjB32zxJtwfdqC+Rvv2+rJfEfAm6OoS1STQ4+in0GNP1szooJYEFRKRCoW
	 R9V8vHcB+jSKYpUdsUKtAFJ49PFsKYRa+N/VMN2E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:24 +0200
Subject: [PATCH 62/65] media: v4l2-ctrls: Move v4l2_fh retrieval after
 V4L2_FL_USES_V4L2_FH check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-62-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=loLIKoL1ckx0+Do+cmV4JLVH2b3g2wpBnTvZTq5U/K0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj/dlk/dxL7K7IYPuPuktjeyd8m0BEMDDL5V
 dGk/8P0KaWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/wAKCRByNAaPFqFW
 PKJ6D/9X8HRdjahHSdhz5uUldd/PeaMg0s7lr8HBc8sXBSyTJTJ7X4vpyBjbQuWFRN5tHSqT0Zd
 IiN0LjHlvvNaO8nDUeGNJQX9/nYx2/BgMrR0lD11hujdp8j5D6T3yqpF8tVG4HOmf0vykUOmfav
 LtkqeLwZ92Ycxyw3L9Dpz2nd4dGGX2KI8kdTXCt+xTaCijUASZiqye1MVhU3jjOOCtYa5j60eTQ
 7YcG4u10tCUyh38H4ysnFlwPZXiLfTEZhcH7hQmk84aH8LP6xcAJE69xsfZrWSd9aga/QBuS6+W
 vOi4UdCMMINpPW+UcDTt/wJgbV0g1Z9qzjw505d4SjNX7/XgZaiGrWl3SGJsEUOCtzutvNrxxNo
 2ApceQE3LYD0OAu3OCjt0DOOYwTVdTkgKlhp7Gc21zkQWw5kPtjFPtgYnpvNSS9tPNBdbXaxvYb
 3fYpJcyafppTgtZYzMoBk4INFxmUoyZOS2437cq3AJT2YKHI9FgC9tKdJUn3uywMdFrxIlTMZk/
 EBjnEHhw2O6oyu5OfTnK7uiAChKQ5mB7uV1a2YGTnB2AFlJxyxiMV/oVStMF2npE2Uz5WBPpgsq
 +a7F7oJity3uP3TrCCAarrvHnB1icd0y+dAbmSz+kK7ENi7ckr86IJQ6or2369uTso9ahDAq6YD
 WL+Za2l7ALyDORA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The v4l2_ctrl_log_status() function retrieves the v4l2_fh from the file
with file_to_v4l2_fh() before checking the V4L2_FL_USES_V4L2_FH to see
if the device makes use of v4l2_fh. While this doesn't cause any
practical issue given the current implementation of file_to_v4l2_fh(),
it is cleaner to retrieve the v4l2_fh after checking the flag. This
could prevent future issues if the implementation of file_to_v4l2_fh()
changes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d46b2c8f3d23596293210125b148c3da99c52cac..b0bba8eec143968b127368ee7de8bca76b427dbd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1253,11 +1253,14 @@ EXPORT_SYMBOL(v4l2_querymenu);
 int v4l2_ctrl_log_status(struct file *file, void *fh)
 {
 	struct video_device *vfd = video_devdata(file);
-	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev)
+	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev) {
+		struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
 		v4l2_ctrl_handler_log_status(vfh->ctrl_handler,
 					     vfd->v4l2_dev->name);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_ctrl_log_status);

-- 
2.49.0


