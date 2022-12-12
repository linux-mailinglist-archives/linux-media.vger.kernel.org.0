Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 878E0649BF8
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 11:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbiLLKVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 05:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiLLKVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 05:21:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0171BCA1
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 02:21:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F7FCB80BFA
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 10:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DF2C433D2
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 10:21:28 +0000 (UTC)
Message-ID: <e561e5a6-e5d4-ec32-688e-74702787d3bb@xs4all.nl>
Date:   Mon, 12 Dec 2022 11:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v6.1] v4l2-ctrls-api.c: add back dropped ctrl->is_new
 = 1
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

The following changes since commit 3178804c64ef7c8c87a53cd5bba0b2942dd64fec:

  Merge tag 'br-v6.2i' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-12-07 17:58:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1a

for you to fetch changes up to c33692033135acc96dfdd00dca6e8a392c545b0a:

  media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1 (2022-12-12 11:20:21 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1

 drivers/media/v4l2-core/v4l2-ctrls-api.c | 1 +
 1 file changed, 1 insertion(+)
