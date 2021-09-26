Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECB641876A
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhIZIfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:20 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229792AbhIZIfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:16 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UHFtmfkKBczbLUPbQmV5UQ; Sun, 26 Sep 2021 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645220; bh=cPwxdcMYDI5ANmgFFYWlf5yKBD/eeVh9Lbci7WuurOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=J2mx2PXEGQmSanW68D8SRgiWMAXnUT95mwcbDIJK4zE35B8bgyayPK2lDABCaCCWD
         1QRhyl3Lm1x8V+VRsOrxLKSZvOUgMBDhARXYY5ot0FXlBZ3HQW2haqRCByKLgtBOUi
         22NvvfWxkdE8EvH+iPawJSc0dSnxKngOyn1uRKDm4UnDgia0yWtSBJUUDuuICL+KQi
         8g4KKGZkAy7uDlcwuWlc7q/ZOnQsgXzOsVnzDEySoW9HIIVl/W7j5fssRYF8VZlz3D
         JAaRoOev5mTc7yNUm+yqnsWKhL5Hu22aq31ht8BwS3I62hv4wWWgxALvO1OskAi+3T
         TR2/+lB8suL8g==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbPm6iFE; Sun, 26 Sep 2021 08:33:40 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503064
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=E4F5njE0240e4IrhLHkA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 15/29] edid-decode: change unknown CTA block names
Date:   Sun, 26 Sep 2021 01:33:16 -0700
Message-Id: <20210926083330.5206-16-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIKedk/vO9v2MlsS9rBm6JDEQFBBPVGfN3SYJRLjTpZqjbx2srqQbtioKjSnrTi470QZWnyj4qmDQlCYgWoiOz++yWJeTPfQGgsGeEtg+SrHcAdgzCYM
 ZedvgP+Ej+88skuRaDX4/ccZmJL53ZH07G7oasjbIts5Hp7W6sg8PUrJ8MHX5spbRwTzG2RH4LYs5PRGANHHFjufJ1jG+bMLC6U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make consistent the Unknown CTA-861 Data Block names and warnings.

- Add " Data Block" suffix for normal tags (like unknown extended tags and known normal tags have).
- Put tag in parenthesis (like unknown extended tags).
- Output colon after unknown block name (like known tags).
- Make warning same as block name (so the block mentioned in the warning section can be found more easily in the edid output).

1) Unknown normal tags:
Before:
- name: "Unknown CTA-861 tag 0x$$"
- warning: "Unknown CTA-861 Data Block #."
After:
"Unknown CTA-861 Data Block (tag 0x$$):" (with period instead of colon for warning)

2) Unknown extended tags:
Before:
- name: "Unknown CTA-861 @Data Block (extended tag 0x$$)" (@ = "", "Video-Related ", "Audio-Related ", "HDMI-Related ")
- warning: "Unknown Extended CTA-861 Data Block 0x$$."
After:
- "Unknown CTA-861 @Data Block (extended tag 0x$$):" (with period instead of colon for warning)

We still have the following from a previous commit:
3) Truncated extended tag (when length is not enough to get the extended tag):
Before:
name: "Unknown CTA-861 Data Block (extended tag truncated):"
failure: "Extended tag cannot have zero length."

Since the name is different than the failure message, we should set data_block so both are output to the failure section:
After:
failure: "Unknown CTA-861 Data Block (extended tag truncated): Extended tag cannot have zero length."

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 79354c5..16c7bee 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2057,7 +2057,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
 	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
 
-	case 0x07: data_block.clear(); break;
+	case 0x07: data_block = "Unknown CTA-861 Data Block (extended tag truncated)"; break;
 
 	case 0x700: data_block = "Video Capability Data Block"; break;
 	case 0x701: data_block.clear(); break;
@@ -2088,22 +2088,16 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 
 	default:
 		data_block.clear();
-		if (tag < 0x700) {
-			printf("  Unknown CTA-861 tag 0x%02x\n", tag);
-			warn("Unknown CTA-861 Data Block %u.\n", tag);
-		}
-		else {
-			if (tag < 0x70d)
-				printf("  Unknown CTA-861 Video-Related");
-			else if (tag < 0x720)
-				printf("  Unknown CTA-861 Audio-Related");
-			else if (tag >= 0x778 && tag <= 0x77f)
-				printf("  Unknown CTA-861 HDMI-Related");
-			else
-				printf("  Unknown CTA-861");
-			printf(" Data Block (extended tag 0x%02x)\n", tag & 0xff);
-			warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", tag & 0xff);
-		}
+		std::string unknown_name;
+		     if (tag < 0x700) unknown_name = "Unknown CTA-861 Data Block";
+		else if (tag < 0x70d) unknown_name = "Unknown CTA-861 Video-Related Data Block";
+		else if (tag < 0x720) unknown_name = "Unknown CTA-861 Audio-Related Data Block";
+		else if (tag < 0x778) unknown_name = "Unknown CTA-861 Data Block";
+		else if (tag < 0x780) unknown_name = "Unknown CTA-861 HDMI-Related Data Block";
+		else                  unknown_name = "Unknown CTA-861 Data Block";
+		unknown_name += std::string(" (") + (extended ? "extended " : "") + "tag " + utohex(tag & 0xff) + ")";
+		printf("  %s:\n", unknown_name.c_str());
+		warn("%s.\n", unknown_name.c_str());
 	}
 
 	if (data_block.length())
@@ -2168,10 +2162,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		break;
 	case 0x04: cta_sadb(x, length); break;
 	case 0x05: cta_vesa_dtcdb(x, length); break;
-	case 0x07:
-		printf("  Unknown CTA-861 Data Block (extended tag truncated):\n");
-		fail("Extended tag cannot have zero length.\n");
-		break;
+	case 0x07: fail("Extended tag cannot have zero length.\n"); break;
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
 		data_block_o("Vendor-Specific Video Data Block");
-- 
2.24.3 (Apple Git-128)

