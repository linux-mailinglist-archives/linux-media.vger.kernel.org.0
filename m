Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD68756C85F
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 11:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGIJam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 05:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiGIJak (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 05:30:40 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA53491C1
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 02:30:38 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8A65A10029D; Sat,  9 Jul 2022 10:30:36 +0100 (BST)
Date:   Sat, 9 Jul 2022 10:30:36 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Minor rc fixes
Message-ID: <YslKvAd410HLKaGx@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c0ab2901fc68a274b4e5e6436892806e6785babe:

  media: venus: hfi_platform: Correct supported codecs for sc7280 (2022-07-07 09:21:08 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.20b

for you to fetch changes up to 5c5e76a18b65768ec7802f6f9b816ca631209230:

  media: lirc: ensure lirc device receives repeats (2022-07-09 10:25:34 +0100)

----------------------------------------------------------------
v5.20b

----------------------------------------------------------------
Marko Mäkelä (1):
      media: lirc: ensure lirc device receives repeats

Oliver Neukum (1):
      media: ati-remote: remove private err() macro

Yang Yingliang (1):
      media: igorplugusb: use correct size pass to igorplugusb_probe()

 drivers/media/rc/ati_remote.c  | 11 +++++------
 drivers/media/rc/igorplugusb.c |  4 ++--
 drivers/media/rc/rc-main.c     |  3 ++-
 3 files changed, 9 insertions(+), 9 deletions(-)
