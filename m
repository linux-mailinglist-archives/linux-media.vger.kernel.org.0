Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE0EF9324
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfKLOvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43670 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLOvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:08 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEopmx052177;
        Tue, 12 Nov 2019 08:50:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570251;
        bh=t5tk6tPjmy9D4wpjreK/rkQpiORR1vxY931cn9fLxT8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CjV9omzOOgvJq3n5D6jOCTfNQpFFwKN4ijYaVfqwice+2DdzlJRtKHWLd/LIkfu/x
         vLDKe3IjPvR19NUe0zed/SKVeqR1xoagevnLAPoVBtR29Sb/eW+K1wyGm8ajQzjs+F
         BkO/4cs5pd0SAvyW5fa8Nkla+4RsvTJ3oeoxKQvM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEopOd070332;
        Tue, 12 Nov 2019 08:50:51 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:50 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokep068428;
        Tue, 12 Nov 2019 08:50:50 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [RESEND Patch v3 05/20] media: ti-vpe: cal: Enable DMABUF export
Date:   Tue, 12 Nov 2019 08:53:32 -0600
Message-ID: <20191112145347.23519-6-bparrot@ti.com>
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

Allow CAL to be able to export DMA buffer.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b4616d02a25a..4f9a7609cb5f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1486,6 +1486,7 @@ static const struct v4l2_ioctl_ops cal_ioctl_ops = {
 	.vidioc_querybuf      = vb2_ioctl_querybuf,
 	.vidioc_qbuf          = vb2_ioctl_qbuf,
 	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
 	.vidioc_enum_input    = cal_enum_input,
 	.vidioc_g_input       = cal_g_input,
 	.vidioc_s_input       = cal_s_input,
-- 
2.17.1

