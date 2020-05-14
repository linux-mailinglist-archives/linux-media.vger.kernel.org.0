Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DCC1D35E3
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgENQC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19185C061A0C;
        Thu, 14 May 2020 09:02:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s20so1325245plp.6;
        Thu, 14 May 2020 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GGls9GUmPTFOyQJLulj2UZ6AWGLqkYi+NOk94E4x+Y=;
        b=sQfEUA427IZ+IO5SV4NjFwYds1OLdj73Yi0a5ItkUjmEDLjcs2/LqvxgsVk4WRTnlg
         w0QB/G5FN3yLMW9a14aRG7b/xWQH7MiKLygax2ztN70idlkza3VY/I5OKq4Yr84wWVh9
         X6yJS/c7usc2Omd/CgX+MqkmKnfR1w4BXeLsKqly11jGlWfmZ81/xEm5nO4tZr+DkKwP
         ZexL5PNVcqIdZxPNMa7lJPyhw6puaxU2nc5yFmTgzCKm6iLqbLOWWYnd9ogr/gOA06ho
         ysV3zwdPsAVk0ZtCvXGuTsBMvXTqF4jVUB1GP9oa/I1Lx6mZC8yljAtjsh28G48N6DKj
         HQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GGls9GUmPTFOyQJLulj2UZ6AWGLqkYi+NOk94E4x+Y=;
        b=nC93Q6lvQ7cC07a/PUGMomfM4/VlShMuIZ0w9z3pU6/zpc6tuTfDBt7eKYXzlkssQz
         y65VN5Tex4W0SYY9VwG7uuKuWIC29cqgbL8xUa1YDxE4440RG9QXOX8voGt3Wy2moKfu
         RYnVsZhc0qGWeSqm3bn8UdML8x088O+1v0WT5I6zaOtVeUx+HfUJKRIICGteE49Wgm72
         gn8CsRelLkHofS0ms4+4BD0rn904gh0EzWiVEHNpGeoFIlig0037gYMg65g2T5IEEZeu
         245CZTIp3ZwMyCPKjtqo5UMeIHQcrFLZwlrPWMCYVqLPHJUuA/8u63bmZTmiYBIbaJiQ
         Bq/g==
X-Gm-Message-State: AOAM533266tei3Rtt8an9ldjDvDnmtiDvtWwLAzYyBuAhkAC3NxBrCS4
        NYrDDUPwQvW8EzesmMQ/YNY=
X-Google-Smtp-Source: ABdhPJw3+O3qRxCe+XzYuYSq9n6CsvYMHSLRQk4CMAXlcYk2R2GEeRhgRMdHrGYK3iC2lqYrnlJ6wg==
X-Received: by 2002:a17:902:82c1:: with SMTP id u1mr4843270plz.10.1589472175973;
        Thu, 14 May 2020 09:02:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:55 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 09/14] videobuf2: check ->synced flag in prepare() and finish()
Date:   Fri, 15 May 2020 01:01:48 +0900
Message-Id: <20200514160153.3646-10-sergey.senozhatsky@gmail.com>
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

This simplifies the code a tiny bit and let's us to avoid
unneeded ->prepare()/->finish() calls.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 1a55ea19160b..7e081716b8da 100644
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
@@ -2000,8 +2006,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 				call_void_vb_qop(vb, buf_request_complete, vb);
 		}
 
-		if (vb->synced)
-			__vb2_buf_mem_finish(vb);
+		__vb2_buf_mem_finish(vb);
 
 		if (vb->prepared) {
 			call_void_vb_qop(vb, buf_finish, vb);
-- 
2.26.2

