Return-Path: <linux-media+bounces-12475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A577A8D85FB
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 17:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440FC1F22B69
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFEE130A46;
	Mon,  3 Jun 2024 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H61bxHfG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7612CDBA
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717428373; cv=none; b=mHpZZ//qaYSiAZkTUMUl+UCynn6uAbkEg9sw+zmAdmoE0BI51LwZQPJgSLB8v0vu14meeVcqUKOic0i6SrcLLuTTZtLg2Zu4FrlgPhG7cigS1p1AkwThWkBi70QGPkBVBK7k+5OmK/cy6igss0sz6zaECeShTK7kzTREmRZo9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717428373; c=relaxed/simple;
	bh=tiJLXtDkSIMar4/Di3c82hBxDKnQveLEddpdC0yDe40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ln6NhVGZk1CxguTc9hGvSwp3k5YEeJhKi+M1mA2Eupdvqu+tj8LrRuibmNwYZsHCnAQNCvVk4nh8aVjAGT0os2CfRRSUKkK5cDNxwHeUIMa/zQMfofXnKlqtlLVLm0anT6aOx6dZFWlgzAZtgn1v02s3fBLFfmig8Wsd07DQuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H61bxHfG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC454908;
	Mon,  3 Jun 2024 17:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717428357;
	bh=tiJLXtDkSIMar4/Di3c82hBxDKnQveLEddpdC0yDe40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H61bxHfG0zO7sn9unKgA7ngkzaOzhTUCZwUyBJBctFqMrwZaMhdfftHs95BtJhuSO
	 F1vPW2NpOgS0XZrzByVAd3YkyNDXQkMkbkRI/okHDRgJeLjmCMSL2idQd7Ph6NvTic
	 lqmQW+2sZFJC6+VR3Ilg8xFxJYdCt3/mtHevMHqk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [RFC 1/3] media: videobuf2: WARN if !vb2_queue.buf_ops
Date: Mon,  3 Jun 2024 17:25:45 +0200
Message-ID: <20240603152548.107158-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The videobuf2 framework unconditionally set 'struct vb2_queue.buf_ops'
to 'v4l2_buf_ops' in vb2_queue_init_name() and does not allow drivers to
overwrite it.

The framework then assumes all 'buf_ops' operations to be present and
valid.

To prepare for allowing drivers to override the 'buf_ops' members
implementation but still guarantee all members are correctly populated
and valid, WARN() if any of the 'buf_ops' operations is not available in
the function call wrappers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b6bf8f232f48..8ceae97a0f08 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -187,15 +187,19 @@ module_param(debug, int, 0644);
 #define call_bufop(q, op, args...)					\
 ({									\
 	int ret = 0;							\
-	if (q && q->buf_ops && q->buf_ops->op)				\
-		ret = q->buf_ops->op(args);				\
+	if (q) {							\
+		if (!WARN_ON(!q->buf_ops) && !WARN_ON(!q->buf_ops->op))	\
+			ret = q->buf_ops->op(args);			\
+	}								\
 	ret;								\
 })
 
 #define call_void_bufop(q, op, args...)					\
 ({									\
-	if (q && q->buf_ops && q->buf_ops->op)				\
-		q->buf_ops->op(args);					\
+	if (q) {							\
+		if (!WARN_ON(!q->buf_ops) && !WARN_ON(!q->buf_ops->op))	\
+			q->buf_ops->op(args);				\
+	}								\
 })
 
 static void __vb2_queue_cancel(struct vb2_queue *q);
-- 
2.45.1


