Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A7F680C35
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 12:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbjA3Lpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 06:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbjA3LpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 06:45:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C962D159
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 03:45:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B82D60F15
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 11:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA6BC433D2
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 11:45:18 +0000 (UTC)
Message-ID: <30e837fa-5b1e-4022-b719-6bc318e8fdf9@xs4all.nl>
Date:   Mon, 30 Jan 2023 12:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] sparse/smatch fixes
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

This series fixes most sparse/smatch issues in the current
tree.

My original series is here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=9747

I did not include three patches (14, 15 and 16) for 'proper unwind' fixes
here since hopefully smatch can become a bit smarter so those patches won't
be needed.

The others are all good fixes, so I kept those for this PR.

Regards,

	Hans

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3h

for you to fetch changes up to 0ba6b7d83890961e4e93b5cb5de5b506e1db1acc:

  media: dvb-frontends: mb86a16.c: always use the same error path (2023-01-30 09:27:52 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (14):
      media: visl: make visl_qops static
      media: davinci/vpif.c: drop unnecessary cast
      media: i2c: s5c73m3: return 0 instead of 'ret'.
      media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
      media: usb: dvb-usb-v2: af9015.c: return 0 instead of 'ret'.
      media: dvb-frontends: cxd2880: return 0 instead of 'ret'.
      media: marvell: change return to goto for proper unwind
      media: dvb-frontends: drx39xyj: replace return with goto for proper unwind
      media: nxp: imx-jpeg: replace dummy gotos by returns
      media: mediatek: mdp3: replace return by goto for proper unwind
      media: mediatek: vcodec/venc: return 0 instead of 'ret'.
      media: ti: davinci: vpbe_display.c: return 0 instead of 'ret'.
      media: i2c: ov7670: 0 instead of -EINVAL was returned
      media: dvb-frontends: mb86a16.c: always use the same error path

 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd.c       |  4 ++--
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt.c  | 14 +++++++-------
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2.c | 14 +++++++-------
 drivers/media/dvb-frontends/drx39xyj/drxj.c                |  9 ++++++---
 drivers/media/dvb-frontends/mb86a16.c                      |  9 ++++++---
 drivers/media/i2c/ov7670.c                                 |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c                   |  2 +-
 drivers/media/platform/marvell/mmp-driver.c                |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c       |  3 ++-
 drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c |  4 ++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c             | 19 ++++++-------------
 drivers/media/platform/ti/davinci/vpbe_display.c           |  2 +-
 drivers/media/platform/ti/davinci/vpif.c                   |  2 +-
 drivers/media/test-drivers/visl/visl-video.c               |  2 +-
 drivers/media/usb/dvb-usb-v2/af9015.c                      |  4 ++--
 15 files changed, 46 insertions(+), 46 deletions(-)
