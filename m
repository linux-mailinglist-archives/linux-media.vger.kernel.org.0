Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A57C22D777
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 10:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfE2IOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 04:14:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34865 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfE2IOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 04:14:07 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vtilh3iPl3qlsVtimhs8iH; Wed, 29 May 2019 10:14:04 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Add MPEG-2 decoding to Rockchip VPU
Message-ID: <2ec67b1f-d34b-6967-151b-451e78ee756c@xs4all.nl>
Date:   Wed, 29 May 2019 10:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfID9GNtLTJqOPL8i9r5UevjZAjoT9GoXZzpJIMMEc6JM2EJ5WXbMiRFFjZ5+ild0mbuSVsrfNlsEfTp2Ua2lnMBg1nZ3JRTA9ubF+Rcn4Z6y3jWGUg8I
 EJlgAY+6HcFDTOdXGe8pAKbGgDOyG+Ib0aFUG9Qc1nQJgKeGZoO4NbXQnSNayGKYEqz8QLXY6Y5cX75XTjfcenMAjJbulQmtbj3ZoLmUULgF0OI4vAKzLC3U
 LVhJUBa4/QEtz6zxiGvly+0n1oZdRqXPyobidg/g1k2/THf8XN371LN64P93E0ymJ9kXwyTQ83uXxr8JD4z/9YH8TZkdFkonEUNal3k7mxM9xsd1OzBWlRKN
 LnrftJF5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ezequiel, Boris,

This is the v6 patch series minus the last patch since a bindings update is
needed for that final patch as well.

Regards,

	Hans

The following changes since commit 39cb46751e2fbb72e0698f80e339db1fd4e1f50e:

  media: imx7-media-csi: Change imx7_csi_enable() to void (2019-05-28 14:20:12 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3g

for you to fetch changes up to e568d2cc1ef613dd5094f0ad69fbe60138688aa3:

  rockchip/vpu: Add support for MPEG-2 decoding on RK3288 (2019-05-29 09:42:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (8):
      media: v4l2-common: Fix v4l2_fill_pixfmt[_mp]() prototypes
      media: v4l2-common: Add an helper to apply frmsize constraints
      media: v4l2-common: Support custom imagesize in fill_pixfmt()
      rockchip/vpu: Use v4l2_apply_frmsize_constraints() where appropriate
      rockchip/vpu: Rename rockchip_vpu_common.h into rockchip_vpu_v4l2.h
      rockchip/vpu: Move encoder logic to a common place
      rockchip/vpu: Provide a helper to reset both src and dst formats
      rockchip/vpu: Prepare things to support decoders

Ezequiel Garcia (4):
      rockchip/vpu: Open-code media controller register
      rockchip/vpu: Support the Request API
      rockchip/vpu: Add decoder boilerplate
      rockchip/vpu: Add support for non-standard controls

Jonas Karlman (3):
      rockchip/vpu: Add infra to support MPEG-2 decoding
      rockchip/vpu: Add MPEG2 decoding support to RK3399
      rockchip/vpu: Add support for MPEG-2 decoding on RK3288

 drivers/media/v4l2-core/v4l2-common.c                                            |  90 ++++-
 drivers/staging/media/rockchip/vpu/Kconfig                                       |   1 +
 drivers/staging/media/rockchip/vpu/Makefile                                      |   7 +-
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c                               |  59 +++-
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c                      |   2 +-
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c                     | 261 ++++++++++++++
 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h                             |   1 +
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c                               |  59 +++-
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c                      |   8 +-
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c                     | 267 +++++++++++++++
 drivers/staging/media/rockchip/vpu/rockchip_vpu.h                                | 110 +++++-
 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c                            | 465 +++++++++++++++++++++----
 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c                            | 571 -------------------------------
 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h                             |  16 +
 drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c                          |  61 ++++
 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c                           | 692 ++++++++++++++++++++++++++++++++++++++
 .../staging/media/rockchip/vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h}    |  15 +-
 include/media/v4l2-common.h                                                      |  10 +-
 18 files changed, 2012 insertions(+), 683 deletions(-)
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_mpeg2_dec.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_mpeg2.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
 rename drivers/staging/media/rockchip/vpu/{rockchip_vpu_common.h => rockchip_vpu_v4l2.h} (50%)
