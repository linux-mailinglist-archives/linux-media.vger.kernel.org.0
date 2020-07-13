Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F7121D46C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgGMLDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:03:14 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:52871 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729043AbgGMLDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:03:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwEgj6s9tGLmCuwEjjB1dN; Mon, 13 Jul 2020 13:03:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594638190; bh=7BwEcR7/VJLkjy4dPuDZlsisdJfI8yy61lGPpGCzfqk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rlM0ehFf+6PigQoDhmbKnuOu0ER9L/OYD1DBt91asbHjR4Q4Kyx9owowlxZo2TwDt
         TG4LQD4XGdmviOzsVOeBDqvQcnH6fDGCnZowmpoycWWxEKFJDghHm8Himyv/oA2LYE
         iLfKx6O8D2DMCd3tH/o4Pd1OD1996jgBwRYPDWLT+EnQP1i3S9Qk2jw2zseAWrL+vq
         q3qKlfaoaIva2CZH5P3ZMS0lIv1rIImCUH7PdbaQkx2N3SPfjR6sH8ZVIFUSJLgQxq
         OcxeSljq3vAI/1E/Z20Gebo0/LG/hCYfBPZKR4HKhDZ96EqDOMAzj19NsEwu7C4Mxt
         +++wXrpd5Kc/g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes/enhancements
Message-ID: <46c3bb00-2d14-cbd1-0b7c-58566096295e@xs4all.nl>
Date:   Mon, 13 Jul 2020 13:03:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfONQQX/QhANBe0nv1uZr9e5a+5Pq+b5gOQLJ36huk/GKJCLYIbE06Giri6sXGkmNzeoxYV6A92Cjsk+2BGXL7jnm1kma/nYnrtbcYK5XcBJouww9wHjI
 QSJ9al944NtvEru8xcQz/deXDsNVRUyj3drs13vjUvjv7gBhC6SFR+wKn+Rg0vTygBnc4lN4o+5O8ttqXEBJqy9SGTyZwo1kxo4APEDZGKYlIHCYC9A+Fkg3
 yvOcKghoVCv3NfYolshiuqNebPaqK2bP8zePKiSw+vzFFESCz0crSibuQasT79iC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9g

for you to fetch changes up to b5cfde9ff04b0caaee587ead5e7ca673aa46eab8:

  staging/media: Remove unneeded geometry restrictions from i.MX CSI driver (2020-07-13 12:36:59 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (6):
      media: staging: rkisp1: use a macro for the statistics flags mask
      media: staging: rkisp1: stats: replace spin_lock_irqsave with spin_lock_irq
      media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with one lock
      media: staging: rkisp1: stats: read the stats in the isr
      media: staging: rkisp1: remove duplicate macro definition
      media: staging: rkisp1: fix typos in file rkisp1-config.h

Evgeny Novikov (1):
      media: vpss: clean up resources in init

Ezequiel Garcia (8):
      hantro: h264: Remove unused macro definition
      hantro: h264: Rename scaling list handling function
      hantro: Rework how encoder and decoder are identified
      hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done
      hantro: Remove unused bytesused argument
      hantro: Make sure we don't use post-processor on an encoder
      rkvdec: h264: Refuse to decode unsupported bitstream
      hantro: h264: Refuse to decode unsupported bitstream

Kaaira Gupta (3):
      media: tpg: change char argument to const char
      media: tpg: Add function to return colors' order of test image
      media: vimc: Add a control to display info on test image

Krzysztof Hałasa (1):
      staging/media: Remove unneeded geometry restrictions from i.MX CSI driver

 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c     |  40 +++++++++++++++---
 drivers/media/platform/davinci/vpss.c             |  20 +++++++--
 drivers/media/test-drivers/vimc/Kconfig           |   2 +
 drivers/media/test-drivers/vimc/vimc-common.h     |   1 +
 drivers/media/test-drivers/vimc/vimc-core.c       |  10 +++++
 drivers/media/test-drivers/vimc/vimc-sensor.c     |  71 +++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro.h             |  13 ++----
 drivers/staging/media/hantro/hantro_drv.c         |  94 +++++++++++++++++++----------------------
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c |  17 ++++++++
 drivers/staging/media/hantro/hantro_h264.c        |   6 +--
 drivers/staging/media/hantro/hantro_hw.h          |   5 ++-
 drivers/staging/media/hantro/hantro_v4l2.c        |  28 ++++++------
 drivers/staging/media/hantro/imx8m_vpu_hw.c       |   2 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c      |   8 ++--
 drivers/staging/media/hantro/rk3399_vpu_hw.c      |   7 ++-
 drivers/staging/media/imx/imx-ic-prp.c            |   4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c       |   4 +-
 drivers/staging/media/imx/imx-media-csi.c         |   4 +-
 drivers/staging/media/imx/imx-media-vdic.c        |   4 +-
 drivers/staging/media/rkisp1/TODO                 |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h      |  12 +++---
 drivers/staging/media/rkisp1/rkisp1-isp.c         |   5 +--
 drivers/staging/media/rkisp1/rkisp1-regs.h        |   1 -
 drivers/staging/media/rkisp1/rkisp1-stats.c       | 117 +++++++--------------------------------------------
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h |   4 +-
 drivers/staging/media/rkvdec/rkvdec.c             |  27 ++++++++++++
 include/media/tpg/v4l2-tpg.h                      |   3 +-
 27 files changed, 285 insertions(+), 225 deletions(-)
