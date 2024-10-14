Return-Path: <linux-media+bounces-19617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C199D0F1
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C54283089
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722F21AB6FD;
	Mon, 14 Oct 2024 15:08:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9421AB517
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918525; cv=none; b=Xbea762DGCCahw45Qqf9bxScrHnkk3j63z2kOaSDBaVZh/OxZf/wx2lkD06oWvlyLFPBQuidXfRsHRxJPd8UhLMu8TUxYJrwWIZckeQmnOzQ5im4D6ipxpnwC0OUVNd8DeQVV3goPHDir3xNZ2jV5WpE3WRLU3YjrJ1UZgKztCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918525; c=relaxed/simple;
	bh=E+8pKaev9/H/KJA5iepiEY7v51VimAnb3hueA3uDgH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YP8a0co10DqE2GQ6ELp7NNWK8ko53o4gYdOaBZ//T1hMOe6su/391x0S2EWMRsLhKRqoTzN3TmS0z+wfdBSKdBLi7FmBy/POYUJnWYPjEoM9IUoFk2L4ik1+eA+AnBWbP8wVMj4MRWkZJZJgQZxubzxe060b3Y+aNQ8Se1RfNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DDBC4CEC3;
	Mon, 14 Oct 2024 15:08:27 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 14 Oct 2024 17:06:33 +0200
Subject: [PATCH 06/10] media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vb2-wait-v1-6-8c3ee25c618c@xs4all.nl>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
In-Reply-To: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Corentin Labbe <clabbe@baylibre.com>, Michael Krufky <mkrufky@linuxtv.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matt Ranostay <matt@ranostay.sg>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugen Hristev <eugen.hristev@collabora.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, 
 Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
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
 Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>, 
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
are NULL") it is no longer needed to set the wait_prepare/finish
vb2_ops callbacks as long as the lock field in vb2_queue is set.

Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
we can safely drop these callbacks.

This simplifies the code and this is a step towards the goal of deleting
these callbacks.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 922c1662f1f038bebeb8abb3a7892e30ee1a0140..05254d8717db85a66b098fa66ce7388e9589d3c3 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -947,8 +947,6 @@ static const struct vb2_ops rtl2832_sdr_vb2_ops = {
 	.buf_queue              = rtl2832_sdr_buf_queue,
 	.start_streaming        = rtl2832_sdr_start_streaming,
 	.stop_streaming         = rtl2832_sdr_stop_streaming,
-	.wait_prepare           = vb2_ops_wait_prepare,
-	.wait_finish            = vb2_ops_wait_finish,
 };
 
 static int rtl2832_sdr_g_tuner(struct file *file, void *priv,

-- 
2.45.2


