Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6A936F594
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhD3GK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:10:28 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60435 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229508AbhD3GK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:10:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cMLGlfqONk1MGcMLLlRsFp; Fri, 30 Apr 2021 08:09:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619762979; bh=BoAHDx1QC101QMSwo5RItLWD/yuPIxRyAHDPVEwnPOQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kgzXiJl8joRfsXyE0d5urD3JBwOfaxp89rlc0Umxq/dd0cQ+cOJ1CI+LzwyqqrNVA
         JkIRinizPuCIBIzMNNweRWuQlph+qv2tDIb4te1b8+Rp/4QrBV8I9wWnDZhtrK7O8t
         FZiEBB4joXp29qirDpiSCuaka0wIcSOP4Es+a0BQlHn2XAmSfHzTjiuzslPAKN1mQX
         uQigSdL8WME9DTrZFKnvFWQNIstJWW+pbW8CdBCHJdzh5lnCG5TBFAxQEyptCyKDfM
         XVLK5zC9IlJFN3Tzi1ts9hCBIL2oyhU7Ri7Al3Kiedt5Pf0hGHBtnTNMkA8VJ0I0PB
         GWhrXyKnkkilw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] MPEG-2 stateless API cleanup and destaging
Message-ID: <79eb0d83-1967-8caf-e205-b29beec6fa23@xs4all.nl>
Date:   Fri, 30 Apr 2021 08:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHvxd1ElFoqlbNnNb4rWuwIRmBCPsKOO5bFpCAro8lmYRe8r8ar1nUFZULQ4b089rPSX/IgXKrcZkPcNurkCRzYhVVfMK7lGDndouxG32STP59MrN5tq
 naMaY3VSxGX1sFyONC3QeZarE1yL5f/cRiJGcJJMCkEj+EdZm9xU4D5Uh5v9bp0gXdLSTYfpMJkkBdMejcVh/IEqslZIi9H6Z6Ah+RmXGCTJjHo0Q5YvMjyA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This series cleans up and destages the MPEG-2 stateless decoder API.

After this the only remaining staging codec API is that for HEVC. That will
require more work and also requires support for dynamic array controls, for
which I posted a patch series recently.

Many thanks to Ezequiel et al for working on this!

Regards,

	Hans

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14a

for you to fetch changes up to 210c886393c28ae158a32ec0208409d49a10414e:

  media: uapi: move MPEG-2 stateless controls out of staging (2021-04-30 07:58:16 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (10):
      media: uapi: mpeg2: Rename "quantization" to "quantisation"
      media: uapi: mpeg2: rework quantisation matrices semantics
      media: uapi: mpeg2: Cleanup flags
      media: uapi: mpeg2: Split sequence and picture parameters
      media: uapi: mpeg2: Move reference buffer fields
      media: hantro/cedrus: Remove unneeded slice size and slice offset
      media: uapi: mpeg2: Remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS
      media: uapi: Move the MPEG-2 stateless control type out of staging
      media: controls: Log MPEG-2 stateless control in .std_log
      media: uapi: move MPEG-2 stateless controls out of staging

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 214 +++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 217 --------------------------------
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |  11 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |  12 ++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |  18 ++-
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |   5 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                                | 122 ++++++++++++------
 drivers/staging/media/hantro/hantro_drv.c                           |   9 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c                  | 110 ++++++++--------
 drivers/staging/media/hantro/hantro_hw.h                            |   2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c                         |   2 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c              | 106 +++++++---------
 drivers/staging/media/sunxi/cedrus/cedrus.c                         |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h                         |   5 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                     |  10 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c                   |  97 +++++---------
 include/media/mpeg2-ctrls.h                                         |  82 ------------
 include/media/v4l2-ctrls.h                                          |  11 +-
 include/uapi/linux/v4l2-controls.h                                  | 112 +++++++++++++++++
 include/uapi/linux/videodev2.h                                      |   7 ++
 20 files changed, 610 insertions(+), 552 deletions(-)
 delete mode 100644 include/media/mpeg2-ctrls.h
