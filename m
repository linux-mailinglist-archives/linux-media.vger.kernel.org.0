Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9C1EE3D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 14:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgFDMAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 08:00:19 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49715 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728082AbgFDMAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 08:00:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id goXdj2POInv5ngoXgjtxo3; Thu, 04 Jun 2020 14:00:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591272017; bh=UYto3wJvnfb3o5elZBDmm8gURrqMYuc3EkLwJNxEtqA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rkVPFAe4tRpQ86yBkvRQQRK+jiXAsbIJdH69ohDvTfetAf6cGcQacgAoz+tcYonqD
         S34Uq2w77CQer9eKn7Jt0eDypKHT1TwR5INkSK1rvXpQsmMwL15i8TnsGsADCQE5Os
         UD0wsPWKWNovS1jD0Sqi2B5CQvCtuGdXpJ6hGlC/oeuLCzgxhnnUp/jUel4ztdQ6kf
         EfBccNM1kDeq4qECbf1m7vxXw7TgkZmsN7ViddCSqeog8uJ8w0DRTVs2BpNyu1DPlr
         8yd3/sJwQFwZiMQkpQ6tdr58a6qKB4YkhIR52veA0xMGcmaRKq+/vwGYl6Xf0tap+x
         q5zVPvRvvKHxQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <16167466-bd12-92af-b67e-6be2341394c6@xs4all.nl>
Date:   Thu, 4 Jun 2020 14:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGzR1V7WJa4d+8Qemv8q2q/PyWMygLHMoJHXYsgawGPNV0DajvuuPZeSPR7vzCuz62sehB3wiZqXR5CMXZPrWYATnKJ89kcpUsx70mHvWAU+ADsCWu3F
 fDMur21jarG952E0ILjqCOSXYqpSaXw92wTz4GZZMiuAJmOHzz9RnsD3KBBjN5suDs88zV7Y+7PecJvrtofWpcXniSWVUzUEo2M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's been *years* since we added these flags, but now they finally
actually work :-)

Note: this requires a v4l-utils patch for testing:
https://patchwork.linuxtv.org/patch/64213/

With that patch the test-media script runs without failures.

However, I requested some changes to that patch, so the final patch for
v4l-utils will be different (although functionally it will do the same).

I'd like to have this series merged early in the 5.9 cycle if possible
to give it as much test time as possible.

Sergey, thank you for working on this! Very nice to have this implemented
at last.

Regards,

	Hans

The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:

  media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9a

for you to fetch changes up to b8e5fbcf6e1127cb409d0fed831e2e25adde87ad:

  media: vivid: add cache_hints module param (2020-06-02 10:23:14 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sergey Senozhatsky (14):
      videobuf2: use explicit unsigned int in vb2_queue
      videobuf2: add cache management members
      videobuf2: handle V4L2 buffer cache flags
      videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
      videobuf2: add queue memory consistency parameter
      videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
      videobuf2: factor out planes prepare/finish functions
      videobuf2: do not sync caches when we are allowed not to
      videobuf2: check ->synced flag in prepare() and finish()
      videobuf2: add begin/end cpu_access callbacks to dma-contig
      videobuf2: add begin/end cpu_access callbacks to dma-sg
      videobuf2: don't test db_attach in dma-contig prepare and finish
      videobuf2: remove redundant if-statement
      media: vivid: add cache_hints module param

 Documentation/admin-guide/media/vivid.rst                    |   9 +++
 Documentation/userspace-api/media/v4l/buffer.rst             |  40 ++++++++++++-
 Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst |   7 ++-
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst     |  21 ++++++-
 drivers/media/common/videobuf2/videobuf2-core.c              | 121 ++++++++++++++++++++++++++++++----------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c        |  44 +++++++++++++--
 drivers/media/common/videobuf2/videobuf2-dma-sg.c            |  38 ++++++++++---
 drivers/media/common/videobuf2/videobuf2-v4l2.c              |  72 +++++++++++++++++++++++-
 drivers/media/dvb-core/dvb_vb2.c                             |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c                |   9 +++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                |  10 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   5 +-
 include/media/videobuf2-core.h                               |  47 ++++++++++++----
 include/uapi/linux/videodev2.h                               |  14 ++++-
 14 files changed, 366 insertions(+), 73 deletions(-)
