Return-Path: <linux-media+bounces-11571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533618C7A91
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA501F21412
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340F9B66C;
	Thu, 16 May 2024 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="kaAE8Rh0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018348F72
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877748; cv=none; b=icmjwbkmIUps47vuTu/y2zZVUhwlpDqLHefptcEmwXfNG2PfiYYzsUlwD3RaxD2PEfkb36eZMxLGjrpFMazzr0dm8y3NnEAc5s8cBKdk9PE6SzdlHZkPkLCTaCKNsCl/GnHyJAljzrF8d8DNWCcV1RNtVyaRzUjN67XkQsLm+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877748; c=relaxed/simple;
	bh=60NwqEee69KTXbzH/fh5URBQh6l1wVZHZOdyJ1W2NC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pJLRwxqAtn8Op9u502l4eqfzrToxUS134HCEUbZ/I6UoLvKNRsmCgZW+7fV6aN/O/cKVzJBAXuHXpfinS7pRxwcG+CexFK7xIk2VV/wqXtrE1Xg5LGcQOC8lVpTpz8EqdGZ0BJM00VcgGcfNFa1XTFgsnuHgk3v0GRTb3iVFzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=kaAE8Rh0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5a7d28555bso387627466b.1
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877745; x=1716482545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJNnG7TgN52luijARGVw5REoqyl9hIWVUHwP2Y1Nhyk=;
        b=kaAE8Rh07bhM5L4LuuwO0Mb5doWn729J9gVrB0xxM75O2gBXCHguXFxn9cUMLSdAE+
         sQ4VQ41/b5z7FYfVHAJS6rgEguG2awz8y7xUAlDt2/LOYGCk2uwgcq0L8cNOmm44DjKH
         NVPElWJ648A4/I/FuANm62EmK0VRJHQAnnIY2AlkY6NxHJ5iM4G3GPkl0m4qW+zpKQkL
         3UBGFg/Tds++hR8rpou7qxYoDpzXOBEqrPDWkqVh3BayuBzdkPI1Ur5hT6qWC5X0ytAp
         2NB6b1qQfymGa9C69NKC4TirMrE5d0XM5xhEikIzCKYe4YHMgXvAVCCsSmFby/kUkIKc
         mKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877745; x=1716482545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJNnG7TgN52luijARGVw5REoqyl9hIWVUHwP2Y1Nhyk=;
        b=Vv7ecosrydJTMmLwBOq4kwApbWUVZieUOiAwvFClo3GuA+USxA8uMPVkO5fWoq2bmH
         H6KyX/axFqKznOkGgDTykR1C1qLEvJHgJ33mpillcZKGiWZ+yiD3aAIFSrG84p0Pjj+s
         laF4KBYMEiQ3cZwlPwY+KeNBSES6Bw8A2aDC9Ud2wXkdVvCnSB4VMuHNPcm1ujagTmXH
         LlDs5IsRIk9I7Ozew0UlHtfZX2e149DtpMEpHkEsdKAKqhHpBuCIjyUsd2svQTQOyqLx
         6Pdgg0nhxE63P+PbzPN8Em/abtc4//IW6Y1eu15E01nCjf7fAf7cRKcuXqQSwa/DfrCt
         aapg==
X-Gm-Message-State: AOJu0YxsJfptmLARfeJGTnP52BfRzcY//Dnlialq4ogJx6DuCzg3lmJP
	g2jexdfZp2NCwBI/XPN5ayocNZNs3h0oPgKsqIKfCdeUVZtC/8mm6Sf8qKRv79td0CFbHPBIFOd
	o5sIx1thu7FROHljg0NMQCZLnLjYAe1bOHv/IFcbwVgfcqbV4rNVQ4sF6W01W4eEvMzR5niHHxk
	KV3TpEHoRKiAOPZ2ngfz37AnZyen8KxjScXjfcmJcU
X-Google-Smtp-Source: AGHT+IGucIXNIT7sYuxR5kDX1N/vOtgMfoW9QG55n+j2IU1v+FyqavjxAqp9fJqWlKKx4Pm4Z/9Nlg==
X-Received: by 2002:a17:906:a408:b0:a59:ba2b:5921 with SMTP id a640c23a62f3a-a5a2d67f991mr1233934066b.72.1715877745516;
        Thu, 16 May 2024 09:42:25 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdd7f8ea1sm152730466b.109.2024.05.16.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:25 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 08/10] media: uapi: Add mlx7502x header file
Date: Thu, 16 May 2024 19:41:53 +0300
Message-Id: <50375dfca35880bc8f6ebb47cfac92c738f4f192.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1715871189.git.vkh@melexis.com>
References: <cover.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 2252063593bf..55d199942636 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	dw100
 	imx-uapi
 	max2175
+	mlx7502x
 	npcm-video
 	omap3isp-uapi
 	st-vgxy61
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
index de46c28bb3f2..8fd282ec18dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14017,7 +14017,9 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
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


