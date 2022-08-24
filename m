Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E5959F68C
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 11:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbiHXJmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 05:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236160AbiHXJmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 05:42:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D48285AA0
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 02:42:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 170BF617F2
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 09:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A68C433C1
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 09:42:45 +0000 (UTC)
Message-ID: <f99cc164-7a44-8f20-4399-d517e492b034@xs4all.nl>
Date:   Wed, 24 Aug 2022 11:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Fix typos in comments
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

English is is very very hard hard...

	Hans

The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1d

for you to fetch changes up to eb422bec49117955edac811ee6f67252e1a4b48f:

  ti/omap: fix repeated words in comments (2022-08-24 11:32:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jason Wang (5):
      media: dib8000: Fix comment typo
      media: sun6i-csi: Fix comment typo
      media: drxk: Fix comment typo
      media: technisat-usb2: Fix comment typo
      media: v4l2-flash: Fix comment typo

Li zeming (1):
      staging/media/av7110/av7110: Fix typo in string

Slark Xiao (8):
      media: dvb-frontends: Fix typo 'the the' in comment
      media: cx88: Fix typo 'the the' in comment
      media: ivtv: Fix typo 'the the' in comment
      media: saa7164: Fix typo 'the the' in comment
      media: platform: ti: Fix typo 'the the' in comment
      media: gspca: Fix typo 'the the' in comment
      media: tm6000: Fix typo 'the the' in comment
      media: v4l2-ioctl: Fix typo 'the the' in comment

wangjianli (5):
      i2c/cx25840: fix repeated words in comments
      pci/cx18: fix repeated words in comments
      pci/cx18: fix repeated words in comments
      pci/cx23885: fix repeated words in comments
      ti/omap: fix repeated words in comments

 drivers/media/dvb-frontends/dib8000.c                | 2 +-
 drivers/media/dvb-frontends/drxk_hard.c              | 2 +-
 drivers/media/dvb-frontends/tda1002x.h               | 2 +-
 drivers/media/dvb-frontends/tda10048.c               | 2 +-
 drivers/media/i2c/cx25840/cx25840-ir.c               | 2 +-
 drivers/media/pci/cx18/cx18-av-audio.c               | 2 +-
 drivers/media/pci/cx18/cx18-firmware.c               | 2 +-
 drivers/media/pci/cx23885/cx23888-ir.c               | 2 +-
 drivers/media/pci/cx88/cx88-dsp.c                    | 2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c                    | 2 +-
 drivers/media/pci/saa7164/saa7164-core.c             | 2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 2 +-
 drivers/media/platform/ti/davinci/vpbe.c             | 2 +-
 drivers/media/platform/ti/omap/omap_voutlib.c        | 2 +-
 drivers/media/platform/ti/omap3isp/isp.c             | 2 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c           | 2 +-
 drivers/media/usb/gspca/finepix.c                    | 2 +-
 drivers/media/usb/tm6000/tm6000-cards.c              | 2 +-
 drivers/media/v4l2-core/v4l2-flash-led-class.c       | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                 | 2 +-
 drivers/staging/media/av7110/av7110_av.c             | 2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)
