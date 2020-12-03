Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4822CD39B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 11:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388920AbgLCKbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 05:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388903AbgLCKbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 05:31:46 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41843C061A4E
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 02:30:47 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CA6CFC6392; Thu,  3 Dec 2020 10:30:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606991443; bh=FFxTI7e9bNb9rI9/u38ncwXjjZ1eKGDdp/vekDQpE4U=;
        h=Date:From:To:Subject:From;
        b=qTf51f4DBtD2w8qlW1h4kkCJtyDE+n4R2JzbTqOQ6EWONIU+GTye9JvRa1U1DYA25
         dVu/Xv8qbNzXrPNZ/ZLENOPNiicMoljedQFIF9HOSFYDgr0JOuAqpvxrJcZzqkZuMk
         yUZL8AycBPFN4WNKcGcd66MXqBfi5v8vfjhqGwiBbVBIdJBeb5qTdeLr3uA981AGWM
         f1h174M+fXJJXm1SETPbEGIDnkMGjA11lBfqvVOnwPJzg5vadk3VAEKad3CWuZ9Snr
         IEb5cSF3P1BkZ73fqYAy9JkmFBMmfJrzSovct6+gn/GtxtOb+eJhHFz+HcSCrKF0kk
         iFFW8Va55eu6A==
Date:   Thu, 3 Dec 2020 10:30:43 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.11] Add pine64 keymap
Message-ID: <20201203103043.GA13676@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 42ad70c469665387e8f7b53cb6d4581492dff906:

  media: rockchip: rkisp1: remove useless debugfs checks (2020-12-03 08:59:10 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11d

for you to fetch changes up to 173ae11a204d6e2aaccdb82e8de851f1d361a34e:

  media: rc: add keymap for pine64 remote (2020-12-03 10:21:37 +0000)

----------------------------------------------------------------
v5.11d

----------------------------------------------------------------
Jonas Karlman (1):
      media: rc: add keymap for pine64 remote

 Documentation/devicetree/bindings/media/rc.yaml |  1 +
 drivers/media/rc/keymaps/Makefile               |  1 +
 drivers/media/rc/keymaps/rc-pine64.c            | 65 +++++++++++++++++++++++++
 include/media/rc-map.h                          |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-pine64.c
