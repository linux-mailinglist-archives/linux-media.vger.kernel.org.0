Return-Path: <linux-media+bounces-44266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97DBD2AF0
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 028F54EF6B4
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59FE302154;
	Mon, 13 Oct 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkkKTSJL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D522FE04B;
	Mon, 13 Oct 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353303; cv=none; b=guxbc5Sm/GHab0+JZyfQ/viP+Wo1KZ1SKBA3GkoMNkxNnqX0An3D7qwFgvUuRakGC6Hq1kYSmfVTK9J+LsegtjLs2G+8IJjR/6fzepV5nCz67n4jV2N5zFU3rP2Aq+LH/In+0eIFt91fhTnOHzHSmqKIBlrnK26y2NAKjrJkjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353303; c=relaxed/simple;
	bh=OSJKqhSnjtFatFa6KNC2h4Y0AyZr1O5YS3bNSMqBTYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZR+uOTaKTrduSS3Z/KSuKPCokN3wgLOM6Y+KD91IjdH2kLBp7C1e07zK02+Rq/aX/9inMHjtJ5JwksX8wu0lilhr9qH3282eZJVPHYjF4z3IjMXS4L+PacUPv0g72RYfIPCoaT6XIRpmnM1b8ZPTUUt3l2xnEXR611tkqYyqy90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkkKTSJL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B7AC4CEF8;
	Mon, 13 Oct 2025 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353302;
	bh=OSJKqhSnjtFatFa6KNC2h4Y0AyZr1O5YS3bNSMqBTYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PkkKTSJL8lXXA+pnGiIUVTTeouxHGklxQKwGHwVuErfeyzEhFLMBBf/ZfKAtpZm7C
	 B2WR3P12xIIw/JPIxEhFC+EodH/AY59wENypW/fZUyOxBqsktFCs/w/Hs0xxbO2piv
	 OcmxyRbNxQDrP3ts91u2QlO3YyeKEHV5A5v8nihnuja1slbD3t0Cz5K2Ggp/g4kFyA
	 WEP7ng5ahPNoWeoSUtvE9eI1lMcE0ufXVO2g5Y1JVu/joQ7JjvMMoxQLUzCPBVv7J4
	 vtwj4GSB3b1Gyu5zelVGtwFYQfDKNT49/V21svhpkt4UQa3qZeiYqMnvny7rHXQIU2
	 EmaUFwMHldC+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 13:01:34 +0200
Subject: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
In-Reply-To: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

MIPI-CSI2 sends its RGB format on the wire with the blue component
first, then green, then red. MIPI calls that format "RGB", but by v4l2
conventions it would be BGR.

MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.

We already have BGR666 and BGR888 media bus formats, we don't have any
CSI transceivers using the 444 and 555 variants, but some transceivers
use the CSI RGB565 format, while using the RGB565 media bus code.

That's a mistake, but since we don't have a BGR565 media bus code we
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
2.51.0


