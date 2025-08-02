Return-Path: <linux-media+bounces-38749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F750B18BEA
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF445562970
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADFB245031;
	Sat,  2 Aug 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ib/AkYuz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7862222B4;
	Sat,  2 Aug 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126707; cv=none; b=OPNYMkHcYtUppSbcnzHTAFV3QWilqwMT65JI1BpDckTv9Z8pJ3B8Y1ZIP7P/oSfOshFw1fzNdeoSTh0JkFiNVk6/2CuT8pLVlksgfhfqnzrgaKKpE4IFzEhm9VsUz8AbH3jVkcFGSFICGnpvyGe8DfEJfujXcaKdQm3FYI1J+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126707; c=relaxed/simple;
	bh=OM/rWlEKQ8f8HPIrakLZ0WhLkd4bPI6pfIRVXjyRJJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cII0vYPd55dyT1mg9P/rMzy+pgG7zGy1de8NcVLcWMVBLitQW3N9NDELHkfEj22Kz+LT/2+yzHTA5RGULWmEomPOUFkwVMSTrrI/YeBhb7dTuK55Nh2HChx3KKWDCpPFe1TFK0GTzo7dOrPRm5jNc92xazc4flyJwJaU+Vbj/zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ib/AkYuz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FBB9305C;
	Sat,  2 Aug 2025 11:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126658;
	bh=OM/rWlEKQ8f8HPIrakLZ0WhLkd4bPI6pfIRVXjyRJJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ib/AkYuzsNuKTt+lp42wfbltoMJtD5Sd4hsrRjAcqAMEf9SCjBWcBnbuX50vt5Prw
	 0UzYkmWn2/xlChWVoyTLLj93l8MP3fB+FzbSXSdwBfPD7QAOfvUBlQUbRUwAu4vGMY
	 U9QTUuKMZnkPvtECT7b6OO11EXVtXW0+EZ9EHjHY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:32 +0200
Subject: [PATCH 10/65] media: nvidia: tegra-vde: Replace file->private_data
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-10-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=HdAr4YyOcrocqziACBpasSPBf3zgC1qgSFvP/LJn3YQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj41aVvy6Rjwij+qj6xHx4PUZkLAhV3n8zM3
 AY+rL2WR0OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+AAKCRByNAaPFqFW
 PKCIEACt+1llOB444L1nlesDr3J1k37KiM1p/lvO6eUrnhStXc7r3O+OFl93UfBTj2+YjQ1caYY
 lM7LmFaSuXHnMP3gnTbmwc7szdGB5nwBaaWC9+7tE6KC/GuBE1stlpZYiCRrETy9kBkUDbsLcMB
 pSR60pJm6pAxmSr1D3CVrswOfnMdiRhcXVgCs/M6wWA1TZQDGu1qfLANLutXJWrDgLOmQVnVYId
 Xb5aTkYhFgPduOVyaTA0P9lWEOMK8dsJnw7NwPugtQ01l9D6qPoZpRkbOQtm/+6HALFV6kJZPUp
 6Lq3E0DGPuQUILws3PZXfBKC2EtOdoCEkR4VzIfdQ8h5OJdyyuMrIPHpBX9FtUbLtx/6kdQOiBH
 RfDgaYS9Y2A+IfP22V4VXYEl9+g6Db6WmbDheJO4/jdhs8jYwMXmVH1AL6M34Lj49outPp4tIpd
 mhYXqOjZbqNvmBGTF1dG0IKQ8wJQV+IzJbe25fkw7pYBwUv7OE15TBk/xbxjms7VbMXF18QG6S9
 K4HHENXpy5GWX4kBs39GNpKJsBs4YBofJrpM0iHhNZnRFg0cXgqvt+7ryv1721kfPoBeOnx4g9r
 Ak3tPK/iYLW+h4M2QumwTv8Gy8yj077pLHiVgy+bJ58QTy/ARoWSLHL4dpCJH57fMvm59jr2FtI
 fkrkiqymIOZa3eQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

The tegra-vde driver accesses file->private_data in the tegra_open()
function, right after setting the field to &ctx->fh. Replace the
accesses with usage of &ctx->fh.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 531a85e3fe49ad0aa94fb96cbc7a84d474faae94..393dc3f07d5c78ff5ab0ae7b6368914859564458 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -836,10 +836,10 @@ static int tegra_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 
 	tegra_reset_coded_fmt(ctx);
-	tegra_try_coded_fmt(file, file->private_data, &ctx->coded_fmt);
+	tegra_try_coded_fmt(file, &ctx->fh, &ctx->coded_fmt);
 
 	tegra_reset_decoded_fmt(ctx);
-	tegra_try_decoded_fmt(file, file->private_data, &ctx->decoded_fmt);
+	tegra_try_decoded_fmt(file, &ctx->fh, &ctx->decoded_fmt);
 
 	return 0;
 

-- 
2.49.0


