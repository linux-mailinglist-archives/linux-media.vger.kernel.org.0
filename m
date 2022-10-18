Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4716E602EBD
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 16:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiJROrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 10:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiJROr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 10:47:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A0ED77D5
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 07:47:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C6EC7B81F81
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D05C433D6
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 14:47:25 +0000 (UTC)
Message-ID: <0931124f-4f2e-f5aa-0bbc-8a676beddf66@xs4all.nl>
Date:   Tue, 18 Oct 2022 16:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.2] More vivid fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This are just small improvements, getting it into 6.2 is early enough.

Nobody ever tests vivid overlay support, and these are all fixes for that.

Regards,

	Hans

The following changes since commit d67614f276c1499ad939fa5c1aadd35498cc6b34:

  Merge fixes into media_stage (2022-09-27 10:27:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.2c

for you to fetch changes up to b15c9dab3e6eebdbc061a32340b1e4a3e403c6b5:

  vivid.rst: loop_video is set on the capture devnode (2022-10-17 16:32:58 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      vivid: drop GFP_DMA32
      vivid: set num_in/outputs to 0 if not supported
      vivid.rst: loop_video is set on the capture devnode

 Documentation/admin-guide/media/vivid.rst     |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 16 ++++++++++++----
 drivers/media/test-drivers/vivid/vivid-osd.c  |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)
