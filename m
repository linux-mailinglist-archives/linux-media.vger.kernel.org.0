Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94C4113C6B
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 08:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbfLEHeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 02:34:20 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:39444 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfLEHeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 02:34:20 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id cleQi8c1NRnrKcleSi9Y2O; Thu, 05 Dec 2019 00:34:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1575531257;
        bh=Eo0RjlzAWmC5XCUeAtYxAGxUDFkdLkLPHqSIZ+tlRUc=;
        h=From:To:Cc:Subject:Date;
        b=M6K2OwOwn5M/TkjMoJq79q59c9LfKyu++RttLVeIYWC5HV2dQi3glVR6bxxXxuP3/
         ex4kM58PjwhCI9ZEPvx/n6ntWaAtLwaHXpNl+zLmLM654qWygkm9XW12RGae2ykUta
         QAUx3+ITnSm+CwGt+B/+3fX+JhYOHY66ra0gyPKIrsKB6BPoqaLTcRkKWGrwGcpfVZ
         0iuMuZCYBLUi09ox1ldIVOBDNaPKEAWbx7ssQn5yV3pera6W+1TXmAJBqudzx4sWGi
         TI15tjjbXths6L3UgsSgw6BwHvQRiQ8Dvy/gYT2ShYuHkJspC9s7snFZwyRMoOOiRu
         2gM8w80hmSR4g==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=BlMTphcG3gmWzIQiBEkA:9 a=73pvVqpVDC28bn2k:21 a=dOrvsWYqlR0IaaEc:21
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/5] edid-decode: DisplayID additions
Date:   Wed,  4 Dec 2019 23:34:10 -0800
Message-Id: <20191205073414.53672-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGKGFL3pWD/mknp2ADiM5nC+muuLz2pocAWuchsn0pq459OfyvE68G8q2KvmWX9t/TvrnQMTbkCqnOz+Xwcxk4JQqbCv4cUHJZ2KnkZnjzJo8U4luiXY
 0QkVFGVzP3+qNqHmlukUoSHHAzuAfGoN/5LXpeYjQPprzNqNK3begSmhi7KXtX14Obvuq1UB7B7BOA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Decode "Display Parameters Block". Example in lg-ultrafine-5k*.
- Decode "CTA Timings Block". Similar to "Type 1 VESA DMT Timings Block".
- Decode "GP ASCII String Block". Example in dell-up2715k-mdp-switchresx.

- Added DisplayID 2.0 tags:
    - Decode "Display Interface Features Data Block". Example in acer-xv273k* but it appears to be missing the "Minimum pixel rate at which YCbCr 4:2:0 encoding is supported" byte.
    - Decode "ContainerID Data Block". Example in lg-ultrafine-5k*
    - Unknown DisplayID blocks are dumped as hex.
    - Add DisplayID 2.0 spec to man page.

- Show DisplayID tag hex byte to make it possible to distinguish between DisplayID 1.3 and 2.0 spec blocks of the same name.
- Show DisplayID product type.
- Renamed Type* blocks to distinguish between different types of Video Timing Modes and Supported Timing Modes.
- Check padding after DisplayID checksum.
- Add more checks for DisplayID length and revision.
- Move Tiled Topology decode to new function.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.1             |   4 +-
 edid-decode.h             |   2 +
 parse-base-block.cpp      |   2 +-
 parse-cta-block.cpp       |   2 +-
 parse-displayid-block.cpp | 446 ++++++++++++++++++++++++++++++++------
 5 files changed, 386 insertions(+), 70 deletions(-)

diff --git a/edid-decode.1 b/edid-decode.1
index 3debc47..48c53c6 100644
--- a/edid-decode.1
+++ b/edid-decode.1
@@ -55,10 +55,12 @@ SPWG Notebook Panel Specification, Version 3.5
 EPI Embedded Panel Interface, Revision 1.0
 .RE
 .TP
-The following EDID standard is partially supported by edid-decode:
+The following EDID standards are partially supported by edid-decode:
 .RS
 .TP
 DisplayID 1.3: VESA Display Identification Data (DisplayID) Standard, Version 1.3
+.TP
+DisplayID 2.0: VESA DisplayID Standard, Version 2.0
 .RE
 
 .SH OPTIONS
diff --git a/edid-decode.h b/edid-decode.h
index 577d5ff..83ded83 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -146,5 +146,7 @@ std::string block_name(unsigned char block);
 void print_timings(edid_state &state, const char *prefix, const struct timings *t, const char *suffix);
 
 const struct timings *find_dmt_id(unsigned char dmt_id);
