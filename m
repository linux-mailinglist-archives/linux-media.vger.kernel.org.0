Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622C53EE717
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhHQHX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhHQHXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:23:23 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E2BC061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 00:22:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so3645815pjb.3
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuc1KWwtSpTMNJmJQtZems4ugrvN1S6EtN0LAM05ikM=;
        b=Bu7X1yPpkNDo4JJQEJmSUAe0n2bo0AXEI2N4w6KPwuw4/keWpmcAG2JiySXrQeEJjX
         w4cyiPWveMVw+m3GxHGJ7PDTQ2cp1jUMtkSvxmfjTn1k3wrr3n7dDM7klJ6YotxGlLwy
         r3hU4qL0pImmKl8GQkjUcoCfJwjJpKRG13RxwEHuVMvpcDJVt/a25LmdBZse32wuVL7B
         ugzJ+XJY3OpasLsOE3prBp0xTMUeRd7h1eN55jY3YyehxfvpNCTuegC1gP1h53adT1tN
         Mf5NIle/jYblEjruZbIVRLInzSDivQD53Bfn1x35KGbZ3hWudPGXWA9sKoEidyhKOCGL
         EtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuc1KWwtSpTMNJmJQtZems4ugrvN1S6EtN0LAM05ikM=;
        b=t7rj769BBvHqyN5OZe2kvnhlXbg4X4kKk1vdS7B6OO7tgvKdtQ2eOSVuwkDVoBRqlC
         97U8Dep4MBNP6i61rN/3cUt/cfA+qMcQsK4Znt7Up7oJwXSkGAKhISry0kxlMFIylhH6
         JuYMlEjhHnANFStXzriQoSCoNRDzuOFNTDknn2HiDbVY9zsChcbp6bNBXuq2MavFQ+NB
         tTP/K22HnzHKfVkD2XiuJtiQt7+OV34R5HwjeK3i88KhOc6J+d99+qNH/5iVfrSb4gpR
         1HysvHOwFErUSNSs8vBEtya5SBr0RtJG/KtNjcX4jU3a42/Nbs9VplGN38JWRS/ZYovv
         /nvg==
X-Gm-Message-State: AOAM531eS0Yuzez1BkaMTEIxx/KiS+PiKZ8viKf1Pn3UCv0NFPMKUrt+
        QYzKyuAICbzxF18QMvjZ4Kft91DCq50=
X-Google-Smtp-Source: ABdhPJzK8+k7VaLYO1jqRrrOCLHWpjRK23T0hoEwQRsxfVPwS+HPLWit+jbN2l+khyWEFSscxMrebw==
X-Received: by 2002:a63:5065:: with SMTP id q37mr2196836pgl.112.1629184970096;
        Tue, 17 Aug 2021 00:22:50 -0700 (PDT)
Received: from ryzen.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id 20sm1858200pgg.36.2021.08.17.00.22.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:22:49 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] utils: replace push_back with emplace_back
Date:   Tue, 17 Aug 2021 00:22:48 -0700
Message-Id: <20210817072248.2781792-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoids having to call the constructor as it forwards the arguments
directly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 197baaeb7..e6a0630d9 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -3058,7 +3058,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 
 	selTest test = createSelTest(node);
 	if (!haveSelTest(test)) 
-		selTests.push_back(createSelTest(node));
+		selTests.push_back(test);
 
 	for (unsigned i = 0; i < 8; i++) {
 		v4l2_selection *sel1 = selections[node->can_output][i & 1];
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 51919fa71..c94017149 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -996,8 +996,8 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
 				std::exit(EXIT_FAILURE);
 			}
 			if (const char *equal = std::strchr(value, '=')) {
-				set_ctrls.push_back(std::make_pair(std::string(value, (equal - value)),
-								   std::string(equal + 1)));
+				set_ctrls.emplace_back(std::string(value, (equal - value)),
+						       std::string(equal + 1));
 			}
 			else {
 				fprintf(stderr, "control '%s' without '='\n", value);
-- 
2.31.1

