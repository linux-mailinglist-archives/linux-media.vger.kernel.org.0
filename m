Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D3641AD23
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 12:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbhI1KkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 06:40:17 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:49628 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239952AbhI1KkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 06:40:16 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UwjamiW1PczbLVAVQmcz2A; Tue, 28 Sep 2021 10:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632825516; bh=iu0ji+WZqDZGMJRbTP58OFwkH4GHUlnMblbiEcqDTEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sl5jwPdgCtF+uUiRFGIGz4SgcsJY4i/FNas2DST0uTmeoQJ0khpJFw1BAsv7M7s/9
         ddxVTAmLL6P5E607M6UayKoDUFx12DWEkgedQS2hyUMDaKg9wRyBwP/OxV9PXvOi83
         vcv/ubhFSNP1LhcFlfKJvWb86aUxfhYSJSOb1e/BPXemhjGHZjinU8EoOOmhSxbhi6
         0Hy3J68JDnYF99d6vDQptyqOmTJzE4tX/upfxaKuRlTEJ5/K0p75yHImahNLVfO4FO
         bWqFt9WJrOCD/dCcN4n2lYGXOdvcWw3iNny0PyusxZzF7XltAtrmJrvjasc1qUd3Dd
         6HOEKDcJq+syQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id VAVOm7MUwdCHGVAVQmF4AT; Tue, 28 Sep 2021 10:38:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6152f0ac
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=dw0t6H4-AAAA:8 a=J-2bKtNIKPRUydmmaZAA:9 a=c-cOe7UV8MviEfHuAVEQ:22
 a=wVJa4CU9-Z26yuRAZDil:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] edid-decode: fix pnp and oui
Date:   Tue, 28 Sep 2021 03:38:33 -0700
Message-Id: <20210928103834.2186-2-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210928103834.2186-1-joevt@shaw.ca>
References: <20210928103834.2186-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD9hOCLDCCWdq6RcTGDNn5bX8EDrdsMnfu+PuCP3KSGth/3oGaNVy0xGsR18tooCqQPhBw0fhuHgrb3PMNBZzM8g9+NkgU4NsGgHI4qSH5oeIChdG8+I
 /iLf8AWfXKJv7DykUnrUiFwxsprFiYLUAChCiCxt+/d/ueCjMEnyftb4UGlq7kvPzo+QZmJsR0vDXKPtioU21sJd460+UWxToHo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes:

- In oui.h, PNP-IDs are 32-bit numbers representing 3 ASCII characters followed by a null character. The most significant byte contains the first character, for example: hex identifier 0x41505000 ('APP\0'). This way, it is not possible to match an OUI (24-bit number, bits 31-24 are zero) when we're trying to match a PNP and vice versa. The fact that an OUI might look like a PNP is a coincidence - only one of the interpretations is correct. oui.h currently only includes unambiguous OUIs/PNPs. It is extremely unlikely that an EDID has an OUI/PNP that matches one of those when a different vendor is meant because the other three possible interpretations don't exist in the list of known OUIs and PNPs.

- For DisplayID blocks, OUIs and PNPs are assumed to be big-endian to match the DisplayID specs 1.3 and 2.0. This change causes the "Endian-ness (le) of OUI is different than expected (be)." message to appear for Apple VSDB because Apple includes their OUI as little endian even though the same EDID may have a VESA VSDB in the correct big endian format. Maybe this message shouldn't happen for DisplayID tags from the 1.3 spec since they are expected to use PNP and we already output the message "Expected PNP ID but found OUI." We don't check reverse byte order interpretation of PNPs so the bigendian parameter could be ignored in the 1.3 spec cases.

- In data_block_oui, matched_ascii can only be true if we find the name using a PNP. Currently in oui.h, we have no conflicts between the PNP list and the OUI list so an OUI match and a PNP match cannot both occur and therefore it doesn't matter that we try to match OUI first if we're actually expecting to match a PNP.

Notes:

