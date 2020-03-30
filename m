Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93974197E25
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgC3OQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 10:16:06 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58101 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727359AbgC3OQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 10:16:05 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IvCpjuUhXLu1fIvCsjFItS; Mon, 30 Mar 2020 16:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585577763; bh=LuycKrUtlHyhphskRxYV7mWVVU3eyKzCwlUUOmUFlyE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NdLU/AK520fB5P1jhtncWJDOKTT0NgiEQDUw9WZEO/zgARlYVleX40PRbZt1p0PVO
         g+/KULYVIZm6sju7zRtft8EwZtBKh9pce9tV9dswsPC1ijLSOekR0Dy1vAnfq0PZzX
         6N6LjyI7QV75TFnwWLDX/SIPQZucE6jKE5VMZePDvyVU/U/3kdwaNuOqqNb1AYG2oz
         rHmDe+59s65bCbh5IXdE+XcGTVoKpXOIkQGWaf6JivkYLTVhRSt8NYDgpHJ3RSZ2T0
         f+uRzCYLGIhbI3jlJvTMXBObNJaTn6ll6X0p0mRrEaOUApALkvBVeoCelBKjDU1p9p
         Zz2bwpvJZAaxg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna3@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@the-dreams.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Various fixes/enhancements
Message-ID: <88165091-8e7f-3719-29ba-f45056f3aa40@xs4all.nl>
Date:   Mon, 30 Mar 2020 16:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM+nV6QjECcE/3ym/shsQ3pVM7g/N+h+DF9F/0NWFsFvqBqudO0Yr6+jIqnu8uvSOTePMSRNzTy/4m5Q0W85DTerqe2MDpq2W8Znjs79DG9Jt1OMbm4i
 OTdaGCVKOQ7aAn/hTVrih18wZRja4lw2D5uefo5iZN5WgtsC+s6OfvtvH88ARfUlfcTATs8HJ8XmXyHi7kPkJ80ifMZ/nmlz+s0IQN6eGugC8GEcdev7thbI
 7hBbNgL/U8ppBtMDalpTju3QgeKRlJmEXoDhtpe4Fhs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03-30 11:28:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8a

for you to fetch changes up to 515c9ab6eb944074575896ab929cf7eff99e4cb2:

  vim2m: Remove unneeded buffer lock (2020-03-30 16:12:24 +0200)

----------------------------------------------------------------
Various fixes and enhancement. Most notably the addition of the coda
JPEG decoder.

Regards,

	Hans

Tag branch

----------------------------------------------------------------
Adrian Ratiu (1):
      media: coda: jpeg: support optimized huffman tables

Dafna Hirschfeld (7):
      media: v4l2-common: change the pixel_enc of V4L2_PIX_FMT_GREY to YUV
      media: doc-rst: in the RGB formats table add '-' in undefined bits
      media: v4l2-common: Add BGR666 to v4l2_format_info
      media: vimc: remove the function vimc_unregister
      media: vimc: handle error in vimc_add_subdevs
      media: vimc: keep the error value when adding an entity fails
      media: vimc: fix issues in documentation in vimc-common.h

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
 drivers/media/platform/vimc/vimc-capture.c          |   4 +-
 drivers/media/platform/vimc/vimc-common.h           |  11 +-
 drivers/media/platform/vimc/vimc-core.c             |  56 ++---
 drivers/media/platform/vimc/vimc-debayer.c          |   4 +-
 drivers/media/platform/vimc/vimc-scaler.c           |   4 +-
 drivers/media/platform/vimc/vimc-sensor.c           |   4 +-
 drivers/media/usb/cx231xx/cx231xx-input.c           |   5 +-
 drivers/media/usb/hdpvr/hdpvr-core.c                |   4 +-
 drivers/media/usb/hdpvr/hdpvr-i2c.c                 |   2 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c        |   4 +-
 drivers/media/v4l2-core/Kconfig                     |   4 +
 drivers/media/v4l2-core/Makefile                    |   2 +
 drivers/media/v4l2-core/v4l2-common.c               |   3 +-
 drivers/media/v4l2-core/v4l2-jpeg.c                 | 632 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h                           | 135 +++++++++++
 29 files changed, 1790 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabreauto.dot
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot
 create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
 create mode 100644 include/media/v4l2-jpeg.h
