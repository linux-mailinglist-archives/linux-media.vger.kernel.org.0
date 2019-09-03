Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C04EA703E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 18:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbfICQ0S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 12:26:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:47034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730581AbfICQ0R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 12:26:17 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E52FF238CD;
        Tue,  3 Sep 2019 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567527976;
        bh=Eij9Lcp61mwnXfyqWxsgTftupagr0ZRNvm2GXlKk+Yk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kSORdLEWlYxc6tUgSCDL+dctOdCbB9UPccj+lR5yBak8vwmJ00tGJxAR2mI7JRFWC
         Ny4hl++ElgImJo+2agxpM86DJoIFc8v74AEnvUvECNqUWlCf0TdLLnIjAeWLFx/Jjn
         UV7k8hSiT3PXdYY6NQxqDFIQ0PgGBRTCZCmp79JE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+69780d144754b8071f4b@syzkaller.appspotmail.com,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 032/167] media: vim2m: use cancel_delayed_work_sync instead of flush_schedule_work
Date:   Tue,  3 Sep 2019 12:23:04 -0400
Message-Id: <20190903162519.7136-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 52117be68b82ee05c96da0a7beec319906ccf6cc ]

The use of flush_schedule_work() made no sense and caused a syzkaller error.
Replace with the correct cancel_delayed_work_sync().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+69780d144754b8071f4b@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>      # for v4.20 and up
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/vim2m.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2m.c
index 6f87ef025ff19..de7f9fe7e7cd9 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -797,10 +797,11 @@ static int vim2m_start_streaming(struct vb2_queue *q, unsigned count)
 static void vim2m_stop_streaming(struct vb2_queue *q)
 {
 	struct vim2m_ctx *ctx = vb2_get_drv_priv(q);
+	struct vim2m_dev *dev = ctx->dev;
 	struct vb2_v4l2_buffer *vbuf;
 	unsigned long flags;
 
-	flush_scheduled_work();
+	cancel_delayed_work_sync(&dev->work_run);
 	for (;;) {
 		if (V4L2_TYPE_IS_OUTPUT(q->type))
 			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-- 
2.20.1

