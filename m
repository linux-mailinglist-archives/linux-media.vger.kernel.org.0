Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E75A4102337
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfKSLfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:35:03 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36327 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727535AbfKSLfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:35:00 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1mbiD68Hcs92X1mciz4Sk; Tue, 19 Nov 2019 12:34:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163298; bh=Gan/T2QsIqLdmBhjaDjEZVwVOGYKyRlgmLqp+Lr87Pc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:From:
         Subject;
        b=HRKSjayOpJ93+ExsHWbkzfmfCDJ76n/F5BwCkmwN3purGr+XX2b46hAzP337V3G8j
         P+g3YV27i/ej/Gg4Z5+XIyGDTjzYGX1nEPVey8/iROUrbeNFiMeaUAD01uYr5ZiuKx
         ascw64XdT4frOywBOcS9noBTdAEKD6NA0pByKZDHcHBxUrkD33UBEyPja1d8o7Xxz5
         urn556laQ8TWTI/UIVjotEJNKh7ZmyxwYYAw973xlbZz9FXX3BFYm/k56JP4Bgvr0b
         4N5PpRwwrl4i7TL8yY79b7A0lOrOqQtRYaIepOh0RcpjNz/auCUbqJZLGX0jQnEuOY
         V9cv4VQelWzqA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/5] Stateful Encoding: final bits
Date:   Tue, 19 Nov 2019 12:34:52 +0100
Message-Id: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFUhROMm2voOTMjc/XBUnfb5XAAWKSPDCRQXxUVYQjENyk2j+DwN6BWcvdTwO7AWX4lkjcMLYCAiFBUan8sdAKQoZZeF1IPC1nttoOzzSgU4C+j0bNDW
 6GrYQVMJZEsVvdIqPiWjtnbe2xBWxTRS8bsOtSagjqd1XxDtIQHC58v0YYdnvU2Rf0L7OEnWzofRrjtW+vh77cGbLhlc0AjQMJWIIIVn6EGUhVIBHe8O41D0
 z6uGcKk8BFGSmVbKQ2dXTVIot5JmzJM7bxO/p8nYauVfUi0NfQVRU0x7fEkEPG8j
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for fractions in the control framework,
and a way to obtain the min and max values of compound controls
such as v4l2_fract.

Next it adds the V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to
set the framerate for the encoder.

The next patch adds support for the V4L2_BUF_FLAG_TOO_SMALL flag
to signal that the capture buffer was too small.

The final patch adds the encoder spec (unchanged from v3).

Michael, can you add support for V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
to your encoder driver? Let me know if something isn't working.
I need to add a test control for this to vivid as well and add support
for this to v4l2-ctl, that's on my TODO list.

Open questions:

1) Existing encoder drivers use S_PARM to signal the frameperiod,
but as discussed in Lyon this should be the rate at which frames are
submitted for encoding, which can be different from
V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE. But given the current use-cases
I was wondering if calling S_PARM should set the ENC_FRAME_RATE
control as well, and you would need to explicitly set the control
after S_PARM if the two are not the same. This would mean that
existing applications that don't know about the control can keep working.

2) I do believe that we need a RELEASE/DEL/DESTROY_BUFS ioctl in
order to do proper handling of the V4L2_BUF_FLAG_TOO_SMALL case.
I am inclined to postpone adding this flag until we have that ioctl.
We can still merge the stateful encoder spec if we mention that that
is work in progress.

Regards,

	Hans

Hans Verkuil (4):
  v4l2-ctrls: add support for v4l2_fract types
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
  v4l2-controls.h: add V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
  videodev2.h: add V4L2_BUF_FLAG_TOO_SMALL flag

Tomasz Figa (1):
  media: docs-rst: Document memory-to-memory video encoder interface

 Documentation/media/uapi/v4l/buffer.rst       |   9 +
 Documentation/media/uapi/v4l/dev-encoder.rst  | 608 ++++++++++++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        |   8 +
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   5 +
 Documentation/media/uapi/v4l/v4l2.rst         |   2 +
 .../media/uapi/v4l/vidioc-encoder-cmd.rst     |  51 +-
 .../media/uapi/v4l/vidioc-g-ext-ctrls.rst     |  15 +-
 .../media/uapi/v4l/vidioc-queryctrl.rst       |   6 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 .../media/common/videobuf2/videobuf2-core.c   |  12 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 222 ++++++-
 include/media/v4l2-ctrls.h                    |  72 ++-
 include/media/videobuf2-core.h                |   4 +
 include/uapi/linux/v4l2-controls.h            |   1 +
 include/uapi/linux/videodev2.h                |   6 +
 18 files changed, 980 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst

-- 
2.23.0

