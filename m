Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A3777DCA0
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242893AbjHPIqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 04:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243089AbjHPIpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 04:45:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8DB26A0
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 01:45:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76D6C6247E
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 08:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935A1C433C8
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 08:45:49 +0000 (UTC)
Message-ID: <004b9f44-62db-4a65-380f-80129476f2f2@xs4all.nl>
Date:   Wed, 16 Aug 2023 10:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] Remove the old videobuf framework
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

After converting the last driver (bttv) that used the old videobuf
framework, we can now drop that framework completely.

Regards,

	Hans

The following changes since commit b7ec3212a73abc987e8f33aa42988e6c39c38c92:

  media: bttv: convert to vb2 (2023-08-14 20:27:59 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6l

for you to fetch changes up to c0bb3ecbc9a0c37cd0bb0e9156151ad48f5ef414:

  media: remove the old videobuf framework (2023-08-16 10:32:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      media: atomisp: remove left-over videobuf include
      media: remove the old videobuf framework

 Documentation/driver-api/media/v4l2-core.rst                    |    1 -
 Documentation/driver-api/media/v4l2-dev.rst                     |    8 -
 Documentation/driver-api/media/v4l2-videobuf.rst                |  403 ---------------
 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt |   12 -
 drivers/media/v4l2-core/Kconfig                                 |   16 -
 drivers/media/v4l2-core/Makefile                                |    5 -
 drivers/media/v4l2-core/videobuf-core.c                         | 1198 ---------------------------------------------
 drivers/media/v4l2-core/videobuf-dma-contig.c                   |  402 ---------------
 drivers/media/v4l2-core/videobuf-dma-sg.c                       |  681 --------------------------
 drivers/media/v4l2-core/videobuf-vmalloc.c                      |  326 ------------
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c        |    1 -
 include/media/videobuf-core.h                                   |  233 ---------
 include/media/videobuf-dma-contig.h                             |   30 --
 include/media/videobuf-dma-sg.h                                 |  102 ----
 include/media/videobuf-vmalloc.h                                |   43 --
 15 files changed, 3461 deletions(-)
 delete mode 100644 Documentation/driver-api/media/v4l2-videobuf.rst
 delete mode 100644 drivers/media/v4l2-core/videobuf-core.c
 delete mode 100644 drivers/media/v4l2-core/videobuf-dma-contig.c
 delete mode 100644 drivers/media/v4l2-core/videobuf-dma-sg.c
 delete mode 100644 drivers/media/v4l2-core/videobuf-vmalloc.c
 delete mode 100644 include/media/videobuf-core.h
 delete mode 100644 include/media/videobuf-dma-contig.h
 delete mode 100644 include/media/videobuf-dma-sg.h
 delete mode 100644 include/media/videobuf-vmalloc.h
