Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE0A418773
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhIZIgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:23 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229702AbhIZIgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:23 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U65gmeyQJczbLUPcUmV5Vg; Sun, 26 Sep 2021 08:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645286; bh=VBXImBsHU+49GKMeYY06cHOsFA3n0B1e4+/j7UBwk1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jbD4AhV/hx5Pt4miblb8XFsKDfEVcjwIHNLc5zeGDADIRWYTpUB+bkFeeaUSs60PT
         0Li8MIPNVKCPyVlpbBDS1t7lbfVCj/vb3/wxZj0a0alVfdsy+GLW1VX7Ayra2nlBeJ
         7LDmF+OgAMZmS5l85Lp4yN04Migc+3T5p/durw8CbWvIXturlfwc75JUeMdhx7WzHV
         SFSB4eLBSQytpfMFO2aTsbYRV67LYSZt2WYZr2dF+B/fQq84dTidBr41/NW3ATKj0m
         oB7UUhd/ipmXC+NQB60M0WVmVV25+WIBJv0PDpjUSjMehpwohslZGojJOCLBsoAsg4
         /RyRHVWuwmpGw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcTmdRJF; Sun, 26 Sep 2021 08:34:46 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a6
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=o83nqyVRAAAA:8 a=dw0t6H4-AAAA:8 a=f3f_0qRwYyljyiL5AasA:9
 a=c-cOe7UV8MviEfHuAVEQ:22 a=wVJa4CU9-Z26yuRAZDil:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 24/29] edid-decode: make OUI enum
Date:   Sun, 26 Sep 2021 01:33:25 -0700
Message-Id: <20210926083330.5206-25-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCsreC3QcxXq/SoWFGulpMsopXd8EuPVqX7NKgOen5+UUM8xCzmSJroEC9xFwtUHyewJEMsPYxL1hwbdS0bV/K1P2h1dZdxnWx8N5Lvicu20HD5M+H2n
 reYl9EMq9YmTPCdfhO9cN7KfMuTIBfbdV3EEdD3Nn55hyxxwO4OPmLz9TGZyM6/vi231Q/IVMGY2S6LU6BdW+GwoBiuHrXF49Ro=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of a 3 byte value, create an enumeration of known OUIs. This way, it can be combined with tag value to identify a data block type with a single value. This value can be used in a switch statement or other places (see later commits).

- The list of known OUIs is in a new file oui.h. It contains the 3 byte value, a enum base name for the enum, and the OUI name.
- The oui.h can be included in other source files for different purposes be changing the oneoui macro. It's used in edid-decode.h to define the enumeration.
- Function oui_name uses oui.h to convert an OUI to the enum value. Removed the reverse parameter - OUI byte order is now handled by the caller, data_block_oui.

- data_block_oui is modified to do the following:
 - It will return the oui enumeration.
 - It is made suitable for OUIs in DisplayID data blocks.
  - The ignorezeos flag is only true for the DisplayID "Product Identification Data Block". If the data block is zeros then it's probably not a data block so ignore it. For "Product Identification Data Block", the OUI doesn't change the interpretation of the data block so caller (displayid_block) then immediately clears the OUI enum.
  - The do_ascii flag is true for DisplayID v1.2 data blocks (section 4.1.1 of the DisplayID 1.3 spec says Manufacturer/Vendor ID is ASCII).
  - The big_endian flag is true for DisplayID v2.0 data blocks and false for CTA-861 data blocks.
  - It always outputs the block name first so that fails and warnings will appear after the block name instead of before.

data_block_oui does the following:
- It gets the OUI bytes in the order determined by the big_endian flag. An OUI is a 24 bit number.
- It gets a PNP ID value (ASCII) with the same 3 bytes. A PNP ID in oui.h is a 32 bit number (3 characters [A-Z] followed by a NULL) so it cannot be confused with an OUI in the same file.
- If bytes of the OUI extend beyond the end of the block then they are assumed to be zero, and it does not try to convert the OUI to a name, and the enum result is 0 which is invalid, and the PNP result is "?" which is invalid.
- It tries to match the OUI. If that doesn't match then it tries to match the reversed OUI. If DisplayID v1.2 then it also tries to match PNP if the other two didn't match.

- If ASCII is expected (DisplayID v1.2) and found, the output block name is "block_name, PNP ID 'ABC'". It is output with a colon as usual.

