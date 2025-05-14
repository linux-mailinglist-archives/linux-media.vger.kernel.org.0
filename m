Return-Path: <linux-media+bounces-32471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF4AB69DA
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471243B7C31
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B99C2798EF;
	Wed, 14 May 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xF4lIfjh"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9B127511E;
	Wed, 14 May 2025 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222007; cv=none; b=A1nQZMOeF7PnMYw4pXkvx9gVY+BEnv1aAVOfmVXYE30i+dyVkQ8UrMi1hzBmZnsByf942zmN/1Yn3HOs3f3TjhPRJ3mjvr4JvtYvCWc13KbHMZ/HAz1O96ei60o1DgukIXaZkwPMmWWQs9ps9QJSqsYRRb1ITr9uIMAYFpGSOuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222007; c=relaxed/simple;
	bh=5X49EdTlas5+pqoGitR3eXq6roebrmXk5tAhFltQjwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUvQRcmXs1iiwk7eXV+bkKfBTZEjUd8q95xybWgemjVD39HDW6yIbLrErM8e3k05JAL40AM/Ky0cXR2FHTD5A4Bkh0o71ICtkbuw8sd96dbsUhw1Yuz40NFNQ4DhQlh1LOxcGGg5o363g/mau6V6jb//0aoYo0YcRK3qyEfRMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xF4lIfjh; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQ0bP2575214
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 06:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747221960;
	bh=tnEdl/bWMrlfpbkkoreMrdnsvPseyxB7h8xOZqGijyc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xF4lIfjhaCMRapbvNt6BGBvj31NchjywfQKjerxVVXHQuuIjtfOg9IQPmBTGJewiW
	 cXLoasgPsW3bQxlOqpq1y0KebHgkUOvSPARlDaTecwd7bSGFIJQyzd6MOyi3ZpP51v
	 McNhcf+dWz2NYuy+tqN/15YdLol9rXnJ+MzxUOiM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBQ0SM085264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 06:26:00 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 06:25:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 06:25:59 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EBPSVA107507;
	Wed, 14 May 2025 06:25:53 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Wed, 14 May 2025 16:55:19 +0530
Message-ID: <20250514112527.1983068-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514112527.1983068-1-r-donadkar@ti.com>
References: <20250514112527.1983068-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index d03dc4e56d306..cc6eb3d4c2b26 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1015,6 +1015,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[5];
 	int ret;
 
 	INIT_LIST_HEAD(&ctx->dma.queue);
@@ -1023,7 +1024,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 
 	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 
-- 
2.34.1


