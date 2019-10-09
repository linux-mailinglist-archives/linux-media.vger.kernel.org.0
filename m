Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56879D0A88
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 11:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfJIJIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 05:08:38 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40631 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725935AbfJIJIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 05:08:38 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud8.xs4all.net with ESMTPA
        id I7xTibDqgop0AI7xUiOWBi; Wed, 09 Oct 2019 11:08:36 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Add HEVC stateless decoder support
Message-ID: <d783b7cc-4cc6-6c36-ab95-264c7427564e@xs4all.nl>
Date:   Wed, 9 Oct 2019 11:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFl69ciowPvRinWtFR7tSOelMHQDu/Of4IBwaQW9tITifci8VkdkxyLAt3vgCI3idbdLE5DvJSsCrlRJCI70fPbvsA6xxRc1cU+rkCz8YM9eLdC6i1Cy
 btgYdQq2A7e2yE6XqD+BjJwYdtREhBMt4CDf9h2lD5kVFtB+3c7NdFSaWhx6QBQpJ0r4P4SY+NYEGdPE7HDZ85x0HFfrNvzgWe7SVMf8lS2JuawFOkXWwtdi
 AgEMvryXL6r7QDarufU+6FBrSWZWUjTo9ikvwpnAisHBdNMD7R+WL4haBgRGv/zzAhZXJf+tUkVd7EnJXIkKpQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Time to get this in. Also verified that there are no holes in the new
compound control structs for 32/64 bit intel/arm compilations.

Regards,

	Hans

The following changes since commit 219031a6e7dff52a066e8b074adc0697f501e3d3:

  media: venus: fix build on 32bit environments (2019-10-08 13:46:36 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5g

for you to fetch changes up to 5aaf1fbc321cb3699744c61401653819f6622eea:

  media: cedrus: Add HEVC/H.265 decoding support (2019-10-09 11:06:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Paul Kocialkowski (3):
      media: v4l: Add definitions for HEVC stateless decoding
      media: pixfmt: Document the HEVC slice pixel format
      media: cedrus: Add HEVC/H.265 decoding support

 Documentation/media/uapi/v4l/biblio.rst            |   9 +
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   | 553 +++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |  23 ++
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |  18 ++
 Documentation/media/videodev2.h.rst.exceptions     |   3 +
 drivers/media/v4l2-core/v4l2-ctrls.c               | 108 ++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile        |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  52 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |  18 ++
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |   9 +
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   | 616 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   4 +
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   | 271 +++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  10 +
 include/media/hevc-ctrls.h                         | 212 ++++++++++++++++++
 include/media/v4l2-ctrls.h                         |   7 +
 17 files changed, 1907 insertions(+), 9 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
 create mode 100644 include/media/hevc-ctrls.h
