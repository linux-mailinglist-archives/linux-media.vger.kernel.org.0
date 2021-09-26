Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F10418760
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhIZIfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:11 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:46574 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhIZIfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:10 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U6LtmGvqSps7PUPbKmzSGl; Sun, 26 Sep 2021 08:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645214; bh=JnmMHffmExTq6ajnRT9gP/3SxBqgbqFCz1GMZjd/UWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ulQC/Y0u3r7bAN2ymthrNNazj8ZY5+oT6+WqvyciELRbLmvHnynj5TLOiO1xyNpbo
         Hi0lW//MNvS1bjoahKtf1RJF481IKYVFMTRAd2/c1FSxw290H3ivaeg8imNiKBXsnI
         /AAXZdR7vJ65AbzMokVVFSQNzLXh55LiG/4D3Rjsd0pEth9ov0yC2oM1uRBp0LYq/H
         tL3/dmDZhv30D8xv+GKnFKRHEgi6aT5/PjHAEVQjmhFuSNMQi3t4jw9Il63Tkd42WO
         8GTLFcW9HkPh5bqKpX8SwedUgyJ+JXSZ6AFIWrfeWfOfrNVD5QtbVgE2HOUJCL7ckc
         IudA8rTzEiEYw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbKm6iET; Sun, 26 Sep 2021 08:33:34 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305e
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=3lAKzEw-IZXX5DbEWQ4A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 05/29] edid-decode: Capitalize fail sentence
Date:   Sun, 26 Sep 2021 01:33:06 -0700
Message-Id: <20210926083330.5206-6-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLFoTLRz3bL6MEACqf5noFWedrUsQesKX3P2nBg2JMk54cJSGqwKRlDp2CFqCHORbp/agYABii3BsPR6oukkXGjAhcw5OlXKJ4k5WbETDh+sHTQU6QCW
 C/3SBgAZihneSmLIN1UUbsmBolvT9QmP4T6NhvWk5qnv07YJ9fUiS1iEHlxEFTQ9YNt4vcopluRqCyTXqKk8fMgI0a0AlMezoO4=
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
index 6607426..042b933 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2091,13 +2091,11 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
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

