Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2671702A0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 16:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfGVOtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 10:49:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57391 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726084AbfGVOtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 10:49:00 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pZcVhcJVB0SBqpZcYhrpzj; Mon, 22 Jul 2019 16:48:59 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Add VP8/MPEG-2 support for rk3328
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
Message-ID: <7fdffe00-743a-e60d-b0da-561fd2c7e76d@xs4all.nl>
Date:   Mon, 22 Jul 2019 16:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO4tmnp4h4m+oxSC7AZfiqml0JfDBIdFtmXhhWcUnAem5J4DaEpKvVh70AYbRmkZVIS9VyyaA0EXzzjou2ux2wCCF3kYsiP7d1XZuNYe5cRjROgMHRQO
 2TY/tJ/WXH1TCtsSHfgUePw/QfNNT6PYYzLKXKqV3sbPNsUtyDlGdTyt1eIEuBAO4Of4GFMKSqse02SSMhFOU4V4ri1NJkoYO8w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR merges:

https://patchwork.linuxtv.org/project/linux-media/list/?series=354
https://patchwork.linuxtv.org/patch/56427/
https://patchwork.linuxtv.org/patch/56836/

Main claim to fame is the new VP8 support for stateless decoders.

Regards,

	Hans


The following changes since commit 3f98538c7673e5306a126fd3cb7e0a84abc170ee:

  Merge tag 'v5.3-rc1' into patchwork (2019-07-22 07:40:55 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4b

for you to fetch changes up to 3e28925c22fb2a4b8b5964dd5f39e2d515da136a:

  media: hantro: Add support for MPEG-2 decoding on RK3328 (2019-07-22 16:29:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (2):
      media: v4l2-ctrl: Move compound control validation
      media: v4l2-ctrl: Validate VP8 stateless decoder controls

Jonas Karlman (2):
      media: dt-bindings: rockchip: Document RK3328 VPU binding
      media: hantro: Add support for MPEG-2 decoding on RK3328

Pawel Osciak (1):
      media: uapi: Add VP8 stateless decoder API

ZhiChao Yu (1):
      media: hantro: Add support for VP8 decoding on rk3288

 Documentation/devicetree/bindings/media/rockchip-vpu.txt |  18 +-
 Documentation/media/uapi/v4l/biblio.rst                  |  10 +
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst         | 323 ++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/pixfmt-compressed.rst       |  20 ++
 drivers/media/v4l2-core/v4l2-ctrls.c                     | 157 ++++++++-----
 drivers/media/v4l2-core/v4l2-ioctl.c                     |   1 +
 drivers/staging/media/hantro/Kconfig                     |   2 +-
 drivers/staging/media/hantro/Makefile                    |   4 +-
 drivers/staging/media/hantro/hantro.h                    |  27 +++
 drivers/staging/media/hantro/hantro_drv.c                |   7 +
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c         | 526 +++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                 |  17 ++
 drivers/staging/media/hantro/hantro_v4l2.c               |   1 +
 drivers/staging/media/hantro/hantro_vp8.c                | 188 ++++++++++++++++
 drivers/staging/media/hantro/rk3288_vpu_hw.c             |  22 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c             |  17 ++
 include/media/v4l2-ctrls.h                               |   3 +
 include/media/vp8-ctrls.h                                | 110 +++++++++
 18 files changed, 1391 insertions(+), 62 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
 create mode 100644 include/media/vp8-ctrls.h
