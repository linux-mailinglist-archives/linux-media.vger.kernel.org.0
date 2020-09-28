Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A7827B657
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 22:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgI1Udd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 16:33:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49256 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgI1Udd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 16:33:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXSHA013344;
        Mon, 28 Sep 2020 15:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601325208;
        bh=lYQxjFuOg7vMcx5Vb1XGQ/eaFI2oRHXPKxJCyoas+H0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dJ4Chm0i1vGwLwtWmm3Nh9KOC0LoI7cqwmqoKXdhjFFxtJsS/uq4kV2xG69PlYDAV
         oOA06Oo4xQk5Hu44s0k38WR0+o958iLKoyPLmCOz2XSDFt9ftJps9LgakZ4VRrO+wE
         e3L9MM5qEhoJ6Gw9VC/1jCo5giGTAQi2IS8FRAGI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08SKXSVn111061
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Sep 2020 15:33:28 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 15:33:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 28 Sep 2020 15:33:28 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXHYx084953;
        Mon, 28 Sep 2020 15:33:25 -0500
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>
CC:     <dmurphy@ti.com>, <tomi.valkeinen@ti.com>, <bparrot@ti.com>,
        <nsekhar@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <nikhil.nd@ti.com>
Subject: [PATCH 1/1] linux-firmware: Add new VPDMA firmware 1b8.bin
Date:   Tue, 29 Sep 2020 02:03:03 +0530
Message-ID: <20200928203303.32178-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928203303.32178-1-nikhil.nd@ti.com>
References: <20200928203303.32178-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a firmware for the VPDMA (Video Port Direct Memory Access)
block of the VPE (Video Processing Engine) used in Texas
Instrument's devices like dra7xx family.

This firmware is required for the driver
drivers/media/platform/ti-vpe/vpdma.c

Origin: downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 LICENCE.ti-tspa               |  46 ++++++++++++++++++++++++++++++++++
 WHENCE                        |   8 ++++++
 ti-connectivity/vpdma-1b8.bin | Bin 0 -> 4002 bytes
 3 files changed, 54 insertions(+)
 create mode 100644 LICENCE.ti-tspa
 create mode 100644 ti-connectivity/vpdma-1b8.bin

diff --git a/LICENCE.ti-tspa b/LICENCE.ti-tspa
new file mode 100644
index 0000000..728fc2b
--- /dev/null
+++ b/LICENCE.ti-tspa
@@ -0,0 +1,46 @@
+TI TSPA License
+TECHNOLOGY AND SOFTWARE PUBLICLY AVAILABLE
+SOFTWARE LICENSE
+
+Copyright (c) 2020, Texas Instruments Incorporated.
+
+All rights reserved not granted herein.
+
+Limited License.
+
+Texas Instruments Incorporated grants a world-wide, royalty-free, non-exclusive
+license under copyrights and patents it now or hereafter owns or controls to
+make, have made, use, import, offer to sell and sell ("Utilize") this software,
+but solely to the extent that any such patent is necessary to Utilize the
+software alone. The patent license shall not apply to any combinations which
+include this software.  No hardware per se is licensed hereunder.
+
+Redistribution and use in binary form, without modification, are permitted
+provided that the following conditions are met:
+
+* Redistributions must preserve existing copyright notices and reproduce this
+license (including the above copyright notice and the disclaimer below) in the
+documentation and/or other materials provided with the distribution.
+
+* Neither the name of Texas Instruments Incorporated nor the names of its
+suppliers may be used to endorse or promote products derived from this software
+without specific prior written permission.
+
+* No reverse engineering, decompilation, or disassembly of this software is
+permitted.
+
+* Nothing shall obligate TI to provide you with source code for the software
+licensed and provided to you in object code.
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY TI AND TI’S LICENSORS "AS IS" AND ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
+EVENT SHALL TI AND TI’S LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/WHENCE b/WHENCE
index d4bd8cf..77119ec 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2655,6 +2655,14 @@ File: TDA7706_OM_v3.0.2_boot.txt
 Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
         Copyright © 2010 STMicroelectronics
 
+------------------------------------------------
+
+Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
+
+File: ti-connectivity/vpdma-1b8.bin
+
+Licence: Redistributable. See LICENCE.ti-tspa for details.
+
 --------------------------------------------------------------------------
 
 Driver: wl1251 - Texas Instruments 802.11 WLAN driver for WiLink4 chips
diff --git a/ti-connectivity/vpdma-1b8.bin b/ti-connectivity/vpdma-1b8.bin
new file mode 100644
index 0000000000000000000000000000000000000000..e36fdc548e67fd36d729513e17f4bbcdabefc773
GIT binary patch
literal 4002
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

literal 0
HcmV?d00001

-- 
2.17.1

