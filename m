Return-Path: <linux-media+bounces-15971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20994B829
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 09:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 066D3B25D44
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 07:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E353188011;
	Thu,  8 Aug 2024 07:46:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4B187FE7
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723103191; cv=none; b=Y8qi8s/dvxOZlxYFqSF8Ef5atcDPNIg5kJ7mbF6eiCMFIrPB+UQvoxtE69p+k1uU1NGBKyq6yh7yKgdgS7IzaApIyjDZcFcVD0lLZOivhpsjcu0Ye7yNjX6kjddaxwuTI77fgIw0z3HMW2GnyH2osiakJUGpXq10mFdUppAWkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723103191; c=relaxed/simple;
	bh=+rRYjrNNkzXXCGuvtbBN/935mj3Bw8RAiq2gJSaRK00=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TN6mPe5ifL9QXtwSrmMMC+nAVfonAUUB7NOZq3mz4ATuJpIfmuI68mmX2pNO6yV7fw7F9Htxcav1Htty/X14KxZTzEIpCNQc2dOV7esSNlF0lUdP6T8hg209f9OSriaAVqWJ/LyN+s7WynqvwYcd+1SDRLoyqE0iCee4oYD6idY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C46C32782;
	Thu,  8 Aug 2024 07:46:29 +0000 (UTC)
Message-ID: <ce1d3813-dd20-49f2-b943-005597c41e74@xs4all.nl>
Date: Thu, 8 Aug 2024 09:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ricardo Ribalda <ribalda@chromium.org>, Roman Smirnov <r.smirnov@omp.ru>,
 Wolfram Sang <wsa@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.12] Various fixes and enhancements
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If there are no objections, then I'll push this to the media staging tree
tomorrow (Friday).

Regards,

	Hans

