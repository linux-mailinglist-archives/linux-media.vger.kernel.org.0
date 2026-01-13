Return-Path: <linux-media+bounces-50522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2523D17816
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC7EE301278E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB63738735C;
	Tue, 13 Jan 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mE1JXIEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACC38734C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295271; cv=none; b=Ijkjkru/6MBBVgrhz02TZGfMerJYuHTYaP0zlO+R11IHNLg58T0SkvXDlhqGoDqYHdKXAdw6GR9g0t3Hw6dTB84emt6tIbWV9UhFdIH+bNLrnDF1j9ouhmRzZopVVqquFxBK5gerQ4bxHAxrZ4PD9jG9HKgDF7X3NpYfLsAYOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295271; c=relaxed/simple;
	bh=HTJ70zdXr0fBVwCbSyph3W5hnMUWGn7AcDeo+R6UXTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7qAAW1IixrcuEx/sZYHTom42cUGdXYCN0lpjj+TZ5MCKOnEdPvCKYlaFIw1Goa0hXlWCdzWnP20DswarPlXHiWAYsYNQfOFY0YuEAAoERAWPuN0Cg64cAa1P6SctzmWB0LnLBaaX54E52TGbfzXQcvpT0muJDjyQuHD+2eodP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mE1JXIEZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4492E0;
	Tue, 13 Jan 2026 10:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295242;
	bh=HTJ70zdXr0fBVwCbSyph3W5hnMUWGn7AcDeo+R6UXTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mE1JXIEZxW/dauiTU525S7dXnIIbF7dO5z4Cf/treygE7zchxMrFQ3E9fz9jblt7X
	 8vBhhOa/55ip0HAJx+wTHDAAG/V55q30K6kbXfRG9ParPtuetbE4pNyLCeXx2G2Uv5
	 ZZWWKQrmR4MEBa+RSukH1WfpNlrmOz43gruwp1ec=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:23 +0530
Subject: [PATCH 03/10] platform/raspberrypi: vchiq-mmal: Support bayer and
 gray formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-3-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4364;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=HTJ70zdXr0fBVwCbSyph3W5hnMUWGn7AcDeo+R6UXTk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtFixdlzrS0AZasf0/70hi8Ntr39ZOsU4Sjy
 yY33bPdPU6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRQAKCRBD3pH5JJpx
 RQGWEACuCOucYeyVcXVQ8S/udO6/0P9FbNn3SpkUWHwxk9ulTxHMt2seiQTvidJyvkSzVAl3d6B
 6/zHhXKcieq+Yr09ougpr1JWrLN8tfa/L0hpy+WY/SLrx92k/DDeD9uLnGRtwmIYtrZcFglfZDe
 xLQWcY34bjgsIjfsr7RbvRWuLpV/OuWkRKoZZBqZgrYTTaTYSlyH2KOFc7blRqnIgL6aPfqOe8i
 UlMgxBGsfXlXhfQdoj/1MR7FCTnSXkTuR4SVClZlSAC+kcoHJdfW/rAU8JE7ti43gd1F9tSiBwC
 FWc7//h7V0d6dYigY5YVi8Op9DJHoMCiEJKUqYJ3bqXlC5LUynwAT9vumHI4Uy4SBpddXTor43Y
 +XBxNkcV2Aib51t6NOROBRoeCjFnNS8Dw0tzD5Qr8qUfgWJjxr1uQ68pP6e8LVS7dzr1IKtOPLY
 U0OcRMtYA92asp1bB0oUv7EW7czr4BHz6TQbc03GkTbPyvATUYsa316n2RhZCW7rX1vOMm7sHts
 WAtW5DwWhK0n65xoaaz6+3aLNujlhTNdaaa/mN918G7qn71JJTOumqFw4S3u8EWMc+AjtQLTeiD
 d9F4AX3grOt+uwq18mFRe3WR24cxe0R23OyiaxisaDmIpGBc249Ihq8KsTHZG2KIAfGtVEIk36Z
 0fcpAH0rkGfB5iQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Raw camera sensors often send data as packed or unpacked bayer and gray
formats, which needs to be processed by the ISP.

Add macros to support bayer and gray format FOURCCs in the MMAL layer.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index eadf2e9814082c861a93ae8119e8ecb27a2fb331..1e13ebbaebf607a2eb82695c65c00bc1e901f745 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -69,6 +69,70 @@
  */
 #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
 
+/**
+ * Bayer formats
+ * FourCC values copied from V4L2 where defined.
+ */
+/* 8 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
+#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
+#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
+#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
+
+/* 10 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
+
+/* 12 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
+
+/* 14 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
+
+/* 16 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
+#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
+#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
+#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
+
+/* 10 bit per pixel unpacked (16bit) Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
+#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
+#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
+#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
+
+/* 12 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
+
+/* 14 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
+#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
+#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
+#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
+
+/* MIPI packed monochrome images */
+#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
+#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
+#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
+#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
+#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
+
+/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) */
+#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
+#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
+#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
+
 /** An EGL image handle
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')

-- 
2.52.0


