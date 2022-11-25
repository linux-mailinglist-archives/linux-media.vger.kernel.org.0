Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42AFD638B49
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 14:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiKYNes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 08:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiKYNep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 08:34:45 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B0527CFB
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 05:34:39 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id cw8so282466ejb.10
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0guOMRRiU07S3RCRZZ/cRWsp96Z6dhNpDXoYbOXm+g=;
        b=ahJYtAdDLUM+n1hPKrTLhTGAfZbGOD3xjHkwQBycyRtxueoLFUOn48XBdu+c40jA/6
         r9QM8ZrRFLWbIiXKAt4pUECs28dfHpB26cDUbW9JnAugrlALb4UgxEJGlaMozIqM5U0Q
         p8ub1JuVQxZSZ/OonG5lISxn8qiKQz8wJjN3H7261Cr8kcmtrVnVkYoOvMTg4yjoho0P
         6kSFhoC5OPpSJO17O686RWkq1RzC6KnF9JGNLwdyRUZByP3b3XZODcwtpErQpC57B8DA
         OK66TUS8NcfWmzN3yRIgjpDviwTvI+01CPjHHqkOTCIrzyc7EUjPriCh7R9Yq/xqz+We
         TP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0guOMRRiU07S3RCRZZ/cRWsp96Z6dhNpDXoYbOXm+g=;
        b=zsaB0j8JV7YsDo7tZIuAgToDUZ6HoeoEdVYyzh/uMYTUyzaYTBNZZBXRuLQ6buc6xt
         ot+XwQi1+WIMsA655LOu1ln5pCCIX7R2QyHbZdmClcJS1AHIxztnWjC4mmY/7ovB1RRf
         A2tLzsj78Zjxn8xT36CQvdyzPgGrh3czZBib4MN1PFzidPBiozxzFHkH+9Pw7NSsrPV1
         mLedi9FNyij3Tkn70kFcLo6FHMIrA5DPvOiDZP7LZ8sU+oh/eEYP4HKcpkJVpNFEkog1
         q7S7v85hXPYfPVhz3Dr8YPeLru37gOAXKesiderPNOAhpGPCcfLADxYqEyniPzvEsGtB
         NFAw==
X-Gm-Message-State: ANoB5pntE0rqrUSNQmMweGxR3XjtZz57KcJlQAT5hztZcgRkNQcbvq/N
        dnxjAGcU+PdSy5qnuwK+Bknq+9OfughKchPM7cVisvYOAv7H4L6/S2pqH7RWrd/BJQ9vPdaWXBR
        XZ1Ba56PZa7Ruqheu0rIGRQAEaFfqAPEKRW2RCEdI8KrczKpLDsRdX2i1PJ7QpS3EjOKMGYTf
X-Google-Smtp-Source: AA0mqf6DCPpDHDCWR7DTpsK5Xjz8JfSjT4rihB0XHjie7PwbaFHPh/vaJpYLFMkTCPIXmsz7Y5DoTw==
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id m4-20020a17090679c400b00778e3e28311mr17715291ejo.342.1669383278745;
        Fri, 25 Nov 2022 05:34:38 -0800 (PST)
Received: from melexis ([2a02:2378:1085:b41d:1fad:f315:d8eb:738b])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7d88d000000b0045cf4f72b04sm1768648edq.94.2022.11.25.05.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:34:38 -0800 (PST)
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
Subject: [PATCH v3 6/8] media: uapi: Add mlx7502x header file
Date:   Fri, 25 Nov 2022 15:34:09 +0200
Message-Id: <cc798c882c35ef135179fba869d3f98507edde50.1669381013.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669381013.git.vkh@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
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
 include/uapi/linux/mlx7502x.h                 | 20 +++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
 create mode 100644 include/uapi/linux/mlx7502x.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 32f82aed47d9..f49e1b64c256 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -37,5 +37,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	max2175
 	meye-uapi
+	mlx7502x
 	omap3isp-uapi
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/mlx7502x.rst b/Documentation/userspace-api/media/drivers/mlx7502x.rst
new file mode 100644
index 000000000000..6f4874ec010d
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
+	* - ``(0)``
+	  - A minus B
+	* - ``(1)``
+	  - A plus B
+	* - ``(2)``
+	  - only A
+	* - ``(3)``
+	  - only B
+	* - ``(4)``
+	  - A and B (this config will change PAD format)
diff --git a/MAINTAINERS b/MAINTAINERS
index a2bc2ce53056..0a6dda8da6bc 100644
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
index 000000000000..68014f550ed2
--- /dev/null
+++ b/include/uapi/linux/mlx7502x.h
@@ -0,0 +1,20 @@
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
+#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 0)
+
+#endif /* __UAPI_MLX7502X_H_ */
-- 
BR,
Volodymyr Kharuk

