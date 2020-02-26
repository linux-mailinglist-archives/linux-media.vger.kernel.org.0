Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A1A16FD24
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgBZLQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:16:20 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37528 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgBZLQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:16:18 -0500
Received: by mail-pj1-f66.google.com with SMTP id m13so1145740pjb.2
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1tFCzw75kCxqGljRqUUqQ24ppDX2CtviVmHlh9ZwXI=;
        b=SUEP5H4If0hedHG+d1NujE25rC/qeuZmRHTrnVGnP0EIN3aaxg3mNjZGx2NZLg0L6w
         BOjyNWvn6w5PLu3+1thwu2S39c0ZMJOEpiV0jIh63SUKGnK9wzObCjQpy3nyaVXE/y7/
         lSqKT+KAtiRGykb+8CKaOgFHqGlbBk78g480U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1tFCzw75kCxqGljRqUUqQ24ppDX2CtviVmHlh9ZwXI=;
        b=L38lwbV1SesKi2Rc5PkPbi4rO4+yApuhtQkGxSx09yTDdR1ShlnSRJg2RG+kowJtGi
         JYlphfS8JQOpHkj+U4oj58N1v1ihX0x8lXulglOUU8mRKa8HLTBfQcKEo3Jw3/75IDU5
         6lpeMk6XZVBHIf1OotU+RlNfZw0KJRdPZ5dJy5XSLCPpF1GOamkrSaL8n6BODyx6q8K4
         7oxgPMFdYUNtB/6iTwgAlH8ZcgA4X6L2arqfroHD9qYotO5/DN5Wz1B5faBtvJTzFH7Z
         4SFqZ2e6klyWRcOkk757fu0qyb+skA7n+q76m0WCRRCSMw2OBpavNattuhvPy6jlKjEd
         RLTQ==
X-Gm-Message-State: APjAAAWydUpVYabUIdl13NN4fQcRgQbFcPMFSYln6utVngGSsLUubiad
        qw+1Jwc5zh5HsenGjDjMxmpBblNRH/M=
X-Google-Smtp-Source: APXvYqzyt+rpfyMZ4RL10CxYR7SLP1N/LsYvlz4aIcvuEf9JypIqMqdBTCcFIPRxhcL3Oo1KRvY9oQ==
X-Received: by 2002:a17:90b:94c:: with SMTP id dw12mr4482184pjb.13.1582715775331;
        Wed, 26 Feb 2020 03:16:15 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:16:14 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 08/11] videobuf2: check ->synced flag in prepare() and finish()
Date:   Wed, 26 Feb 2020 20:15:26 +0900
Message-Id: <20200226111529.180197-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This simplifies the code a tiny bit and let's us to avoid
unneeded ->prepare()/->finish() calls.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 988e8796de4f..7f637e3a50ab 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -304,6 +304,9 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
 {
 	unsigned int plane;
 
+	if (vb->synced)
+		return;
+
 	if (vb->need_cache_sync_on_prepare) {
 		for (plane = 0; plane < vb->num_planes; ++plane)
 			call_void_memop(vb, prepare,
@@ -320,6 +323,9 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 {
 	unsigned int plane;
 
+	if (!vb->synced)
+		return;
+
 	if (vb->need_cache_sync_on_finish) {
 		for (plane = 0; plane < vb->num_planes; ++plane)
 			call_void_memop(vb, finish,
@@ -1991,8 +1997,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 				call_void_vb_qop(vb, buf_request_complete, vb);
 		}
 
-		if (vb->synced)
-			__vb2_buf_mem_finish(vb);
+		__vb2_buf_mem_finish(vb);
 
 		if (vb->prepared) {
 			call_void_vb_qop(vb, buf_finish, vb);
-- 
2.25.0.265.gbab2e86ba0-goog

