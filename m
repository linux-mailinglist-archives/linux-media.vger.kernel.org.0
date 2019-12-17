Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B6D122295
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfLQDVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:50 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44628 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfLQDVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:13 -0500
Received: by mail-pl1-f196.google.com with SMTP id az3so5393370plb.11
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dTJtBCRtUW3V7cvpTHf5hNJH6T4sX7RfeAH8a1VqWM0=;
        b=Dyrw3mAK7lS1NG/iW0+Kzcp8KdP5+6eyVm6g0DnFK9kY9Qj5cRN7SWSXKGJCTqyJsd
         R+sqX9sfDXF7mQlJPgrE9sPOnUBv3oJTDhF75o1OHTBkONfv2zdCmST1VI0KjrRNeHUm
         UyYsC5Bxuv9hC6gqmRhxTx+Psj4VLUhsKxCzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTJtBCRtUW3V7cvpTHf5hNJH6T4sX7RfeAH8a1VqWM0=;
        b=O6tN9ItHck4Vm1KbFgGF2Fo0OL0y+N8chB+fYLjzpGcZBTB1vJQz/bfUiQYJN6ICm6
         cxE9YoF1Qq6QmeQ5YGdKWtTbquIKybvMHhE+5CwnmJhTl9m3ZwAlIIXXC0b6OoIbold7
         Q0rdSiZJwZRIdH5D4YD7OwQerADmGtj+XRju+4kA2JLZGUIY23KXn8NvJyu8dHjhgvb7
         R0xlELvNkxdAEf4tTwcRoET9i+3Webj1VEg+tozQfAKkb5cX3ghSo+1mJuXvrCBthUuG
         KsuNkig0KzmmAgcJ5/gB783AFNNTAUVvoKbafsm2ty/emXwu69nljrwF8z96F2oo2F/T
         /rCw==
X-Gm-Message-State: APjAAAWsW73jzGoE65TxhirvAUofsrIWIMg1uF5G0FqR0ONLg8yq7IsV
        i9F5uZq7EZsnEZwyG52riCOmgA==
X-Google-Smtp-Source: APXvYqx4WvFFvGRdNjuNVketu96/9otNgHem3YkTRcw9GCeLvmQ7pzz7YlHGkDHF6Jbzu+Fg5vVrlA==
X-Received: by 2002:a17:90a:77c6:: with SMTP id e6mr3353366pjs.129.1576552871239;
        Mon, 16 Dec 2019 19:21:11 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:10 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCH 08/15] videobuf2: do not sync caches when we are allowed not to
Date:   Tue, 17 Dec 2019 12:20:27 +0900
Message-Id: <20191217032034.54897-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
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
index 492ed2577219..4e81a8447472 100644
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
2.24.1.735.g03f4e72817-goog

