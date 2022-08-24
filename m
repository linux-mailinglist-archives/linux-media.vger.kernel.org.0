Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4388659F709
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 12:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbiHXKCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 06:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbiHXKCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 06:02:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013745073A
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 03:01:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CEA0B822BB
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 10:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2CAC433C1;
        Wed, 24 Aug 2022 10:01:55 +0000 (UTC)
Message-ID: <3d9b5a88-c545-6fa1-f0de-b41689703cd8@xs4all.nl>
Date:   Wed, 24 Aug 2022 12:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Corentin Labbe <clabbe.montjoie@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] zoran: move from staging to mainline
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After a bit of cleanup the zoran driver is now ready to be moved back to
mainline.

Regards,

	Hans

The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1e

for you to fetch changes up to 9bceea66308c99f2a2c532e4411c1bad0d7d44ea:

  zoran: move to mainline (2022-08-24 11:49:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      zoran: fix checkpatch --strict issues
      zoran: the video device is video capture only, not M2M
      zoran: from VB2_READ/WRITE: read/write isn't supported
      zoran: move to mainline

 drivers/media/pci/Kconfig                                 |   1 +
 drivers/media/pci/Makefile                                |   1 +
 drivers/{staging/media => media/pci}/zoran/Kconfig        |   0
 drivers/{staging/media => media/pci}/zoran/Makefile       |   0
 drivers/{staging/media => media/pci}/zoran/videocodec.c   |   7 +-
 drivers/{staging/media => media/pci}/zoran/videocodec.h   | 190 ++++++++++++++++++++++++++---------------------------
 drivers/{staging/media => media/pci}/zoran/zoran.h        |  30 +++++----
 drivers/{staging/media => media/pci}/zoran/zoran_card.c   |  56 ++++++++--------
 drivers/{staging/media => media/pci}/zoran/zoran_card.h   |   9 ++-
 drivers/{staging/media => media/pci}/zoran/zoran_device.c |  37 ++++++-----
 drivers/media/pci/zoran/zoran_device.h                    |  60 +++++++++++++++++
 drivers/{staging/media => media/pci}/zoran/zoran_driver.c |  59 ++---------------
 drivers/{staging/media => media/pci}/zoran/zr36016.c      | 142 +++++++++++++++++----------------------
 drivers/{staging/media => media/pci}/zoran/zr36016.h      |   0
 drivers/{staging/media => media/pci}/zoran/zr36050.c      | 182 ++++++++++++++++++++++++--------------------------
 drivers/{staging/media => media/pci}/zoran/zr36050.h      |   0
 drivers/{staging/media => media/pci}/zoran/zr36057.h      | 130 ++++++++++++++++++------------------
 drivers/{staging/media => media/pci}/zoran/zr36060.c      |   7 +-
 drivers/{staging/media => media/pci}/zoran/zr36060.h      |  86 ++++++++++++------------
 drivers/staging/media/Kconfig                             |   2 -
 drivers/staging/media/Makefile                            |   1 -
 drivers/staging/media/zoran/TODO                          |  19 ------
 drivers/staging/media/zoran/zoran_device.h                |  60 -----------------
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
