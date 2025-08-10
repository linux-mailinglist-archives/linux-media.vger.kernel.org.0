Return-Path: <linux-media+bounces-39365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF2B1FC9C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 00:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26C337A9BAC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 22:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75252BE020;
	Sun, 10 Aug 2025 22:10:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B0D20D4FF;
	Sun, 10 Aug 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863814; cv=none; b=pg8c3ZI2ygedihH5gMnOn148bMJ6ZMjwuwYkD/T/M5mLc0LJGEunwD/178xydyIJ5qEflvL1ezKBFgsWzZC7CVgUHaFsose+eM4teij7UhzG+VOXXxyMiUnxPOfymPeV5v6wlFasbqOtAGjtx5UwWlSyJ7XH7dz8Cw3NFmGFO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863814; c=relaxed/simple;
	bh=zfXiCN4Sc5sxH2sEYuITnhrGRhNh0qIrkLrr9AP7o74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LplgZiO92V0fVlTNFtDPWWC7nlPyxb4pRiubZV2h1qICrRh/JADEG5Xyc05gf/RPltL9h2x4ZbMCHYjvgP5fmxaHoAnNorKESpLsEvhuax56MK9wsfAmvYy0VuytAJznt3BpNGa2YsvFA2JadSoG9LPoqxkEB9FGvYwhFX9xJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso2751093a12.2;
        Sun, 10 Aug 2025 15:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863812; x=1755468612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uihwsc/0/XJ+PKMiZipIM8BQRMntIvpw4hWPIZoG7Ek=;
        b=IRhhc6LKCFkQut6Byxq/BVKDzcwG1xAGIrWaWlc+KARPQdgDniGB3mBdToN5sjbQa3
         EXMTZb4IyR4O8UwZ6aMa6GR0OO9Q94c3hc7l/Zhm2xaoj39n6oGdkWLqpFjNCgLPEvz9
         Cr3gLIK16qjW789nJnEHHrJZKsVizqVC40Zdy4iTb2YQjbKSdiIlN373//hIJGaexA66
         ni0D5r90b9i1N5Rf8KjERo611thZBupgl+sg3uv2m5r/a+EvY5+MdEOrkku7KzmIIbG+
         7McmsIjpvPFwtgBoy0zO2H3A8yRgal09ulEJT2jENS7jhzzKVHXfgp+rLELzyFjqZQof
         yW0w==
X-Forwarded-Encrypted: i=1; AJvYcCUWaGcfF9n1KZWLh9gEZdhzU18hMZ8mJSfNKSm637//ZOmTUCR4XtA9A9fsOVIXUNe6tubjoBgpWLCTFYJS@vger.kernel.org, AJvYcCXmpQuEER2I0a5nNx6M9Yym5TiVOFh9irS3SsPoRKbzp8+oJTUPQvUrQKdLoPps+xyTSPrqitWpv4Qx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0AgMGsMWk5LFwu6kW/efQka+8mzyKFaxUqLjVATRF7NaXEm8O
	VPIOI7g0xxxVB+7POlhHGElA9iHS/IeTVR0OYG/3wvFWBWoA1a4gABSZ
X-Gm-Gg: ASbGncsZkcjudo1cajMPqgAuNxnaQhhbgW7RdPNOAjJezIIai1+4hcO1EQj+OXNRIGe
	GT394q2+y1zgbcdD4W4+vQjknKlclhy6oecdM/VP2gzsemOBaVqU14hLjvFYxyMdnxm86vR3V+o
	d1JYn6K3tdBk+xCGrRSFV/p7otmi37yvGFyLgjRK0aFMORRWL/Ph1ASkgLfyAT0/jLhG/TursLT
	UMqpBRR7RsMO+Tk5xFRc7BxkxN4WjSQWiNnM8FotHjFym3FILOlxj2/b1vxmq5GENIeRw0L2QRm
	XOFYVjo2mHOHG8JWIGib3yIM9kwyZ2cxcUHWSYozE1yhMw8oyIuNF2bQybhhgoumgUjLIOZwnYG
	Y4hULe217c9X89GXvsSj42L9rEXgYxtQFYzHjG8um6hyimG5wbrzxoxQ0S/Bmbk/+voM=
X-Google-Smtp-Source: AGHT+IFCTQC9SdRJ5qPCgpZfyHqD6TscoCidyWxoSvNsuIOKQ2B/LiU7H3kp23xxyw9/Oo+plrMSZQ==
X-Received: by 2002:a17:90b:3ec5:b0:321:27d5:eaf1 with SMTP id 98e67ed59e1d1-32183c45f17mr13469365a91.25.1754863812200;
        Sun, 10 Aug 2025 15:10:12 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] media: uapi: Add custom IMX585 control IDs
Date: Sun, 10 Aug 2025 23:09:19 +0100
Message-Id: <20250810220921.14307-3-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reserve a private control ID block and define the helper enums
used by the upcoming IMX585 driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 MAINTAINERS                        |  1 +
 include/uapi/linux/imx585.h        | 20 ++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h |  6 ++++++
 3 files changed, 27 insertions(+)
 create mode 100644 include/uapi/linux/imx585.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ef04ee4ec..e6aeac0c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	include/uapi/linux/imx585.h
 
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
diff --git a/include/uapi/linux/imx585.h b/include/uapi/linux/imx585.h
new file mode 100644
index 000000000..30e12df88
--- /dev/null
+++ b/include/uapi/linux/imx585.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * IMX585 V4L2 controls user space header file.
+ *
+ */
+
+#ifndef __UAPI_IMX585_H_
+#define __UAPI_IMX585_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_IMX585_HDR_DATASEL_TH   (V4L2_CID_USER_IMX585_BASE + 0)
+#define V4L2_CID_IMX585_HDR_DATASEL_BK   (V4L2_CID_USER_IMX585_BASE + 1)
+#define V4L2_CID_IMX585_HDR_GRAD_TH      (V4L2_CID_USER_IMX585_BASE + 2)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_L  (V4L2_CID_USER_IMX585_BASE + 3)
+#define V4L2_CID_IMX585_HDR_GRAD_COMP_H  (V4L2_CID_USER_IMX585_BASE + 4)
+#define V4L2_CID_IMX585_HDR_GAIN         (V4L2_CID_USER_IMX585_BASE + 5)
+#define V4L2_CID_IMX585_HCG_GAIN         (V4L2_CID_USER_IMX585_BASE + 6)
+
+#endif /* __UAPI_IMX585_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9..091a044e5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -228,6 +228,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
 
+/*
+ * The base for IMX585 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_IMX585_BASE               (V4L2_CID_USER_BASE + 0x1230)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.39.5


