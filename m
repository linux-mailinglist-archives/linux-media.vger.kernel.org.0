Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B86D58E885
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 10:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiHJIQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 04:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiHJIQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 04:16:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0452E7C
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:16:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07FDD60A09
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 08:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBA8C433C1;
        Wed, 10 Aug 2022 08:16:14 +0000 (UTC)
Message-ID: <507d4249-5061-b6c4-12d9-aa77ec7a4d48@xs4all.nl>
Date:   Wed, 10 Aug 2022 10:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] dw100: Add i.MX8MP dw100 dewarper driver
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

Note: patches for v4l-utils to test v4l2_ctrl_modify_dimensions using
the vivid driver pixel_array test control are available here:

https://git.linuxtv.org/hverkuil/v4l-utils.git/log/?h=array

These will be applied once support for this is merged.

Regards,

	Hans

The following changes since commit 485ade76c95ac5ccaa52fee9d712471c9211b989:

  media: hantro: Remove dedicated control documentation (2022-07-27 22:38:47 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1b

for you to fetch changes up to 4b891726d7cd450be6b7a0681a51b773fe646f7b:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-10 09:23:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
      v4l2-ctrls: allocate space for arrays
      v4l2-ctrls: alloc arrays in ctrl_ref
      v4l2-ctrls: add v4l2_ctrl_modify_dimensions
      v4l2-ctrls: add change flag for when dimensions change
      vivid: add pixel_array test control
      v4l2-ctrls: optimize type_ops for arrays

Xavier Roumegue (7):
      v4l2-ctrls: Export default v4l2_ctrl_type_ops callbacks
      media: Documentation: dw100: Add user documentation for the DW100 driver
      media: v4l: uapi: Add user control base for DW100 controls
      media: uapi: Add a control for DW100 driver
      media: dt-bindings: media: Add i.MX8MP DW100 binding
      media: dw100: Add i.MX8MP dw100 dewarper driver
      media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver

 Documentation/devicetree/bindings/media/nxp,dw100.yaml       |   69 ++
 Documentation/userspace-api/media/drivers/dw100.rst          |   84 +++
 Documentation/userspace-api/media/drivers/index.rst          |    1 +
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     |    5 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                                  |    9 +
 drivers/media/platform/nxp/Kconfig                           |    1 +
 drivers/media/platform/nxp/Makefile                          |    1 +
 drivers/media/platform/nxp/dw100/Kconfig                     |   16 +
 drivers/media/platform/nxp/dw100/Makefile                    |    3 +
 drivers/media/platform/nxp/dw100/dw100.c                     | 1706 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h                |  117 ++++
 drivers/media/test-drivers/vivid/vivid-core.h                |    5 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c               |   14 +
 drivers/media/test-drivers/vivid/vivid-vid-cap.c             |    4 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c                     |   62 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c                    |  214 ++++---
 include/media/v4l2-ctrls.h                                   |  140 +++-
 include/uapi/linux/dw100.h                                   |   14 +
 include/uapi/linux/v4l2-controls.h                           |    6 +
 include/uapi/linux/videodev2.h                               |    1 +
 21 files changed, 2356 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h
