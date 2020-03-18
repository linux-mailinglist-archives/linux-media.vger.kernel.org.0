Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D56189CC3
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgCRNVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:21:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44456 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRNVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:21:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8D2D229661B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 1/8] v4l2-mem2mem: return CAPTURE buffer first
Date:   Wed, 18 Mar 2020 10:21:01 -0300
Message-Id: <20200318132108.21873-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200318132108.21873-1-ezequiel@collabora.com>
References: <20200318132108.21873-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the request API is used, typically an OUTPUT (src) buffer
will be part of a request. A userspace process will be typically
blocked, waiting on the request file descriptor.

Returning the OUTPUT (src) buffer will wake-up such processes,
who will immediately attempt to dequeue the CAPTURE buffer,
only to find it's still unavailable.

Therefore, change v4l2_m2m_buf_done_and_job_finish returning
the CAPTURE (dst) buffer first, to avoid signalling the request
file descriptor prematurely, i.e. before the CAPTURE buffer is done.

When the request API is not used, this change should have
no impact.

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 8986c31176e9..62ac9424c92a 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -504,12 +504,21 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 
 	if (WARN_ON(!src_buf || !dst_buf))
 		goto unlock;
-	v4l2_m2m_buf_done(src_buf, state);
 	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	if (!dst_buf->is_held) {
 		v4l2_m2m_dst_buf_remove(m2m_ctx);
 		v4l2_m2m_buf_done(dst_buf, state);
 	}
+	/*
+	 * If the request API is being used, returning the OUTPUT
+	 * (src) buffer will wake-up any process waiting on the
+	 * request file descriptor.
+	 *
+	 * Therefore, return the CAPTURE (dst) buffer first,
+	 * to avoid signalling the request file descriptor
+	 * before the CAPTURE buffer is done.
+	 */
+	v4l2_m2m_buf_done(src_buf, state);
 	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 unlock:
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-- 
2.25.0

