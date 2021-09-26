Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB02C418770
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhIZIgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:21 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229571AbhIZIgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:20 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id UDIkmfT6IczbLUPcSmV5Vd; Sun, 26 Sep 2021 08:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645284; bh=Jv5cjoJfUV3MNRof2bX9CbbnUzJDlRhmkzR959HzaZo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YQAYhddPt/XUw9hrhKypd7ffCfqHhCkEna4LBXJ8XHX9SanxkJVV9UQSpQmJWbUQl
         YbdMOla0EgWEHesZbuHblrj/iIYiB3Tcfr/RGSpjyMwspSmMen9gaYG/kOw+7uQRwp
         TWqbfZ7so5Xyns+JnJT9nNT4ijyBDR+9eDE9TP3rjpV76wwRO9P3c4om/DKVP1EP2V
         6QK2OXe7oX5dvNoco4BkAxjH5VJUD3grSmdirva925V73+GAzECsVayOe1Rx+447K8
         fSr99IY63uCmaPMOddAuZK5Fg5EwmVmqtmU7YlK6BREAZ3i5lBH69UmiaaIeMCpJE7
         j+Ze+dym9vZnQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcSmdRJ2; Sun, 26 Sep 2021 08:34:44 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a4
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=Yovvzn6Zekd1wrSMwOgA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 21/29] edid-decode: ignore DisplayID version for OUI check.
Date:   Sun, 26 Sep 2021 01:33:22 -0700
Message-Id: <20210926083330.5206-22-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMJmqFOUP5QcCIvRiYJ9+llvI47OQBVtgC8AuGoreFWffCn8acAZm3DCUmBYOY964MLnFkEy27cmA8zAVjCAU9DORNRVb/PvI4JoPRmsCcgg2Pa1DfmH
 QNkN2n2J2ioYdILE6pEs4lANasMkwOLUEPIw0KyhCFZcv7TXs2//uYxpZoYAJ7P3pW8UMpyKafHtGLzJ/1W5mWPHdXbdo3M27oc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Interpret VESA data block even if DisplayID version is not 2.0. See example apple-xdr-6k.
- Remove the "Unknown DisplayID Data Block" fail message for these tags because there's a "Use of DisplayID v#.# tag for DisplayID v%u.%u.\n" fail message for them.
- Include tag number for ambiguous DisplayID tags.
- Don't need tag number for 0x81 because it's not ambiguous.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index c090056..5266bb3 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1697,8 +1697,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
 		case 0x7e: // DisplayID 2.0
 		case 0x7f: // DisplayID 1.3
-			if ((tag == 0x7e && version >= 0x20) ||
-			    (tag == 0x7f && version < 0x20)) {
+		{
 			oui = (x[3] << 16) + (x[4] << 8) + x[5];
 				const char *name = oui_name(oui);
 				bool reversed = false;
@@ -1709,17 +1708,15 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 						reversed = true;
 				}
 				if (name)
-					data_block = std::string("Vendor-Specific Data Block (") + name + ")";
+				data_block = "Vendor-Specific Data Block (" + utohex(tag) + ") (" + name + ")";
 				else
-					data_block = "Vendor-Specific Data Block, OUI " + ouitohex(oui);
+				data_block = "Vendor-Specific Data Block (" + utohex(tag) + "), OUI " + ouitohex(oui);
 				if (reversed)
 					fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order.\n").c_str());
-			} else {
-				data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")";
 			}
 			break;
 		// 0x80 RESERVED
-		case 0x81: data_block = "CTA-861 DisplayID Data Block (" + utohex(tag) + ")"; break;
+	case 0x81: data_block = "CTA-861 DisplayID Data Block"; break;
 		// 0x82 .. 0xff RESERVED
 		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
 		}
-- 
2.24.3 (Apple Git-128)

