Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 015BC48469
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfFQNrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:47:40 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56925 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726822AbfFQNrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:47:40 -0400
Received: from [IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc] ([IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cryzhvG3R5qKacrz0hXDRU; Mon, 17 Jun 2019 15:47:38 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes.
Message-ID: <fe3b41fb-ee6c-8b63-b5de-831df3401c16@xs4all.nl>
Date:   Mon, 17 Jun 2019 15:47:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKILzBZXFKsbRHVesEGE1pnKP/myEex7L42An0BLP+RvloGnqlYgO2X3iXkp9UPsFMsZL/ftg4uKMMSKDgRpgN0E68Jp0bpSwT/zRh9OdeF1cOlQN9zm
 UQkgmTCBNa89mJqmohVhYPOAcQDfLxRzU5lDhNEOVj1v8riQVivpjYb4yIbuS1ja3mecXPg4l9jhCpPxOfTwUGmgC+1SwSWYAdg2a7q6o1zZdYqg3wOFfsLt
 o23X6PCYhfeaCnkaErIn/1HS1KyG5B6fAAyZtRz3y60=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:

  media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3r

for you to fetch changes up to c0d1b0b083620e1755a563102368c35686df5f18:

  staging: media: tegra-vde: Manually pack UAPI structures (2019-06-17 15:37:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Akinobu Mita (2):
      media: vivid: remove unnecessary min and max timeperframe constants
      media: video-i2c: use V4L2_FRACT_COMPARE

André Almeida (2):
      media: vimc: stream: add missing function documentation
      media: docs: create vimc documentation

Dmitry Osipenko (2):
      staging: media: tegra-vde: Remove BIT() macro from UAPI header
      staging: media: tegra-vde: Manually pack UAPI structures

Fabio Estevam (2):
      media: dt-bindings: imx7-csi: Document a single CSI clock
      media: coda: Use devm_platform_ioremap_resource()

Jae Hyun Yoo (1):
      media: aspeed: add a workaround to fix a silicon bug

Luca Ceresoli (1):
      media: docs: v4l2-controls: fix sentence rendered in a nonsense way

YueHaibing (1):
      media: meye: Fix build COMPILE_TEST error

 Documentation/devicetree/bindings/media/imx7-csi.txt |  9 ++----
 Documentation/media/uapi/v4l/extended-controls.rst   |  9 +++---
 Documentation/media/v4l-drivers/index.rst            |  1 +
 Documentation/media/v4l-drivers/vimc.dot             | 22 +++++++++++++++
 Documentation/media/v4l-drivers/vimc.rst             | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/i2c/video-i2c.c                        |  8 ++----
 drivers/media/pci/meye/Kconfig                       |  3 +-
 drivers/media/platform/aspeed-video.c                | 28 ++++++++++++++-----
 drivers/media/platform/coda/coda-common.c            |  4 +--
 drivers/media/platform/vimc/vimc-streamer.c          | 22 +++++++++++++++
 drivers/media/platform/vivid/vivid-core.h            | 12 --------
 drivers/media/platform/vivid/vivid-vid-cap.c         |  7 -----
 drivers/staging/media/tegra-vde/tegra-vde.c          | 13 +++++++--
 drivers/staging/media/tegra-vde/uapi.h               | 48 ++++++++++++++++----------------
 14 files changed, 212 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/vimc.dot
 create mode 100644 Documentation/media/v4l-drivers/vimc.rst
