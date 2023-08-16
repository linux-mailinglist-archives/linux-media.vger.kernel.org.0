Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9863B77DC0D
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 10:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242844AbjHPIVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 04:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241198AbjHPIVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 04:21:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5E41BE8
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 01:21:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9F0760E06
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 08:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A06C433C8
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 08:21:15 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2 0/2] Removal of the old videobuf framework
Date:   Wed, 16 Aug 2023 10:21:11 +0200
Message-Id: <20230816082113.1041261-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the last driver (bttv) that used the videobuf framework has been
converted to vb2 (Deb, thank you very, very much for all your work on
this!) we can remove the framework.

This series does that. The first patch removes an unused videobuf include
that apparently was missed. The second actually removes all references to
videobuf.

Regards,

	Hans

Changes since v1:

- Added HdG's Reviewed-by
- Dropped a missed reference to videobuf from the chinese translation.

Hans Verkuil (2):
  media: atomisp: remove left-over videobuf include
  media: remove the old videobuf framework

 Documentation/driver-api/media/v4l2-core.rst  |    1 -
 Documentation/driver-api/media/v4l2-dev.rst   |    8 -
 .../driver-api/media/v4l2-videobuf.rst        |  403 ------
 .../zh_CN/video4linux/v4l2-framework.txt      |   12 -
 drivers/media/v4l2-core/Kconfig               |   16 -
 drivers/media/v4l2-core/Makefile              |    5 -
 drivers/media/v4l2-core/videobuf-core.c       | 1198 -----------------
 drivers/media/v4l2-core/videobuf-dma-contig.c |  402 ------
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  681 ----------
 drivers/media/v4l2-core/videobuf-vmalloc.c    |  326 -----
 .../media/atomisp/pci/atomisp_compat_css20.c  |    1 -
 include/media/videobuf-core.h                 |  233 ----
 include/media/videobuf-dma-contig.h           |   30 -
 include/media/videobuf-dma-sg.h               |  102 --
 include/media/videobuf-vmalloc.h              |   43 -
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

-- 
2.40.1

