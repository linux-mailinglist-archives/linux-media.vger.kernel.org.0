Return-Path: <linux-media+bounces-38803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E344B18DAE
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD46B3BB9D4
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D66285CBB;
	Sat,  2 Aug 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GWqhxXE8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD721ABC9;
	Sat,  2 Aug 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127266; cv=none; b=tpyutfegL6W38Wm/GTMgzwrhxUhfLL/YrX6cftI9BrzbI2WDtRlUK29K2KoteaazjwpMjHgng3rS4XIrcKGDw+FHqSzByqVqaAOfiWfXJ/RK8uvStvAPv5w+yOtVv4dDNOQ84eblHgVsQjIQ+aibzKGYg55KmPn6GwyjcDIcHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127266; c=relaxed/simple;
	bh=STH9snK10gtXsl0Tkj6PDu+gh4QvT10JOLkLT1jU1Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEPTk/y8shOhE+TH7cGAethFniiMkQHIlKJYbNRJ2j8U8cJBTyVCguDXRF3TENSdz/1PdL65JupMJrx7cyg5DkT/Rv2I4VGZ1HCsOEI6wN22YzvMliH2y+ILRAP1m/eqm+HRK0+s6ApstPQUvGO2K2Esnu3H0TMqeWNnwpJW9cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GWqhxXE8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 022AA467C;
	Sat,  2 Aug 2025 11:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127217;
	bh=STH9snK10gtXsl0Tkj6PDu+gh4QvT10JOLkLT1jU1Tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GWqhxXE8irHZjTwzjw01vy/67LkCfP0pfmdBF7ezLwvyg/uNIQNc+TtMFG9aSke3p
	 NZulEiSKLMd11OqQyyXrX5YsDoHpqfjgzaGJIRoJ7eNeumumTzNYN1CzR1Eil0nkY6
	 WuWgQcq2WLxWmfoETRaKF36owSar3DypycTneFaU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:26 +0200
Subject: [PATCH 64/65] media: staging: ipu7: isys: Don't set
 V4L2_FL_USES_V4L2_FH manually
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-64-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=p6i7vq6AGF+FzCieEq6uikbi372+gaeFOto0fi3HS6o=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj/W2cYpWyQz48RU91dp2DTutVfBmqMPGp+b
 WBa4MAGzGaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/wAKCRByNAaPFqFW
 PMUSD/9KnL/eRvaIxpn9zFQhhB4f8NrjuBZWdfgaHkoDnaAqP1i19guBgcJE3f9tcOMNs3VJfDZ
 OWLWtP5TybilDpd3yyvSJo01d7v5vEUDoelSS6krxhp9p/0AJQxZOiZiXAokVzbF5Zfkdsp7TPk
 luOqefJFbETRJilJyM58wla5jNWMaffzAtHKLBChcvUofPfW1oYsgglGuzmEBcafZThzNqQZK3t
 F5Ma3lrVztWQBboT/QKUGXHnZ1d/2e0t6D3OEU8ZIE7CN/6ZGKOY7bNX6vBKkKOUaPlVh20SzvX
 L6P+QGDBoKq1oI8I3lx0eyIwfS5JeqysXHFE/oMB6LuRHFBqQoIwYdnZyDSmnIan9MrD7XwsSZq
 zrB3YBSb6Z5E2lPzqUYVE/sVJMz0QvQNwNmWm4fLdlSDl7Dwz/5cszF4QFIXWtydcVyJ4l5fOSK
 JKIB7XSb1c2qXe2TIQSCd8yEMmS3h8AouJat8td4arP/Pdi8mb5boQRMOgpeEe9EVCuNCfAkQO4
 EX/HxyD0IWJ4n6tjJ8mzv/SAqJeqI1ZoHooJK7O9bWT5KbqDxQlhL9sUDB7JppOc3Cwct7bRRlB
 2Tycx4bL9LvT1T3yAc/ni3fuaDQxyS6awmAgRZPFb1L3CUZDflx8hBAi8ITTNdMyYqaPij5mAw/
 rRmA9IGOhm6GMYw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
to be set manually by drivers. Drop it from the ipu7-isys driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8756da3a8fb0bfaf88da199b4608c7850888e6a2..6b31c766bc5835f8b6e28ad75efead918934349b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1082,7 +1082,6 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	__ipu_isys_vidioc_try_fmt_vid_cap(av, &format);
 	av->pix_fmt = format.fmt.pix;
 
-	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
 
 	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);

-- 
2.49.0


