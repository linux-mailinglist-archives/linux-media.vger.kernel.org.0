Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BDB4D03E4
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 17:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiCGQUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 11:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbiCGQUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 11:20:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEF1E0F4
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 08:19:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B61F60C53
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 16:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AE5C340E9
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 16:19:13 +0000 (UTC)
Message-ID: <94183ccf-d04b-fda9-863d-3d5f4f6d0be5@xs4all.nl>
Date:   Mon, 7 Mar 2022 17:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] v3: amphion video decoder/encoder driver
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

Changes since v2:

- Rebased to latest staging tree.

Changes since v1:

- Added the Makefile/Kconfig last after all the other driver sources are in place
  to avoid bisect problems.


The following changes since commit 12fdba564afd1f80eeaeed55c1c81761addda161:

  Merge tag 'for-5.18-2.6-signed' of git://linuxtv.org/sailus/media_tree into media_stage (2022-03-07 16:43:14 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18r

for you to fetch changes up to 42356ecbdb69e49cffd0c1df791280965f9f90e1:

  media: amphion: add amphion vpu entry in Kconfig and Makefile (2022-03-07 17:14:24 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ming Qian (12):
      dt-bindings: media: amphion: add amphion video codec bindings
      media: add nv12m_8l128 and nv12m_10be_8l128 video format.
      media: amphion: add amphion vpu device driver
      media: amphion: add vpu core driver
      media: amphion: implement vpu core communication based on mailbox
      media: amphion: add vpu v4l2 m2m support
      media: amphion: add v4l2 m2m vpu encoder stateful driver
      media: amphion: add v4l2 m2m vpu decoder stateful driver
      media: amphion: implement windsor encoder rpc interface
      media: amphion: implement malone decoder rpc interface
      MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
      media: amphion: add amphion vpu entry in Kconfig and Makefile

 Documentation/devicetree/bindings/media/amphion,vpu.yaml    |  180 +++++++
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |   28 +-
 MAINTAINERS                                                 |    9 +
 drivers/media/platform/Kconfig                              |   19 +
 drivers/media/platform/Makefile                             |    2 +
 drivers/media/platform/amphion/Makefile                     |   20 +
 drivers/media/platform/amphion/vdec.c                       | 1691 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/venc.c                       | 1358 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu.h                        |  362 +++++++++++++
 drivers/media/platform/amphion/vpu_cmds.c                   |  433 ++++++++++++++++
 drivers/media/platform/amphion/vpu_cmds.h                   |   25 +
 drivers/media/platform/amphion/vpu_codec.h                  |   68 +++
 drivers/media/platform/amphion/vpu_color.c                  |  183 +++++++
 drivers/media/platform/amphion/vpu_core.c                   |  871 +++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_core.h                   |   15 +
 drivers/media/platform/amphion/vpu_dbg.c                    |  494 ++++++++++++++++++
 drivers/media/platform/amphion/vpu_defs.h                   |  187 +++++++
 drivers/media/platform/amphion/vpu_drv.c                    |  260 ++++++++++
 drivers/media/platform/amphion/vpu_helpers.c                |  413 +++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h                |   74 +++
 drivers/media/platform/amphion/vpu_imx8q.c                  |  271 ++++++++++
 drivers/media/platform/amphion/vpu_imx8q.h                  |  115 +++++
 drivers/media/platform/amphion/vpu_malone.c                 | 1625 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h                 |   44 ++
 drivers/media/platform/amphion/vpu_mbox.c                   |  118 +++++
 drivers/media/platform/amphion/vpu_mbox.h                   |   16 +
 drivers/media/platform/amphion/vpu_msgs.c                   |  385 ++++++++++++++
 drivers/media/platform/amphion/vpu_msgs.h                   |   14 +
 drivers/media/platform/amphion/vpu_rpc.c                    |  257 ++++++++++
 drivers/media/platform/amphion/vpu_rpc.h                    |  456 +++++++++++++++++
 drivers/media/platform/amphion/vpu_v4l2.c                   |  712 ++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_v4l2.h                   |   55 ++
 drivers/media/platform/amphion/vpu_windsor.c                | 1169 ++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h                |   37 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                        |    2 +
 include/uapi/linux/videodev2.h                              |    2 +
 36 files changed, 11967 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml
 create mode 100644 drivers/media/platform/amphion/Makefile
 create mode 100644 drivers/media/platform/amphion/vdec.c
 create mode 100644 drivers/media/platform/amphion/venc.c
 create mode 100644 drivers/media/platform/amphion/vpu.h
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
 create mode 100644 drivers/media/platform/amphion/vpu_codec.h
 create mode 100644 drivers/media/platform/amphion/vpu_color.c
 create mode 100644 drivers/media/platform/amphion/vpu_core.c
 create mode 100644 drivers/media/platform/amphion/vpu_core.h
 create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
 create mode 100644 drivers/media/platform/amphion/vpu_defs.h
 create mode 100644 drivers/media/platform/amphion/vpu_drv.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
 create mode 100644 drivers/media/platform/amphion/vpu_malone.c
 create mode 100644 drivers/media/platform/amphion/vpu_malone.h
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.h
