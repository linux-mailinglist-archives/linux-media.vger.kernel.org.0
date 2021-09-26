Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50004418775
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhIZIgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:24 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhIZIgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:23 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U6HQmeyzUczbLUPcVmV5Vk; Sun, 26 Sep 2021 08:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645287; bh=+xC9rUswx3fQVGLBEoMnBRkB4qushvyUmkY8BNtUdbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Kngfha7iIMcIttn+7uV92unaiAZb2lhW/Hsem1RqBolu2lS8JsB6b+ePpeWUUDsVu
         w4i1hRSZ1nu9m8fPohBm6TpRb7rHxs0RHLF/1aJAlrdKuqGfku8LOLwkGwluvhyAqF
         x+wwlzEX1o2AL+XD/mE+dCuaP/GvzoK7S/9pMw9EW9/zQxNI6S9Fq2SkvEDvJLt2ou
         DX4Xu0cHeCzwtQnvo2ll3c5QNzCJ/fBMj2kuLZxh5TZPBJFFHhRZyJCfMWhpUh0lmB
         gu3NBbZtRJnFTjOOXLhKomuzpanfSi5nDxGlUNQDwynNtR7oHWdVa2BL1RB2eeFvH2
         p21D/cd0moIVg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcVmdRJT; Sun, 26 Sep 2021 08:34:47 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a7
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=lt6d07WIFPTZwTI6txAA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 26/29] edid-decode: remove extra vendor field
Date:   Sun, 26 Sep 2021 01:33:27 -0700
Message-Id: <20210926083330.5206-27-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNoV77aVFgQdbcvecCL9UfIjJkrcDS0GueKV91Y8wnA+e/wiP70DOgXeQQBUUB5h77XHHZhnj91RsO8kyaG7pQgirYUhjp4u6opsVrn/1PjxD9HsGxLT
 eEOQl/ImFogCf8sN/qFIyhHetNCNILAbnj6pPEKLfirVuRPzzAQfZA2wque7RTzQidOpdKA9wuSsZDqID7Nkha+a7gHT2HNJ68U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Since we use the data_block_oui function to get the vendor for the Production Identification Data Block, we don't need to output the vendor OUI or ID separately. data_block_oui is better because it will get the OUI's name (if it is known) and it verifies that the ID is valid ASCII (don't want to print weird control characters).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index a38c90e..ba2c15e 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -81,12 +81,6 @@ void edid_state::parse_displayid_product_id(const unsigned char *x)
 	check_displayid_datablock_revision(x[1]);
 
 	dispid.has_product_identification = true;
-	if (dispid.version >= 0x20) {
-		unsigned oui = (x[3] << 16) | (x[4] << 8) | x[5];
-		printf("    Vendor OUI %s\n", ouitohex(oui).c_str());
-	} else {
-		printf("    Vendor ID: %c%c%c\n", x[3], x[4], x[5]);
-	}
 	printf("    Product Code: %u\n", x[6] | (x[7] << 8));
 	unsigned sn = x[8] | (x[9] << 8) | (x[10] << 16) | (x[11] << 24);
 	if (sn) {
-- 
2.24.3 (Apple Git-128)

