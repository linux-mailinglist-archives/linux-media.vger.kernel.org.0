Return-Path: <linux-media+bounces-36506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3FAF0BC7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3143A7B86
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCBF22331E;
	Wed,  2 Jul 2025 06:38:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20ED2288E3;
	Wed,  2 Jul 2025 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438334; cv=none; b=JkhoTv3aj/DnFz042FBLEJ8iSIJhPPveNsAmoDpwYeF4WERsEpMxftMp3juVLlnQuNQuiS/5Q2RCjHGgcRxk5djslBc/QRdjq2RUD0FwYu/X/mAq1dB13c8FzhSxaMpsAOb3fjnylDoWVS2CdI7ac1D2xVo4hVM1JWXzBKu3elE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438334; c=relaxed/simple;
	bh=fXb0I7IfMOyzonYIlW1dn/b+rY/r3WcXXrPbiFSCh1Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T7ljE3g0XBSgEBTrr9jX70OeEHOTb1P1CEbA3qK5u3vhgRu6T9Z98eATGgLXoNjxpQa4IM7gHEL2UX4IQHlnUJagQRr4igaOx6f5M4RxnMuqAwNA72roZIFWkXFGrj9sygXxWC6mS/6YwaBiWHkRt8lDsIDmpBciIS3kPalUkSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b34a71d9208so3117058a12.3;
        Tue, 01 Jul 2025 23:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438332; x=1752043132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOKZQZFJxlzIK2NfeOqsvol6QqRTu35rT3af2i6E6xs=;
        b=CYf1y2cwSoNlh/lIJQPkMKl9NAY8tXv4iOdJ5TZKBeyi6mKXYvrzJzpo4EmqObaLD8
         tYsU3l6zk0HD2FoOAKKAjeDGuqMjPotw8alvL5V5Gkx5dMYz2g6DSKLQvnLppfk4QoOa
         Zbvrga7HoljCWbsfp9oXeuTj2vs1kGbqUuQqlm4TbyDJoElxmDDEC4TVMSS4M63qCjZV
         tdPRIhaE7F0yMmuDHfs57F7bpX5Cuzp8izlbXVG8ejQkgNhGBqz3aHR1VqOAtzxvKz4O
         wFbZ1vB98/WWfuU/4bI74yC9OEd/JShmHmdW0TlyDA/l+lVyRItPM653/wHlBaz751ky
         zVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS6SphcUT0TB0m61TVYVFue444IH0Or5hvDNfHCPB9+aU2f64PV8hNcC4Eq1uExROwhN1aNWsqR3k3Hss=@vger.kernel.org, AJvYcCWiS7vwZ5CWtTw1aMf32O9ptO3BrdaBfRSo0QTYuNlWgTpUIwyHUhyAvD21iTFgrV3Yro/A1K9o/EG0j4ld@vger.kernel.org, AJvYcCXtkYjJtdNPoJb9RGoMvQqdr0F6N4hUjF/p9ZMusAUgzvrDWQozSvOem86sB0eChpCbxT0YVcQO1msU@vger.kernel.org
X-Gm-Message-State: AOJu0YyNc0ME3aPOzlbiyFogt2wsP0V/skbn7GaGfh0u7oP3oHOl0PnG
	+Ux7hhpvqTBPSfjVDkfKsyEOoBNPcM0ZOy5MntHmc6y53agjJIremy6Nm5NXPbui
X-Gm-Gg: ASbGncsLxmlqrlU/Ys7gntPODIbfrv27Eda0Lvs9ZzZO9on1R1vM8G0NYl7dxw2vwTg
	LTnq4EryN5q4ViJgwAATdK855hIxgUFzCzMQBWtf4AmLpyRifJ5qDfQcefHqZEhd0MMhU3uHrIk
	lGjISH8U7fY6/RpjpV+k5b2DSuG9LZAzYdsmzhYKqf0IARI4OWBDwOxqFySFG9fIAFEZscoj1fe
	85KYN1aB1GY93XM+qGLAjmHYYRRDMxwj8TAidCAb9KTdyCdVnk0QYz64sT3UsHq3xddtMYR1CCA
	obLPzRCj3jB4R9bfl5O4BMmb2nRah5du5vUilLmHyIw/dFFOKQ1TJmTasdDEFDfnDeiYAgKakAN
	fq/0ssXcuCl6cummkEt3WiAN1/f63Zw==
X-Google-Smtp-Source: AGHT+IFn5mnE5q8jbIcXZzmzV4ptZGfBiTuVRfBgz+SoRRNB4A98QbdY+OIBl5NeE+r+tQnIGfO7wg==
X-Received: by 2002:a05:6a21:48b:b0:21d:1fbf:c71a with SMTP id adf61e73a8af0-222d7dc5062mr3182489637.4.1751438332076;
        Tue, 01 Jul 2025 23:38:52 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd0fsm13044966b3a.40.2025.07.01.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:38:50 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org (open list:SONY IMX585 SENSOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v1 2/4] media: uapi: Add custom IMX585 control IDs
Date: Wed,  2 Jul 2025 07:38:34 +0100
Message-Id: <20250702063836.3984-3-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702063836.3984-1-will@willwhang.com>
References: <20250702063836.3984-1-will@willwhang.com>
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
 include/uapi/linux/imx585.h        | 20 ++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h |  6 ++++++
 2 files changed, 26 insertions(+)
 create mode 100644 include/uapi/linux/imx585.h

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


