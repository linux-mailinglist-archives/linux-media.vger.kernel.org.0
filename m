Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6A3249523
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 08:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgHSGop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 02:44:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:38765 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgHSGoo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 02:44:44 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E4FC7C6389; Wed, 19 Aug 2020 07:44:42 +0100 (BST)
Date:   Wed, 19 Aug 2020 07:44:42 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.10] RC fixes
Message-ID: <20200819064442.GB25827@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Just the rc changes here, dvb to follow.

Thanks,

Sean

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.10a

for you to fetch changes up to 97d53a7ee542871b650dcc525193c80b0dc10bc6:

  media: mceusb: Avoid GFP_ATOMIC where it is not needed (2020-08-18 17:47:16 +0100)

----------------------------------------------------------------
v5.10a

----------------------------------------------------------------
Christophe JAILLET (1):
      media: mceusb: Avoid GFP_ATOMIC where it is not needed

Sean Young (3):
      media: rc: uevent sysfs file races with rc_unregister_device()
      media: rc: do not access device via sysfs after rc_unregister_device()
      media: gpio-ir-tx: spinlock is not needed to disable interrupts

 drivers/media/rc/gpio-ir-tx.c | 16 +++++-----------
 drivers/media/rc/mceusb.c     |  2 +-
 drivers/media/rc/rc-main.c    | 44 +++++++++++++++++++++++++++----------------
 3 files changed, 34 insertions(+), 28 deletions(-)
