Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5E74DB3A6
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 15:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356877AbiCPOua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 10:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356873AbiCPOu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 10:50:29 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5F93A19C
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 07:49:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id p15so4710971ejc.7
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GrK4oI0aL0m0aF0KR8HpVMlkXWy3+EkhMGIps7oxctg=;
        b=eGepqlx2x6laABIAUKkLN3dFp0ta+pgrr3/Ky9x7h/Fuh/VJpoWIGjUCzdSK28wHP2
         X9ajg2mT4mxxYQTwccanODm6yqSnXiah3xCKj9nFI4nStuVnR4SsNwwYHYNeZROPbzfx
         g+Q5FcVdREaK8lktXHQfF8WCXRYAa1+U8QSi5m/ztm/aa29NRptbFkdBGPT9JfjYX2iq
         q/HVIk0thVBelkDwVrrVLP3eQjP5yn0r5eOVX3GJo2Ukzg78X/Mlz4D9CLKEdkvcPKiN
         0p2lIK7U3/MWhQQM/aaXI+KsPj3b3vMrSaef2ZabEhFr547jbv1i7/zaDla2wS+6riDM
         Fc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GrK4oI0aL0m0aF0KR8HpVMlkXWy3+EkhMGIps7oxctg=;
        b=Yglfvy43x9+PkCuINxxlQEBK6XwRhRu7Ca8ZLDC8xmwClEJGJxmDqbYU8Eb1JN9Fpg
         zsMuXyZchVrmtbafVizgyyGbpGghJY/j79sDLv/qQfn6/7SWwxbI3na4rc0yaqrpIZD6
         NlsdRJfLpApk/cY86T/MdrUnYyr3ueS+bGtSkjlPJHg8sSAcywQjiKMq9UxfTqh00wVD
         UqHRDDl5CTjVYdtCLjPgMWy//VMR/KMr4NfkcfOv1VDKqzOg2sVMV9g+pnsa6yHnu8+m
         FBat1QUfyTflXMy/dOkkqqHeG2rgY3sqJ+u9KeGvGFwnVABU1/xN6bqrUpPcprFOQmDZ
         wZyA==
X-Gm-Message-State: AOAM532qll6cB66/FAgGPS8hGVMGiM0HdQaQNkbQiJr/YkPV9MfrV2T/
        XbqiJ6w1iBcb/lW5DTLCVbHcQw==
X-Google-Smtp-Source: ABdhPJyMIMnxC8odPNy1UjAfJDtvUstvou20fBBVuhdUzeTNGd4u0R32pdbVrsqHZGAcBMpet/rAww==
X-Received: by 2002:a17:907:3d89:b0:6df:802d:df43 with SMTP id he9-20020a1709073d8900b006df802ddf43mr325627ejc.76.1647442151543;
        Wed, 16 Mar 2022 07:49:11 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5043.dip0.t-ipconnect.de. [84.172.80.67])
        by smtp.googlemail.com with ESMTPSA id f26-20020a50ee9a000000b004160c295356sm1084337edr.5.2022.03.16.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:49:11 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Add check that input interface and format are valid
Date:   Wed, 16 Mar 2022 15:48:39 +0100
Message-Id: <20220316144839.2312556-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a check to make sure the input interface (CSI-2 or parallel) allow
for the requested input bus format. If not inform the user and error out
rather then try to continue with incorrect settings.

While at it add the missing define for RGB666 that is not yet supported
in the driver but we can preemptively check for it in this context
already.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 8136bc75e7c47cdd..950cadd7c3133ba1 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -77,6 +77,7 @@
 
 /* Register bit fields for R-Car VIN */
 /* Video n Main Control Register bits */
+#define VNMC_INF_MASK		(7 << 16)
 #define VNMC_DPINE		(1 << 27) /* Gen3 specific */
 #define VNMC_SCLE		(1 << 26) /* Gen3 specific */
 #define VNMC_FOC		(1 << 21)
@@ -88,6 +89,7 @@
 #define VNMC_INF_RAW8		(4 << 16)
 #define VNMC_INF_YUV16		(5 << 16)
 #define VNMC_INF_RGB888		(6 << 16)
+#define VNMC_INF_RGB666		(7 << 16)
 #define VNMC_VUP		(1 << 10)
 #define VNMC_IM_ODD		(0 << 3)
 #define VNMC_IM_ODD_EVEN	(1 << 3)
@@ -707,6 +709,29 @@ static int rvin_setup(struct rvin_dev *vin)
 		break;
 	}
 
+	/* Make sure input interface and input format is valid. */
+	if (vin->info->model == RCAR_GEN3) {
+		switch (vnmc & VNMC_INF_MASK) {
+		case VNMC_INF_YUV8_BT656:
+		case VNMC_INF_YUV10_BT656:
+		case VNMC_INF_YUV16:
+		case VNMC_INF_RGB666:
+			if (vin->is_csi) {
+				vin_err(vin, "Invalid setting in MIPI CSI2\n");
+				return -EINVAL;
+			}
+			break;
+		case VNMC_INF_RAW8:
+			if (!vin->is_csi) {
+				vin_err(vin, "Invalid setting in Digital Pins\n");
+				return -EINVAL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
 	/* Enable VSYNC Field Toggle mode after one VSYNC input */
 	if (vin->info->model == RCAR_GEN3)
 		dmr2 = VNDMR2_FTEV;
-- 
2.35.1

