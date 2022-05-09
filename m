Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F4751FD4F
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 14:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbiEIMzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 08:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbiEIMze (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 08:55:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DEC1C12E9
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 05:51:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F7EFB81222
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 12:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE60CC385A8
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 12:51:36 +0000 (UTC)
Message-ID: <55457695-4f48-68a4-d5b1-1d6ff2ef253e@xs4all.nl>
Date:   Mon, 9 May 2022 14:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.19] smatch fixes
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

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-smatch-fixes

for you to fetch changes up to 39ae259ccae506d95ba194d558a6af7d8cfa7c26:

  s5k6a3: add missing clk_disable_unprepare (2022-05-09 14:33:58 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
      v4l2-subdev.c: kvmalloc_array -> kvcalloc
      v4l2-ctls-core.c: kvmalloc_array -> kvcalloc
      videobuf2-dma-sg.c: kvmalloc_array -> kvcalloc
      cx25821: request_irq -> devm_request_irq
      ccs-core.c: fix failure to call clk_disable_unprepare
      s5k6a3: add missing clk_disable_unprepare

 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 3 +--
 drivers/media/i2c/ccs/ccs-core.c                  | 7 +++++--
 drivers/media/i2c/s5k6a3.c                        | 4 +++-
 drivers/media/pci/cx25821/cx25821-alsa.c          | 4 ++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c         | 5 ++---
 drivers/media/v4l2-core/v4l2-subdev.c             | 5 ++---
 6 files changed, 15 insertions(+), 13 deletions(-)
