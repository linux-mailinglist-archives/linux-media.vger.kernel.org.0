Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321EF78065B
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 09:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358181AbjHRHaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 03:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346098AbjHRH3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 03:29:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C006330DF
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 00:29:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E24064488
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 07:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80680C433CA
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 07:29:34 +0000 (UTC)
Message-ID: <d5414054-36fc-3ade-5384-6ef9278210aa@xs4all.nl>
Date:   Fri, 18 Aug 2023 09:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT FIXES FOR v6.5] media: vcodec: Fix potential array out-of-bounds
 in encoder queue_setup
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please note that this does not apply to trees, it sits on top of mainline.

In our trees the vcodec/mtk_vcodec_enc.c source moved to vcodec/encoder/mtk_vcodec_enc.c
so this is something to pay attention to when merging the next mainline rc1.

Regards,

	Hans

The following changes since commit 4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6:

  Merge tag 'parisc-for-6.5-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux (2023-08-15 20:28:04 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5q

for you to fetch changes up to be702f08ce683406765d6e28656d697691a74b59:

  media: vcodec: Fix potential array out-of-bounds in encoder queue_setup (2023-08-17 09:19:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Wei Chen (1):
      media: vcodec: Fix potential array out-of-bounds in encoder queue_setup

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)
