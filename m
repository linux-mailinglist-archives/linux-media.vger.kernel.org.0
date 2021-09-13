Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A1E408583
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237653AbhIMHnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237568AbhIMHnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:43:32 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D4DC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 00:42:16 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PgbSmWawopQdWPgbTm1pK2; Mon, 13 Sep 2021 09:42:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631518933; bh=CYDupfBiELasArrXgz/nUAe5qjVajVV5s9Gjrj6V3BU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s8SILm86afmwUm7R/cNcDtfIgdG5eaIvqi4ogm8x66Z3yIn15ulNU1rAbis1KaQWQ
         c7d9PCpDx5up4ArODX3wwlafuVJGlhB/dEuHlXFgJtJk3W+XJgHJU/HTKwho8C/sSa
         sGJXXLk8Xq09RekBvC9aITnzl5laMyPqd1QwCqVEtKefjlGHRFK73eIjvl/bpdXId3
         tyxZaEcl8vNgSOBzwS2w/RZXNwAMMJvcx5eqf9ss3jlDFM5F2jR3ixo72GLuaAjnfo
         AKwe60I+mc80G1pt9MNx6kOTM4tmOUm5uryBiZ+IH8HoUGdtQGsydusIevx9g3R+jz
         hRcc/dM9cQRfQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] videobuf2: support new noncontiguous DMA API
Message-ID: <4d2efa85-5801-092e-f3ca-c6053f612891@xs4all.nl>
Date:   Mon, 13 Sep 2021 09:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDYL3YHAwdMg6bVEnsqSNTGAzhuIOd/+VPZWpm2Xjh6ejWpeQ4EiBos31DBM0c9LnltukMbqXGGmccDN1ddAuWglxQ2tn9ZCq11G3S0iSUikbNtcfew0
 HSZeKPUT62lxAooa+LBUnR2DeivTd+UsHLkEQsB34bVFgO6PKmzSEDK10ZsOBhRF5X+520FrAmZ1f9P+zPD0OM72HGdeNOJgIPOIlpDlxnom5q/Tm9b6kXqV
 DbYG3AmhdthPzL1JdLPvMc/3r0DnES7QLFs57wFE+EjYckCn02c4H3kGsZuSUpo/X8U68XimQwlhdnbACkatLY4TIWwHr8EbAosFtmpoZSM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This patch series that adds support for V4L2_MEMORY_FLAG_NON_COHERENT.

Once merged, this patch for v4l2-compliance will be applied as well:

https://patchwork.linuxtv.org/project/linux-media/patch/20210913023546.905914-1-senozhatsky@chromium.org/

Regards,

	Hans


The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16d

for you to fetch changes up to fa03153716a3e6bf10d8611515fdcf440673557a:

  videobuf2: handle non-contiguous DMA allocations (2021-09-10 12:06:25 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sergey Senozhatsky (8):
      videobuf2: rework vb2_mem_ops API
      videobuf2: inverse buffer cache_hints flags
      videobuf2: split buffer cache_hints initialisation
      videobuf2: move cache_hints handling to allocators
      videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
      videobuf2: add queue memory coherency parameter
      videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
      videobuf2: handle non-contiguous DMA allocations

 Documentation/userspace-api/media/v4l/buffer.rst             |  40 ++++++++-
 Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst |   7 +-
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst     |  16 ++--
 drivers/media/common/videobuf2/videobuf2-core.c              | 126 +++++++++++++++++----------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c        | 195 +++++++++++++++++++++++++++++++++---------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c            |  39 +++++----
 drivers/media/common/videobuf2/videobuf2-v4l2.c              |  59 ++++++-------
 drivers/media/common/videobuf2/videobuf2-vmalloc.c           |  30 ++++---
 drivers/media/dvb-core/dvb_vb2.c                             |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                         |   4 +-
 include/media/videobuf2-core.h                               |  59 +++++++------
 include/uapi/linux/videodev2.h                               |  11 ++-
 13 files changed, 411 insertions(+), 186 deletions(-)
