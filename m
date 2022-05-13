Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53623526944
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 20:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383314AbiEMS3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 14:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357047AbiEMS3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 14:29:05 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D98220F5F
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:04 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id a22-20020a9d3e16000000b00606aeb12ab6so5509225otd.7
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIF7k4v5bkQ1JwCJMU++M6XdFQcBN0X2WTak6t2MkWY=;
        b=FknPh0u5sqhQDyh9PmSUYYHFewjY8FjSppva4LGSaX3q611p1YjOW6s7RUwiCJ0uwX
         3q+FfvvqkjbBnXsYS3y+kT6Sh0V6fJ8l/eNNExZIBoH94omZflnn/5ZQ4BK8ms1iq48U
         rKWq4Vg3g9QscSAWbhEoPhUxO+HuqKGuKgn+AfAzA9e+PANQUD9PB2mSNb4woYsvQt78
         2BwZ8+in4Ck7g1KsHrHRLR6/koCeGn+TJEW/WmakE/PSNeqt9DwHitbYkHJa7Pt/4qNa
         yqmT0HLlfhb9XjUHwpzwwokUiMgKgvViCT0rOS9o8BOyd4pjPpZF6G5Yk3PeuYOc2lJY
         GItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIF7k4v5bkQ1JwCJMU++M6XdFQcBN0X2WTak6t2MkWY=;
        b=KwlvbPRyQWx4t4Dlk6jP2bfk6cPqQMGsLVbe/bPYsmoKxKu8zL1VU8Xxw+n66HIxDJ
         dciJ9ItgZZ4Xw6Dp7so3KiW7hTdv+CcevfNFBB5X+iZ/ZfFjLQoNeDkM+80KsY8q+ZGa
         1Nn7qd7XCl1YyJ5QSHXM585m66Pj5utWNS3o0CMFznJGC9I6LPhQssLukVRCffcrrETj
         IQ6EHaQI7toxnZXCWnh8zlkYhhpR48/EkwKOp0rtOoG9x7oEGOnvf1kUQvz/0hat+Qx4
         lRo+ljaIInHB/6L8+QzDCMx2P/lf57sxP2JmUD69wE3xPEFylh2D5yITQGBkVV1a5KC1
         1SdQ==
X-Gm-Message-State: AOAM530KBGVv2RUfI+Fte2B8LbS9MC25kEiXGf/zqwDZw16aSD3yYypH
        pYu62o9h/ONKjZIyp02eHG8=
X-Google-Smtp-Source: ABdhPJwpNLZcTYcttGznC1oxoDTDTX+DKZYBZKvJe5IJ6hZ9mEuTYZ8RBhPsydR3pWSv8KTVTfO9BA==
X-Received: by 2002:a05:6830:43a8:b0:606:51a5:339f with SMTP id s40-20020a05683043a800b0060651a5339fmr2385884otv.62.1652466543471;
        Fri, 13 May 2022 11:29:03 -0700 (PDT)
Received: from local.lan ([190.1.30.36])
        by smtp.gmail.com with ESMTPSA id c24-20020a9d6858000000b00606ad72bdcbsm1234719oto.38.2022.05.13.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 11:29:03 -0700 (PDT)
From:   Jorge Maidana <jorgem.linux@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>
Subject: [PATCH 1/2] media: cx88: Fix PAL-Nc standard
Date:   Fri, 13 May 2022 15:29:21 -0300
Message-Id: <20220513182922.4882-2-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513182922.4882-1-jorgem.linux@gmail.com>
References: <20220513182922.4882-1-jorgem.linux@gmail.com>
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

* Fix PAL-Nc horizontal parameters according to DScaler:
https://github.com/JohnAdders/DScaler/blob/f7d92b76678e/DScaler/TVFormats.cpp#L88-L94
* Add PAL-Nc TV audio support.
* Tested with CVBS and RF on a Pinnacle PCTV HD 800i.

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 drivers/media/pci/cx88/cx88-core.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-core.c b/drivers/media/pci/cx88/cx88-core.c
index 89d4d5a3b..52be42f9a 100644
--- a/drivers/media/pci/cx88/cx88-core.c
+++ b/drivers/media/pci/cx88/cx88-core.c
@@ -618,12 +618,24 @@ EXPORT_SYMBOL(cx88_reset);
 
 static inline unsigned int norm_swidth(v4l2_std_id norm)
 {
-	return (norm & (V4L2_STD_MN & ~V4L2_STD_PAL_Nc)) ? 754 : 922;
+	if (norm & (V4L2_STD_NTSC | V4L2_STD_PAL_M))
+		return 754;
+
+	if (norm & V4L2_STD_PAL_Nc)
+		return 745;
+
+	return 922;
 }
 
 static inline unsigned int norm_hdelay(v4l2_std_id norm)
 {
-	return (norm & (V4L2_STD_MN & ~V4L2_STD_PAL_Nc)) ? 135 : 186;
+	if (norm & (V4L2_STD_NTSC | V4L2_STD_PAL_M))
+		return 135;
+
+	if (norm & V4L2_STD_PAL_Nc)
+		return 149;
+
+	return 186;
 }
 
 static inline unsigned int norm_vdelay(v4l2_std_id norm)
@@ -636,7 +648,7 @@ static inline unsigned int norm_fsc8(v4l2_std_id norm)
 	if (norm & V4L2_STD_PAL_M)
 		return 28604892;      // 3.575611 MHz
 
-	if (norm & (V4L2_STD_PAL_Nc))
+	if (norm & V4L2_STD_PAL_Nc)
 		return 28656448;      // 3.582056 MHz
 
 	if (norm & V4L2_STD_NTSC) // All NTSC/M and variants
@@ -841,8 +853,8 @@ static int set_tvaudio(struct cx88_core *core)
 	} else if (V4L2_STD_SECAM_DK & norm) {
 		core->tvaudio = WW_DK;
 
-	} else if ((V4L2_STD_NTSC_M & norm) ||
-		   (V4L2_STD_PAL_M  & norm)) {
+	} else if ((V4L2_STD_NTSC_M | V4L2_STD_PAL_M | V4L2_STD_PAL_Nc) &
+		   norm) {
 		core->tvaudio = WW_BTSC;
 
 	} else if (V4L2_STD_NTSC_M_JP & norm) {
-- 
2.30.2

