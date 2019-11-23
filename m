Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F74107F6F
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKWQqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:18 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37146 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKWQqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY3iYY16; Sat, 23 Nov 2019 09:46:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=vdpvk+aLchhzUvKmpaL3UtpTziTZZvkqiz6jGALooa8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lCpHegJdJ492Cv0S/gt76V6V15Z5kb2BTja8z8yHOwshIwJs/IGGxN6YKNFlW1J6g
         dRIoXnoNp9SXhd4xsv8mEtkCcR0M76UzMSlE+CG0HiqXUQQuYvj+X3KIvQmAabhHSW
         +MG3b86hD2cWtrEY8BmyjpLO6w5uxptnCI9jscSaba+VOWYvNi0Toc42dKlxK3aDKH
         f8eN7t6E9oXo6VSlRnXcM2iVTPh9AYZxRcVw8vegrri2wFDLmkoZ9bKjFjar+VIGth
         aXpogvrys+ODOzxFHT5PrXuVhkOs+Ntu9TnpV8gMdIeIGrWa1JiGgfT1WCpEJzpuZC
         SXmuahv5q82cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=vdpvk+aLchhzUvKmpaL3UtpTziTZZvkqiz6jGALooa8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lCpHegJdJ492Cv0S/gt76V6V15Z5kb2BTja8z8yHOwshIwJs/IGGxN6YKNFlW1J6g
         dRIoXnoNp9SXhd4xsv8mEtkCcR0M76UzMSlE+CG0HiqXUQQuYvj+X3KIvQmAabhHSW
         +MG3b86hD2cWtrEY8BmyjpLO6w5uxptnCI9jscSaba+VOWYvNi0Toc42dKlxK3aDKH
         f8eN7t6E9oXo6VSlRnXcM2iVTPh9AYZxRcVw8vegrri2wFDLmkoZ9bKjFjar+VIGth
         aXpogvrys+ODOzxFHT5PrXuVhkOs+Ntu9TnpV8gMdIeIGrWa1JiGgfT1WCpEJzpuZC
         SXmuahv5q82cA==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=oSUsc3AOH2OMAiy4OTkA:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 01/10] edid-decode: change horizontal refresh rates to kHz
Date:   Sat, 23 Nov 2019 08:45:55 -0800
Message-Id: <20191123164604.268-2-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOY6nnjBSesckqm77OB5dyWnLm6UQqNHBC7vZ047/8VRMvM6rNflFdVjf6nubFnhlRqoWuSaML5TpDL7gY6UtKQ9Pk5mYHLY/Ck9TSN39sE3kukH3vL+
 3vxf2yAYlkIAJKUDOtsw1JO9FDvEwO4CMcloVDH5RyAXMv0G7K9p+3yC/+wlJXV5bal3MLmvPjTsW9WVRaM91d6qU+HCWJvN14g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Timings that show horizontal refresh rate should use kHz to distinguish them from vertical refresh rate (Hz) and pixel clock rate (MHz). Matches representation in Monitor ranges descriptor.
- Make vertical refresh rate floating point instead of integer in detailed timings descriptors. For example, NTSC modes use 59.94 Hz and should not be rounded to 60 Hz.
- Remove double space when "(native)" is not output for CTA VIC timings.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index 932dd20..4ba0808 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -489,7 +489,7 @@ static int detailed_cvt_descriptor(const unsigned char *x, int first)
 			edid_cvt_mode(width, height, 60, 1,
 				      &min_hfreq, &max_hfreq, &max_clock);
 
-		printf("    %ux%u @ ( %s%s%s%s%s) Hz %s (%s%s preferred) HorFreq: %u-%u Hz MaxClock: %.3f MHz\n",
+		printf("    %ux%u @ ( %s%s%s%s%s) Hz %s (%s%s preferred) HorFreq: %.3f-%.3f kHz MaxClock: %.3f MHz\n",
 		       width, height,
 		       fifty ? "50 " : "",
 		       sixty ? "60 " : "",
@@ -499,7 +499,7 @@ static int detailed_cvt_descriptor(const unsigned char *x, int first)
 		       ratio,
 		       names[(x[2] & 0x60) >> 5],
 		       (((x[2] & 0x60) == 0x20) && reduced) ? "RB" : "",
-		       min_hfreq, max_hfreq, max_clock / 1000000.0);
+		       min_hfreq / 1000.0, max_hfreq / 1000.0, max_clock / 1000000.0);
 	}
 
 	return valid;
