Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210F159FDF9
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbiHXPM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 11:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237166AbiHXPMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 11:12:55 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EF492F67
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 08:12:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 75D5FCE23B5
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 15:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70366C433C1
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 15:12:51 +0000 (UTC)
Message-ID: <36a63316-cbd9-9c16-2d1c-185800615bbf@xs4all.nl>
Date:   Wed, 24 Aug 2022 17:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] cedrus, amphion and meson fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1i

for you to fetch changes up to 296a820740ab6901b0ce658ac3ddb12c34bb257c:

  media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start() (2022-08-24 16:49:49 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dmitry Osipenko (2):
      media: cedrus: Set the platform driver data earlier
      media: cedrus: Fix endless loop in cedrus_h265_skip_bits()

Ezequiel Garcia (2):
      cedrus: Use vb2_find_buffer
      videobuf2: Remove vb2_find_timestamp()

Hangyu Hua (1):
      media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc

Ming Qian (4):
      media: amphion: insert picture startcode after seek for vc1g format
      media: amphion: adjust the encoder's value range of gop size
      media: amphion: don't change the colorspace reported by decoder.
      media: amphion: fix a bug that vpu core may not resume after suspend

Nicolas Dufresne (1):
      media: cedrus: Fix watchdog race condition

Xu Qiang (1):
      media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()

 drivers/media/common/videobuf2/videobuf2-v4l2.c      | 13 ---------
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c     |  1 -
 drivers/media/platform/amphion/vdec.c                | 16 ++++++------
 drivers/media/platform/amphion/venc.c                |  2 +-
 drivers/media/platform/amphion/vpu.h                 |  1 -
 drivers/media/platform/amphion/vpu_core.c            | 84 ++++++++++++++++++++++++++++++-----------------------------
 drivers/media/platform/amphion/vpu_core.h            |  1 +
 drivers/media/platform/amphion/vpu_dbg.c             |  9 +++++--
 drivers/media/platform/amphion/vpu_malone.c          |  2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  1 -
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c     |  3 +--
 drivers/staging/media/meson/vdec/vdec_hevc.c         |  6 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus.c          |  4 +--
 drivers/staging/media/sunxi/cedrus/cedrus.h          | 24 ++++++++++-------
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c      |  4 +--
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c     | 16 ++++++------
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c     | 23 ++++++++--------
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c    | 28 ++++++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c      | 43 ++++++------------------------
 include/media/videobuf2-v4l2.h                       | 16 ------------
 20 files changed, 121 insertions(+), 176 deletions(-)
