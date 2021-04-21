Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813AC366629
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbhDUHVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbhDUHVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:11 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B969CC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id t22so20799558ply.1
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y2Wy26eehSv0lHvenlaSe1nkyEj1Si4bGcBx65VhGMI=;
        b=jNV1x/kq2oMdNB8YUaqzv6q1+JSTpa6m1e8NnZsEnfmbRfbNPm+jrK0WBBKbds6PDk
         MOnL9TR+vAHZSe6N/wqJB+4QUhVdRCjNK8tpBhNvUFXpS9aqcD2za1OqsmxPGygVJxaX
         r3a9jb4r3qK/gX+UMr86I10EFRXzbiSZXoxwITYU6CotO2755MahzPVG/GsEk4sxB5TN
         za64hBG4Dx5Zwm3o2B7kxUy80FE21FRNa/C+bXn3jmu4+vngzBFY8qRxBk/LVGgVe6kX
         TYYxZCcNHsrIbzqWiBR3rY5MxpcM2N9MQCMFlNgUtpDVBY3okZ6tM6fbpzcJ4alPT2Hv
         ugJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2Wy26eehSv0lHvenlaSe1nkyEj1Si4bGcBx65VhGMI=;
        b=RmUaxFAt0jH6fdOK/vQitV9IikHUN2g3KQgScS1/kgYjS53J7qRiQ7sv3gciOi0jCH
         FbnrdNRWgRvQm21CqOsjQ0o8Rei1VGrDTmAFn45D9iayK8r2y3NDchDKyLkBV1i4mwBe
         AtCKQkLM0m/97OEZRF55p+LKJnrrI20CwPegL9QrEZp6ZMaXZtlK6TIRq49fnYArHmRF
         9D+x4AlcV7SArcSUr05JaOcAJyXG69TglSM9aBVSg9KO4hFS2HAQ7UIhrUzi9avxYVPh
         DFdXSUAhFG5q3+JXVHvb9GvutdbxEWRL2tFrsGDi0kLRW3am4Iy67mNWkevfhdHq7jua
         JUKA==
X-Gm-Message-State: AOAM531p6Mmp9nBQTxiXQlB4EtxFpw0LUTcvAZulpIrjZIrK3t+ZX1en
        xImuDpx/1WS5edTsJrbPCMx+SNSAw95YGw==
X-Google-Smtp-Source: ABdhPJwd7yqdwdy6zwt7XmgB2dMCJfXQQRzDSJcFTXBzmDR9VYWTD/1EHmnWdrqp253C5/dZBPMYig==
X-Received: by 2002:a17:902:7203:b029:e6:a8b1:8d37 with SMTP id ba3-20020a1709027203b02900e6a8b18d37mr32308841plb.44.1618989638123;
        Wed, 21 Apr 2021 00:20:38 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:37 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/8] clang-tidy: use nullptr
Date:   Wed, 21 Apr 2021 00:20:29 -0700
Message-Id: <20210421072035.4188497-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-nullptr

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/libcecutil/cec-info.cpp             | 2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index 22a687761..0172e8537 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -168,7 +168,7 @@ const char *cec_vendor2s(unsigned vendor)
 	case 0x8065e9:
 		return "Benq";
 	default:
-		return NULL;
+		return nullptr;
 	}
 }
 
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 9f71332ce..90a503612 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1460,7 +1460,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	    node.controls.find(VIVID_CID_DISCONNECT) != node.controls.end()) {
 		if (node.node2)
 			node.node2->close();
-		node.node2 = NULL;
+		node.node2 = nullptr;
 		printf("\ttest Disconnect: %s\n\n", ok(testVividDisconnect(&node)));
 	}
 
-- 
2.30.2

