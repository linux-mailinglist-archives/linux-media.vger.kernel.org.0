Return-Path: <linux-media+bounces-34622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C2AD70D9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBB13A7933
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8DC23E235;
	Thu, 12 Jun 2025 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm721y7a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0323D2AE;
	Thu, 12 Jun 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732837; cv=none; b=E+dDDLMVePhg+POjRAQx0r3MCb1dJeYVxQegXaKVREXOAom0hTIOhKe2m9KXr7pB3QlKO/BiyaW6ivh3twvnK1B07/R+JDQl0Wm1mfxxnh8XhtnIX2AYs4ic6Hv9iGfQy8d70PCeMgcFPTChJCZIorhMX6vb/bV6lZTNjnCZlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732837; c=relaxed/simple;
	bh=VrIIKM49InaDKrW7YQ8qvCLpsKEgvUI8aQjOX9xkdWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AdCk66t+fbcApRFHy8ZvxyCERXDVxq3K3a53EREJ4GlhEFJsPWwP3HYg3sHbP+C8BJEvLMUhsL1DTy2NRNcX1s0WL7HkogbYfJI6KHvm8pcmdmte8dHm/PUtg7BvW0zHi3iEsPUi1NveU+LNnEkhRBLtkkF7C5hrR+2qew6l36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm721y7a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A12C4CEEA;
	Thu, 12 Jun 2025 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732837;
	bh=VrIIKM49InaDKrW7YQ8qvCLpsKEgvUI8aQjOX9xkdWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rm721y7a04n7T3K4l7/E2hUB5SzKBg3Qw1L2tLURmBfoSBoxbpLUCHGGYfe6+BYtP
	 8jiY8rfo5e9TETtZJOCMfq4FM5e0O8GmkcG0f7HGBq7V0YHIkvkKGrzWsan6UrRn0o
	 ZSrdel68J+aBNUkD4uTH8XS2DEtlnSpMHC5Dain2DhQ40+77IFbRCTatw0CcFMxA3r
	 sYi4SbyhRRI6pNuS1kANYLYfiRshAUI5jCP3hI1mYZDMPRuS2QhatYmeSv+yWXjl3n
	 25KbKaEu5oDUze+T/wbmPDpHl7LaZXWvy7rXRElUmRZIK8+v/qMj0l9NlThA9FFvAZ
	 3VXMCeY6LpchA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Jun 2025 14:53:40 +0200
Subject: [PATCH 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-csi-bgr-rgb-v1-2-dc8a309118f8@kernel.org>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
In-Reply-To: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VrIIKM49InaDKrW7YQ8qvCLpsKEgvUI8aQjOX9xkdWE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBleZ2+fPLrjWOht7qkfFPZEzS0Uu/n789tZs76YMnU+f
 bFkz9tVnR1TWRiEORlkxRRZnsiEnV7evrjKwX7lD5g5rEwgQxi4OAVgIhF+jA3LKl9Ff/esVxXO
 7Xv5a0rNmYCTPz+YzdjAvrXGTOykCvNG0Zb19UJLeKLy8/y8+ts7TRnr034cF5LZcSngeejsh1d
 k5m7/O23Guzee3H2OF5XTjxi4Bd93OhjE8Y7/69zfnwvbvigoAAA=
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
2.49.0


