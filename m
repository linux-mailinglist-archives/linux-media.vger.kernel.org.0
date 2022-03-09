Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88E34D2D11
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiCIKXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiCIKXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:23:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98CDAE7F
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 02:22:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA3DFB81EA0
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 10:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F6C340E8;
        Wed,  9 Mar 2022 10:22:45 +0000 (UTC)
Message-ID: <139ddb8b-4958-4a04-2a79-f809705cb08b@xs4all.nl>
Date:   Wed, 9 Mar 2022 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ming Qian <ming.qian@nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.18] Four fixes
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

The following changes since commit b3627647f9ea7473d10fb08a95fd7c4133a17ca4:

  Merge tag 'br-v5.18s' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-03-07 17:38:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18a

for you to fetch changes up to 636d094537fd4d5de98a2bb48139b6dd3559b307:

  media: amphion: fix some error related with undefined reference to __divdi3 (2022-03-09 10:44:59 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      pixfmt-yuv-planar.rst: fix PIX_FMT labels
      m5mols/m5mols.h: document new reset field

Ming Qian (1):
      media: amphion: fix some error related with undefined reference to __divdi3

Yihao Han (1):
      media: vidtv: use vfree() for memory allocated with vzalloc()

 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |  5 +++--
 drivers/media/i2c/m5mols/m5mols.h                           |  1 +
 drivers/media/platform/amphion/vdec.c                       | 35 -----------------------------------
 drivers/media/platform/amphion/vpu_helpers.h                |  3 ---
 drivers/media/platform/amphion/vpu_malone.c                 | 24 +++++++++++++-----------
 drivers/media/platform/amphion/vpu_v4l2.c                   |  5 +----
 drivers/media/platform/amphion/vpu_windsor.c                | 18 ++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_s302m.c              |  2 +-
 8 files changed, 27 insertions(+), 66 deletions(-)
