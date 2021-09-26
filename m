Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0D3418766
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhIZIfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:13 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhIZIfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:12 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UHFtmfkKBczbLUPbMmV5UF; Sun, 26 Sep 2021 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645216; bh=zQiDkxoEYRXNy4twOmJPfhCfdi3WE4Jy/ZgnvE7ayAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=pat5vUFXY03JWT80rJPPH7Rh++tdD/cKQQpAQFqDeVYLvT1RJlIIDQsZ9U6f9dcZk
         XlMV0dpvLBUsQ37gAH4J32IN7hmPl78FwJlnCq90VnJeYWCXYtWPbSrItX8lxA8xS7
         JdnIh4VE5jw2TKFhEE6EK5f0/JMMImNx1Th1xjbth+2C9iPjBKyseDnbqIQcDiIbMe
         aSb0zrnmJxv18Z57c1Pdr+NBSj8/70A8CX8mJkJ7/XznDB8eMPrCpsQU6XIRhz0OWW
         6i/X5xJeOSxtHRkwi0gDY1nRSxFurlAZhkzoWVINr+pAOCB0AiX1JqwXZdyJ8Qa7tA
         jsBSZdU2r+Hww==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbMm6iEl; Sun, 26 Sep 2021 08:33:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503060
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=_zDHQJX43gnR_71ToFUA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 09/29] edid-decode: update Microsoft expected length
Date:   Sun, 26 Sep 2021 01:33:10 -0700
Message-Id: <20210926083330.5206-10-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIOATl9zMXl0FJ50DkXDFGJYe7nugBSE5oX2wPChKlD0XksBv6c6X8Dw95FVxT9xU4jbesc1vc5RNEDuv+Hv4/NJmVdA93rWd8EAmPk4z2polZ0YP+US
 20jKE1jZ8LsR11RqNCnnn8k6EvElvpCut1mM8knYpdC3aR/sAfln0T6pOkOCSDAI1fvNs2j5MWXQ0FAkiHhVZ+iZG1cJoYN53i0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we excluded the size of the OUI from the length in a previous commit, we need to decrease the expected length accordingly.
See example DELA07B/5F1B08ADB0A0, LENB800/61B4B713B745

Really, length checks should probably be done in the parse function. If length is greater than expected then parse up to the expected length and output the rest as hex with a warning. If length is less than expected then parse up to the length and warn that some expected bytes are missing.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index fb2e9ea..3b6126a 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2285,7 +2285,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			cta_amd(x, length);
 			break;
 		}
-		if (oui == 0xca125c && length == 0x15) {
+		if (oui == 0xca125c && length == 0x12) {
 			cta_microsoft(x, length);
 			break;
 		}
-- 
2.24.3 (Apple Git-128)

