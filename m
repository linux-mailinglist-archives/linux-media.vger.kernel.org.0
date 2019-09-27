Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF2DC0B3B
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfI0SfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:35:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45578 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbfI0Se4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYt4s092352;
        Fri, 27 Sep 2019 13:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609295;
        bh=PU8cOk4sbUjypaoxvrI4OhIdWem2VYqd9AB7zyslLUU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dTQBr0QNBqxH+YNXenIn7GfD6dhXvyk+Biv+4M40ftRr5BXWmhK1hbILV3BNaYWQS
         qNNOeEMmvb2cKGmsuxMLL+Or/m7b9fN2LpB6fTVL81LcNPRzFLwBVMiHWPAaLtVuH6
         AL/mp2dRwzJvlFz7Ml2xzBC1WRPZVAiWOZ7OusSs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYtjn122738
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:55 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgc2073031;
        Fri, 27 Sep 2019 13:34:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 13/16] media: ti-vpe: vpdma: Use fixed type for address in descriptor
Date:   Fri, 27 Sep 2019 13:36:47 -0500
Message-ID: <20190927183650.31345-14-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using dma_addr_t as the type to hold address inside of a fix sized
descriptor used by the vpdma firmware is prone to fail when the expected
width is 32 bits and suddenly when CONFIG_LPAE is enabled the data size
is now 64 bits shifted the remaining members of the descriptor in memory
which confuses the firmware.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma_priv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma_priv.h b/drivers/media/platform/ti-vpe/vpdma_priv.h
index d8ae3e1cd54d..0bbee45338bd 100644
--- a/drivers/media/platform/ti-vpe/vpdma_priv.h
+++ b/drivers/media/platform/ti-vpe/vpdma_priv.h
@@ -166,11 +166,11 @@ struct vpdma_dtd {
 		u32		xfer_length_height;
 		u32		w1;
 	};
-	dma_addr_t		start_addr;
+	u32			start_addr;
 	u32			pkt_ctl;
 	union {
 		u32		frame_width_height;	/* inbound */
-		dma_addr_t	desc_write_addr;	/* outbound */
+		u32		desc_write_addr;	/* outbound */
 	};
 	union {
 		u32		start_h_v;		/* inbound */
-- 
2.17.1

