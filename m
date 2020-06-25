Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2352E209D6B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 13:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404228AbgFYL00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 07:26:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49971 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404191AbgFYL0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 07:26:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oQ1IjeuQ797i5oQ1NjVirO; Thu, 25 Jun 2020 13:26:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593084383; bh=qCyqN6LurpUokubcpM22PIJj25iSsZ2h0BAZfU/FpU8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OPhOeYiAkSh4vzpq4Ga7RRrIix/9rBCqLCVCUsHPYx24ODETEA6IlWWv4SEQbouNv
         iaJLW0+wjskKHRzJCbEQ/xdpWT5aNeU/lYZHrKlw6YdieNgWOm8xPPVbNmPVxwE59C
         j8cKmAXFXy8UdyePiBSAwBGURmTzy9E2VbSghbQIEMhHG18QJPtFM3j8bLygml4CXn
         UhKgotPFoatbIuJSjfkd7YaQRAGdcX33DVeywLWg5u8H+T0V6UZkAaGfTgE0pKc2s5
         IXl4ArbLFGK000RTLcYE6Vra9UQi3CmYAPD1kE0VMmOOzDEQSx7jvtifrplFRKsZ67
         i+4Rj9EsNZt3w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] v2: Various fixes/enhancements
Message-ID: <691d2162-159f-032a-1e7f-99e506ce74ab@xs4all.nl>
Date:   Thu, 25 Jun 2020 13:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMlzA3hEd7r8m0kGg2ELZMulZX0PFN6652FsYIJl9ekZqM84H+dNkuCULXe7lvXrgNbYzS+KSqlHGXFYPNuPCErdO9ZgSIdmWL+SugZDmwWE1CBJKuZ4
 fxbPpCMMWRzBJhbqgrsTPbnXB9tDC/WZtN/s/SurSp/hPmFaIzTAfVtlSloDX82RMrIjgIhNWVt+mQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supersedes https://patchwork.linuxtv.org/patch/64836/.

That previous PR had the wrong cros-ev-cec patch.
I also added two more patches for the rockchip rga driver.

Regards,

	Hans


The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9c

for you to fetch changes up to 29a2a30064c49e6811562b22261dd39ee9be9092:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-06-25 13:12:03 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (2):
      media: v4l2-rect.h: add enclosed rectangle helper
      media: use v4l2_rect_enclosed helper

Chuhong Yuan (2):
      media: tvp5150: Add missed media_entity_cleanup()
      media: exynos4-is: Add missed check for pinctrl_lookup_state()

Dafna Hirschfeld (5):
      media: staging: rkisp1: rsz: supported formats are the isp's src formats, not sink formats
      media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
      media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to 'RKISP1_ISP_SD_*'
      media: staging: rkisp1: rsz: set default format if the given format is not RKISP1_ISP_SD_SRC
      media: staging: rkisp1: set more precise size errors in debugfs

Dan Carpenter (2):
      media: allegro: Fix some NULL vs IS_ERR() checks in probe
      media: pxa_camera: remove an impossible condition

Dariusz Marcinkiewicz (1):
      media: cros-ec-cec: do not bail on device_init_wakeup failure

Gustavo A. R. Silva (1):
      media: test_drivers: vivid-core: Use array_size() helper

Helen Koike (1):
      media: staging: rkisp1: rsz: fix resolution limitation on sink pad

John Cox (1):
      media: videobuf2: Fix length check for single plane dmabuf queueing

Krzysztof Kozlowski (1):
      media: samsung: Rename Samsung and Exynos to lowercase

Lad Prabhakar (3):
      media: rcar-vin: Invalidate pipeline if conversion is not possible on input formats
      media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
      media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format

Laurent Pinchart (1):
      media: vb2: Print the queue pointer in debug messages

Niklas Söderlund (1):
      rcar-csi2: Rename confirm_start() to phy_post_init() to match its usage

Paul Kocialkowski (2):
      media: rockchip: rga: Introduce color fmt macros and refactor CSC mode logic
      media: rockchip: rga: Only set output CSC mode for RGB input

Stanimir Varbanov (1):
      docs: dev-decoder: Add one more reason for dynamic change

 Documentation/admin-guide/media/fimc.rst              |   6 +-
 Documentation/driver-api/media/drivers/tuners.rst     |   2 +-
 Documentation/userspace-api/media/v4l/dev-decoder.rst |   4 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c      |   6 +-
 drivers/media/common/videobuf2/videobuf2-core.c       | 226 ++++++++++++++++++++++++++++---------------------------
 drivers/media/common/videobuf2/videobuf2-v4l2.c       |  71 ++++++++++-------
 drivers/media/i2c/tvp5150.c                           |   8 +-
 drivers/media/platform/am437x/am437x-vpfe.c           |  19 +----
 drivers/media/platform/exynos4-is/fimc-capture.c      |  18 +----
 drivers/media/platform/exynos4-is/fimc-lite.c         |  18 +----
 drivers/media/platform/exynos4-is/media-dev.c         |   5 +-
 drivers/media/platform/pxa_camera.c                   |  19 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c           |  15 ++--
 drivers/media/platform/rcar-vin/rcar-dma.c            |  21 +++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c           |  15 +++-
 drivers/media/platform/rockchip/rga/rga-hw.c          |  29 +++----
 drivers/media/platform/rockchip/rga/rga-hw.h          |   5 ++
 drivers/media/platform/s3c-camif/camif-core.c         |   2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c           |  16 +---
 drivers/media/test-drivers/vivid/vivid-core.c         |   4 +-
 drivers/staging/media/allegro-dvt/allegro-core.c      |   8 +-
 drivers/staging/media/rkisp1/rkisp1-common.h          |   7 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c             |   9 ++-
 drivers/staging/media/rkisp1/rkisp1-isp.c             |  53 ++++++-------
 drivers/staging/media/rkisp1/rkisp1-resizer.c         |  14 ++--
 include/media/v4l2-rect.h                             |  20 +++++
 include/media/videobuf2-core.h                        |   4 +
 include/media/videobuf2-v4l2.h                        |  13 ++++
 28 files changed, 347 insertions(+), 290 deletions(-)