- The "Unknown block_name, OUI %s." warning message is replaced by "Unknown OUI %s." (or with "Unknown OUI %s (possible PNP %s)." if ASCII is expected and the OUI is valid ASCII). In either case, the warning is prefixed by "block_name, OUI %s:" or "block_name, PNP ID %s:" in the warnings and failures section.

- The "Invalid length %u < 3." fail message is replaced by "Data block length (%d) is not enough to contain an OUI.".

- The "OUI %s is in the wrong byte order" fail message (which is missing the trailing period) is replaced with "Endian-ness (be|le) of OUI is different than expected (le|be)."

- In parse-cta-block.cpp and parse-displayid-block.cpp, in the first switch statement, any tag with an OUI has its block name output by data_block_oui so they'll set dooutputname to false to stop the block name from being output again.

- In parse-displayid-block.cpp, don't include OUI in hex dump of unknown data block types.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp           | 117 +++++++++++++++++++++++++-------------
 edid-decode.h             |   8 ++-
 oui.h                     |  20 +++++++
 parse-cta-block.cpp       |  78 ++++++++++---------------
 parse-displayid-block.cpp |  46 ++++++---------
 5 files changed, 148 insertions(+), 121 deletions(-)
 create mode 100644 oui.h

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 666a2c6..0da7d85 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -657,60 +657,95 @@ std::string utohex(unsigned char x)
 	return buf;
 }
 
-const char *oui_name(unsigned oui, bool reverse)
+const char *oui_name(unsigned oui, unsigned *ouinum)
 {
-	if (reverse)
-		oui = (oui >> 16) | (oui & 0xff00) | ((oui & 0xff) << 16);
-
+	unsigned ouinumscratch;
+	if (!ouinum) ouinum = &ouinumscratch;
+	const char *name;
 	switch (oui) {
-	case 0x00001a: return "AMD";
-	case 0x000c03: return "HDMI";
-	case 0x00044b: return "NVIDIA";
-	case 0x000c6e: return "ASUS";
-	case 0x0010fa: return "Apple";
-	case 0x0014b9: return "MSTAR";
-	case 0x00d046: return "Dolby";
-	case 0x00e047: return "InFocus";
-	case 0x3a0292: return "VESA";
-	case 0x90848b: return "HDR10+";
-	case 0xc45dd8: return "HDMI Forum";
-	case 0xca125c: return "Microsoft";
-	default: return NULL;
+		#define oneoui(c,k,n) case c: *ouinum = kOUI_##k; name = n; break;
+		#include "oui.h"
+		default: *ouinum = 0; name = NULL;
 	}
+	return name;
 }
 
