Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF64C530A72
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 10:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiEWHlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 03:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbiEWHkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 03:40:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247CB1EAEF
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 00:40:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8AF061206
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 07:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1157C385A9
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 07:40:42 +0000 (UTC)
Message-ID: <2eeaad13-091d-6547-cdeb-0a7a15dc5c3f@xs4all.nl>
Date:   Mon, 23 May 2022 09:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.19] Three media core framework fixes
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

Three core fixes, but the dvb_vb2 fix is by far the most important one.

Regards,

	Hans

The following changes since commit 340ce50f75a6bdfe6d1850ca49ef37a8e2765dd1:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-17 10:11:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.19a

for you to fetch changes up to 192b5dd52c2b5752eb75b0d0033112127cdaa1bb:

  media: dvb_vb2: fix possible out of bound access (2022-05-23 09:33:46 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hangyu Hua (1):
      media: dvb_vb2: fix possible out of bound access

Hans Verkuil (2):
      v4l2-compat-ioctl32.c: zero buffer passed to v4l2_compat_get_array_args()
      v4l2-ioctl.c: fix incorrect error path

 drivers/media/dvb-core/dvb_vb2.c              | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 26 ++++++++++++--------------
 3 files changed, 25 insertions(+), 14 deletions(-)
