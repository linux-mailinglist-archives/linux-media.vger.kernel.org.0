Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4773265E5F
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 12:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgIKKxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 06:53:03 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54221 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgIKKxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 06:53:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ggfpkut1eXgwIGgfskdp9E; Fri, 11 Sep 2020 12:53:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599821580; bh=tK9K3x8KeMTl9Ha5hsiYf8MNgPQ4Dpfc7YwEsITtEmY=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pNjgai4WM/EdWXZLku3LGbG3iPOTxjY0qPZXYKN1FVLtXntFImPaobmw/GmdsOw1W
         5mZkG0dePrFhihtgWfx0uZ1c9XaamlGK0JR9kgd13wHgUFj5Qchfh7KuyrhBk+Q63c
         IbX9FneQQPjIS5PIlKk2Q/CybCV+y5zHpLEGeSQ3LKZRwupvSKYfKeoOh0BmX9DR0N
         Ag+3qWzVebAQ6GVyZw0eCdxcJks5OL8pO7q4kL7+s85svnR2Lq6O7rnVLD4572t9sG
         gRo+kxcmQT84BVHAMuZTeDVweuwwAdlk406QtH0y3AAYFajpP+qDLmio9mOX8ONE9p
         Vu/RAGB4MJE2w==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.9] Remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <9347220a-a039-93ff-5dd7-f35613631a29@xs4all.nl>
Date:   Fri, 11 Sep 2020 12:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEOCXxRtEMejEZToow/rHtREQ2k1M/yEhHDLhHVo666taleK1vuxt/xoFsn7LvdM21Dd2P75ePStLhPO4IRxCfeJVEjSXHUv5hetETRw58JHaEiszyv4
 xSn4juC9Xluv+wFxG3lyuLwDJlh2QsVgmYBOAVLjwVVyJSxCI0GduyIpeJp2/Rd1pIx99kDs9GzEenN3dmbTuDlvE1qvk7ShxCyf4SZBaQE+obNlbvELAmjG
 BdN47AaLeeMezFCNzsTSQm8lfVvRe1ZTzZX8AN/VfYY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From the commit log of the patch:

--------------------------------------------------------------------
The patch partially reverts some of the UAPI bits of the buffer
cache management hints. Namely, the queue consistency (memory
coherency) user-space hint because, as it turned out, the kernel
implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.

The patch revers both kernel and user space parts: removes the
DMA consistency attr functions, rolls back changes to v4l2_requestbuffers,
v4l2_create_buffers structures and corresponding UAPI functions
(plus compat32 layer) and cleans up the documentation.
--------------------------------------------------------------------

The intention is that this feature will return once proper low-level support
for this has been sorted. A patch to revert the v4l-utils changes is ready
to be merged once this patch made it's way to our master branch:

https://patchwork.linuxtv.org/project/linux-media/patch/20200911030952.74468-1-sergey.senozhatsky@gmail.com/

I've tested this with the test-media script.

Regards,

	Hans

The following changes since commit 93c16fabdb74a9c1a427402fc1fe588a45130c5b:

  media: ov8856: Add support for 3264x2448 mode (2020-09-10 14:29:35 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9-mem

for you to fetch changes up to d36642b40255022dda1cfcaebe82e40a592d4ee8:

  media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag (2020-09-11 12:26:54 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sergey Senozhatsky (1):
      media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag

 Documentation/userspace-api/media/v4l/buffer.rst             | 17 -----------------
 Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst |  6 +-----
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst     | 12 ++----------
 drivers/media/common/videobuf2/videobuf2-core.c              | 46 ++++++----------------------------------------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c        | 19 -------------------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c            |  3 +--
 drivers/media/common/videobuf2/videobuf2-v4l2.c              | 18 ++----------------
 drivers/media/dvb-core/dvb_vb2.c                             |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                | 10 ++--------
 drivers/media/v4l2-core/v4l2-ioctl.c                         |  5 ++++-
 include/media/videobuf2-core.h                               |  7 ++-----
 include/uapi/linux/videodev2.h                               | 13 ++-----------
 12 files changed, 23 insertions(+), 135 deletions(-)