-void edid_state::data_block_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum)
+void edid_state::data_block_oui(std::string block_name, const unsigned char *x,
+	unsigned length, unsigned *ouinum, bool ignorezeros, bool do_ascii, bool big_endian)
 {
-	const char *name;
-	unsigned oui = 0;
-	bool reverse = false;
+	std::string buf;
+	char ascii[4];
+	unsigned oui;
+	const char *ouiname = NULL;
+	bool matched_reverse = false;
+	bool matched_ascii = false;
+	bool valid_ascii = false;
+
+	if (big_endian)
+		oui = ((length > 0 ? x[0] : 0) << 16) + ((length > 1 ? x[1] : 0) << 8) + (length > 2 ? x[2] : 0);
+	else
+		oui = ((length > 2 ? x[2] : 0) << 16) + ((length > 1 ? x[1] : 0) << 8) + (length > 0 ? x[0] : 0);
 
+	buf = ouitohex(oui);
 	if (length < 3) {
-		printf("  %s:\n", block_name);
-		data_block = std::string(block_name);
-		fail("Invalid length %u < 3.\n", length);
-		data_block.clear();
-	}
-	else {
-		oui = (x[2] << 16) + (x[1] << 8) + x[0];
-		name = oui_name(oui);
-		if (!name) {
-			name = oui_name(oui, true);
-			if (name)
-				reverse = true;
+		sprintf(ascii, "?"); // some characters are null
+		if (ouinum) *ouinum = 0; // doesn't match a known OUI
+	} else {
+		valid_ascii = (x[0] >= 'A' && x[1] >= 'A' && x[2] >= 'A' && x[0] <= 'Z' && x[1] <= 'Z' && x[2] <= 'Z');
+		sprintf(ascii, "%c%c%c", x[0], x[1], x[2]);
+
+		ouiname = oui_name(oui, ouinum);
+		if (!ouiname) {
+			big_endian = !big_endian;
+			unsigned reversedoui = ((oui & 0xff) << 16) + (oui & 0x00ff00) + (oui >> 16);
+			ouiname = oui_name(reversedoui, ouinum);
+			if (ouiname) {
+				oui = reversedoui;
+				buf = ouitohex(oui);
+				matched_reverse = true;
+			}
+			else if (do_ascii && valid_ascii)
+			{
+				unsigned asciioui = (x[0] << 24) + (x[1] << 16) + (x[2] << 8);
+				ouiname = oui_name(asciioui, ouinum);
+				if (ouiname) {
+					matched_ascii = true;
+				}
+			}
 		}
-		if (!name) {
-			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
-			data_block.clear();
-			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
+	}
+
+	std::string name;
+	if (ouiname) {
+		if (matched_ascii)
+			name = block_name + " (" + ouiname + ")" + ", PNP ID '" + ascii + "'";
+		else
+			name = block_name + " (" + ouiname + ")" + ", OUI " + buf;
+	} else if (do_ascii && valid_ascii) {
+		name = block_name + ", PNP ID '" + ascii + "'";
+	} else {
+		name = block_name + ", OUI " + buf;
+	}
+	// assign string to data_block before outputting errors
+	data_block = name;
+
+	if (oui || !ignorezeros) {
+		printf("  %s:\n", data_block.c_str());
+		if (length < 3)
+			fail("Data block length (%d) is not enough to contain an OUI.\n", length);
+		else if (ouiname) {
+			if (do_ascii && !valid_ascii)
+				fail("Expected PNP ID but found OUI.\n");
+			if (matched_reverse)
+				fail("Endian-ness (%s) of OUI is different than expected (%s).\n", big_endian ? "be" : "le", big_endian ? "le" : "be");
 		}
 		else {
-			data_block = std::string(block_name) + " (" + name + "), OUI " + ouitohex(oui);
-			if (reverse)
-				fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
+			if (valid_ascii)
+				warn("Unknown OUI %s (possible PNP %s).\n", buf.c_str(), ascii);
+			else
+				warn("Unknown OUI %s.\n", buf.c_str());
 		}
 	}
-	if (ouinum) *ouinum = oui;
 }
 
 std::string ouitohex(unsigned oui)
diff --git a/edid-decode.h b/edid-decode.h
index c53dba3..9f73e9c 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -334,7 +334,8 @@ struct edid_state {
 	void list_dmts();
 	void list_established_timings();
 
-	void data_block_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum);
+	void data_block_oui(std::string block_name, const unsigned char *x, unsigned length, unsigned *ouinum,
+	                    bool ignorezeros = false, bool do_ascii = false, bool big_endian = false);
 
 	void print_vic_index(const char *prefix, unsigned idx, const char *suffix, bool ycbcr420 = false);
 	void hdmi_latency(unsigned char vid_lat, unsigned char aud_lat, bool is_ilaced);
@@ -460,7 +461,7 @@ void hex_block(const char *prefix, const unsigned char *x, unsigned length,
 	       bool show_ascii = true, unsigned step = 16);
 std::string block_name(unsigned char block);
 void calc_ratio(struct timings *t);
-const char *oui_name(unsigned oui, bool reverse = false);
+const char *oui_name(unsigned oui, unsigned *ouinum = NULL);
 
 bool timings_close_match(const timings &t1, const timings &t2);
 const struct timings *find_dmt_id(unsigned char dmt_id);
@@ -471,4 +472,7 @@ const struct timings *cta_close_match_to_vic(const timings &t, unsigned &vic);
 unsigned char hdmi_vic_to_vic(unsigned char hdmi_vic);
 char *extract_string(const unsigned char *x, unsigned len);
 
+#define oneoui(c,k,n) const unsigned kOUI_##k = __LINE__<<12;
+#include "oui.h"
+
 #endif
diff --git a/oui.h b/oui.h
new file mode 100644
index 0000000..c90f025
--- /dev/null
+++ b/oui.h
@@ -0,0 +1,20 @@
+// http://standards-oui.ieee.org/oui/oui.txt
+oneoui(0x000c03, HDMI,         "HDMI"        )
+oneoui(0xc45dd8, HDMIForum,    "HDMI Forum"  )
+oneoui(0x90848b, HDR10,        "HDR10+"      )
+oneoui(0x00001a, AMD,          "AMD"         )
+oneoui(0x00044b, NVIDIA,       "NVIDIA"      )
+oneoui(0x000c6e, ASUS,         "ASUS"        )
+oneoui(0x0010fa, Apple,        "Apple"       )
+oneoui(0x0014b9, MSTAR,        "MSTAR"       )
+oneoui(0x00d046, Dolby,        "Dolby"       )
+oneoui(0x00e047, InFocus,      "InFocus"     )
+oneoui(0xca125c, Microsoft,    "Microsoft"   )
+
+// http://standards-oui.ieee.org/cid/cid.txt
+oneoui(0x3a0292, VESA,         "VESA"        )
+
+// https://uefi.org/pnp_id_list
+oneoui('APP\0' , asciiApple,   "Apple"       )
+
+#undef oneoui
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 13b3b73..71e0041 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2029,9 +2029,10 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 
 #define data_block_o(n) \
 	do { \
-		data_block_oui(n, x, length, &oui); \
+		data_block_oui(n, x, length, &ouinum); \
 		x += (length < 3) ? length : 3; \
 		length -= (length < 3) ? length : 3; \
+		dooutputname = false; \
 	} while(0)
 
 void edid_state::cta_block(const unsigned char *x, bool duplicate)
@@ -2047,7 +2048,8 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		x++;
 	}
 
-	unsigned oui;
+	unsigned ouinum = 0;
+	bool dooutputname = true;
 	bool audio_block = false;
 	data_block.clear();
 
@@ -2100,7 +2102,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		warn("%s.\n", unknown_name.c_str());
 	}
 
