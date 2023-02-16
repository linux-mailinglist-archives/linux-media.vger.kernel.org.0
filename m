Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EF869968C
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 15:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBPOBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 09:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjBPOBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 09:01:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E06D43470
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:01:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F29FF6102F
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 14:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215DBC433D2
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 14:01:39 +0000 (UTC)
Message-ID: <fb672e3b-ed17-bcc3-ddd8-b1d851fb5b3d@xs4all.nl>
Date:   Thu, 16 Feb 2023 15:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT FIXES FOR v6.3] media: v4l2-subdev.c: clear stream field
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The recently merged series adding the new 'stream' field caused a regression
in both userspace and kernelspace API where the 'stream' field was passed in
uninitialized, and then failed the 'check_state' check, causing -EINVAL to be
returned.

Since this feature isn't used anywhere yet, add this patch to zero the 'stream'
field to prevent breakage.

This will be properly resolved for 6.4, but for now let's keep existing
applications and drivers running...

Regards,

	Hans

The following changes since commit 05165248df6552daaacf5621e3a5e2369117a8a9:

  media: v4l2-ctrls-api.c: move ctrl->is_new = 1 to the correct line (2023-02-09 09:22:45 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3k

for you to fetch changes up to a990d9e36d35ab6887c6ce2c8e1191ccb1dc7b48:

  media: v4l2-subdev.c: clear stream field (2023-02-16 12:10:16 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: v4l2-subdev.c: clear stream field

 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
