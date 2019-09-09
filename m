Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F462ADD2E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389786AbfIIQ0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389739AbfIIQ0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQ5Xe045145;
        Mon, 9 Sep 2019 11:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046365;
        bh=jy9DLYE39VYve/5VKXD9KjcBPzY+Zm3GGDueqh26Dss=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=E/Mxr+HhgdoDxv8Awmez8KG2HVjbqrXmO4ETxz8OqF6lui95tF3eTAUfG5zSLope8
         59xqQVSbEr48yzbI/QlhRmxLk8duZp07G0TEgQXAxugxudCjKJ7ICOJXtyCPr88s4e
         3DGNdlecGPPmqhZm7ifRQVw9c6zvTRzmAo7cij3I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GQ51d090214
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:26:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:05 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoU056522;
        Mon, 9 Sep 2019 11:26:05 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 06/13] media: am437x-vpfe: Setting STD to current value is not an error
Date:   Mon, 9 Sep 2019 11:27:36 -0500
Message-ID: <20190909162743.30114-7-bparrot@ti.com>
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

VIDIOC_S_STD should not return an error if the value is identical
to the current one.
This error was highlighted by the v4l2-compliance test.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 52f7fc6e11dd..ac759c066d00 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -1822,6 +1822,10 @@ static int vpfe_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	if (!(sdinfo->inputs[0].capabilities & V4L2_IN_CAP_STD))
 		return -ENODATA;
 
+	/* if trying to set the same std then nothing to do */
+	if (vpfe_standards[vpfe->std_index].std_id == std_id)
+		return 0;
+
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
 		vpfe_err(vpfe, "%s device busy\n", __func__);
-- 
2.17.1

