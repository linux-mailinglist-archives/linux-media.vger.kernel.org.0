Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB50967CF30
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbjAZPHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjAZPHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9D748A24
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7361C61870
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B77C433EF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:06:59 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/17] media: sparse/smatch fixes
Date:   Thu, 26 Jan 2023 16:06:40 +0100
Message-Id: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have way too many sparse/smatch warnings and errors today, making
it hard to tell when new issues are introduced.

This series will get rid of most of them.

Regards,

	Hans

Hans Verkuil (17):
  media: visl: make visl_qops static
  media: davinci/vpif.c: drop unnecessary cast
  media: i2c: s5c73m3: return 0 instead of 'ret'.
  media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
  media: usb: dvb-usb-v2: af9015.c: return 0 instead of 'ret'.
  media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
  media: marvell: change return to goto for proper unwind
  media: dvb-frontends: drx39xyj: replace return with goto for proper
    unwind
  media: nxp: imx-jpeg: replace dummy gotos by returns
  media: mediatek: mdp3: replace return by goto for proper unwind
  media: mediatek: vcodec/venc: return 0 instead of 'ret'.
  media: ti: davinci: vpbe_display.c: return 0 instead of 'ret'.
  media: i2c: ov7670: 0 instead of -EINVAL was returned
  media: usb: go7007: add second unwind label
  media: i2c: adp1653: introduce 'no_child' label
  media: st: delta: introduce 'err_too_many_comps' label
  media: dvb-frontends: mb86a16.c: always use the same error path

 .../dvb-frontends/cxd2880/cxd2880_tnrdmd.c    |  4 ++--
 .../cxd2880/cxd2880_tnrdmd_dvbt.c             | 14 +++++++-------
 .../cxd2880/cxd2880_tnrdmd_dvbt2.c            | 14 +++++++-------
 drivers/media/dvb-frontends/drx39xyj/drxj.c   |  9 ++++++---
 drivers/media/dvb-frontends/mb86a16.c         |  9 ++++++---
 drivers/media/i2c/adp1653.c                   |  5 +++--
 drivers/media/i2c/ov7670.c                    |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
 drivers/media/platform/marvell/mmp-driver.c   |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    |  3 ++-
 .../mediatek/vcodec/venc/venc_h264_if.c       |  4 ++--
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 19 ++++++-------------
 .../platform/st/sti/delta/delta-mjpeg-hdr.c   | 16 +++++++++-------
 .../media/platform/ti/davinci/vpbe_display.c  |  2 +-
 drivers/media/platform/ti/davinci/vpif.c      |  2 +-
 drivers/media/test-drivers/visl/visl-video.c  |  2 +-
 drivers/media/usb/dvb-usb-v2/af9015.c         |  4 ++--
 drivers/media/usb/go7007/go7007-usb.c         | 11 +++++++----
 18 files changed, 65 insertions(+), 59 deletions(-)

-- 
2.39.0

