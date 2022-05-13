Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12872526946
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 20:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383315AbiEMS3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 14:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383154AbiEMS3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 14:29:07 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934821E3DF
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:05 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id v65so11078560oig.10
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FebFG50y/hqQs8Aal2+HUzGUexEDNc7nBQTBDQlxscI=;
        b=BjfQDaB1gEyQ1pXnGhHohkS33y8DdGkGa3xSKJXbH+ynEvxIJ8YyQ+ytAhiJo36aMc
         3xIpZNB7qoxAt3x4cKODMs4tmeDrGPI/XNory2ndKRLz5aqIAjqNIQJ7mcctJmI4aiJm
         9I8prk98Hk5N2do/qjttFjE2WNz5Nl7wPPvE37JNkvb8B8t0jTftkqIxp5f8VihCbbFs
         ByizAjp5gkN/vfVbx169K2o9cn4CzW9R9EY6TiJ+grGQLcmnYAnGAMFChaiRTXc3WVUe
         C5f21WzE0fBeq3xJ/NmkUyVyr6ucjRdQDgNNhFw/NBjc4BCqIe17+bIMVDwbnTwX3K8O
         FP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FebFG50y/hqQs8Aal2+HUzGUexEDNc7nBQTBDQlxscI=;
        b=eA9uikYmyfPhdLjM/EAg3TJAODgfJFAgPTTW+li7yAONGWiJ6H1EVVkA60sftkShwJ
         hQbvJH079ZTmtnb5da6LUpKFU5ea8uEBtZcqsov0RZs9I+ZDA+A/Pe2QM9dUBdFE0/1Y
         E3VgpOsLgtniaaQDk0F6TiwPSb8iK4UgpXcn/Uou+fsCYqCwsAclGSeprwwPBMqbFvio
         u5fBgsEhBwRSe0i8vUEVmgNOG9kwpdqTGY6OhxK1P0sHju647gong7DvZME24g7Hdvdp
         uHouW4u969AmY0A4IGtFMn7RgiPbGXxElt57AeOXeKeWj/ZzJqobduvdGMrNu16eqTj9
         BIvQ==
X-Gm-Message-State: AOAM531MMzq+6UyFJmbUl5l4ra7pNp2/z4hmkqowtZf1j5vC5+ClY5ca
        YdTx/G5V9Wac3St/AzgfrDc=
X-Google-Smtp-Source: ABdhPJyclogfR5MGQlfNinAnO/L2u0ysXIFbLeS4S2//JAPJPIw66GGQhG6SwNCudY8ogFtiABEVfw==
X-Received: by 2002:a05:6808:13d2:b0:328:a194:1d0e with SMTP id d18-20020a05680813d200b00328a1941d0emr8162385oiw.68.1652466544958;
        Fri, 13 May 2022 11:29:04 -0700 (PDT)
Received: from local.lan ([190.1.30.36])
        by smtp.gmail.com with ESMTPSA id c24-20020a9d6858000000b00606ad72bdcbsm1234719oto.38.2022.05.13.11.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 11:29:04 -0700 (PDT)
From:   Jorge Maidana <jorgem.linux@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Jorge Maidana <jorgem.linux@gmail.com>
Subject: [PATCH 2/2] media: usbtv: Add PAL-Nc standard
Date:   Fri, 13 May 2022 15:29:22 -0300
Message-Id: <20220513182922.4882-3-jorgem.linux@gmail.com>
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

Add PAL-Nc support to usbtv, the corresponding register value "0x00fe"
comes from the Windows driver "Active Development Co., Ltd. v2.1.1.2".

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 5 ++++-
 drivers/media/usb/usbtv/usbtv.h       | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index a714ad77c..1e30e0595 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -136,6 +136,8 @@ static uint16_t usbtv_norm_to_16f_reg(v4l2_std_id norm)
 		return 0x00a8;
 	if (norm & (V4L2_STD_PAL_M | V4L2_STD_PAL_60))
 		return 0x00bc;
+	if (norm & V4L2_STD_PAL_Nc)
+		return 0x00fe;
 	/* Fallback to automatic detection for other standards */
 	return 0x0000;
 }
@@ -241,7 +243,8 @@ static int usbtv_select_norm(struct usbtv *usbtv, v4l2_std_id norm)
 		static const v4l2_std_id ntsc_mask =
 			V4L2_STD_NTSC | V4L2_STD_NTSC_443;
 		static const v4l2_std_id pal_mask =
-			V4L2_STD_PAL | V4L2_STD_PAL_60 | V4L2_STD_PAL_M;
+			V4L2_STD_PAL | V4L2_STD_PAL_60 | V4L2_STD_PAL_M |
+			V4L2_STD_PAL_Nc;
 
 		if (norm & ntsc_mask)
 			ret = usbtv_set_regs(usbtv, ntsc, ARRAY_SIZE(ntsc));
diff --git a/drivers/media/usb/usbtv/usbtv.h b/drivers/media/usb/usbtv/usbtv.h
index 77a368e90..b9fa7c008 100644
--- a/drivers/media/usb/usbtv/usbtv.h
+++ b/drivers/media/usb/usbtv/usbtv.h
@@ -68,7 +68,8 @@
 #define USBTV_ODD(chunk)	((be32_to_cpu(chunk[0]) & 0x0000f000) >> 15)
 #define USBTV_CHUNK_NO(chunk)	(be32_to_cpu(chunk[0]) & 0x00000fff)
 
-#define USBTV_TV_STD  (V4L2_STD_525_60 | V4L2_STD_PAL | V4L2_STD_SECAM)
+#define USBTV_TV_STD		(V4L2_STD_525_60 | V4L2_STD_PAL | \
+				 V4L2_STD_PAL_Nc | V4L2_STD_SECAM)
 
 /* parameters for supported TV norms */
 struct usbtv_norm_params {
-- 
2.30.2

