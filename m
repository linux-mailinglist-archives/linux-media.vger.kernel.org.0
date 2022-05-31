Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79922538CDB
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 10:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244842AbiEaI0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 04:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234747AbiEaI0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 04:26:11 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9575997295
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 01:26:09 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 55954101D12; Tue, 31 May 2022 09:26:07 +0100 (BST)
Date:   Tue, 31 May 2022 09:26:07 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] rc fixes
Message-ID: <YpXRHxft+PhLR29h@gofer.mess.org>
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

The following changes since commit 340ce50f75a6bdfe6d1850ca49ef37a8e2765dd1:

  media: hantro: Enable HOLD_CAPTURE_BUF for H.264 (2022-05-17 10:11:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.20a

for you to fetch changes up to 6f64f2b6e4f9d86f567395b1714f5c4de59edf91:

  media: rc: Directly use ida_free() (2022-05-30 16:35:19 +0100)

----------------------------------------------------------------
v5.20a

----------------------------------------------------------------
Oliver Neukum (11):
      igorplugusb: respect DMA coherency
      igorplugusb: prevent use after free in probe error
      igorplugusb: break cyclical race on disconnect
      igorplugusb: remove superfluous usb_unlink_urb()
      iguanair: no superfluous usb_unlink_urb()
      imon_raw: respect DMA coherency
      redrat3: no unnecessary GFP_ATOMIC
      streamzap: avoid unnecessary GFP_ATOMIC
      xbox_remote: xbox_remote_initialize() cannot fail
      ttusbir: NOIO during resume
      ttusbir: avoid unnecessary usb_unlink_urb()

keliu (1):
      media: rc: Directly use ida_free()

 drivers/media/rc/igorplugusb.c | 19 +++++++++++++------
 drivers/media/rc/iguanair.c    |  5 +----
 drivers/media/rc/imon_raw.c    | 16 ++++++++++++----
 drivers/media/rc/lirc_dev.c    |  6 +++---
 drivers/media/rc/rc-main.c     |  6 +++---
 drivers/media/rc/redrat3.c     |  4 ++--
 drivers/media/rc/streamzap.c   |  2 +-
 drivers/media/rc/ttusbir.c     |  4 +---
 drivers/media/rc/xbox_remote.c | 10 +++-------
 9 files changed, 39 insertions(+), 33 deletions(-)
