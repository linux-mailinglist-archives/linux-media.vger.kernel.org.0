Return-Path: <linux-media+bounces-17367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CD968969
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 504F61C21D85
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E752101B5;
	Mon,  2 Sep 2024 14:05:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FB20FAA7
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285908; cv=none; b=mg/JZmZq6HE612XAjNLjn49AUx8ZHYxlebBrv8zUznZ+hg21OVUKJ1rOcGs3cchqm4M6MrVyKiRnpnjMR9U5cnxXFDNK4R7oDwg/lTYRS1Z8lUs7Vz0Ei6VciCmtb+6m6JNTr544EapZ+LiWDpIXafxmBrv4mQ7EsGU6XKZ3EF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285908; c=relaxed/simple;
	bh=5wKh1hOs7C6BLp8CRY2F3CzElVcxbZgDlmvSQ7kZWT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OxpV6gXXiNHzc10oIvtIiR1+X9kXj6nydp3sfOHoqar0vlINly3Nec8pnCtxqpHVmmzWZaEzml3oavVZNCY/DoTftHp13M5rfV2HZ+nlhfcZS1wHg+hKPYFVhj0WQnT0yi+JVrt7eEYYbeHXl0EgiNQFVyLllg5kur5Iy/2i/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A82AC4CEC4;
	Mon,  2 Sep 2024 14:05:07 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/9] media: vb2: vb2_core_queue_init(): sanity check lock and wait_prepare/finish
Date: Mon,  2 Sep 2024 16:04:54 +0200
Message-Id: <8eb606d30e33ccee7256a329f9d4a31793864e29.1725285495.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two new checks:

1) wait_prepare and wait_finish callbacks are either both present or
   both unset, you can't mix.
2) if lock == NULL, then wait_prepare (and due to check 1 also
   wait_finish) must be present.

These checks should prevent the case where lock == NULL, but there
is no way to release/reacquire whatever lock is used when waiting
for a buffer to arrive in VIDIOC_DQBUF.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29a8d876e6c2..6335ac7b771a 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2644,6 +2644,14 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
 		return -EINVAL;
 
+	/* Either both or none are set */
+	if (WARN_ON(!q->ops->wait_prepare ^ !q->ops->wait_finish))
+		return -EINVAL;
+
+	/* Warn if q->lock is NULL and no custom wait_prepare is provided */
+	if (WARN_ON(!q->lock && !q->ops->wait_prepare))
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
-- 
2.34.1


