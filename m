Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340253B3EF4
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhFYIZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 04:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhFYIZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 04:25:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F1DC061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 01:23:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 78F871F40E9F
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 0/2] rkisp1: Two small fixes
Date:   Fri, 25 Jun 2021 11:23:07 +0300
Message-Id: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two small fixes to rkisp1
1. remove useless vaddr field
2. set the dma address of the capture buffers only once in 'buf_init' callabck
instead of each time the buffer is queued

Dafna Hirschfeld (2):
  media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
  media: rkisp1: cap: initialize dma buf address in 'buf_init' cb

 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h   |  6 +-----
 .../media/platform/rockchip/rkisp1/rkisp1-params.c   |  3 +--
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c    |  6 ++----
 4 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.17.1

