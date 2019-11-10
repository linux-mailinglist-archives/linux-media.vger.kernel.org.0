Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E28EF68AD
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 12:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfKJLWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 06:22:03 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47251 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726609AbfKJLWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 06:22:02 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TlI2iNU03QBsYTlI7i1eJS; Sun, 10 Nov 2019 12:21:59 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes
Message-ID: <06580f57-7b93-3bfd-7fa5-ad25732f3606@xs4all.nl>
Date:   Sun, 10 Nov 2019 12:21:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMXQwRcf2KfesQuFeUFhvF8TnfBaCG/aRtjmt9WrLTldWAQiS+lyOrVP86+NA4GFM0PqDZLqPRDgsd5bObjC/TIQ/bG96tr8UGOqsxYbYOO69Rpd5/rQ
 vQj4BlDsxSjAIldSgk5/XBZVYNMryXwx0jTTXB7XWQ+F0d+2Wtbc9r9C9T3SVjCw6Pz4Yor2oB5hvA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably the last PR for 5.5.

Regards,

	Hans

The following changes since commit 693c5f144aeb9636ae161a3c61a838c50b2ae41c:

  media: vicodec: media_device_cleanup was called too early (2019-11-10 07:45:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5s

for you to fetch changes up to d18fd7e77774cf3da3e6dc136ad102298434046c:

  media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly (2019-11-10 12:12:28 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (2):
      dt-bindings: media: ti-vpe: Document VPE driver
      media: ti-vpe: vpe: fix compatible to match bindings

Colin Ian King (1):
      media: zr364xx: remove redundant assigmnent to idx, clean up code

Ezequiel Garcia (1):
      media: hantro: Fix s_fmt for dynamic resolution changes

Jonas Karlman (5):
      media: hantro: Fix H264 motion vector buffer offset
      media: hantro: Reduce H264 extra space for motion vectors
      media: hantro: Use output buffer width and height for H264 decoding
      media: hantro: Remove now unused H264 pic_size
      media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly

Nishad Kamdar (2):
      media: siano: Use the correct style for SPDX License Identifier
      media: i2c: Use the correct style for SPDX License Identifier

Ricardo Ribalda Delgado (1):
      Documentation: media: *_DEFAULT targets for subdevs

 Documentation/devicetree/bindings/media/ti,vpe.yaml     | 64 +++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/v4l2-selection-targets.rst |  4 ++-
 MAINTAINERS                                             |  1 +
 drivers/media/common/siano/smsir.h                      |  2 +-
 drivers/media/i2c/max2175.h                             |  4 +--
 drivers/media/i2c/saa711x_regs.h                        |  2 +-
 drivers/media/i2c/tda1997x_regs.h                       |  2 +-
 drivers/media/i2c/tvp5150_reg.h                         |  2 +-
 drivers/media/platform/ti-vpe/vpe.c                     |  2 +-
 drivers/media/usb/zr364xx/zr364xx.c                     |  6 ++---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c       | 37 +++++++++++++++++---------
 drivers/staging/media/hantro/hantro_h264.c              |  5 ----
 drivers/staging/media/hantro/hantro_hw.h                |  3 ---
 drivers/staging/media/hantro/hantro_v4l2.c              | 48 ++++++++++++++++++++++++++--------
 14 files changed, 139 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpe.yaml
