Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4240319A968
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 12:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgDAKT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 06:19:58 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51483 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727308AbgDAKT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 06:19:58 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JaTRjEENDfHuvJaTUjDufb; Wed, 01 Apr 2020 12:19:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585736396; bh=8rwjGqbSJfn12xVY8Dpvgzi/mItEug6oNJMHJj5EfUc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DPScJcY7XJoUPNUsw6WKmpN9f9GhLaIvN2Ca+D7PgSejCTD3jlxsRWlzAq/XiyfZk
         lkL9asucQUG5jQsFlmCDk1EHTDZG5n8T0daxZuep3z1Td3Vh/ELYK+R/JK8MVC/99D
         4gt2ForXQwRllq0cfHRJYereJKxSmd38FFzn7znZypnylippD8B94FWuqYKmurrBWE
         /exZaumOlNXPGdCFqklgBNK0nKYlffGIK5UgpKnDP9kjFqv9QGHSrY0DKfysXkBWu5
         d+B7esNkeZOA/va+dqzSIPgr/psmyCavwoU/jdJEm2ZoBsWxxhQP6V8TV2mdT8B3YM
         lK7b9GvUOZmzg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@the-dreams.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] v2: Various fixes/enhancements
Message-ID: <68df33e0-279c-922c-6ea4-67b76b287451@xs4all.nl>
Date:   Wed, 1 Apr 2020 12:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPgUYzvH6al6UVHf6obtq/nN5NqeUIjt/pwHc7lV0aS3MuMcdNPgXhXeKdxOma3LPSil73DQANmkJ9m1Hk0IeedkiTwQCqMlsILRE62b9IXUk3UomMvw
 EUhlEbOU1nfG/2zTVWwgkhK6fuoJjQIpp+OQwsI0QrkZHLdtQUnAbJPL4KVY6zPxO9u9ex2RLtqhC6G9AEKTixMyL4zamBzsnNzSkGOaECQ7y/dFYTSFRI0i
 629IlVS4euMWoCt1ouhJT+lun3Jfj42ti8kw5+Fc6WSWcBWsKX6kdq+chLYKAhDV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes and enhancement. Most notably the addition of the coda
JPEG decoder.

Change since v1 (https://patchwork.linuxtv.org/patch/62692/):

Added patch 'media: vimc: add vimc_ent_type struct for the callbacks of entities'.

Regards,

	Hans

The following changes since commit 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03-30 11:28:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8a

for you to fetch changes up to 4dc4a8bcf44db19e7a4922dcd22b521f8bd6ac2e:

  vim2m: Remove unneeded buffer lock (2020-04-01 12:14:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Adrian Ratiu (1):
      media: coda: jpeg: support optimized huffman tables

Dafna Hirschfeld (8):
      media: v4l2-common: change the pixel_enc of V4L2_PIX_FMT_GREY to YUV
      media: doc-rst: in the RGB formats table add '-' in undefined bits
      media: v4l2-common: Add BGR666 to v4l2_format_info
      media: vimc: remove the function vimc_unregister
      media: vimc: handle error in vimc_add_subdevs
      media: vimc: keep the error value when adding an entity fails
      media: vimc: fix issues in documentation in vimc-common.h
      media: vimc: add vimc_ent_type struct for the callbacks of entities

Ezequiel Garcia (1):
      vim2m: Remove unneeded buffer lock

Philipp Zabel (6):
      media: coda: round up decoded buffer size for all codecs
      media: add v4l2 JPEG helpers
      media: coda: jpeg: add CODA960 JPEG decoder support
      media: coda: split marking last meta into helper function
      media: coda: mark last capture buffer
      media: coda: lock capture queue wakeup against decoder stop command

Steve Longerbeam (1):
      media: imx.rst: Add example media graphs

Wolfram Sang (6):
      media: pci: cx88: convert to use i2c_new_client_device()
      media: pci: saa7134: convert to use i2c_new_client_device()
      media: marvell-ccic: convert to use i2c_new_client_device()
      media: usb: cx231xx: convert to use i2c_new_client_device()
      media: usb: hdpvr: convert to use i2c_new_client_device()
      media: usb: pvrusb2: convert to use i2c_new_client_device()

 Documentation/media/uapi/v4l/pixfmt-rgb.rst         | 136 +++++------
 Documentation/media/v4l-drivers/imx.rst             |  43 +++-
 Documentation/media/v4l-drivers/imx6q-sabreauto.dot |  51 ++++
 Documentation/media/v4l-drivers/imx6q-sabresd.dot   |  56 +++++
 drivers/media/pci/cx88/cx88-core.c                  |   3 +-
 drivers/media/pci/cx88/cx88-input.c                 |   2 +-
 drivers/media/pci/cx88/cx88-video.c                 |   2 +-
 drivers/media/pci/saa7134/saa7134-input.c           |   2 +-
 drivers/media/platform/Kconfig                      |   1 +
 drivers/media/platform/coda/coda-common.c           | 188 +++++++++++++--
 drivers/media/platform/coda/coda-jpeg.c             | 577 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/coda/coda.h                  |  10 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c   |   2 +-
 drivers/media/platform/vim2m.c                      |   8 -
 drivers/media/platform/vimc/vimc-capture.c          |  18 +-
 drivers/media/platform/vimc/vimc-common.h           |  53 ++---
 drivers/media/platform/vimc/vimc-core.c             |  90 +++----
 drivers/media/platform/vimc/vimc-debayer.c          |  15 +-
 drivers/media/platform/vimc/vimc-scaler.c           |  15 +-
 drivers/media/platform/vimc/vimc-sensor.c           |  15 +-
 drivers/media/usb/cx231xx/cx231xx-input.c           |   5 +-
 drivers/media/usb/hdpvr/hdpvr-core.c                |   4 +-
 drivers/media/usb/hdpvr/hdpvr-i2c.c                 |   2 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c        |   4 +-
 drivers/media/v4l2-core/Kconfig                     |   4 +
 drivers/media/v4l2-core/Makefile                    |   2 +
 drivers/media/v4l2-core/v4l2-common.c               |   3 +-
 drivers/media/v4l2-core/v4l2-jpeg.c                 | 632 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h                           | 135 +++++++++++
 29 files changed, 1855 insertions(+), 223 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabreauto.dot
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot
 create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
 create mode 100644 include/media/v4l2-jpeg.h
