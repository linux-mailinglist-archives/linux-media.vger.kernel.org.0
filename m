Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785F021D4FA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgGMLay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39095 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727890AbgGMLax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfbjB4tK; Mon, 13 Jul 2020 13:30:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639851; bh=jyA+70r3Q3Sno8H2+1OYpHs6iSwppMHGl/ApNAs08e0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=WYqoD0CbJRt+K/NTAddBU/xguLr4q5PxW5ywlJ8wZlh+ILNoE54KXTD0Enzy6o6E1
         E+pCzlqrTr/43koonU+R3G2bYg4liI/HAf9PbUmx+ZOsdWVfUwgBeHGa60R2cpOWWe
         ADZxrCsUmbN6qGsmHeneyyO0mzH3SXrtRPTA+rS9M8s9fG+6m/6Ugiy7VlOPnwSPSq
         GitnSxspEmtAOI6vpmddT7evPmtLz4MQZVDUjbDIGWINWC5H48FZ2G8T49fhHjp71V
         ORXpPCj5AYWfGdYUb70YYUhfErrnZ7H7yBUGpjmhFTvXwkRc5b72AOZoUBghpWuuWh
         mGBrqhHg90bXA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv3 0/7] media: use vb2_video_unregister_device()
Date:   Mon, 13 Jul 2020 13:30:41 +0200
Message-Id: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOZxkyoHLYAmRBqX+0ux6JbIPr9IU5drBDSMO2NlpN9QmCUJU+SSZNKCt2hVmWxUMhexWBgrs9ZHAVZgDrFjfo/JTjOW1mvcPNNLqNXqZEWrzIQBxV4l
 xXPnW6Jkbjp/wM7WkEx6CzlOF8qLWkN8+AvPs/I7ShCm496frtNpHWFhqTTiIxSFpW74GEzoMGKG2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series supersedes this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/7e7e9841-7f3a-468b-01c8-5921e5c14df8@xs4all.nl/

This series checks drivers that use vb2_queue_release() incorrectly
and fixes them, and calls vb2_video_unregister_device() as well if the
driver set vdev->queue.

There are a lot more drivers that set vdev->queue and can probably
benefit from using vb2_video_unregister_device(), but that's something
for a future series.

The main focus of this series is to check for incorrect use of
vb2_queue_release().

Changes since v2: add patches 2-7.

Regards,

	Hans

Hans Verkuil (7):
  videobuf2-v4l2.c: add vb2_video_unregister_device helper function
  qcom/camss: use vb2_video_unregister_device()
  media/pci: use vb2_video_unregister_device()
  media/platform: drop vb2_queue_release()
  media/usb: use vb2_video_unregister_device()
  vimc: use vb2_video_unregister_device()
  staging/media: drop vb2_queue_release()

 .../media/common/videobuf2/videobuf2-v4l2.c   | 51 ++++++++++++++++---
 drivers/media/pci/dt3155/dt3155.c             |  3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  9 ++--
 drivers/media/pci/saa7134/saa7134-core.c      |  6 +--
 drivers/media/pci/saa7134/saa7134-empress.c   |  3 +-
 drivers/media/pci/saa7134/saa7134-go7007.c    |  2 +-
 drivers/media/pci/saa7134/saa7134-video.c     |  2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  6 +--
 drivers/media/pci/tw5864/tw5864-video.c       |  4 +-
 drivers/media/platform/aspeed-video.c         |  5 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  8 ---
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 -
 .../media/platform/qcom/camss/camss-video.c   | 12 +----
 .../media/platform/qcom/camss/camss-video.h   |  2 -
 drivers/media/platform/qcom/camss/camss.c     |  5 --
 drivers/media/platform/qcom/venus/vdec.c      |  8 +--
 drivers/media/platform/qcom/venus/venc.c      |  8 +--
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 +--
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  7 +--
 .../media/test-drivers/vimc/vimc-capture.c    |  7 +--
 drivers/media/test-drivers/vivid/vivid-core.c | 32 ++++++------
 drivers/media/usb/au0828/au0828-video.c       | 12 ++---
 drivers/media/usb/dvb-usb/cxusb-analog.c      | 13 ++---
 drivers/media/usb/usbtv/usbtv-video.c         |  4 +-
 drivers/staging/media/meson/vdec/vdec.c       |  8 +--
 drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
 drivers/staging/media/rkisp1/rkisp1-params.c  |  7 +--
 drivers/staging/media/rkisp1/rkisp1-stats.c   |  6 +--
 drivers/staging/media/tegra-video/vi.c        |  8 +--
 include/media/videobuf2-v4l2.h                | 17 +++++++
 32 files changed, 118 insertions(+), 152 deletions(-)

-- 
2.27.0

