Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49935417E3D
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344809AbhIXXdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:31 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:32974 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237796AbhIXXd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:28 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToZ0mFfKPps7PTufamwEH5; Fri, 24 Sep 2021 23:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526314; bh=ULtVjm+j/WWf/XaWWcvifiUnr9SUenVkJA6OxJnHvsk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cyEoPLgwr2XyOQq7KzondVTn2g+E6de+rrAUn+4cGBMKOjlqKHE4RhCnLKdrjn+Ro
         Lyzm5BT6gyPuR8HN52mjtxnI3rmw1ek6zY1k96XYTq2eT1yiR2LAV/vYnfU2F9cbAh
         0oKooS6F5I+NNEmBrk6kWwukFzd4IKcZZcZ8gAdLXY2luyuM3SUKX1Q73jIPCS71HE
         LIr3cm9pZe0MaKOoA6YiBw/hfqF0LreHw42h+1tIS2FHbI2eutQJeuv3xMzguQXC4Z
         LLPKXxJxYerJixUR8NbQLuPK+/BML+07tlBKSKpbL5twHG8y59IfeurFei1ViZn7Y4
         vFScL4yw/tBYQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufamYw7F; Fri, 24 Sep 2021 23:31:54 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fea
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=3lAKzEw-IZXX5DbEWQ4A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 05/28] edid-decode: Capitalize fail sentence
Date:   Fri, 24 Sep 2021 16:31:26 -0700
Message-Id: <20210924233149.10028-6-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPmUpXe1K0wCbfT5Y663p9jzNsw+1f2521l0F29OmoWj3ymlrFrEcTR6/Ht8+NOHShoryNu9z7ZsjNgmEJngtvSGUAP4P16Kvb1eWOdVjM7hLvARqsnX
 AiEwQzMGpfhhMAPt7D9g7yKxQFjMbA/OwdnNUvUN/Es4BGkgHMSfhzUPOqlQ+cfW3MZ6suSNatzmDHnYaBv3y5BxQ+I9vDGZTAs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Most fail messages are a sentence that starts with a capital letter and ends with a period.
- Remove unnessary break from last switch case.
- Remove extra line.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 703f8ca..f327248 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2055,13 +2055,11 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 	case 0x79:
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
-		break;
 	}
 
-
 	// See Table 52 of CTA-861-G for a description of Byte 3
 	if (audio_block && !(cta.byte3 & 0x40))
-		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
+		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
 	if (data_block.length())
 		printf("  %s:\n", data_block.c_str());
-- 
2.24.3 (Apple Git-128)

