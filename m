Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE58CF9351
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfKLOu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:50:57 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52480 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfKLOuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:50:55 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEoq0V097984;
        Tue, 12 Nov 2019 08:50:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570252;
        bh=/uLv7JVb364YMJpDL21sew7lV3/imt2e+I/yD5VDeMY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZbRatFnCXUJ6bBEBYj1eBABFr11Eik2O4uMFvjXA2QHZJo43UUzXAcfYTnajW+1DM
         tVTgXBuwsFufdWLS9BQMO0JZM925ca1qoZTz71/Qhi+IBdg4B8JWCUfF6VVXPQ7o/Z
         jSBrx77MT1VcGxHoZPh2H+2OyFrhtNswkBraV/bQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEoqwf054746
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:50:52 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:35 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEoker068428;
        Tue, 12 Nov 2019 08:50:52 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [RESEND Patch v3 07/20] dt-bindings: media: cal: update binding to add PHY LDO errata support
Date:   Tue, 12 Nov 2019 08:53:34 -0600
Message-ID: <20191112145347.23519-8-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/ti-cal.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
index 7e960cf26e23..cb2dc50a24fb 100644
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

