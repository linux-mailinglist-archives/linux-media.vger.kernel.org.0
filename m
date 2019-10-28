Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11FACE78D6
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 19:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfJ1S5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 14:57:11 -0400
Received: from mailoutvs31.siol.net ([185.57.226.222]:52401 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727908AbfJ1S5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 14:57:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9B7A4524139;
        Mon, 28 Oct 2019 19:57:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ys6lru5NedNb; Mon, 28 Oct 2019 19:57:08 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 5D14F524159;
        Mon, 28 Oct 2019 19:57:08 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 28E02524139;
        Mon, 28 Oct 2019 19:57:08 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab+samsung@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-mem2mem: Fix hold buf flag check
Date:   Mon, 28 Oct 2019 19:57:00 +0100
Message-Id: <20191028185700.3634267-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
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
 drivers/media/v4l2-core/v4l2-mem2mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
index db07ef3bf3d0..0d2d547a84a5 100644
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
--=20
2.23.0

