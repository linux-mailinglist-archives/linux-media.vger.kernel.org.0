Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E206C6C9E
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 16:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjCWPyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 11:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjCWPx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 11:53:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3751121968
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 08:53:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5FED96279B
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BA8C433D2
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 15:53:45 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2 00/19] saa7146: convert to vb2
Date:   Thu, 23 Mar 2023 16:53:24 +0100
Message-Id: <20230323155343.2399473-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts the saa7146 driver to vb2.

Tested with my mxb board, Hexium Orion and Gemini boards and av7110 boards
(DVB-C and DVB-T).

I don't have a av7110 card with analog video capture, so that remains
untested.

Note that the first patch fixes a regression that the removal of overlay
support introduced.

Regards,

	Hans

Hans Verkuil (19):
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
  media: common: saa7146: fall back to V4L2_PIX_FMT_BGR24
  media: common: saa7146: allow S_STD(G_STD)
  media: mxb: update the tvnorms when changing input
  media: common: saa7146: add support for missing
    .vidioc_try_fmt_vbi_cap
  media: mxb: allow tuner/input/audio ioctls for vbi
  media: pci: saa7146: advertise only those TV standard that are
    supported
  staging: media: av7110: fix VBI output support

 drivers/media/common/saa7146/Kconfig         |   2 +-
 drivers/media/common/saa7146/saa7146_core.c  |  40 +-
 drivers/media/common/saa7146/saa7146_fops.c  | 349 +++-------
 drivers/media/common/saa7146/saa7146_hlp.c   |  61 +-
 drivers/media/common/saa7146/saa7146_vbi.c   | 287 ++++-----
 drivers/media/common/saa7146/saa7146_video.c | 642 ++++++-------------
 drivers/media/pci/saa7146/hexium_gemini.c    |  23 +-
 drivers/media/pci/saa7146/hexium_orion.c     |  24 +-
 drivers/media/pci/saa7146/mxb.c              |  53 +-
 drivers/media/pci/ttpci/budget-av.c          |   4 +-
 drivers/staging/media/av7110/av7110.c        |   6 +-
 drivers/staging/media/av7110/av7110_hw.c     |   3 +-
 drivers/staging/media/av7110/av7110_v4l.c    | 116 ++--
 include/media/drv-intf/saa7146_vv.h          |  44 +-
 14 files changed, 598 insertions(+), 1056 deletions(-)

-- 
2.39.2

