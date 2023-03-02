Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6D26A831B
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjCBNDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjCBNDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:38 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED9D18175
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A1C53CE1F14
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889B7C433D2
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:32 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/17] saa7146: convert to vb2
Date:   Thu,  2 Mar 2023 14:03:13 +0100
Message-Id: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts the saa7146 driver to vb2.

This sits on top of the overlay removal patch:

https://patchwork.linuxtv.org/project/linux-media/patch/20230302125731.1124945-2-hverkuil-cisco@xs4all.nl/

Tested with my mxb board and limited testing with a Hexium Orion board.

Note: the av7110 has sliced VBI output support, I suspect that might
no longer work. I do have an av7110 board, but it has no analog HW.

I'll try to find someone to test this for me.

Regards,

	Hans

Hans Verkuil (17):
  media: saa7146: drop 'dev' and 'resources' from struct saa7146_fh
  media: common: saa7146: drop 'fmt' from struct saa7146_buf
  media: common: saa7146: replace BUG_ON by WARN_ON
  staging: media: av7110: replace BUG_ON by WARN_ON
  media: common: saa7146: fix broken V4L2_PIX_FMT_YUV422P support
  media: common: saa7146: use for_each_sg_dma_page
  media: saa7146: convert to vb2
  media: common: saa7146: fix compliance problems with field handling
  media: common: saa7146: check minimum video format size
  media: common: saa7146: fall back to V4L2_PIX_FMT_BGR24
  media: common: saa7146: allow S_STD(G_STD)
  media: mxb: update the tvnorms when changing input
  media: common: saa7146: add support for missing
    .vidioc_try_fmt_vbi_cap
  media: mxb: allow tuner/input/audio ioctls for vbi
  media: common: saa7146: allow AUDIO ioctls for the vbi stream
  media: common: saa7146: drop USERPTR support
  media: pci: saa7146: advertise only those TV standard that are
    supported

 drivers/media/common/saa7146/Kconfig         |   2 +-
 drivers/media/common/saa7146/saa7146_core.c  |  40 +-
 drivers/media/common/saa7146/saa7146_fops.c  | 342 ++--------
 drivers/media/common/saa7146/saa7146_hlp.c   |  44 +-
 drivers/media/common/saa7146/saa7146_vbi.c   | 286 ++++-----
 drivers/media/common/saa7146/saa7146_video.c | 637 ++++++-------------
 drivers/media/pci/saa7146/hexium_gemini.c    |  23 +-
 drivers/media/pci/saa7146/hexium_orion.c     |  23 +-
 drivers/media/pci/saa7146/mxb.c              |  53 +-
 drivers/media/pci/ttpci/budget-av.c          |   4 +-
 drivers/staging/media/av7110/av7110.c        |   6 +-
 drivers/staging/media/av7110/av7110_hw.c     |   3 +-
 drivers/staging/media/av7110/av7110_v4l.c    |  35 +-
 include/media/drv-intf/saa7146_vv.h          |  38 +-
 14 files changed, 505 insertions(+), 1031 deletions(-)

-- 
2.39.1

