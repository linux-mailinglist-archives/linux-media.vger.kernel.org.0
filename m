Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57BAB964E
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391508AbfITREx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:53 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39312 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405588AbfITRD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:03:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3t4s101456;
        Fri, 20 Sep 2019 12:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999035;
        bh=L+sPKUKH06o+2bCBaoKbYjJxrNj69PQvI6LssiKHDZw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FZzWDaGsTQM3Dydlqk05fxQWm5Q7C1npzM2sqtp3dhQeR3BesszXZaHEtK9Wg3wUE
         CQF4hiOHVE4903XK+GwftMYA72fdSutlpdlAgkmaIFgxHSORCFpLOl4zVA5iBWQin6
         oG3RywrxoNw+uAln/fD5afad9IRLYtviBvAS+9TU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH3txI102382
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:03:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:03:55 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r6u054719;
        Fri, 20 Sep 2019 12:03:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v3 02/13] media: am437x-vpfe: Fix missing first line
Date:   Fri, 20 Sep 2019 12:05:43 -0500
Message-ID: <20190920170554.29666-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
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

