Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4BAB82D0
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388991AbfISUkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:40:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35058 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392685AbfISUj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:26 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdPnJ011697;
        Thu, 19 Sep 2019 15:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925565;
        bh=I+xPy3xNOHEoo8tC6L9GoL1DnBDGS+nM7VEaBsreGCU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=k5qQD7Pbsi0ndIlXHCWRcpunlhfu7qZHQ+QPMChlSB1uAh/0L6RusHkfhhz359Uik
         XttRm/Xa0yjMir2xm5959Cvlyazh3N9mrRo3WpaOMMIpl3EXmBXuGF8RK2DM0iZxex
         GTUxD2M5TT5189Wg4Kn8W9xta/LSXZ7cuqSEiWiM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKdPCW002213
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:39:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:25 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKIY014276;
        Thu, 19 Sep 2019 15:39:25 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 05/13] media: am437x-vpfe: fix start streaming error path
Date:   Thu, 19 Sep 2019 15:41:17 -0500
Message-ID: <20190919204125.15254-6-bparrot@ti.com>
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

When start_streaming fails the h/w module might be left enabled
inadvertently. Make sure it is disabled in the error path.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 66df87d310a2..e0a4c8920df8 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2008,6 +2008,7 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
 
+	vpfe_pcr_enable(&vpfe->ccdc, 0);
 	return ret;
 }
 
-- 
2.17.1