@@ -709,9 +709,9 @@ static void print_standard_timing(uint8_t b1, uint8_t b2)
 		min_hor_freq_hz = min(min_hor_freq_hz, hor_freq_hz);
 		max_hor_freq_hz = max(max_hor_freq_hz, hor_freq_hz);
 		max_pixclk_khz = max(max_pixclk_khz, pixclk_khz);
-		printf("  %ux%u@%uHz %u:%u HorFreq: %u Hz Clock: %.3f MHz\n",
+		printf("  %ux%u@%uHz %u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
 		       x, y, refresh, ratio_w, ratio_h,
-		       hor_freq_hz, pixclk_khz / 1000.0);
+		       hor_freq_hz / 1000.0, pixclk_khz / 1000.0);
 	} else {
 		printf("  %ux%u@%uHz %u:%u\n",
 		       x, y, refresh, ratio_w, ratio_h);
@@ -723,7 +723,8 @@ static int detailed_block(const unsigned char *x, int in_extension)
 {
 	unsigned ha, hbl, hso, hspw, hborder, va, vbl, vso, vspw, vborder;
 	unsigned hor_mm, vert_mm;
-	unsigned refresh, pixclk_khz;
+	unsigned pixclk_khz;
+	float refresh;
 	unsigned i;
 	char phsync, pvsync, *syncmethod, *stereo;
 
@@ -769,12 +770,12 @@ static int detailed_block(const unsigned char *x, int in_extension)
 			printf("Established timings III:\n");
 			for (i = 0; i < 44; i++) {
 				if (x[6 + i / 8] & (1 << (7 - i % 8))) {
-					printf("  %dx%d@%dHz %s%u:%u HorFreq: %d Hz Clock: %.3f MHz\n",
+					printf("  %dx%d@%dHz %s%u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
 					       established_timings3[i].x,
 					       established_timings3[i].y, established_timings3[i].refresh,
 					       established_timings3[i].rb ? "RB " : "",
 					       established_timings3[i].ratio_w, established_timings3[i].ratio_h,
-					       established_timings3[i].hor_freq_hz,
+					       established_timings3[i].hor_freq_hz / 1000.0,
 					       established_timings3[i].pixclk_khz / 1000.0);
 					min_vert_freq_hz = min(min_vert_freq_hz, established_timings3[i].refresh);
 					max_vert_freq_hz = max(max_vert_freq_hz, established_timings3[i].refresh);
@@ -1078,20 +1079,20 @@ static int detailed_block(const unsigned char *x, int in_extension)
 	}
 
 	pixclk_khz = (x[0] + (x[1] << 8)) * 10;
-	refresh = (pixclk_khz * 1000) / ((ha + hbl) * (va + vbl));
+	refresh = (pixclk_khz * 1000.0) / ((ha + hbl) * (va + vbl));
 	hor_mm = x[12] + ((x[14] & 0xf0) << 4);
 	vert_mm = x[13] + ((x[14] & 0x0f) << 8);
 	printf("Detailed mode: Clock %.3f MHz, %u mm x %u mm\n"
 	       "               %4u %4u %4u %4u hborder %u\n"
 	       "               %4u %4u %4u %4u vborder %u\n"
 	       "               %chsync %cvsync%s%s %s\n"
-	       "               VertFreq: %u Hz, HorFreq: %u Hz\n",
+	       "               VertFreq: %.3f Hz, HorFreq: %.3f kHz\n",
 	       pixclk_khz / 1000.0,
 	       hor_mm, vert_mm,
 	       ha, ha + hso, ha + hso + hspw, ha + hbl, hborder,
 	       va, va + vso, va + vso + vspw, va + vbl, vborder,
-	       phsync, pvsync, syncmethod, x[17] & 0x80 ? " interlaced" : "",
-	       stereo, refresh, (pixclk_khz * 1000) / (ha + hbl)
+	       phsync, pvsync, syncmethod, x[17] & 0x80 ? " interlaced" : "", stereo,
+	       refresh, (float)pixclk_khz / (ha + hbl)
 	      );
 	if ((!max_display_width_mm && hor_mm) ||
 	    (!max_display_height_mm && vert_mm)) {
@@ -1505,8 +1506,8 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
 			mode = "Unknown mode";
 		}
 
-		printf("    VIC %3u %s %s HorFreq: %u Hz Clock: %.3f MHz\n",
-		       vic, mode, native ? "(native)" : "", hfreq, clock_khz / 1000.0);
+		printf("VIC %3u %s%sHorFreq: %.3f kHz Clock: %.3f MHz",
+		       vic, mode, native ? " (native) " : " ", hfreq / 1000.0, clock_khz / 1000.0);
 		if (vic == 1)
 			has_cta861_vic_1 = 1;
 	}
@@ -1690,8 +1691,8 @@ static void cta_hdmi_block(const unsigned char *x, unsigned length)
 				mode = "Unknown mode";
 			}
 
-			printf("      HDMI VIC %u %s HorFreq: %u Hz Clock: %.3f MHz\n",
-			       vic, mode, hfreq, clock_khz / 1000.0);
+			printf("      HDMI VIC %u %s HorFreq: %.3f kHz Clock: %.3f MHz\n",
+			       vic, mode, hfreq / 1000.0, clock_khz / 1000.0);
 		}
 
 		b += len_vic;
@@ -2706,14 +2707,14 @@ static int parse_displayid(const unsigned char *x)
 			printf("Type 1 VESA DMT Timings Block\n");
 			for (i = 0; i < min(len, 10) * 8; i++) {
 				if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
-					printf("  %ux%u%s@%uHz %s%u:%u HorFreq: %u Hz Clock: %.3f MHz\n",
+					printf("  %ux%u%s@%uHz %s%u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
 					       displayid_vesa_dmt[i].x,
 					       displayid_vesa_dmt[i].y,
 					       displayid_vesa_dmt[i].interlaced ? "i" : "",
 					       displayid_vesa_dmt[i].refresh,
 					       displayid_vesa_dmt[i].rb ? "RB " : "",
 					       displayid_vesa_dmt[i].ratio_w, displayid_vesa_dmt[i].ratio_h,
-					       displayid_vesa_dmt[i].hor_freq_hz,
+					       displayid_vesa_dmt[i].hor_freq_hz / 1000.0,
 					       displayid_vesa_dmt[i].pixclk_khz / 1000.0);
 					min_vert_freq_hz = min(min_vert_freq_hz, displayid_vesa_dmt[i].refresh);
 					max_vert_freq_hz = max(max_vert_freq_hz, displayid_vesa_dmt[i].refresh);
@@ -3455,12 +3456,12 @@ static int edid_from_file(const char *from_file, const char *to_file,
 			min_hor_freq_hz = min(min_hor_freq_hz, established_timings[i].hor_freq_hz);
 			max_hor_freq_hz = max(max_hor_freq_hz, established_timings[i].hor_freq_hz);
 			max_pixclk_khz = max(max_pixclk_khz, established_timings[i].pixclk_khz);
-			printf("  %ux%u%s@%uHz %u:%u HorFreq: %d Hz Clock: %.3f MHz\n",
+			printf("  %ux%u%s@%uHz %u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
 			       established_timings[i].x, established_timings[i].y,
 			       established_timings[i].interlaced ? "i" : "",
 			       established_timings[i].refresh,
 			       established_timings[i].ratio_w, established_timings[i].ratio_h,
-			       established_timings[i].hor_freq_hz,
+			       established_timings[i].hor_freq_hz / 1000.0,
 			       established_timings[i].pixclk_khz / 1000.0);
 		}
 	}
-- 
2.21.0 (Apple Git-122.2)

