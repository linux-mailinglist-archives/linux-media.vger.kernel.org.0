Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11982CA301
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbgLAMpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:33 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33091 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726908AbgLAMpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Wk2RYH; Tue, 01 Dec 2020 13:44:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826691; bh=I6nlLMkqsPAumJd3p0jB3ACQybnxN4viHsxwYMpd1gw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=g3PZlU2nL3z6U9eOW3PQJomnbwNWU6RLtMse4QwNGZL/h08x0IuQxU8gPjBe/WWmN
         gUuWnv4MpTsMpVPc3FEzBGkB4PhWsWQdZZpvzuD8yT6s+mBOc91JnJlGFmBLSHX5cY
         KVY1aKjfirc3eljKlD9KAeAB/NZE66dnEJQWIgQ/g+nTQonpCODpdTyfyN43zvOq5U
         Hl+T6kGChid7G4ClkqThsXPJ/e/pjaaee57mdWgAG/DC8ZBGztBRox3ILdGWx5OHO4
         LCLngEslyVNFRv9FyUXheq75tdu9HE6YhIejwPl1oPUq5ZROUNbpg0wSC5KZfbkCJr
         w3mcNbqGM/klQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv3 2/7] media: videobuf2: always call poll_wait() on queues
Date:   Tue,  1 Dec 2020 13:44:41 +0100
Message-Id: <20201201124446.448595-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEbbHtBtxZMg25ky9HguRnroC3luigL0X3xjmVl4YcEzAC4cF8zkGuoLHem70fyJetudArdmqSFaOjSG3F1c3boTMJIp10+2Z3Tv1K3d+QorJtFvji5A
 3rvHhZZTNh/UBzA0H62Vwq3RpvnXjrmfRFH6izGW5hR6qwAzJVmeDdkaMDdBDRrKH730cfzU7uh5GTd05hyx4yUwSZzQKnNw7SMBcI9a1bvAAMfoiL3OgdVy
 KOEVOj1M54FOx7LzFy3nZlkf9z1CftOh0jhDkTcDBu/jME171E/b8ZAOGza0/MVu
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <gnurou@gmail.com>

do_poll()/do_select() seem to set the _qproc member of poll_table to
NULL the first time they are called on a given table, making subsequent
calls of poll_wait() on that table no-ops. This is a problem for vb2
which calls poll_wait() on the V4L2 queues' waitqueues only when a
queue-related event is requested, which may not necessarily be the case
during the first poll.

Fix this by making the call to poll_wait() happen first thing and
unconditionally in vb2_core_poll().

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4eab6d81cce1..ef06f90f5c6b 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2363,13 +2363,20 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
 	struct vb2_buffer *vb = NULL;
 	unsigned long flags;
 
+	/*
+	 * poll_wait() MUST be called on the first invocation on all the
+	 * potential queues of interest, even if we are not interested in their
+	 * events during this first call. Failure to do so will result in
+	 * queue's events to be ignored because the poll_table won't be capable
+	 * of adding new wait queues thereafter.
+	 */
+	poll_wait(file, &q->done_wq, wait);
+
 	if (!q->is_output && !(req_events & (EPOLLIN | EPOLLRDNORM)))
 		return 0;
 	if (q->is_output && !(req_events & (EPOLLOUT | EPOLLWRNORM)))
 		return 0;
 
-	poll_wait(file, &q->done_wq, wait);
-
 	/*
 	 * Start file I/O emulator only if streaming API has not been used yet.
 	 */
-- 
2.29.2

