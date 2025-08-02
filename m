Return-Path: <linux-media+bounces-38792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA2B18D5A
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDBB27A1BB2
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A381280339;
	Sat,  2 Aug 2025 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LPbIFhtb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A507221FDC;
	Sat,  2 Aug 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127165; cv=none; b=GEIH803T0R0g+4Gn/bSuLDMe1vDfIT5t8R/ntkK8HDH67p9z+ZQwNzt73weOzb4ZW7zGh/JMOErK0qeIP3/fp9cJgud5YC7Vfo2nCXxZnpocvBkshpBmm28OpX1P77vRc0KVW7i74DiKQB52ZyQbHu4AXEE62kCIp95lL6WiDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127165; c=relaxed/simple;
	bh=0Wm4/RCQ2ghH3Q7cxBC1m0z/ZhL6jcKl5NKq/nEvhYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGgWTZxbRXRL094+yw4h4eWtAvt/gMOTP6R5XN2r4tplta5amnRpawB/yzn47QnMpQo5aWcftS5Q6/hJwm3WdS3OULyAXBV83HzkrS6XbsoSkSGZ05JhXLDU61CsvpDY29/Sk6UEI/GT0K9EQxiIpuJs4lp3g0jaCwlVvJqp/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LPbIFhtb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5A563FAA;
	Sat,  2 Aug 2025 11:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127117;
	bh=0Wm4/RCQ2ghH3Q7cxBC1m0z/ZhL6jcKl5NKq/nEvhYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LPbIFhtb7RUjGqKbpUtFGva4zIdr6qXUvUvDFh/PFG+cYiSj+FgviD2jOqNT74Pz5
	 +EpAhg551TGs5l1tFvNkXNdZXegg1X7xQE+psD2h5F2thd2vcKqYdCg481ysT9zIWB
	 BA5sOSjJJ7OZAwyrUS5Xp7/3wwfNh0NkvQpY8PnE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:15 +0200
Subject: [PATCH 53/65] media: stm32: dma2d: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-53-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=0Wm4/RCQ2ghH3Q7cxBC1m0z/ZhL6jcKl5NKq/nEvhYI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+iTlXHGapdCZ3Rdg3aaSFzezt7QmFvOAXT
 3xC8gkCbA6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PKWrD/9Z2LlP8zp6jDlvAZhHO91/5WhfrQjAV4XA1pd7+h7Yt+lXpe+UXlwVv4eI9ip1UQbDJt5
 KAhujyIApfJIsY7phLC1CYJ0wW6deOdDiZkKNLrPF4k8Oapv/g1zuMEZ1AUnk00IBEq2PvKu28u
 j3SSvyUfNmrS32OE4pFBpFkybWnElDESOcP0kI7c6ANVdXCeSSXxIU4jtkLGdKB33hu1IHtvBw4
 lwvcUPkn/LMHTG2E8l4EdRTbrhYSpvmc0xoCg/oWaig36e7FP+u8cRfnFTXxvH0qgINZljl074p
 3iplZeoKfdca8vbTg5MQ2EZvROg46v1T66Mf1Q6sJV14mLZ8hhI45bNg1xO9Z54ctxRvkIcPNKz
 2FxEHGI8LsbEEun4RkALrJOGxqWPRQjH+ds9huudfym5ODBGUhLV2Y097pOcGTBM/Ys9+KJ3VFK
 H4sb+sd3Tn/jZdb25RXLxU3aJkiilRlE2fnMmW99QNbfPYUBYeFbdjZJ2Y0pofrUb5fYxxx7mQL
 HgaFOBdCSMtDlRFU15h4P6W8mJxSaRJ4YlEwxqrOedi1y5jMhjcEoWGsdrDivID8czR0jJ/JrDS
 d3idISE1xsuy9Bbwt53l266mU0QsZoo2f92kbFj1xZTXj4RnmyUnNFU28rEs0c/0tzjjBjHRftc
 YT3FGRxMpHovWtg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index bc0f81e78018b20c38677eaea44358ddad7a9a52..a22f587a5f83fe114e5b1f0a7a0299638701fa71 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -354,7 +354,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 
@@ -379,7 +379,7 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct dma2d_fmt *fmt;
 	enum v4l2_field *field;
 	u32 fourcc = f->fmt.pix.pixelformat;
@@ -422,7 +422,7 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
-	struct dma2d_ctx *ctx = prv;
+	struct dma2d_ctx *ctx = file2ctx(file);
 	struct vb2_queue *vq;
 	struct dma2d_frame *frm;
 	struct dma2d_fmt *fmt;

-- 
2.49.0


