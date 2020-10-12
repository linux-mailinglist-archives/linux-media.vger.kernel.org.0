Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7B228B4FF
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbgJLMwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 08:52:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56676 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgJLMwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 08:52:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09CCqECL118837;
        Mon, 12 Oct 2020 07:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602507134;
        bh=zFXVHjXgyy+aPPuIUsOOoYVJvcbamww0y9tEzVCBUvk=;
        h=From:To:CC:Subject:Date;
        b=vT+j/A55fHTeSe4pF3f4JSLfvmrAOfCPdFC0j1owuMpUNEFzUCG8xFo3JfWpk2N0Z
         kUx/8l9TpnrNw+Z+Fn31UHfoTSeCyvrDtKera8wZZvW4DcH4FopJOV4Yg27BHMWOif
         zE0g2wddPCDR0J0QYOlxIpAQW9ouUHC74fmBulNo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09CCqEDw006199
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 12 Oct 2020 07:52:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 07:52:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 07:52:14 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09CCqBEf025800;
        Mon, 12 Oct 2020 07:52:12 -0500
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] media: platform: ti-vpe: Update the path to firmware
Date:   Mon, 12 Oct 2020 18:22:00 +0530
Message-ID: <20201012125200.11643-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vpdma firmware is now available in the linux-firmware repo.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin

Update the firmware path requested by the VPDMA driver so that
it gets looked up correctly in the filesystem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 2e5148ae7a0f..5a378449a4ff 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -23,7 +23,7 @@
 #include "vpdma.h"
 #include "vpdma_priv.h"
 
-#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
+#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
 
 const struct vpdma_data_format vpdma_yuv_fmts[] = {
 	[VPDMA_DATA_FMT_Y444] = {
-- 
2.17.1

