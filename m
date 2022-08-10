Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84C858ECA5
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 15:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiHJNCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 09:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiHJNBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 09:01:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F8F61116
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 06:01:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 242D061414
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE74C433D6
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 13:01:28 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/6] Remove/replace incorrect references to videobuf
Date:   Wed, 10 Aug 2022 15:01:21 +0200
Message-Id: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quite a few drivers and even the vb2 framework still contain references
to the old videobuf framework, even though they don't use that anymore.

Typically this is either in dead code (ngene), or using the term
videobuf/video-buf when either vb2 or 'video buffer' is meant.

There are also a few functions that use _videobuf_ where _video_buf_
is more appropriate.

This series cleans up the terminology, and this also makes it easier
to identify the remaining drivers that actually use the old videobuf
framework.

No code was changed, it is all comments or renaming functions.

Regards,

	Hans

Hans Verkuil (6):
  media/pci/ngene/ngene.h: remove #ifdef NGENE_V4L
  vb2: videobuf -> videobuf2
  media/v4l2-mem2mem.h: rename 'videobuf' to 'vb2'
  media: platform: ti: avoid using 'videobuf' or 'video-buf'
  staging/media/omap4iss/iss_video.c: videobuf -> vb2
  media: avoid use of 'videobuf'

 .../driver-api/media/drivers/pxa_camera.rst   |  2 +-
 .../media/common/videobuf2/videobuf2-core.c   | 14 ++--
 .../media/common/videobuf2/videobuf2-dvb.c    |  4 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c     |  2 +-
 drivers/media/pci/ngene/ngene.h               | 78 -------------------
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  2 +-
 drivers/media/platform/intel/pxa_camera.c     |  8 +-
 drivers/media/platform/marvell/mcam-core.h    |  2 +-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  2 +-
 .../platform/samsung/exynos4-is/fimc-core.h   |  2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  2 +-
 .../media/platform/ti/am437x/am437x-vpfe.h    |  2 +-
 drivers/media/platform/ti/davinci/vpif.h      | 60 +++++++-------
 .../media/platform/ti/davinci/vpif_capture.c  |  6 +-
 .../media/platform/ti/davinci/vpif_capture.h  |  2 +-
 .../media/platform/ti/davinci/vpif_display.c  |  6 +-
 .../media/platform/ti/davinci/vpif_display.h  |  6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  2 +-
 drivers/media/test-drivers/vim2m.c            |  2 +-
 drivers/media/usb/airspy/airspy.c             |  2 +-
 drivers/media/usb/au0828/au0828-video.c       |  4 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c       |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  2 +-
 drivers/media/usb/em28xx/em28xx-video.c       |  4 +-
 drivers/media/usb/msi2500/msi2500.c           |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c       |  2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  6 +-
 drivers/staging/media/omap4iss/iss_video.c    |  2 +-
 include/media/davinci/vpbe_display.h          |  6 +-
 include/media/v4l2-mem2mem.h                  | 12 +--
 include/media/videobuf2-core.h                | 16 ++--
 include/media/videobuf2-dvb.h                 |  2 +-
 33 files changed, 96 insertions(+), 174 deletions(-)

-- 
2.35.1

