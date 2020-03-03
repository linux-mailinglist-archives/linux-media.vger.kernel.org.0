Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4EF1779EA
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgCCPHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 10:07:00 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40731 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729176AbgCCPHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 10:07:00 -0500
Received: from [IPv6:2001:983:e9a7:1:8c14:57ad:bac0:273b]
 ([IPv6:2001:983:e9a7:1:8c14:57ad:bac0:273b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 998KjVUDa9Im2998Mj04sU; Tue, 03 Mar 2020 16:06:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583248018; bh=3X1JWSSF0SGwNf1XOEbLNIw2CaYymw9sKm/eM8H8M2w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X9Z50/6tshS8N8jiSSuPWp4lw4Qh8Eau4vJWoylKwhFZujAJpNAjRVVVR5hNTCWlw
         QeM9iibrSwcfG/dvrY7KLOjNDb3yvDTVZhuXYWZKBkefDsf8gOQIOcHCsYlSUvbB20
         0GeVCXbHcb7XqY+WPe7TB+77IJqdFtimdO8tkyV/sWpyKwPmwh25UDgG1Ff28J9J2a
         4G1Kjm8ca7hm43wmu+dcWvZMdVKZk7ArHhZirg1b43XbxFSmPubKkBFnKQO2hg1tFR
         ndXfy96OeN/+NqbpwqcRk/eiriLNCN+u0DRt3ziQpeM3kz/mVQjBHhIOAjJdwbQoo7
         BwpC+LxGtMevw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes
Message-ID: <ed35bc9d-e18f-d4de-3a0f-d1725ebd8f0b@xs4all.nl>
Date:   Tue, 3 Mar 2020 16:06:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAAcIodQeyVDi8a+saIw7EyFL2po8E7q7Ks16tR5OybQ/KmzVROfzgGI9E12VeRTxGL+d5y7Ih2PIk/rYcdXIThqGPUk56mN+vvHkUCo6FzrjuLU1z4q
 adDfHTYlA6xRDEpNmDhte4fNUJSdSUTEX4lSC/ogmc84ron90LynBI4wdMi/MGEmqSViLfoyum5WyFg1oeLq/vBcpxbkmcg6s5bbD82NnUkUR+V1ztq16jdq
 KAG98XblL4FgpCCxkfnecFHI+B+Pjl2LqLApoE18mVIsMVymuTty4l3Q2GXA5n8qSWhY+dY8CFiJhrZ1BvzaqQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8bc8c9ba03c4d4966c2503e189801fbc9130b747:

  media: Documentation:media:v4l-drivers: Update vivid documentation. (2020-03-02 16:10:39 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7e

for you to fetch changes up to 6752881b74b60c9e4705ee621324e7237344db41:

  v4l2-ctrls: v4l2_ctrl_request_complete() should always set ref->req (2020-03-03 15:24:13 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (1):
      media: ti-vpe: cal: fix disable_irqs to only the intended target

Dafna Hirschfeld (4):
      media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
      media: vimc: allocate vimc_device dynamically
      media: vimc: use-after-free fix - release vimc in the v4l_device release
      media: v4l2-core: fix a use-after-free bug of sd->devnode

Dmitry Osipenko (1):
      media: staging: tegra-vde: Use devm_platform_ioremap_resource_byname()

Eugen Hristev (1):
      media: v4l2-core: fix entity initialization in device_register_subdev

Hans Verkuil (1):
      v4l2-ctrls: v4l2_ctrl_request_complete() should always set ref->req

Jonathan Neuschäfer (1):
      media: v4l2: Switch to new kerneldoc syntax for named variable macro arguments

Sergiu Cuciurean (1):
      media: spi: gs1662: Use new structure for SPI transfer delays

Steve Longerbeam (1):
      media: imx: Propagate quantization and encoding in CSI

YueHaibing (1):
      staging: media: usbvision: Add missing MEDIA_USB_SUPPORT dependency

 drivers/media/platform/ti-vpe/cal.c        | 16 +++++------
 drivers/media/platform/vimc/vimc-capture.c | 18 ++++++------
 drivers/media/platform/vimc/vimc-common.c  |  2 --
 drivers/media/platform/vimc/vimc-common.h  | 27 +++++++++---------
 drivers/media/platform/vimc/vimc-core.c    | 93 +++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/media/platform/vimc/vimc-debayer.c | 21 +++-----------
 drivers/media/platform/vimc/vimc-scaler.c  | 21 +++-----------
 drivers/media/platform/vimc/vimc-sensor.c  | 20 +++-----------
 drivers/media/spi/gs1662.c                 | 20 +++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls.c       | 11 ++++++--
 drivers/media/v4l2-core/v4l2-device.c      |  8 ++----
 drivers/staging/media/imx/imx-media-csi.c  |  2 ++
 drivers/staging/media/imx/imx7-media-csi.c |  2 ++
 drivers/staging/media/tegra-vde/vde.c      | 55 ++++++-------------------------------
 drivers/staging/media/usbvision/Kconfig    |  2 +-
 include/media/v4l2-device.h                | 16 +++++------
 include/media/v4l2-subdev.h                |  2 +-
 17 files changed, 154 insertions(+), 182 deletions(-)
