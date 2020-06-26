Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8E620AE88
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgFZIvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgFZIvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:51:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45D5C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:51:50 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e1b48557745ca459.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2B0012A5988;
        Fri, 26 Jun 2020 09:51:49 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 0/4] media: staging: rkisp1: move stats reading to irq handler
Date:   Fri, 26 Jun 2020 10:51:37 +0200
Message-Id: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently reading the stats is done with workqueue.
We decided to move the reading of the stats to the hard irq handler
since it seems and also tested to be fast enough.

The patchset was tested on a Scarlet device with chromeos
and also with the 'cam' command from libcamera in rockpi4 board.

This fixes the TODO item:
'Use threaded interrupt for rkisp1_stats_isr(), remove work queue.'

Patchset Summary:
1. Replace a long bitwise-or of the statistics flags with a macro to improve readability
2. In the 'stop_streaming' callback, replace the usage of 'spin_lock_irqsave' with 'spin_lock_irq'
3. Replace two locks in the rkisp1_stats object with one lock that
protects the 'is_streaming' variable and the 'stat' list of buffers.
4. Move the reading of the stats to the hard irq handler.

Changes since v1:
- patch 1 from v1 "return IRQ_NONE in isr when irq isn't for ISP"
is not needed anymore for this version, it can be sent as a separate patch.
- patch 3 from v1 "stats: use spin_lock_irqsave for irq_lock" is not needed,
since it is enough to use 'spin_lock' in a isr. Instead, patch 2 in this version
is added that replaces 'spin_lock_irqsave' with 'spin_lock_irq' in user context callback.
- the last patch in this version moves the stats reading to the hard irq while
in v1 it was move to threaded irq.
- removing the item 'Use threaded interrupt for rkisp1_stats_isr(), remove work queue.'
from the TODO file.

Dafna Hirschfeld (4):
  media: staging: rkisp1: use a macro for the statistics flags mask
  media: staging: rkisp1: stats: replace spin_lock_irqsave with
    spin_lock_irq
  media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with
    one lock
  media: staging: rkisp1: stats: read the stats in the isr

 drivers/staging/media/rkisp1/TODO            |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h |  12 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c    |   5 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 117 +++----------------
 4 files changed, 23 insertions(+), 112 deletions(-)

-- 
2.17.1

