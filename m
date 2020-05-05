Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291081C535F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgEEKgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:36:50 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60047 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728180AbgEEKgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:36:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VuwNjj5qA8hmdVuwRjAERZ; Tue, 05 May 2020 12:36:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588675007; bh=qdJ39qitW1QEl5X3l8DhjZd7o2jE81OOvmf7Er9DqPg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vLZ6vsWCV8NG5NEpsGDMU9FUmoOQT7XwSN5Lh2a8f5mbSQvvB8W3ZGHhKuQKrwh6D
         16kj4xlb4SDctR+uPST+WNbdznfGuRYpMglwaRlxP46hu1+vIBWtzyJ0db7+RkFDCW
         4bS9gw/uDKDG8BdyAl4iq9qNH9A6HZvVq15g8lpYChR5jqe7row9ccyTuyUY6QF7fv
         xf/9FZxqGexAn3O01ajbng3fm5V6RynsRVK7nY/CnHYwAPw0slQvPgaPtTxTd68Xwv
         +k3uSkvwOppSowBP7QGAM7KN2f/2AZn0Qc4aS3HR/9Po9RgqzYogC22QzxVrAKXT+W
         WVuyvZuwoYf5A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Various fixes
Message-ID: <0d19d00a-f419-fd67-d844-776720da2613@xs4all.nl>
Date:   Tue, 5 May 2020 12:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfN+rXn2BrOhS/68OrF6ziWsxvil4BszMkoslA4G3lxjg026UlX2TA2OPIEKQEtottiK8aMihTc8NIrgKC9qCHDjR8peBQwNp4ar8e2GY6VS+r+7SsXFK
 dsxi1nw3X2/35lgnjzuT/MEofQmdcFg8hF+9i+HijAgS2zPsTfLPlSDS9gp3nZ8rwjIdkMNs0fIx+A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:

  media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8g

for you to fetch changes up to a42ecefb40c08538516ca9f1efa6499dec290721:

  media: cec: silence shift wrapping warning in __cec_s_log_addrs() (2020-05-05 12:31:46 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: ti-vpe: avoid gcc-9 warning

Christophe JAILLET (1):
      media: sun8i: Fix an error handling path in 'deinterlace_runtime_resume()'

Dafna Hirschfeld (4):
      media: staging: rkisp1: rsz: get the capture format info from the capture struct
      media: staging: rkisp1: rsz: remove redundant if statement and add inline doc
      media: staging: rkisp1: rsz: change (hv)div only if capture format is YUV
      media: staging: rkisp1: cap: enable RGB capture format with YUV media bus

Dan Carpenter (1):
      media: cec: silence shift wrapping warning in __cec_s_log_addrs()

Greg Kroah-Hartman (1):
      staging: media: imx: no need to check return value of debugfs_create functions

Johan Jonker (1):
      dt-bindings: media: rockchip-vpu: fix interrupt-names

John Oldman (1):
      staging: media: usbvision: usbvision-core Correct spelling

Koji Matsuoka (1):
      media: rcar-csi2: Fix comment of VCDT/VCDT2 register

Maxime Jourdan (2):
      media: meson: vdec: enable mcrcc for VP9
      media: meson: vdec: fix another case of VP9 buffer shortage

Neil Armstrong (1):
      MAINTAINERS: update the Amlogic VDEC driver maintainer entry

Nícolas F. R. A. Prado (3):
      media: vimc: Support multiple media bus codes for each pixelformat
      media: vimc: Add missing {RGB,BGR,GBR}888 media bus codes
      media: vimc: deb: Add support for {RGB,BGR,GBR}888 bus formats on source pad

Steve Longerbeam (1):
      media: imx: utils: Default colorspace to SRGB

Zou Wei (1):
      media: cx231xx: Remove unneeded semicolon

 Documentation/devicetree/bindings/media/rockchip-vpu.yaml |  7 ++--
 MAINTAINERS                                               |  2 ++
 drivers/media/cec/core/cec-adap.c                         |  8 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c               |  4 +--
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c          |  6 ++--
 drivers/media/platform/ti-vpe/cal.c                       | 46 +++++++++++-------------
 drivers/media/test-drivers/vimc/vimc-common.c             | 83 ++++++++++++++++++++++++++++++--------------
 drivers/media/test-drivers/vimc/vimc-common.h             | 13 ++++++-
 drivers/media/test-drivers/vimc/vimc-debayer.c            | 71 ++++++++++++++++++++++++++++---------
 drivers/media/test-drivers/vimc/vimc-scaler.c             | 10 ++++--
 drivers/media/test-drivers/vimc/vimc-sensor.c             |  6 ++--
 drivers/media/usb/cx231xx/cx231xx-avcore.c                |  2 +-
 drivers/staging/media/imx/imx-media-utils.c               |  3 +-
 drivers/staging/media/imx/imx7-mipi-csis.c                | 29 +++-------------
 drivers/staging/media/meson/vdec/codec_vp9.c              | 72 ++++++++++++++++++++++++++++++--------
 drivers/staging/media/meson/vdec/esparser.c               | 24 ++++++-------
 drivers/staging/media/rkisp1/rkisp1-capture.c             |  6 +++-
 drivers/staging/media/rkisp1/rkisp1-resizer.c             | 26 +++++++++-----
 drivers/staging/media/usbvision/usbvision-core.c          |  2 +-
 19 files changed, 271 insertions(+), 149 deletions(-)
