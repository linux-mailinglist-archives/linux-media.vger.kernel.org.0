Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8666DF8F9
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 16:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjDLOv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 10:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjDLOv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 10:51:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0F15272
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 07:51:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45E33635B0
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632AAC433D2
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 14:51:24 +0000 (UTC)
Message-ID: <7094bebe-2d64-7087-3718-80e4e7be04fc@xs4all.nl>
Date:   Wed, 12 Apr 2023 16:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.4] cec: one cec fix, one doc update
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e18a7e9a2d34a32482e4069fcedf30a7bc9e9ef5:

  media: Use designated initializers for all subdev pad ops (2023-04-12 09:46:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4m

for you to fetch changes up to 35fa5d05b410e50b277b3e98fb53143b76a6a256:

  Documentation: admin-guide: cec.rst: document NTP issue (2023-04-12 16:48:54 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      media: cec: core: not all messages were passed on when monitoring
      Documentation: admin-guide: cec.rst: document NTP issue

 Documentation/admin-guide/media/cec.rst | 9 +++++++++
 drivers/media/cec/core/cec-adap.c       | 7 +++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
