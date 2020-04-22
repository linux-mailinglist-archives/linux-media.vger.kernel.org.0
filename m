Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4191B33FC
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgDVAhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgDVAhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:39 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EC8C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:39 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v63so166150pfb.10
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wKo55od9beo7o7gDVJSr1DBakN6Dlvd9g9Cm58NQzcY=;
        b=kT5z8MPzDIMrMTppzCuf3HzfzJrXbdmuz0uLLoRTyNEqgv3kAIgXzGyDNWeF+nxtCd
         gmCdgcTj+iPOt1TXjVoenmrSdalNukOcuk/yFO7tUfHRmVVXg34XTQ6BfZ9etyrTuKfq
         dE3y/sWs8blnl/v/VjRj/dx9auR+2o9ByAWt7CUq89XVDgfbji9mY93Ux+UFTyqaQ3Ne
         n5r/+LB5WRVwOTIg0+sLntalVMYcBN734hGpQuqWmtg9UB7sS+75pyWSnVXvRXvfcXvz
         /H9KexrYF5N8wS5jxIBDX7LwBTLYuWy0NccnAuA3Qa4hfY1iRIAtsL2cLE0258jQ2NvH
         U7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKo55od9beo7o7gDVJSr1DBakN6Dlvd9g9Cm58NQzcY=;
        b=OTLosdlJgNl6JpluaK2OWa7JRdGBIQ8ipD1Tz8NWe5BlL0rifoPCWJFncttct7qui9
         O6+qrr24X7F/vLcafKH0WX1Y1WZDOzaqcqd6wZafB7Q7i6gQSE7tVsYki2vHlEutPh4N
         U/YFCXk5xlYkAels76chwP1fW8/em2i1BP74KzH+ZCcupZI5JFpFpBXYfgPWcyh/WMrC
         T5lfkvy6d1pgeSbTUnOBp9N2847RnxbKHJTU5fxu1/bJ3sHEjC6LEDbIm2YaUPywVSpg
         uqouNN41JeWIRMtXyJ5yT9N8+KTNYt2EJ+6KvmyOIGJN6X2UaUtLDHxtOAWHVO8hp9yt
         PwtA==
X-Gm-Message-State: AGi0PuanWe1rI+T6dALpIQLTyXMjePASWPhPDfG+4YkLeiWYDUolIFhL
        OmsUL+fWhYWQKdTfMOcVRnSI/mIt
X-Google-Smtp-Source: APiQypL/M7Q6rKy9AfkHd99uKkCv0+A1qLE7QNxJLZ8vZpbzJvpJmDb6Lb+opgGWhp6/VfFGQh4TEQ==
X-Received: by 2002:a63:1820:: with SMTP id y32mr22934444pgl.182.1587515858925;
        Tue, 21 Apr 2020 17:37:38 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:38 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 02/12] utils: remove extra commas
Date:   Tue, 21 Apr 2020 17:37:25 -0700
Message-Id: <20200422003735.3891-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wextra-semi-stmt

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-compliance.cpp     | 2 +-
 utils/cec-follower/cec-follower.cpp         | 2 +-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 713e2a58..1c62b5c9 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -336,7 +336,7 @@ static std::string audio_format_code2s(__u8 format_code)
 		return "Extended";
 	default:
 		return "Illegal";
-	};
+	}
 }
 
 std::string extension_type_code2s(__u8 type_code)
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 36bd2fbb..1eeae2d4 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -189,7 +189,7 @@ static std::string audio_format_code2s(__u8 format_code)
 		return "Extended";
 	default:
 		return "Illegal";
-	};
+	}
 }
 
 std::string extension_type_code2s(__u8 type_code)
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 3b45711d..93df7034 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1752,7 +1752,7 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 
 		fail_on_test(buf.qbuf(node, false));
 		for (unsigned p = 0; p < buf.g_num_planes(); p++) {
-			fail_on_test(buf.g_fd(p) != q.g_fd(i, p));;
+			fail_on_test(buf.g_fd(p) != q.g_fd(i, p));
 			fail_on_test(buf.g_length(p) != q.g_length(p));
 			if (v4l_type_is_output(q.g_type()))
 				fail_on_test(!buf.g_bytesused(p));
-- 
2.25.2

