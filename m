Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1D2762011
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 19:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjGYR1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 13:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjGYR1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 13:27:15 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76C8137
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 10:27:14 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a3e1152c23so4033257b6e.2
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690306034; x=1690910834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xS3UGL45T2myP5Zvmma6colU1M0gi9zLNVq/3LAUo4o=;
        b=ZONholaPU2hHXDjWRiFM0h3scIfJHVFxZ2iX8tkl6qMLdjDnk0T+eDexvEsaHUUcDb
         xAALYemdP20SywKw/tkZlyxPVkguLdDH78X0jWgLZU2BvpqHDG9F/QkZb7NlKFYAdDsb
         Nn7FyJMvzUhxPKmrk/WuPMRVgrSv1GdPxywgmf2NHDm19rTEG28OfVJBIq/7Q0lvYawD
         6SGR3OZ71FLwngjMmCT2I9G/8V24haKiCBFEuePC2h+s+bPflQN4nAgSRnOrxMpRUlwF
         bhS8OOcj3DElFXg7L2pPu6swhhToPjgrViE/yW+DPVVDH5+1ChWsS0Ns3ZER72SSxhBi
         juGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690306034; x=1690910834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xS3UGL45T2myP5Zvmma6colU1M0gi9zLNVq/3LAUo4o=;
        b=JlR0wBzN4NfLVKCs9lxnJoAbbst6TfN0OLo/iU43TC6K3cQwfR2MmRlNV0y877iVfH
         c9flZVdkL//LVhozNLk8hX3smCfIkFSJvbDITPP/wCGWmFv+UAN8fTzQu/XgkZfxe4hN
         GVLY95kEA+YWNqc0+lVDdNKFFJNNcRJpKjOzifFukkSZVJQ9/BS7f2D2HXioX+yu2KP6
         0ymE55EH3A1R3ok66EB/ihVZlZbix99Lspu8Qsh/4rnAw0A0ADt3FJRgqVspB0tTAXGQ
         0H/lZba/DS2Cw/880PFq8NcZVmLrGqt+EgN8Pyg9ujQ/O1nEe+0MLF0IJZJmszxb1YKK
         O13w==
X-Gm-Message-State: ABy/qLYbtQ3cnO5bgIDhwg+gCMzMiUZ95T2/IMN8bRWv4DKIH1k7LToh
        +I+6JLUPrxoAApaZih+LIbpJQxk0aufDJA==
X-Google-Smtp-Source: APBJJlEpuE2ncC0SUUQfviB5kXL4oSJ6Ru7EB8noucrdfTrMc0JQ8uswtlyJlqDw21nkieknz4yRfQ==
X-Received: by 2002:a05:6808:a0d:b0:3a3:fa64:b543 with SMTP id n13-20020a0568080a0d00b003a3fa64b543mr14741342oij.12.1690306033899;
        Tue, 25 Jul 2023 10:27:13 -0700 (PDT)
Received: from local.lan ([190.97.20.29])
        by smtp.gmail.com with ESMTPSA id bi37-20020a05680818a500b003a48fce1db1sm5358827oib.33.2023.07.25.10.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 10:27:13 -0700 (PDT)
From:   Jorge Maidana <jorgem.linux@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>
Subject: [PATCH] qv4l2: fix SDR format error message
Date:   Tue, 25 Jul 2023 14:28:33 -0300
Message-Id: <20230725172833.9484-1-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'VBI' to 'SDR' in SDR format error message.

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 utils/qv4l2/qv4l2.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
index d4a0617..e37ee87 100644
--- a/utils/qv4l2/qv4l2.cpp
+++ b/utils/qv4l2/qv4l2.cpp
@@ -1491,7 +1491,7 @@ void ApplicationWindow::capStart(bool start)
 		cv4l_fmt fmt;
 
 		if (g_fmt(fmt)) {
-			error("could not obtain an VBI format\n");
+			error("could not obtain an SDR format\n");
 			return;
 		}
 		if (fmt.fmt.sdr.pixelformat != V4L2_SDR_FMT_CU8) {
-- 
2.30.2

