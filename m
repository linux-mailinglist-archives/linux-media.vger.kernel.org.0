Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ECE418772
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhIZIgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:23 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:39575 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhIZIgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:22 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id UBZAmHI0xps7PUPcTmzSIP; Sun, 26 Sep 2021 08:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645285; bh=RIre7ZjEMinoV5K4DUQBqBEtN7eUzwcaElO9OCBt7j8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MDiPmDxnyaP5NXRQCtwQjayLWrLTmHcmlJ67sZWlAGuoKZ6xruEmgAMjQByGAUFyA
         eYEUbLksUIpCkWEF11Fd8fciVaBBtSWvwia/AxZYqi9FFtVEjexl7iLB2RBrmz/SF8
         GK3Q3jyTRUR5w12hYwXp5xWdWcePuH6ZmXlAfV1wkQNstP5hezdo+BDE52CQAp9pYc
         cuwD0EzQoF9qxJIVaAi16rNFH3Ho1OUJX6+cuB4Q/qTan0hPc0jqFSphWkUaQ5+Dfk
         evJcgLB9tSbRwHZRZ+J1Vz5WxjE0CTNK/JxCvZ7zp5kC53x7LfIBvplx44RH9rsSlK
         T75EhX/04EQ6g==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcTmdRJ9; Sun, 26 Sep 2021 08:34:45 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a5
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=lgizLmqXkyJUOuj-0BQA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 23/29] edid-decode: DisplayID length checks
Date:   Sun, 26 Sep 2021 01:33:24 -0700
Message-Id: <20210926083330.5206-24-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMSYf/bEfKSgHZGtRkmNbJlHIJUQlYGecVYv5/+SwrI/lkbVYidu9MToZ9RqszxS29kV6X0MUXaQFkLDvqXDzKXwdYG2NFOq0S302O5Y7TtObb8VRdRV
 00OuAkYOOcrTA8jYZ4UrCdUmF5zpJVQzEzRQA5ZkeEYbfrY//Mj17ZBaHeaFWLRHeULRVUpznAXIT3jJcuFv3Xud5/QY635WcyY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Only report DisplayID version discrepancy for a data block after verifying that the data block exists and is properly sized. The fail message is output after the block name instead of before the block name.
- Output hex bytes of non-zero filler when length is 1 or 2. We did the same for lengths longer than that in a previous commit.
- Output hex bytes that are skipped when the block length is longer than the number of bytes remaining in the DisplayID block.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index dc2ec7b..269444b 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1721,25 +1721,22 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
 		}
 
-		if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
-			fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
-			     version >> 4, version & 0xf);
-		if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
-			fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
-			     version >> 4, version & 0xf);
-
 		if (length < 3) {
-			// report a problem when the remaining bytes are not 0.
+		// Report a problem when the remaining bytes are not 0.
+		data_block.clear(); // Probably not a Data Block so clear this.
 		if (tag || (length > 1 && x[1])) {
+			printf("  Filler:\n");
 			fail("Not enough bytes remain (%d) for a DisplayID data block and the DisplayID filler is non-0.\n", length);
+			hex_block("    ", x, length);
 			}
 		return length;
 		}
 
-	unsigned block_rev = x[1] & 0x07;
-
 		if (length < len + 3) {
+		data_block.clear(); // Probably not a Data Block so clear this.
+		printf("  Filler:\n");
 			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
+		hex_block("    ", x, length);
 		return length;
 		}
 
@@ -1756,6 +1753,15 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 		printf("  %s:\n", data_block.c_str());
 
+	if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
+		fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
+			 version >> 4, version & 0xf);
+	if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
+		fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
+			 version >> 4, version & 0xf);
+
+	unsigned block_rev = x[1] & 0x07;
+
 		switch (tag) {
 	case 0x00: parse_displayid_product_id(x); break;
 	case 0x01: parse_displayid_parameters(x); break;
-- 
2.24.3 (Apple Git-128)

