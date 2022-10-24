Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3326A609E2D
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 11:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJXJme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 05:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJXJmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 05:42:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E96C63F11
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 02:42:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B481B8100E
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 09:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E983C433C1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 09:42:29 +0000 (UTC)
Message-ID: <45f9f51f-f369-e9ff-c8eb-e7bc92879621@xs4all.nl>
Date:   Mon, 24 Oct 2022 11:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.1] vivid: fix control handler mutex deadlock
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

This fixes a regression in 6.1.

	Hans

The following changes since commit d67614f276c1499ad939fa5c1aadd35498cc6b34:

  Merge fixes into media_stage (2022-09-27 10:27:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1s

for you to fetch changes up to e1406584a767c980e70dcf5c71443b561ee9b17c:

  vivid: fix control handler mutex deadlock (2022-10-24 11:40:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      vivid: fix control handler mutex deadlock

 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 8 ++++++++
 1 file changed, 8 insertions(+)
