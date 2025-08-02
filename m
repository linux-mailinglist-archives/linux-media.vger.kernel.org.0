Return-Path: <linux-media+bounces-38802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A123B18DA5
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7EA5660BA
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D67285C91;
	Sat,  2 Aug 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EczlcoJF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B6E23817F;
	Sat,  2 Aug 2025 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127253; cv=none; b=DX70ptA2I+XtpT3QJo+pEqj4ACDkGkSbrmBBbrdeKYTmr3fyPzAOx9F/35iKZfm8NjJU0Oj4/VP/1w7LtVJuzzCA1aja5qb1adYyLXSzSech5WpHKJ/shdmA/oUDFJXP++eZ8kfB9w5bYEqz+blyiekrJavNJpMZjDPOKJ89sz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127253; c=relaxed/simple;
	bh=ugZh/KFY5LMHBtI9abTRXe3/VfduYxDNcYofd35iW9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDY/Jrrsq7HBfTJXUWOeFmxG689J84TQDgzQrwbk90xgj0Wv500qCf7Q5diyr/O2kkaAVefz6cjNFgpRzUCRIK3JsbqK+X/A+o4puwXvynzcyoUSJFmRzM38O2ovPxT/rPK+kvy3SkalWzTqyk7bJQYkFZJ3pftiBTuyUPD+llc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EczlcoJF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01DB643F7;
	Sat,  2 Aug 2025 11:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127205;
	bh=ugZh/KFY5LMHBtI9abTRXe3/VfduYxDNcYofd35iW9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EczlcoJFbDCzor1UJYwkUixhGK8xZeYVEQgf2zjsTBoG5f3rAGBr7ZW1udpXzsSw+
	 PaCYNja9CGEUBK6a+A2RNVXvzoKvVL32iD4f04zH888Qbzd4RYSYDndijzhdNMtOLt
	 NZnCMhc90PQkjsXpC98MWxGN6mqpLpHHRq5RnIBc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:25 +0200
Subject: [PATCH 63/65] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH
 manually
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-63-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=JegptJK/Wh+Y3waXfEoaG6eqZD0SkxAIytfm8Tqanf8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj/rV2onUyAj1Ve0S8AEhrBpSnCKsJ7/mmH6
 Rix8TpQ+3qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/wAKCRByNAaPFqFW
 PMNMD/sFA/FTtUQGAqxj6hcVIegtJidGsIWt+OwDUeT5SttZ1yGE+mxy2mXyIdarbOQRkDlWrMz
 B3b0dcbhFM4O+ag1TuALQllprFLcTPBkpxlhhWFyJykxUpkFgS1xtTSAd3OtI0g6WSnJbzxDCa0
 C9cO3jGU0z8et+LJRu+rRi4ArnjZjaupgMEge5SBvFM89JAWolUppy8FnADTJtXrxOtgkO85LGj
 Hz0R4ns95HNI772/U/Q8VLX9xYHRe/uCOmhT54PffiApIqBNBR9o2GDX6ztDGTlvoT9hIK+PXdP
 eaa6kiu+1gExaMU7Aah5FJb57ikuODm3RKJ6XU7BZCul4E06C9JqYLCSCibSI+hSpiFe+HKe/Mb
 3Rf8vrJXbkAmPOl1xZ9AmjJZxX9rqKaZfZJIM1cHRyD8D+GY84dqNby5rdwSvWCbp4MRCUq3Hgd
 GhhNicEEatld6fs7qLN4+BWYAuHCmAlTRAC6J63J+0Hq+aVAxo8M6vGGJbzJH2sFw4UWFO8WonQ
 JqhqQPdO/rK7VQd+3mnogYjsUfLjUF2J6M4D8sQrRcYJm1QTvq1ZAwhDmWWw0wW5fdT/AZUrem4
 V6ryoP66+qtsLSW3sfdCkUEvbEq+eSSy9izUSKGe8I0631Q/ugWwMQ6GLbyuDYhoS5q8+3BajEh
 Q+6reTO4wHR944A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
to be set manually by drivers. Drop it from the ipu6-isys driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 24a2ef93474cc400f64eb1d50bc760ee66124d1b..f3f3bc0615e5dc698be5c479dfed8ef2eb49cbfb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1306,7 +1306,6 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	__ipu6_isys_vidioc_try_fmt_meta_cap(av, &format_meta);
 	av->meta_fmt = format_meta.fmt.meta;
 
-	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
 
 	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);

-- 
2.49.0


