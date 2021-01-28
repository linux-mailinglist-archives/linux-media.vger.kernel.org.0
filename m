Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412A1306E3D
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 08:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhA1HMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 02:12:14 -0500
Received: from m12-17.163.com ([220.181.12.17]:33050 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231354AbhA1HLk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 02:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5uj5T
        zSleCBZ/TugZJWogk55CoyHkSjJ+h5FB0uMOjw=; b=bPX9a7PQ0PD2Hk3dCBM9r
        G4sftHw8+PCOj5C8lUFFsARhmswsimUe5/DkPRn6FH0SGz/9ekyzPtf+k3I5Fw9T
        jOCi1nq01eSLEB3RTSXUTUQTlNriiECmVhYLkaKdgsNIfoSeaneX3cCW39r6VFyD
        KJ8qgZp5Ru0YXDdK8U+dfE=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp13 (Coremail) with SMTP id EcCowADnrVVsXxJgoRuLiA--.14315S2;
        Thu, 28 Jan 2021 14:53:33 +0800 (CST)
From:   dingsenjie@163.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] media/pci: fix spelling typo of frimware
Date:   Thu, 28 Jan 2021 14:53:29 +0800
Message-Id: <20210128065329.16160-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowADnrVVsXxJgoRuLiA--.14315S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4fCw1rCFWxGFWrtr4Dtwb_yoW3GFg_WF
        ykXa17XryxtrW5AF45tr1xZry0kayUuFW8G3Z3trWrGw13ur1DJryqkrWUX3WDXF4jyr1U
        Ar1fWa1UZr1UtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5873PUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiZQ0oyF8ZMgY3TQAAsA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

frimware -> firmware

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/media/pci/saa7164/saa7164.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 2801a2b..4b4eb15 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -24,7 +24,7 @@
 	saa7164_bus..() : Manage a read/write memory ring buffer in the
 		|	: PCIe Address space.
 		|
-		|		saa7164_fw...()	: Load any frimware
+		|		saa7164_fw...()	: Load any firmware
 		|			|	: direct into the device
 		V			V
 	<- ----------------- PCIe address space -------------------- ->
-- 
1.9.1


