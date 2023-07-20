Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B10D75B260
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 17:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjGTPW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 11:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbjGTPWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 11:22:25 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F9326B8
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:22:23 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b9ee68396fso791695a34.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689866543; x=1690471343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONZSX3Cq2d4tj8t/rv115DGRvjRtDUuUqwMkfdX8Cnc=;
        b=o2bqhF9HmrG2r4LeRlUKt30D10w9NOZlKwV8H2lg157//8QP3z52nsER5wAMq2/Rcd
         XNw+AAlrFalEUOpw4dUrpyZavLYQl5h0g5yEwpdENIQQc1EzfZ5d8jRW3pX/7NmPL+p0
         +Tbb+nG9+LW0C8M3arB+8uJ/R/kQ17s+MYn6qobEOY5ATV0VdQSk983NMRmocBZvo60M
         FkWy+sFh2YArfZQHes06Xfj6QVTp4dGsSCT6AXVQi13R296AIiIweMHQRYSwZGoItXYi
         rRDb5M9MxFjMjh3j+QLMjGrj6gEL9E0hoJ/f0NLxe053cTk5sgVI33J71KG1NOc//pnX
         a1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866543; x=1690471343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONZSX3Cq2d4tj8t/rv115DGRvjRtDUuUqwMkfdX8Cnc=;
        b=eJNpaIF9k97hQlY+Q05dYwmyxvLXFkaUnaAjns7PtyWFz1wNzFXkY8w37tVcxQZbSR
         xbKGBePYH+GSR/kRRhpUCQWN7PMvYQwoKEm95olMh4Tz5RjAV6G+0u1hZHz4ezx/GhyU
         v4Kr4kwolYIutjQxkFDObCE1CrGlvbmBdrDFSgH3tFcw/veC3EwHmT8yYyTv/dyKnsZ0
         pOv3ELR4WAZDcp3wkUDUDcP79HeBur4LBan73pB20RBWeEuZmrVb8U7ICRkxsgF+s0yQ
         TnWJs30Rz6JpssI0TYztKy3fRXpaHaReSeIrafvTVHkUsFgY+EebiuOKCRjgKh0p0jhc
         VtSw==
X-Gm-Message-State: ABy/qLaSPu5gnUXiq4aoT4Sh2Nl42uCELm4E3HEAk/cShN/pmFhb/Yee
        WAe/oGPpSH3xFJKwzqPi/aA=
X-Google-Smtp-Source: APBJJlFCLGTouckBz4oAw5Qwo3Uxdbq/tKq/UownnInc0xJlFa9kaPa2vZ96EUmrDlE0tvIEjc9Uvw==
X-Received: by 2002:a9d:65c4:0:b0:6b7:53df:1db3 with SMTP id z4-20020a9d65c4000000b006b753df1db3mr3364721oth.0.1689866542569;
        Thu, 20 Jul 2023 08:22:22 -0700 (PDT)
Received: from pop-os.domain.name ([45.117.51.52])
        by smtp.gmail.com with ESMTPSA id q18-20020a639812000000b00563709c8647sm1381932pgd.7.2023.07.20.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 08:22:22 -0700 (PDT)
From:   AtmegaBuzz <swapnilshinde9382@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     AtmegaBuzz <swapnilshinde9382@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] LFD 103 test patch
Date:   Thu, 20 Jul 2023 20:52:13 +0530
Message-Id: <20230720152213.25342-1-swapnilshinde9382@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: AtmegaBuzz <swapnilshinde9382@gmail.com>
---
 net/bluetooth/rfcomm/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index 4397e14ff..8fd5d327c 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -1065,7 +1065,7 @@ int __init rfcomm_init_sockets(void)
 		goto error;
 	}
 
-	BT_INFO("RFCOMM socket layer initialized");
+	BT_INFO("RFCOMM socket layer initialized, Hi LFX");
 
 	if (IS_ERR_OR_NULL(bt_debugfs))
 		return 0;
-- 
2.34.1

