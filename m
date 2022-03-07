Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0210E4D040A
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 17:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240436AbiCGQZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 11:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiCGQZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 11:25:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FDE5880F
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 08:24:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F236F60FED
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 16:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B47C340E9
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 16:24:29 +0000 (UTC)
Message-ID: <49051318-d815-b751-5c17-190900ce0f13@xs4all.nl>
Date:   Mon, 7 Mar 2022 17:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] v2: Various cleanups and an ivtv regression fix
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

v2: rebased, no other changes.

The following changes since commit 12fdba564afd1f80eeaeed55c1c81761addda161:

  Merge tag 'for-5.18-2.6-signed' of git://linuxtv.org/sailus/media_tree into media_stage (2022-03-07 16:43:14 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18s

for you to fetch changes up to 25e94139218c0293b4375233c14f2256d7dcfaa8:

  ivtv: fix incorrect device_caps for ivtvfb (2022-03-07 17:21:53 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (1):
      media: MAINTAINERS: update rksip1 maintainers info

Geert Uytterhoeven (1):
      media: rcar-csi2: Drop comma after SoC match table sentinel

Hans Verkuil (1):
      ivtv: fix incorrect device_caps for ivtvfb

Jakob Koschel (1):
      media: saa7134: fix incorrect use to determine if list is empty

Mark Brown (1):
      media: i2c: max2175: Use rbtree rather than flat register cache

Shuah Khan (1):
      MAINTAINERS: update media vimc driver maintainers

Souptick Joarder (HPE) (1):
      media: camss: Replace hard coded value with parameter

 MAINTAINERS                                         |  7 +++----
 drivers/media/i2c/max2175.c                         |  2 +-
 drivers/media/pci/ivtv/ivtv-driver.h                |  1 -
 drivers/media/pci/ivtv/ivtv-ioctl.c                 | 10 +++++-----
 drivers/media/pci/ivtv/ivtv-streams.c               | 11 ++++-------
 drivers/media/pci/saa7134/saa7134-alsa.c            |  4 ++--
 drivers/media/platform/qcom/camss/camss-csid-gen2.c |  2 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c         |  2 +-
 8 files changed, 17 insertions(+), 22 deletions(-)
