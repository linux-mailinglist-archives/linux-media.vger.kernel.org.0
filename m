Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 695AEF0F97
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 08:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbfKFHD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 02:03:28 -0500
Received: from mailoutvs7.siol.net ([185.57.226.198]:52844 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731206AbfKFHD2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 02:03:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id B373352475C;
        Wed,  6 Nov 2019 08:03:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id X00OQJgGRu0m; Wed,  6 Nov 2019 08:03:25 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 6677B52506A;
        Wed,  6 Nov 2019 08:03:25 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 1B990524D52;
        Wed,  6 Nov 2019 08:03:25 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: v4l2-mem2mem: Fix hold buf flag checks
Date:   Wed,  6 Nov 2019 08:02:53 +0100
Message-Id: <20191106070253.1986421-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hold buf flag is set on output queue, not capture. Fix that.

Fixes: f07602ac3887 ("media: v4l2-mem2mem: add new_frame detection")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
index db07ef3bf3d0..1afd9c6ad908 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -335,7 +335,7 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev =
*m2m_dev,
 		}
 	}
=20
-	if (src && dst && (m2m_ctx->cap_q_ctx.q.subsystem_flags &
+	if (src && dst && (m2m_ctx->out_q_ctx.q.subsystem_flags &
 			   VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
 		m2m_ctx->new_frame =3D !dst->vb2_buf.copied_timestamp ||
 			dst->vb2_buf.timestamp !=3D src->vb2_buf.timestamp;
@@ -474,7 +474,7 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev=
,
 	 * holding capture buffers. Those should use
 	 * v4l2_m2m_buf_done_and_job_finish() instead.
 	 */
-	WARN_ON(m2m_ctx->cap_q_ctx.q.subsystem_flags &
+	WARN_ON(m2m_ctx->out_q_ctx.q.subsystem_flags &
 		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	schedule_next =3D _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
--=20
2.24.0

