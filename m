Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A59780A3F
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 12:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359723AbjHRKep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 06:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376400AbjHRKeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 06:34:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C230649D9
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 03:32:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 478A861BAF
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 10:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709FCC433C8
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 10:32:32 +0000 (UTC)
Message-ID: <5b8be6e8-e6e9-c3a2-b972-190ddc11ec0d@xs4all.nl>
Date:   Fri, 18 Aug 2023 12:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.6] vb2: frame_vector.c: replace WARN_ONCE with a
 comment
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

See https://patchwork.linuxtv.org/project/linux-media/patch/d5e1ee76-75b3-26cb-23ae-cf6ab40597b7@xs4all.nl/
with Linus' comment.

This should go to 6.6.

Getting rid of this WARN will also help improve our regression tests: the
test-media script can now check for kernel oopses etc. and report that.

Currently the dmesg output is saved, but it isn't checked.

Regards,

	Hans

The following changes since commit 111073c8b6146b745bd52316ddfa0651bf8fcedb:

  media: pci: ivsc: Select build dependencies (2023-08-18 12:28:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.6o

for you to fetch changes up to 5f63d1de4622a83567a190e93a841f6c1e424f40:

  media: vb2: frame_vector.c: replace WARN_ONCE with a comment (2023-08-18 12:29:21 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: vb2: frame_vector.c: replace WARN_ONCE with a comment

 drivers/media/common/videobuf2/frame_vector.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
