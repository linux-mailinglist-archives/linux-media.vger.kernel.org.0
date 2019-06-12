Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33134242E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438361AbfFLLhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:37:21 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42267 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438329AbfFLLhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:37:20 -0400
Received: from [IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270] ([IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270])
        by smtp-cloud7.xs4all.net with ESMTPA
        id b1Z4hE9a55qKab1Z7h89R8; Wed, 12 Jun 2019 13:37:18 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Rename Rockchip VPU driver to Hantro, prepare for
 initial i.MX8M support
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
Message-ID: <42bb65b6-382c-662e-4ed0-1e164a0eced8@xs4all.nl>
Date:   Wed, 12 Jun 2019 13:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEbn16bBIEaWQpziOkopNhdjOXW3tsl6wjkmdbbnT1bStnW5Anm5d9RTGJQryvkunmIBwEmbTnGhFSEN7YtIK2rG8NRiuvhNCKaouvekzRxpTBRbJAR4
 ihtgLFFq/xmAA+Vppg4uCKy2wDGYKm8loHm1+QFpmLscZG7bBl77yMZCsYIpzAlrDacUAec7JoN8cLtBI6xNp98okKpfgImDDJ2PueYRIg/0RldFrUq4wC6d
 QOREcWs+P/+oQcuBiK4aRA7FtE8D+n75bKRsBxbnxdjguFrk23LdDdmEKTrvZIdkxJGuIzneaQeeerK+F1ZIAZpRdON9QN/ILHG07scrgNo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR contains patches 1-7 of this series:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg147710.html

Patch 8 is still waiting for an Acked-by so I postpone that and the
following patches for a future PR.

Let's do the rename now to get that out of the way.

Regards,

	Hans

The following changes since commit 4e8c120de9268fc26f583268b9d22e7d37c4595f:

  media: fdp1: Support M3N and E3 platforms (2019-06-11 12:29:54 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-hantro

for you to fetch changes up to 2f744a9d14e2779428f3e5b1110001cc37ce2afc:

  media: hantro: allow arbitrary number of clocks (2019-06-12 13:02:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Philipp Zabel (7):
      rockchip/vpu: rename from rockchip to hantro
      media: hantro: print video device name in addition to device node
      media: hantro: add PM runtime resume callback
      media: hantro: make irq names configurable
      media: hantro: add support for named register ranges
      media: hantro: add support for separate control block
      media: hantro: allow arbitrary number of clocks

 MAINTAINERS                                                               |   4 +-
 drivers/staging/media/Kconfig                                             |   4 +-
 drivers/staging/media/Makefile                                            |   2 +-
 drivers/staging/media/hantro/Kconfig                                      |  23 ++
 drivers/staging/media/hantro/Makefile                                     |  15 ++
 drivers/staging/media/{rockchip/vpu => hantro}/TODO                       |   0
 drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h}    | 167 +++++++------
 .../media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c}        | 331 +++++++++++++------------
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c                        | 260 ++++++++++++++++++++
 drivers/staging/media/hantro/hantro_g1_regs.h                             | 301 +++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c                         | 125 ++++++++++
 drivers/staging/media/hantro/hantro_h1_regs.h                             | 154 ++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                                  | 102 ++++++++
 .../media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c}      |  18 +-
 drivers/staging/media/hantro/hantro_jpeg.h                                |  13 +
 .../media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c}    |  14 +-
 .../media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c}      | 234 +++++++++---------
 .../media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h}      |  16 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c                              | 187 ++++++++++++++
 drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c            |  77 +++---
 drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c   |  32 +--
 drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c  |  37 ++-
 drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h          |   2 +-
 drivers/staging/media/rockchip/vpu/Kconfig                                |  14 --
 drivers/staging/media/rockchip/vpu/Makefile                               |  14 --
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c                        | 177 --------------
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c               | 125 ----------
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c              | 261 --------------------
 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h                      | 443 ----------------------------------
 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h                      | 102 --------
 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h                    |  14 --
 31 files changed, 1667 insertions(+), 1601 deletions(-)
 create mode 100644 drivers/staging/media/hantro/Kconfig
 create mode 100644 drivers/staging/media/hantro/Makefile
 rename drivers/staging/media/{rockchip/vpu => hantro}/TODO (100%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h} (66%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c} (69%)
 create mode 100644 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
 create mode 100644 drivers/staging/media/hantro/hantro_h1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hw.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c} (95%)
 create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c} (79%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c} (69%)
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h} (53%)
 create mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c (65%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c (86%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c (92%)
 rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h (99%)
 delete mode 100644 drivers/staging/media/rockchip/vpu/Kconfig
 delete mode 100644 drivers/staging/media/rockchip/vpu/Makefile
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h
