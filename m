Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D8C27AFA0
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1OEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 10:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1OEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 10:04:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A188C061755;
        Mon, 28 Sep 2020 07:04:09 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5E07E2949CA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done
Date:   Mon, 28 Sep 2020 11:03:34 -0300
Message-Id: <20200928140334.19070-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814071202.25067-9-xia.jiang@mediatek.com>
References: <20200814071202.25067-9-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A seemingly bad rebase introduced a spurious v4l2_m2m_buf_done,
which releases a buffer twice and therefore triggers a
noisy warning on each job:

WARNING: CPU: 0 PID: 0 at drivers/media/common/videobuf2/videobuf2-core.c:986 vb2_buffer_done+0x208/0x2a0

Fix it by removing the spurious v4l2_m2m_buf_done.

Reported-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Fixes: 911ea8ec42dea ("media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index f626ba5ee3d9..b221b4e438a1 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -516,7 +516,6 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 
 	if (WARN_ON(!src_buf || !dst_buf))
 		goto unlock;
-	v4l2_m2m_buf_done(src_buf, state);
 	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	if (!dst_buf->is_held) {
 		v4l2_m2m_dst_buf_remove(m2m_ctx);
-- 
2.27.0

