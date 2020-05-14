Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ABA1D35E1
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgENQCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1272BC061A0C;
        Thu, 14 May 2020 09:02:52 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x77so1506225pfc.0;
        Thu, 14 May 2020 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ulQxFo56i5vrppKta1ls/Sq8Rcp1nNk3Qy4EKXx/4ww=;
        b=c/t5Jl5g8lFXZfuf3nZbC7oQlaQmgFg+60o70eSocAWJDtUwnnPLceyXl99RzpngpU
         N+5Huu3ue9Cn5K8aZasUtgPD48FUYqbStmxv2xOe3ICBJbl4xMor+xyzh+a3WmO95FDB
         S/mAMlWecrOVzR5bkP3HDtJLCdyAlNCpGFDFyh/SWbD+V3Gx5t0qfyY9EOkzZwfTKJ0c
         N/mbVOc6rQV8bw1fkaXkVFGOFUs79LBTAk53SqoFJ1gYlQQSB2nOzeS17RBDkiVdS/oL
         ZaoBejnJtVUZ7UY1juL/GxmtAx6H1SKTDvnOW+GUHI9f+NvpfXEkMFmjpihaeKEfgN6D
         Wjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ulQxFo56i5vrppKta1ls/Sq8Rcp1nNk3Qy4EKXx/4ww=;
        b=MufwnQkXOXL063uBOrTnrl/tbBfs2vNB0YRUKEJqxQFrBvAAMr2GxcHKGTCaUOeVZ4
         AHzLM+Nwbb/bBM5frAzx/s+csrHorqCrt8aheyt8D7h+tjr9UsR5Fj9ZRV6zjwmWWWBU
         jdhgsYPPjBPtBouMr3e9tnbAqjGcop7Q5mta7fjwk4+bMwItik81GjCrbTEduA/KGjxQ
         lYxC5M0FQuDNSgSdulBRsV30RYQxkyRbHyLKa8L4z6f3iiBiahqvET24G6yOM1ul7GaE
         TA+PctRJ7kMs5nNjqXHDi1uuLrvbL+kG/6JBCrGo/huKp9I/HorqayHPyYUeGKSuIqKW
         J3tA==
X-Gm-Message-State: AOAM5332NkeTATQ0KTdASVYOpZxvMl+P0MpyNbx653SETr0FJYx7ubRi
        38AXEG/uImrawiBmvvBv3rKMihIb
X-Google-Smtp-Source: ABdhPJx2V94Ocgq4TiFRizz86wbf/g4JGYFoXw26J8PS9HBwBYEgB1KY/9epKLPTDzYHQw556wTEfA==
X-Received: by 2002:a65:468f:: with SMTP id h15mr4420789pgr.452.1589472171546;
        Thu, 14 May 2020 09:02:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:49 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 08/14] videobuf2: do not sync caches when we are allowed not to
Date:   Fri, 15 May 2020 01:01:47 +0900
Message-Id: <20200514160153.3646-9-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Skip ->prepare() or/and ->finish() cache synchronisation if
user-space requested us to do so (or when queue dma direction
permits us to skip cache syncs).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 6a95663afcd1..1a55ea19160b 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -304,8 +304,11 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
 {
 	unsigned int plane;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
-		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
+	if (vb->need_cache_sync_on_prepare) {
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			call_void_memop(vb, prepare,
+					vb->planes[plane].mem_priv);
+	}
 	vb->synced = 1;
 }
 
@@ -317,8 +320,11 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 {
 	unsigned int plane;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
-		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
+	if (vb->need_cache_sync_on_finish) {
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			call_void_memop(vb, finish,
+					vb->planes[plane].mem_priv);
+	}
 	vb->synced = 0;
 }
 
-- 
2.26.2