-	if (data_block.length())
+	if (dooutputname && data_block.length())
 		printf("  %s:\n", data_block.c_str());
 
 	switch (tag) {
@@ -2124,53 +2126,37 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	if (audio_block && !(cta.byte3 & 0x40))
 		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
+	tag |= ouinum;
 	switch (tag) {
 	case 0x01: cta_audio_block(x, length); break;
 	case 0x02: cta_svd(x, length, false); break;
-	case 0x03:
-		if (oui == 0x000c03) {
-			cta_hdmi_block(x, length);
-			cta.last_block_was_hdmi_vsdb = 1;
-			cta.block_number++;
-			// The HDMI OUI is present, so this EDID represents an HDMI
-			// interface. And HDMI interfaces must use EDID version 1.3
-			// according to the HDMI Specification, so check for this.
-			if (base.edid_minor != 3)
-				fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
-				     base.edid_minor);
-			return;
-		}
-		if (oui == 0xc45dd8) {
-			if (!cta.last_block_was_hdmi_vsdb)
-				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
-			if (cta.have_hf_scdb || cta.have_hf_vsdb)
-				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
-			cta_hf_scdb(x, length);
-			cta.have_hf_vsdb = 1;
-			break;
-		}
-		if (oui == 0x00001a) {
-			cta_amd(x, length);
-			break;
-		}
-		if (oui == 0xca125c && length == 0x12) {
-			cta_microsoft(x, length);
-			break;
-		}
-		hex_block("    ", x, length);
+	case 0x03|kOUI_HDMI:
+		cta_hdmi_block(x, length);
+		cta.last_block_was_hdmi_vsdb = 1;
+		cta.block_number++;
+		// The HDMI OUI is present, so this EDID represents an HDMI
+		// interface. And HDMI interfaces must use EDID version 1.3
+		// according to the HDMI Specification, so check for this.
+		if (base.edid_minor != 3)
+			fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
+				 base.edid_minor);
+		return;
+	case 0x03|kOUI_HDMIForum:
+		if (!cta.last_block_was_hdmi_vsdb)
+			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
+		if (cta.have_hf_scdb || cta.have_hf_vsdb)
+			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
+		cta_hf_scdb(x, length);
+		cta.have_hf_vsdb = 1;
 		break;
+	case 0x03|kOUI_AMD: cta_amd(x, length); break;
+	case 0x03|kOUI_Microsoft: if (length != 0x12) goto dodefault; cta_microsoft(x, length); break;
 	case 0x04: cta_sadb(x, length); break;
 	case 0x05: cta_vesa_dtcdb(x, length); break;
 	case 0x07: fail("Extended tag cannot have zero length.\n"); break;
 	case 0x700: cta_vcdb(x, length); break;
-	case 0x701:
-		if (oui == 0x90848b)
-			cta_hdr10plus(x, length);
-		else if (oui == 0x00d046)
-			cta_dolby_video(x, length);
-		else
-			hex_block("    ", x, length);
-		break;
+	case 0x701|kOUI_HDR10: cta_hdr10plus(x, length); break;
+	case 0x701|kOUI_Dolby: cta_dolby_video(x, length); break;
 	case 0x702: cta_vesa_vdddb(x, length); break;
 	case 0x705: cta_colorimetry_block(x, length); break;
 	case 0x706: cta_hdr_static_metadata_block(x, length); break;