+const struct timings *vic_to_mode(unsigned char vic);
+char *extract_string(const unsigned char *x, unsigned len);
 
 #endif
diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 896952b..2d384e8 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -773,7 +773,7 @@ void edid_state::detailed_cvt_descriptor(const unsigned char *x, bool first)
 }
 
 /* extract a string from a detailed subblock, checking for termination */
-static char *extract_string(const unsigned char *x, unsigned len)
+char *extract_string(const unsigned char *x, unsigned len)
 {
 	static char s[EDID_PAGE_SIZE];
 	int seen_newline = 0;
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 4487edb..dea87c1 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -191,7 +191,7 @@ static const struct timings edid_cta_modes2[] = {
 
 static const unsigned char edid_hdmi_mode_map[] = { 95, 94, 93, 98 };
 
-static const struct timings *vic_to_mode(unsigned char vic)
+const struct timings *vic_to_mode(unsigned char vic)
 {
 	if (vic > 0 && vic <= ARRAY_SIZE(edid_cta_modes1))
 		return edid_cta_modes1 + vic - 1;
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index cdd3a9f..403ae7b 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -9,6 +9,78 @@
 
 #include "edid-decode.h"
 
+
+// misc functions
+
+static void check_displayid_datablock_revision(const unsigned char *x)
+{
+	unsigned char revisionflags=x[1];
+	if (revisionflags) {
+		warn("Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
+	}
+}
+
+static bool check_displayid_datablock_length(const unsigned char *x, unsigned expectedlenmin = 0, unsigned expectedlenmax = 128 - 2 - 5 - 3, unsigned payloaddumpstart = 0)
+{
+	unsigned char len=x[2];
+	if ( expectedlenmin == expectedlenmax && len != expectedlenmax ) {
+		fail("DisplayID payload length is different than expected (%d != %d)\n", len, expectedlenmax);
+	} else if (len > expectedlenmax) {
+		fail("DisplayID payload length is greater than expected (%d > %d)\n", len, expectedlenmax);
+	} else if (len < expectedlenmin) {
+		fail("DisplayID payload length is less than expected (%d < %d)\n", len, expectedlenmin);
+	} else {
+		return true;
+	}
+
+	if (len > payloaddumpstart) {
+		hex_block("    ", x + 3 + payloaddumpstart, len - payloaddumpstart);
+	}
+	return false;
+}
+
+// tag 0x01
+
+static const char *feature_support_flags[] = {
+	"De-interlacing",
+	"Support ACP, ISRC1, or ISRC2packets",
+	"Fixed pixel format",
+	"Fixed timing",
+	"Power management (DPM)",
+	"Audio input override",
+	"Separate audio inputs provided",
+	"Audio support on video interface"
+};
+
+static void print_flag_lines(const char *indent, const char *label, unsigned char flag_byte, const char **flags) {
+	if (flag_byte) {
+		printf("%s\n", label);
+		for (int i = 0; i < 8; i++) {
+			if (flag_byte & (1<<i)) {
+				printf("%s%s\n", indent, flags[i]);
+			}
+		}
+	}
+}
+
+static void parse_displayid_parameters(const unsigned char *x) {
+	check_displayid_datablock_revision(x);
+	if (check_displayid_datablock_length(x, 12, 12)) {
+		printf("    Image size: %.1f mm x %.1f mm\n", ((x[4]<<8) + x[3]) / 10.0, ((x[6]<<8) + x[5]) / 10.0);
+		printf("    Pixels: %d x %d\n", (x[8]<<8) + x[7], (x[10]<<8) + x[9]);
+		print_flag_lines("      ", "    Feature support flags:", x[11], feature_support_flags);
+
+		if (x[12] != 0xff) {
+			printf("    Gamma: %.2f\n", ((x[12] + 100.0) / 100.0));
+		}
+		printf("    Aspect ratio: %.2f\n", ((x[13] + 100.0) / 100.0));
+		printf("    Dynamic bpc native: %d\n", (x[14] & 0xf) + 1);
+		printf("    Dynamic bpc overall: %d\n", ((x[14] >> 4) & 0xf) + 1);
+	}
+}
+
+// tag 0x03
+
 static void parse_displayid_detailed_timing(const unsigned char *x)
 {
 	struct timings t = {};
@@ -112,11 +184,226 @@ static void parse_displayid_detailed_timing(const unsigned char *x)
 	      );
 }
 
+// tag 0x0b
+
+static void parse_displayid_gp_string(const unsigned char *x)
+{
+	check_displayid_datablock_revision(x);
+	if (check_displayid_datablock_length(x)) {
+		printf("    %s\n", extract_string(x + 3, x[2]));
+	}
+}
+
+// tag 0x12
+
+static void parse_displayid_tiled_display_topology(const unsigned char *x)
+{
+	check_displayid_datablock_revision(x);
+	if (check_displayid_datablock_length(x, 22, 22)) {
+		unsigned capabilities = x[3];
+		unsigned num_v_tile = (x[4] & 0xf) | (x[6] & 0x30);
+		unsigned num_h_tile = (x[4] >> 4) | ((x[6] >> 2) & 0x30);
+		unsigned tile_v_location = (x[5] & 0xf) | ((x[6] & 0x3) << 4);
+		unsigned tile_h_location = (x[5] >> 4) | (((x[6] >> 2) & 0x3) << 4);
+		unsigned tile_width = x[7] | (x[8] << 8);
+		unsigned tile_height = x[9] | (x[10] << 8);
+		unsigned pix_mult = x[11];
+
+		printf("    Capabilities: 0x%08x\n", capabilities);
+		printf("    Num horizontal tiles: %u Num vertical tiles: %u\n", num_h_tile + 1, num_v_tile + 1);
+		printf("    Tile location: %u, %u\n", tile_h_location, tile_v_location);
+		printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
+		if (capabilities & 0x40) {
+			if (pix_mult) {
+				printf("    Top bevel size: %u pixels\n",
+					   pix_mult * x[12] / 10);
+				printf("    Bottom bevel size: %u pixels\n",
+					   pix_mult * x[13] / 10);
+				printf("    Right bevel size: %u pixels\n",
+					   pix_mult * x[14] / 10);
+				printf("    Left bevel size: %u pixels\n",
+					   pix_mult * x[15] / 10);
+			} else {
+				fail("No bevel information, but the pixel multiplier is non-zero\n");
+			}
+			printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
+		} else if (pix_mult) {
+			fail("No bevel information, but the pixel multiplier is non-zero\n");
+		}
+	}
+}
+
+// tag 0x26
+
+static const char *bpc444[] = {"6", "8", "10", "12", "14", "16", NULL, NULL};
+static const char *bpc4xx[] = {"8", "10", "12", "14", "16", NULL, NULL, NULL};
+static const char *audiorates[] = {"32", "44.1", "48", NULL, NULL, NULL, NULL, NULL};
+
+static const char *colorspace_eotf_combinations[] = {
+	"sRGB",
+	"BT.601",
+	"BT.709/BT.1886",
+	"Adobe RGB",
+	"DCI-P3",
+	"BT.2020",
+	"BT.2020/SMPTE ST 2084"
+};
+
+static const char *colorspace_eotf_reserved[] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
+
+static const char *colorspaces[] = {
+	"Undefined",
+	"sRGB",
+	"BT.601",
+	"BT.709",
+	"Adobe RGB",
+	"DCI-P3",
+	"BT.2020",
+	"Custom"
+};
+
+static const char *eotfs[] = {
+	"Undefined",
+	"sRGB",
+	"BT.601",
+	"BT.1886",
+	"Adobe RGB",
+	"DCI-P3",
+	"BT.2020",
+	"Gamma function",
+	"SMPTE ST 2084",
+	"Hybrid Log",
+	"Custom"
+};
+
+static void print_flags(const char *label, unsigned char flag_byte, const char **flags, bool reverse = false)
+{
+	if (flag_byte) {
+		printf("%s: ", label);
+		int countflags = 0;
+		for (int i = 0; i < 8; i++) {
+			if (flag_byte & (1<<(reverse?7-i:i))) {
+				if (countflags)
+					printf(", ");
+				if (flags[i])
+					printf("%s", flags[i]);
+				else
+					printf("Undefined(%d)", i);
+				countflags++;
+			}
+		}
+		printf("\n");
+	}
+}
+
+static void parse_displayid_interface_features(const unsigned char *x)
+{
+	check_displayid_datablock_revision(x);
+	if (!check_displayid_datablock_length(x, 9)) {
+		return;
+	}
+	int len=x[2];
+	if (len > 0) print_flags("    Supported bpc for RGB encoding", x[3], bpc444);
+	if (len > 1) print_flags("    Supported bpc for YCbCr 4:4:4 encoding", x[4], bpc444);
+	if (len > 2) print_flags("    Supported bpc for YCbCr 4:2:2 encoding", x[5], bpc4xx);
+	if (len > 3) print_flags("    Supported bpc for YCbCr 4:2:0 encoding", x[6], bpc4xx);
+	if (len > 4 && x[7])
+	                  printf("    Minimum pixel rate at which YCbCr 4:2:0 encoding is supported: %.3f MHz\n", 74.25 * x[7]);
+	if (len > 5) print_flags("    Supported audio capability and features (kHz)", x[8], audiorates, true);
+	if (len > 6) print_flags("    Supported color space and EOTF standard combination 1", x[9], colorspace_eotf_combinations);
+	if (len > 7) print_flags("    Supported color space and EOTF standard combination 2", x[10], colorspace_eotf_reserved);
+	int i = 0;
+	if (len > 8 && x[11]) {
+		printf("    Supported color space and EOTF additional combinations:");
+		for (i = 0; i < x[11]; i++) {
+			if (i > 6) {
+				printf("\n    Number of additional color space and EOTF combinations (%d) is greater than allowed (7).", x[11]);
+				break;
+			} else if (i + 10 > len) {
+				printf("\n    Number of additional color space and EOTF combinations (%d) is too many to fit in block (%d).", x[11], len - 9);
+				break;
+			}
+
+			const char *colorspace = "Out of range";
+			const char *eotf = "Out of range";
+			unsigned colorspace_index = (x[12 + i] >> 4) & 0xf;
+			unsigned eotf_index = x[12 + i] & 0xf;
+			if (colorspace_index < sizeof(colorspaces) / sizeof(colorspaces[0])) {
+				colorspace = colorspaces[colorspace_index];
+			}
+			if (eotf_index < sizeof(eotfs) / sizeof(eotfs[0])) {
+				eotf = eotfs[eotf_index];
+			}
+
+			if (i > 0)
+				printf(", ");
+			if (!strcmp(colorspace, eotf)) {
+				printf("%s", colorspace);
+			} else {
+				printf("%s/%s", colorspace, eotf);
+			}
+		} // for
+		printf("\n");
+	} // x[11]
+	check_displayid_datablock_length(x, 9 + i, 9 + i, 9 + i);
+}
+
+// tag 0x29
+
+static void parse_displayid_ContainerID(const unsigned char *x)
+{
+	check_displayid_datablock_revision(x);
+	if (check_displayid_datablock_length(x, 16, 16)) {
+		x += 3;
+		printf("    %02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x\n",x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],x[8],x[9],x[10],x[11],x[12],x[13],x[14],x[15]);
+	}
+}
+
+// DisplayID main
+
+static std::string product_type(unsigned version, unsigned char x, bool heading)
+{
+	std::string headingstr;
+	if (version < 0x20) {
+		headingstr = "Display Product Type";
+		if (heading) return headingstr;
+		switch (x) {
+		case 0: return "Extension Section";
+		case 1: return "Test Structure; test equipment only";
+		case 2: return "Display panel or other transducer, LCD or PDP module, etc.";
+		case 3: return "Standalone display device";
+		case 4: return "Television receiver";
+		case 5: return "Repeater/translator";
+		case 6: return "DIRECT DRIVE monitor";
+		default: break;
+		}
+	}
+	else
+	{
+		headingstr = "Display Product Primary Use Case";
+		if (heading) return headingstr;
+		switch (x) {
+		case 0: return "Same primary use case as the base section";
+		case 1: return "Test Structure; test equipment only";
+		case 2: return "None of the listed primary use cases; generic display";
+		case 3: return "Television (TV) display";
+		case 4: return "Desktop productivity display";
+		case 5: return "Desktop gaming display";
+		case 6: return "Presentation display";
+		case 7: return "Head-mounted Virtual Reality (VR) display";
+		case 8: return "Head-mounted Augmented Reality (AR) display";
+		default: break;
+		}
+	}
+	fail("Unknown %s 0x%02x\n", headingstr.c_str(), x);
+	return std::string("Unknown " + headingstr + " (") + utohex(x) + ")";
+}
+
 void edid_state::parse_displayid_block(const unsigned char *x)
 {
-	const unsigned char *orig = x;
 	unsigned version = x[1];
-	int length = x[2];
+	unsigned length = x[2];
+	unsigned prod_type = x[3]; // future check: based on type, check for required data blocks
 	unsigned ext_count = x[4];
 	unsigned i;
 
@@ -124,94 +411,114 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 	       block.c_str(), version >> 4, version & 0xf,
 	       length, ext_count);
 
+	if (ext_count > 0) {
+		warn("Non-0 DisplayID extension count %d\n", ext_count);
+	}
+	
+	printf("%s: %s\n", product_type(version, prod_type, true).c_str(), product_type(version, prod_type, false).c_str());
+	
+	if (length > 121) {
+		fail("DisplayID length %d is greater than 121\n", length);
+		length = 121;
+	}
+
 	unsigned offset = 5;
 	while (length > 0) {
 		unsigned tag = x[offset];
+		switch (tag) {
+		// DisplayID 1.3:
+		case 0x00: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
+		case 0x02: data_block = "Color Characteristics Data Block"; break; // not implemented
+		case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
+		case 0x04: data_block = "Video Timing Modes Type 2 - Detailed Timings Data Block"; break; // not implemented
+		case 0x05: data_block = "Video Timing Modes Type 3 - Short Timings Data Block"; break; // not implemented
+		case 0x06: data_block = "Video Timing Modes Type 4 - DMT Timings Data Block"; break; // not implemented
+		case 0x07: data_block = "Supported Timing Modes Type 1 - VESA DMT Timings Data Block"; break;
+		case 0x08: data_block = "Supported Timing Modes Type 2 - CTA Timings Data Block"; break;
+		case 0x09: data_block = "Video Timing Range Data Block"; break; // not implemented
+		case 0x0a: data_block = "Product Serial Number Data Block"; break; // not implemented
+		case 0x0b: data_block = "GP ASCII String Data Block"; break;
+		case 0x0c: data_block = "Display Device Data Data Block"; break; // not implemented
+		case 0x0d: data_block = "Interface Power Sequencing Data Block"; break; // not implemented
+		case 0x0e: data_block = "Transfer Characteristics Data Block"; break; // not implemented
+		case 0x0f: data_block = "Display Interface Data Block"; break; // not implemented
+		case 0x10: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x11: data_block = "Video Timing Modes Type 5 - Short Timings Data Block"; break; // not implemented
+		case 0x12: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
+		case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break; // not implemented
+		// 14h .. 7Eh RESERVED for Additional VESA-defined Data Blocks
+		// DisplayID 2.0
+		case 0x20: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break; // not implemented
+		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break; // not implemented
+		case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break; // not implemented
+		case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break; // not implemented
+		case 0x26: data_block = "Display Interface Features Data Block"; break;
+		case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break; // not implemented
+		case 0x29: data_block = "ContainerID Data Block"; break;
+		// 2Ah .. 7Dh RESERVED for Additional VESA-defined Data Blocks
+		case 0x7e: // DisplayID 2.0
+		case 0x7f: data_block = "Vendor-specific Data Block (" + utohex(tag) + ")"; break; // DisplayID 1.3 // not implemented
+		// 7Fh .. 80h RESERVED
+		case 0x81: data_block = "CTA DisplayID Data Block (" + utohex(tag) + ")"; break; // not implemented
+		// 82h .. FFh RESERVED
+		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
+		}
+
+		if (length < 3) {
+			// report a problem when the remaining bytes are not 0.
+			if (tag || x[offset + 1]) {
+				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0\n", length);
+			}
+			break;
+		}
+
 		unsigned len = x[offset + 2];
+		
+		if (length < len + 3) {
+			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d)\n", len + 3, length);
+			break;
+		}
 
 		if (!tag && !len) {
-			while (length && !x[offset]) {
-				length--;
-				offset++;
-			}
-			if (length)
+			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
+			if (!memchk(x + offset, length)) {
 				fail("Non-0 filler bytes in the DisplayID block\n");
+			}
 			break;
 		}
-		switch (tag) {
-		case 0x00: data_block = "Product ID Data Block"; break;
-		case 0x01: data_block = "Display Parameters Data Block"; break;
-		case 0x02: data_block = "Color Characteristics Data Block"; break;
-		case 0x03: data_block = "Type 1 Detailed Timings Data Block"; break;
-		case 0x04: data_block = "Type 2 Detailed Timings Data Block"; break;
-		case 0x05: data_block = "Type 3 Short Timings Data Block"; break;
-		case 0x06: data_block = "Type 4 DMT Timings Data Block"; break;
-		case 0x07: data_block = "Type 1 VESA DMT Timings Data Block"; break;
-		case 0x08: data_block = "CTA Timings Data Block"; break;
-		case 0x09: data_block = "Video Timing Range Data Block"; break;
-		case 0x0a: data_block = "Product Serial Number Data Block"; break;
-		case 0x0b: data_block = "GP ASCII String Data Block"; break;
-		case 0x0c: data_block = "Display Device Data Data Block"; break;
-		case 0x0d: data_block = "Interface Power Sequencing Data Block"; break;
-		case 0x0e: data_block = "Transfer Characteristics Data Block"; break;
-		case 0x0f: data_block = "Display Interface Data Block"; break;
-		case 0x10: data_block = "Stereo Display Interface Data Block"; break;
-		case 0x12: data_block = "Tiled Display Topology Data Block"; break;
-		default: data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
-		}
 
 		printf("  %s\n", data_block.c_str());
 
 		switch (tag) {
+		case 0x01: parse_displayid_parameters(x + offset); break;
 		case 0x03:
 			for (i = 0; i < len / 20; i++) {
 				parse_displayid_detailed_timing(&x[offset + 3 + (i * 20)]);
 			}
 			break;
-
 		case 0x07:
 			for (i = 0; i < min(len, 10) * 8; i++)
-				if (x[offset + 3 + i / 8] & (1 << (i % 8)))
+				if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
 					print_timings("    ", find_dmt_id(i + 1), "DMT");
-			break;
-
-		case 0x12: {
-			unsigned capabilities = x[offset + 3];
-			unsigned num_v_tile = (x[offset + 4] & 0xf) | (x[offset + 6] & 0x30);
-			unsigned num_h_tile = (x[offset + 4] >> 4) | ((x[offset + 6] >> 2) & 0x30);
-			unsigned tile_v_location = (x[offset + 5] & 0xf) | ((x[offset + 6] & 0x3) << 4);
-			unsigned tile_h_location = (x[offset + 5] >> 4) | (((x[offset + 6] >> 2) & 0x3) << 4);
-			unsigned tile_width = x[offset + 7] | (x[offset + 8] << 8);
-			unsigned tile_height = x[offset + 9] | (x[offset + 10] << 8);
-			unsigned pix_mult = x[offset + 11];
-
-			printf("    Capabilities: 0x%08x\n", capabilities);
-			printf("    Num horizontal tiles: %u Num vertical tiles: %u\n", num_h_tile + 1, num_v_tile + 1);
-			printf("    Tile location: %u, %u\n", tile_h_location, tile_v_location);
-			printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
-			if (capabilities & 0x40) {
-				if (pix_mult) {
-					printf("    Top bevel size: %u pixels\n",
-					       pix_mult * x[offset + 12] / 10);
-					printf("    Bottom bevel size: %u pixels\n",
-					       pix_mult * x[offset + 13] / 10);
-					printf("    Right bevel size: %u pixels\n",
-					       pix_mult * x[offset + 14] / 10);
-					printf("    Left bevel size: %u pixels\n",
-					       pix_mult * x[offset + 15] / 10);
-				} else {
-					fail("No bevel information, but the pixel multiplier is non-zero\n");
 				}
-				printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
-			} else if (pix_mult) {
-				fail("No bevel information, but the pixel multiplier is non-zero\n");
-			}
 			break;
-		}
-
-		default:
-			hex_block("    ", x + offset + 3, len);
+		case 0x08:
+			for (i = 0; i < min(len, 8) * 8; i++)
+				if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
+					char suffix[16];
+					sprintf(suffix, "VIC %3u", i + 1);
+					print_timings("    ", vic_to_mode(i + 1), suffix);
+				}
 			break;
+		case 0x0b: parse_displayid_gp_string(x + offset); break;
+		case 0x12: parse_displayid_tiled_display_topology(x + offset); break;
+		case 0x26: parse_displayid_interface_features(x + offset); break;
+		case 0x29: parse_displayid_ContainerID(x + offset); break;
+		default: hex_block("    ", x + offset + 3, len); break;
 		}
 		length -= len + 3;
 		offset += len + 3;
@@ -223,5 +530,10 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 	 * (excluding DisplayID-in-EDID magic byte)
 	 */
 	data_block.clear();
-	do_checksum("  ", orig + 1, orig[2] + 5);
+	do_checksum("  ", x + 1, x[2] + 5);
+	
+	if (!memchk(x + 1 + x[2] + 5, 0x7f - (1 + x[2] + 5))) {
+		data_block = "Padding";
+		fail("DisplayID padding contains non-zero bytes\n");
+	}
 }
-- 
2.21.0 (Apple Git-122.2)

