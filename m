Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E83D8FB9
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfJPLj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 07:39:58 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33545 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726752AbfJPLj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 07:39:57 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KhehiHBWoPduvKheliqjVW; Wed, 16 Oct 2019 13:39:55 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Add slicing support + spec for stateless decoders
Message-ID: <02bfac01-d6ba-1eca-efc6-1dbfcc712dc0@xs4all.nl>
Date:   Wed, 16 Oct 2019 13:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGse9GeQQ4IoDae5QSkiOv1sIKCx4rdLvCObX8OaM90RXbBcCAto4n5UBmpAA0cHCCgTSSZGbXtDnZlmOj0b2h0PuOo7vyY5hBSE272fytQMlemIheSG
 sp8UbvKhBpvst3Zb4jHGDRkeyM/BjbaySrOHc0KEr8dPaNn77ICo9AJE27W8SB5oOmUm/lic6mddQN/FeEpbxVr5ChWv6lL0DnO3LDmtQCeEMP1LXW9rPsSp
 zrlEtYGnOF3gXkA67cxGLTbgYlnnom3SEhlnbqrd3Fg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for H.264 slicing to the cedrus driver. This is done by
adding a new buffer flag V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF that stateless decoders
have to set when queueing the output buffer to indicate that this output buffer
contains a compressed slice and so the capture buffer the slice is decoded into
should not be marked as DONE since more slices are expected.

Also add a new decoder command V4L2_DEC_CMD_FLUSH to handle the corner case where
there are no more slices to decode, but there is still a capture buffer pending.

Add support for all this to the m2m framework and add support for slicing to the
cedrus driver. Many thanks to Jernej for working on the cedrus slicing support and
testing these patches!

Since slicing was the final missing piece, it is now time to add the stateless
decoder spec as well to the V4L2 Specification.

Many thanks to Alexandre and Tomasz and the many others who contributed to this.

Regards,

	Hans

The following changes since commit 3ff3a712a9eabb3d7bf52c263dd1ece054345df4:

  media: ti-vpe: vpe: don't rely on colorspace member for conversion (2019-10-10 13:54:22 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5j

for you to fetch changes up to b6f4140fcee87196dca7edf512de352a1d50fa62:

  media: docs-rst: Document m2m stateless video decoder interface (2019-10-16 12:56:31 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: docs-rst: Document m2m stateless video decoder interface

Hans Verkuil (4):
      vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
      v4l2-mem2mem: support held capture buffers
      videodev2.h: add V4L2_DEC_CMD_FLUSH
      v4l2-mem2mem: add new_frame detection

Jernej Skrabec (2):
      media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
      media: cedrus: h264: Support multiple slices per frame

 Documentation/media/uapi/v4l/buffer.rst                |  13 ++
 Documentation/media/uapi/v4l/dev-mem2mem.rst           |   1 +
 Documentation/media/uapi/v4l/dev-stateless-decoder.rst | 424 +++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst    |  10 +-
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst        |   6 +
 Documentation/media/videodev2.h.rst.exceptions         |   1 +
 drivers/media/common/videobuf2/videobuf2-v4l2.c        |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c                 | 190 ++++++++++++++++----
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c       |  12 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c         |  16 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c      |  14 ++
 include/media/v4l2-mem2mem.h                           |  44 ++++-
 include/media/videobuf2-core.h                         |   3 +
 include/media/videobuf2-v4l2.h                         |   5 +
 include/uapi/linux/videodev2.h                         |  14 +-
 15 files changed, 707 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
