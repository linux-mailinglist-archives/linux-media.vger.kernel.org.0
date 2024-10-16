Return-Path: <linux-media+bounces-19769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 478249A0DB8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 17:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C65EB217A5
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E73620F5A3;
	Wed, 16 Oct 2024 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FDFqY+se"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7154F95
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091512; cv=none; b=FsLLXC+hRjqQ9vjX7YmlJrr5JSOruVjk4hnxmcQfy130sdFFzagxMAgJN1HEyhkbpaWQYNgCwuugrEv+hyIV7jesf2cuZx/bCE+YK07S9O/UGljzbMfjo0NkPwLpYUNR91NuZSvbR8ODj78xQ8EyQWnijEKyFAbKXxCk4/biVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091512; c=relaxed/simple;
	bh=Pe8Z4nygWUbRVm1kDtA1l893n9Dm+M6jaLAiMH+1/iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8xHj5V+88M17waF12fqg2Cq6+Po+kmUlcOcJOO+U5Z0uoPy0OqKq+vqofBZ2SHONClo2io5sd25azlo9t8KLWKamNr7PYgpL53qascUlQVZzV0SzRZw250PdV3U1qKtT+KCQKHKVbT5y0pQUsCdGQppCjGY2niOi3AZzm9C6FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FDFqY+se; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44C2BA57;
	Wed, 16 Oct 2024 17:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729091400;
	bh=Pe8Z4nygWUbRVm1kDtA1l893n9Dm+M6jaLAiMH+1/iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDFqY+seMpz7IAzAuGm/2p5q6f/SIWuC2Ixx9QcRC7AOnl9hvRQfAImrZJX/OmwYl
	 o+7IfmaBQrsbT7MPltzA1FKoSRFjW34I/9aUssnyR/praXcO+ZdHAUEF4M2PJiqOkQ
	 CphBktMCY9ZT+49IjFVOhi0eWOriOamBDjVr+CnI=
Date: Wed, 16 Oct 2024 18:11:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shuah <shuah@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matt Ranostay <matt@ranostay.sg>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
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
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/10] media: start work to remove wait_prepare/finish
 callbacks
Message-ID: <20241016151138.GA12400@pendragon.ideasonboard.com>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <33b98fdd-c74f-4c78-858a-c415aa45a71f@kernel.org>
 <b09eb7b6-6fac-47b5-8022-89fb87c2ba1f@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b09eb7b6-6fac-47b5-8022-89fb87c2ba1f@xs4all.nl>

