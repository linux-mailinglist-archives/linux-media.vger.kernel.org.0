Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8490B640A41
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbiLBQIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiLBQH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:58 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CB94877E
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:57 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id b2so12598974eja.7
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MIUkKA2KYBfUGIn+7D33Xcyk/nc4bcCxskkGZCe1Ew=;
        b=mW6ereONlW40+RE74hjWo72srMOd1GojolYmJDXHyrJB2D19pSedyRVMs5D2knk/+o
         J7n02CPrC8TV8crQi+ZsuYvosUb95fOuDtbN+xZqSbnN5qV5JZCCGmxbgyGuesbbhfRF
         6o3g7o2mZbyC05+LHlp+4K6aYg3U9cB8dIFS0ikt/SdobdPHyjI/bBNsZlbcthn+MYRZ
         3EWdJUts7whd/UG1qzZTZsSch4s080pbfJO8kj1iMoEvMm0bn3Q1PvezGvgdJ6Va0uJy
         VGKjv9dQS06Ta6QMasi5FVxqQpAG17lhuIfHTaxDaNMy9oH6DdWJ7SnOM72jn+kSiNSp
         4vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MIUkKA2KYBfUGIn+7D33Xcyk/nc4bcCxskkGZCe1Ew=;
        b=EOAWvWT72PRjzcmPiZCtpnfRXRwLdrYHkumEtys9ukU1glGiEaHiGsYWtw+EcCCPhi
         Fz+FNbdg/q7dZ0kfGBXbvXjbddy515fbIQrcM2VlE6Ruq9yfi0WRFwAWThgueyilhSmj
         +13x5kU1zuU0FGVnNDdqd0JumVDUP/6sMl/8CkHz9E7+zsYAjiAgEdoiQb5D6n7vX1yw
         XeqSOZcZFyXvo00vhtW2IavrlGXSRut943Zmx7rso3t/JlSPS8JUakmdF0LMLOoD2hfS
         iJEhAsAbYPN08Lp7H9OPOT487N/kKsci33Hz6rQ0412V0oRdulvDsmGUBD9tJBCIPEdW
         3q0g==
X-Gm-Message-State: ANoB5pk8zHA/l9VymtB5BNkQ0gZ2iJJ5+NMKkgrmtUWxhipgxrNWd1YC
        fQtaYyJuJKG98GQEVfVrMsQ85JzyMD2D4LrrMc4jqUbUecAq67n/q8PujRuC/qcPfKpau7XlCsP
        b8rcMgO51LuNl3ODsM1Ds00YwpSO1E+W8ZcYudc0JybDBUGRvNChAOx2uiHbGKAmq7PVMm1SiLL
        8=
X-Google-Smtp-Source: AA0mqf6ZMRAO70UbtwrdqCFtlqy6KFee3MDEFDlIg+gB3iwV1z+KbyyNzC3DaS39w8Y/+Z/++/TUhg==
X-Received: by 2002:a17:907:8b9b:b0:7b7:90c1:8263 with SMTP id tb27-20020a1709078b9b00b007b790c18263mr10353736ejc.604.1669997276996;
        Fri, 02 Dec 2022 08:07:56 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906285a00b007af0f0d2249sm3176698ejc.52.2022.12.02.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:56 -0800 (PST)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v4 6/8] media: uapi: Add mlx7502x header file
Date:   Fri,  2 Dec 2022 18:07:36 +0200
Message-Id: <50d0e30ae32162d56f0a93ab52e7f9338de497cb.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define user controls for mlx7502x driver, add its documentation and
update MAINTAINERS

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../userspace-api/media/drivers/mlx7502x.rst  | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 include/uapi/linux/mlx7502x.h                 | 28 +++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
 create mode 100644 include/uapi/linux/mlx7502x.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 46a494e00b72..0eb707516b23 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -38,5 +38,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	max2175
 	meye-uapi
+	mlx7502x
 	omap3isp-uapi
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/mlx7502x.rst b/Documentation/userspace-api/media/drivers/mlx7502x.rst
new file mode 100644
index 000000000000..d68506c09f84
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/mlx7502x.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Melexis mlx7502x ToF camera sensor driver
+=========================================
+
+The mlx7502x driver implements the following driver-specific controls:
+
+``V4L2_CID_MLX7502X_OUTPUT_MODE (menu)``
+----------------------------------------
+	The sensor has two taps, which gather reflected light: A and B.
+	The control sets the way data should be put in a buffer. The most
+	common output mode is A-B which provides the best sunlight robustness.
+
+.. flat-table::
+	:header-rows:  0
+	:stub-columns: 0
+	:widths:       1 4
+
+	* - ``V4L2_MLX7502X_OUTPUT_MODE_A_MINUS_B``
+	  - tap A minus tap B
+	* - ``V4L2_MLX7502X_OUTPUT_MODE_A_PLUS_B``
+	  - tap A plus tap B
+	* - ``V4L2_MLX7502X_OUTPUT_MODE_A``
+	  - only tap A
+	* - ``V4L2_MLX7502X_OUTPUT_MODE_B``
+	  - only tap B
+	* - ``V4L2_MLX7502X_OUTPUT_MODE_A_AND_B``
+	  - tap A and tap B (this config will change PAD format)
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f9072f3b1da..32e49523e9c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13116,7 +13116,9 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://www.melexis.com
+F:	Documentation/userspace-api/media/drivers/mlx7502x.rst
 F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
+F:	include/uapi/linux/mlx7502x.h
 
 MELFAS MIP4 TOUCHSCREEN DRIVER
 M:	Sangwon Jee <jeesw@melfas.com>
diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
new file mode 100644
index 000000000000..80e9317ff0fc
--- /dev/null
+++ b/include/uapi/linux/mlx7502x.h
@@ -0,0 +1,28 @@
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
+/*
+ * this is related to the taps in ToF cameras,
+ * usually A minus B is the best option
+ */
+enum v4l2_mlx7502x_output_mode {
+	V4L2_MLX7502X_OUTPUT_MODE_A_MINUS_B = 0,
+	V4L2_MLX7502X_OUTPUT_MODE_A_PLUS_B,
+	V4L2_MLX7502X_OUTPUT_MODE_A,
+	V4L2_MLX7502X_OUTPUT_MODE_B,
+	V4L2_MLX7502X_OUTPUT_MODE_A_AND_B, /* output frame size doubles */
+};
+
+#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 0)
+
+#endif /* __UAPI_MLX7502X_H_ */
-- 
BR,
Volodymyr Kharuk

