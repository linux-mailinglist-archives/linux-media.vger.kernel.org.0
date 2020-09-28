Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5521927AF24
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI1Nfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 09:35:42 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33517 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726327AbgI1Nfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 09:35:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MtJYk6TOcv4gEMtJbkR99G; Mon, 28 Sep 2020 15:35:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601300139; bh=+L+n8JnLzPZWzZ8DxajDyrJh6XsgrA8CXg+s/DNRSk0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cgoyqMmRCBFRu7aEGaFyXvvuxFECdvkqbOAn7mMPMQHG4VJHqULpjZHrETarmm/1r
         0C9z7QuALYp7NUH2f/oPbdTQ3Gx3qXR04725UBldyHZXX6djSPgCjrCDE13EHJShXg
         hH/qt9Ee5bP6NLuKCcXBIHOvosmuHGpvQoRp8vFopFoKPcoZOhOscM2dz1wtugninj
         y0f+sYbxPrdc1tc1LTwOxyoXm8VqbhMMMLuruZ4bXnG9LOWf7nBLzuYCwZ8PKFP8fM
         CM/2vmQglTK+kKsboflWaNb5ba6xYpTmYuJOQZap9egTeKPdstND8nseKtK9QDB2Qf
         RPWglDjaNUYmA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Corentin Labbe <clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Fix for s5p-mfc and resurrect zoran driver
Message-ID: <3f8a1094-0fa6-e539-345b-7bd3e953c840@xs4all.nl>
Date:   Mon, 28 Sep 2020 15:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCDNSOQh7KnqZ1WWefiHMmIaNB6jbv+iwnZjyq+D332wFibXK2zEwUROXjf2KCzZDcbx3NHbQ6JI1LA9Nwj5zK63pNHICcjkU8lauIlTU7ieCB7VyVU/
 GoLZ4Avhc60m1sCJ0rHUYrgTLZj5ocktF+jmFm4HMo8atmtS9a3H59efu0k1LymVrLDhslhyd2E+BaoaSb9ZIoSObW+lulQTwowBBwhw0ubxWsK2EnBGDiOD
 UzrGaMEHgSihPnn5KWcIGg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR has one s5p-mfc fix and the remainder is the resurrection of the
zoran driver. I've added two addition zoran patches that fix sparse and
smatch warnings.

