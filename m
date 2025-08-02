Return-Path: <linux-media+bounces-38791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0CB18D4F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC9D188177D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613FC28000A;
	Sat,  2 Aug 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="prjR2qME"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1BE21A435;
	Sat,  2 Aug 2025 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754127156; cv=none; b=LQlJ08fXCfvN3vrAvUzVQtp5+EYgwUv5rNeyjHoFsEGFVaa5PfpGobDrYttBgIDd5Ln1rT3eekSWkwLcJh8mUA1gjkGY4bLs3OsOwBg0PGwkX3Al7L9wLBw27YCUqnD/S/hjb9vSXG9MqC9eAkKXzlWlvOvUX34eiHCwOeQpjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754127156; c=relaxed/simple;
	bh=Gv9lbTXbRA6yPchkZ3lS+TOW5kUSmV4lOuM2BHAl6rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vynjxb6dgLHbtxw2LK24qL3HlinmcuTJInhYMq81pV5Fr40zK2+NZHKmAoi7kDpAHGayFbLY/Pa3qlbwimOCGUN3Pfs0UId/2M/mT1OO2LhRRD18heZaGPINjWQE//GcRUqAD8+UdzZXwu3nhiXgJNXynZVLUEB8jHQnJSyea78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=prjR2qME; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACBF54335;
	Sat,  2 Aug 2025 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127108;
	bh=Gv9lbTXbRA6yPchkZ3lS+TOW5kUSmV4lOuM2BHAl6rc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=prjR2qMEqDFUpRAMyRMQie2Nv0psrCvqJct/SVaw4UJ1ZnQGtwemB81zuwIxfhYmA
	 UT5xqYwRWk4pliCkOwyDtOZIWgQ02ealWQ9qhJOwpXw0HYOuCGUOVZSW9E4Olza9D9
	 1kBxLlAAFwfvVJtSUCBdG3fkfFioLN9du/EPH7ao=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:14 +0200
Subject: [PATCH 52/65] media: st: delta: Access v4l2_fh from file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-52-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Gv9lbTXbRA6yPchkZ3lS+TOW5kUSmV4lOuM2BHAl6rc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj9vdOmSnLOUwNwZy60z/PGCExXr86n8sWQN
 A1xKQtQDdiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/QAKCRByNAaPFqFW
 PM7LEADD+AAAj6JZRdP++0YsTAt4fObDpya+EVPh0Cb6TnbK5FzsF4T3lKA6HhvS/ZooVnw7Qt6
 ZpWIDwjI5j7u+vUeC1Do3HIjmUMHE7dy6rPcFFFYJ8i/gRomOvyDoOZs+iBbQp/jNPmks7dD1/0
 XvAOPjC8OwzdASEGKKnYyY7Nlx9vpxlhz/1PlG7c69xJu7QXyP6Oh14W7IEpbixZCSduafhQWDy
 anWvYa0l/kB3kjG0SvbpfqoyCoYyS7dOmtMccsrqvkN6Jg/P3cMEXaqjm7u+YPuwI6hbNbNzThW
 2A6reQ1Ppsheu3gX/KTOuV1GbuBoEtugJuj2SYYrN2tkIwcs+b070nlaGrUjnaCjBR6vrl5rgg9
 3r/tBLDf4cYBpghzvw9pWiNuxfaYcPmGta1lFZvZD6EvNKv7qpCJeubCbOY7+y4fSXliKRWunTv
 A6ghHNWLKUjZeIEG/SB9kODMGrjXog5eevGf8bg3APXdUQewvBQ5wtPLBJ5hDKa/nrrOpatS+73
 S33mhSyYAbGnXk/FvdKW0CyYkhKhFYpAJD/G4PEFPl/KfH0FgL98LWJRailHu0zYoRvIN47ABBk
 A+HmZuJVgKFOB0gKqfCbqdNp9mK0h6YBD2sX8h0jI/O1LvaFppcRnZAMDdydv7fRr+pji3KSqGE
 /UkNMoMG/NlhRdg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

While at it, remove the now unused fh_to_ctx() macro.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/st/sti/delta/delta-v4l2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index adff43271b2dc059abbbf82d90cd13482f6bca30..6c1a53c771f746813a6062cb3ffc139250ff7146 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -24,8 +24,6 @@
 
 #define DELTA_PREFIX "[---:----]"
 
-#define to_ctx(__fh) container_of(__fh, struct delta_ctx, fh)
-
 static inline struct delta_ctx *file_to_ctx(struct file *filp)
 {
 	return container_of(file_to_v4l2_fh(filp), struct delta_ctx, fh);
@@ -727,7 +725,7 @@ static int delta_s_fmt_frame(struct file *file, void *fh, struct v4l2_format *f)
 static int delta_g_selection(struct file *file, void *fh,
 			     struct v4l2_selection *s)
 {
-	struct delta_ctx *ctx = to_ctx(fh);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	struct delta_frameinfo *frameinfo = &ctx->frameinfo;
 	struct v4l2_rect crop;
 
@@ -809,7 +807,7 @@ static int delta_try_decoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int delta_decoder_stop_cmd(struct delta_ctx *ctx, void *fh)
+static int delta_decoder_stop_cmd(struct delta_ctx *ctx)
 {
 	const struct delta_dec *dec = ctx->dec;
 	struct delta_dev *delta = ctx->dev;
@@ -872,14 +870,14 @@ static int delta_decoder_stop_cmd(struct delta_ctx *ctx, void *fh)
 static int delta_decoder_cmd(struct file *file, void *fh,
 			     struct v4l2_decoder_cmd *cmd)
 {
-	struct delta_ctx *ctx = to_ctx(fh);
+	struct delta_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	ret = delta_try_decoder_cmd(file, fh, cmd);
 	if (ret)
 		return ret;
 
-	return delta_decoder_stop_cmd(ctx, fh);
+	return delta_decoder_stop_cmd(ctx);
 }
 
 static int delta_subscribe_event(struct v4l2_fh *fh,

-- 
2.49.0


