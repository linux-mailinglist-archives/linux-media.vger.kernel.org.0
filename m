Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CB832D5B4
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 15:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhCDOzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 09:55:48 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40261 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229494AbhCDOzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 09:55:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HpNNlgOFiqY4WHpNQlVk7E; Thu, 04 Mar 2021 15:54:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614869696; bh=mE+qnGkbsvR0N3L6riEvUrTmy0UHkZuXpY2/4B8giw4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i/gZj09U1m+unisWNgupr6thwC+wmacgnkpdNqAj7JGisR2S8PgoAydG+29P57JJA
         5qZr6FNF9icjIfJu8IHPG+Ezozn7eeSzJ6eOy/ZefbEs0S6LOYPDrVb5wC9i7613LE
         zrz2qVrf0/uSXvQRto9InxFqSjTvKxntYesMBwiSU3knoOPAFh+t8j2x6pPmV1xGpu
         88+7cldLf/epwouYEiBDJGWBoJDp/nWstG1WNKSlNnjMr6su6FFOlRRSdN+7MoX0Rc
         Udgc7yvJZjWP1Rd5NTSdS5vTWPYlbVSv3uoPBp4ppuInZWP2e1srWRbvr5K3KjEmGc
         Fs14KH0C/9f+Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] v2: V4L2 stateless VP8 de-staging
Message-ID: <a2333278-f159-d0d9-3e71-3937120615e3@xs4all.nl>
Date:   Thu, 4 Mar 2021 15:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGnjarKbJIGp/cNO14zjgGC1X/meOgjA9Ijy76RO7ynVDIQNorFEkBb/YCBmDrkjRj+zXrr/6XSefBxYFedePQkjKxE3bXeP9yuC/V5RW4p8GUcnWaKs
 94I/alVAM+mcn9TH9MZ/glWDXbjfghXOqDemIc7YPq9si2OPfen6AilNRTtSuXYnJv3vIl3cLvU8OPhUsCzJerkA7iZJSrLAuh+ls9DBlwptqnr8zvdtj2Jw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

De-staging the VP8 codec.

Many thanks to Ezequiel for working on this!

Regards,

	Hans

Changes in v2 of this pull request:

* Rebased on latest media/master branch.
* Rename "seg" field to "segment" as noted by Alex, (thanks!)

The following changes since commit f3ea6a19f413cd983e4372da8af3f99de12f94de:

  media: vbi_hsync.svg: fix the viewports (2021-03-03 17:56:45 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c

for you to fetch changes up to aa81982a17171807d31558a664f17c4573b41984:

  media: uapi: move VP8 stateless controls out of staging (2021-03-04 15:49:11 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (8):
      media: uapi: vp8: Remove "header" from symbol names and macros
      media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
      media: uapi: vp8: Add proper kernel-doc documentation
      media: uapi: Move parsed VP8 pixel format out of staging
      media: uapi: Move the VP8 stateless control type out of staging
      media: controls: Log VP8 stateless control in .std_log
      media: vp8: Rename V4L2 VP8 specific macro to V4L2_VP8_
      media: uapi: move VP8 stateless controls out of staging

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 334 +++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 339 --------------------------------
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |  15 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |   4 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   6 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |   1 +
 drivers/media/v4l2-core/v4l2-ctrls.c                                |  39 ++--
 drivers/staging/media/hantro/hantro_drv.c                           |   2 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c                    |  55 +++---
 drivers/staging/media/hantro/hantro_hw.h                            |   2 +-
 drivers/staging/media/hantro/hantro_vp8.c                           |  10 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c                |  55 +++---
 drivers/staging/media/sunxi/cedrus/cedrus.c                         |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h                         |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c                     |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c                     | 113 +++++------
 include/media/v4l2-ctrls.h                                          |   5 +-
 include/media/vp8-ctrls.h                                           | 114 -----------
 include/uapi/linux/v4l2-controls.h                                  | 195 ++++++++++++++++++
 include/uapi/linux/videodev2.h                                      |   4 +
 20 files changed, 693 insertions(+), 606 deletions(-)
 delete mode 100644 include/media/vp8-ctrls.h
