Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1360417E47
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345011AbhIXXdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:36 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:56763 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229669AbhIXXde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:34 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TnB0mdZICczbLTufgmRrWx; Fri, 24 Sep 2021 23:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526320; bh=HqM/TtY5Rw/8PE3QJFImHOFZm/Ov5jxJSaA72UWuxnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HBN7ZEU+8icq47tU+suycs/vCwsV1YLAl/EFE3cbNb4VbmSwmiyhSDnFp+81yDoEZ
         stPfvk7dJOJBHDyR7H11PhPJgh+FZXOL5JnlKhAXeXoUd/JTpErUFJbi5t2d39qUUY
         FpwBVl2cmxJicXJSCg7/Vjo5CmX9/UO2zE4RXkc5c2zgOgA5/ZOdhQHoksbjaCILCV
         Z/Hg8NF7VZByPm4QZt/Oegh860zQak3P1qCjUFNtNilHd88swvBy1gLDrNfCL6ytr1
         /aApG3sRnl5qdmyIJIsrh6BJRIenpqO1sTZNzvogCoMMd0ZYaocvtah6ddYTKt2Fc4
         sUEuveQpTUWFQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTuffmYw8q; Fri, 24 Sep 2021 23:32:00 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5ff0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=E4F5njE0240e4IrhLHkA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 15/28] edid-decode: change unknown CTA block names
Date:   Fri, 24 Sep 2021 16:31:36 -0700
Message-Id: <20210924233149.10028-16-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAaJwyvIsMPFa+rEAty9mGxSQKG6Mhp1EL9a0c73T2Oy6i3ZT0tntNQ3Ynf2icBV9RNvRlYZDWD+YqNG1YpEbKeNumwioLsJDtRPxozZmaByRTrpJARu
 WHeemQvklQTGIFT9Kltwc8yqiJkfyqEmniKNNw/5GP1rRGuqMpJJ+AbVZNOpLxiCLad/38KLrGTQD5yWQvxZib/ryZ7vddSW9x8=
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
index a53dc43..a3690d7 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2021,7 +2021,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
 	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
 
-	case 0x07: data_block.clear(); break;
+	case 0x07: data_block = "Unknown CTA-861 Data Block (extended tag truncated)"; break;
 
 	case 0x700: data_block = "Video Capability Data Block"; break;
 	case 0x701: data_block.clear(); break;
@@ -2052,22 +2052,16 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 
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
@@ -2132,10 +2126,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
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

