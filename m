Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674F34F75F3
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 08:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbiDGG2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 02:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241069AbiDGG2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 02:28:10 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDDB13D35
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 23:26:11 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ch16-20020a17090af41000b001ca867ef52bso5809486pjb.0
        for <linux-media@vger.kernel.org>; Wed, 06 Apr 2022 23:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2y2aQMw6DXdFbBwFQmMPUtwUXg1CM/Sg7zthtTD89zA=;
        b=lrvmjc/ocqMvjxrVJn1iejNplqOh5eckqd+xgWiTCAOnb0K8atrukXt+XTwwFL9Q0O
         9iz8okmw/j4wcw0dfT4LRPyLmAve1XMTdn3Mh36DJZ1uPftiyh8a5Y4jEm9OBVK9Hfbg
         5IbyVmP0eMOvuzxorbKSZ8K83s0nPskuaMnEupwp3H4EhXgQb0XV0/AWrfNAyntaEneg
         X+C43ufbMzkzIO0720Gv9EqGYqtMco+EyKDCCSZgpbMfTNFh8eLlvODAhSRCA2l2S2LO
         Jz/IG7qNb5oToQajAeRVGsyoeLsl3hTfibbKmQDoixIh9L5mehBlhXxCj4HFSDEpFgao
         EK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2y2aQMw6DXdFbBwFQmMPUtwUXg1CM/Sg7zthtTD89zA=;
        b=21hO/PfPnCErcaUG9zWkI6e0zBq9pa8XJO5I4Cvf/rjGQZPkFc/GfO3aUPosW+9cEL
         0R8ps1t3lPxItF8qrTPOaABQDoOhFHSsiRW3n+sJzOCVIs42MDG0TNH4gkuuMW83tsUs
         9anCrRydSn4Ijnk44FJqzps3Ynard91cJ8eLVCA05E/8P3oTJ5FHPchkkqe76ei6QFqp
         fIIol1tnu5k65jDaUAQxAjkWghPSAlW11vTyR+Q0aWJuTq71tU7gZ59PGOVSgGk8aLpy
         J8wC8/C6KKt5ji5S1Bf25Txyk879Vh0i2K5gfyH1qMqCiWVPsgUfrIidD9jrn45B2Jjj
         Eo1Q==
X-Gm-Message-State: AOAM5331RS5tBTpty4m19A5DBQMYx+hpbMR2pfmO0znE9/QkjzuF2UQx
        yN+WXkRwIKk/Gj2FiHTp1kImYb99y4k=
X-Google-Smtp-Source: ABdhPJzlMFF+J3U3yPrw9eRc2I/NwuBY1wJuZscLVDg1s5PgNvou6r4lau7EVhkEmfDJrpyim/c/+A==
X-Received: by 2002:a17:902:d64a:b0:156:5b17:415 with SMTP id y10-20020a170902d64a00b001565b170415mr12917723plh.118.1649312771037;
        Wed, 06 Apr 2022 23:26:11 -0700 (PDT)
Received: from localhost.localdomain ([61.79.190.16])
        by smtp.gmail.com with ESMTPSA id m18-20020a056a00081200b004faeae3a291sm21508053pfk.26.2022.04.06.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 23:26:10 -0700 (PDT)
From:   Kwang Son <dev.kwang.son@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: docs: Fix vimc default pipeline graph
Date:   Thu,  7 Apr 2022 15:26:07 +0900
Message-Id: <20220407062607.27564-1-dev.kwang.son@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGB/YUV Input is sensor type and it should be sub-dev node.
To generate this dot graph

sudo modprobe vimc
media-ctl --print-dot

Signed-off-by: Kwang Son <dev.kwang.son@gmail.com>
---
 Documentation/admin-guide/media/vimc.dot | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/media/vimc.dot b/Documentation/admin-guide/media/vimc.dot
index 57863a13fa39..8e829c164626 100644
--- a/Documentation/admin-guide/media/vimc.dot
+++ b/Documentation/admin-guide/media/vimc.dot
@@ -9,14 +9,14 @@ digraph board {
 	n00000003:port0 -> n00000008:port0 [style=bold]
 	n00000003:port0 -> n0000000f [style=bold]
 	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000005:port1 -> n00000017:port0
+	n00000005:port1 -> n00000015:port0
 	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000008:port1 -> n00000017:port0 [style=dashed]
+	n00000008:port1 -> n00000015:port0 [style=dashed]
 	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
 	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
-	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
-	n00000013 -> n00000017:port0 [style=dashed]
-	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000017:port1 -> n0000001a [style=bold]
-	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000013:port0 -> n00000015:port0 [style=dashed]
+	n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000015:port1 -> n00000018 [style=bold]
+	n00000018 [label="RGB/YUV Capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
 }
-- 
2.25.1

