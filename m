Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E2C40AD63
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhINMUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:04 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43889 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232888AbhINMUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:20:01 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PxdsmLnQJczbLQ7Hkmm238; Tue, 14 Sep 2021 12:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621496; bh=zacBV0bc/DtvEOc9L6XQdhBONBZA8Ee+ewbXscUp9gA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=VrLsO5QwSEyoJUlONrcvNpwMN7LAhDO7512iaghyDipphHnp0ADUHev1bI5oK8idX
         oGHy8NgdZhwz+9acC5HdK8H+ZgvAwVYykbg1kzY7IwFt4j34K3sp5VmA6Z81gwo5q+
         re3YGo+jylt6YQ5I9b8vBImqsJ/Ud0JMGXzeiDsVf9xulvvB7ufldimd/ACc3O1d7C
         iox9NvP1SiqKJq3cviu3R5XjcuXbfV55QQxj9KQ4UCdbqf5wdtwZ7aUXrnhtuxYv/g
         mjaEIqDGYqyg7Pxzk+hwfwj+DM8GvC5kYsRseq9G7aHO7Pa8UZZ03zXX8TOHPNl0ll
         hkEHh/+ynFC1w==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hkmpv1K; Tue, 14 Sep 2021 12:11:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409178
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=gUsYxTUpQvwOvGqYgzEA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 09/11] edid-decode: allow undefined aspect ratio
Date:   Tue, 14 Sep 2021 05:11:27 -0700
Message-Id: <20210914121129.51451-10-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCBo+5f51KZNHw1xvYOgvbBduSeJ+uOq0zi97Rxx6bi4luMWUak0yUu4tFACLvKcnEloO0wNApxyMonPULTX6lLZb8XoIzknMY7j8SQ2K2/pLFqZwWso
 VrzPEfMa9CjASfVcflrwP/aI+mKogi22RT1w6MY7SY/7GlolTqUDu5xJIVZ3T/CnQ5/a3vXCLvwA2ZfjesSbs+RmZu0vM97ryho=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Distinguish between "undefined" and "reserved" aspect ratios. See examples apple-xdr-6k-tile0, lg-ultrafine-5k-v1-thunderbolt-dp1-tile0, asus-xg438q-dp
"undefined" is for an aspect ratio that doesn't exist in the list of known aspect ratios. This does not deserve a fail.
"reserved" should not be used and still deserves the fail.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 9713c46..8f4e366 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -270,10 +270,12 @@ void edid_state::parse_displayid_type_1_7_timing(const unsigned char *x,
 		t.hratio = 256;
 		t.vratio = 135;
 		break;
-	default:
+	case 8:
 		s += "undefined";
-		if ((x[3] & 0xf) > (dispid.version <= 0x12 ? 7 : 8))
-			fail("Unknown aspect 0x%02x.\n", x[3] & 0xf);
+		break;
+	default:
+		s += "reserved";
+		fail("Unknown aspect 0x%02x.\n", x[3] & 0xf);
 		break;
 	}
 	switch ((x[3] >> 5) & 0x3) {
@@ -455,10 +457,12 @@ void edid_state::parse_displayid_type_3_timing(const unsigned char *x)
 		t.hratio = 256;
 		t.vratio = 135;
 		break;
-	default:
+	case 8:
 		s += "undefined";
-		if ((x[3] & 0xf) > (dispid.version <= 0x12 ? 7 : 8))
-			fail("Unknown aspect 0x%02x.\n", x[3] & 0xf);
+		break;
+	default:
+		s += "reserved";
+		fail("Unknown aspect 0x%02x.\n", x[0] & 0xf);
 		break;
 	}
 
-- 
2.24.3 (Apple Git-128)

