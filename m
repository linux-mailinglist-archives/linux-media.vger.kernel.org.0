Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122284CF2CB
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 08:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiCGHpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 02:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiCGHpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 02:45:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF06462EE
        for <linux-media@vger.kernel.org>; Sun,  6 Mar 2022 23:44:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 870DF60B4B
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 07:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC52BC340E9
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 07:44:13 +0000 (UTC)
Message-ID: <2d0bd966-8153-30b8-118c-0a21d4af31e4@xs4all.nl>
Date:   Mon, 7 Mar 2022 08:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Various cleanups and an ivtv regression fix
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

The following changes since commit 2881ca629984b949ec9ac2e8ba1e64a2f0b66e8b:

  media: Makefiles: sort entries where it fits (2022-02-22 08:27:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18s

for you to fetch changes up to ae4c0d36340f06795feb09a7d8d3e881ccb0e589:

  ivtv: fix incorrect device_caps for ivtvfb (2022-03-07 08:42:36 +0100)

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
