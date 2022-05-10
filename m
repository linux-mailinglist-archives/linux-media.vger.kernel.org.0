Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305E4522150
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 18:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347471AbiEJQhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 12:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347458AbiEJQhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 12:37:05 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB2E205448
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 09:33:08 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 296EA101BDF; Tue, 10 May 2022 17:33:06 +0100 (BST)
Date:   Tue, 10 May 2022 17:33:05 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Oliver Neukum <oneukum@suse.com>
Subject: [GIT PULL FOR v5.19] imon fixes
Message-ID: <YnqTwWIzco9V/KyC@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit be938c70e292731f81226917fc214683e66da577:

  media: uvcvideo: Add UVC_GUID_FORMAT_H265 (2022-05-08 07:10:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.19c

for you to fetch changes up to 5414f8c15c4f236726c04d440e1accc87e7d2ed5:

  media: imon: reorganize serialization (2022-05-10 13:58:17 +0100)

----------------------------------------------------------------
v5.19c

----------------------------------------------------------------
Oliver Neukum (3):
      media: imon: avoid needless atomic allocations in resume
      media: imon: fix timer racing disconnect
      media: imon: drop references only after device is no longer used

Tetsuo Handa (1):
      media: imon: reorganize serialization

 drivers/media/rc/imon.c | 109 +++++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 57 deletions(-)
