Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22B42AA0A6
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 00:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbgKFXCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 18:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729011AbgKFXCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 18:02:51 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E04C0613CF;
        Fri,  6 Nov 2020 15:02:50 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D1AD01F46BD1
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
Subject: [PATCH] media: staging: rkisp1: cap: fix timeout when stopping the stream
Date:   Fri,  6 Nov 2020 20:02:36 -0300
Message-Id: <20201106230236.1884387-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dma engine should be stopped first.
The driver waits for an interrupt to stop the stream in a known state
after a frame.
If rkisp1_cap_stream_disable() is called after stopping the rest of the
pipeline, then most likely the interrupt won't arrive, we'll get a
timeout and debugfs variables mp_stop_timeout or sp_stop_timeout will
be incremented.

Fixes: 37db540bb9d1f ("media: staging: rkisp1: cap: refactor enable/disable stream to allow multistreaming")
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 6d2fd27970f28..b81235afd0534 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -895,6 +895,8 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 
+	rkisp1_cap_stream_disable(cap);
+
 	/*
 	 * If the other capture is streaming, isp and sensor nodes shouldn't
 	 * be disabled, skip them.
@@ -907,8 +909,6 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 
 	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
 			 false);
-
-	rkisp1_cap_stream_disable(cap);
 }
 
 /*
-- 
2.29.2

