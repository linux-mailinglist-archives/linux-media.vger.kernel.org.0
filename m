Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE61B512E32
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 10:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344092AbiD1I2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 04:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344080AbiD1I22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 04:28:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A636C96823
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 01:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1BD26B81BF0
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 08:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEDDC385AE;
        Thu, 28 Apr 2022 08:25:08 +0000 (UTC)
Message-ID: <db9b2a4f-7074-b609-2e1f-717932067f95@xs4all.nl>
Date:   Thu, 28 Apr 2022 10:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ming Qian <ming.qian@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] More fixes/enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19e

for you to fetch changes up to e0b2d38621300d77bb2bc9e8fc36723e079f3f41:

  media: amphion: ensure the buffer count is not less than min_buffer (2022-04-28 10:15:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christopher Obbard (1):
      media: dt-bindings: media: rockchip-vdec: Add RK3328 compatible

Dorota Czaplejewicz (1):
      Documentation/media: Remove incorrect statement

Fabio Estevam (1):
      media: platform: video-viu: Do not select it by default

Lv Ruyi (1):
      media: amphion: no need to check return value of debugfs_create functions

Ming Qian (5):
      media: amphion: decoder copy timestamp from output to capture
      media: amphion: encoder copy timestamp from output to capture
      media: amphion: handle picture skipped event
      media: amphion: free ctrl handler if error is set and return error
      media: amphion: ensure the buffer count is not less than min_buffer

Pavel Skripkin (1):
      media: pvrusb2: fix array-index-out-of-bounds in pvr2_i2c_core_init

Philipp Zabel (2):
      media: coda: fix default JPEG colorimetry
      media: coda: limit frame interval enumeration to supported encoder frame sizes

Randy Dunlap (1):
      media: make RADIO_ADAPTERS tristate

Tom Rix (1):
      media: stkwebcam: move stk_camera_read_reg() scratch buffer to struct stk_camera

Yang Yingliang (3):
      dm355_ccdc: remove unnecessary check of res
      dm644x_ccdc: remove unnecessary check of res
      media: isif: remove unnecessary check of res

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml |  4 ++-
 Documentation/userspace-api/media/v4l/vidioc-streamon.rst  |  3 +--
 drivers/media/platform/amphion/vdec.c                      | 82 +++++++++++++++++++++++++------------------------------------
 drivers/media/platform/amphion/venc.c                      | 53 +++++++++++++++++----------------------
 drivers/media/platform/amphion/vpu_dbg.c                   | 12 ---------
 drivers/media/platform/amphion/vpu_defs.h                  |  2 +-
 drivers/media/platform/amphion/vpu_malone.c                |  4 ++-
 drivers/media/platform/amphion/vpu_msgs.c                  |  8 ++++++
 drivers/media/platform/amphion/vpu_v4l2.c                  | 60 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_v4l2.h                  |  3 +++
 drivers/media/platform/chips-media/coda-common.c           | 37 +++++++++++++++++++---------
 drivers/media/platform/nxp/Kconfig                         |  1 -
 drivers/media/platform/ti/davinci/dm355_ccdc.c             |  3 +--
 drivers/media/platform/ti/davinci/dm644x_ccdc.c            |  3 +--
 drivers/media/platform/ti/davinci/isif.c                   |  3 +--
 drivers/media/radio/Kconfig                                |  4 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c                    |  7 ++++--
 drivers/media/usb/stkwebcam/stk-webcam.c                   | 11 ++-------
 drivers/media/usb/stkwebcam/stk-webcam.h                   |  2 ++
 19 files changed, 173 insertions(+), 129 deletions(-)
