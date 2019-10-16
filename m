Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C75D8E0D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 12:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390448AbfJPKgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 06:36:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38309 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728559AbfJPKgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 06:36:37 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KgfPiILSQbEWCKgfSiYuEl; Wed, 16 Oct 2019 12:36:35 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana B N <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] vivid: add metadata capture/output support
Message-ID: <5364cdbc-ccea-addd-3849-c4f9e26023fb@xs4all.nl>
Date:   Wed, 16 Oct 2019 12:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMEZWsC2eGm49XCiCpGtIIRhTmh29T1Wwm7+fl5rqcQQ0+N1X7mFcvKoo60vaGfNsdT8JY/Silq5TrHbgeCnDFHv7ReX6xUp3g8eALhL7m3XJjpo35dc
 A7WOOSbTaC30DkQCOC6Y7N8ugkfoOCnOAQ5dI7Cz4UKwL/XyWRfsGc1ATRjqkThDjV9xaujrDP/AIrn9gP7hmm1MF/gXBK2d9Ss=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds vivid metadata capture and output support. While working on
that it was discovered that the v4l2 core didn't correctly validate the ioctls
in the case of the vivid driver that has a complex mix of V4L2 devices and
various video inputs, each with different properties.

Some other cleanups were also done in that code to simplify the logic and
the ioctl validation for touch devices was also improved.

Many thanks to Vandana for working on this as part of the Linux Kernel
Mentorship Program.

Note: the v4l2-compliance test will fail for the metadata output. To make that
work this patch is needed: https://patchwork.linuxtv.org/patch/59480/

Once this series is merged I'll apply that patch as well to v4l-utils.

Regards,

	Hans

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5f

for you to fetch changes up to 952f6951ad9416f70a3fbf20a9285fef86bbbeef:

  vivid: Add metadata output support (2019-10-16 12:14:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      v4l2-dev: simplify the SDR checks
      v4l2-dev: fix is_tch checks
      v4l2-dev: disable frequency and tuner ioctls for touch

Vandana BN (5):
      v4l2-core: correctly validate video and metadata ioctls
      vivid: Add metadata capture support
      Documentation:media:v4l2:Add vivid metadata doc
      v4l2-core: Add new metadata format
      vivid: Add metadata output support

 Documentation/media/uapi/v4l/meta-formats.rst      |   1 +
 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst |  43 +++++++++++
 drivers/media/platform/vivid/Makefile              |   2 +-
 drivers/media/platform/vivid/vivid-core.c          | 197 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/media/platform/vivid/vivid-core.h          |  24 ++++++
 drivers/media/platform/vivid/vivid-ctrls.c         |  75 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-kthread-cap.c   |  54 +++++++++++--
 drivers/media/platform/vivid/vivid-kthread-out.c   |  49 +++++++++++-
 drivers/media/platform/vivid/vivid-meta-cap.c      | 201 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h      |  29 +++++++
 drivers/media/platform/vivid/vivid-meta-out.c      | 174 ++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h      |  25 ++++++
 drivers/media/platform/vivid/vivid-vid-cap.c       |   5 +-
 drivers/media/platform/vivid/vivid-vid-out.c       |   5 +-
 drivers/media/v4l2-core/v4l2-dev.c                 | 112 ++++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c               |  17 ++++-
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 948 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h
