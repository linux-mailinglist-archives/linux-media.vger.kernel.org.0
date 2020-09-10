Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB69C26451D
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 13:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgIJLHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 07:07:43 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45489 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730437AbgIJLFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 07:05:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GKORkZUkpPTBMGKOSkQvoC; Thu, 10 Sep 2020 13:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599735932; bh=9QYjeaNTg8/bOdcUrd5uW34pzlZsO8LVPaXq4AQuJQA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fFS9IqSAstw9lFT0l8nx383e+ZVJ4Y09GEwQoU+oAbr7v4q+aw9mzpiqfM1gN9Ro8
         4fOFX+mscVlCf5nJQ4JcRDoLPgrFYgbTZrNS2dC9qeeQnjL783jlSnay/nNLz85AFL
         4TgTZxkgvt0LM2AV4UfB9Thji9uXjgvrhxZnjeROWUtfPsV9MdohHJCQuEwSEX2YRi
         +8Z2OQP4tPFXKRqXlO5i2Ht3Jeym3Sw6xYMDWjc+IYi6tfj5qUgJ9fKoF3NeF48F3I
         2De5pb+Dy7TM6cc8rjqfWye6/NcWfO07zkSOHc0nOPa47Q/IZZL+lOSbAt7FX4JDep
         /tQbODNGelbBg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Various fixes and enhancements (CSC uAPI)
Message-ID: <707bbc69-b071-4fb0-71ff-a54eb87a60f9@xs4all.nl>
Date:   Thu, 10 Sep 2020 13:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNARoPMU0wUUH3+rsXCZZppV8587JmU35/DBVKNgqInNBFITniALY3z61zwOO9iN/OR8Q72875YJqsWPyGrUHXPA/NlkjqD7w/5DodONvXbcRW49Co9a
 ZiezZmDcYQ2DhVoRP3cCS61WOghYX77400bQXoPuBeVYd5iCwKQaOneT8700F7gf1TvnGYJ0OEo8BI5iZ8mP5NlZx0OnYCeZoNtaOiCLWH4+93cPffxkfoyB
 E4FNkiWGBGxa4x6ovXweIDl3NiO4Huuuh055u2/3FdDHnpsBqROK5VhrEEhVC7b3OAtd2CcBC5YrCCMD9/dD3BV71nr8kGph6S9YWHRLq/VQ7xbDfH99S2sW
 6sFrbdxy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR has the usual set of fixes, but this also adds support for the
CSC API that allows userspace to specify a desired colorspace/transfer
function/ycbcr encoding/quantization range when capturing video.

This is needed for rkisp1 and has been on my wish list for a long time.

Patches for v4l-utils to support this are ready and can be merged once
this is in.

Regards,

	Hans

The following changes since commit d034731bb4b4f2bf5f378231a6d99e59c2cb59f6:

  media: vivid: fix compile warning/error (2020-09-08 11:54:00 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10a

for you to fetch changes up to 5ea190237b156607be4c65139938ac094bc8b7ba:

  videobuf2: use sgtable-based scatterlist wrappers (2020-09-10 11:42:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (2):
      media: v4l2-mem2mem: always consider OUTPUT queue during poll
      media: v4l2-mem2mem: simplify poll logic

Corentin Labbe (1):
      MAINTAINERS: media: cec: fix files location

Dafna Hirschfeld (6):
      v4l2: add support for colorspace conversion API (CSC) for video capture
      media: vivid: Add support to the CSC API
      v4l2: extend the CSC API to subdevice.
      media: staging: rkisp1: allow quantization setting by userspace on the isp source pad
      media: staging: rkisp1: rsz: set flags to 0 in enum_mbus_code cb
      media: mtk-mdp: Fix Null pointer dereference when calling list_add

Dinghao Liu (1):
      media: mx2_emmaprp: Fix memleak in emmaprp_probe

Greg Kroah-Hartman (1):
      media: usb: uvc: no need to check return value of debugfs_create functions

Hans Verkuil (2):
      cec-core.c: stop kthread_config before kthread
      cec-adap.c: add 'unregistered' checks

Marek Szyprowski (2):
      media: pci: fix common ALSA DMA-mapping related codes
      videobuf2: use sgtable-based scatterlist wrappers

Sowjanya Komatineni (1):
      media: tegra-video: Fix compilation warning of unused variable

Tom Rix (2):
      media: tc358743: initialize variable
      media: tc358743: cleanup tc358743_cec_isr

Wei Yongjun (1):
      media: marvell-ccic: mmp: mark PM functions as __maybe_unused

 Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst           | 16 +++---------
 Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst                  | 64 ++++++++++++++++++++++++++++++++++++++++++++----
 Documentation/userspace-api/media/v4l/subdev-formats.rst               | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst              | 35 +++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst | 51 ++++++++++++++++++++++++++++++++++++++-
 Documentation/userspace-api/media/videodev2.h.rst.exceptions           |  5 ++++
 MAINTAINERS                                                            | 16 ++++++------
 drivers/media/cec/core/cec-adap.c                                      |  6 +++++
 drivers/media/cec/core/cec-core.c                                      |  2 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c                  | 34 ++++++++++++--------------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c                      | 32 +++++++++---------------
 drivers/media/common/videobuf2/videobuf2-vmalloc.c                     | 12 +++------
 drivers/media/i2c/tc358743.c                                           | 14 ++++++-----
 drivers/media/pci/cx23885/cx23885-alsa.c                               |  4 +--
 drivers/media/pci/cx25821/cx25821-alsa.c                               |  4 +--
 drivers/media/pci/cx88/cx88-alsa.c                                     |  6 ++---
 drivers/media/pci/saa7134/saa7134-alsa.c                               |  4 +--
 drivers/media/platform/marvell-ccic/mmp-driver.c                       |  4 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c                          |  2 +-
 drivers/media/platform/mx2_emmaprp.c                                   |  7 ++++--
 drivers/media/test-drivers/vivid/vivid-vid-cap.c                       | 38 ++++++++++++++++++++++++-----
 drivers/media/test-drivers/vivid/vivid-vid-common.c                    | 25 +++++++++++++++++++
 drivers/media/usb/uvc/uvc_debugfs.c                                    | 20 +++------------
 drivers/media/v4l2-core/v4l2-mem2mem.c                                 | 28 ++++-----------------
 drivers/staging/media/rkisp1/TODO                                      |  2 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c                          | 10 --------
 drivers/staging/media/rkisp1/rkisp1-isp.c                              | 20 ++++++++++++---
 drivers/staging/media/rkisp1/rkisp1-resizer.c                          |  1 +
 drivers/staging/media/tegra-video/vi.c                                 |  2 ++
 include/media/v4l2-common.h                                            | 29 ++++++++++++++++++++++
 include/uapi/linux/v4l2-mediabus.h                                     | 15 ++++++++++--
 include/uapi/linux/v4l2-subdev.h                                       | 10 +++++++-
 include/uapi/linux/videodev2.h                                         |  6 +++++
 33 files changed, 452 insertions(+), 167 deletions(-)
