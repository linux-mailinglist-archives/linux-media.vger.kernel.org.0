Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7DB3CFABB
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 15:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237513AbhGTMz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 08:55:27 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50127 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238754AbhGTMxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 08:53:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 5pt8mteLlhqx95pt9mvx7A; Tue, 20 Jul 2021 15:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626788063; bh=YOrF5DuKarVC9ccCGbtJ4rYEmt3UEP22Rt+TIz0vSRI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kO9C6A+m4/mQGdsYR6mie8FTScXELrF5wEyEV1LLC8OPqoGIgdQScG23KoBQDBEN7
         z+PXPmP7d5/m3VWgB5d+I3l81X6bgDGPrNRMJZJqFG0VlVOLOBeV+aw/pDFCh+RbCy
         d+hSkjaz75ulTHy1p8XLJ5qINrD/1awiKbWT5Tu/6V1Gf+wTEUwjt5b82FTUtGWoMP
         xiBoeVR9Hkpz1ExCGKnm/i6blyGoPpeNA3bqlZ+6SI5aw/d1dPPQlqvsYBIh1Glb+f
         ioSrkq5GPmwLHRw9Y/srG9bOG3aVRVpignfHUa9PUHxIf8GK6eIbJthPCvtMRKDL9d
         oGFLhAH4w3y1w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] Various fixes
Message-ID: <4d9b08ca-ec5e-b75f-514c-950d2c2abd64@xs4all.nl>
Date:   Tue, 20 Jul 2021 15:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKpcBRQv+rpN+BhXfjCfQdmHaOeAj17KepJJNiOHOcUoliDQF/dujuGPewtU9rRomWYSRuplvopFW0TOVt3cljwW6opQczDWO5kyjmsClpBpUDLaH2uW
 hJOXapDBo9smF7HP5gnZcYJB09BD2KkidrlgH5RvkrGbcRKom9L/JOIjWCEPjl7uNykmfgHhAix2umu1N9inIsIIgOQo3al/SIs9m/yhiAdbnshjmrMZnFr7
 zRbeV1J8Qxr3Xpc3lfNv2ETbxSG8kyLBDnpv53kqcRJVTOMvjV8RFFzGQ73Qup8PSrDILaz6uNdHxS1ZpM0azDGy9QPbdKKy/A02k3lJYY4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15a

for you to fetch changes up to 8e8ee611c5aa4e1ddb6efd1395f1dd16e13eca98:

  media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats (2021-07-20 15:17:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (3):
      media: mtk-jpeg: fix setting plane paylod
      media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
      media: rkisp1: cap: initialize dma buf address in 'buf_init' cb

Dan Carpenter (2):
      media: v4l2-subdev: fix some NULL vs IS_ERR() checks
      media: rockchip/rga: fix error handling in probe

Evgeny Novikov (1):
      media: platform: stm32: unprepare clocks at handling errors in probe

Fabio Estevam (3):
      dt-bindings: adv7180: Introduce the 'reset-gpios' property
      media: i2c: adv7180: Print the chip ID on probe
      dt-bindings: adv7180: Introduce 'adv,force-bt656-4' property

Frieder Schrempf (1):
      media: adv7180: Add optional reset GPIO

Hans Verkuil (1):
      media/cec-core.rst: update adap_enable doc

Matthew Michilot (1):
      media: i2c: adv7180: fix adv7280 BT.656-4 compatibility

Pavel Skripkin (3):
      media: go7007: fix memory leak in go7007_usb_probe
      media: go7007: remove redundant initialization
      media: stkwebcam: fix memory leak in stk_camera_probe

Philipp Zabel (1):
      media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats

Tom Rix (1):
      media: ti-vpe: cal: fix indexing of cal->ctx[] in cal_probe()

 Documentation/devicetree/bindings/media/i2c/adv7180.yaml |  8 ++++++
 Documentation/driver-api/media/cec-core.rst              |  9 ++++---
 drivers/media/cec/platform/stm32/stm32-cec.c             | 26 +++++++++++++------
 drivers/media/i2c/adv7180.c                              | 66 ++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/platform/coda/coda-bit.c                   | 18 +++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          | 20 +++++++-------
 drivers/media/platform/rcar-vin/rcar-v4l2.c              |  4 +--
 drivers/media/platform/rockchip/rga/rga.c                | 27 +++++++++++++++----
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 ++++++++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h   |  6 +----
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c   |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c    |  6 ++---
 drivers/media/platform/ti-vpe/cal.c                      |  6 ++---
 drivers/media/platform/vsp1/vsp1_entity.c                |  4 +--
 drivers/media/usb/go7007/go7007-driver.c                 | 26 -------------------
 drivers/media/usb/go7007/go7007-usb.c                    |  2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c                 |  6 +++--
 drivers/staging/media/tegra-video/vi.c                   |  4 +--
 18 files changed, 167 insertions(+), 86 deletions(-)
