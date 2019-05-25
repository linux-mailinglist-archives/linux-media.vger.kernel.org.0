Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE852A447
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 13:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfEYLzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 07:55:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58627 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726585AbfEYLzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 07:55:32 -0400
Received: from [IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af] ([IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UVGrhPHZtsDWyUVGshUHVk; Sat, 25 May 2019 13:55:30 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Coda improvements and cedrus H264 support
Message-ID: <d2ef65d9-af02-7438-1087-c2117a2c19dc@xs4all.nl>
Date:   Sat, 25 May 2019 13:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNOgmRoeKnJqQk6N6Vky5biDl0sxjHgKgdVa12wWY7rUNWXBvYBV+y8mK9vispjIFEZxQfyQZNf5G0iLGlhU3bBs+aNzbyJWFC8Vk8t4ahS+OvKZcDkB
 hbhTinhhUZ91fUHcqK0Fm+CtJ8UZTjTxK79IGORrA1gw2jKlTVVOFoGigRkqO4bXiGqFLfVLbjf8uWKUn0JroTbN+TTtJHaFaDZ2WpJEiDYEVwtYq5BRC9mO
 hkssCoVRj8Zq4/GyeJfz7RItOj7LmyloFxtoP/N9MlFSK+YOryzqRpnGvm2QbiyDTiJMSvnaaq9OQ85vi1KwaNrlw+oFXtKKxFmPfwqPDDUFb7K2UN3K341s
 S8Kc+gIkvra8JtNLetKlBr0tlo9kMOgjQUNj7ccqRpG+LKYlmTI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-5.3b

for you to fetch changes up to 681a3ce1c67c874118c80d8eda69cb1c30943e7d:

  media: cedrus: Add H264 decoding support (2019-05-25 13:20:46 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jernej Skrabec (1):
      media: cedrus: Allow different mod clock rates

Maxime Ripard (3):
      media: pixfmt: Add H264 Slice format
      media: pixfmt: Add H264_SLICE_RAW format documentation
      media: cedrus: Add H264 decoding support

Pawel Osciak (1):
      media: uapi: Add H264 low-level decoder API compound controls.

Philipp Zabel (5):
      media: coda: add decoder MPEG-4 profile and level controls
      media: v4l2-ctrl: add MPEG-2 profile and level controls
      media: coda: add decoder MPEG-2 profile and level controls
      media: coda: add lockdep asserts
      media: coda: use v4l2_m2m_buf_copy_metadata

 Documentation/media/uapi/v4l/biblio.rst            |   9 +
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   | 625 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |  25 +++
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |  30 ++++
 Documentation/media/videodev2.h.rst.exceptions     |   5 +
 drivers/media/platform/coda/Makefile               |   2 +-
 drivers/media/platform/coda/coda-bit.c             |  13 +-
 drivers/media/platform/coda/coda-common.c          |  48 ++++++
 drivers/media/platform/coda/coda-mpeg2.c           |  44 +++++
 drivers/media/platform/coda/coda-mpeg4.c           |  48 ++++++
 drivers/media/platform/coda/coda.h                 |  11 ++
 drivers/media/v4l2-core/v4l2-ctrls.c               |  65 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 drivers/staging/media/sunxi/cedrus/Makefile        |   3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  42 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |  39 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |  13 ++
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   | 576 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   6 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h     |   2 -
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |  91 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   9 +
 include/media/h264-ctrls.h                         | 197 ++++++++++++++++++++++
 include/media/v4l2-ctrls.h                         |  13 +-
 include/uapi/linux/v4l2-controls.h                 |  18 ++
 25 files changed, 1919 insertions(+), 16 deletions(-)
 create mode 100644 drivers/media/platform/coda/coda-mpeg2.c
 create mode 100644 drivers/media/platform/coda/coda-mpeg4.c
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h264.c
 create mode 100644 include/media/h264-ctrls.h
