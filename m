Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0507E32D1B7
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 12:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239565AbhCDLYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 06:24:54 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50939 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239561AbhCDLYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 06:24:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Hm57lZvEuOruFHm5AlFSYw; Thu, 04 Mar 2021 12:23:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614857033; bh=5kKnQ1BpA9W7rHHjtMkcsOrn5W1M2hcwOipk1DFsjFQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c/xwHwtJGOL4WD5rL5ubR/+sfGqi/9AWaOfo7pqDxxLTqVufzWc5+SyAj9A0ct3id
         XbvAfFYZHcoOa0u7En3bAKtLWreQNGCRj56Shcohu4pz/dRRZtfim3EjGE52XIy0DH
         qFk8Cdu2E0Z/hAMc2imn3ZWwmlDPqVXOsTGym6urExJpBpYuUR//Pv9ritc0dyP1Xh
         DdjCXIPmfiOerH9x52n8XlcU2467tXwymUwD8AfhyG9c+dmhj5XozySIaSXppK52La
         JzMcO+jUtef2BnFMa3Zw3jU4Uqh8XT9pxhdYVHSvL2QNAFAJ3YKFxRS/sgbr6vFWO9
         nxQxTtzzYZcKQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes and cleanups
Message-ID: <0807c7b9-52f0-e680-1320-e52703722a69@xs4all.nl>
Date:   Thu, 4 Mar 2021 12:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHKooW2a7TU4+IAHa2DuhfE0cN42B7GvzpUc/tWds2vkCCAw5mC9DEvNGoZl7FgjzeAkC8XfQ7Yi351fWlV38UrbCfWqZvhS03xJjqI4LiHCxKRdPfrn
 dvPrXOn2PEqRbJhB3E+htUXU5mNkE7Ll/Vxns9SrFvrLIGCK1PoxUZO1uNWmINj+WPr7SG+/Gs9W6KQ3doRRWHv8SxzF4jCRscc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13d

for you to fetch changes up to 6a8c16e5ba64bb13a42cf1fb598429bd081a407a:

  media: ngene: switch from 'pci_' to 'dma_' API (2021-03-04 11:33:41 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Brad Love (2):
      cx23885: add more quirks for reset DMA on some AMD IOMMU
      cx23885: Fix various Hauppauge device analog capture inputs

Christophe JAILLET (1):
      media: ngene: switch from 'pci_' to 'dma_' API

Colin Ian King (2):
      media: vivid: fix assignment of dev->fbuf_out_flags
      media: drxj: remove redundant assignments to variable image_to_select

Dafna Hirschfeld (1):
      media: rkisp1: rsz: crash fix when setting src format

Davidlohr Bueso (1):
      media/siano: kill pointless kmutex definitions

Hans Verkuil (1):
      media: fix incorrect kernel doc usages

Jae Hyun Yoo (1):
      media: aspeed: fix clock handling logic

Jiapeng Chong (1):
      media: ti-vpe: Simplify bool comparison

Jonathan Neuschäfer (1):
      media: dvbdev: Switch to new kerneldoc syntax for named variable macro argument

Liu Shixin (1):
      media: anysee: simplify the return expression of anysee_ci_* function

Qinglang Miao (1):
      media: ngene: simplify the return expression of eeprom_write_ushort()

Tasos Sahanidis (2):
      media: saa7134: use sg_dma_len when building pgtable
      media: saa7146: use sg_dma_len when building pgtable

Tom Rix (1):
      b2c2: remove trailing semicolon in macro definition

Tomi Valkeinen (1):
      media: v4l2-subdev.rst: typo fix

Wolfram Sang (1):
      media: i2c: adv7511: remove open coded version of SMBus block read

Yang Yingliang (1):
      omap4iss: return error code when omap4iss_get() failed

 Documentation/driver-api/media/v4l2-subdev.rst          |  2 +-
 drivers/clk/clk-ast2600.c                               |  4 ++--
 drivers/media/common/b2c2/flexcop-hw-filter.c           |  2 +-
 drivers/media/common/saa7146/saa7146_core.c             |  2 +-
 drivers/media/common/saa7146/saa7146_video.c            |  3 +--
 drivers/media/common/siano/smscoreapi.c                 | 42 ++++++++++++++++----------------
 drivers/media/common/siano/smscoreapi.h                 |  5 ----
 drivers/media/common/siano/smsdvb-main.c                | 14 +++++------
 drivers/media/common/videobuf2/frame_vector.c           |  1 -
 drivers/media/dvb-core/dvb_ca_en50221.c                 | 32 +++++++++++++------------
 drivers/media/dvb-frontends/drx39xyj/drxj.c             |  2 +-
 drivers/media/i2c/adv7511-v4l2.c                        | 58 ++++++++++++++++++++-------------------------
 drivers/media/i2c/imx274.c                              |  7 +++---
 drivers/media/i2c/s5k6aa.c                              |  2 +-
 drivers/media/pci/cx23885/cx23885-cards.c               | 28 +++++++++++-----------
 drivers/media/pci/cx23885/cx23885-core.c                |  9 +++++++
 drivers/media/pci/ngene/ngene-cards.c                   |  6 +----
 drivers/media/pci/ngene/ngene-core.c                    | 56 +++++++++++++++++++++----------------------
 drivers/media/pci/saa7134/saa7134-core.c                |  2 +-
 drivers/media/platform/aspeed-video.c                   |  9 ++++---
 drivers/media/platform/exynos4-is/media-dev.c           |  2 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  4 ++--
 drivers/media/platform/mtk-vpu/mtk_vpu.c                |  4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c |  9 +++----
 drivers/media/platform/ti-vpe/vpdma.c                   |  3 +--
 drivers/media/platform/vsp1/vsp1_dl.c                   |  2 +-
 drivers/media/rc/img-ir/img-ir-hw.c                     |  2 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c        |  2 +-
 drivers/media/tuners/mt2063.c                           |  6 ++---
 drivers/media/usb/dvb-usb-v2/anysee.c                   | 21 +++-------------
 drivers/media/usb/pwc/pwc-dec23.c                       |  2 +-
 drivers/media/v4l2-core/v4l2-jpeg.c                     |  2 +-
 drivers/staging/media/omap4iss/iss.c                    |  4 +++-
 include/media/dvbdev.h                                  |  2 +-
 34 files changed, 168 insertions(+), 183 deletions(-)