The following changes since commit e7311aa47a6ac355558bc65512aa7c381f8506ec:

  media: siano: Simplify smscore_load_firmware_from_file (2024-08-05 16:30:24 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.12a

for you to fetch changes up to c0c95b6b1b33daa3bb40ac96b31cbd062a5a0c81:

  media: ti: cal: use 'time_left' variable with wait_event_timeout() (2024-08-08 09:26:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Biju Das (2):
      media: dt-bindings: media: renesas,vsp1: Document RZ/G2UL VSPD bindings
      media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD bindings

Bryan O'Donoghue (2):
      media: qcom: camss: Remove use_count guard in stop_streaming
      media: qcom: camss: Fix ordering of pm_runtime_enable

Chen Ni (1):
      media: i2c: thp7312: Convert comma to semicolon

Christian Hewitt (2):
      dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC family and update GXL
      media: meson: vdec: add GXLX SoC platform

Christophe JAILLET (3):
      media: i2c: tvp5150: Constify some structures
      media: platform: allegro-dvt: Constify struct regmap_config
      media: ti: cal: Constify struct media_entity_operations

Colin Ian King (2):
      media: i2c: GC05A2: Fix spelling mistake "Horizental" -> "Horizontal"
      media: i2c: GC08A3: Fix spelling mistake "STRAEMING_REG" -> "STREAMING_REG"

Fritz Koenig (1):
      Documentation: media: Fix v4l2_av1_segmentation table formatting

Geert Uytterhoeven (1):
      media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should depend on ARCH_BCM2835

Hans Verkuil (4):
      Documentation: media: vivid.rst: update TODO list
      Documentation: media: add missing V4L2_BUF_CAP_ flags
      media: v4l2-core: v4l2-ioctl: missing ', ' in create_bufs logging
      Documentation: media: move Memory Consistency Flags

Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      media: docs: Fix newline typos in capture.c

Junlin Li (2):
      drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
      drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error

Kuninori Morimoto (4):
      media: platform: microchip: use for_each_endpoint_of_node()
      media: platform: ti: use for_each_endpoint_of_node()
      media: platform: xilinx: use for_each_endpoint_of_node()
      staging: media: atmel: use for_each_endpoint_of_node()

Michael Tretter (1):
      media: verisilicon: Use fourcc format string

Ricardo Ribalda (1):
      media: imx-pxp: Rewrite coeff expression

Roman Smirnov (1):
      Revert "media: tuners: fix error return code of hybrid_tuner_request_state()"

Sakari Ailus (1):
      media: Documentation: Fix spelling of "blanking"

Uwe Kleine-König (1):
      media: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Wolfram Sang (8):
      media: allegro: use 'time_left' variable with wait_for_completion_timeout()
      media: atmel-isi: use 'time_left' variable with wait_for_completion_timeout()
      media: bdisp: use 'time_left' variable with wait_event_timeout()
      media: fimc-is: use 'time_left' variable with wait_event_timeout()
      media: platform: exynos-gsc: use 'time_left' variable with wait_event_timeout()
      media: solo6x10: use 'time_left' variable with wait_for_completion_timeout()
      media: tegra-vde: use 'time_left' variable with wait_for_completion_interruptible_timeout()
      media: ti: cal: use 'time_left' variable with wait_event_timeout()

 Documentation/admin-guide/media/vivid.rst                           |  4 ++--
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml        |  3 ++-
 Documentation/devicetree/bindings/media/renesas,fcp.yaml            |  2 ++
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml           |  1 +
 Documentation/userspace-api/media/v4l/buffer.rst                    | 35 -----------------------------------
 Documentation/userspace-api/media/v4l/capture.c.rst                 |  6 +++---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |  2 +-
 Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst   |  2 +-
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst            | 40 ++++++++++++++++++++++++++++++++--------
 drivers/media/dvb-frontends/a8293.c                                 |  2 +-
 drivers/media/dvb-frontends/af9013.c                                |  2 +-
 drivers/media/dvb-frontends/af9033.c                                |  2 +-
 drivers/media/dvb-frontends/au8522_decoder.c                        |  2 +-
 drivers/media/dvb-frontends/cxd2099.c                               |  2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c                         |  2 +-
 drivers/media/dvb-frontends/lgdt3306a.c                             |  2 +-
 drivers/media/dvb-frontends/lgdt330x.c                              |  2 +-
 drivers/media/dvb-frontends/mn88472.c                               |  2 +-
 drivers/media/dvb-frontends/mn88473.c                               |  2 +-
 drivers/media/dvb-frontends/mxl692.c                                |  2 +-
 drivers/media/dvb-frontends/rtl2830.c                               |  4 ++--
 drivers/media/dvb-frontends/rtl2832.c                               |  4 ++--
 drivers/media/dvb-frontends/si2165.c                                |  2 +-
 drivers/media/dvb-frontends/si2168.c                                |  2 +-
 drivers/media/dvb-frontends/sp2.c                                   |  2 +-
 drivers/media/dvb-frontends/stv090x.c                               |  2 +-
 drivers/media/dvb-frontends/stv6110x.c                              |  2 +-
 drivers/media/dvb-frontends/tda10071.c                              |  2 +-
 drivers/media/dvb-frontends/ts2020.c                                |  4 ++--
 drivers/media/i2c/ad5820.c                                          |  4 ++--
 drivers/media/i2c/adp1653.c                                         |  2 +-
 drivers/media/i2c/adv7170.c                                         |  4 ++--
 drivers/media/i2c/adv7175.c                                         |  4 ++--
 drivers/media/i2c/adv7183.c                                         |  4 ++--
 drivers/media/i2c/adv7343.c                                         |  4 ++--
 drivers/media/i2c/adv7393.c                                         |  4 ++--
 drivers/media/i2c/adv7511-v4l2.c                                    |  2 +-
 drivers/media/i2c/adv7842.c                                         |  2 +-
 drivers/media/i2c/ak881x.c                                          |  4 ++--
 drivers/media/i2c/bt819.c                                           |  6 +++---
 drivers/media/i2c/bt856.c                                           |  2 +-
 drivers/media/i2c/bt866.c                                           |  2 +-
 drivers/media/i2c/cs3308.c                                          |  2 +-
 drivers/media/i2c/cs5345.c                                          |  2 +-
 drivers/media/i2c/cs53l32a.c                                        |  2 +-
 drivers/media/i2c/cx25840/cx25840-core.c                            |  2 +-
 drivers/media/i2c/ds90ub913.c                                       |  5 ++++-
 drivers/media/i2c/dw9714.c                                          |  4 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c                            |  2 +-
 drivers/media/i2c/gc05a2.c                                          |  2 +-
 drivers/media/i2c/gc08a3.c                                          |  2 +-
 drivers/media/i2c/imx274.c                                          |  2 +-
 drivers/media/i2c/isl7998x.c                                        |  4 ++--
 drivers/media/i2c/ks0127.c                                          |  6 +++---
 drivers/media/i2c/lm3560.c                                          |  4 ++--
 drivers/media/i2c/lm3646.c                                          |  2 +-
 drivers/media/i2c/m52790.c                                          |  2 +-
 drivers/media/i2c/max2175.c                                         |  4 ++--
 drivers/media/i2c/ml86v7667.c                                       |  4 ++--
 drivers/media/i2c/msp3400-driver.c                                  |  2 +-
 drivers/media/i2c/mt9m001.c                                         |  2 +-
 drivers/media/i2c/mt9m111.c                                         |  2 +-
 drivers/media/i2c/mt9t112.c                                         |  2 +-
 drivers/media/i2c/mt9v011.c                                         |  2 +-
 drivers/media/i2c/ov13858.c                                         |  4 ++--
 drivers/media/i2c/ov2640.c                                          |  2 +-
 drivers/media/i2c/ov2659.c                                          |  4 ++--
 drivers/media/i2c/ov5640.c                                          |  4 ++--
 drivers/media/i2c/ov5645.c                                          |  2 +-
 drivers/media/i2c/ov5647.c                                          |  2 +-
 drivers/media/i2c/ov6650.c                                          |  2 +-
 drivers/media/i2c/ov7640.c                                          |  2 +-
 drivers/media/i2c/ov772x.c                                          |  2 +-
 drivers/media/i2c/ov7740.c                                          |  2 +-
 drivers/media/i2c/ov9640.c                                          |  2 +-
 drivers/media/i2c/ov9650.c                                          |  4 ++--
 drivers/media/i2c/rj54n1cb0c.c                                      |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                            |  2 +-
 drivers/media/i2c/s5k5baf.c                                         |  4 ++--
 drivers/media/i2c/saa6588.c                                         |  2 +-
 drivers/media/i2c/saa6752hs.c                                       |  2 +-
 drivers/media/i2c/saa7110.c                                         |  2 +-
 drivers/media/i2c/saa717x.c                                         |  2 +-
 drivers/media/i2c/saa7185.c                                         |  2 +-
 drivers/media/i2c/sony-btf-mpx.c                                    |  2 +-
 drivers/media/i2c/tc358743.c                                        |  2 +-
 drivers/media/i2c/tda1997x.c                                        |  2 +-
 drivers/media/i2c/tda7432.c                                         |  2 +-
 drivers/media/i2c/tda9840.c                                         |  2 +-
 drivers/media/i2c/tea6415c.c                                        |  2 +-
 drivers/media/i2c/tea6420.c                                         |  2 +-
 drivers/media/i2c/thp7312.c                                         |  2 +-
 drivers/media/i2c/ths7303.c                                         |  6 +++---
 drivers/media/i2c/ths8200.c                                         |  4 ++--
 drivers/media/i2c/tlv320aic23b.c                                    |  2 +-
 drivers/media/i2c/tvaudio.c                                         |  2 +-
 drivers/media/i2c/tvp5150.c                                         |  6 +++---
 drivers/media/i2c/tvp7002.c                                         |  2 +-
 drivers/media/i2c/tw2804.c                                          |  2 +-
 drivers/media/i2c/tw9900.c                                          |  2 +-
 drivers/media/i2c/tw9903.c                                          |  2 +-
 drivers/media/i2c/tw9906.c                                          |  2 +-
 drivers/media/i2c/tw9910.c                                          |  2 +-
 drivers/media/i2c/uda1342.c                                         |  2 +-
 drivers/media/i2c/upd64031a.c                                       |  2 +-
 drivers/media/i2c/upd64083.c                                        |  2 +-
 drivers/media/i2c/vp27smpx.c                                        |  2 +-
 drivers/media/i2c/vpx3220.c                                         |  6 +++---
 drivers/media/i2c/wm8739.c                                          |  2 +-
 drivers/media/i2c/wm8775.c                                          |  2 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c                           |  8 ++++----
 drivers/media/platform/allegro-dvt/allegro-core.c                   | 28 ++++++++++++++--------------
 drivers/media/platform/atmel/atmel-isi.c                            |  8 ++++----
 drivers/media/platform/microchip/microchip-sama5d2-isc.c            | 21 ++++++++-------------
 drivers/media/platform/microchip/microchip-sama7g5-isc.c            | 21 ++++++++-------------
 drivers/media/platform/nvidia/tegra-vde/h264.c                      | 10 +++++-----
 drivers/media/platform/nxp/imx-pxp.h                                |  9 +++++++--
 drivers/media/platform/qcom/camss/camss-video.c                     |  6 ------
 drivers/media/platform/qcom/camss/camss.c                           |  5 +++--
 drivers/media/platform/raspberrypi/pisp_be/Kconfig                  |  1 +
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c                | 10 +++++-----
 drivers/media/platform/samsung/exynos4-is/fimc-core.c               | 10 +++++-----
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c                    | 10 +++++-----
 drivers/media/platform/ti/am437x/am437x-vpfe.c                      | 12 +++++-------
 drivers/media/platform/ti/cal/cal-camerarx.c                        |  2 +-
 drivers/media/platform/ti/cal/cal.c                                 |  8 ++++----
 drivers/media/platform/ti/davinci/vpif_capture.c                    | 14 +++++++-------
 drivers/media/platform/verisilicon/hantro_v4l2.c                    |  6 +-----
 drivers/media/platform/xilinx/xilinx-vipp.c                         |  9 ++-------
 drivers/media/radio/radio-tea5764.c                                 |  2 +-
 drivers/media/radio/saa7706h.c                                      |  4 ++--
 drivers/media/radio/si470x/radio-si470x-i2c.c                       |  2 +-
 drivers/media/radio/si4713/si4713.c                                 |  4 ++--
 drivers/media/radio/tef6862.c                                       |  4 ++--
 drivers/media/test-drivers/vidtv/vidtv_demod.c                      |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c                      |  2 +-
 drivers/media/tuners/e4000.c                                        |  2 +-
 drivers/media/tuners/fc2580.c                                       |  2 +-
 drivers/media/tuners/m88rs6000t.c                                   |  2 +-
 drivers/media/tuners/mt2060.c                                       |  2 +-
 drivers/media/tuners/mxl301rf.c                                     |  2 +-
 drivers/media/tuners/qm1d1b0004.c                                   |  2 +-
 drivers/media/tuners/qm1d1c0042.c                                   |  2 +-
 drivers/media/tuners/tda18212.c                                     |  2 +-
 drivers/media/tuners/tda18250.c                                     |  2 +-
 drivers/media/tuners/tua9001.c                                      |  2 +-
 drivers/media/tuners/tuner-i2c.h                                    |  4 +---
 drivers/media/usb/go7007/s2250-board.c                              |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                                |  2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c          | 10 +++-------
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c          | 10 +++-------
 drivers/staging/media/meson/vdec/vdec.c                             |  2 ++
 drivers/staging/media/meson/vdec/vdec_platform.c                    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/meson/vdec/vdec_platform.h                    |  2 ++
 154 files changed, 345 insertions(+), 331 deletions(-)

