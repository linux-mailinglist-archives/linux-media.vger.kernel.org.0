Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684311CF3FA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 14:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgELMGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 08:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgELMGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 08:06:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D83C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 05:06:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 90AA62A20B0
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/5] media: staging: rkisp1: change workqueue to threaded irq in stats
Date:   Tue, 12 May 2020 14:05:17 +0200
Message-Id: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reading the statistics registers might take too long
to run inside the irq handler. Currently it is deferred
to bottom half using workqueues. This patch replaces the
workqueue with threaded interrupts.
This fixes an item in the TODO file to move the driver from staging.

Patches Summary:
1. Since the irq is shared, the isr should return either IRQ_NONE or IRQ_HANDELD.
This patch fixes it. In later patch, IRQ_WAKE_THREAD will be added.
2. Replace a long bitwise-or of the statistics flags with a macro to improve readability
3. Fixes a bug of using spin_lock instead of spin_lock_irqsave inside an irq handler
3. Replace two locks in the rkisp1_stats object with one lock that
protects the 'is_streaming' variable and the 'stat' list of buffers.
4. Replaces the workqueue with threaded irq in the statistics.

The code is tested using the 'cam' command from libcamera:

cam -c 1 -C  -s width=1280,height=960 --file="/tmp/libcamframe#.data"

Dafna Hirschfeld (4):
  media: staging: rkisp1: use a macro for the statistics flags mask
  media: staging: rkisp1: stats: use spin_lock_irqsave for irq_lock
  media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with
    one lock
  media: staging: rkisp1: replace workqueue with threaded irq for
    reading statistics registers

Helen Koike (1):
  media: staging: rkisp1: return IRQ_NONE in isr when irq isn't for ISP

 drivers/staging/media/rkisp1/TODO             |   1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c |   7 +-
 drivers/staging/media/rkisp1/rkisp1-common.h  |  20 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  22 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     |  20 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c   | 197 +++++++-----------
 6 files changed, 121 insertions(+), 146 deletions(-)

-- 
2.17.1

