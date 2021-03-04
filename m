Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B59332CDE3
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 08:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbhCDHpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 02:45:34 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60001 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233035AbhCDHpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 02:45:04 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HieglYZLbOruFHieklEied; Thu, 04 Mar 2021 08:44:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614843862; bh=EdKiLXhCdycJslHePa5WsXduZT1djc0dWQQIMie2O/4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PfZx+mEkDs8R7P7D6E9vn9eVHlN2fPSqtk3SDv21byyu+pQobQEeCs/tjvWQBqBKy
         4pU3yOIMH1WYB8SIpzPfOeV1NtM5x63SMpSH6Uonofr/23gvU9SATqmjt5a6RjBfbw
         rnZCIRVtZdkRotR7Z6JtTiL2vF/I4FHJ/xojWE3y80KKtnEpY0cgHwxr2W+Q7zkbRY
         6MvV2+B0deVcV2LJNy11jTbOgayzXimVlQzJe88GVAyoYcZEqY4iUT07RV3h4N30/p
         Nod0iy4ZLX8GQO6DvdaLhQImj2HHA3I2dBTEzTdhgoMYxC66DLkLp8h54VVKn7dhHq
         nQUcv8TV/NxTw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] V4L2 stateless VP8 de-staging
Message-ID: <7bcaf084-b0fd-8bf8-92df-0eee02d924a3@xs4all.nl>
Date:   Thu, 4 Mar 2021 08:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfND3RImYcQxIE3aT9TEXDLp6ka2fUrJNjXwemgC2v3bbrz2qq1zfjqWsajktJ00eeM7EGsmIISwQZOuOdv0VPeTQH3ZZ9Tzk1L33cw8a2DsH90t1q+en
 +X3AKSStY8O+IBjo8Mh4bl8vHLE3td3+KU9LdfgKIgX42HnsB4DUtC/T698McQvj1PIDM7vHEXSdTj9FA73aR2x4jqheTMiSI+ij2vBSdbRzr1BhaN6UcNKh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

De-staging the VP8 codec.

Many thanks to Ezequiel for working on this!

Regards,

	Hans

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c

for you to fetch changes up to 262278126d4e1a69ea29edf7bfeb1f7efb6bf815:

  media: uapi: move VP8 stateless controls out of staging (2021-03-04 08:34:50 +0100)

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

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 318 +++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 323 --------------------------------
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
 include/uapi/linux/v4l2-controls.h                                  | 195 +++++++++++++++++++
 include/uapi/linux/videodev2.h                                      |   4 +
 20 files changed, 677 insertions(+), 590 deletions(-)
 delete mode 100644 include/media/vp8-ctrls.h