There is some more cleanup to be done (I'll reply to the cover letter of
Corentin's series), output doesn't work yet (see TODO) and I also want to be
able to test this driver with some actual hardware before it can move out of
staging. Unfortunately, this may take some time since I won't have access to
the hardware until I am back in the Netherlands, and I don't know when that
will happen.

That said, I want to thank Corentin for all the hard work he did. It's wasn't
a trivial task.

Regards,

	Hans

The following changes since commit c0c8db7bc95397f32fe60ff8b07c746a69fb22de:

  media: MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC (2020-09-27 11:39:39 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10a

for you to fetch changes up to 7d35bb92600e0ed5c7877162959087eb9cbfce8a:

  zoran: fix sparse warnings (2020-09-28 15:16:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Corentin Labbe (47):
      staging: media: Revert "media: zoran: remove deprecated driver"
      MAINTAINERS: change maintainer of the zoran driver
      staging: media: zoran: datasheet is no longer available from zoran.com
      staging: media: zoran: Documentation: fix typo
      staging: media: zoran: fix checkpatch issue
      staging: media: zoran: do not forward declare zr36057_init_vfe
      staging: media: zoran: convert all error dprintk to pci_err/pr_err
      staging: media: zoran: convert dprintk warn
      staging: media: zoran: convert dprintk info to pci_info
      staging: media: zoran: convert dprintk debug
      staging: media: zoran: zoran_device.c: convert pr_x to pci_x
      staging: media: zoran: remove proc_fs
      staging: media: zoran: use VFL_TYPE_VIDEO
      staging: media: zoran: use v4l2_buffer_set_timestamp
      staging: media: zoran: do not print random guest 0
      staging: media: zoran: move buffer_size out of zoran_fh
      staging: media: zoran: move v4l_settings out of zoran_fh
      staging: media: zoran: move jpg_settings out of zoran_fh
      staging: media: zoran: move overlay_settings out of zoran_fh
      staging: media: zoran: Use video_drvdata to get struct zoran
      staging: media: zoran: Change zoran_v4l_set_format parameter from zoran_fh to zoran
      staging: media: zoran: remove overlay
      staging: media: zoran: Use DMA coherent for stat_com
      staging: media: zoran: use ZR_NORM
      staging: media: zoran: zoran does not support STD_ALL
      staging: media: zoran: convert irq to pci irq
      staging: media: zoran: convert zoran alloc to devm
      staging: media: zoran: convert mdelay to udelay
      staging: media: zoran: use devm for videocodec_master alloc
      staging: media: zoran: use pci_request_regions
      staging: media: zoran: use devm_ioremap
      staging: media: zoran: add stat_com buffer
      staging: media: zoran: constify struct tvnorm
      staging: media: zoran: constify codec_name
      staging: media: zoran: Add more check for compliance
      staging: media: zoran: Add vb_queue
      staging: media: zoran: disable output
      staging: media: zoran: device support only 32bit DMA address
      staging: media: zoran: enable makefile
      staging: media: zoran: remove framebuffer support
      staging: media: zoran: add vidioc_g_parm
      staging: media: zoran: remove test_interrupts
      staging: media: zoran: fix use of buffer_size and sizeimage
      staging: media: zoran: fix some compliance test
      staging: media: zoran: remove deprecated .vidioc_g_jpegcomp
      staging: media: zoran: convert to vb2
      staging: media: zoran: update TODO

Hans Verkuil (2):
      zoran: fix smatch warning
      zoran: fix sparse warnings

Marek Szyprowski (1):
      media: platform: s5p-mfc: Fix adding a standard frame skip mode control

 Documentation/media/v4l-drivers/zoran.rst    |  575 +++++++++++++++++++++++
 MAINTAINERS                                  |   10 +
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c |    1 +
 drivers/staging/media/Kconfig                |    2 +
 drivers/staging/media/Makefile               |    1 +
 drivers/staging/media/zoran/Kconfig          |   76 ++++
 drivers/staging/media/zoran/Makefile         |    7 +
 drivers/staging/media/zoran/TODO             |   19 +
 drivers/staging/media/zoran/videocodec.c     |  330 ++++++++++++++
 drivers/staging/media/zoran/videocodec.h     |  308 +++++++++++++
 drivers/staging/media/zoran/zoran.h          |  320 +++++++++++++
 drivers/staging/media/zoran/zoran_card.c     | 1333 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/zoran/zoran_card.h     |   30 ++
 drivers/staging/media/zoran/zoran_device.c   | 1013 +++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/zoran/zoran_device.h   |   64 +++
 drivers/staging/media/zoran/zoran_driver.c   | 1037 ++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/zoran/zr36016.c        |  433 ++++++++++++++++++
 drivers/staging/media/zoran/zr36016.h        |   92 ++++
 drivers/staging/media/zoran/zr36050.c        |  842 ++++++++++++++++++++++++++++++++++
 drivers/staging/media/zoran/zr36050.h        |  163 +++++++
 drivers/staging/media/zoran/zr36057.h        |  154 +++++++
 drivers/staging/media/zoran/zr36060.c        |  872 +++++++++++++++++++++++++++++++++++
 drivers/staging/media/zoran/zr36060.h        |  201 ++++++++
 23 files changed, 7883 insertions(+)
 create mode 100644 Documentation/media/v4l-drivers/zoran.rst
 create mode 100644 drivers/staging/media/zoran/Kconfig
 create mode 100644 drivers/staging/media/zoran/Makefile
 create mode 100644 drivers/staging/media/zoran/TODO
 create mode 100644 drivers/staging/media/zoran/videocodec.c
 create mode 100644 drivers/staging/media/zoran/videocodec.h
 create mode 100644 drivers/staging/media/zoran/zoran.h
 create mode 100644 drivers/staging/media/zoran/zoran_card.c
 create mode 100644 drivers/staging/media/zoran/zoran_card.h
 create mode 100644 drivers/staging/media/zoran/zoran_device.c
 create mode 100644 drivers/staging/media/zoran/zoran_device.h
 create mode 100644 drivers/staging/media/zoran/zoran_driver.c
 create mode 100644 drivers/staging/media/zoran/zr36016.c
 create mode 100644 drivers/staging/media/zoran/zr36016.h
 create mode 100644 drivers/staging/media/zoran/zr36050.c
 create mode 100644 drivers/staging/media/zoran/zr36050.h
 create mode 100644 drivers/staging/media/zoran/zr36057.h
 create mode 100644 drivers/staging/media/zoran/zr36060.c
 create mode 100644 drivers/staging/media/zoran/zr36060.h
