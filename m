Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260D5175287
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgCBEND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:13:03 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41649 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgCBENC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:13:02 -0500
Received: by mail-pf1-f195.google.com with SMTP id j9so4891253pfa.8
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3A85FNkQVK15E41Jw/YnZSYCbOfj7OMPE9KsvpyVprI=;
        b=iQoz4D3GwiW8h0XeU8c1Et605eWVY/JK+54169MH68UJ0X99a18+0g9Tm8xc/DDmAp
         mj8ZAhEVfO7rt3RTDu/RzFnPjOY4zldofCKucp1E6RT9nL4gfhu0c5e3+dEF17zFAFSg
         Td/fdZ3uqYCSPBmyLKwkHZa3JvzRlak5lPFXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3A85FNkQVK15E41Jw/YnZSYCbOfj7OMPE9KsvpyVprI=;
        b=nyQhSenojjpS2qe/2knI4zFVO9oqSn40wliohncD68PlqPpqumM/uIOwI4OszgzW2a
         02UwjFscOqQ0JJHvGHXIm9S5GkcJeSX8UfW5nPPqG02ETpxBbV7Nrndw4MLHFl837pW9
         5vbzfAXI/KLVxasJLDz+EKhvnS1WcYcbC4bbieEr/pfejqQBvgrQlGHfXhjRQg2Tn4sD
         9nYNdwAEjcpAxJb5T8q06e49ZJbDDIjqqTIF1Ck/k/T5zR9pmXlVjASXmqOjx9dnFAWh
         XwkK8gq0lSz9aEmNnkpCOyp34rdgydtMWHNLFYKvMVxzrV+EO/X7pHEPlQv50zCesnH+
         21Eg==
X-Gm-Message-State: APjAAAXUeHFdw7LTGbu6BwDIr25DzsfE+Re5uqKiBYgyPxUrwfVE2x3a
        NoXHOSZUFHAdaTedBpnjGRpkQYsiX68=
X-Google-Smtp-Source: APXvYqzfiVrxV9y838Pte2LCUED/pNzCk7VJWEWdqJQlV3pzdVO6cxXqP0Ax/IK/3vv50IjpTeBGBw==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr15628477pfm.261.1583122381683;
        Sun, 01 Mar 2020 20:13:01 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:13:01 -0800 (PST)
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
Subject: [PATCHv4 07/11] videobuf2: do not sync caches when we are allowed not to
Date:   Mon,  2 Mar 2020 13:12:09 +0900
Message-Id: <20200302041213.27662-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Skip ->prepare() or/and ->finish() cache synchronisation if
user-space requested us to do so (or when queue dma direction
permits us to skip cache syncs).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index c2a1eadb26cf..988e8796de4f 100644
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
2.25.0.265.gbab2e86ba0-goog