@@ -2178,12 +2164,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x70d: cta_vfpdb(x, length); break;
 	case 0x70e: cta_svd(x, length, true); break;
 	case 0x70f: cta_y420cmdb(x, length); break;
-	case 0x711:
-		if (oui == 0x00d046)
-			cta_dolby_audio(x, length);
-		else
-			hex_block("    ", x, length);
-		break;
+	case 0x711|kOUI_Dolby: cta_dolby_audio(x, length); break;
 	case 0x712: cta_hdmi_audio_block(x, length); break;
 	case 0x713: cta_rcdb(x, length); break;
 	case 0x714: cta_sldb(x, length); break;
@@ -2212,6 +2193,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		cta_hf_scdb(x + 2, length - 2);
 		cta.have_hf_scdb = 1;
 		break;
+dodefault:
 	default:
 		hex_block("    ", x, length);
 	}
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 269444b..597005e 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1651,16 +1651,23 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
 	}
 }
 
+#define data_block_o(n, a, b) \
+do { \
+	data_block_oui(n, x + 3, len, &ouinum, tag == 0, a, b); \
+	dooutputname = false; \
+} while (0)
+
 unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned length)
 {
 	unsigned i;
 	unsigned tag = x[0];
-		unsigned oui = 0;
+	unsigned ouinum = 0;
+	bool dooutputname = true;
 	unsigned len = (length < 3) ? 0 : x[2];
 
 		switch (tag) {
 		// DisplayID 1.3:
-		case 0x00: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
+	case 0x00: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", true, false); ouinum = 0; break;
 		case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
 		case 0x02: data_block = "Color Characteristics Data Block"; break;
 		case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
@@ -1682,7 +1689,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
 		// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
 		// DisplayID 2.0
-		case 0x20: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
+	case 0x20: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", false, false); ouinum = 0; break;
 		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
 		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
 		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
@@ -1695,26 +1702,8 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		case 0x2b: data_block = "Adaptive Sync Data Block"; break;
 		case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
 		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
-		case 0x7e: // DisplayID 2.0
-		case 0x7f: // DisplayID 1.3
-		{
-			oui = (x[3] << 16) + (x[4] << 8) + x[5];
-				const char *name = oui_name(oui);
-				bool reversed = false;
-
-				if (!name) {
-					name = oui_name(oui, true);
-					if (name)
-						reversed = true;
-				}
-				if (name)
-				data_block = "Vendor-Specific Data Block (" + utohex(tag) + ") (" + name + ")";
-				else
-				data_block = "Vendor-Specific Data Block (" + utohex(tag) + "), OUI " + ouitohex(oui);
-				if (reversed)
-					fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order.\n").c_str());
-			}
-			break;
+	case 0x7e: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", false, true); break; // DisplayID 2.0
+	case 0x7f: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", true, false); break; // DisplayID 1.3
 		// 0x80 RESERVED
 	case 0x81: data_block = "CTA-861 DisplayID Data Block"; break;
 		// 0x82 .. 0xff RESERVED
@@ -1751,6 +1740,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		return length;
 		}
 
+	if (dooutputname && data_block.length())
 		printf("  %s:\n", data_block.c_str());
 
 	if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
@@ -1762,6 +1752,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 	unsigned block_rev = x[1] & 0x07;
 
+	tag |= ouinum;
 		switch (tag) {
 	case 0x00: parse_displayid_product_id(x); break;
 	case 0x01: parse_displayid_parameters(x); break;
@@ -1882,14 +1873,9 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 			   parse_displayid_type_10_timing(&x[3 + i * sz], sz);
 			   break;
 		}
+	case 0x7e|kOUI_VESA: parse_displayid_vesa(x); break;
 	case 0x81: parse_displayid_cta_data_block(x); break;
-		case 0x7e:
-			if (oui == 0x3a0292) {
-			parse_displayid_vesa(x);
-				break;
-			}
-			// fall-through
-	default: hex_block("    ", x + 3, len); break;
+	default: hex_block("    ", x + 3 + (ouinum ? 3 : 0), len - (ouinum ? 3 : 0)); break;
 		}
 
 		if ((tag == 0x00 || tag == 0x20) &&
-- 
2.24.3 (Apple Git-128)

