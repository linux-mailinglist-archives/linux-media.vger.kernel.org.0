Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7425DC8A3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410623AbfJRPcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:14 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47674 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633278AbfJRPcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW9N4013374;
        Fri, 18 Oct 2019 10:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412729;
        bh=uq1i+tWOuS4mskWSGZzRgqiAOAAKC9B8IF3qNOEobQw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jHsdcfLYcaRgy8ddrm1EwQL5JkP4OaF5gX/2vvnnbuFsz9Eix8zJkt25Cf7i4s+Jv
         BHUlmSrN/lZj1uzg9bPo93yLmuuoWjeHod82exjEopN+Tped7xrVzo8uxLfFigNQRD
         IbovdgaOiv8DUJf4yW/oN5Twn2X2cHADjmDVrYXE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFW99c080454
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:01 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15K080266;
        Fri, 18 Oct 2019 10:32:09 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch 06/19] dt-bindings: media: cal: update binding to add PHY LDO errata support
Date:   Fri, 18 Oct 2019 10:34:24 -0500
Message-ID: <20191018153437.20614-7-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update Device Tree bindings for the CAL driver to add support for
the CSI2 PHY LDO errata workaround for pre-es2 devices.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 Documentation/devicetree/bindings/media/ti-cal.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index 6b56fddcfc4a..d43870a2324b 100644
--- a/Documentation/devicetree/bindings/media/ti-cal.txt
+++ b/Documentation/devicetree/bindings/media/ti-cal.txt
@@ -7,7 +7,9 @@ processing capability to connect CSI2 image-sensor modules to the
 DRA72x device.
 
 Required properties:
-- compatible: must be "ti,dra72-cal"
+- compatible:
+ Should be "ti,dra72-cal", for DRA72 controllers
+ Should be "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
 - reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
 	control address space
 - reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
-- 
2.17.1

