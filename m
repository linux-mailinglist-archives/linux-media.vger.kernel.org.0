Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C38C55223D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 18:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240993AbiFTQ11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 12:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242269AbiFTQZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 12:25:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE941D332
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t24so5851387lfr.4
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=ySPGydUYmYKXQwPKKpP01OT4oH+rs1kkzUh2wdidyGE=;
        b=CrVruLzUjpHAiINNyReuybycV0rYsktwpcjnKrJFOMzLGNczDxmqoLnMIHgv0bnNiY
         JmxiGMUicTSio+kpJfMDwiZxdszoh/L5eC72fLdR0zM9OnDhGqvEqrC6Hpg9FhSeShgM
         jvvmTm2IdYT+03K19/XCuF9oMMumtSICVXnvMdmf/+kgdxz++qZ28ckCHZ0pmLv/b8eo
         6ClYm7zVMbVhrtRkKxYpxSGsAsFj2F9pEOa9M7+A5+oYj8i5owjRgylV6cWalN4KOWbE
         jphKVBv9HSd5/LezzhpiBF1pODqGotxVDzPwxA4nQnhwkJBM62PV3MKylX5HCdYhP6jE
         BPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=ySPGydUYmYKXQwPKKpP01OT4oH+rs1kkzUh2wdidyGE=;
        b=sz8GAQZI9rh6XNGXxDHiJ87Om/T6I9EBDkisU/QIIYvxBfb2eDj1311/cJexKVKi/b
         DgyYT/Veu4qdiyZm4gL7Iu4QZUOiYeWkM1Bp/hhVs6lzrwYMOxG8GmhBrbgHYDm6/FUI
         jWtKyHKcbkLkyvsSkMf3JKqHPm2SMeKFfrRx5fKlqrYA6uubXOp8prrz+Oy5pNUl+X9V
         kdfE4MfFd5RdueVYFp32EKY9bwhnVGvggCrU83fqDyEjO8wMHoWDgdOo/0I5hQcTW0D8
         cGXKB2tgFpsVMx0hnB9+JUlFgtr13tkTqV88GWYlSmtWazI9pFjzblkb6yTrap+Y1tez
         VEMQ==
X-Gm-Message-State: AJIora+EwepU0bMiEA+fEiUc2jFnIEGdjaFUzzch5coBwkk6e/9pGf8j
        xF7tq1gOAAWbczxYMurIMarKO9TGEi88T9LShUK2av3Ad4h3q41jPnyLxMhYie0VgdGv5lmOpnR
        2xikmaF227r1KFvtyu+D1zAyrOnLYkaFK8BQ4uqTBeMNoNujBloMtPwhJrdHEDhVAag+stC4v
X-Google-Smtp-Source: AGRyM1s4FCl+gM3XIci2dE+pr+YtrWJqQTr9p505jUlgtzNxx7L9fWDDlPCC9VaHuoS2iBLD6gD9jQ==
X-Received: by 2002:a05:6512:aca:b0:47f:7707:3e19 with SMTP id n10-20020a0565120aca00b0047f77073e19mr1714197lfu.135.1655742325516;
        Mon, 20 Jun 2022 09:25:25 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id q21-20020a056512211500b0047f65b60323sm845458lfr.3.2022.06.20.09.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 09:25:25 -0700 (PDT)
Date:   Mon, 20 Jun 2022 19:25:23 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     linux-media@vger.kernel.org, vkh@melexis.com, ays@melexis.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        kieran.bingham+renesas@ideasonboard.com, devicetree@vger.kernel.org
Subject: [PATCH 4/6] media: uapi: Add mlx7502x header file
Message-ID: <20220620162523.GA14039@vkh-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Volodymyr Kharuk <vkh@melexis.com>
To: linux-media@vger.kernel.org
Cc: Volodymyr Kharuk <vkh@melexis.com>,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] media: uapi: Add mlx7502x header file
Date: Mon, 20 Jun 2022 19:24:35 +0300
Message-Id: <edc28b2f4ce0c091aee0a776a54d26e2b9bd94ef.1655738299.git.vkh@melexis.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655738299.git.vkh@melexis.com>
References: <cover.1655738299.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define user controls for mlx7502x driver and update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 MAINTAINERS                   |  7 +++++++
 include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/uapi/linux/mlx7502x.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cf9842d9233..6b74de976e90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12671,6 +12671,13 @@ S:	Supported
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
index 000000000000..0ebd5d8a03d1
--- /dev/null
+++ b/include/uapi/linux/mlx7502x.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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

