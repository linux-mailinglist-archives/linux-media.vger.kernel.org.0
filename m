Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C6B3FFBE8
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 10:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348249AbhICIZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 04:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348219AbhICIZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 04:25:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D36C061575
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 01:24:27 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M4UqmMeuNy7WyM4Urm9lPR; Fri, 03 Sep 2021 10:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630657465; bh=gaygJmDR828vjLCLOVdoLCEXtbI4Vv/QuJK9Y3W5aTY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JBX36qhd3UiK2tgBQTk69Y3n7Rv26tPg+BR8Or5Q9k2d4CXtkets1ge1nGwznfhiJ
         n+/WstambqiXvQ3sxSaIfg20uGvxYVC1EZkwirU+lLJIR0OTSFOyHlNUuxA8JPjmAl
         JsHbsu0r3s+yfuz+jrmWJ6K5w6NQuzLmAbxB3+8ADEZDSsPxOZCvYMxfmnesM5ZWcx
         W0N3yA1Z/BMIh1T/1hJlZ85I4e8WyjzaThv5r74EB9WDi5EGO0IEmQ+B9a06nIJSgQ
         PsqMP4iIEjx0FxPim0dxwxmnALfnYIffmwqu972RowhZ5WZnJkTaNGBs924359TpOY
         m0lBX8FnJswcQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Cai Huoqing <caihuoqing@baidu.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] v2: Various fixes
Message-ID: <127b030c-97ac-ef34-db13-60b1bfc49916@xs4all.nl>
Date:   Fri, 3 Sep 2021 10:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+5bDIaLadpinrDsyk24/LdKpFeW70PW6ZN3+iIYvVzlFsOuAlU+QK9wmbqs+o/gyCWab9F7+JMj8AUSmsQ1rWK9zxuT7YQhFcL/PLiHbQM3zK/xjPo
 A+6FyQLdYOik/UMLgjA0mY/RMbuYESRuBf4iucLtF/bcwj9Z56urfCujF1yBcbPQIfkxnb/HJqKsYIEwOJd4WeqG186oMOfqbLYLNXCOeALNNdwlwrXhwM7F
 IhvcAQ4eRCUVQ+tYVGWZUS0r7ELoBI2ex1wuqz6LJ4Eva/0ZM9d15gNE7to2lSaKhSmBg0oQxyUzzI9LeDrVn/IUrG1QJX9ZgZ83/UUqvrI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This supersedes the v1 pull request:

https://patchwork.linuxtv.org/project/linux-media/patch/7151eb26-7cea-aff8-24e5-587266b700c0@xs4all.nl/

Only change: dropped one patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20210802065924.1163-1-caihuoqing@baidu.com/

due to a kernel test robot report for that patch.

Regards,

	Hans

The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16c

for you to fetch changes up to 318afc9d4da02bbf31b14e1d3459f25812f91469:

  gspca: Limit frame size to sizeimage. (2021-09-03 10:20:16 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Cai Huoqing (2):
      media: videobuf2: Convert to SPDX identifier
      media: vim2m: Remove repeated verbose license text

Chad Fraleigh (1):
      gspca: Limit frame size to sizeimage.

Christophe JAILLET (4):
      media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
      media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
      media: pci/ivtv: switch from 'pci_' to 'dma_' API
      media: switch from 'pci_' to 'dma_' API

Dafna Hirschfeld (1):
      media: mtk-vcodec: venc: fix return value when start_streaming fails

Dan Carpenter (1):
      media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()

Deborah Brouwer (1):
      media: vivid: add signal-free time for cec message xfer

Evgeny Novikov (1):
      media: vidtv: Fix memory leak in remove

Ezequiel Garcia (1):
      media: Request API is no longer experimental

Fabio Estevam (2):
      media: imx7.rst: Provide an example for imx6ull-evk capture
      media: imx: TODO: Remove items that are already supported

Hans Verkuil (1):
      cec-pin: fix off-by-one SFT check

Liu Shixin (1):
      media: pvrusb2: Replaced simple_strtol() with kstrtoint()

Nadezda Lutovinova (1):
      media: s5p-mfc: Add checking to s5p_mfc_probe().

Nil Yi (1):
      media: usb: airspy: clean the freed pointer and counter

Tom Rix (2):
      media: TDA1997x: handle short reads of hdmi info frame.
      media: camss: vfe: simplify vfe_get_wm_sizes()

Tuo Li (1):
      media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()

Zev Weiss (1):
      media: aspeed-video: ignore interrupts that aren't enabled

lijian (1):
      media: via-camera: deleted these redundant semicolons

 Documentation/admin-guide/media/imx7.rst              |  60 +++++++++
 drivers/media/cec/core/cec-pin.c                      |   4 +-
 drivers/media/common/videobuf2/videobuf2-core.c       |   5 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |   5 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     |   5 +-
 drivers/media/common/videobuf2/videobuf2-memops.c     |   5 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c       |   5 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    |   5 +-
 drivers/media/firewire/firedtv-avc.c                  |  14 +-
 drivers/media/firewire/firedtv-ci.c                   |   2 +
 drivers/media/i2c/tda1997x.c                          |   8 +-
 drivers/media/mc/Kconfig                              |   8 --
 drivers/media/pci/cobalt/cobalt-driver.c              |   4 +-
 drivers/media/pci/cx18/cx18-driver.c                  |   2 +-
 drivers/media/pci/cx18/cx18-queue.c                   |  13 +-
 drivers/media/pci/cx18/cx18-streams.c                 |  16 +--
 drivers/media/pci/ddbridge/ddbridge-main.c            |   4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c         |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c                  |   2 +-
 drivers/media/pci/ivtv/ivtv-queue.c                   |  18 +--
 drivers/media/pci/ivtv/ivtv-streams.c                 |  22 ++--
 drivers/media/pci/ivtv/ivtv-udma.c                    |  19 ++-
 drivers/media/pci/ivtv/ivtv-yuv.c                     |  10 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c    |   2 +-
 drivers/media/pci/pluto2/pluto2.c                     |  20 +--
 drivers/media/pci/pt1/pt1.c                           |   2 +-
 drivers/media/pci/tw5864/tw5864-core.c                |   2 +-
 drivers/media/platform/aspeed-video.c                 |  16 +--
 drivers/media/platform/imx-jpeg/mxc-jpeg.c            |   2 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c    |   8 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c              |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c     |  20 +--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c     |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c     |   9 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c              |   6 +-
 drivers/media/platform/via-camera.c                   |   6 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c       |   1 +
 drivers/media/test-drivers/vim2m.c                    |   5 -
 drivers/media/test-drivers/vivid/vivid-cec.c          | 341 +++++++++++++++++++++++++++----------------------
 drivers/media/test-drivers/vivid/vivid-cec.h          |   9 +-
 drivers/media/test-drivers/vivid/vivid-core.c         |  38 +++---
 drivers/media/test-drivers/vivid/vivid-core.h         |  23 ++--
 drivers/media/usb/airspy/airspy.c                     |   5 +-
 drivers/media/usb/gspca/gspca.c                       |   2 +
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c              |  25 +---
 drivers/staging/media/imx/TODO                        |   5 -
 46 files changed, 424 insertions(+), 376 deletions(-)
