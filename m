Return-Path: <linux-media+bounces-38760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F00B18C42
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B67DA4E048D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CB02673B7;
	Sat,  2 Aug 2025 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="efEEkJTn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9EF207DEE;
	Sat,  2 Aug 2025 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126823; cv=none; b=U+jODViItz5DqsJwxZ6e5jeXOzZ3BTy3Ta7lB3rrQbOx2GADJGLRbQGefWIf1Q2Llpq4nsw/mcnwoSicVURkbEmnQi0d5M+o/pFTi3A6x23jXq5XcY0sa+8vhvBhs6XmIJNAomsMir6lM6hYPZs5qNIF4YvBq+RZRYHlj5zKnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126823; c=relaxed/simple;
	bh=YeeZiet6PqHm7IlGh7t3GZOdydEI6jy4AdesJo+UFJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVXT65AUeD4WkCNtL9klI2tEBHwtaGhYLv4eBEjC6CVzZFEXTeqUIvUWaRDtq1akz4IG26C0ENX0q1qRlgdqiX9Oq9rIjJxlJZNtOIS+tUp3nQgREn/5Q56Im59AMvELEUQwRowOk+/CMIqBxY5diHXb6L6ZD8tUJcpzqn/lCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=efEEkJTn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C35D330E;
	Sat,  2 Aug 2025 11:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126774;
	bh=YeeZiet6PqHm7IlGh7t3GZOdydEI6jy4AdesJo+UFJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=efEEkJTnS1kS5gUzaXOmI/yYslA+2pJMaHIkGKProANNbr8dxKaCBtqnVHS7MQhUm
	 5O2inCnrkmxZUR7Sb/afzgyTKrbaPNf/CC1zw3zEX7ePOorKxhty47n27+ZtwThhbW
	 xJ9x9IaW2d+ETCWGrE3pPgiKenybAl/eZ+xNKYmQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:43 +0200
Subject: [PATCH 21/65] media: chips-media: wave5: Pass file pointer to
 wave5_cleanup_instance()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-21-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=sFLeSeZ18AiPz7TNtzZuErYTeuXEDyYERBW9KVUCez8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj5Ab8WMNqTk1vrNJmzEF9fusCZ5AJs5tg8p
 ikoDaHa4TGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+QAKCRByNAaPFqFW
 PIGXD/9X1mdSs4tmw4s1JTfYvMbuDI1kxi3A97kXvrt+El+sQRTisOHlSxLE9USoyAGm9PnoFPY
 icrGza2HD8EwUhtANb4EwK4SX8gRpvg5DXsHiY+BzBm4ZVvbrn4YKQ8EspQAqrqPqNpRCC3jLzn
 0GRaHqxDXvUIkwHB48fJQ6GV3QDhI0wZH4KOeyPYnI+UAT/tN3QLKewQVSIxCvc+x44Uz1UIfYt
 kdVvO1fp4phNaCAUHr+TNYEglxeQRmyTjF7EFg8glg2DIQvarhZjR2idgNmJRc32RfKKlrWhLLG
 qsc3G5XT4rTHdpVwmtUQZodlMjwJIMrLeeq3gmQLcuVkPx7WrqJFWrykMYjVSJW9boC6wQNseOL
 g/jwwARgjsbT4VVBTM34U4UGM25/qXegXPcvFArnizqPHj2jNKsfNiwqCk9hQvsaZb0hejeg2C6
 PIHxrsXkFRQdQNuT5CuoeTdUazuF9Y8PozrVwKktzkTD3iCYWR6uVAZwa5j/+W0fWDzMJe3etdR
 iL0DtcbzUnBRXuciDmUfTXXz4QqjEoF7LYYGV9gHpobdDmtnG6aN+YRDMpFr8/cXnc76JpLWK1O
 iZ4WMJ6IpVenQcUxz2evwcVueKdYxxj8eIkzeEvX3GLQmspDOksNr43SNDrl2k/d9vKpDQ7djH2
 UWeorQDKZwyuLsQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

In preparation for a tree-wide rework automated with coccinelle that
will need to access a struct file pointer in the
wave5_cleanup_instance() function, pass it from the callers. There is
not functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/chips-media/wave5/wave5-helper.c  | 4 ++--
 drivers/media/platform/chips-media/wave5/wave5-helper.h  | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 031dea0ee61c6c5afddf7ff47d67d85826f16d8d..ed8ff04a899da0a3c9e0f037dac2c9548c98920f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,7 +27,7 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
-void wave5_cleanup_instance(struct vpu_instance *inst)
+void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
 
@@ -78,7 +78,7 @@ int wave5_vpu_release_device(struct file *filp,
 		}
 	}
 
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 
 	return ret;
 }
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 9937fce553fc33000bd31abcfc6d7345f6f7e485..976a402e426ff329490717925a08a76d777cbe3e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -14,7 +14,7 @@
 #define MAX_FMTS	12
 
 const char *state_to_str(enum vpu_instance_state state);
-void wave5_cleanup_instance(struct vpu_instance *inst);
+void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp);
 int wave5_vpu_release_device(struct file *filp,
 			     int (*close_func)(struct vpu_instance *inst, u32 *fail_res),
 			     char *name);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index fd71f0c43ac37a0bb56f669d4b89d6054cb181d5..f3188d720ed3e183f3400816a9c939014213711d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1840,7 +1840,7 @@ static int wave5_vpu_open_dec(struct file *filp)
 	return 0;
 
 cleanup_inst:
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 	return ret;
 }
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856c5329b2c6007649285a28749b6aa..b69a1206fa12c2ff5f3a32d269b8fd3b80a597aa 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1784,7 +1784,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 	return 0;
 
 cleanup_inst:
-	wave5_cleanup_instance(inst);
+	wave5_cleanup_instance(inst, filp);
 	return ret;
 }
 

-- 
2.49.0


