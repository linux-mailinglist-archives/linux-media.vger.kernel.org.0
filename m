Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A9462E23C
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 17:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbiKQQsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 11:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbiKQQsU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 11:48:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DC556D66
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 08:48:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64593621A3
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 16:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89323C433D6
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 16:48:13 +0000 (UTC)
Message-ID: <aae34a55-49ec-4631-0f4e-26e79f676f69@xs4all.nl>
Date:   Thu, 17 Nov 2022 17:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.1] v4l2-dv-timings.c: fix too strict blanking
 sanity checks
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

The previous change adding sanity checks was a bit too strict.

Regards,

	Hans

The following changes since commit a7bab6f8b73fe15a6181673149734a2756845dae:

  Merge tag 'br-v6.2e' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-11-15 11:55:54 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1t

for you to fetch changes up to b7896cce96ca8d6d16871037143cb6719797e6b2:

  media: v4l2-dv-timings.c: fix too strict blanking sanity checks (2022-11-17 17:46:33 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: v4l2-dv-timings.c: fix too strict blanking sanity checks

 drivers/media/v4l2-core/v4l2-dv-timings.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
