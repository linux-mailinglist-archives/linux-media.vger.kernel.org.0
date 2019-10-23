Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 242E7E1286
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 08:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732733AbfJWGyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 02:54:04 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33145 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732481AbfJWGyE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 02:54:04 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NAWsiKtGmHfodNAWviz8M9; Wed, 23 Oct 2019 08:54:02 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR v5.5] Add HEVC stateless decoder support
Message-ID: <860a9d97-7b8c-abc1-670d-57ea24312862@xs4all.nl>
Date:   Wed, 23 Oct 2019 08:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBdTZFULwSBzNRWydfse5Rw8cOfI0HbX75AI3M2mWfHchP8qW3KlG7D1lvDq+gRnor1Iz2DUjSPySypm1kokGv7KP4F5Z6c3iw6elLdty1GRiPGct8Ap
 tG/LcIGJ+ypt/6+alro0t23eBPMrKS5LrVSTc6mjyD9C9gFhCCEojJrwRa17GLcXN7DmN8he9IGG9fbhVB4l9ZoYygf54jNYaHE4uxfjqIpbfHB7svr/i1o8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Second version: this time based on the v9 series. See the cover letter
https://patchwork.linuxtv.org/cover/59597/ for the changes since the previous
pull request.

Regards,

	Hans

The following changes since commit 6ce1d376d33eb775331b36a38afa28f9f08945e3:

  media: docs-rst: Document m2m stateless video decoder interface (2019-10-21 07:43:45 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5g

for you to fetch changes up to 96422129978c4202242351a3b2ce05cd6022544b:

  media: cedrus: Add HEVC/H.265 decoding support (2019-10-23 08:38:56 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Paul Kocialkowski (5):
      media: cedrus: Fix undefined shift with a SHIFT_AND_MASK_BITS macro
      media: cedrus: Remove unnecessary parenthesis around DIV_ROUND_UP
      media: v4l: Add definitions for HEVC stateless decoding
      media: pixfmt: Document the HEVC slice pixel format
      media: cedrus: Add HEVC/H.265 decoding support

 Documentation/media/uapi/v4l/biblio.rst            |   9 +
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   | 553 +++++++++++++++++++++++++++++++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |  23 ++
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |  18 ++
 Documentation/media/videodev2.h.rst.exceptions     |   3 +
 drivers/media/v4l2-core/v4l2-ctrls.c               | 109 ++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile        |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  52 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |  18 ++
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |   9 +
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   | 616 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   4 +
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   | 302 ++++++++++++++++++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  10 +
 include/media/hevc-ctrls.h                         | 212 +++++++++++++++++
 include/media/v4l2-ctrls.h                         |   7 +
 17 files changed, 1925 insertions(+), 23 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
 create mode 100644 include/media/hevc-ctrls.h
