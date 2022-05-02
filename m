Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C7F516DAF
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 11:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384326AbiEBJvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 05:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384355AbiEBJvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 05:51:21 -0400
X-Greylist: delayed 506 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 May 2022 02:47:51 PDT
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA373101D
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 02:47:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 78795101CEE; Mon,  2 May 2022 10:47:49 +0100 (BST)
Date:   Mon, 2 May 2022 10:47:49 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] imon fixes
Message-ID: <Ym+oxVsz85E9aDS+@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request has been checked by the modified script that runs in
jenkins. Should be good to go!

Thanks
Sean

The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.19c

for you to fetch changes up to a14da15deb899dc3d51d4b6ee5b970ca9f6c9680:

  media: imon: drop references only after device is no longer used (2022-05-02 10:45:32 +0100)

----------------------------------------------------------------
v5.19c

----------------------------------------------------------------
Oliver Neukum (3):
      media: imon: avoid needless atomic allocations in resume
      media: imon: fix timer racing disconnect
      media: imon: drop references only after device is no longer used

Tetsuo Handa (1):
      media: imon: remove redundant serialization

 drivers/media/rc/imon.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)