- data_block_oui tries to match 3 variations (3 interpretations of the bytes): OUI in expected order, OUI in unexpected order, and PNP (big endian).
- Expected order is big-endian for DisplayID blocks and little-endian for CTA blocks.
- I don't think any EDIDs use PNP, no matter what DisplayID version or tag is used. The PNP code exists only because the DisplayID v1.3 spec says it uses PNPs.
- There are 15 known OUIs that could be interpreted as a PNP (none of those are included in oui.h). Of those 15 only one of them, or 6 if you reverse the bytes, also exists as a known PNP (but none of those are included in oui.h). None of the four interpretations of those 6 have the same vendor name.
    DYC=Dycam Inc CYD=Cyclades Corporation 445943=zte corporation 435944=
    TNE= ENT=Enterprise Comm. & Computing Inc 544E45=Private 454E54=
    PFJ= JFP= 50464A=HUAWEI TECHNOLOGIES CO.,LTD 4A4650=
    PCH= HCP=Hitachi Computer Products Inc 504348=ThingsMatrix Inc. 484350=
    XEL= LEX=Lexical Ltd 58454C=Ericsson AB 4C4558=
    TGA= AGT=Agilent Technologies 544741=XCHENG HOLDING 414754=
- There are 169 known OUIs that also have a reverse match (but none are in oui.h). 25 pairs of those do not match the same oui (their bytes are not the same in reverse). The two vendor names of a pair are never the same.
    000010=SYTEK INC. 100000=Private
    0000AA=XEROX CORPORATION AA0000=DIGITAL EQUIPMENT CORPORATION
    0002BC=LVL 7 Systems, Inc. BC0200=Stewart Audio
    ...

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp           | 4 +++-
 oui.h                     | 2 +-
 parse-displayid-block.cpp | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 1fc7fce..6df328b 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -706,9 +706,11 @@ void edid_state::data_block_oui(std::string block_name, const unsigned char *x,
 			} else if (do_ascii && valid_ascii) {
 				unsigned asciioui = (x[0] << 24) + (x[1] << 16) + (x[2] << 8);
 				ouiname = oui_name(asciioui, ouinum);
+				if (ouiname) {
+					matched_ascii = true;
+				}
 			}
 		}
-		matched_ascii = do_ascii && valid_ascii && ouiname != NULL;
 	}
 
 	std::string name;
diff --git a/oui.h b/oui.h
index 77342ac..d4fea3c 100644
--- a/oui.h
+++ b/oui.h
@@ -15,6 +15,6 @@ oneoui(0xca125c, Microsoft,    "Microsoft"   )
 oneoui(0x3a0292, VESA,         "VESA"        )
 
 // https://uefi.org/pnp_id_list
-oneoui(0x415050, asciiApple,   "Apple"       )  // 'APP\0'
+oneoui(0x41505000, asciiApple,   "Apple"     )  // 'APP\0'
 
 #undef oneoui
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index d527bf2..b318766 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1678,7 +1678,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	// DisplayID 2.0
 	case 0x20:
 		data_block_oui("Product Identification Data Block (" + utohex(tag) + ")",
-			       x + 3, len, &ouinum, false, false, false);
+			       x + 3, len, &ouinum, false, false, true);
 		dooutputname = false;
 		hasoui = true;
 		break;
@@ -1694,16 +1694,16 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	case 0x2b: data_block = "Adaptive Sync Data Block"; break;
 	case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
 	// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
-	case 0x7e:
+	case 0x7e: // DisplayID 2.0
 		data_block_oui("Vendor-Specific Data Block (" + utohex(tag) + ")",
 			       x + 3, len, &ouinum, false, false, true);
 		dooutputname = false;
 		hasoui = true;
 		tag |= ouinum;
 		break;
-	case 0x7f:
+	case 0x7f: // DisplayID 1.3
 		data_block_oui("Vendor-Specific Data Block (" + utohex(tag) + ")",
-			       x + 3, len, &ouinum, false, true, false);
+			       x + 3, len, &ouinum, false, true, true);
 		dooutputname = false;
 		hasoui = true;
 		tag |= ouinum;
-- 
2.24.3 (Apple Git-128)

