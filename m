Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC12E333A5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 17:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfFCPfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 11:35:25 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58212 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfFCPfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 11:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559576120; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7r5nkRsqjWYhBqtk66cNgvdETdf2nddmTlBNaVS+Hvw=;
        b=n8bhRenSLUwqZGKRST5uOAdZKmzDRc5PXo2s8jCW/xIXSZPP+3UrbJEDobxr7ZK97m9qay
        m8XvMNVabHubdQoqxdJoutIWKGfo1AdnjVlEfheehLdSXw+r3i2K645DRs+dwTD7mmS821
        yWGohoQtlZ0rgj5WiJvHEpLrqSyMY+Y=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 2/3] media: uapi: Add RGB bus format for the GiantPlus GPM940B0 panel
Date:   Mon,  3 Jun 2019 17:35:10 +0200
Message-Id: <20190603153511.24384-2-paul@crapouillou.net>
In-Reply-To: <20190603153511.24384-1-paul@crapouillou.net>
References: <20190603153511.24384-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB components
are transferred sequentially on a 8-bit bus.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch
    
    v3: No change
    
    v4: Add only MEDIA_BUS_FMT_RGB888_3X8, as we don't have to care about
        endianness

 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 2a6b253cfb05..16c1fa2d89a4 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101c */
+/* RGB - next is	0x101d */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -55,6 +55,7 @@
 #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
 #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
 #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
-- 
2.21.0.593.g511ec345e18

