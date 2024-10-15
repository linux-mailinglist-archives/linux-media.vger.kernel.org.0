Return-Path: <linux-media+bounces-19684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB799F105
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D961F230AA
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 15:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645291B3942;
	Tue, 15 Oct 2024 15:24:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3BF1CB9F0
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005842; cv=none; b=tsz5r8E1KvcAidfNnEyZcRQQs0qBEbk1owTs8sKSQ88FdvZq4dBjgL+UuLbujIXfGFOHEQwjIbHsOSzxC0yDiVJ8YYBzRXY7WwC7v0ORQBs8rhgXm5JO2xyr/gDOwRTddrHhLWJVKR09u3vIrXhbLazPporfVGRd1GI5z8JoKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005842; c=relaxed/simple;
	bh=JhgtpjomIgUyv54OyG8xJHZFLxauSsPWlpYJbLcuWzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI8hHpcYAJp6cWhpBAAtkYavWedaYAcO0lSvcblbLj7ob1YngreHiHuM7PaS1XH6t/gKtli8KiCIXaFNUNvBIewg4HNfgma3CYlNfavIGmUqYRoCLnK3Jdt3Ut/i2kJOKjiE5+zrbWgZvqg0uG/Av0l7NL0tfPYXJXArQYy55SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16245C4CED0;
	Tue, 15 Oct 2024 15:23:42 +0000 (UTC)
Message-ID: <b09eb7b6-6fac-47b5-8022-89fb87c2ba1f@xs4all.nl>
Date: Tue, 15 Oct 2024 17:23:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] media: start work to remove wait_prepare/finish
 callbacks
