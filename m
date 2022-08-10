Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7103C58EB8F
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 13:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiHJLyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 07:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiHJLyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 07:54:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0881C7FE73
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 04:54:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B0009B818E4
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 11:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C9BC433C1;
        Wed, 10 Aug 2022 11:54:47 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/4] zoran: move to mainline
Date:   Wed, 10 Aug 2022 13:54:41 +0200
Message-Id: <20220810115445.2302477-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Corentin Labbe did the hard work of converting the zoran driver
to vb2. The only things left to do in order to move it back to
mainline is to fix the remaining checkpatch issues, fix two
minor left-overs from the time that video output was supported
and finally move it back to drivers/media/pci.

Regards,

	Hans

Hans Verkuil (4):
  zoran: fix checkpatch --strict issues
  zoran: the video device is video capture only, not M2M
  zoran: from VB2_READ/WRITE: read/write isn't supported
  zoran: move to mainline

 drivers/media/pci/Kconfig                     |   1 +
 drivers/media/pci/Makefile                    |   1 +
 .../media => media/pci}/zoran/Kconfig         |   0
 .../media => media/pci}/zoran/Makefile        |   0
 .../media => media/pci}/zoran/videocodec.c    |   7 +-
 .../media => media/pci}/zoran/videocodec.h    | 190 +++++++++---------
 .../media => media/pci}/zoran/zoran.h         |  30 ++-
 .../media => media/pci}/zoran/zoran_card.c    |  56 +++---
 .../media => media/pci}/zoran/zoran_card.h    |   9 +-
 .../media => media/pci}/zoran/zoran_device.c  |  37 ++--
 drivers/media/pci/zoran/zoran_device.h        |  60 ++++++
 .../media => media/pci}/zoran/zoran_driver.c  |  59 +-----
 .../media => media/pci}/zoran/zr36016.c       | 142 ++++++-------
 .../media => media/pci}/zoran/zr36016.h       |   0
 .../media => media/pci}/zoran/zr36050.c       | 182 ++++++++---------
 .../media => media/pci}/zoran/zr36050.h       |   0
 .../media => media/pci}/zoran/zr36057.h       | 130 ++++++------
 .../media => media/pci}/zoran/zr36060.c       |   7 +-
 .../media => media/pci}/zoran/zr36060.h       |  86 ++++----
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/zoran/TODO              |  19 --
 drivers/staging/media/zoran/zoran_device.h    |  60 ------
 23 files changed, 491 insertions(+), 588 deletions(-)
 rename drivers/{staging/media => media/pci}/zoran/Kconfig (100%)
 rename drivers/{staging/media => media/pci}/zoran/Makefile (100%)
 rename drivers/{staging/media => media/pci}/zoran/videocodec.c (97%)
 rename drivers/{staging/media => media/pci}/zoran/videocodec.h (65%)
 rename drivers/{staging/media => media/pci}/zoran/zoran.h (90%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_card.c (97%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_card.h (72%)
 rename drivers/{staging/media => media/pci}/zoran/zoran_device.c (96%)
 create mode 100644 drivers/media/pci/zoran/zoran_device.h
 rename drivers/{staging/media => media/pci}/zoran/zoran_driver.c (94%)
 rename drivers/{staging/media => media/pci}/zoran/zr36016.c (73%)
 rename drivers/{staging/media => media/pci}/zoran/zr36016.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36050.c (82%)
 rename drivers/{staging/media => media/pci}/zoran/zr36050.h (100%)
 rename drivers/{staging/media => media/pci}/zoran/zr36057.h (50%)
 rename drivers/{staging/media => media/pci}/zoran/zr36060.c (99%)
 rename drivers/{staging/media => media/pci}/zoran/zr36060.h (72%)
 delete mode 100644 drivers/staging/media/zoran/TODO
 delete mode 100644 drivers/staging/media/zoran/zoran_device.h

-- 
2.35.1

