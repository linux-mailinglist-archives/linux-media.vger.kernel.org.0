Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A54D7E69
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 10:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237921AbiCNJ0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 05:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiCNJ0u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 05:26:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9835D2A706
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 02:25:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35D5A60A55
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362AFC340F5;
        Mon, 14 Mar 2022 09:25:40 +0000 (UTC)
Message-ID: <f79c681c-a421-c58a-99c6-461d68d9a2c8@xs4all.nl>
Date:   Mon, 14 Mar 2022 10:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.18] Several fixes for v5.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 815ab3a85c33e990dee0e0a1c83e234b7efbe21a:

  media: Kconfig: cleanup VIDEO_DEV dependencies (2022-03-14 09:43:04 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18a

for you to fetch changes up to dedb332353901b49b6979a45a73884653ee3681f:

  media: amphion: cleanup media device if register it fail (2022-03-14 10:03:31 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      pixfmt-yuv-planar.rst: fix PIX_FMT labels
      m5mols/m5mols.h: document new reset field

Ming Qian (4):
      media: amphion: fix an issue that using pm_runtime_get_sync incorrectly
      media: amphion: fix some error related with undefined reference to __divdi3
      media: amphion: fix some issues to improve robust
      media: amphion: cleanup media device if register it fail

Yihao Han (1):
      media: vidtv: use vfree() for memory allocated with vzalloc()

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |  5 ++--
 drivers/media/i2c/m5mols/m5mols.h                           |  1 +
 drivers/media/platform/nxp/amphion/vdec.c                   | 35 ---------------------------
 drivers/media/platform/nxp/amphion/vpu_core.c               | 10 ++++----
 drivers/media/platform/nxp/amphion/vpu_dbg.c                |  2 +-
 drivers/media/platform/nxp/amphion/vpu_drv.c                | 17 +++++++-------
 drivers/media/platform/nxp/amphion/vpu_helpers.c            | 13 +++++-----
 drivers/media/platform/nxp/amphion/vpu_helpers.h            |  9 +++----
 drivers/media/platform/nxp/amphion/vpu_imx8q.c              |  2 +-
 drivers/media/platform/nxp/amphion/vpu_imx8q.h              |  2 +-
 drivers/media/platform/nxp/amphion/vpu_malone.c             | 81 +++++++++++++++++++++++++++++++++++++++------------------------
 drivers/media/platform/nxp/amphion/vpu_msgs.c               |  6 ++---
 drivers/media/platform/nxp/amphion/vpu_rpc.c                |  4 +++-
 drivers/media/platform/nxp/amphion/vpu_rpc.h                |  9 +++++--
 drivers/media/platform/nxp/amphion/vpu_v4l2.c               | 13 +++++-----
 drivers/media/platform/nxp/amphion/vpu_windsor.c            | 24 +++++++++++--------
 drivers/media/test-drivers/vidtv/vidtv_s302m.c              |  2 +-
 17 files changed, 116 insertions(+), 119 deletions(-)
