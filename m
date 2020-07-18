Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B360224C1C
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 16:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgGRO71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 10:59:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgGRO71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 10:59:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 805CB2A2789
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 0/9] media: staging: rkisp1: document rkisp1-common.h
Date:   Sat, 18 Jul 2020 16:59:09 +0200
Message-Id: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset extends the documentation of rkisp1-common.h. It adds
a line description of every struct and every field, a line description
of every lock and short description of the functions, enums and macros.

Patches 1-8 are cleanups and minor fixes found during documentation.
This patchset solves the TODO item: 'Document rkisp1-common.h'

NOTE: This patchset is rebased on top of v2 of the patchset
"media: staging: rkisp1: move stats reading to irq handler"

https://patchwork.kernel.org/project/linux-media/list/?series=308787

This is because that patchset changes the lock fields in the rkisp1-stats
struct.

Changes since v2:
- 4 added cleanup patches - patches 4-8
- fixes due to comments
- added documentation to the debugfs parameters, the functions, the enum and the macros.


Dafna Hirschfeld (9):
  media: staging: rkisp1: remove unused field ctrl_handler from struct
    rkisp1_device
  media: staging: rkisp1: remove unused field alloc_ctx from struct
    rkisp1_device
  media: staging: rkisp1: set pads array of the resizer to size 2
  media: staging: rkisp1: don't define vaddr field in rkisp1_buffer as
    an array
  media: staging: rkisp1: add a pointer to rkisp1_device from struct
    rkisp1_isp
  media: staging: rkisp1: unify (un)register functions to have the same
    parameters
  media: staging: rkisp1: remove declaration of unimplemented function
    'rkisp1_params_isr_handler'
  media: staging: rkisp1: group declaration of similar functions
    together
  media: staging: rkisp1: improve documentation of rkisp1-common.h

 drivers/staging/media/rkisp1/TODO             |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h  | 272 +++++++++++++-----
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  15 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     |  17 +-
 drivers/staging/media/rkisp1/rkisp1-params.c  |  14 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c |   2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c   |  14 +-
 7 files changed, 235 insertions(+), 100 deletions(-)

-- 
2.17.1

