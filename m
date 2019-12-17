Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3A1122287
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfLQDVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:16 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42676 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727526AbfLQDVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:15 -0500
Received: by mail-pj1-f67.google.com with SMTP id o11so3895925pjp.9
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=escyPo0HyMcbQwbzT/wvxCSXmIv+1oW68eibce/V5cA=;
        b=j4/agWygYcZZdJSrUqdHMfoy7ZrNwSLYHD46v9PEAcD+2NUGXaqaPKGTx9JsKQJuUk
         3S7MWCeEEwb523wrtIp9jn0e1nggY8ylldONjSgs5IBJY9Qey8vec2DMmYlNtHaZR/Mm
         XTYdKnRVy4vK6+9pbx94z+oFuhr93QtQFX4j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=escyPo0HyMcbQwbzT/wvxCSXmIv+1oW68eibce/V5cA=;
        b=R34gbxRlD1HwggUYHhZdClC63jr/fPuV+TE7eZ6IVuCeKTjeAmV1AYupXEhTPWleVd
         vPCUeLGzYiQCqUD3qpIfLYplt5GeYlxwbgqmcvkdQ9xtO1IivGLFxsYW76Kp6UVFWJ64
         i/5ofN9uCBKl4DAH5W87n5jvAk298yefRUcBYO/7EQdT1TNStel2Uyk4tpuOcRNYeGIL
         0jq0iiYKUZZEHx5W5SAcAYhVgo0UrUUePKYdWZ2fgQwyHhmd7jpHbtG0hUvwvrwgHIc9
         +axsBFums2brSunMSSeoMeJExe9itNYYE/QFOaRhHK02qiN9XbfBf5N6vM6v+jJDwe//
         hLgA==
X-Gm-Message-State: APjAAAXTKA9zsdRCiDIdH/OXTjgJKy6KUC+4FZY5xlElyl8ANDLW3c9x
        BHUXHtHnBsbMnEHl4Xl6ib6aNw==
X-Google-Smtp-Source: APXvYqz0XbKVQBHosaIaTdMXI13Y9uP2Oac2PjiqyPaTx4WhhBquQTr2b1xrAYABg1zWyMH9xpj+iQ==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr19731860plp.336.1576552874555;
        Mon, 16 Dec 2019 19:21:14 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:14 -0800 (PST)
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
Subject: [RFC][PATCH 09/15] videobuf2: check ->synced flag in prepare() and finish()
Date:   Tue, 17 Dec 2019 12:20:28 +0900
Message-Id: <20191217032034.54897-10-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
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
index 4e81a8447472..0ec10802e9f6 100644
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
@@ -1988,8 +1994,7 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 				call_void_vb_qop(vb, buf_request_complete, vb);
 		}
 
-		if (vb->synced)
-			__vb2_buf_mem_finish(vb);
+		__vb2_buf_mem_finish(vb);
 
 		if (vb->prepared) {
 			call_void_vb_qop(vb, buf_finish, vb);
-- 
2.24.1.735.g03f4e72817-goog

