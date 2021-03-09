Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B8F33227E
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 11:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhCIKAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 05:00:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49147 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229950AbhCIKAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 05:00:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JZANlE2iOC40pJZARlFHRB; Tue, 09 Mar 2021 11:00:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615284043; bh=mGCra6dO0kpSixDkXr6LfjsKMGBb6x+/i6y/EuXnS1k=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=h7SMJ+kyFoj8FXPbVzE+4jdBtec8k89Dbmy+Wj7ulMv0C84xFBP2eOJZjsjcCN88Z
         Wt818WpmXPVfqdcc/0XnC5bFwQhuBJjHeYyWDmdIN7pA1YdbmkQuohWaTNXERJCHKY
         5MZCr0l/hm/maFsdAv4mWm9tbbDOqeXOYmdSfLyVZqApJ+zMZzediwodFfsMq6PwOT
         /n+IL/OBaD1uaihWbTVK/Nj9H+5BUOLYG5waMX6LIJ/62ZjfSyRsrM8dBPzqqhq40S
         z0KkQvj2rWzij9488iIJW+KIu0bE+8VLdfNLPRQxAopsyklv9YHfs7JijwaPXStrv6
         3B8oBndCwC0Qw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] v3: V4L2 stateless VP8 de-staging
Message-ID: <fe254cc2-c266-c89e-a5fb-915b27485aee@xs4all.nl>
Date:   Tue, 9 Mar 2021 11:00:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKIMB75sJDqHWIXMz1WoQV3SWbdFfG+bH7nrbj0TYizuFwVX3WDp7UenwKvGU9HKYHer5Ck1HgkucMoPoUZ24z7fSrEmvXdmNEpqzd0sNqTUYXcbud0X
 mk4DC2OmDYEEbIukrMJ+2TS2QSZ2vmlA7gkMcbi66Yfg77jEVYjBrmCV697j6fw6El1O7KrNjY8fK3lcNMjx8Yca6lmTRy1pBz3BbV5mIxitl7Fyi5E+cY9U
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

De-staging the VP8 codec.

Many thanks to Ezequiel for working on this!

Regards,

	Hans

Changes in v3 of this pull request:

* Added new patch "vp8: Fix kernel-doc warnings"

Changes in v2 of this pull request:

* Rebased on latest media/master branch.
* Rename "seg" field to "segment" as noted by Alex, (thanks!)

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c

for you to fetch changes up to 9a185d23a5883883b3e13b0c1b836221453720e1:

  media: uapi: vp8: Fix kernel-doc warnings (2021-03-09 09:38:31 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (9):
      media: uapi: vp8: Remove "header" from symbol names and macros
      media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
      media: uapi: vp8: Add proper kernel-doc documentation
      media: uapi: Move parsed VP8 pixel format out of staging
      media: uapi: Move the VP8 stateless control type out of staging
      media: controls: Log VP8 stateless control in .std_log
      media: vp8: Rename V4L2 VP8 specific macro to V4L2_VP8_
      media: uapi: move VP8 stateless controls out of staging
      media: uapi: vp8: Fix kernel-doc warnings

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 334 ++++++++++++++++++++++++++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst           | 339 ---------------------------------
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
 include/uapi/linux/v4l2-controls.h                                  | 196 +++++++++++++++++++
 include/uapi/linux/videodev2.h                                      |   4 +
 20 files changed, 694 insertions(+), 606 deletions(-)
 delete mode 100644 include/media/vp8-ctrls.h