On Tue, Oct 15, 2024 at 05:23:41PM +0200, Hans Verkuil wrote:
> On 15/10/2024 17:13, Shuah wrote:
> > On 10/14/24 09:06, Hans Verkuil wrote:
> >> This patch series makes one change to videobuf2-core.c in vb2_thread()
> >> where wait_prepare/finish was also called. That was missed in the
> >> previous commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> >> are NULL"), but that is needed before we can start removing the
> >> vb2_ops_wait_prepare/finish callbacks from drivers.
> >>
> >> The next 9 patches drop the vb2_ops_wait_prepare/finish callbacks
> >> from the various drivers in the media subsystem.
> >>
> >> After this there are some V4L2 drivers in other subsystems (gadget,
> >> input, staging) that need this change as well, but I'll start on that
> >> when this series is merged.
> >>
> >> There are also a few drivers that set the wait_prepare/finish callbacks
> >> to their own implementation. Those need work as well.
> >>
> >> Since this series touches on almost all V4L2 drivers, it is sent to
> >> a lot of people.
> >>
> >> Regards,
> >>
> >>     Hans
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >> ---
> >> Hans Verkuil (10):
> >>        media: videobuf2-core: update vb2_thread if wait_finish/prepare are NULL
> >>        media: test-drivers: drop vb2_ops_wait_prepare/finish
> >>        media: pci: drop vb2_ops_wait_prepare/finish
> >>        media: usb: drop vb2_ops_wait_prepare/finish
> >>        media: video-i2c: drop vb2_ops_wait_prepare/finish
> >>        media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
> >>        media: platform: drop vb2_ops_wait_prepare/finish
> >>        media: common: saa7146: drop vb2_ops_wait_prepare/finish
> >>        staging: media: drop vb2_ops_wait_prepare/finish
> >>        media: samples: v4l2-pci-skeleton.c: drop vb2_ops_wait_prepare/finish
> >>
> >>   drivers/media/common/saa7146/saa7146_vbi.c                   |  2 --
> >>   drivers/media/common/saa7146/saa7146_video.c                 |  2 --
> >>   drivers/media/common/videobuf2/videobuf2-core.c              | 12 ++++++++----
> >>   drivers/media/dvb-frontends/rtl2832_sdr.c                    |  2 --
> >>   drivers/media/i2c/video-i2c.c                                |  2 --
> >>   drivers/media/pci/bt8xx/bttv-driver.c                        |  2 --
> >>   drivers/media/pci/bt8xx/bttv-vbi.c                           |  2 --
> >>   drivers/media/pci/cobalt/cobalt-v4l2.c                       |  2 --
> >>   drivers/media/pci/cx18/cx18-streams.c                        |  2 --
> >>   drivers/media/pci/cx23885/cx23885-417.c                      |  2 --
> >>   drivers/media/pci/cx23885/cx23885-dvb.c                      |  2 --
> >>   drivers/media/pci/cx23885/cx23885-vbi.c                      |  2 --
> >>   drivers/media/pci/cx23885/cx23885-video.c                    |  2 --
> >>   drivers/media/pci/cx25821/cx25821-video.c                    |  2 --
> >>   drivers/media/pci/cx88/cx88-blackbird.c                      |  2 --
> >>   drivers/media/pci/cx88/cx88-dvb.c                            |  2 --
> >>   drivers/media/pci/cx88/cx88-vbi.c                            |  2 --
> >>   drivers/media/pci/cx88/cx88-video.c                          |  2 --
> >>   drivers/media/pci/dt3155/dt3155.c                            |  2 --
> >>   drivers/media/pci/intel/ipu3/ipu3-cio2.c                     |  2 --
> >>   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c               |  2 --
> >>   drivers/media/pci/mgb4/mgb4_vin.c                            |  2 --
> >>   drivers/media/pci/mgb4/mgb4_vout.c                           |  2 --
> >>   drivers/media/pci/saa7134/saa7134-empress.c                  |  2 --
> >>   drivers/media/pci/saa7134/saa7134-ts.c                       |  2 --
> >>   drivers/media/pci/saa7134/saa7134-vbi.c                      |  2 --
> >>   drivers/media/pci/saa7134/saa7134-video.c                    |  2 --
> >>   drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c               |  2 --
> >>   drivers/media/pci/solo6x10/solo6x10-v4l2.c                   |  2 --
> >>   drivers/media/pci/sta2x11/sta2x11_vip.c                      |  2 --
> >>   drivers/media/pci/tw5864/tw5864-video.c                      |  2 --
> >>   drivers/media/pci/tw68/tw68-video.c                          |  2 --
> >>   drivers/media/pci/tw686x/tw686x-video.c                      |  2 --
> >>   drivers/media/pci/zoran/zoran_driver.c                       |  2 --
> >>   drivers/media/platform/allegro-dvt/allegro-core.c            |  2 --
> >>   drivers/media/platform/amlogic/meson-ge2d/ge2d.c             |  2 --
> >>   drivers/media/platform/amphion/vpu_v4l2.c                    |  2 --
> >>   drivers/media/platform/aspeed/aspeed-video.c                 |  2 --
> >>   drivers/media/platform/atmel/atmel-isi.c                     |  2 --
> >>   drivers/media/platform/broadcom/bcm2835-unicam.c             |  2 --
> >>   drivers/media/platform/chips-media/coda/coda-common.c        |  2 --
> >>   drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c     |  2 --
> >>   drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c     |  2 --
> >>   drivers/media/platform/imagination/e5010-jpeg-enc.c          |  2 --
> >>   drivers/media/platform/intel/pxa_camera.c                    |  2 --
> >>   drivers/media/platform/m2m-deinterlace.c                     |  2 --
> >>   drivers/media/platform/marvell/mcam-core.c                   |  4 ----
> >>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c         |  4 ----
> >>   drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c            |  2 --
> >>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c          |  2 --
> >>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c        |  2 --
> >>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c       |  2 --
> >>   .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  2 --
> >>   drivers/media/platform/microchip/microchip-isc-base.c        |  2 --
> >>   drivers/media/platform/nuvoton/npcm-video.c                  |  2 --
> >>   drivers/media/platform/nvidia/tegra-vde/v4l2.c               |  2 --
> >>   drivers/media/platform/nxp/dw100/dw100.c                     |  2 --
> >>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c               |  2 --
> >>   drivers/media/platform/nxp/imx-pxp.c                         |  2 --
> >>   drivers/media/platform/nxp/imx7-media-csi.c                  |  2 --
> >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c           |  2 --
> >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c         |  2 --
> >>   drivers/media/platform/nxp/mx2_emmaprp.c                     |  2 --
> >>   drivers/media/platform/qcom/camss/camss-video.c              |  2 --
> >>   drivers/media/platform/qcom/venus/vdec.c                     |  2 --
> >>   drivers/media/platform/qcom/venus/venc.c                     |  2 --
> >>   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c         |  2 --
> >>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c           |  2 --
> >>   drivers/media/platform/renesas/rcar_drif.c                   |  2 --
> >>   drivers/media/platform/renesas/rcar_fdp1.c                   |  2 --
> >>   drivers/media/platform/renesas/rcar_jpu.c                    |  2 --
> >>   drivers/media/platform/renesas/renesas-ceu.c                 |  2 --
> >>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c       |  2 --
> >>   drivers/media/platform/renesas/sh_vou.c                      |  2 --
> >>   drivers/media/platform/renesas/vsp1/vsp1_histo.c             |  2 --
> >>   drivers/media/platform/renesas/vsp1/vsp1_video.c             |  2 --
> >>   drivers/media/platform/rockchip/rga/rga-buf.c                |  2 --
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c      |  2 --
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c       |  2 --
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c        |  2 --
> >>   drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c          |  2 --
> >>   drivers/media/platform/samsung/exynos4-is/fimc-capture.c     |  2 --
> >>   drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c   |  2 --
> >>   drivers/media/platform/samsung/exynos4-is/fimc-lite.c        |  2 --
> >>   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c         |  2 --
> >>   drivers/media/platform/samsung/s3c-camif/camif-capture.c     |  2 --
> >>   drivers/media/platform/samsung/s5p-g2d/g2d.c                 |  2 --
> >>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c          |  2 --
> >>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c         |  2 --
> >>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c         |  2 --
> >>   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c             |  2 --
> >>   drivers/media/platform/st/sti/delta/delta-v4l2.c             |  4 ----
> >>   drivers/media/platform/st/sti/hva/hva-v4l2.c                 |  2 --
> >>   drivers/media/platform/st/stm32/dma2d/dma2d.c                |  2 --
> >>   drivers/media/platform/st/stm32/stm32-dcmi.c                 |  2 --
> >>   .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ------
> >>   drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c           |  2 --
> >>   drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |  2 --
> >>   drivers/media/platform/sunxi/sun8i-di/sun8i-di.c             |  2 --
> >>   drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  2 --
> >>   drivers/media/platform/ti/am437x/am437x-vpfe.c               |  2 --
> >>   drivers/media/platform/ti/cal/cal-video.c                    |  2 --
> >>   drivers/media/platform/ti/davinci/vpif_capture.c             |  2 --
> >>   drivers/media/platform/ti/davinci/vpif_display.c             |  2 --
> >>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c        |  2 --
> >>   drivers/media/platform/ti/omap/omap_vout.c                   |  2 --
> >>   drivers/media/platform/ti/vpe/vpe.c                          |  2 --
> >>   drivers/media/platform/verisilicon/hantro_v4l2.c             |  2 --
> >>   drivers/media/platform/via/via-camera.c                      |  2 --
> >>   drivers/media/platform/xilinx/xilinx-dma.c                   |  2 --
> >>   drivers/media/test-drivers/vicodec/vicodec-core.c            |  2 --
> >>   drivers/media/test-drivers/vim2m.c                           |  2 --
> >>   drivers/media/test-drivers/vimc/vimc-capture.c               |  6 ------
> >>   drivers/media/test-drivers/visl/visl-video.c                 |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-meta-cap.c            |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-meta-out.c            |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-sdr-cap.c             |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-touch-cap.c           |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-vbi-cap.c             |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-vbi-out.c             |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-vid-cap.c             |  2 --
> >>   drivers/media/test-drivers/vivid/vivid-vid-out.c             |  2 --
> >>   drivers/media/usb/airspy/airspy.c                            |  2 --
> >>   drivers/media/usb/au0828/au0828-vbi.c                        |  2 --
> >>   drivers/media/usb/au0828/au0828-video.c                      |  2 --
> >>   drivers/media/usb/cx231xx/cx231xx-417.c                      |  2 --
> >>   drivers/media/usb/cx231xx/cx231xx-vbi.c                      |  2 --
> >>   drivers/media/usb/cx231xx/cx231xx-video.c                    |  2 --
> >>   drivers/media/usb/dvb-usb/cxusb-analog.c                     |  2 --
> >>   drivers/media/usb/em28xx/em28xx-vbi.c                        |  2 --
> >>   drivers/media/usb/em28xx/em28xx-video.c                      |  2 --
> >>   drivers/media/usb/go7007/go7007-v4l2.c                       |  2 --
> >>   drivers/media/usb/gspca/gspca.c                              |  2 --
> >>   drivers/media/usb/hackrf/hackrf.c                            |  2 --
> >>   drivers/media/usb/msi2500/msi2500.c                          |  2 --
> >>   drivers/media/usb/pwc/pwc-if.c                               |  2 --
> >>   drivers/media/usb/s2255/s2255drv.c                           |  2 --
> >>   drivers/media/usb/stk1160/stk1160-v4l.c                      |  2 --
> >>   drivers/media/usb/usbtv/usbtv-video.c                        |  2 --
> >>   drivers/media/usb/uvc/uvc_queue.c                            |  4 ----
> >>   drivers/staging/media/atomisp/pci/atomisp_fops.c             |  2 --
> >>   drivers/staging/media/deprecated/atmel/atmel-isc-base.c      |  2 --
> >>   drivers/staging/media/imx/imx-media-capture.c                |  2 --
> >>   drivers/staging/media/imx/imx-media-csc-scaler.c             |  2 --
> >>   drivers/staging/media/ipu3/ipu3-v4l2.c                       |  2 --
> >>   drivers/staging/media/meson/vdec/vdec.c                      |  2 --
> >>   drivers/staging/media/rkvdec/rkvdec.c                        |  2 --
> >>   drivers/staging/media/starfive/camss/stf-video.c             |  2 --
> >>   drivers/staging/media/sunxi/cedrus/cedrus_video.c            |  2 --
> >>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    |  2 --
> >>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c     |  2 --
> >>   drivers/staging/media/tegra-video/vi.c                       |  2 --
> >>   samples/v4l/v4l2-pci-skeleton.c                              |  6 +-----
> >>   153 files changed, 9 insertions(+), 327 deletions(-)
> >> ---
> >> base-commit: bcd4f091cf1ea7184d813afc115af82ac9326b25
> >> change-id: 20241014-vb2-wait-445a4ead0c4f
> >>
> >> Best regards,
> > 
> > That is a long list :)
> > 
> > I am seeing the following drivers that use .wait_prepare
> > and .wait_finish in Linux 6.12-rc3 - should they be included
> > in this series.
> > 
> > input drivers:
> > drivers/input/rmi4/rmi_f54.c
> > drivers/input/touchscreen/atmel_mxt_ts.c
> > drivers/input/touchscreen/sur40.c
> > 
> > staging drivers:
> > drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c

Now that the unicam driver is upstream, bcm2835-camera is getting
really deprecated. Should we consider its removal ?

> I'll do those separately, let's start with the main bulk in the media
> subsystem :-)
> 
> If you're curious, the remainder is here:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2_wait
> 
> But it needs a bit more work, since there are some complications around
> a DVB driver that I don't fully understand yet.

-- 
Regards,

Laurent Pinchart

