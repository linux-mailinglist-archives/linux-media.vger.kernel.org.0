Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A08E2C0EA6
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389464AbgKWPS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732106AbgKWPS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:18:57 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AE0C0613CF;
        Mon, 23 Nov 2020 07:18:57 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so14526495pgp.10;
        Mon, 23 Nov 2020 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKZ15Y3xVaD50KBZI29ssKek6rm6AaEMOW4fonEildg=;
        b=iMvvtWxaEIzSODHuLpeT8FgVxzNK8+voY3ljag3dUxudwc21JlDXi9muCiyDhSFc/6
         S194IH/6zy+wD6KJUTXbYQ/Dhb7nlj8K7sfd09zpZn+nWrd9ASydOSifuOuWyXdrCBGO
         lHUiZIl0wrlRVvJ7VDzgBwTGk3QEn9HFnT9UVUo7gRuuDGmSM/ihG5Sjrz331UaZ4pbr
         pMwxsmJNCF1DEN+YLFjr3jicktNODpOB/dLCvF8qvv9DbCg2BjrWBnrF6gH9xgDkTD9d
         1WrGJN1en17s4PGp/wozMlXDRCbodx/jbmgtbBsZv04Hlp81DqKG2yN1RdU0Laay8U/x
         Vmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKZ15Y3xVaD50KBZI29ssKek6rm6AaEMOW4fonEildg=;
        b=SZthxiL4TYMX1mxsCVl0Ub6giq12jpIJilz73zpUvqW2u8C5rljNJryNCT1xA+yDVK
         uMDqXJ5QQdguMVlAqJxuUZgpgHSQDZM1dtIQnxktsMlblVz+jQqaR+9pUHdpf1sfyqm0
         ryvtCjYR6c1uGeTSbHSMK6x0ptaBdlv1BOozt5CWAycttJdLMuXJHo1a3UosHckQoOsE
         OM8dCRN5+TzXBNzB4FWiDY8plk220xEFLHZcYLGhLcJlzNM70mCbxbkoh2D1THVCy97W
         XoAHaDf1u45+Z1Uab19JqH+/DnWdkNcYUD6o/S1+h2y9/R8T9FHv06wOrSK1GB3Urc/X
         pXiQ==
X-Gm-Message-State: AOAM532INR7EhcQP0oMFuKIBiux9kIXLvERrPTMD9NswpRbRgrWfH6TZ
        Xh/lVTgJBBPESYcnibYPTbA=
X-Google-Smtp-Source: ABdhPJyWPjkVCCjdWGm2G9lzmVh8rTbp14egl5VE9Nv+VplpSJoLseRrxcR+fzsrBE65pkXmjQdPdw==
X-Received: by 2002:a63:b05:: with SMTP id 5mr27574091pgl.267.1606144736860;
        Mon, 23 Nov 2020 07:18:56 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id r130sm5038399pfc.41.2020.11.23.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:18:55 -0800 (PST)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 1/2] media: videobuf2: always call poll_wait() on queues
Date:   Tue, 24 Nov 2020 00:18:42 +0900
Message-Id: <20201123151843.798205-2-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123151843.798205-1-gnurou@gmail.com>
References: <20201123151843.798205-1-gnurou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

