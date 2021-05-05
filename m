Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F719373985
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhEELgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:36:18 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45163 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233150AbhEELgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:36:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eFo5lLrg1WztCeFo8lL6Qq; Wed, 05 May 2021 13:35:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620214513; bh=xNmjQbB3cB8LUqt9iyS+f4Y+LNqBhM6mWZc57rAJSqM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nACmKqcuDsOjKkvJRBBJrHAPG54zftm46xbqXRgCJo56xKYle1tZmG50RYDMFrf73
         c9B2LJWexOh26QAAOoDt3M5PhztPgfa0NSFDObezHFYCqRRQiqQtiWvBtWLD3imv1s
         jKXvWXGv25dC8QlONsu3jfFyK9L/l0GTyIUKmcnUvGtGMbd2B+dZ4oL87IK7etxtSV
         CQ5uhQJ5v3GXdhVkZM8js1oEH9FW9Vzn6QAVbIYRUoLPvyjvG7jSo7ccu9tF4jE7p/
         Jk+3JtSSVz7MPOz4Hksqd7gVjDNjfMacYm9OQ+P/p8zmDIJHFW9n9U+ibKvd7yk15Z
         Xe8DHh609dNrg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Various fixes (1)
Message-ID: <e4087d7e-01e9-3a55-eab7-090e95028b57@xs4all.nl>
Date:   Wed, 5 May 2021 13:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGYTiEK1PcUi+H780ecv0OkGs3vH3zLzQ3cm/wD2CG6k72JZgXfbUjYKQQT/HTTAG8m3/xJUXBC3e9LczTYcy7nrc/fbq8dMvNJwMCdMVKHBCZxQMdoI
 VHpKZiOtwc1q8oc326UbuyjlzVELxJB3yblsPzApBmvvkeuz9xQjriGgMfeT5JuKm6Bx4URf1t6mI0j8MSrOxgzhErusr/CSW+U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14b

for you to fetch changes up to fb2633cc02523c72fc0ae6312ad45e4deed2ab6d:

  media: pvrusb2: fix warning in pvr2_i2c_core_done (2021-05-05 13:34:26 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Anirudh Rayabharam (1):
      media: pvrusb2: fix warning in pvr2_i2c_core_done

Colin Ian King (1):
      media: s2255drv: remove redundant assignment to variable field

Hans Verkuil (2):
      rtl2832_sdr/vivid/airspy/hackrf/msi2500: drop memset of fmt.sdr.reserved
      cobalt: fix race condition in setting HPD

Jernej Skrabec (1):
      media: hevc: Fix dependent slice segment flags

Pavel Skripkin (1):
      media: cpia2: fix memory leak in cpia2_usb_probe

Randy Dunlap (1):
      media: I2C: change 'RST' to "RSET" to fix multiple build errors

Sebastian Fricke (3):
      media: mc: mc-entity.c: Fix typo
      media: rkisp1: rksip1-capture.c: Improve comments and fix typos
      media: rkisp1: rkisp1-params.c: Fix typos

dingsenjie (1):
      media: qcom/camss: Use devm_platform_ioremap_resource_byname

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst |  5 ++++-
 drivers/media/dvb-frontends/rtl2832_sdr.c                 |  4 ----
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                  |  6 +++---
 drivers/media/i2c/s5c73m3/s5c73m3.h                       |  2 +-
 drivers/media/i2c/s5k4ecgx.c                              | 10 +++++-----
 drivers/media/i2c/s5k5baf.c                               |  6 +++---
 drivers/media/i2c/s5k6aa.c                                | 10 +++++-----
 drivers/media/mc/mc-entity.c                              |  2 +-
 drivers/media/pci/cobalt/cobalt-driver.c                  |  1 +
 drivers/media/pci/cobalt/cobalt-driver.h                  |  7 ++++++-
 drivers/media/platform/qcom/camss/camss-csid.c            |  3 +--
 drivers/media/platform/qcom/camss/camss-csiphy.c          |  8 +++-----
 drivers/media/platform/qcom/camss/camss-ispif.c           |  6 ++----
 drivers/media/platform/qcom/camss/camss-vfe.c             |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c   | 16 ++++++++--------
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c    |  5 ++++-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c          |  3 ---
 drivers/media/usb/airspy/airspy.c                         |  3 ---
 drivers/media/usb/cpia2/cpia2.h                           |  1 +
 drivers/media/usb/cpia2/cpia2_core.c                      | 12 ++++++++++++
 drivers/media/usb/cpia2/cpia2_usb.c                       | 13 +++++++------
 drivers/media/usb/hackrf/hackrf.c                         |  3 ---
 drivers/media/usb/msi2500/msi2500.c                       |  3 ---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                   |  4 ++--
 drivers/media/usb/s2255/s2255drv.c                        |  2 --
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c          |  4 ++--
 include/media/hevc-ctrls.h                                |  3 ++-
 27 files changed, 74 insertions(+), 71 deletions(-)
