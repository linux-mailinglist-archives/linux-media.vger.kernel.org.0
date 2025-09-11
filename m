Return-Path: <linux-media+bounces-42276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CAB52CCE
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729B7A06F1F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C192EA178;
	Thu, 11 Sep 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6JxS+vE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1B2E92BB;
	Thu, 11 Sep 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582144; cv=none; b=nyGlkSGDOqBJ5UX8CQTbMxmaJ0ZREFjpKfQCD4wFUZHSSyVWJOfMlp8WBcyzvOlAVBSSDrYq1QTw7+WdnTehb7B+bcQ3M4OfuMyWnRYjbu89KucHHWgCF6MI9WMlXAZowp58X+qUwhFjFh8BepoECMn8bf8vACu7NWvMpqk4fOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582144; c=relaxed/simple;
	bh=vtTI7iW2ovg2Lmmj3juW68JND8KyxijKZTrPOxRQSL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKzkLS7lk+KKhJdW+sYZ8Cr1jV+OiJ2fgbuSxZgWgHkOp/i5SegfY3DOxtS6r9stWEXRbzkCyZk0/e3COz/75NJxLKST/l3LsI0CQbFioSKj2bn3blhvXODeukU45VobXxnlWJQwkdNrIakFQO0XoF6icgcij0ZuRrOkd0YS58M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6JxS+vE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6F2C4CEF1;
	Thu, 11 Sep 2025 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757582144;
	bh=vtTI7iW2ovg2Lmmj3juW68JND8KyxijKZTrPOxRQSL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X6JxS+vErz5m+mvx0whoo52Reu2gmATCag73v5ZDXHtMl4mqjIctcz7ubZXpyo2bJ
	 nX2+IYgmu9ZsuvgUPnk0eTP/mwB7eM/nSknImNYZ6W5cM+hml7mURIDWpcKQDVEAd+
	 KCx+ZM/+GRaE2usrFeRZtN4+7su9PUSVyIhRoH+rMv2wQ/vXY53MPNeyVPNKf4k6gR
	 Kq0j8g+QCU9WrIQRY1qXgCPdQIp2dqTYaVI1/Fluanc79mywf/Vi8izKg/mmNjVvQ4
	 oelDrZtIe1goDnB17Klmgi885d3PPRnFiy0BW8ghGKtpTiD4NMjOM/ZMfIJw5B4oRA
	 hXiyKTzEhtGRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 11 Sep 2025 11:15:33 +0200
Subject: [PATCH v2 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-csi-bgr-rgb-v2-2-e6c6b10c1040@kernel.org>
References: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
In-Reply-To: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vtTI7iW2ovg2Lmmj3juW68JND8KyxijKZTrPOxRQSL8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmHJps9P6wadfKQivladl2/lv211zsuvG61Mfn6ff7hS
 3tDTRr+d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ8Ekw1tkvU2HJSHH8+rha
 6uFrs97kd07Toz/uvnyjuHtXX5XnX251VcY7z/adOvpBfpFN3MNlHxnr9HkTdk6/XvLDh6t5t+3
 qbqaoO6yn24+Ya1uqzVx+Le0Fa4C089bvOVPeVu/i23lSe30xAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

MIPI-CSI2 sends its RGB format on the wire with the blue component
first, then green, then red. MIPI calls that format "RGB", but by v4l2
conventions it would be BGR.

MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.

We already have BGR666 and BGR888 media bus formats, we don't have any
CSI transceivers using the 444 and 555 variants, but some transceivers
use the CSI RGB565 format, while using the RGB656 media bus code.

That's a mistake, but since we don't have a BGR656 media bus code we
need to introduce one before fixing it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2ec9395af1468f56adf31a8de 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -625,10 +625,47 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`4`
       - b\ :sub:`3`
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-BGR565-1X16:
+
+      - MEDIA_BUS_FMT_BGR565_1X16
+      - 0x1028
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
     * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
 
       - MEDIA_BUS_FMT_BGR565_2X8_BE
       - 0x1005
       -
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ff62056feed5b6588bfcfdff178f5b68eecd3a26..a73d91876d31844bf8c2da91ddea541181840bd2 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -32,17 +32,18 @@
  * new pixel codes.
  */
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1028 */
+/* RGB - next is	0x1029 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_BGR565_1X16		0x1028
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
 #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
 #define MEDIA_BUS_FMT_RGB666_1X18		0x1009

-- 
2.50.1


