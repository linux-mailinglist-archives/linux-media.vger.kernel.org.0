Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D6C348BF0
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCYIxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:53:24 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49025 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhCYIxL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:53:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id PLjml58qHCAEGPLjqlclS2; Thu, 25 Mar 2021 09:53:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616662390; bh=B7AaR/XrF6v4Q7XsH6H4exyqn2zs0jCIxzKAMOIbfoY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vTR10EpdkrEXcT/zV5OPOhVmuIkvKgeiMmC3Uza4MB5ZhWiQ+pcSyLQTCfxNdNPl7
         mktdaIFUj/0SL9rvtVyYKS5TJSe63xyGO1M126mnOVOGllouDr3GoVSYj8luujMyhW
         nYk6SPHToxQZaKZNRnM+qV3WTZN1nTXLL3df+JE5ZJbjsb+O55CkAaB8nCAEYnGysn
         NzeWBT63PgO1rajdF8e7wUX6D/xrn2rIdZb98yhDe1/wUll/JSwR1I1nIlF4x0gwB0
         WVEZ0OSFjt2ZjjBFkrEI/weOGi+fPX17QhkjwNT7JGVdSuf7UMz4YVQPp/xP+B62T2
         Mc8vG+5zWlv4Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <040ce89b-442d-3a2a-f574-6ec223df245a@xs4all.nl>
Date:   Thu, 25 Mar 2021 09:53:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFmQ/4G6NRc5AusueFjLON8/nHz9ElDjQpDMHHrh2pAuomWY8P8lulUvpy6yrYCbXWSwLkjdVhzsJmqqxcsCG0paizzLEv9Xt+KaZwH9I670W7DnCWPN
 K5+St5U2ZGjfbMfoCipA7EkVwlsOwiA+dorWXu5s5xzpsszzzv1lT+9unlpTXJmBTd3YUrVRMk/Fm8yAMYO8LBERwzZr5YKea6U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13b

for you to fetch changes up to 50e4b86dc9d649e4c1348feec131d12bc5758d28:

  vivid: update EDID (2021-03-25 09:52:09 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Bhaskar Chowdhury (3):
      media: atomisp: fix a typo
      media: entity: A typo fix
      media: cx88: Fix a typo

Colin Ian King (2):
      media: imx-jpeg: Fix spelling mistake "Canot" -> "Cannot"
      media: imx-jpeg: Pass the v4l2_jpeg_header header argument by reference

Dafna Hirschfeld (1):
      media: rkisp1: uapi: document which flags/structs relate to statistics config

Ezequiel Garcia (1):
      media: hantro: fix kernel-doc warnings and style

Hans Verkuil (8):
      allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
      s3c-camif/camif-core.h: fix kernel-doc warnings
      s5p-jpeg/jpeg-core.h: fix kernel-doc warnings
      exynos-gsc/gsc-core.h: fix kernel-doc warnings
      exynos4-is: fix kernel-doc warnings
      s5p-mfc/s5p_mfc_common.h: fix kernel-doc warnings
      cobalt: fix initial EDID
      vivid: update EDID

Muhammad Usama Anjum (1):
      media: em28xx: fix memory leak

Wei Yongjun (2):
      media: imx-jpeg: Fix error return code in mxc_jpeg_probe()
      media: imx-jpeg: Fix return value check in mxc_jpeg_attach_pm_domains()

Xiaofeng Cao (1):
      drivers/media/pci/bt8xx/bttv-cards: fix typos

 drivers/media/pci/bt8xx/bttv-cards.c            | 20 ++++++++++----------
 drivers/media/pci/cobalt/cobalt-driver.c        | 10 +++++-----
 drivers/media/pci/cx88/cx88-cards.c             |  2 +-
 drivers/media/platform/allegro-dvt/nal-h264.h   |  2 +-
 drivers/media/platform/exynos-gsc/gsc-core.h    | 19 +++++++++++++------
 drivers/media/platform/exynos4-is/fimc-core.h   | 10 ++++++++--
 drivers/media/platform/exynos4-is/fimc-isp.h    | 17 ++++++++++++-----
 drivers/media/platform/exynos4-is/fimc-lite.h   |  2 ++
 drivers/media/platform/exynos4-is/fimc-reg.h    |  1 +
 drivers/media/platform/exynos4-is/media-dev.h   |  7 ++++++-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c      | 22 ++++++++++++----------
 drivers/media/platform/s3c-camif/camif-core.h   | 16 +++++++++++++---
 drivers/media/platform/s5p-jpeg/jpeg-core.h     |  5 ++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h | 28 ++++++++++++++--------------
 drivers/media/test-drivers/vivid/vivid-core.c   |  6 +++---
 drivers/media/usb/em28xx/em28xx-dvb.c           |  1 +
 drivers/staging/media/atomisp/i2c/gc2235.h      |  2 +-
 drivers/staging/media/hantro/hantro_hw.h        | 12 ++++++++++++
 include/media/media-entity.h                    |  2 +-
 include/uapi/linux/rkisp1-config.h              | 16 ++++++++--------
 20 files changed, 128 insertions(+), 72 deletions(-)
