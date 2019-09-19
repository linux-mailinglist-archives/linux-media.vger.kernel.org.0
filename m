Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C2DB82B2
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392682AbfISUj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:39:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42648 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388901AbfISUjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdMMk117023;
        Thu, 19 Sep 2019 15:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925562;
        bh=L+sPKUKH06o+2bCBaoKbYjJxrNj69PQvI6LssiKHDZw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=r3h9ze/CcbsrKkIkhGJ2tDEawo6HEtNDFopHG3BDMYlvd6QEKqYRyckFm25T6fl81
         FOJI4dbWmg3bljbC/KuV7T9wiOUZp/RmeVxrdlJnDRBDqGAr8pwVmntWBGivqUqx3T
         pjyl2hmwiQEo8fxNYcnIZvDwpJuXr8DRf9arfi9U=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKdMZw002169
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:39:22 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:22 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKIV014276;
        Thu, 19 Sep 2019 15:39:22 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v2 02/13] media: am437x-vpfe: Fix missing first line
Date:   Thu, 19 Sep 2019 15:41:14 -0500
Message-ID: <20190919204125.15254-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previous generation of this driver were hard coded to handle
encoder/decoder where the first line never contains any data and
was therefore always skipped, however when dealing with actual
camera sensors the first line is always present.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index a3d22f90e64c..1521c072f3e3 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -345,13 +345,9 @@ static void vpfe_ccdc_setwin(struct vpfe_ccdc *ccdc,
 	if (frm_fmt == CCDC_FRMFMT_INTERLACED) {
 		vert_nr_lines = (image_win->height >> 1) - 1;
 		vert_start >>= 1;
-		/* Since first line doesn't have any data */
-		vert_start += 1;
 		/* configure VDINT0 */
 		val = (vert_start << VPFE_VDINT_VDINT0_SHIFT);
 	} else {
-		/* Since first line doesn't have any data */
-		vert_start += 1;
 		vert_nr_lines = image_win->height - 1;
 		/*
 		 * configure VDINT0 and VDINT1. VDINT1 will be at half
-- 
2.17.1

