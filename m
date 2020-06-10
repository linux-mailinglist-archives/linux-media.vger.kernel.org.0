Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101791F554A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 15:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgFJNCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 09:02:02 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48893 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728792AbgFJNCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 09:02:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id j0MdjZz2lNp2zj0MhjuTFr; Wed, 10 Jun 2020 15:01:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591794119; bh=ZjuryJb/ZExZRxJ5nniXjvonUz7hKWhJ9CuUEfLrLTk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=er6XM7wu6oHNSt2fLVG+izBgwzqTFDn6SZoeQvSsukgBTPH/tiJcH2CDdjPyJuEIn
         HgasOyh9IUHulRRPj92u8byidTgTFGuQawt7WNtnzP04ELzfWXBBbPKSI2gHCNP3ec
         b/ZIEpqTzaLGXJd4G/PtlpHODJVkfmdGO0ywMvr9t1+ECrz1334ts4b9oOz7KFCksa
         /p1jQOIYn2RZdMb+fx9vQhq7od6/qHvFnWbM6iPKj3Xvm7IGions9rm9OUjDOGuAg/
         TczJ150L5lbv6KvuMcD4gwcDGwO8Cr6+ebMHkoy/OhNGWGbxVH7bpifqnnNWkS5LY9
         D44H0rfukssRQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9 v2] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <c4067de1-6fb2-1fda-9a75-0ad5e9ae78c2@xs4all.nl>
Date:   Wed, 10 Jun 2020 15:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKUANi737upW/oQdjqJ223Px2kUm2QrNJymLYavkDMCDrmTtnQGDyqvFu3WIhVbNR/JXKkUOmiDSpUUFtOn2/KloVDuq+kFi+K5KfLvd/TucCIwgmELU
 B30mamj4TUSoWC/GHpidIv2QcGDTZbCSf1y9qlplstTk/jER6pw/G33WRlLfG8x4wHaTqMZDk8QlBd0nWtZSwuMh6rCVUGQhLKI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's been *years* since we added these flags, but now they finally
actually work :-)

Note: this requires a v4l-utils patch for testing:
https://patchwork.linuxtv.org/patch/64374/

With that patch the test-media script runs without failures.

This v2 PR is identical to v1, except for folding this bug fix patch into
patch "videobuf2: add queue memory consistency parameter":
https://patchwork.linuxtv.org/patch/64373/

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

for you to fetch changes up to a0bd98d132395e6f2660cfbaad376cb92261a5b8:

  media: vivid: add cache_hints module param (2020-06-10 12:31:56 +0200)

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
 Documentation/userspace-api/media/v4l/buffer.rst             |  40 +++++++++++++-
 Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst |   7 ++-
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst     |  21 ++++++-
 drivers/media/common/videobuf2/videobuf2-core.c              | 120 +++++++++++++++++++++++++++++-----------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c        |  44 +++++++++++++--
 drivers/media/common/videobuf2/videobuf2-dma-sg.c            |  38 ++++++++++---
 drivers/media/common/videobuf2/videobuf2-v4l2.c              |  72 +++++++++++++++++++++++-
 drivers/media/dvb-core/dvb_vb2.c                             |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c                |   9 +++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                |  10 +++-
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   5 +-
 include/media/videobuf2-core.h                               |  47 ++++++++++++----
 include/uapi/linux/videodev2.h                               |  14 ++++-
 14 files changed, 365 insertions(+), 73 deletions(-)
