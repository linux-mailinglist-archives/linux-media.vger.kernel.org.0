Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B45ADD3A
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389628AbfIIQ0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54448 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfIIQ0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQ1GV034817;
        Mon, 9 Sep 2019 11:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046361;
        bh=FlqqtMKwRz8CIUimF8eZEodytF25S33kyYDLNwRzdi0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=U+p44M5jfYtGZ1LHP1ULEmRiS4LQj0uJnx5iFa5hAJvpb9mQA3Rcnba3CWulkRNp9
         TxD6wsgAHOJPX7+5XULck2T9BZ3/BVtfa9vFuNBsBeCnN0j1AHvxY2sGXWsVsWRjeX
         8mXcSlBmPhDOqVww48Xt9oLii7ul0sndpsZXijYw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GQ1gE089969
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:26:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:01 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoQ056522;
        Mon, 9 Sep 2019 11:26:00 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 02/13] media: am437x-vpfe: Fix missing first line
Date:   Mon, 9 Sep 2019 11:27:32 -0500
Message-ID: <20190909162743.30114-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previous generation of this driver were hard coded to handle
encoder/decoder were the first line never contains any data and
was therefore always skipped, however when dealing with actual
camera sensor the first line is always present.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index ab959d61f9c9..0ecb75bf5abd 100644
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

