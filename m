Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07400C0B58
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfI0Sfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:35:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47064 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbfI0Ses (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYmmO066341;
        Fri, 27 Sep 2019 13:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609288;
        bh=sTsSEmn5cWa+cgT3qecweduiY1OYBm5Hf9RAoJ207OA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oOL82h/Br1Zyg5aLqcL9g8ORGz5k+OoW2wOJ3r/q+yuCxa4hZL4+AFtPAG2dlawJz
         F1uWicU8142eoNQMqOoWgUCZKD7JWeHr0ImmmEVX2iMtzipL7QK8e0tlm5zYuMWRDO
         VQTidyPcb9uqp8n+J3aMKuWFBZwhI+xJvOcw5lJc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYm3s061181
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:40 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbt073031;
        Fri, 27 Sep 2019 13:34:47 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ram Prasad <x0038811@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 06/16] media: ti-vpe: Set MAX height supported to 2048 pixels
Date:   Fri, 27 Sep 2019 13:36:40 -0500
Message-ID: <20190927183650.31345-7-bparrot@ti.com>
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

From: Ram Prasad <x0038811@ti.com>

VPE's max height supported MAX_H is set to 1184 which is the
padded height from VC1 decoder output.

In case of 90, 270 degree rotated video processing, input to
VPE will be 1080x1920, 720x1280 etc and MAX_H needs to be set
correct value. Setting MAX_H to 2048 as worst case height.

Signed-off-by: Ram Prasad <x0038811@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index f3ee9ff87927..bbbf11174e16 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -52,7 +52,7 @@
 #define MIN_W		32
 #define MIN_H		32
 #define MAX_W		2048
-#define MAX_H		1184
+#define MAX_H		2048
 
 /* required alignments */
 #define S_ALIGN		0	/* multiple of 1 */
-- 
2.17.1