To: Shuah <shuah@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
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
 Andrey Utkin <andrey_utkin@fastmail.com>, Ismael Luceno
 <ismael@iodev.co.uk>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Corentin Labbe <clabbe@baylibre.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matt Ranostay <matt@ranostay.sg>, Michael Tretter
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
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
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, Devarsh Thakkar
 <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>,
 Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
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
Cc: linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <33b98fdd-c74f-4c78-858a-c415aa45a71f@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <33b98fdd-c74f-4c78-858a-c415aa45a71f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/10/2024 17:13, Shuah wrote:
> On 10/14/24 09:06, Hans Verkuil wrote:
>> This patch series makes one change to videobuf2-core.c in vb2_thread()
>> where wait_prepare/finish was also called. That was missed in the
>> previous commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
>> are NULL"), but that is needed before we can start removing the
>> vb2_ops_wait_prepare/finish callbacks from drivers.
>>
>> The next 9 patches drop the vb2_ops_wait_prepare/finish callbacks
>> from the various drivers in the media subsystem.
>>
>> After this there are some V4L2 drivers in other subsystems (gadget,
>> input, staging) that need this change as well, but I'll start on that
>> when this series is merged.
>>
>> There are also a few drivers that set the wait_prepare/finish callbacks
>> to their own implementation. Those need work as well.
>>
>> Since this series touches on almost all V4L2 drivers, it is sent to
>> a lot of people.
>>
>> Regards,
>>
>>     Hans
>>
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> ---
>> Hans Verkuil (10):
>>        media: videobuf2-core: update vb2_thread if wait_finish/prepare are NULL
>>        media: test-drivers: drop vb2_ops_wait_prepare/finish
>>        media: pci: drop vb2_ops_wait_prepare/finish
>>        media: usb: drop vb2_ops_wait_prepare/finish
>>        media: video-i2c: drop vb2_ops_wait_prepare/finish
>>        media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
>>        media: platform: drop vb2_ops_wait_prepare/finish
>>        media: common: saa7146: drop vb2_ops_wait_prepare/finish
>>        staging: media: drop vb2_ops_wait_prepare/finish
>>        media: samples: v4l2-pci-skeleton.c: drop vb2_ops_wait_prepare/finish
>>
>>   drivers/media/common/saa7146/saa7146_vbi.c                   |  2 --
>>   drivers/media/common/saa7146/saa7146_video.c                 |  2 --
>>   drivers/media/common/videobuf2/videobuf2-core.c              | 12 ++++++++----
>>   drivers/media/dvb-frontends/rtl2832_sdr.c                    |  2 --
>>   drivers/media/i2c/video-i2c.c                                |  2 --
>>   drivers/media/pci/bt8xx/bttv-driver.c                        |  2 --
>>   drivers/media/pci/bt8xx/bttv-vbi.c                           |  2 --
>>   drivers/media/pci/cobalt/cobalt-v4l2.c                       |  2 --
>>   drivers/media/pci/cx18/cx18-streams.c                        |  2 --
>>   drivers/media/pci/cx23885/cx23885-417.c                      |  2 --
>>   drivers/media/pci/cx23885/cx23885-dvb.c                      |  2 --
>>   drivers/media/pci/cx23885/cx23885-vbi.c                      |  2 --
>>   drivers/media/pci/cx23885/cx23885-video.c                    |  2 --
>>   drivers/media/pci/cx25821/cx25821-video.c                    |  2 --
>>   drivers/media/pci/cx88/cx88-blackbird.c                      |  2 --
>>   drivers/media/pci/cx88/cx88-dvb.c                            |  2 --
>>   drivers/media/pci/cx88/cx88-vbi.c                            |  2 --
>>   drivers/media/pci/cx88/cx88-video.c                          |  2 --
>>   drivers/media/pci/dt3155/dt3155.c                            |  2 --
>>   drivers/media/pci/intel/ipu3/ipu3-cio2.c                     |  2 --
>>   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c               |  2 --
>>   drivers/media/pci/mgb4/mgb4_vin.c                            |  2 --
>>   drivers/media/pci/mgb4/mgb4_vout.c                           |  2 --
>>   drivers/media/pci/saa7134/saa7134-empress.c                  |  2 --
>>   drivers/media/pci/saa7134/saa7134-ts.c                       |  2 --
>>   drivers/media/pci/saa7134/saa7134-vbi.c                      |  2 --
>>   drivers/media/pci/saa7134/saa7134-video.c                    |  2 --
>>   drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c               |  2 --
>>   drivers/media/pci/solo6x10/solo6x10-v4l2.c                   |  2 --
>>   drivers/media/pci/sta2x11/sta2x11_vip.c                      |  2 --
>>   drivers/media/pci/tw5864/tw5864-video.c                      |  2 --
>>   drivers/media/pci/tw68/tw68-video.c                          |  2 --
>>   drivers/media/pci/tw686x/tw686x-video.c                      |  2 --
>>   drivers/media/pci/zoran/zoran_driver.c                       |  2 --
>>   drivers/media/platform/allegro-dvt/allegro-core.c            |  2 --
>>   drivers/media/platform/amlogic/meson-ge2d/ge2d.c             |  2 --
>>   drivers/media/platform/amphion/vpu_v4l2.c                    |  2 --
>>   drivers/media/platform/aspeed/aspeed-video.c                 |  2 --
>>   drivers/media/platform/atmel/atmel-isi.c                     |  2 --
>>   drivers/media/platform/broadcom/bcm2835-unicam.c             |  2 --
>>   drivers/media/platform/chips-media/coda/coda-common.c        |  2 --
>>   drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c     |  2 --
>>   drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c     |  2 --
>>   drivers/media/platform/imagination/e5010-jpeg-enc.c          |  2 --
>>   drivers/media/platform/intel/pxa_camera.c                    |  2 --
>>   drivers/media/platform/m2m-deinterlace.c                     |  2 --
>>   drivers/media/platform/marvell/mcam-core.c                   |  4 ----
>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c         |  4 ----
>>   drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c            |  2 --
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c          |  2 --
>>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c        |  2 --
>>   .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c       |  2 --
>>   .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  2 --
>>   drivers/media/platform/microchip/microchip-isc-base.c        |  2 --
>>   drivers/media/platform/nuvoton/npcm-video.c                  |  2 --
>>   drivers/media/platform/nvidia/tegra-vde/v4l2.c               |  2 --
>>   drivers/media/platform/nxp/dw100/dw100.c                     |  2 --
>>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c               |  2 --
>>   drivers/media/platform/nxp/imx-pxp.c                         |  2 --
>>   drivers/media/platform/nxp/imx7-media-csi.c                  |  2 --
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c           |  2 --
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c         |  2 --
>>   drivers/media/platform/nxp/mx2_emmaprp.c                     |  2 --
>>   drivers/media/platform/qcom/camss/camss-video.c              |  2 --
>>   drivers/media/platform/qcom/venus/vdec.c                     |  2 --
>>   drivers/media/platform/qcom/venus/venc.c                     |  2 --
>>   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c         |  2 --
>>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c           |  2 --
>>   drivers/media/platform/renesas/rcar_drif.c                   |  2 --
>>   drivers/media/platform/renesas/rcar_fdp1.c                   |  2 --
>>   drivers/media/platform/renesas/rcar_jpu.c                    |  2 --
>>   drivers/media/platform/renesas/renesas-ceu.c                 |  2 --
>>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c       |  2 --
>>   drivers/media/platform/renesas/sh_vou.c                      |  2 --
>>   drivers/media/platform/renesas/vsp1/vsp1_histo.c             |  2 --
>>   drivers/media/platform/renesas/vsp1/vsp1_video.c             |  2 --
>>   drivers/media/platform/rockchip/rga/rga-buf.c                |  2 --
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c      |  2 --
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c       |  2 --
>>   drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c        |  2 --
>>   drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c          |  2 --
>>   drivers/media/platform/samsung/exynos4-is/fimc-capture.c     |  2 --
>>   drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c   |  2 --
>>   drivers/media/platform/samsung/exynos4-is/fimc-lite.c        |  2 --
>>   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c         |  2 --
>>   drivers/media/platform/samsung/s3c-camif/camif-capture.c     |  2 --
>>   drivers/media/platform/samsung/s5p-g2d/g2d.c                 |  2 --
>>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c          |  2 --
>>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c         |  2 --
>>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c         |  2 --
>>   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c             |  2 --
>>   drivers/media/platform/st/sti/delta/delta-v4l2.c             |  4 ----
>>   drivers/media/platform/st/sti/hva/hva-v4l2.c                 |  2 --
>>   drivers/media/platform/st/stm32/dma2d/dma2d.c                |  2 --
>>   drivers/media/platform/st/stm32/stm32-dcmi.c                 |  2 --
>>   .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ------
>>   drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c           |  2 --
>>   drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |  2 --
>>   drivers/media/platform/sunxi/sun8i-di/sun8i-di.c             |  2 --
>>   drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  2 --
>>   drivers/media/platform/ti/am437x/am437x-vpfe.c               |  2 --
>>   drivers/media/platform/ti/cal/cal-video.c                    |  2 --
>>   drivers/media/platform/ti/davinci/vpif_capture.c             |  2 --
>>   drivers/media/platform/ti/davinci/vpif_display.c             |  2 --
>>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c        |  2 --
>>   drivers/media/platform/ti/omap/omap_vout.c                   |  2 --
>>   drivers/media/platform/ti/vpe/vpe.c                          |  2 --
>>   drivers/media/platform/verisilicon/hantro_v4l2.c             |  2 --
>>   drivers/media/platform/via/via-camera.c                      |  2 --
>>   drivers/media/platform/xilinx/xilinx-dma.c                   |  2 --
>>   drivers/media/test-drivers/vicodec/vicodec-core.c            |  2 --
>>   drivers/media/test-drivers/vim2m.c                           |  2 --
>>   drivers/media/test-drivers/vimc/vimc-capture.c               |  6 ------
>>   drivers/media/test-drivers/visl/visl-video.c                 |  2 --
>>   drivers/media/test-drivers/vivid/vivid-meta-cap.c            |  2 --
>>   drivers/media/test-drivers/vivid/vivid-meta-out.c            |  2 --
>>   drivers/media/test-drivers/vivid/vivid-sdr-cap.c             |  2 --
>>   drivers/media/test-drivers/vivid/vivid-touch-cap.c           |  2 --
>>   drivers/media/test-drivers/vivid/vivid-vbi-cap.c             |  2 --
>>   drivers/media/test-drivers/vivid/vivid-vbi-out.c             |  2 --
>>   drivers/media/test-drivers/vivid/vivid-vid-cap.c             |  2 --
>>   drivers/media/test-drivers/vivid/vivid-vid-out.c             |  2 --
>>   drivers/media/usb/airspy/airspy.c                            |  2 --
>>   drivers/media/usb/au0828/au0828-vbi.c                        |  2 --
>>   drivers/media/usb/au0828/au0828-video.c                      |  2 --
>>   drivers/media/usb/cx231xx/cx231xx-417.c                      |  2 --
>>   drivers/media/usb/cx231xx/cx231xx-vbi.c                      |  2 --
>>   drivers/media/usb/cx231xx/cx231xx-video.c                    |  2 --
>>   drivers/media/usb/dvb-usb/cxusb-analog.c                     |  2 --
>>   drivers/media/usb/em28xx/em28xx-vbi.c                        |  2 --
>>   drivers/media/usb/em28xx/em28xx-video.c                      |  2 --
>>   drivers/media/usb/go7007/go7007-v4l2.c                       |  2 --
>>   drivers/media/usb/gspca/gspca.c                              |  2 --
>>   drivers/media/usb/hackrf/hackrf.c                            |  2 --
>>   drivers/media/usb/msi2500/msi2500.c                          |  2 --
>>   drivers/media/usb/pwc/pwc-if.c                               |  2 --
>>   drivers/media/usb/s2255/s2255drv.c                           |  2 --
>>   drivers/media/usb/stk1160/stk1160-v4l.c                      |  2 --
>>   drivers/media/usb/usbtv/usbtv-video.c                        |  2 --
>>   drivers/media/usb/uvc/uvc_queue.c                            |  4 ----
>>   drivers/staging/media/atomisp/pci/atomisp_fops.c             |  2 --
>>   drivers/staging/media/deprecated/atmel/atmel-isc-base.c      |  2 --
>>   drivers/staging/media/imx/imx-media-capture.c                |  2 --
>>   drivers/staging/media/imx/imx-media-csc-scaler.c             |  2 --
>>   drivers/staging/media/ipu3/ipu3-v4l2.c                       |  2 --
>>   drivers/staging/media/meson/vdec/vdec.c                      |  2 --
>>   drivers/staging/media/rkvdec/rkvdec.c                        |  2 --
>>   drivers/staging/media/starfive/camss/stf-video.c             |  2 --
>>   drivers/staging/media/sunxi/cedrus/cedrus_video.c            |  2 --
>>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    |  2 --
>>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c     |  2 --
>>   drivers/staging/media/tegra-video/vi.c                       |  2 --
>>   samples/v4l/v4l2-pci-skeleton.c                              |  6 +-----
>>   153 files changed, 9 insertions(+), 327 deletions(-)
>> ---
>> base-commit: bcd4f091cf1ea7184d813afc115af82ac9326b25
>> change-id: 20241014-vb2-wait-445a4ead0c4f
>>
>> Best regards,
> 
> That is a long list :)
> 
> I am seeing the following drivers that use .wait_prepare
> and .wait_finish in Linux 6.12-rc3 - should they be included
> in this series.
> 
> input drivers:
> drivers/input/rmi4/rmi_f54.c
> drivers/input/touchscreen/atmel_mxt_ts.c
> drivers/input/touchscreen/sur40.c
> 
> staging drivers:
> drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c

I'll do those separately, let's start with the main bulk in the media
subsystem :-)

If you're curious, the remainder is here:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2_wait

But it needs a bit more work, since there are some complications around
a DVB driver that I don't fully understand yet.

Regards,

	Hans

> 
> thanks,
> -- Shuah


