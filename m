Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA72CC076
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730836AbfJDQ1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:27:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60602 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730787AbfJDQ1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:27:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GRqBt081551;
        Fri, 4 Oct 2019 11:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206472;
        bh=sTsSEmn5cWa+cgT3qecweduiY1OYBm5Hf9RAoJ207OA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=zPBxYO0dWojex5ltAIWwl2xc8K8hqNSElJBubDwD1CS+Og3l0v2Oi1UNrDQWoZDdL
         xUC8CgsSUcac7VvFYww3TxtfET4C1ZucO+fOKNFYmd/vdw/h5y6PQTqoXvgwjr2fIh
         Z2xB4MgW217qg935o8wt9MowbbDsCMWPi+NjkuAY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GRq5X055952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:27:52 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:27:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:27:51 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgA9028904;
        Fri, 4 Oct 2019 11:27:52 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ram Prasad <x0038811@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 07/21] media: ti-vpe: Set MAX height supported to 2048 pixels
Date:   Fri, 4 Oct 2019 11:29:38 -0500
Message-ID: <20191004162952.4963-8-bparrot@ti.com>
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

