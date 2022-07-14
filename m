Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07485746D9
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 10:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbiGNIfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 04:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbiGNIfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 04:35:03 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12473AE4D
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:02 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l68so569746wml.3
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uo4btinoI/B3Oxma9rI36uhb7Ptz5JdqTWOAZagK6Q=;
        b=n0uiPAnGD4zn7o7qQTEXyEBUqvniTDLxZw6aaH1F6CryitYsNHq0lDNAQcphqQocFF
         8gBj8CF/Ya0WDx3xMykvtEp+g/G5VzHrkx9P2ZREPqDzC913p84/8NDbaAiEozQjZdEN
         496BCj7EsVgKDmt4NyJ7HHNJV4oJZoD2XY4XYpAj2PhjNNsHuLq2k4xdpvph4zy1DPd8
         7g7oMm0OP57y7vjxCrRSHQ9hr0yhyiSNuPbu1vSAlpzn16memXSy7gptR2mXK8XR24b/
         +nWL5R8mEXjMiy+jxjN/KyAxZdf7+5nMS0dLtE/LBpQ2RSlZvqDgDWt6pRMtS9MrnIam
         hD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uo4btinoI/B3Oxma9rI36uhb7Ptz5JdqTWOAZagK6Q=;
        b=O2lQNlBEAmqZeDkcdZ+A3pXv+NUo8L6A7ck5h7U2ANCxh0nPiWuxYELaMNw3NWphiv
         kt2fyaG94/alCdQckNubE3PglwdHqKnRoloYtAjoKbUOUa16wwUjIuxrTFvk7mXNWsFE
         Yg08JXBCtCIzsbWSWrPZDsEBpEsfrbSqx+/izxP4B6JguCBRBvZAncal9R6fd9dA8ot9
         ddDneQmbaiecCk8e7CD5yR1V7WTwYPaFw7HKFe/YbRkZiPRsn2EiA0/boLLNHC8ZIgZ4
         KGjQ8drLfU0VbZKpHQxXGpcxvLlkXC6PhUKK3vT9UTbEfEsqvWsP8Jzj5npujTISeplg
         DNcg==
X-Gm-Message-State: AJIora9U3LjKf7VGBXnv+ZoOjw2dnK4BS0ePRs9TkzjzYwl3P+qDK1bl
        Pm3wpEjnlvZS6wFDvLURXe6p3tVpkIue55Vo00DzO0ccLmMBLiL6fKPeGqvT1lYw2kBDa61YkGD
        WfaKAo630SXkuNCzdAodMsGLRfwPQ02cnrRP86y1Cmfgw8JCJZaAgCcLLtzUE0EUse9YYqntY
X-Google-Smtp-Source: AGRyM1vINGKjBbdprwmH9jO5RkRBwYx/Tu/K8z3YldJRDbbJiIBDjTbMOlTNNgo16TpEa7s1+uOT4Q==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3b4b:9022 with SMTP id d14-20020a05600c34ce00b003a03b4b9022mr7987062wmq.66.1657787702154;
        Thu, 14 Jul 2022 01:35:02 -0700 (PDT)
Received: from melexis ([194.44.50.167])
        by smtp.gmail.com with ESMTPSA id b5-20020adff905000000b0021d66cf9547sm1121328wrr.0.2022.07.14.01.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 01:35:01 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org
Cc:     Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
Date:   Thu, 14 Jul 2022 11:34:46 +0300
Message-Id: <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657786765.git.vkh@melexis.com>
References: <cover.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define user controls for mlx7502x driver and update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 MAINTAINERS                   |  7 +++++++
 include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/uapi/linux/mlx7502x.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ef3ec334fae9..1a68d888ee14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12673,6 +12673,13 @@ S:	Supported
 W:	http://www.melexis.com
 F:	drivers/iio/temperature/mlx90632.c
 
+MELEXIS MLX7502X DRIVER
+M:	Volodymyr Kharuk <vkh@melexis.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+W:	http://www.melexis.com
+F:	include/uapi/linux/mlx7502x.h
+
 MELFAS MIP4 TOUCHSCREEN DRIVER
 M:	Sangwon Jee <jeesw@melfas.com>
 S:	Supported
diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
new file mode 100644
index 000000000000..44386f3d6f5a
--- /dev/null
+++ b/include/uapi/linux/mlx7502x.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Melexis 7502x ToF cameras driver.
+ *
+ * Copyright (C) 2021 Melexis N.V.
+ *
+ */
+
+#ifndef __UAPI_MLX7502X_H_
+#define __UAPI_MLX7502X_H_
+
+#include <linux/v4l2-controls.h>
+
+/* number of phases per frame: 1..8 */
+#define V4L2_CID_MLX7502X_PHASE_NUMBER  (V4L2_CID_USER_MLX7502X_BASE + 0)
+/* shift of each phase in frame, this is an array of 8 elements, each 16bits */
+#define V4L2_CID_MLX7502X_PHASE_SEQ	(V4L2_CID_USER_MLX7502X_BASE + 1)
+/* frequency modulation in MHz */
+#define V4L2_CID_MLX7502X_FMOD		(V4L2_CID_USER_MLX7502X_BASE + 2)
+/* time integration of each phase in us */
+#define V4L2_CID_MLX7502X_TINT		(V4L2_CID_USER_MLX7502X_BASE + 3)
+/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
+#define V4L2_CID_MLX7502X_TRIGGER_MODE	(V4L2_CID_USER_MLX7502X_BASE + 4)
+/* in case sw or hw trigger mode is used */
+#define V4L2_CID_MLX7502X_TRIGGER	(V4L2_CID_USER_MLX7502X_BASE + 5)
+/* this is related to the taps in ToF cameras, usually A minus B is the best option */
+#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 6)
+/* ToF camers has its own temperature sensor, which can be read out only during streaming */
+#define V4L2_CID_MLX7502X_TEMPERATURE	(V4L2_CID_USER_MLX7502X_BASE + 7)
+
+#endif /* __UAPI_MLX7502X_H_ */
-- 
BR,
Volodymyr Kharuk

