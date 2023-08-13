Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F1577A5AC
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 10:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjHMI5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjHMI5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 04:57:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5B1170C
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 01:57:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4485B61C44
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6981C433C8;
        Sun, 13 Aug 2023 08:57:10 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 0/2] Removal of the old videobuf framework
Date:   Sun, 13 Aug 2023 10:57:06 +0200
Message-Id: <20230813085708.305770-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
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

Now that the last driver (bttv) that used the videobuf framework has been
converted to vb2 (Deb, thank you very, very much for all your work on
this!) we can remove the framework.

This series does that. The first patch removes an unused videobuf include
that apparently was missed. The second actually removes all references to
videobuf.

Regards,

	Hans

Hans Verkuil (2):
  media: atomisp: remove left-over videobuf include
  media: remove the old videobuf framework

 Documentation/driver-api/media/v4l2-core.rst  |    1 -
 Documentation/driver-api/media/v4l2-dev.rst   |    8 -
 .../driver-api/media/v4l2-videobuf.rst        |  403 ------
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
 14 files changed, 3449 deletions(-)
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

