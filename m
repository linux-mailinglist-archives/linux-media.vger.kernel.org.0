Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8622495217
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 17:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347362AbiATQMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 11:12:31 -0500
Received: from gofer.mess.org ([88.97.38.141]:53983 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233045AbiATQMb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 11:12:31 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 61AA3101C5E; Thu, 20 Jan 2022 16:12:30 +0000 (UTC)
Date:   Thu, 20 Jan 2022 16:12:30 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] rc core patches
Message-ID: <YemJ7jU3oKJHvfnV@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

A few small changes, mostly simplifying things.

Sean

The following changes since commit ef483454f92bb2b8fe9ac4ec64cb00de61b87724:

  media: staging: media: zoran: drop read/write support (2022-01-12 07:11:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.18a

for you to fetch changes up to 40edd4dd217a080cb5b7d5af9da04fd773234d10:

  media: mtk-cir: simplify code (2022-01-15 11:45:38 +0000)

----------------------------------------------------------------
v5.18a

----------------------------------------------------------------
Peiwei Hu (1):
      media: ir_toy: free before error exiting

Sean Young (5):
      media: lirc: remove unused lirc features
      media: lirc: simplify gap calculation
      media: mtk-cir: reduce message end to fix nec repeats
      media: mtk-cir: remove superfluous ir_raw_event_reset()
      media: mtk-cir: simplify code

 .../userspace-api/media/rc/lirc-get-features.rst   | 18 ----------
 drivers/media/rc/ir_toy.c                          |  2 +-
 drivers/media/rc/lirc_dev.c                        | 19 ++++-------
 drivers/media/rc/mtk-cir.c                         | 39 +++++++++++-----------
 include/media/rc-core.h                            |  6 +---
 include/uapi/linux/lirc.h                          |  4 ---
 tools/include/uapi/linux/lirc.h                    | 11 +++---
 7 files changed, 33 insertions(+), 66 deletions(-)
