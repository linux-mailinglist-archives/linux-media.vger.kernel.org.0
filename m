Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1440F50C2E8
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 01:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiDVWVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 18:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbiDVWVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 18:21:14 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29185332414
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 14:11:52 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-d39f741ba0so9876335fac.13
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXEQmyORymjIJA481AWfjyxSR/+yjKPJrRduKNDWB38=;
        b=fDHVbxU6FCd8S7/Rd9DAgJl6zv1wEk/wkE2P29kDSpG0eS2842MvhsyfDA77cLjyxu
         rgUONCkY1tpU0T8mvU0HFXjoVWRObw/LD5NUjAJ4u4sJt7Egw6NYekdvZvRivzkZpqrB
         Nsp7GMpmXsSd4ZSqpaRihywZA4fcaGW+dcWpirBm3Ggoy8ddk1CCATiMIJFlhgShvUcv
         JtPNPvBfoe2Wa/b8/z6Kps5fugdA0k3+YuZCrVpEjePANK3gBcYEm6eGos/Q5eLqNbA8
         4B3cF27l//xe5EYv+DDquumBlQKyTpnnK+0KS+a2rwJTwLHrkliBvBGwq/TIHwgcrAXF
         vhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXEQmyORymjIJA481AWfjyxSR/+yjKPJrRduKNDWB38=;
        b=M+D/YSCE6hFSiFhK1JxzG3C6h3t+DAmrDR5sj7cpyL0pVjJexROUn2sCWg614cK9Br
         zBZlubNsMrFRPwNNR03f7kZHKwm1wO3FdY+TYZG9dqbLL0UcxyY+Vy8JX3w7ZS/XowGi
         cYgWwUDt9LR6AStUH1Pf13bZiKQgBLIWsG0tIQy1dm+PLJGowg8EPN5v7FXP5A8wvf8G
         YSEb0RJKZ9/e6gvkdZH11XORYG33FXxyFjpSpBMU0U4ifA97f7pFoLTpqhZ0P70mwC/+
         fFPNkXYYkr5BcdmyP8vBf3/NawIKJMN/6uw4c0oa+aAbCOpGMsK6QUF8CBBmSBtQmFTt
         l9NA==
X-Gm-Message-State: AOAM533ElLUGfMRnBU/ysTsov3zb9eJ4+QcAJn/m08c7w/STKc5Tfm3p
        NXCPMotAh8/Ts2fgqOksJArjQS7AGFbJzA==
X-Google-Smtp-Source: ABdhPJzRlEzyQu0VL3InNz2TR/v7wSyyPiNYw+w0rKyzhJ8b1LpuPKJHnwr2P1MkrJrQZ9b3A0AqEA==
X-Received: by 2002:a05:6808:1491:b0:2f9:f091:77c2 with SMTP id e17-20020a056808149100b002f9f09177c2mr3109433oiw.18.1650655244929;
        Fri, 22 Apr 2022 12:20:44 -0700 (PDT)
Received: from ma-mailsvcp-relay-lapp03.apple.com ([191.179.115.9])
        by smtp.gmail.com with ESMTPSA id x24-20020a4a9b98000000b0033a70525c35sm1128710ooj.30.2022.04.22.12.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:20:44 -0700 (PDT)
From:   Devendra Tewari <devendra.tewari@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Devendra Tewari <devendra.tewari@gmail.com>
Subject: [PATCH] videodev2.h: apply packed attribute to union
Date:   Fri, 22 Apr 2022 16:20:31 -0300
Message-Id: <20220422192031.24895-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes clang warning: field within 'v4l2_ext_control' is less than
'v4l2_ext_control::(anonymous union

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 include/uapi/linux/videodev2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3768a0a80830..767c52c722cd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1765,7 +1765,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
 		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
 		void __user *ptr;
-	};
+	} __attribute__ ((packed));
 } __attribute__ ((packed));
 
 struct v4l2_ext_controls {
-- 
2.25.1

