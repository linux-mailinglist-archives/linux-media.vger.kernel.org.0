Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A892997A9
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 21:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgJZUJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 16:09:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43156 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJZUJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 16:09:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09QK9YC8082310;
        Mon, 26 Oct 2020 15:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603742974;
        bh=JL9vscAbLXRgwCqU0LyAeHzr3pCVEWRaf5uv1C4PhLI=;
        h=From:To:CC:Subject:Date;
        b=MLazU8r62v3RR/oLfUiNrDrGU2Onrrc6rCiYwPwrjt/FbhEAxPWk18xO1tQsecgEj
         ZpOIjYoZ4gnGLUp7d7QoY5bpCaA+3SrqQ4oSQcw8iY7Sw4b8AYKcO06sBa6V7lZKjD
         cxG2Vq12/EhrGcUQKKsrIfPc4WkkuBWSl90sZgY8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09QK9You009145
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Oct 2020 15:09:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 15:09:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 15:09:33 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09QK9UV0046746;
        Mon, 26 Oct 2020 15:09:31 -0500
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>
CC:     Dan Murphy <dmurphy@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH] vpdma: Move firmware to the toplevel
Date:   Tue, 27 Oct 2020 01:39:22 +0530
Message-ID: <20201026200922.12719-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the vpdma firmware to the toplevel directory so
that the existing drivers can use it with the same path.

Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 WHENCE                                         |   2 +-
 ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin | Bin
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin (100%)

diff --git a/WHENCE b/WHENCE
index 473f6fb..347593c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2705,7 +2705,7 @@ Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
 
 Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
 
-File: ti-connectivity/vpdma-1b8.bin
+File: vpdma-1b8.bin
 
 Licence: Redistributable. See LICENCE.ti-tspa for details.
 
diff --git a/ti-connectivity/vpdma-1b8.bin b/vpdma-1b8.bin
similarity index 100%
rename from ti-connectivity/vpdma-1b8.bin
rename to vpdma-1b8.bin
-- 
2.17.1

