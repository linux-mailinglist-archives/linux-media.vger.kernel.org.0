Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F53205576
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 17:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732866AbgFWPFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 11:05:25 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49965 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732845AbgFWPFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 11:05:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nkUAjnMHbx3AjnkUEjflV2; Tue, 23 Jun 2020 17:05:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592924722; bh=3U/SoF/F+23/xF0ullbt6ZcvKV6vEh0IP5wuTadtEwA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZyGwqYx4w2FmHJkGD5c2ObddqKCRSCKRBZ95Kh2eMJ+PJkIFnevaCkVULVraCvQ9b
         MeimP9lDd/jaMDfi0ajv2h2MIpPlmgFrYFwg0oe5xeZXQz6kq29MQdpqq12586qe1t
         87QF6EYgHAybXDLttA/ageNpTdUalOcCkEJIBpXAE4sOwbr6VlurVW7HZ96U46Gn0W
         XMRZhBRUyTj/OIBRFOXXVXCWILDS1GbNnVdpL4Hq0GxpCkf3QeBEMaj5IcFqfYGfJx
         WjdzaWaPVJpd46EErfSqbflu/zhTjyRFKLQ4SpP+N7pV6K/Ym3lTQyQSIE8l4VTiO+
         pjO2aRp9S1h4A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes/enhancements
Message-ID: <d4e7cebd-23de-831f-9f12-5822079fbf90@xs4all.nl>
Date:   Tue, 23 Jun 2020 17:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGzBiciUViT6IuIuOviL2lVbdEON039a0JXG1Ouy/QECyYKbZHH2Wi3ad7m1i9yyIfLwxhnYK3YgcyrPIppdySpKPY766sQpDdz85q7NJbDUhLNqJQq4
 J6YmWdT3Bdcal7/LhiJyJYm0/eQGQESwsEbmBNj4vXE4jHTtVwGPtCydTdXsf96EH34rVkV4C/q/sA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9c

for you to fetch changes up to cc214e8995100bd6d7cbed90c090d729a5edf3fd:

  media: exynos4-is: Add missed check for pinctrl_lookup_state() (2020-06-23 15:20:59 +0200)

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
 26 files changed, 326 insertions(+), 277 deletions(-)
