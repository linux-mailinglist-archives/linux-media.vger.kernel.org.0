Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BB149ADCF
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 09:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377475AbiAYIGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 03:06:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378396AbiAYICz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 03:02:55 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 174FF1F43DC8;
        Tue, 25 Jan 2022 08:02:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643097770;
        bh=wGCe52XawNVe4MubA5jJwdVFk61Wf8VXEXhFjZFenZw=;
        h=From:To:Cc:Subject:Date:From;
        b=RClvh8HLStSSIBIcEmHatIM1LyIr+8QvsA9sVIqNJec1y4Ir9xmxFqdk3xC13s63b
         dh5Hwgs7+u/gmzCrG0709RFMFAJAtdxLTJ2JrrVKDSKL82O5iV7RlDhWs/ZHZEn/6x
         mxtHSpskvIDiYQMOoO1REQbT1r6QU9GB3GGKWOJxaaxXDapkoTICE5/gLaaFnhC4Lq
         oSIirL614pigO1lpJVdg9c4B3SIwM+o9foDp8JcGN1ncFcIUw6KpOVwXJOLIJQEHuq
         NKc++MURK8KzJ9L6YKMst+psYK032F6CrNQkDfxuMr/HG80LnWpXytgbVl2RumAYPv
         xWZpVGCseeLHA==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: [PATCH v2 0/4] stk1160: allocate urb buffs with the DMA noncontiguous API
Date:   Tue, 25 Jan 2022 10:02:09 +0200
Message-Id: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set replaces urb buffers allocation to use the DMA
noncontiguous API. Similarly to a commit sent to uvc: [1]
This improves performance on ARM while not damaging performance
on other platforms. The cpu performance on ARM
improves because the new API does not cause the cache disable on ARM
while the coherent API do.
Measurements are shown in patch 4/4

[1] https://lkml.org/lkml/2021/3/12/1506

Patches Summary:
* patches 1+2 are bug fixes.
* patch 3 changes the way data is stored. This is a preparation
to patch 4.
* patch 4 is the change of API to use the noncontiguougs.

Changes since v1:
1. reduce line length to be not too longer than 80 char
2. reformulate commit log of patch 4/4 and add measurements results
3. in patch 4, invalidate the vmap range before the direct mapping range.
4. test regressions for patches 1-3 (not including patch 4) and improve vars names
5. patch 2 is a new bug fix I found
6. patch 1 is extended to fix two cases of not allocating all intended urb buffers.

Dafna Hirschfeld (4):
  media: stk1160: fix number of buffers in case not all buffers are
    created
  media: stk1160: If start stream fails, return buffers with
    VB2_BUF_STATE_QUEUED
  media: stk1160: move transfer_buffer and urb to same struct
    'stk1160_urb'
  media: stk1160: use dma_alloc_noncontiguous API

 drivers/media/usb/stk1160/stk1160-core.c  |   2 +-
 drivers/media/usb/stk1160/stk1160-v4l.c   |  16 ++-
 drivers/media/usb/stk1160/stk1160-video.c | 142 ++++++++++++----------
 drivers/media/usb/stk1160/stk1160.h       |  23 +++-
 4 files changed, 104 insertions(+), 79 deletions(-)

-- 
2.17.1

