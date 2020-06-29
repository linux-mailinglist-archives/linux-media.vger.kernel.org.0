Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF1520DFAC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732482AbgF2Uiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731741AbgF2TOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:14:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA00EC08ED81
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2020 23:58:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0D61C2A13DC
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 0/4] media: staging: rkisp1: document rkisp1-common.h
Date:   Mon, 29 Jun 2020 08:57:50 +0200
Message-Id: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset extends the documentation of rkisp1-common.h. It adds
a line description of every struct and every field, and also
a line description of every lock.
Three minor fixes found during documentation are also in this set.
This patchset solves the TODO item: 'Document rkisp1-common.h'

NOTE: This patchset is rebased on top of v2 of the patchset
"media: staging: rkisp1: move stats reading to irq handler"

https://patchwork.kernel.org/project/linux-media/list/?series=308787

This is because that patchset changes the lock fields in the rkisp1-stats
struct.


Dafna Hirschfeld (4):
  media: staging: rkisp1: remove unused field ctrl_handler from struct
    rkisp1_device
  media: staging: rkisp1: remove unused field alloc_ctx from struct
    rkisp1_device
  media: staging: rkisp1: set pads array of the resizer to size 2
  media: staging: rkisp1: improve documentation of rkisp1-common.h

 drivers/staging/media/rkisp1/TODO             |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h  | 140 ++++++++++++++----
 drivers/staging/media/rkisp1/rkisp1-resizer.c |   2 +-
 3 files changed, 110 insertions(+), 33 deletions(-)

-- 
2.17.1

