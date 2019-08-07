Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D660E84A56
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 13:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfHGLGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 07:06:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58981 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726418AbfHGLGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 07:06:37 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vJm6hknGbAffAvJm7h7wsb; Wed, 07 Aug 2019 13:06:35 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Various fixes/enhancements
Message-ID: <5f925e02-ee4c-dcc2-e8b1-6f16667299a2@xs4all.nl>
Date:   Wed, 7 Aug 2019 13:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPd24QHmoQoD7c4TCLLjoKDsftnov9gr/0Z4W0o5Glkt3JMPbo20SGQNKPg2JFKKfA11S0rGaGcxdFLA919plYxwh7LXNN7OaFBqHXORmgoeF7R7uh+7
 Rnu/mrC3XIwr0t1NRcYzfjSZHeV52jSlo476gepCBFKPAkOrV1acM7YHCH4uYJr/OXdFq6mpoJCVNJCDGv0CR6c7k2y8rm5EK6agNBztdv4rvkcPyHUufVxK
 izMkTQVsB2COUjpgSJ5fvp0ewDJwQOqMeLxBLb/9M/I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d42974e438feebda372fe4a39d7761cc596abc57:

  media: venus: dec: populate properly timestamps and flags for capture buffers (2019-08-05 10:57:51 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git for-v5.4h

for you to fetch changes up to badc46c07ae7a44075aa358601c04f2fa59000f3:

  media: Remove dev_err() usage after platform_get_irq() (2019-08-07 12:19:46 +0200)

----------------------------------------------------------------
Fabio Estevam (1):
      media: imx7.rst: Fix the references to the CSI multiplexer

Hans Verkuil (2):
      vicodec: add support for 4 new RGB32 pixelformats
      adv7511/cobalt: rename driver name to adv7511-v4l2

Randy Dunlap (1):
      media/platform: fsl-viu.c: fix build for MICROBLAZE

Rui Wang (1):
      media: mtk-vcodec: Handle H264 error bitstreams

Stephen Boyd (1):
      media: Remove dev_err() usage after platform_get_irq()

YueHaibing (1):
      media: staging: tegra-vde: Fix build error

 Documentation/media/v4l-drivers/imx7.rst              | 127 +++++++++++++++++++++++++-------------------------
 drivers/media/i2c/adv7511-v4l2.c                      |   4 +-
 drivers/media/pci/cobalt/cobalt-driver.c              |   2 +-
 drivers/media/platform/am437x/am437x-vpfe.c           |   1 -
 drivers/media/platform/atmel/atmel-sama5d2-isc.c      |   7 +--
 drivers/media/platform/exynos4-is/mipi-csis.c         |   4 +-
 drivers/media/platform/fsl-viu.c                      |   2 +-
 drivers/media/platform/imx-pxp.c                      |   4 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c |  16 ++++++-
 drivers/media/platform/omap3isp/isp.c                 |   1 -
 drivers/media/platform/renesas-ceu.c                  |   4 +-
 drivers/media/platform/rockchip/rga/rga.c             |   1 -
 drivers/media/platform/s3c-camif/camif-core.c         |   4 +-
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c |   8 +---
 drivers/media/platform/sti/hva/hva-hw.c               |   8 +---
 drivers/media/platform/stm32/stm32-dcmi.c             |   5 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c    |   7 +--
 drivers/media/platform/vicodec/codec-v4l2-fwht.c      |  30 +++++++++++-
 drivers/media/rc/img-ir/img-ir-core.c                 |   4 +-
 drivers/media/rc/ir-hix5hd2.c                         |   4 +-
 drivers/media/rc/meson-ir.c                           |   4 +-
 drivers/media/rc/mtk-cir.c                            |   4 +-
 drivers/media/rc/sunxi-cir.c                          |   1 -
 drivers/staging/media/tegra-vde/Kconfig               |   2 +-
 24 files changed, 127 insertions(+), 127 deletions(-)
