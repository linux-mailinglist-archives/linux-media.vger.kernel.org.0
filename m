Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D663F1099F2
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 09:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfKZIMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 03:12:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45049 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfKZIMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 03:12:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id az9so7769487plb.11
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 00:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DVaWy603oUgN7+ym76FRzfbBXkNuYdOb34CAh09at2g=;
        b=a0QKsNgAc0xhS1/HHSJku1+HZeTfFPMvtF2f6lL5szloz0xAIxkqqEILxPghyrnmpE
         bPfJg604nTsvXgVrhbRcbvQP7F+Z9/Z61dIxwUWfL2UF7ZUpgbT+RjoGfVS2WWs/Fdy6
         Qcf9dLC8DvMmc7idmOKs5mazZZDzwnfJf5K34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DVaWy603oUgN7+ym76FRzfbBXkNuYdOb34CAh09at2g=;
        b=V3oEuOyJM4i3N669Y4ZsCUftj940+VFF7/PhwSCEn59yJkdUnGgVNgzLr3SuwuoOqU
         ucfB0Ku2lml3b2w/RxXzEwbpbyu1xJuh3T4jQ5d0MCFqCSMKIPaiPindBHujYfsU5JuO
         LtdbUYgi0z8uKbm0QwfVDtviJqwgF1wDbZ/P7Uq/B/oS6ixHnSwQ6gbXLVlEwL2jKg9L
         u4LJEiOpnDwnPkpyzMsoTL64ixqH39Rel07gFpXKoBBAQKSGVbQ4i97z7w3JyP0MNI1Y
         yexkpkIdsbc7JtZy0INQCdMslgfw5803ZHZRaMvG+Qd2RoJ28Gqh74eh2zSGHo2nk7WV
         hb0w==
X-Gm-Message-State: APjAAAUpO4t84iVCH8TEWpLbKmyyUBSKP0sIy4yKOkyI0vw4R738HwR6
        YyRrt+Ncx9d9E9rKcPh9QIc1cA==
X-Google-Smtp-Source: APXvYqzlUZ+9C7m7m5CpGUh162E018hPpl0WMdqaQkDUtVNy6LA8Zmg7oNWA8oecjNRNy+qUNu4sNA==
X-Received: by 2002:a17:90a:d152:: with SMTP id t18mr5073904pjw.119.1574755949910;
        Tue, 26 Nov 2019 00:12:29 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id z23sm11061487pgj.43.2019.11.26.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 00:12:29 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: videobuf2-core: fix dprintk level
Date:   Tue, 26 Nov 2019 17:12:17 +0900
Message-Id: <20191126081217.197762-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This dprintk is supposed to be informational, not an error. Set it to
the same level as the other messages related to memory allocations so
the kernel log does not get filled by messages during normal operation.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..f53f77c62afc 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -393,7 +393,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		}
 	}
 
-	dprintk(1, "allocated %d buffers, %d plane(s) each\n",
+	dprintk(3, "allocated %d buffers, %d plane(s) each\n",
 			buffer, num_planes);
 
 	return buffer;
-- 
2.24.0.432.g9d3f5f5b63-goog

