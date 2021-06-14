Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8B73A694C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 16:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhFNOvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 10:51:49 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45749 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232919AbhFNOvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 10:51:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id snuGlVrgmhg8ZsnuKlLoMm; Mon, 14 Jun 2021 16:49:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623682184; bh=W8VPZLQVyd2sxJr4xoXe+CP27pvxKghwKR+dMsVmeQU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S1C9wQ88UWpXS2euPceyMiiNiv/J6fI6Pc1jiYgW0Dywgn7tmFwfFfv75jDQHF/Jr
         py8IqJ9bRRnJ85dlvLJIJQ81Ja0FzgHmGzNgQb3p4sSWItr40M7+nJbrfbtzCiTD6G
         6PSFfAUKuC+UIU1qKhzgxT4YlUjNoxetHEyjXB9GebItq7v2YYOchG043N6ZO4DYMf
         AXABKpPkKyQXC9TTj+1JL5f75J72V+aWZ5OEaz4pTHTdNKfZ/RN2gPSwK4vbZ0e/dn
         WvAEnWrbUaJAebLiJc0kUpX3yGEV44RHZyc8dOT5U6sHnC1hIS8oyEOkzovpfF33+K
         /fpsPTQOY3/jA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] media: v4l2: compat ioctl fixes
Message-ID: <52978223-273a-fd57-6808-efddf896e26e@xs4all.nl>
Date:   Mon, 14 Jun 2021 16:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL+61y4NvDF7soZ0EirRoh3/LbZKwOZ/msgLc04xObcnGkt7+JLvfgXYyA/4oRjqVbtHEPRy59CqESuQ4VXlmpSOoJMkYQviRXixs94FbxHtASiFAlLb
 t1ATu63qdwyPy4SDq9wNMliKO+IkSutcGarW0jAQCmCdu22i+jMTC6wL2CDoBU3Kd2ZDFx5HM3oh4EG8FaJsZldaEVxpjoqB43942KwiopXxjDfrZukhCZF5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

compat ioctl fixes.

Tested with the test-media script for the various configurations, both
on x86_64 and i686.

Regards,

	Hans

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14k

for you to fetch changes up to cc643cc7250b727f05c4546b86257e1650f6bb0b:

  media: subdev: disallow ioctl for saa6588/davinci (2021-06-14 16:42:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (8):
      media: v4l2-core: ignore native time32 ioctls on 64-bit
      media: v4l2-core: explicitly clear ioctl input data
      media: v4l2-core: fix whitespace damage in video_get_user()
      media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
      media: v4l2-core: return -ENODEV from ioctl when not registered
      media: atomisp: remove compat_ioctl32 code
      media: subdev: fix compat_ioctl32
      media: subdev: disallow ioctl for saa6588/davinci

 drivers/media/i2c/adv7842.c                                |    3 +
 drivers/media/i2c/saa6588.c                                |    4 +-
 drivers/media/pci/bt8xx/bttv-driver.c                      |    6 +-
 drivers/media/pci/saa7134/saa7134-video.c                  |    6 +-
 drivers/media/platform/davinci/vpbe_display.c              |    2 +-
 drivers/media/platform/davinci/vpbe_venc.c                 |    6 +-
 drivers/media/radio/si4713/si4713.c                        |    3 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c              |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c                       |   38 +-
 drivers/media/v4l2-core/v4l2-subdev.c                      |   43 +-
 drivers/staging/media/atomisp/Makefile                     |    1 -
 drivers/staging/media/atomisp/TODO                         |    5 +
 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c | 1202 ------------------------------------------
 drivers/staging/media/atomisp/pci/atomisp_fops.c           |    8 +-
 include/media/v4l2-subdev.h                                |    7 +-
 15 files changed, 69 insertions(+), 1268 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
