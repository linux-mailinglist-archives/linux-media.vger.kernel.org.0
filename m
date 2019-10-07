Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7818CE684
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfJGPHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:07:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37386 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbfJGPHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7h73066227;
        Mon, 7 Oct 2019 10:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460863;
        bh=sTsSEmn5cWa+cgT3qecweduiY1OYBm5Hf9RAoJ207OA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d38o83Q/UbDrvvRhrOGLhtPz9ffQsDes+w4fc+AdFc6W9K7fAOxj1lXWhpusAmQ5b
         4djjsaKKaNgqOAA7xWOvVQyu5mbXtYkaNcVgR+Hy49RRz7xEIuG0ToQ7ilalCZbsEi
         XUCGUZTPArErVWGre1r7wnFjoe7EQjslK7kUmlJs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97F7h8b043020
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 10:07:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:41 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aFD055156;
        Mon, 7 Oct 2019 10:07:43 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ram Prasad <x0038811@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 07/21] media: ti-vpe: Set MAX height supported to 2048 pixels
Date:   Mon, 7 Oct 2019 10:09:55 -0500
Message-ID: <20191007151009.22095-8-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
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

