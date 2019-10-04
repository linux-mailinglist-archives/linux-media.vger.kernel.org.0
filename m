Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735B8CC082
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731283AbfJDQ2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:28:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37168 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731265AbfJDQ2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:28:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GS6BA059543;
        Fri, 4 Oct 2019 11:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206486;
        bh=oN8I5LkR4+QW/F4pAxU4LHL68tbhO04WPOjOJ+FTBMc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tJynx9+4yzAnsK2551nPSSVGnUUGC2ih2L3i92RoADrYVGmNCAzYL9bGuYbtEiHhm
         I5j1eH3jj2IdR03nVarEgekR10LyNhRzSJr0Xa0lwrXJqaqdPgAHwKPSTU96HwwsEJ
         f7IRO7VHwgHYIznJd5QzpPJ8UH4du1RyH+s/jexM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GS6U7050988
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:28:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:28:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:28:05 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgAJ028904;
        Fri, 4 Oct 2019 11:28:05 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 17/21] media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
Date:   Fri, 4 Oct 2019 11:29:48 -0500
Message-ID: <20191004162952.4963-18-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All 4 of the "colorspace" components were not originally handled.
Causing issue related to xfer_func not being initialized properly.

This was found with v4l2-compliance test.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 5b1e9908fff2..19b027c5478a 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1578,10 +1578,13 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
 		struct vpe_q_data *s_q_data;
 
-		/* get colorspace from the source queue */
+		/* get colorimetry from the source queue */
 		s_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
 		pix->colorspace = s_q_data->format.fmt.pix_mp.colorspace;
+		pix->xfer_func = s_q_data->format.fmt.pix_mp.xfer_func;
+		pix->ycbcr_enc = s_q_data->format.fmt.pix_mp.ycbcr_enc;
+		pix->quantization = s_q_data->format.fmt.pix_mp.quantization;
 	}
 
 	return 0;
-- 
2.17.1

