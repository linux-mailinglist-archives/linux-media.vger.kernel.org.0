Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9089D48A7FF
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 07:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348351AbiAKG4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 01:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348344AbiAKG4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 01:56:07 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11837C06173F
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 22:56:07 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:14a3:8100:8072:ec19:b639:c4ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 726831F44097;
        Tue, 11 Jan 2022 06:56:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641884165;
        bh=BEl2+7UR19mIYsbWCbniVcAcjuz3OGpAlx/eYVrGkos=;
        h=From:To:Cc:Subject:Date:From;
        b=k9l5bM7x2obw33b59BJNYzInVWE5SObIUifUxOcOFXeOMbiQYWaNSjOw44dpwLuLM
         avXBZ9wGFn9MjXvlDg9+qOkiOlLMtlErjwR/ZNdt2Sm/uQaq4zK8AaRvnCro4OwUy9
         FHJsmDTPFdgmjxWHctciL7VvNpYYv538Mr54kzkQC+FfVUrCU0AGU0quXrnhdHqa/z
         DWe0S+7EJEKN4Hui9IacFqVHSujtgmPFYzTusOnIb0zlHuuURKgMcbuVo+hFIiyhki
         Ni5f5UzPUbOrLGa3a/MQRqABveF0qWJuHf1p2HJpHi/Z5Z6O03YcWJiSWTV0WZ5uFr
         ml9K0Bj2C0+TQ==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 0/3] media: stk1160: allocate urb buffs with the DMA noncontiguous API
Date:   Tue, 11 Jan 2022 08:55:02 +0200
Message-Id: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace urb buffers allocation to use the DMA
noncontiguous API. Similarly to a commit sent to uvc: [1]
This improves performance on Arm.

The series was tested on rock-pi4 (Arm64) and shows about 10x
improvements:

NON_CONTIGUOUS
uS/qty: 9231963/106048 sec: 9231.963472 avg: 87.054 min: 0.291 max: 216.423 (uS)
raw decode speed: 9.217 Gbits/s
bytes 9.971904900 G
bytes/urb: 100290

COHERENT
uS/qty: 92423219/98904 sec: 92423.219509 avg: 934.474 min: 0.583 max: 2196.583 (uS)
raw decode speed: 787.698 Mbits/s
bytes 8.510250828 G
bytes/urb: 92010

On x86 there is no significant difference:

NON_CONTIGUOUS
uS/qty: 3203891/50096 sec: 3203.891724 avg: 63.955 min: 0.141 max: 11696.636 (uS)
raw decode speed: 23.783 Gbits/s
bytes 8.932543668 G
bytes/urb: 190084

COHERENT
uS/qty: 3081680/50112 sec: 3081.680438 avg: 61.495 min: 0.160 max: 482.099 (uS)
raw decode speed: 21.557 Gbits/s
bytes 7.786260844 G
bytes/urb: 165677

[1] https://lkml.org/lkml/2021/3/12/1506


Dafna Hirschfeld (3):
  media: stk1160: fix number of buffers in case not all buffers are
    created
  media: stk1160: move transfer_buffer and urb to same struct
    'stk1160_urb'
  media: stk1160: use dma_alloc_noncontiguous API

 drivers/media/usb/stk1160/stk1160-v4l.c   |   5 +-
 drivers/media/usb/stk1160/stk1160-video.c | 137 +++++++++++-----------
 drivers/media/usb/stk1160/stk1160.h       |  21 +++-
 3 files changed, 91 insertions(+), 72 deletions(-)

-- 
2.17.1

