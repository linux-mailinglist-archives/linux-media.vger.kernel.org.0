Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAC5680824
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 10:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbjA3JFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 04:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbjA3JFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 04:05:31 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C708429429
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 01:05:27 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 08373100065; Mon, 30 Jan 2023 09:05:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1675069526; bh=K48JG1TZAeB5KQ7LqMlyrhCn8mMcFSCzQvUULEgQwrw=;
        h=Date:From:To:Subject:From;
        b=ZtPw8+DRaV7RqetDAm4Y+ciXI0fUSwRA3/ViZe9ZLG+WRF/Mn53Unau5taobKTpfm
         vrXM7H7RD2NpVZDgo1uaQnqVn0tVtcnr/mR/OPWDa+aMs1GGNJ9Ry0uEoeS0tPt014
         LCDPE5P76lYtwY1v3cz+Us0IT+51qt70NxkJu4zb13FsWzhmZQdvdtcnf58zP8aLTj
         nik+SYuc8vTrMPq3VeqzVjlcMdWd6HOo+mCpk7ihma/JKsPLucO2cHxIj/Q5R14/iS
         FnMLhaIPy+HRKOqhfGEHGziaGM7kyU1Ximn0cSk0qezi0p1ZgXGnWLTWnaXitluToi
         glL7dLBVwRHNg==
Date:   Mon, 30 Jan 2023 09:05:25 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.3] RC fixes
Message-ID: <Y9eIVYq/iUToyts9@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.3b

for you to fetch changes up to f33d83dc0cf3b4ba2923b5e991cca8de4786b9ff:

  media: rc: Fix use-after-free bugs caused by ene_tx_irqsim() (2023-01-25 09:44:11 +0000)

----------------------------------------------------------------
v6.3b

----------------------------------------------------------------
Duoming Zhou (1):
      media: rc: Fix use-after-free bugs caused by ene_tx_irqsim()

Li Jun (1):
      media: rc: gpio-ir-recv: add remove function

 drivers/media/rc/ene_ir.c       |  3 ++-
 drivers/media/rc/gpio-ir-recv.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
