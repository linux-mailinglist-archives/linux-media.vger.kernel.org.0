Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E393323E90A
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgHGIge (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbgHGIgd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:33 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549FCC061574;
        Fri,  7 Aug 2020 01:36:33 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d14so1005376qke.13;
        Fri, 07 Aug 2020 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yEXAHDd933UU5IrgghuWIRbSYw8TfxYHRTaFu8VsYYU=;
        b=vafemYzrm3ka5M5odLoFLxlavT2sAYCa4jhehaWjzZvqmD2Vr18QBi5T0SaYILH6Si
         Y6dEGIt/wS+FXZl0FUcwWd1vAaOvB9MliY8UV8dHKCNbEswED8xsesBIUgW6g0XYHGp8
         uHqjeazH9BWNhPfKjVc/fQN6eKcTkMNrUcONoUT2vSyJ2j9SWK/1berbRqGXhpXU7o0R
         vnYaScBVg0BntBkB6p9uFvyWQ2/zLbKE+T7UVi7se49RPe8RP/b8s510TMyPvVi5x3IH
         ITfiucStGBgC2sy/towWzQovnO1xkdo9IZjVmiahDtf61AjYDa5ToNCn8jY0PEJ4emc0
         k75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yEXAHDd933UU5IrgghuWIRbSYw8TfxYHRTaFu8VsYYU=;
        b=phkmSIR/2taVltzJlJvhq0NuLt3V/HbCoQ+OqWzTbRFfoGeu4HCrfYj1hYDktCV27g
         XD9UA6y46RhBJDeMKKqYIj4J/FSefPhYHmKfgqWIrIV87v592YgMTDq6/Dx0L3wrZGaL
         zvtdWi2tnxRN+1ZLQkOVoLsbfzzTZe5vEKruI4PBvqsA9c7jFqAiBHq0aFyWFe3N6wZL
         pJOFwPVLa2b3k5AaHIQBUKBznAh9As2kGVZgPW8FL51hnzYZCOfQSv+3/S9+3dBHuh01
         P+5RraHlVIQkjWaKjpPZfDnSJsybs9SwMUkeSjL5ObDgttt0fX2yRsod+wYWXmY4BGa5
         VD4g==
X-Gm-Message-State: AOAM532JssRehcJmAcpTK71dPHo2kZ/JLavCRSOQeYESwMDfyHh4n3CY
        fv623X02ESO1JknnY9Wo9m0=
X-Google-Smtp-Source: ABdhPJzW5tGPPuFjuolkx44QWWpMXnhNKbECB50jaOYdAAVGeJ6NPsf+EAcQvksK+gkICvHB36VYSg==
X-Received: by 2002:a37:9945:: with SMTP id b66mr12742782qke.51.1596789392586;
        Fri, 07 Aug 2020 01:36:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:32 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/20] media: vicodec: vicodec-core.c: fix assignment of 0/1 to bool variable
Date:   Fri,  7 Aug 2020 05:35:34 -0300
Message-Id: <20200807083548.204360-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/test-drivers/vicodec/vicodec-core.c:1674:2-21:
WARNING: Assignment of 0/1 to bool variable

drivers/media/test-drivers/vicodec/vicodec-core.c:1675:2-26:
WARNING: Assignment of 0/1 to bool variable

By replacing the assignment to 0 with 'false' instead.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 8941d73f6611..e4a8d3a5eecd 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1671,8 +1671,8 @@ static void vicodec_stop_streaming(struct vb2_queue *q)
 		ctx->comp_size = 0;
 		ctx->header_size = 0;
 		ctx->comp_magic_cnt = 0;
-		ctx->comp_has_frame = 0;
-		ctx->comp_has_next_frame = 0;
+		ctx->comp_has_frame = false;
+		ctx->comp_has_next_frame = false;
 	}
 }
 
-- 
2.28.0

