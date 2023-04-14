Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECFA6E224F
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbjDNLfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjDNLfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:35:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0447AF39
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:35:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61AFA646AC
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8093AC433D2
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:35:24 +0000 (UTC)
Message-ID: <ced694ce-8d93-282c-960f-927c60de1a26@xs4all.nl>
Date:   Fri, 14 Apr 2023 13:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] saa7146: convert to vb2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This PR converts saa7146 to vb2.

Please note that the first patch (media: common: saa7146: disable clipping)
must be picked up for 6.4 since it fixes a regression from the removal of the
overlay support.

The remainder is up to you whether you want take it of 6.4 or 6.5.

Regards,

	Hans

The following changes since commit f100ce3bbd6aa0093075b20b9dbd006686f6aedf:

  media: verisilicon: Fix crash when probing encoder (2023-04-13 12:58:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4o

for you to fetch changes up to ebfa0c8cf135bddaee0384c8350181075809c795:

  staging: media: av7110: fix VBI output support (2023-04-14 12:48:25 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (18):
      media: common: saa7146: disable clipping
      common/saa7146: fix VFL direction for vbi output
      media: pci: saa7146: hexium_orion: initialize input 0
      media: saa7146: drop 'dev' and 'resources' from struct saa7146_fh
      media: common: saa7146: drop 'fmt' from struct saa7146_buf
      media: common: saa7146: replace BUG_ON by WARN_ON
      staging: media: av7110: replace BUG_ON by WARN_ON
      media: common: saa7146: fix broken V4L2_PIX_FMT_YUV422P support
      media: common: saa7146: use for_each_sg_dma_page
      media: saa7146: convert to vb2
      media: common: saa7146: fix compliance problems with field handling
      media: common: saa7146: check minimum video format size
      media: common: saa7146: allow S_STD(G_STD)
      media: mxb: update the tvnorms when changing input
      media: common: saa7146: add support for missing .vidioc_try_fmt_vbi_cap
      media: mxb: allow tuner/input/audio ioctls for vbi
      media: pci: saa7146: advertise only those TV standard that are supported
      staging: media: av7110: fix VBI output support

 drivers/media/common/saa7146/Kconfig         |   2 +-
 drivers/media/common/saa7146/saa7146_core.c  |  40 ++--
 drivers/media/common/saa7146/saa7146_fops.c  | 349 ++++++++--------------------------
 drivers/media/common/saa7146/saa7146_hlp.c   |  61 ++++--
 drivers/media/common/saa7146/saa7146_vbi.c   | 287 ++++++++++++----------------
 drivers/media/common/saa7146/saa7146_video.c | 637 ++++++++++++++++++++-------------------------------------------
 drivers/media/pci/saa7146/hexium_gemini.c    |  23 +--
 drivers/media/pci/saa7146/hexium_orion.c     |  24 +--
 drivers/media/pci/saa7146/mxb.c              |  53 +++---
 drivers/media/pci/ttpci/budget-av.c          |   4 +-
 drivers/staging/media/av7110/av7110.c        |   6 +-
 drivers/staging/media/av7110/av7110_hw.c     |   3 +-
 drivers/staging/media/av7110/av7110_v4l.c    | 131 +++++++------
 include/media/drv-intf/saa7146_vv.h          |  44 +----
 14 files changed, 592 insertions(+), 1072 deletions(-)
