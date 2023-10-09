Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40937BD489
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 09:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345443AbjJIHmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 03:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345440AbjJIHmD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 03:42:03 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4C1A2
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 00:42:01 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 92A8310005E; Mon,  9 Oct 2023 08:41:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1696837319; bh=H27we/jvdIYue3ANN7SRNIO9NdbyMfmWdzNxlE4n+wY=;
        h=Date:From:To:Subject:From;
        b=LuuhlaRhxJSgkrHnQpFZlt9BZQsi6m9+mZNdvDNFJXo+EtMOEM7U4rVd1ylO3udh6
         0lzyWsu851D7WvzjixWS8U5Pw1cigOxVNPpMF6r42TlkfXmM8RLJgbhkWJG/Bojidw
         bRnTjakoh5AlwthTZ+RF2XLjTBABu+5epAQM7U6a/ooXLQpUiuSoez1hEFm/l640or
         sPZ8W685KIuAaaYoZlXq+e6WGxr71Am2TEOZtc30NhA0XBYG1g5k6s1aueSOqxbqCC
         /7IjZio83PgbTRzU3rrUPoDxl3jlozgm42L+Thc8Ivw+ynd00TfPmWZI6m6wp4u5e6
         4866QJ8OeSXkA==
Date:   Mon, 9 Oct 2023 08:41:59 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.7] Minor rc fixes
Message-ID: <ZSOux5a0d0tu9FtE@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 73835b514160dc548f7d77c6cd7fe6a8629d3406:

  media: imon: fix access to invalid resource for the second interface (2023-10-07 10:55:48 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.7c

for you to fetch changes up to faf2b9954d9c9fdbac48e4b1d45d5ba2d3f10e52:

  media: lirc: drop trailing space from scancode transmit (2023-10-09 08:22:14 +0100)

----------------------------------------------------------------
v6.7c

----------------------------------------------------------------
Sean Young (2):
      media: sharp: fix sharp encoding
      media: lirc: drop trailing space from scancode transmit

 drivers/media/rc/ir-sharp-decoder.c | 8 +++++---
 drivers/media/rc/lirc_dev.c         | 6 +++++-
 2 files changed, 10 insertions(+), 4 deletions(-)
