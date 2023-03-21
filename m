Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139476C3466
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 15:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjCUOhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCUOhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 10:37:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8764DE29
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 07:37:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F034E61CAF
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 14:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76707C433EF;
        Tue, 21 Mar 2023 14:37:42 +0000 (UTC)
Message-ID: <a4dafa22-3ee3-dbe1-fd50-fee07883ce1a@xs4all.nl>
Date:   Tue, 21 Mar 2023 15:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ming Qian <ming.qian@nxp.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Zheng Wang <zyytlz.wz@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] Various codec fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:

  media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4f

for you to fetch changes up to bc08747b7f34fcc768ff3b17f1c16f6d3b336cb3:

  media: rkvdec: fix use after free bug in rkvdec_remove (2023-03-21 15:03:16 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (6):
      media: verisilicon: Do not set context src/dst formats in reset functions
      media: verisilicon: Do not use ctx fields as format storage when resetting
      media: verisilicon: Do not set ctx->bit_depth in hantro_try_ctrl()
      media: verisilicon: Do not change context bit depth before validating the format
      media: verisilicon: HEVC: Only propose 10 bits compatible pixels formats
      media: verisilicon: VP9: Only propose 10 bits compatible pixels formats

Ming Qian (4):
      media: add Sorenson Spark video format
      media: amphion: support to decode sorenson spark video
      media: add RealVideo format RV30 and RV40
      media: amphion: support to decode RealVideo video

Yunfei Dong (7):
      media: mediatek: vcodec: add params to record lat and core lat_buf count
      media: mediatek: vcodec: using each instance lat_buf count replace core ready list
      media: mediatek: vcodec: move lat_buf to the top of core list
      media: mediatek: vcodec: add core decode done event
      media: mediatek: vcodec: remove unused lat_buf
      media: mediatek: vcodec: making sure queue_work successfully
      media: mediatek: vcodec: change lat thread decode error condition

Zheng Wang (2):
      media: cedrus: fix use after free bug in cedrus_remove due to race condition
      media: rkvdec: fix use after free bug in rkvdec_remove

 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst          | 25 ++++++++++++++++
 drivers/media/platform/amphion/vdec.c                                | 21 +++++++++++++
 drivers/media/platform/amphion/vpu_malone.c                          | 41 ++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h                          |  1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    |  6 ++--
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c |  2 +-
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c    |  2 +-
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c              | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++--------
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h              | 12 ++++++++
 drivers/media/platform/verisilicon/hantro_drv.c                      | 49 +++++++++++++++++++++++-------
 drivers/media/platform/verisilicon/hantro_postproc.c                 |  2 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c                     | 90 ++++++++++++++++++++++++++-----------------------------
 drivers/media/platform/verisilicon/hantro_v4l2.h                     |  3 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c                    |  2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                                 |  3 ++
 drivers/staging/media/rkvdec/rkvdec.c                                |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus.c                          |  1 +
 include/uapi/linux/videodev2.h                                       |  3 ++
 18 files changed, 282 insertions(+), 78 deletions(-)
