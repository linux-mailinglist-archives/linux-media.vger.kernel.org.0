Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46CC6444C5
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 14:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbiLFNkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 08:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbiLFNkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 08:40:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01D7BC01;
        Tue,  6 Dec 2022 05:40:16 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FE6F480;
        Tue,  6 Dec 2022 14:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670334013;
        bh=46EfPTXSi5tRM46misVzorPjELmXxNA66rYwEw0VKSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pD1lGr/McGBKPr+IznOXAz4kBGHTQsdWx61RN/nq+x1Z9kkxNoE9j86Ms65bAIaG5
         /tQ3IokV17ik2iz/BirHbZT2jbcu4b9anm2heWTcy0/Cn7ObdtWbR5MT4zyTpwc3EM
         s6iS/xQ7+k4Buhl4mFFZidA773yXzYCty8HyNQ1Q=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 4/7] media: renesas: vsp1: Add V4H SoC version
Date:   Tue,  6 Dec 2022 15:39:51 +0200
Message-Id: <20221206133954.397098-5-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add VI6_IP_VERSION_SOC_V4H so that we can identify V4H SoC.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 8c9333f76858..c61e8dafeecf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -782,6 +782,7 @@
 #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
+#define VI6_IP_VERSION_SOC_V4H		(0x06 << 0)
 /* RZ/G2L SoCs have no version register, So use 0x80 for SoC Identification */
 #define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
 
-- 
2.34.1

