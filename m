Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7575D2A7FC8
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 14:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbgKENlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 08:41:35 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:35783 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgKENlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 08:41:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id afW5kDIcANanzafW9koY3v; Thu, 05 Nov 2020 14:41:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604583693; bh=VP6dbWRxrAKuhoR4NxxhJQNAbT31X4zT8zWCPhTm/TI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o9DIl5vNu36drW535C4SUYeeVY9VxywVfccUeWSSC/Xd1KyvYqsztUOF6RTLdXot4
         EZOQm3KIkZ/4h0YMOwD8iUB8E/M+MhdG5pc+NrpXWbcbtRK4l2YQBAw52uqhtY2R8p
         aCItDt3porqy/hel0dlPCmi9vSNMLWahKbWGwPYvPKmW6VehiLSbbv2Pd1ad/gQjrU
         pIpicXWZoIdi51gOD+MaGMibw0L/smMadX80UWxSQ3ZbeqTlnIqecO0Ty6uOHPCD+W
         TRyvP8OI24UOPfNoaXKXeNaWSVpD1x0s+r9Jv2Kqi/eY74rlzJd6/5CEp8zc7fyn0z
         fExlj38fagtvw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Various fixes
Message-ID: <01dbfda7-c126-8b8b-4af5-2cc767b34e19@xs4all.nl>
Date:   Thu, 5 Nov 2020 14:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJdq63qc4WpWc3HWMmEZZ0RkmhVbJVl1jlAhZ56vM7w3Y9Y9mSTphjrxp9L2+l3vCkyvG3+xXYNSlikMVJi479XV0MRBZcaswK9ZRaBm0nWGuipmg18A
 2AOf3LC71k751hzG1NiZWegoWq6k7ebY90Hf9JrODC55fqrfyl8zuAV2jIpr292CH09TZ6ReH9oHpAWCj35ACZ9u6NX2npIG26k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11e

for you to fetch changes up to 70b3b61d787d06a66a29e640d7b8cb633371e717:

  media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm() (2020-11-05 14:35:35 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (2):
      media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
      media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED

Evgeny Novikov (1):
      media: isif: reset global state

Ezequiel Garcia (2):
      coda: coda_buffer_meta housekeeping fix
      coda: Add a V4L2 user for control error macroblocks count

Hsin-Yi Wang (1):
      media: mtk-vcodec: remove allocated dma_parms

Liu Shixin (1):
      media: media/pci: simplify the return expression of verify_window_lock

Yu Kuai (6):
      media: platform: add missing put_device() call in mtk_jpeg_clk_init()
      media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_enc_pm()

Zhang Qilong (2):
      media: staging: rkisp1: cap: fix runtime PM imbalance on error
      media: cedrus: fix reference leak in cedrus_start_streaming

 Documentation/userspace-api/media/v4l/subdev-formats.rst | 27 +++++++++++++++++++++++
 drivers/media/pci/bt8xx/bttv-driver.c                    | 12 ++++------
 drivers/media/platform/coda/coda-bit.c                   | 52 ++++++++++++++++++++++++++++++++++++++------
 drivers/media/platform/coda/coda-common.c                | 18 +++++++++++++++
 drivers/media/platform/coda/coda.h                       | 11 ++++++++++
 drivers/media/platform/davinci/isif.c                    | 11 ++++++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          |  9 ++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c   |  9 +-------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 19 +++++++++++-----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c   |  9 +-------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c    | 28 ++++++++++++++++++------
 drivers/staging/media/rkisp1/TODO                        |  1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c            |  1 +
 drivers/staging/media/rkisp1/rkisp1-isp.c                |  8 +++----
 drivers/staging/media/sunxi/cedrus/cedrus_video.c        |  4 +++-
 include/uapi/linux/media-bus-format.h                    |  8 +++++++
 include/uapi/linux/v4l2-controls.h                       |  6 +++++
 17 files changed, 181 insertions(+), 52 deletions(-)
